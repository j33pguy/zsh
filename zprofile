# Add .NET Core SDK tools when present.
if [[ -d "$HOME/.dotnet/tools" ]]; then
  export PATH="$PATH:$HOME/.dotnet/tools"
fi

# Homebrew .NET on macOS.
if [[ -d /opt/homebrew/opt/dotnet/libexec ]]; then
  export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"
fi
