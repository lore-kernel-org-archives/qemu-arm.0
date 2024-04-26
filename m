Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp487673ejb;
        Fri, 26 Apr 2024 08:47:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyFL27vHEoLH0XnKxV5XYYkIOjZu11TfJaHeFOEtfsI+6P3s8OM3tMn+TfuFlrFxFVZNDH
X-Received: by 2002:a05:6214:268b:b0:69b:47da:ab72 with SMTP id gm11-20020a056214268b00b0069b47daab72mr3520573qvb.35.1714146438824;
        Fri, 26 Apr 2024 08:47:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714146438; cv=none;
        d=google.com; s=arc-20160816;
        b=rnNnypUF0DgIrq3lfcq3bsbV0jx5bohYHZMQMfLLx7yxAppBbUVOJ3hHTikoISpBjG
         JyHwFttJpKOlq3wazRXh1fEbUGTjigivlmPrtZr0SDRQ3s6a5EisrSsoFwyyu/EDOFwL
         QaNJigsa666kAlpjJFbsEpvvvFx/oxF9jw8OzIhdQBmP3S0IlBwxGT08w+N7K9OftKhv
         5FM5UA59OTeOqTOOBDhOCsUrUm2CrrCkyS2n4mNbYlxDlKZ1Ev20jIRrrfog/Qx9UYVE
         3VGIaT5vIta38BRM1pcmSgXrnpm1WIDAVf/CIgKn0L0miV4S+dsZ4pktWqBoLE8Gyckj
         WPyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=U8RACwvKl99R1uoG8M3YzlN31wCUrWw1Rk0QkUUC4Ng=;
        fh=xCaHNNCN3Z15JqMJFlGDE60pgXroAFZ1570Y/qreWBM=;
        b=CH1VrHrexWfgPDUQt4lXiaG/RiItlIf4ewnuoWzUEQnGJrnktezoUTjusn4uZoRKai
         8NCPYoP2YzIgKcAHqqD+OjXuvVDnoiC8WIeEgBI4fUikIH3P3xKhq0m1DwZrsdGyvhj6
         qErAvmQVIn3s15bW1tYtvQAno/+b4pRjNICRN5My3hi1FToC62RXmPoqoG/35i/0JueS
         5u2GJND4mTxNfwlmOE3scyFbBAX478W0HyFHU47IwaqZ6O8bqs8S0+d1btvXybPN7Hoq
         f18baBUIiuXpgt/FeXXmtsIOF6LnKeGfNs56rh5UNJLd7ifnIAMmwCvTXZ8eeDheKMv6
         ER+w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OupCOl/S";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id kd14-20020a056214400e00b006a0b349a12fsi942908qvb.371.2024.04.26.08.47.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 08:47:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OupCOl/S";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714146438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=U8RACwvKl99R1uoG8M3YzlN31wCUrWw1Rk0QkUUC4Ng=;
	b=OupCOl/SocWXgEi1gRpF+kgLGLpe3/JWYoEv0hOPccHHJVn6HOwTyUVvlopzl4M6ZdvmiQ
	8FdFojOAkmUhumFNw5yKkRVu+zMYV4/rCzL/XD7X+ez0bXKwR9cxipEBryMNml7gHzkQe/
	LH4i0UCvhwoDQtigUH3OEYIjaAxKdBU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-AqbQyv2VPs-9jYFdvmlA_Q-1; Fri, 26 Apr 2024 11:47:17 -0400
X-MC-Unique: AqbQyv2VPs-9jYFdvmlA_Q-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a57bf8ae2fcso142848266b.3
        for <alex.bennee@linaro.org>; Fri, 26 Apr 2024 08:47:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714146436; x=1714751236;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U8RACwvKl99R1uoG8M3YzlN31wCUrWw1Rk0QkUUC4Ng=;
        b=aTJpqWdckZM02k57b/jtjXrIex3x5lKfxROoymUJ8eZ0glxYrY5wlgQ//SdtNVNE8e
         de5lIRX4l9vVQtjb1kROM5ND6DmR/9+Ozs78cJ+eqfdv4fLsDfjh5Yb6rsBbE76H2aBQ
         3olwWUtA7180TTgz6N3o1KTIRJjotYC+MvG9Am+Q1pb/dVQF4tQeMQZUTDoNpZmTv4jq
         EC9wgfWTkRuPT2RiOngroHWgVDeI5Ydsx6dwOh636/492vIJzJOZXDX2ka4zAxkByrpf
         6fDh4YpgsjoxLn4/nzYeAAielrxigJooJs5ykRl70nyAPK/+4xG/bT6aB7UWxy3pdyE/
         A2OA==
