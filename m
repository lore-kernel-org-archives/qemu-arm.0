Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3206440njc;
        Wed, 16 Apr 2025 02:22:14 -0700 (PDT)
X-Received: by 2002:a05:600c:3c90:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-4405d6b2dcbmr8313545e9.28.1744795334173;
        Wed, 16 Apr 2025 02:22:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744795334; cv=none;
        d=google.com; s=arc-20240605;
        b=UDqPm7Dq1KrQFUzwevNpj2eBam5VkxTW2Q4A781h4za2PiwxCCTy+qtNvrwGHdis5n
         Q3W9BazWOFxIlx29/qjSDdWiQ39TIJoWhEq5fpBsYIcLYsb3ZTWCpVc3gLBkN85D9Lob
         cZMRYCQMKqeQZrkXJOh6MwVq6hE+yA2ogMeu+rZAdbYL5oNFKA9pk/tBeuQJLBMpwL47
         G9SjtUa3LxIfdxa2CdXVDd9oY2VndzvimKIUIVTuFqSg/sFFQVn6aDhKgYS/FFS2VPQo
         QQPZN6cC4U2zr0+MNRxEBpZttxryMBcQi56P94M3WgJk3O8bnlsMFzUlNK8nrFwTosfh
         Gd0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=O9DmSrSvp+/D4+V2cx49ZZK5Qu5Xoook/Yq/s+DSIa4=;
        fh=fBlaMbEcqh7qRrh/4PMPxXZXWarHK9f7O0uylPUAsHQ=;
        b=WTwZWgWKCPLa5fCmLtFdhvxUb9doYFuAp895BvweRsgtbmV8PDw+dlhDLH0tr5qdZ7
         AAetQ7lQksrLcBhH6YXscZUfsIsMTOJHuX9gmB4o6yU2MRH+Gk6OM0A0oqUy2sfVOG48
         Q4Rbc90MnOQCNFG2SiMtnG+yrM9Ey+2AZqpIM6J5UbRebcQvGYMiWzXF4QvIcEnEZ8Ac
         QO6fM7p35tkvRPBSQFP1/FLwEdhrGq3Xx/gnnGT1yeJy/lnOQsge7FZSDZgN5cU0Cnzx
         I1QIQ/APqpboYyM/IADVoZIjtsTB2/tCqTSLNuTfwl6reR7HAqBavczFmf0HGgEwneSn
         MBiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P/bx+W0+";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-43f3071a63fsor54914385e9.0.2025.04.16.02.22.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Apr 2025 02:22:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="P/bx+W0+";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744795333; x=1745400133; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O9DmSrSvp+/D4+V2cx49ZZK5Qu5Xoook/Yq/s+DSIa4=;
        b=P/bx+W0+yD61x6hfeAozlGFCIWuEE+5BQDyPNwmjn4YS05QbE8LYePqGPTdhrC3iVF
         hV1U5Z/bb6WzOGnNz3MTKDkktKd9Tu4gi20rl9nr8EHnI1i0w6lWUWXAqGwoU2bMLTJR
         B6+vy1m10nXbr//7zvA9CuIVIz3tRiI5fuxMpixe+VX6Bsjgjabm846FLTQnTUzgqDIk
         RB19M2/sjX/i7aCnfmfA57buk96y06ufnWfKccp2seXM490aWdxRgCSpmkrBG3dKQ+x4
         QuqsNOVqIeFgvw3KuO5wnQydpvVYYhrFSA/wbdIXEMa/ZODBRRNpC9ZDu97GDVd8Dg1b
         8lQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744795333; x=1745400133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O9DmSrSvp+/D4+V2cx49ZZK5Qu5Xoook/Yq/s+DSIa4=;
        b=W+gbh8Rgm6xYg+2ITgdC/kLx5GMeTJN9997rASBxMLJmG0plLnRZsD/5e9SwMt3Nw5
         mlcfB7p+fab+LIyrGb84UcpEPC2JmNFGmQU/FGkKjHaX7+aU4doAbhdtOk/NrUOGRctE
         0j6qsqds8QD+mi8EaH1yKt5JmYKTaBNe5lSpOaBs954bSJNzbpGUbCpZkt23S16IegUo
         bgYt1csodiGUAErE1vuff9J+ZyDSSuGxyXb4KlW3lvMSPs6Y4JXmanFg7vk5bwtKIZwJ
         pXUuu0Ytdwhw6xu5qz5MVrRXGbcvFmCP7z/oglYi/DAVX9B1IrpPPoki0quA1oXS4hW8
         wrGQ==
X-Gm-Message-State: AOJu0YyC1f+N6En7TcudKwXiLltpIudfBM8emLxguJ3w6t0jg+Syj+wL
	vmEb0M87wGfrJWFZAcs4Id9C5WTMD/XU7PFSFSnqFkfXwlioQNZYOH7bYKdtPycZqA==
X-Gm-Gg: ASbGncsvOjMiYnTPNYUdr+FT+3EC52RE+R4+c+hTHcWvwwkzbsEGbA88KvgBQk094xv
	Cb+NF5Uq0doCi836lt7GzRgp0D5D72d8MFKuWjsdILoyGoPWahAiuPzKx9cu/kZxBMtMs+IclWn
	59sGbk1yGjXL855Oobyl8wL85OxOYeLWlvcHT+cCQCdBXvOMUvt8aBcTGXAI3sT4U441Sglt9nR
	5gH+mvTbhs50fCJbapireNUr2hAZPXMXLHs9Waq7fu+8vQzRZSBpFqLLs/y68V/VxK9SofFv4JM
	/QKPzCh0qVLcYZajc6expaJMXqS4m7VHymS66wZzeFUEoCR6c67L6vHjlTGrkJ0Bj/t/CgeKFV+
	kCmydPE6TJaPgQw==
