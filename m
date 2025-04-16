Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3210707njc;
        Wed, 16 Apr 2025 02:33:11 -0700 (PDT)
X-Received: by 2002:a05:600c:68d2:b0:43b:bfa7:c7d with SMTP id 5b1f17b1804b1-4405d765a17mr9161605e9.2.1744795991086;
        Wed, 16 Apr 2025 02:33:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744795991; cv=none;
        d=google.com; s=arc-20240605;
        b=OT/cnoD5YL5xsEM7GynWQGNfBG67XszbtE+6eC7jGYubHye22x0RdZbxSQCfJsNrnN
         AstmkRfXSxhTVhcWf8t4NPXetFdzwd0ac7pLYmbu/QKEr0AaVYpSz1XNE5kuKzxQ1gOz
         xM9kQPpnITPrmrQw3vhkxv5CNy0Gm+1exJkm8eFWWUV81R8XanWUXhKVhqUex+uBQPxD
         4vFXKo1IDXtI2zDFxMKozdcgWOFeT44krfgQeK9T8HNDuYAMHiCQfEC0MVwVne6HO6OI
         8NH2vMN63IYqoK97c/+b/BLRB78dMBnQ6M3Id2UFDjq64m/xtvIhzryKTcN8QXCc+aXt
         Zy4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=afPtcsGo0/7NpTM+oS8EQe7bVn98dwsMMIGtq+LmHK0=;
        fh=fBlaMbEcqh7qRrh/4PMPxXZXWarHK9f7O0uylPUAsHQ=;
        b=dVVqbAij8rCvLSzXNMtmtzFCzFMWY/aeD5EW955DlteLaWWF4ZIUy9gJ7uD73UBIEV
         TDUllRW4Sr/FCH1V0D6nKGinyp/6cuf25RtES1yRzPQmWpPeQK+p/4jIf2a0DEI/9NLZ
         TixlihNcQQ88MPj5fHUVIHo6qIvEr8lAMwWwiAlSXLwBipzHC8KGYcXPuJBJtTWGSIJH
         EeJpxvnq4QjAD61ltLF+o62YXSSx9s2dN4XgoYVEh+JS/X3z0dpTcI/9WH/aI91QCzia
         9sgA2AASqPSYA2KgAT5wPUYW5F8E2gPTc0BjLrLGZJn816L29qYf+uj12NguxNkx33Cu
         kIEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wY7k7Kpa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4405b5a5396sor3613125e9.5.2025.04.16.02.33.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 16 Apr 2025 02:33:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wY7k7Kpa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744795990; x=1745400790; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=afPtcsGo0/7NpTM+oS8EQe7bVn98dwsMMIGtq+LmHK0=;
        b=wY7k7Kpa9ILNqW7l2SLkgyf0JhETG1kQa3j3arcjyvYkZMUyyihhBrbKMYP1ASZ441
         NlQOclYzyY/p/vYwJ5cZ6edJsA0H3gWzwOFmFBeB8SUYvhSVizrqgKsR0owJDyLNNW4b
         MzlsqdKSeRwI3KAW3D2sfFLBsYNYlWPfKOC9PGeJv9gFIUpLDE3dofcJpzrTS7jkruB4
         5hu19dDo4kkiZlTUgQFRiRKYDux6AjTiVFVE+e4YdJPApBp2/JA/kEcp/AvsjhaY2zHW
         qF/Po+47rhfJmAvEpX40H1LkfkLxfo7Ug4PAy1pgoGU1TUyo/ZQ3GrDKDLk+RjxtT5rg
         /J8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744795990; x=1745400790;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=afPtcsGo0/7NpTM+oS8EQe7bVn98dwsMMIGtq+LmHK0=;
        b=DcX+Xp1i/wblidJnzziEKlVZ1SzMmuFe0MYaquvbsEiwuRmchcc9fQzSGMPEQLEpoD
         xABPHx++gZFjSPOUIJP/AGY4D8qegfBlz6eeDaHMDYkJsq2G351qcF8xwwzVKt5fj/dQ
         VpDMhlf9cuuXFAt5UMxH0VNjTJaSDmvIsucYbRZAvQAw1JaQ6A3A8u2rVdgDg+OV2Y/q
         75dTwUCohdW2D5ENR/t6N0z1NoxOjcoQMrNh9XAQqIzZJXTNH1N8jQutiBssNZEuMXXg
         /CdT+MotF05Z3GHpNrRET3WWK7SqUa09r/NJYoU8JGDmMsbBkpXw1IsLKtU3oDpHDtx5
         zTCA==
X-Gm-Message-State: AOJu0YxOC7Ffp/mV0XX3p7KVjb2C+C2kifkOqumZKDbxt3II1i/MYhSt
	nNc44d2XXkmNez1/QsiaT/+uTgjVs8+jAsVnJr7yA61auCWGfI/Q6iRrQKOi0co8FQ==
X-Gm-Gg: ASbGncsTEkyfHlUatgGaVww612pXgw4p3bPPpURtAsYp05Bd53l+x98xNKgFwN4YPpN
	BOQrbhP/WULE7qIfTGejKwcGLwLC34VCEmdTnSAXHI1lUzS4yo2DckiU9Sw27NX1lLzfxKBmMEV
	DWFoo0DyHaEHaO7XEXphl8pxJTINZStLlp3fy4WGCP/h+9qOTwG4iQY6vOABsvDx9z2ov7e6kn7
	/6DPt1q5J3bcZiyOkbs9BVZoEi1kGBqPcNh2QDXx13VOOpcEIgIi1FUdUDb9ZOfw/zUNZCq95XD
	bBCfvSJRCvt2/TZbacTLwBmxlrpXoBpIumAx6nWQ2RT1vP9oZbQCny2gwazeqGL86LKpDrvIAb1
	WlMpUI/GOJtVa/A==
