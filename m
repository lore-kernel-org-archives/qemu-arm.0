Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp13949njb;
        Mon, 3 Feb 2025 21:33:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWo6JK1Vzuc8BLKEdTajI5dqO0DVew/JULmZsG9uE83GToJ/PY/VlrSquJRUsMsESJ3iNX7dWq23vm5xA==@linaro.org
X-Google-Smtp-Source: AGHT+IHXNjRVEe2GRWyazRqa/iJFngTUF8VFCW7rJc6Qv7aCGuEZLC/1rUE0ybQbQ+rm2+wmjALI
X-Received: by 2002:a05:620a:1923:b0:7b1:161c:ef58 with SMTP id af79cd13be357-7bffcd08903mr3399600085a.28.1738647200050;
        Mon, 03 Feb 2025 21:33:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738647200; cv=none;
        d=google.com; s=arc-20240605;
        b=fJX2OfHU3pVYt2wn4/8rm9ODS8Q6ATCm9XFIk0Uh7eBxmsmR151+9vYMEuz/KsipI3
         u9LhfmfO4STkeeZNra9fHix3T41MxkRDUsWtccxWMz/MY2s7vGclekzJcz/Bffjmpdsq
         rZTdkP86XWAu0rHT0ccISRTlPYStKAVedxYMgbVTxxvlumqBgGn2zLGYuC/opPHXhDm7
         ifKDf6gLn/8CnJPZT6blUpoqUwdS627q9r8plx6JWkaFRBeDyOpyraS8bu5qvBOyQC7F
         hLvH2wTBXq99p2gNOJkuMCjgMUgClnYJ6r7hfLy8S//Q33Bh/wBDGq1Fq9UJC9D58Xcu
         j9Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=vEeOlsnYhDiPSKrDSj6BPfhNFyCgIkg6bjkXUXrEpug=;
        fh=9k0dHWDK7QVLAird5dZlhNuHf6c46QV6DiMTMI8VItI=;
        b=Ti7wLaM9b28yBwgoDclyon61polDcCG/kuHq4hp73Mg1rQGpwx5b1prkARw9r+X917
         zP0es0kDuYj1NHOoegHkXU9+hxHdMN1PoC9xUlsAgE03jeMaeYfm7frcIyyaJtoz5vKI
         uqE+BGm2IFeFSVRUFMbArxGKh2IcW2PF7/y3KgSINFfbSYkhAVd63oYnFVhDBriFSKlr
         S658j8Uzo8dNP2TvgzyFAaxsROXryB30IWJiMNv6QnZJQpIeT+U5Ls3ugw5rEhWYVjYe
         IuSwsrAEPtIM7LOeQiRvNPSOSN03B9XiYizA6Xck96oQYEFc5cOOjH0F/vcB2xhhWn0Y
         n+MA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g+9VWUmD;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c02dbdca1csi181638585a.268.2025.02.03.21.33.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 21:33:20 -0800 (PST)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g+9VWUmD;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738647199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vEeOlsnYhDiPSKrDSj6BPfhNFyCgIkg6bjkXUXrEpug=;
	b=g+9VWUmD1vAUb/pP/JRpuyvb/p0EUVHD7Al6kzKLfT9UozqEmDEUCwifAVuaqpFyLrBfyh
	/1yLSclB+DsNsVicYva9/zVieI38bHJmhfDQzOXdjVMGpxWH4IhwEQq5eyuKtsbTt/qkVH
	BMakeciwEOO+zFhG6OVoY/aT6lTF8hE=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-546-OEOL-vsgNKiBFXkzamIg-Q-1; Tue, 04 Feb 2025 00:33:16 -0500