X-Google-Smtp-Source: AGHT+IH/5/Fc9I2DlZUhZUcAfXrdb3493WfekOWHZJ/g9slKP5w0pM4osO2SziGppYoFnMSTAiNOqQ==
X-Received: by 2002:a05:600c:c0e:b0:43c:eec7:eabb with SMTP id 5b1f17b1804b1-4405d6168ccmr10836195e9.8.1744795333597;
        Wed, 16 Apr 2025 02:22:13 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.176] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b4f2b72sm15214025e9.19.2025.04.16.02.22.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:22:12 -0700 (PDT)
Message-ID: <c00e2bc8-3248-44a7-bf4a-87441f6f9c19@linaro.org>
Date: Wed, 16 Apr 2025 11:22:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/19] meson: Add wasm build in build scripts
To: Kohei Tokunaga <ktokunaga.mail@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 Vikram Garhwal <vikram.garhwal@bytedance.com>,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <835dfef61307a941cdb58331607c308238d37e00.1744787186.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <835dfef61307a941cdb58331607c308238d37e00.1744787186.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: jGnyxjgJqYOn

Hi Kohei,

On 16/4/25 10:14, Kohei Tokunaga wrote:
> has_int128_type is set to false on emscripten as of now to avoid errors by
> libffi. Tests are disabled on emscripten because they rely on host
> features that aren't supported by emscripten (e.g. fork and unix
> socket).
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   configs/meson/emscripten.txt  |  8 ++++++++
>   configure                     |  7 +++++++
>   meson.build                   | 25 ++++++++++++++++++++-----
>   meson_options.txt             |  2 +-
>   scripts/meson-buildoptions.sh |  2 +-
>   stubs/meson.build             |  4 ++++
>   6 files changed, 41 insertions(+), 7 deletions(-)
>   create mode 100644 configs/meson/emscripten.txt


> diff --git a/meson.build b/meson.build
> index 41f68d3806..c9aa5016d6 100644
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
> @@ -470,7 +472,10 @@ endif
>   # instead, we can't add -no-pie because it overrides -shared: the linker then
>   # tries to build an executable instead of a shared library and fails.  So
>   # don't add -no-pie anywhere and cross fingers. :(
> -if not get_option('b_pie')
> +#
> +# Emscripten doesn't support -no-pie but meson can't catch the compiler
> +# warning. So explicitly omit the flag for Emscripten.
> +if not get_option('b_pie') and host_os != 'emscripten'
>     qemu_common_flags += cc.get_supported_arguments('-fno-pie', '-no-pie')
>   endif
>   
> @@ -514,6 +519,8 @@ ucontext_probe = '''
>   supported_backends = []
>   if host_os == 'windows'
>     supported_backends += ['windows']
> +elif host_os == 'emscripten'
> +  supported_backends += ['wasm']
>   else
>     if host_os != 'darwin' and cc.links(ucontext_probe)
>       supported_backends += ['ucontext']
> @@ -2962,7 +2969,9 @@ config_host_data.set('CONFIG_ATOMIC64', cc.links('''
>       return 0;
>     }''', args: qemu_isa_flags))
>   
> -has_int128_type = cc.compiles('''
> +# has_int128_type is set to false on Emscripten to avoid errors by libffi
> +# during runtime.
> +has_int128_type = host_os != 'emscripten' and cc.compiles('''
>     __int128_t a;
>     __uint128_t b;
>     int main(void) { b = a; }''')
> @@ -3774,6 +3783,8 @@ if have_block
>     # os-win32.c does not
>     if host_os == 'windows'
>       system_ss.add(files('os-win32.c'))
> +  elif host_os == 'emscripten'
> +    blockdev_ss.add(files('os-wasm.c'))
>     else
>       blockdev_ss.add(files('os-posix.c'))
>     endif
> @@ -4456,7 +4467,11 @@ subdir('scripts')
>   subdir('tools')
>   subdir('pc-bios')
>   subdir('docs')
> -subdir('tests')
> +# Tests are disabled on emscripten because they rely on host features that aren't
> +# supported by emscripten (e.g. fork and unix socket).
> +if host_os != 'emscripten'
> +  subdir('tests')
> +endif
>   if gtk.found()
>     subdir('po')
>   endif
> diff --git a/meson_options.txt b/meson_options.txt
> index 59d973bca0..45772484cc 100644
> --- a/meson_options.txt
> +++ b/meson_options.txt
> @@ -34,7 +34,7 @@ option('fuzzing_engine', type : 'string', value : '',
>   option('trace_file', type: 'string', value: 'trace',
>          description: 'Trace file prefix for simple backend')
>   option('coroutine_backend', type: 'combo',
> -       choices: ['ucontext', 'sigaltstack', 'windows', 'auto'],
> +       choices: ['ucontext', 'sigaltstack', 'windows', 'wasm', 'auto'],
>          value: 'auto', description: 'coroutine backend to use')

Does wasm depend on TCI at this point (no TCG backend)? If so, should
we check TCI is enabled? (I wonder if configuring with the
--disable-tcg-interpreter option succeed).
