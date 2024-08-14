Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp397885njf;
        Wed, 14 Aug 2024 01:29:22 -0700 (PDT)
X-Received: by 2002:a17:907:d3d2:b0:a7d:a00a:aa02 with SMTP id a640c23a62f3a-a8366c106aamr127878966b.1.1723624162656;
        Wed, 14 Aug 2024 01:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723624162; cv=none;
        d=google.com; s=arc-20160816;
        b=YbyOJvdnNU29r+ApvoW+UGBp4t5lLBa+kyPloxA+/6spbFiIM48h/iVr+tiRgAwrKn
         N9dbuX9gudJtnj4WvI2MzHI+ZudOe5fnVQr/2ovX5EAGrPfNURnm2+jDaCLT0saGE3bX
         rhhkiNRZkm4x2CLwX7iEF3NAzLYqkuEYaLVd2a/Wa/yy2YaLsPUEOILCXp9mlPKj1x3Z
         BXKJB+XiMl90MkeuPIX2ximVAjvxBoxG/YYjgPh0RlCW4A9HapSTMpTNqLFgS/gneC9M
         z5uT7zspXnKlCtnzJlAYtZFHGSpyyVr2+Y7geVAHf1wyRQFtDWZwJhejGjgOQYF5sEAc
         e9gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=pLikub/S5it/yNkS3p4Lua3X0XSWS5vsfui2YgVGLHs=;
        fh=jZo24YJmzra3pub9zTi1dY5NrYAU8lXKq94b5tS8TGI=;
        b=dNjc97kKsncn0pnZ6Z5nkOZ7PsUAbJzdcqnL8yYeIJ7u+2QhAvrKnfBUkqsJUUuBRa
         pQzagObbdx5cM4lnIbq0nszGutFOJjVeit0WVKIA9y+BAtpQJQfi5970/W3VmvWMD8iQ
         37yvUMApKcplKrfEC2YcFjQbiiFiPnlfceE6oJ3z6ne81VutER8mCIC0uMfEmUYgBCOA
         NuwzKFEQ3soU9NWpakW3hw0lgdMX+DAlRnOezbnhRrPuBAjL6DFA7kzHmPh9tOoVYA7a
         qKwdknypX2elGhvv8dOMPGe+Tmw+sn+R4C1GiSl3BgQgbrAnptYVL9mUo/Pjzl7hMX8f
         uc3Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lL7Rbl+w;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a80f40d1182sor101026166b.15.2024.08.14.01.29.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 14 Aug 2024 01:29:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lL7Rbl+w;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723624161; x=1724228961; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pLikub/S5it/yNkS3p4Lua3X0XSWS5vsfui2YgVGLHs=;
        b=lL7Rbl+wJBM7iUpdSZClEWvaKy1vq/YOi3AkN3sDzJgZk4wT1RI5EJPoffFYVbu0Ma
         DByR3ziVQqh4YrbUiyDNybLCxY4Lmt59/w9OC0Z7Oxtwjlnj4eKkzTX0vEZNF/VIbMms
         5M4xB+CVnLIAc7biPSYuqBuJoHCKe2brGVGyxsP9YQYt9zhhVcF6iaTcWVYzoV7ISNsd
         wooRWJb73v3XKbLHqIN65MNjdJDMOt/uL24jXg7SYy833NPoCEDGsWvWaEGFmjfvGMkt
         xSl2lvPkD7KL+UvjDA6B+aOVecUmwD4vNNc3cKyl/5zTR913E0vfmrs3rbIPmeMv10yZ
         MSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723624161; x=1724228961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pLikub/S5it/yNkS3p4Lua3X0XSWS5vsfui2YgVGLHs=;
        b=A7wsUM1SK6uYe8G8UTVbUyq2E6s3KxB8BENbdoE6CCCK/NsUDsAebSHgj3Z8nigBaG
         zF0U8R1idlNec/0u4b6DAfdc12ab+2rCkDFfmvcl4S2OXy8DHrttWrobfV0VmXhTzTm8
         smPaEW8dWUn6No8P4i3kAIcF3msjeAuV+ZHtEpC17pXGb1JHt0YCkT3suuxbHgUAOZ79
         ih+XFFW76kSQB6y9ne8Twtc3A6au63FOrcaJXcuznIJV+D4s/WRnz5IGHIjqFK9RCr1z
         +UG/Ad9FW0OwlWaIFIBYj0Ik3ttBAf3Xk/rtryOrYWdWIIjQT5ibKVp5Yy0hCJEEeeYi
         OYRA==
X-Gm-Message-State: AOJu0YwhDpVHshKqHuRuASq1atDN++p3xHPG1yoMXtR3LdMP5c53jQvM
	uNe/QMOwxWQedyQIKI4VzeNs8YfaeT1+vyU4eJbV6dYBI7Vk563u6tZFWeAzVUiEb178BRXEQx7
	33XTG1g==
