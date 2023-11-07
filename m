Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp195957ejv;
        Tue, 7 Nov 2023 01:44:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEOwzSHbIYdxB6MQObA6JcrG1NHqfHou/EXmgitWgXUr8NhhJwSiVw1NGwjE7ZmVIwWj2F
X-Received: by 2002:ac8:5746:0:b0:41c:e161:c99a with SMTP id 6-20020ac85746000000b0041ce161c99amr41574740qtx.56.1699350251270;
        Tue, 07 Nov 2023 01:44:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699350251; cv=none;
        d=google.com; s=arc-20160816;
        b=A7kEATMh4LdtpjRsSUV2E7uanaZApl2XBoZlt3yBlsCuFTyZNoVW6S4DiGgcS492T/
         p933+aGgKS7+RS8TQjDEqAEiww8kpg1HQ/ipbnNbje6H+aCGB4BrT2PSmUrDdJ6QVhek
         KpXIj1eQDr7u6X5wK4cMHeP9Q/QSW2SypkvPhd4th6Hk7n/QMomeJIJDeLoE4/3Us60s
         GyIvqi5yMWb+NW1UOUyj3h74zwlld6kG8fiPe5nd1CzGZyoosRVcgU3YOLWzxOLvouKw
         QcxZqSJBwATd93SodAQikv+FIc5Gj9ZV6+P5rMMCwOvcn1CYNeNba9Ou2Osa5mdyEz5N
         Kg1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=SUWbuaCqFxy1qo9QYm6b7x55Eg5dZhglr722fG27ZPM=;
        fh=UD3i/G3upbIOq0gGv+l3oA0/tNdjddDTSx3RFIrfNrk=;
        b=AqFpk+0+tJGWRs5cA8YmEREngO+ZbAqp5QUp7dBtZAhQGr5Le5BEC9Dej9FqiRHpGB
         40SuUc2Q74CO4IcPilHbh/QICIY1ELRly8n/8klBq1vAkOddF1EdHStXn48Jvq7lD7oN
         P4X9oD1AuPbMjDdsuL972F5x8RgxXuVyL9RqlLFxiH6E5lLcl/S+08//rKUXfiqtyVQ5
         j4DECENYZ5pbtbqY3n35KxDTmU7VFZf/wwlcvRDsuVjYnBjm2njiPatltF6k3ESyf0mw
         BWu1fp4lkrVZ1wqjAH+uhhQ3PLYcnJTJk3dN/HYtEc5XVcMWkqPAOz8Fv0I8coJfTgRj
         Zfvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=crdCvJOV;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id bb32-20020a05622a1b2000b0041eae06bef8si4363592qtb.496.2023.11.07.01.44.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 01:44:11 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=crdCvJOV;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1699350250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SUWbuaCqFxy1qo9QYm6b7x55Eg5dZhglr722fG27ZPM=;
	b=crdCvJOVcJPnSPa82xUOHZ5b3C0O3FZngKDAn9i2fVZneQbHuHQebkExF27i74y2Ss1b/W
	K0yKthDHzCwS2BgAJWmaGg+xXGdK0qvvvvlVrBrqkgToSN1Jo12JRyz1hx/Ezij4Pjb/Hk
	r4XnLM2GHORFohSbd+odM7MXIseXQyI=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-UxAQKs-OMCKV-74r0EVgQw-1; Tue, 07 Nov 2023 04:44:09 -0500
X-MC-Unique: UxAQKs-OMCKV-74r0EVgQw-1
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2c5047f94bdso47117991fa.1
        for <alex.bennee@linaro.org>; Tue, 07 Nov 2023 01:44:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699350246; x=1699955046;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SUWbuaCqFxy1qo9QYm6b7x55Eg5dZhglr722fG27ZPM=;
        b=Ca4sEykUYdOqidJ2hTlJw2KPXY5PsyMVNzBJEZq7EdoURw/JeyhgA9W8ZvbFJ/mCJd
         ZNjwUKMHFyMpwxZbrFJL5AJXOJrZ6ZTZpLBzvpOnfOgQYbiOwZvfantLocAevtBV8y3O
         +kUK5U6QEhOqWZKcRqaSrSd38E519hMZ5biAtJ8rkMqy3qkG/tQSTxewJP3XJYvEYEc5
         lUoci+qnmp6p7EhzVC+OB+n0IpWmW9h4fzRHfUxB2PGYMtdtFMkgKtK1xfZi4HzEs3ww
         rhPC3Zc4A8Zm+w01YW6IxVuPGrRXTdssWFQmBHUr+upU1BGT/t8szELXOat0HL5peke5
         C5Cw==
