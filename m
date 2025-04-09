Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7626409njd;
        Wed, 9 Apr 2025 03:55:40 -0700 (PDT)
X-Received: by 2002:a05:6000:2585:b0:39a:ca05:5232 with SMTP id ffacd0b85a97d-39d88525dd5mr1740410f8f.5.1744196140572;
        Wed, 09 Apr 2025 03:55:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744196140; cv=none;
        d=google.com; s=arc-20240605;
        b=Yv3OHam8wrgsO60CGMo0N7ytKO+kEK8Orp1JuQRLQhlPb5BBLjG9V6b1ZmO7iVl4vx
         iX/TAR7dQxC7vbjnRGx8zgUT63lqjPPlX8GQIY5t9iR8a9Rmqgvl+7XcmMs2pLPSGByI
         jHs96s0Yh0jXAQTi9pjXLO9HNdrhNc8B2r5f1ZZ9RBY9/NE8ga1u7PZQ4t87bhcVp62D
         UqsbkTsuIn9n7/3CxCKyORjbMPPFELioItfI82Kh6P64z5/5vwkAHWpqRZPCccEIE9cQ
         dFcR6ZWg8Et4W8MDGysPo1N8FuSF112yo4zNbUIfqY4LMDcKT7mWTXKP95mJBbXeXqWe
         ezjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3BFk4v3yRZCIuLOMRmgXpPW/4d1ganjv9QUzqDFqk+A=;
        fh=xxlveJcnmSkNTaf/QGq11K5f/rPMQH8vgV5ouG1TgxM=;
        b=cN3WGTW0ROwOA3KNVX2GVYdY0ILkfvzqzGJ6c2Z7s2dP2DJLqQHR+vNjgojulrGloc
         4fHhWDY6y4kyreJ7kqKrL86YyVLdNNDLfEMfOyqcGt59+x5aZnHoSwfY4B2c1mTGRJ5d
         fOq+7TU1ldguGi0pxHp+1IdGK5D5n7L6I3B6T4Vv/KYsMUb1EbTOOpPkOcR56E26d+GB
         hgqfAFne7tv6biDtt7fH8T1/9dRzoqvczuTtWdE4gXW7yt5w1Hs+Ju+r3DtBNwPm5ksZ
         3AjOiM6hS46H8OJZWOzAc7FiCiJDuVRq9Hxi7Ven/O13UbGjduHuf1NRNWSmHHftWLU9
         JZFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WYZlnbKr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43f233cbbb2sor3696615e9.5.2025.04.09.03.55.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 09 Apr 2025 03:55:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WYZlnbKr;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744196140; x=1744800940; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3BFk4v3yRZCIuLOMRmgXpPW/4d1ganjv9QUzqDFqk+A=;
        b=WYZlnbKrbT7E6/OuAowuxsayGU4msQmwJAunpoddYPL31cojtxG2ybn51Kh8isadYs
         d1tf+q0+N7fx9oJrkkqP+DUldFNb1FGiWH2v1ufK9dinRb1ff8CeDax/pvuVUgZpaJZ3
         mCrRInHYR2iLfDMmGCyFlj+gOIDy6EPhE3vFm51vfyiluX0FEUvTGzaW3eNY0XfnUyO2
         IIQgYbyuSaJfgp9MB10oB38uEgMn/E/U42+uWbPecvr49Kztf86MbXBsjsIMz/3xDI8i
         5V+puucsm4nlmJX9m60QkVKbOiAMFdyqAW/XgGtJRTAwxS10o7foX/OrLgamyZIZEmx0
         5nZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744196140; x=1744800940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3BFk4v3yRZCIuLOMRmgXpPW/4d1ganjv9QUzqDFqk+A=;
        b=Jc6X9eL0XpfBm6yDHFY/4ZMgxWX39UJfn7P2sTmj7tnrXWm2Gf6FVNsHncPqPc0uB8
         3KpG0GxXvpdbgYiJuu17FVZOjgrtoyvTFp2szpK9yPXfLvmpKQpO0mfW2PWbovl+qqqx
         CIPIjMetAiZChwIFIcPfFdskVOXesBOyony9EF81jzjtkX74qfvyY7akrp53yKxW1Whj
         TVfqTStRgxpqvyKve5VlfxSpr6Cn6Y0COoAgTD+S49kupoQA7TlNPmfI5+fQpSevWdh9
         w2Mv9lzY/YN8QnGgoYqs7ekOcLRit4zabxOMd5S7m3/U02JGgKSHYiKjdtK03D0NwNtu
         cnzA==
