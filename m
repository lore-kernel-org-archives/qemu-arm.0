Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp449890njb;
        Thu, 5 Dec 2024 13:59:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVxvl4tBnfhDocPoA2cc040fkzcTAVB6EX3Jwi+LmjoyUf5uJMB2ZMVczjQDxasLqSYs7PTMwKyO4irBA==@linaro.org
X-Received: by 2002:a05:6000:188f:b0:385:f409:b4c with SMTP id ffacd0b85a97d-3862b3f52b9mr386860f8f.54.1733435995228;
        Thu, 05 Dec 2024 13:59:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733435995; cv=none;
        d=google.com; s=arc-20240605;
        b=gVkbGqHp6wGExH0qnZuFxARImxgn1iIG9c71q72ZFgoDnB7US0FWKyGQtWjkMruMj5
         0nay54VcuILzo+Bn9hS9NZZ4Jc0lUuvQHhGvWiP3q3jAwhyuLvqkGPRo2gg3lkS7iamg
         7lzM7u4S8qxtk3rw4KfZDnQJucsyMljLnG2VmfMwhDDpYcwZHkS84VDf1/rQ1ItTq1EX
         R8j9GfZ9hhax8CtS67Tbhmwx5eH5JpGYKm4LVrEB6/gocdk2cEnMNJy8WuVZAWWYVPWY
         5RYKS+J/sW6UgiKJeRDkh/7oAc8DFWjkwztYzV0c9L5hrUutcE0tw/WD8TAjkaTPf39I
         yljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=XGf03nzHAWGwYGnYhWNnoe3LnELscMFwzsl0qyNy81s=;
        fh=tM4GzuFNSC/JOdrve/nwnj8vzyCJPjmkEF48SaRgNSI=;
        b=khBI84eRNmw211v2eY1XeTBDVoY6zuwheTs4LfI0Ny1ufhVt9gtmrisj+LX/dn+Svd
         RJ94U3jlOndbZvfk3oz4Wa5mDOCzcscMs6FqMHOrL0v4VQmM0JzPKnutsMIAw2HcZ9hm
         CN25NCOECDuWBHUYxeeQK2j8tKfICwWdi+BvYrAbE822PUEXymCBihCfgW9upKFRZHg1
         /VpXWL7079X7d4ZG2dnAyI7arhBJ/8si3SShbrcqjp09JP8UJ+gbayAuHEnxi60XBA0a
         LGMFfllqfCNGrkDYX2GbYYmMvyyHbK1tnBfhGAZIA3+P9CWB5PltIVJePjbAuvXSqmig
         gxiQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GEtD9U2H;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3861f970990sor743239f8f.3.2024.12.05.13.59.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Dec 2024 13:59:55 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GEtD9U2H;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733435995; x=1734040795; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XGf03nzHAWGwYGnYhWNnoe3LnELscMFwzsl0qyNy81s=;
        b=GEtD9U2Hq3L5PrE/kDOTOw+6lYjLDJJZlNdnSB863MMj3AErXG1ImgGplKKHd9fA2N
         gJBbJuU+K/J1HKPhViAKP0EPSlUbdIytTpDBjTmjvV1Tl2RuR3SMdFUR7Vbj4M/0Xrjh
         yN+jj9aAea1b5lpGFeW4yrUjp5iAqAkX8O2tQK85QonwG1OWfywYPQfkB4eVuG065Ano
         kdz856EMpcviTKfme0Jf2lISdJc/cwdyjGDp4Utb9lGhDag4plihiAQ9Q70ABDq0RXfK
         kEsqnV15Ga4SHnvVOS4pCf5+LKxiWo8DEQPfqpgVNNt8AC9j62tT1GvV4jbw/3PTbWoK
         NJqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733435995; x=1734040795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XGf03nzHAWGwYGnYhWNnoe3LnELscMFwzsl0qyNy81s=;
        b=Y9CJ0p8V2AhvJ4y4EpgL9MnpNn33ZfjXHhzQkalDWyu1mbDeIDQtLsYPuuPIOFkjq7
         SILix8xR59y0jHlY6JfouLIYyyGwgrjNDfek657up8L5Z/FpTQjOulh1CwyDE46xLwbh
         pqn51Jp5a92f4Lo8OtHm/McFjtsNG/ENplkJmcHlUlwQAcg294n+SLgIeQ+VqEcfu1q6
         PmkfT5XOyDDZQhKiFS1HEoogXpOsrlwVuTphDyP58wMw2JXfh3RWwsBYJxtIAD65+Mj+
         MHK8dHT9DG5KDTneL7Zw1i1BVTHzRMw7ukme1HW9s0z5kg+w1IALZ9v6mJKBY21ynslw
         KOWw==
X-Forwarded-Encrypted: i=1; AJvYcCWIaairxs7SuBR0Z4ilU02WyrpOy2Zhcz8v3eGzbjwS2PScQGXnWV8wugw3bGEVjuonGM+5opkzqlrbeQ==@linaro.org
X-Gm-Message-State: AOJu0YzgUuKhkDNCOiNKvL7lOZ2PyQa51ppH9XqkdxR81jmlJkwhq508
	D4H0EWjsqyab3chEfq7GkAyHDzPQGYL2m7AbqNkpgm2MVYSeBURLaxKHCnCkQKvDwhjzQYT0Vvn
	fzA0=
