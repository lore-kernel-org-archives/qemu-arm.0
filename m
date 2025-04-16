Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3196530njc;
        Wed, 16 Apr 2025 02:00:57 -0700 (PDT)
X-Received: by 2002:a17:907:788:b0:aca:cb18:9ad0 with SMTP id a640c23a62f3a-acb42aeda26mr87037866b.45.1744794057579;
        Wed, 16 Apr 2025 02:00:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744794057; cv=none;
        d=google.com; s=arc-20240605;
        b=e0JDJ9qfTfuKIv5mKQkay0Bc+F2HZF4g1rn2Cx+PFEiqkCSQhtYve2+OkLQkPYM02Q
         DZLcpPTI5WPLH/w2V/LbWSYuI+o5VESv5FwnuwxzZ5kSt9ZrgGXSkfZEZM4zNj83Yw0n
         5wMMjpew9r+4q92Ao2sR6gIJ2okfS5pl4iEMctpMbsMIjRd8OMZB5TdKstzWVqmCSl8m
         0KIa/aCjnoR41qfMZR53zwPocMABDU8WM4iHV8QY9ciLyc/AisvlubTVHxhKe4maFTMc
         26gzIJ516Do3GR+zuskqKQ3gA7UXd4HxJ586QqTqmakyNovyMwGNz+Pm8Wk3Cz7HfGfl
         2YKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3VElVfjX45mj1/WonUIf3ibIkb+BD4bvk0WWThnCbn4=;
        fh=fBlaMbEcqh7qRrh/4PMPxXZXWarHK9f7O0uylPUAsHQ=;
        b=Xxr3ZrR4o3rlavAYaOnifAekmiYky4JnfCkQ7lt0G9iA2bM7IRHQoDXe48tH9ppoO8
         tGVD3Yv2ZgbgzhYb0GdRd4KkI0w7MRggbktlm7Z3I0EolBckGgSp/bPASe6wWWuhQHZ3
         OCANsoVs1DOoZK7I4StF9MnsY38ChH3+ycYIvsAVzgF2cPD2UGAVZViJTjTvmo/Pgayd
         dPiZFj9T+lGqD9lyc+BS4TJFSgK0dvyUWBUmPfyHIoAaWp/3NkwPitRV94c7liE/rR4h
         AhniLEMYEDAOzqBu/IhttZvbDV2BUsVQwPGs+9+hkF6ctDZOk/DoHd/GOke4RT6EY4nc
         M7Mw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gWrgTqaC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-acac17ec0d6sor605359766b.1.2025.04.16.02.00.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Apr 2025 02:00:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gWrgTqaC;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744794057; x=1745398857; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3VElVfjX45mj1/WonUIf3ibIkb+BD4bvk0WWThnCbn4=;
        b=gWrgTqaCcnYgyxloAs3IdpQv71KupONo5bmboGEKz8HxcbomSChGhnMWHCt16HeBI+
         ceF5e4i5rdQX97x2dD2f4EIb3ekkQIEjyFIIY75vbMqADzZ8ADDcAo8buJ5ECJCdP0Vu
         Uf9ivKH9dvrYD5Oz8ZUcbfmyQVmucwVzcgAmpTbafx9W+7/tkxM5wSpAkzUN5dU5+XJG
         eZQywC9JNLv/p2fD/c3+mrDspV93T37ou6H6aY/LbSIp1rbLi59ZwPINcVMyNmYGZr4u
         ZClcr/shDPW+bKanz9PYQ4juo0WwOBEw7F7bTeJssKGacpEf58IV7MGqwh7V6vu33ool
         23vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744794057; x=1745398857;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3VElVfjX45mj1/WonUIf3ibIkb+BD4bvk0WWThnCbn4=;
        b=D0u5OXJhg7F+o4Nk5iv3DNBoSXFSeqfLwV32dvvIlIg95kpxp9REYfO/fSfDRtoUAL
         o4ZarymAHqPHtp0cdTesrcEkVrxQkjP0dpEIl18A1ojLnTy7dFGVaICM+SEDbUl2yq1N
         XSq5HUnJR4URV1HwR+g6s46d17e94j/kRpOckMRT6X9MzHxtonu7rQP6b0GfBt6b3vKL
         OWTB1lniWZ+gzy1f21IkwEztHEeoWa6Ad+r9rfd9VZhKLVMKC9ofrVxPFRqYD0HbSp+7
         pIhd1sG05/C4gTKvotVPWDB6vey/gZkVVDycHDbSORQ5sxvIy2g8V7OwAvTesvmJml3+
         nMgg==