X-Gm-Message-State: AOJu0YzR5RXlpJKDv2JtakL0Pf4QPH+3Jx33ezYSRM3AqTke4jZJq8hJ
	ZcAIBWFPbF5KyB9aaafJwsFCXoDrvVNOLfmr6m1bb4wE5e0erP0WZNSX+wO3gArijg==
X-Gm-Gg: ASbGnct0VEHRHdvf07yGLrdvjq9qdmQj4jTkcqIE8OaxSFtw3ZJgI7C/2s5LuXXxqgU
	5UmQel7C4SRycwUx35XjSOAluCxmqFSQ4vbqyTXfFe1ZwUiOOUZJXGIhAiFEpTLwWv/YcWGYg7L
	WpvtvV0nnHoStpPzWXhvMkdFIQbWfaRSYkmM1jSHQ6AKAY4Gt9kQ0JAe0sWIJbxpJyRSfQJ1CqJ
	eLwtGJW7YLKJrTB+ZkiE0n6JGm0a68R8KouY7tTskcS6dRVme/8C3Q1ZdjmrDHeQ0neAP8gp97Z
	pha+gDrmttRrX0PPLxMJIj4M5pjmpEsyXENi4OPe9AgTl0RdE3nevwsrNUCeEo0XpastL3x8YeT
	BfdUAPDHI7TgqYmopIsU82Q==
X-Google-Smtp-Source: AGHT+IEUfJkMKdZfdrM7NVXLsDkpA0D1qnBoICGiWUV5jh2r9aTyqvHyE/THMmAErSMeQCPEbs/RDg==
X-Received: by 2002:a05:600c:1e26:b0:43c:fffc:7886 with SMTP id 5b1f17b1804b1-43f1fe16701mr20175605e9.8.1744196139995;
        Wed, 09 Apr 2025 03:55:39 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5e90sm12252085e9.38.2025.04.09.03.55.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 03:55:39 -0700 (PDT)
Message-ID: <e0dcc4e6-1e8e-468f-83e5-36ffb014eeef@linaro.org>
Date: Wed, 9 Apr 2025 12:55:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] meson: Add wasm build in build scripts
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li
 <liwei1518@gmail.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <cover.1744032780.git.ktokunaga.mail@gmail.com>
 <04b7137a464e0925e2ae533bbde4fcdfe0dfe069.1744032780.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <04b7137a464e0925e2ae533bbde4fcdfe0dfe069.1744032780.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: isPQwpprApfp

Cc'ing Pierrick