X-Google-Smtp-Source: AGHT+IGV1oNc8DiVrgtanEUXhh4oVOC5PGoYr7xIhYv82H3zWBsfv7B9ux9RTz4prrnu2K/Acac3jQ==
X-Received: by 2002:a17:907:7e9b:b0:a7d:2f42:db54 with SMTP id a640c23a62f3a-a8367086687mr143154266b.65.1723624161308;
        Wed, 14 Aug 2024 01:29:21 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] (rsa59-h02-176-184-32-161.dsl.sta.abo.bbox.fr. [176.184.32.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f411aef3sm145561266b.106.2024.08.14.01.29.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 01:29:20 -0700 (PDT)
Message-ID: <3d03ecff-ab9b-422f-8b4b-6b3b1a20e810@linaro.org>
Date: Wed, 14 Aug 2024 10:29:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/21] buildsys: Fix building without plugins on Darwin
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Michael Roth <michael.roth@amd.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Weiwei Li
 <liwei1518@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, David Hildenbrand <david@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Eric Auger <eric.auger@redhat.com>, Song Gao <gaosong@loongson.cn>,
 qemu-arm@nongnu.org, Peter Xu <peterx@redhat.com>,
 Jiri Pirko <jiri@resnulli.us>, Eric Blake <eblake@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, qemu-s390x@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 John Snow <jsnow@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Konstantin Kostiuk <kkostiuk@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-riscv@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Helge Konetzka <hk@zapateado.de>
References: <20240813202329.1237572-1-alex.bennee@linaro.org>
 <20240813202329.1237572-9-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240813202329.1237572-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4dc14N88CeY7

On 13/8/24 22:23, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@linaro.org>
> 
> Since commit 0082475e26 the plugin symbol list is unconditionally
> added to the linker flags, leading to a build failure:
> 
>    Undefined symbols for architecture arm64:
>      "_qemu_plugin_entry_code", referenced from:
>          <initial-undefines>
>    ...
>    ld: symbol(s) not found for architecture arm64
>    clang: error: linker command failed with exit code 1 (use -v to see invocation)
>    ninja: build stopped: subcommand failed.
> 
> Fix by restricting the whole meson file to the --enable-plugins
> configure argument.
> 
> Fixes: 0082475e26 ("meson: merge plugin_ldflags into emulator_link_args")

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2476

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Acked-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20240813112457.92560-1-philmd@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   plugins/meson.build | 50 +++++++++++++++++++++++----------------------
>   1 file changed, 26 insertions(+), 24 deletions(-)
> 
> diff --git a/plugins/meson.build b/plugins/meson.build
> index 18a0303bff..1cc039d29b 100644
> --- a/plugins/meson.build
> +++ b/plugins/meson.build
> @@ -1,3 +1,7 @@
> +if not get_option('plugins')
> +  subdir_done()
> +endif
> +
>   # Modules need more symbols than just those in plugins/qemu-plugins.symbols
>   if not enable_modules
>     if host_os == 'darwin'
> @@ -12,29 +16,27 @@ if not enable_modules
>     endif
>   endif
>   
> -if get_option('plugins')
> -  if host_os == 'windows'
> -    dlltool = find_program('dlltool', required: true)
> +if host_os == 'windows'
> +  dlltool = find_program('dlltool', required: true)
>   
> -    # Generate a .lib file for plugins to link against.
> -    # First, create a .def file listing all the symbols a plugin should expect to have
> -    # available in qemu
> -    win32_plugin_def = configure_file(
> -      input: files('qemu-plugins.symbols'),
> -      output: 'qemu_plugin_api.def',
> -      capture: true,
> -      command: ['sed', '-e', '0,/^/s//EXPORTS/; s/[{};]//g', '@INPUT@'])
> -    # then use dlltool to assemble a delaylib.
> -    win32_qemu_plugin_api_lib = configure_file(
> -      input: win32_plugin_def,
> -      output: 'libqemu_plugin_api.a',
> -      command: [dlltool, '--input-def', '@INPUT@',
> -                '--output-delaylib', '@OUTPUT@', '--dllname', 'qemu.exe']
> -    )
> -  endif
> -  specific_ss.add(files(
> -    'loader.c',
> -    'core.c',
> -    'api.c',
> -  ))
> +  # Generate a .lib file for plugins to link against.
> +  # First, create a .def file listing all the symbols a plugin should expect to have
> +  # available in qemu
> +  win32_plugin_def = configure_file(
> +    input: files('qemu-plugins.symbols'),
> +    output: 'qemu_plugin_api.def',
> +    capture: true,
> +    command: ['sed', '-e', '0,/^/s//EXPORTS/; s/[{};]//g', '@INPUT@'])
> +  # then use dlltool to assemble a delaylib.
> +  win32_qemu_plugin_api_lib = configure_file(
> +    input: win32_plugin_def,
> +    output: 'libqemu_plugin_api.a',
> +    command: [dlltool, '--input-def', '@INPUT@',
> +              '--output-delaylib', '@OUTPUT@', '--dllname', 'qemu.exe']
> +  )
>   endif
> +specific_ss.add(files(
> +  'loader.c',
> +  'core.c',
> +  'api.c',
> +))