X-MC-Unique: OEOL-vsgNKiBFXkzamIg-Q-1
X-Mimecast-MFC-AGG-ID: OEOL-vsgNKiBFXkzamIg-Q
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21661949f23so171195045ad.3
        for <alex.bennee@linaro.org>; Mon, 03 Feb 2025 21:33:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738647195; x=1739251995;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vEeOlsnYhDiPSKrDSj6BPfhNFyCgIkg6bjkXUXrEpug=;
        b=U9qIji+YSla1S3RoDs9ieGYvF4M0+mLl7qS1Uvi4glRoyY95TIKBd2hblmWiXm3EdG
         rTPi7oWtIUUO3zrBeE36GdgzEnHeV/M4WdB2OKH+xn0kkT9L7lBzTiqHqxYhi33kIQWi
         +Ia1TUxCbOw/lJsMfoV7OGLkoCqIPqHNOTwRx/FA/7uI75jnFPhdeM29pEtHP1jZOXEh
         B2Nd+zeC7Yni2jUL6EPr9sH8NC6csNHzmdBvmXUveIQp826o8MYeJOFQNtdpmdAGC+b9
         JW1huX1uGD8DbLrPvMCJ/mAZStp7LZKqOyv0x2hO3k64h7Hv3FNBkvKd1P/kpgZDmvhA
         l0eg==
X-Forwarded-Encrypted: i=1; AJvYcCUli6oqGyNLzFb/494TOanupVXBvY9uy6TUOZjd3KUU4G8FnJBvOF3PL5yTfg5jQJCVGSnrssVAMVahMA==@linaro.org
X-Gm-Message-State: AOJu0YwBxdUSWwbDjJ/y0RFMPGZKHQywkiIDP7KDkzBErn/XBpWHH5EN
	YOaCCTdxKpxrza0jMCYk1nuwgI84XCIZV1Qa1Hhrp72UvQWqZ9nQHUSqz036t3a/zD1tacAKHtH
	YYARiqXotZU+SEJxRu4Jh4X3OJJ0+8tPmkrzydSA6IxGqmFpBnIgCsQ==
X-Gm-Gg: ASbGncvWutL8dNTSmI+d082IKMZntxFfAD2dbNOlM6bDOlncedvbGTl2/NG0JAPXFCT
	4mToRQsIuyLVBxwSnySKqHa/6+2OGXskAW3aHDh0Do38EPeisH+w0mzP8tyuDzu8rK5bVISBj/U
	RA7ZPVtAMJ2Ja+wOfh/H03E3nYXRmWcPE1YMUzUPzCoMRNzYu3TAXofrF5/oQHDz3boCVTr6ueK
	Ma6U/udaCRIZ/aCsakXyjE/zU+pw9P5Jc9lcOmwsjdzVV5oPzBBBYCXNoMNi4mbpmyuHF1yvI8V
	CAy6CA==
X-Received: by 2002:a17:903:2a8b:b0:215:97c5:52b4 with SMTP id d9443c01a7336-21dd7dccd5amr357030795ad.39.1738647195368;
        Mon, 03 Feb 2025 21:33:15 -0800 (PST)
X-Received: by 2002:a17:903:2a8b:b0:215:97c5:52b4 with SMTP id d9443c01a7336-21dd7dccd5amr357030655ad.39.1738647195075;
        Mon, 03 Feb 2025 21:33:15 -0800 (PST)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea5bbsm86914565ad.150.2025.02.03.21.33.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 21:33:14 -0800 (PST)
Message-ID: <73f81e95-7636-4a55-aa29-d288b20005b1@redhat.com>
Date: Tue, 4 Feb 2025 15:33:10 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/26] hw/core/loader: Add ROM loader notifier
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: richard.henderson@linaro.org, philmd@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, alex.bennee@linaro.org
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-10-jean-philippe@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241125195626.856992-10-jean-philippe@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2X-uNLtfQdOE2m8SuO--k5CZkv-3fGicN2wjE-1hpjA_1738647195
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: Vri3MocfJJrE

On 11/26/24 5:56 AM, Jean-Philippe Brucker wrote:
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
> +    size_t len;
> +    size_t max_len;
> +} RomLoaderNotify;
> +

I would suggest to rename it to RomLoaderNotifyData since it's the
data passed to the notifier.

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

Thanks,
Gavin