On 7/4/25 16:45, Kohei Tokunaga wrote:
> has_int128_type is set to false on emscripten as of now to avoid errors by
> libffi. And tests aren't integrated with Wasm execution environment as of
> now so this commit disables tests.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   configs/meson/emscripten.txt  |  6 ++++++
>   configure                     |  7 +++++++
>   meson.build                   | 14 ++++++++++----
>   meson_options.txt             |  2 +-
>   scripts/meson-buildoptions.sh |  2 +-
>   5 files changed, 25 insertions(+), 6 deletions(-)
>   create mode 100644 configs/meson/emscripten.txt
> 
> diff --git a/configs/meson/emscripten.txt b/configs/meson/emscripten.txt
> new file mode 100644
> index 0000000000..054b263814
> --- /dev/null
> +++ b/configs/meson/emscripten.txt
> @@ -0,0 +1,6 @@
> +[built-in options]
> +c_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread']
> +cpp_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread']
> +objc_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread']
> +c_link_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread','-sASYNCIFY=1','-sPROXY_TO_PTHREAD=1','-sFORCE_FILESYSTEM','-sALLOW_TABLE_GROWTH','-sTOTAL_MEMORY=2GB','-sWASM_BIGINT','-sEXPORT_ES6=1','-sASYNCIFY_IMPORTS=ffi_call_js','-sEXPORTED_RUNTIME_METHODS=addFunction,removeFunction,TTY,FS']
> +cpp_link_args = ['-Wno-unused-command-line-argument','-g','-O3','-pthread','-sASYNCIFY=1','-sPROXY_TO_PTHREAD=1','-sFORCE_FILESYSTEM','-sALLOW_TABLE_GROWTH','-sTOTAL_MEMORY=2GB','-sWASM_BIGINT','-sEXPORT_ES6=1','-sASYNCIFY_IMPORTS=ffi_call_js','-sEXPORTED_RUNTIME_METHODS=addFunction,removeFunction,TTY,FS']
> diff --git a/configure b/configure
> index 02f1dd2311..a1fe6e11cd 100755
> --- a/configure
> +++ b/configure
> @@ -360,6 +360,10 @@ elif check_define __NetBSD__; then
>     host_os=netbsd
>   elif check_define __APPLE__; then
>     host_os=darwin
> +elif check_define EMSCRIPTEN ; then
> +  host_os=emscripten
> +  cpu=wasm32
> +  cross_compile="yes"
>   else
>     # This is a fatal error, but don't report it yet, because we
>     # might be going to just print the --help text, or it might
> @@ -526,6 +530,9 @@ case "$cpu" in
>       linux_arch=x86
>       CPU_CFLAGS="-m64"
>       ;;
> +  wasm32)
> +    CPU_CFLAGS="-m32"
> +    ;;
>   esac
>   
>   if test -n "$host_arch" && {
> diff --git a/meson.build b/meson.build
> index 41f68d3806..bcf1e33ddf 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -50,9 +50,9 @@ genh = []
>   qapi_trace_events = []
>   
>   bsd_oses = ['gnu/kfreebsd', 'freebsd', 'netbsd', 'openbsd', 'dragonfly', 'darwin']
> -supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux']
> +supported_oses = ['windows', 'freebsd', 'netbsd', 'openbsd', 'darwin', 'sunos', 'linux', 'emscripten']
>   supported_cpus = ['ppc', 'ppc64', 's390x', 'riscv32', 'riscv64', 'x86', 'x86_64',
> -  'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc64']
> +  'arm', 'aarch64', 'loongarch64', 'mips', 'mips64', 'sparc64', 'wasm32']
>   
>   cpu = host_machine.cpu_family()
>   
> @@ -353,6 +353,8 @@ foreach lang : all_languages
>         # endif
>         #endif''')
>       # ok
> +  elif compiler.get_id() == 'emscripten'
> +    # ok
>     else
>       error('You either need GCC v7.4 or Clang v10.0 (or XCode Clang v15.0) to compile QEMU')
>     endif
> @@ -514,6 +516,8 @@ ucontext_probe = '''
>   supported_backends = []
>   if host_os == 'windows'
>     supported_backends += ['windows']
> +elif host_os == 'emscripten'
> +  supported_backends += ['fiber']
>   else
>     if host_os != 'darwin' and cc.links(ucontext_probe)
>       supported_backends += ['ucontext']
> @@ -2962,7 +2966,7 @@ config_host_data.set('CONFIG_ATOMIC64', cc.links('''
>       return 0;
>     }''', args: qemu_isa_flags))
>   
> -has_int128_type = cc.compiles('''
> +has_int128_type = host_os != 'emscripten' and cc.compiles('''
>     __int128_t a;
>     __uint128_t b;
>     int main(void) { b = a; }''')
> @@ -4456,7 +4460,9 @@ subdir('scripts')
>   subdir('tools')
>   subdir('pc-bios')
>   subdir('docs')
> -subdir('tests')
> +if host_os != 'emscripten'
> +  subdir('tests')
> +endif
>   if gtk.found()
>     subdir('po')
>   endif
> diff --git a/meson_options.txt b/meson_options.txt
> index 59d973bca0..6d73aafe91 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -34,7 +34,7 @@ option('fuzzing_engine', type : 'string', value : '',
>   option('trace_file', type: 'string', value: 'trace',
>          description: 'Trace file prefix for simple backend')
>   option('coroutine_backend', type: 'combo',
> -       choices: ['ucontext', 'sigaltstack', 'windows', 'auto'],
> +       choices: ['ucontext', 'sigaltstack', 'windows', 'auto', 'fiber'],
>          value: 'auto', description: 'coroutine backend to use')
>   
>   # Everything else can be set via --enable/--disable-* option
> diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
> index 3e8e00852b..cbba2f248c 100644
> --- a/scripts/meson-buildoptions.sh
> +++ b/scripts/meson-buildoptions.sh
> @@ -80,7 +80,7 @@ meson_options_help() {
>     printf "%s\n" '  --tls-priority=VALUE     Default TLS protocol/cipher priority string'
>     printf "%s\n" '                           [NORMAL]'
>     printf "%s\n" '  --with-coroutine=CHOICE  coroutine backend to use (choices:'
> -  printf "%s\n" '                           auto/sigaltstack/ucontext/windows)'
> +  printf "%s\n" '                           auto/fiber/sigaltstack/ucontext/windows)'
>     printf "%s\n" '  --with-pkgversion=VALUE  use specified string as sub-version of the'
>     printf "%s\n" '                           package'
>     printf "%s\n" '  --with-suffix=VALUE      Suffix for QEMU data/modules/config directories'