X-Gm-Message-State: AOJu0YwFtQZtVMaRyQ5zkomByu27oIzaoiJghF9qIt5q/T9Z+6fg+LwC
	6z4GGHAg/11sEQZfm0NCSEYqgqLvXAGu4faLsn55ixkw8Iln2XsDpYVp4M+ks24YUJG5nifINr0
	UerR/d8XTSnsENht7nEksX5eVjJeSHIcSZ9h9MuRZjmdKj2fKv+0FV7JVEIvNwkiB/TPnG9jy/d
	qqNGaolsmnnd71XSNqcl3NIxLAs5LoWPzZ6g==
X-Received: by 2002:a17:906:3811:b0:a55:99f4:549f with SMTP id v17-20020a170906381100b00a5599f4549fmr2293571ejc.48.1714146435903;
        Fri, 26 Apr 2024 08:47:15 -0700 (PDT)
X-Received: by 2002:a17:906:3811:b0:a55:99f4:549f with SMTP id v17-20020a170906381100b00a5599f4549fmr2293543ejc.48.1714146435455;
        Fri, 26 Apr 2024 08:47:15 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.9] (ip-109-43-179-20.web.vodafone.de. [109.43.179.20])
        by smtp.gmail.com with ESMTPSA id bu6-20020a170906a14600b00a57c75871d8sm5297973ejb.106.2024.04.26.08.47.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Apr 2024 08:47:15 -0700 (PDT)
Message-ID: <5ce65d53-0f6b-4777-92af-1bd419544a3a@redhat.com>
Date: Fri, 26 Apr 2024 17:47:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] build-environment: make some packages optional
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Joel Stanley <joel@jms.id.au>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Markus Armbruster <armbru@redhat.com>
References: <20240426153938.1707723-1-alex.bennee@linaro.org>
 <20240426153938.1707723-2-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240426153938.1707723-2-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 7uwSonOrgzZ6

On 26/04/2024 17.39, Alex Bennée wrote:
> Upgrading the s390x runner exposed some packages are not available for
> it. Add an additional optional stage we only enable for arm64/x86_64
> for now.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   scripts/ci/setup/build-environment.yml | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/scripts/ci/setup/build-environment.yml b/scripts/ci/setup/build-environment.yml
> index f344d1a850..de0d866a1e 100644
> --- a/scripts/ci/setup/build-environment.yml
> +++ b/scripts/ci/setup/build-environment.yml
> @@ -95,7 +95,6 @@
>             - libpam0g-dev
>             - libpcre2-dev
>             - libpixman-1-dev
> -          - libpmem-dev
>             - libpng-dev
>             - libpulse-dev
>             - librbd-dev
> @@ -107,7 +106,6 @@
>             - libslirp-dev
>             - libsnappy-dev
>             - libspice-protocol-dev
> -          - libspice-server-dev
>             - libssh-dev
>             - libsystemd-dev
>             - libtasn1-6-dev
> @@ -119,7 +117,6 @@
>             - libvdeplug-dev
>             - libvirglrenderer-dev
>             - libvte-2.91-dev
> -          - libxen-dev
>             - libxml2-dev
>             - libzstd-dev
>             - llvm
> @@ -156,6 +153,19 @@
>           - ansible_facts['distribution'] == 'Ubuntu'
>           - ansible_facts['distribution_version'] == '22.04'
>   
> +    # not all packages are available for all architectures
> +    - name: Install additional packages to build QEMU on Ubuntu 22.04
> +      package:
> +        name:
> +          - libpmem-dev
> +          - libspice-server-dev
> +          - libxen-dev
> +        state: present
> +      when:
> +        - ansible_facts['distribution'] == 'Ubuntu'
> +        - ansible_facts['distribution_version'] == '22.04'
> +        - ansible_facts['architecture'] == 'aarch64' or ansible_facts['architecture'] == 'x86_64'
> +
>       - name: Install armhf cross-compile packages to build QEMU on AArch64 Ubuntu 22.04
>         package:
>           name:

Reviewed-by: Thomas Huth <thuth@redhat.com>