X-Gm-Message-State: AOJu0YwQrjg3WdokRsRmtKmhsx2TfgL+SeUnWNhnAutgWL+woxllAzbS
	0OpF66cyQa0rJRHcjOynsVayEgRBoyJKa7y4gGJlIrao0iXg8iSBm/iDBvKnlAhVqTxXilIukFB
	PIwoLPZkdweOupT2RaKiZS87/GS+G68uvgY2LoPwVmpZumsJpWy3C0dQ9ZAkcYNiSfYT5qVibI7
	5/
X-Received: by 2002:a2e:918d:0:b0:2c5:ffa:375d with SMTP id f13-20020a2e918d000000b002c50ffa375dmr23962557ljg.11.1699350245662;
        Tue, 07 Nov 2023 01:44:05 -0800 (PST)
X-Received: by 2002:a2e:918d:0:b0:2c5:ffa:375d with SMTP id f13-20020a2e918d000000b002c50ffa375dmr23962523ljg.11.1699350245169;
        Tue, 07 Nov 2023 01:44:05 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e? ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
        by smtp.googlemail.com with ESMTPSA id l26-20020a05600c1d1a00b003fef5e76f2csm12486652wms.0.2023.11.07.01.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 01:44:04 -0800 (PST)
Message-ID: <ea92d71f-35a3-4a5f-bece-01436a33e1e8@redhat.com>
Date: Tue, 7 Nov 2023 10:44:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/22] plugins: make test/example plugins work on windows
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Greg Manning <gmanning@rapitasystems.com>
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20231106185112.2755262-1-alex.bennee@linaro.org>
 <20231106185112.2755262-15-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20231106185112.2755262-15-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 0yOiswv10z2K

One important remark below that Greg can answer; the others are nits.

On 11/6/23 19:51, Alex Bennée wrote:
> diff --git a/contrib/plugins/win32_linker.c b/contrib/plugins/win32_linker.c
> new file mode 100644
> index 0000000000..50797d616e
> --- /dev/null
> +++ b/contrib/plugins/win32_linker.c
> @@ -0,0 +1,34 @@
> +/*
> + * Copyright (C) 2023, Greg Manning <gmanning@rapitasystems.com>
> + *
> + * This hook, __pfnDliFailureHook2, is documented in the microsoft documentation here:
> + * https://learn.microsoft.com/en-us/cpp/build/reference/error-handling-and-notification
> + * It gets called when a delay-loaded DLL encounters various errors.
> + * We handle the specific case of a DLL looking for a "qemu.exe",
> + * and give it the running executable (regardless of what it is named).
> + *
> + * This work is licensed under the terms of the GNU LGPL, version 2 or later.
> + * See the COPYING.LIB file in the top-level directory.
> + */
> +
> +#include <Windows.h>

Just a nit, but we generally use lowercase "windows.h".

> +#include <delayimp.h>
> +
> +FARPROC WINAPI dll_failure_hook(unsigned dliNotify, PDelayLoadInfo pdli);
> +
> +
> +PfnDliHook __pfnDliFailureHook2 = dll_failure_hook;
> +
> +FARPROC WINAPI dll_failure_hook(unsigned dliNotify, PDelayLoadInfo pdli) {
> +    if (dliNotify == dliFailLoadLib) {

I think this could also use the notification hook and 
dliNotePreLoadLibrary.  That's a little more tidy but it's okay either way.

A bit more important: would it make sense to include the hook *in the 
QEMU executable itself*, rather than in the DLL?  If it works, it would 
be much preferrable.  You still would have to add the .lib file to the 
compilation, but win32_linker.c could simply be placed in os-win32.c 
with fewer changes to meson.build and the makefiles.

> +    if targetos == 'windows'
> +      t += shared_module(i, files(i + '.c') + '../../contrib/plugins/win32_linker.c',
> +                        include_directories: '../../include/qemu',
> +                        objects: [win32_qemu_plugin_api_lib],
> +                        dependencies: glib)
> +
> +    else
> +      t += shared_module(i, files(i + '.c'),
> +                        include_directories: '../../include/qemu',
> +                        dependencies: glib)
> +    endif

If the win32_linker.c file can be removed (by moving the hook into the 
emulator), I'd rather have this where win32_qemu_plugin_api_lib is created:

if targetos == 'windows'
   ...
else
   win32_qemu_plugin_api_lib = []
endif

and then here you can just use "objects: [win32_qemu_plugin_api_lib]" 
unconditionally, saving an "if" and some duplication.

Paolo

>     endforeach
>   endif
>   if t.length() > 0