X-Gm-Message-State: AOJu0YyrvOjTbebmsQUhrHBphd2Etm9HHXNFuWhWje2crCl8TNFe1+Qc
	fGbEfVq5it6PxHXc5rKsEVGcaY8UCk7e8jJVuZHfXslBKOJVBWVSsfBW3tfei2tndQ==
X-Gm-Gg: ASbGnctkWL5uDGKBHSybq+flmTjbzEMHYDH2Yk8hhAfAZEe0ruEtLGDd+bkEQZHYBvk
	dZmXA1ZmjOwab6WZOvopsqCBqoBt2eTGtLMRFswFgHBZESAHOnT0Y8HaxFfEZeLchXetf8eaiUJ
	NCZ86xDldwxNEXhrOQxjEtUQL4J+nbZMjoMWetXNHVKSLqxqtaLZ83cW+EYvKxLDjBoZkZ77Iau
	8S2lQ7sAnh2Pdw0OzO44QW7GDheLZE36UyMeO2yLW4wpZQJtfsPfz2+bOkIZFsqlE6hYK+lhc7Q
	/jnmdwFg0QFi6+3KHUGyp0Jjs9onF1C6L7j936z7t+lDtqU2+MS42gYIOEXuBf4GmjW8s9tCEEE
	jU0R1tqBVsIkpiA==
X-Google-Smtp-Source: AGHT+IGj+IC3tfxmH1L1LTV5Ido32LezNB1aM4TK4otxy0m+9SPby/MHE4nVYKb49xBdsNXucqxxqg==
X-Received: by 2002:a05:6402:4407:b0:5e5:e396:3f6e with SMTP id 4fb4d7f45d1cf-5f4b75dcfe1mr962378a12.26.1744794056842;
        Wed, 16 Apr 2025 02:00:56 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.176] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ef56376sm8046360a12.19.2025.04.16.02.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:00:56 -0700 (PDT)
Message-ID: <afe0abf1-2c33-47d8-bde6-8abc722eb212@linaro.org>
Date: Wed, 16 Apr 2025 11:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/19] block: Update block to compile with Emscripten
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
 <9da41d784991f77e2c1f38d0781cd047b593e053.1744787186.git.ktokunaga.mail@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <9da41d784991f77e2c1f38d0781cd047b593e053.1744787186.git.ktokunaga.mail@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 2p8ZsGSR2Ugw

On 16/4/25 10:14, Kohei Tokunaga wrote:
> emscripten exposes copy_file_range declaration but doesn't provide the
> implementation in the final link. Define the emscripten-specific stub
> function to avoid type conflict with the emscripten's header.
> 
> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
> ---
>   block/file-posix.c |  6 ++++++
>   stubs/emscripten.c | 13 +++++++++++++
>   2 files changed, 19 insertions(+)
>   create mode 100644 stubs/emscripten.c
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index 56d1972d15..22e0ed5069 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -110,6 +110,10 @@
>   #include <sys/diskslice.h>
>   #endif
>   
> +#ifdef EMSCRIPTEN
> +#include <sys/ioctl.h>
> +#endif
> +
>   /* OS X does not have O_DSYNC */
>   #ifndef O_DSYNC
>   #ifdef O_SYNC
> @@ -2010,6 +2014,7 @@ static int handle_aiocb_write_zeroes_unmap(void *opaque)
>       return handle_aiocb_write_zeroes(aiocb);
>   }
>   
> +#ifndef EMSCRIPTEN
>   #ifndef HAVE_COPY_FILE_RANGE
>   static off_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
>                                off_t *out_off, size_t len, unsigned int flags)
> @@ -2023,6 +2028,7 @@ static off_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
>   #endif
>   }
>   #endif
> +#endif
>   
>   /*
>    * parse_zone - Fill a zone descriptor
> diff --git a/stubs/emscripten.c b/stubs/emscripten.c
> new file mode 100644
> index 0000000000..2157d6349b
> --- /dev/null
> +++ b/stubs/emscripten.c
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +#include "qemu/osdep.h"
> +/*
> + * emscripten exposes copy_file_range declaration but doesn't provide the
> + * implementation in the final link. Define the stub here but avoid type
> + * conflict with the emscripten's header.
> + */
> +ssize_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
> +                             off_t *out_off, size_t len, unsigned int flags)
> +{
> +    errno = ENOSYS;
> +    return -1;
> +}

I'd include in this patch this hunk from patch 17:

-- >8 --
diff --git a/stubs/meson.build b/stubs/meson.build
index 63392f5e78..4fd4d362f9 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -89,3 +89,7 @@ if have_system or have_user
    stub_ss.add(files('hotplug-stubs.c'))
    stub_ss.add(files('sysbus.c'))
  endif
+
+if host_os == 'emscripten'
+  stub_ss.add(files('emscripten.c'))
+endif
---