X-Google-Smtp-Source: AGHT+IGsE+YM7/CjJzAZeTiKtyuERZ+66QMAZoCdiwf6nPB3lLer+ArlLHsqqSFfxnm9YRiyFGIx+g==
X-Received: by 2002:a05:600c:4593:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-4405d765ae9mr10364065e9.2.1744795990518;
        Wed, 16 Apr 2025 02:33:10 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.176] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405b54579fsm15743395e9.40.2025.04.16.02.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 02:33:09 -0700 (PDT)
Message-ID: <2d232dbc-4613-4352-8ede-3fd5dcefc32c@linaro.org>
Date: Wed, 16 Apr 2025 11:33:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/19] block: Update block to compile with Emscripten
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
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
 <afe0abf1-2c33-47d8-bde6-8abc722eb212@linaro.org>
Content-Language: en-US
In-Reply-To: <afe0abf1-2c33-47d8-bde6-8abc722eb212@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: azLli/6LBkHx

On 16/4/25 11:00, Philippe Mathieu-Daudé wrote:
> On 16/4/25 10:14, Kohei Tokunaga wrote:
>> emscripten exposes copy_file_range declaration but doesn't provide the
>> implementation in the final link. Define the emscripten-specific stub
>> function to avoid type conflict with the emscripten's header.
>>
>> Signed-off-by: Kohei Tokunaga <ktokunaga.mail@gmail.com>
>> ---
>>   block/file-posix.c |  6 ++++++
>>   stubs/emscripten.c | 13 +++++++++++++
>>   2 files changed, 19 insertions(+)
>>   create mode 100644 stubs/emscripten.c
>>
>> diff --git a/block/file-posix.c b/block/file-posix.c
>> index 56d1972d15..22e0ed5069 100644
>> --- a/block/file-posix.c
>> +++ b/block/file-posix.c
>> @@ -110,6 +110,10 @@
>>   #include <sys/diskslice.h>
>>   #endif
>> +#ifdef EMSCRIPTEN
>> +#include <sys/ioctl.h>
>> +#endif
>> +
>>   /* OS X does not have O_DSYNC */
>>   #ifndef O_DSYNC
>>   #ifdef O_SYNC
>> @@ -2010,6 +2014,7 @@ static int handle_aiocb_write_zeroes_unmap(void 
>> *opaque)
>>       return handle_aiocb_write_zeroes(aiocb);
>>   }
>> +#ifndef EMSCRIPTEN
>>   #ifndef HAVE_COPY_FILE_RANGE
>>   static off_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
>>                                off_t *out_off, size_t len, unsigned 
>> int flags)
>> @@ -2023,6 +2028,7 @@ static off_t copy_file_range(int in_fd, off_t 
>> *in_off, int out_fd,
>>   #endif
>>   }
>>   #endif
>> +#endif
>>   /*
>>    * parse_zone - Fill a zone descriptor
>> diff --git a/stubs/emscripten.c b/stubs/emscripten.c
>> new file mode 100644
>> index 0000000000..2157d6349b
>> --- /dev/null
>> +++ b/stubs/emscripten.c
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +#include "qemu/osdep.h"
>> +/*
>> + * emscripten exposes copy_file_range declaration but doesn't provide 
>> the
>> + * implementation in the final link. Define the stub here but avoid type
>> + * conflict with the emscripten's header.
>> + */
>> +ssize_t copy_file_range(int in_fd, off_t *in_off, int out_fd,
>> +                             off_t *out_off, size_t len, unsigned int 
>> flags)
>> +{
>> +    errno = ENOSYS;
>> +    return -1;
>> +}
> 
> I'd include in this patch this hunk from patch 17:
> 
> -- >8 --
> diff --git a/stubs/meson.build b/stubs/meson.build
> index 63392f5e78..4fd4d362f9 100644
> --- a/stubs/meson.build
> +++ b/stubs/meson.build
> @@ -89,3 +89,7 @@ if have_system or have_user
>     stub_ss.add(files('hotplug-stubs.c'))
>     stub_ss.add(files('sysbus.c'))
>   endif
> +
> +if host_os == 'emscripten'
> +  stub_ss.add(files('emscripten.c'))
> +endif
> ---

Actually what about checking the symbol presence in meson?
Something like (untested):

-- >8 --
diff --git a/meson.build b/meson.build
index b18c46d16a2..33185fdf315 100644
--- a/meson.build
+++ b/meson.build
@@ -2654,3 +2654,2 @@ config_host_data.set('CONFIG_TIMERFD', 
cc.has_function('timerfd_create'))
  config_host_data.set('CONFIG_GETLOADAVG', cc.has_function('getloadavg'))
-config_host_data.set('HAVE_COPY_FILE_RANGE', 
cc.has_function('copy_file_range'))
  config_host_data.set('HAVE_GETIFADDRS', cc.has_function('getifaddrs'))
@@ -2756,2 +2755,6 @@ config_host_data.set('HAVE_UTMPX',

+config_host_data.set('HAVE_COPY_FILE_RANGE', cc.links(gnu_source_prefix 
+ '''
+  #include <unistd.h>
+  int main(void) { return copy_file_range(-1, NULL, -1, NULL, 0, 0); }'''))
  config_host_data.set('CONFIG_EVENTFD', cc.links('''
---