X-Gm-Gg: ASbGnctuVaosqYqVWqRNzms44btVG/sXy8tLWboiMzJAC3hv5ut/qTfvYc5kfbi0aww
	ps8MNczcgj0kDjSJpFSCv81RMkTkSbXSnjGotGnKCc0cL3nDIKz94IuP1qKJSL8hzMi2719IkAI
	Whkvjl+3rSJCV7Pt+IqDpLHGS9zaeVcW9XSJ6FJ2OIulLkiMxIqCo3UHdogfmjOuPuXysfVNKiH
	jjI1FdN+1Xz5Qg7ajXqH4D5L0LplSnKfVNHFpT8aNy7Yi+saky3NE3tKMClSjg0i0tfPoJYXbfv
	85ce9SRQKNq0t3JRig==
X-Google-Smtp-Source: AGHT+IFfsj7oglQJaZj64jQW53x0qDcr57liYsCT64pEl87oeDBXk+V2SZtm5P461qbVXcOl1tN58w==
X-Received: by 2002:a05:6000:1448:b0:385:f00a:a45b with SMTP id ffacd0b85a97d-3862b3560damr560287f8f.21.1733435994457;
        Thu, 05 Dec 2024 13:59:54 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.223] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-386220b071dsm2948809f8f.101.2024.12.05.13.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 13:59:53 -0800 (PST)
Message-ID: <564df018-6d47-4cb6-b781-5a2e58669da6@linaro.org>
Date: Thu, 5 Dec 2024 22:59:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/26] hw/core/loader: Add ROM loader notifier
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 alex.bennee@linaro.org
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-10-jean-philippe@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241125195626.856992-10-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ejSnALxa+65+

On 25/11/24 20:56, Jean-Philippe Brucker wrote:
> Add a function to register a notifier, that is invoked after a ROM gets
> loaded into guest memory.
> 
> It will be used by Arm confidential guest support, in order to register
> all blobs loaded into memory with KVM, so that their content is moved
> into Realm state and measured into the initial VM state.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   include/hw/loader.h | 15 +++++++++++++++
>   hw/core/loader.c    | 15 +++++++++++++++
>   2 files changed, 30 insertions(+)
> 
> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index 7f6d06b956..0cd9905f97 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -353,6 +353,21 @@ void *rom_ptr_for_as(AddressSpace *as, hwaddr addr, size_t size);
>   ssize_t rom_add_vga(const char *file);
>   ssize_t rom_add_option(const char *file, int32_t bootindex);
>   
> +typedef struct RomLoaderNotify {
> +    /* Parameters passed to rom_add_blob() */
> +    hwaddr addr;

This is the buffer (blob) address in guest physical memory.

> +    size_t len;

This is the buffer length.

> +    size_t max_len;

This is the size of the MemoryRegion ROM containing the buffer.

Do we need to notify it? You don't use it in your next patch.
If so, I'd rather have this API returns a MemoryRegion (Rom->mr),
max_len can be retrieved using memory_region_size(mr); but I
don't think we need this at all (at least for now).

> +} RomLoaderNotify;
> +
> +/**
> + * rom_add_load_notifier - Add a notifier for loaded images
> + *
> + * Add a notifier that will be invoked with a RomLoaderNotify structure for each
> + * blob loaded into guest memory, after the blob is loaded.
> + */
> +void rom_add_load_notifier(Notifier *notifier);
> +
>   /* This is the usual maximum in uboot, so if a uImage overflows this, it would
>    * overflow on real hardware too. */
>   #define UBOOT_MAX_GUNZIP_BYTES (64 << 20)
> diff --git a/hw/core/loader.c b/hw/core/loader.c
> index 31593a1171..759a62cf58 100644
> --- a/hw/core/loader.c
> +++ b/hw/core/loader.c
> @@ -67,6 +67,8 @@
>   #include <zlib.h>
>   
>   static int roms_loaded;
> +static NotifierList rom_loader_notifier =
> +    NOTIFIER_LIST_INITIALIZER(rom_loader_notifier);
>   
>   /* return the size or -1 if error */
>   int64_t get_image_size(const char *filename)
> @@ -1179,6 +1181,11 @@ MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
>       return mr;
>   }
>   
> +void rom_add_load_notifier(Notifier *notifier)
> +{
> +    notifier_list_add(&rom_loader_notifier, notifier);
> +}
> +
>   /* This function is specific for elf program because we don't need to allocate
>    * all the rom. We just allocate the first part and the rest is just zeros. This
>    * is why romsize and datasize are different. Also, this function takes its own
> @@ -1220,6 +1227,7 @@ ssize_t rom_add_option(const char *file, int32_t bootindex)
>   static void rom_reset(void *unused)
>   {
>       Rom *rom;
> +    RomLoaderNotify notify;
>   
>       QTAILQ_FOREACH(rom, &roms, next) {
>           if (rom->fw_file) {
> @@ -1268,6 +1276,13 @@ static void rom_reset(void *unused)
>           cpu_flush_icache_range(rom->addr, rom->datasize);
>   
>           trace_loader_write_rom(rom->name, rom->addr, rom->datasize, rom->isrom);
> +
> +        notify = (RomLoaderNotify) {
> +            .addr = rom->addr,
> +            .len = rom->datasize,
> +            .max_len = rom->romsize,
> +        };
> +        notifier_list_notify(&rom_loader_notifier, &notify);
>       }
>   }
>   
