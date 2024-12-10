Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3560666njb;
        Tue, 10 Dec 2024 11:07:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXkbpulrEDkLeBeNb8t/fYq/HAnAVA0N8ox3gT3ia4sjnYhC9ElwtwGK3G09unCpzhqWlYnlSe7LVwatQ==@linaro.org
X-Received: by 2002:a05:600c:3b94:b0:434:f0df:9f6 with SMTP id 5b1f17b1804b1-4361c346814mr108875e9.3.1733857634085;
        Tue, 10 Dec 2024 11:07:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733857634; cv=none;
        d=google.com; s=arc-20240605;
        b=cbb2+wsoHg05qkFBdTqdtVB94bOnGjtpSzBGMKQvCMeXDqbd5wuDtolnkj9V2S2+f4
         kOnuhHy+mVPxM3ShTsoIBshFS06f6ccxJ7rM8gRoWnwCvUCg6k+tbC4MrzWltGWBuRNW
         M7Q92GrolQpatE5wOeGshPH0qhziZSvd+ZZ+zSpWGwfgntWyn2KHPjrEZ8uc1O8tkprC
         OXpvvlIZYKNy8rnSk7LCinbqj6NfG1N0T0eQ/bBiNo3mdEVXg4MJ4oAgbqxKYRyhIw++
         uaJ02d3etG2j1vIpze7liQpY0tPx+jHvdM6q88JRPDKJIhMngDYKbJ39hHMm1pBFf0e7
         sq8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=5V565qyQf+kulFcpFLhJbvlPOxJD1fK7OBawhGdtI+8=;
        fh=kHKeEF7S0MHYFMazL6Wan21O9hKZSSyJhc4KewkD1l8=;
        b=CDA6B+yFZzPHWKisiMnhX4KdfYTR8zchvleo8cXGJKR9ElcFtT/pGipnGf5fr+qdpo
         lLR5yJLmTKCWu7glDjlYOzPSsMWUpGwoNiT67N2Uo1Pf9r1YiMu6Swp88X2i61pHVQFX
         /hIf3brm7dtnDyD/1jEng/GckOlzllZbC8ZW3yhdvxs9LyH/OJRvrTWAs1s6WSCYEDGU
         UxVaRk+OLgbDKy19sk/IgQ9H33ibVS07dc4WWAiCeaDDA5YapHb1UDff6kEtMiUd/7y2
         cW++CgY+OQ1yZjGBegS2pmjBchUWh2qUb7Ps+4mj4tri0D5gKw78n4TLGRkxfYCTF1br
         MvbQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i0FqWAkT;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-434f21161dasor19616625e9.10.2024.12.10.11.07.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Dec 2024 11:07:14 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i0FqWAkT;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733857633; x=1734462433; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5V565qyQf+kulFcpFLhJbvlPOxJD1fK7OBawhGdtI+8=;
        b=i0FqWAkTECZVWxWdM9rTfCFEQsPbjgxiYr4rDklSycx/7nA1TYWkBV+Yl6ruNQXqUI
         nhTZxPehchIEmc1/aVVyM08HQPCzapqbefOTdzKsXFSYLqQPcaagySom5QZm6yvVAQvx
         LRrRWO3b/gy5SQXQLgMwFqujiYSMaFyvaiKhN9qUyYhR+HQ+gvWwQqinwEAQCCHL7EBq
         2elRed6BeykeP2MTpKk8QbXZS7r5XN1R9Ny0RRkPS3xGfw73LDhFjsV8C8IMQfPwDpCx
         lsEorVjYtpIfgbRvNScvUJl4lSwy9uHA9v/LKyGNOqZCr9ZKbKLqkRYdHRkNBbnJRyNK
         38yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733857633; x=1734462433;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5V565qyQf+kulFcpFLhJbvlPOxJD1fK7OBawhGdtI+8=;
        b=ZIVztyLIWgqnQasPzgthGY5vEiqyMVZ/WqodpxareOLpqpHLZm1icPj6ukzRde5IL/
         LnBoaceHC7MIzGRGxOQNGFeUWceJIRjW25IiaXSyuub9Gd0bjbGt9aq473H6/nCuDKQ3
         wey1rfdXkbFQ0V3eTGtrPCTRe98xEV8gT0+LLp+cP67sE8FNps8tRHGRYpec6b1hdddd
         /gQSR4O5wjYbk3jZQ9uUmhASLCc9K0qbHjavYGIECb5yNrWpvdtGYAvvUyesIzLkLkLL
         /E8NHToDCCzPTX45KtQgQ6FVUWACHbSyd8nAiP80q72h6/gwYFFV39ripxQGEgPfshqm
         uIVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJG93PM7Ct3TnvRU+/UWogZmNX8ssc65Wc5tO92WFez3U3co6u4xoeDYhdZ/lrrkFEjCaZ+sEyf3YmUQ==@linaro.org
X-Gm-Message-State: AOJu0YzEAM3QCJapuOTwUJuaayqJ3Eot6ZyD0sUw232a4l2JLgc1Losp
	pHu0DQn2zHVeHCvYy73b4kwWVZsUouAj7kP67/ne0R7uHjWs97Tvexac5rht/P+0MA==
X-Gm-Gg: ASbGnctKjAQ2i2VzrBsdeTLILru3ir+206zQcZ3xZjgTxYLR1dtf3X1lgP1PIA/H92J
	K2CcT4bWLwJ5T2Em2FdZ5PQ5BapfnwhxjImXDfCFcl/2JzWS5fAvfDCDamDyrg05AdnzMVAzMn5
	l1yn5QJQw2plL+FZCYfQhB84TS/wCAYhSRSdu/spsYQsicwK/9xLf6LJiIVhPT7MG4bAPI1gn7S
	zaz3/yhEqOPG20yrSeaiR3M3u8HUWlVL4aFeL4Sicv2NGAeuJgy
X-Google-Smtp-Source: AGHT+IFSCT5yXT0kkOTlqm/Y97/5nqu2pDrpQjmT/FBslfCiuIz79p51FLYlFmyS/Z2eMnRbb6ReWA==
X-Received: by 2002:a05:600c:3ca1:b0:434:9499:9e87 with SMTP id 5b1f17b1804b1-434dded743dmr128768915e9.25.1733857633398;
        Tue, 10 Dec 2024 11:07:13 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43502fef1eesm33604645e9.0.2024.12.10.11.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 11:07:13 -0800 (PST)
Date: Tue, 10 Dec 2024 19:07:38 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.bennee@linaro.org
Subject: Re: [PATCH v3 08/26] hw/core/loader: Add ROM loader notifier
Message-ID: <20241210190738.GD1212502@myrica>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-10-jean-philippe@linaro.org>
 <564df018-6d47-4cb6-b781-5a2e58669da6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <564df018-6d47-4cb6-b781-5a2e58669da6@linaro.org>
X-TUID: gokXwD0mOd43

On Thu, Dec 05, 2024 at 10:59:52PM +0100, Philippe Mathieu-Daudé wrote:
> On 25/11/24 20:56, Jean-Philippe Brucker wrote:
> > Add a function to register a notifier, that is invoked after a ROM gets
> > loaded into guest memory.
> > 
> > It will be used by Arm confidential guest support, in order to register
> > all blobs loaded into memory with KVM, so that their content is moved
> > into Realm state and measured into the initial VM state.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >   include/hw/loader.h | 15 +++++++++++++++
> >   hw/core/loader.c    | 15 +++++++++++++++
> >   2 files changed, 30 insertions(+)
> > 
> > diff --git a/include/hw/loader.h b/include/hw/loader.h
> > index 7f6d06b956..0cd9905f97 100644
> > --- a/include/hw/loader.h
> > +++ b/include/hw/loader.h
> > @@ -353,6 +353,21 @@ void *rom_ptr_for_as(AddressSpace *as, hwaddr addr, size_t size);
> >   ssize_t rom_add_vga(const char *file);
> >   ssize_t rom_add_option(const char *file, int32_t bootindex);
> > +typedef struct RomLoaderNotify {
> > +    /* Parameters passed to rom_add_blob() */
> > +    hwaddr addr;
> 
> This is the buffer (blob) address in guest physical memory.
> 
> > +    size_t len;
> 
> This is the buffer length.
> 
> > +    size_t max_len;
> 
> This is the size of the MemoryRegion ROM containing the buffer.
> 
> Do we need to notify it? You don't use it in your next patch.
> If so, I'd rather have this API returns a MemoryRegion (Rom->mr),
> max_len can be retrieved using memory_region_size(mr); but I
> don't think we need this at all (at least for now).

No I don't think we need it either, what matters is the size of the data
copied into guest memory. I'll remove this

Thanks,
Jean

> 
> > +} RomLoaderNotify;
> > +
> > +/**
> > + * rom_add_load_notifier - Add a notifier for loaded images
> > + *
> > + * Add a notifier that will be invoked with a RomLoaderNotify structure for each
> > + * blob loaded into guest memory, after the blob is loaded.
> > + */
> > +void rom_add_load_notifier(Notifier *notifier);
> > +
> >   /* This is the usual maximum in uboot, so if a uImage overflows this, it would
> >    * overflow on real hardware too. */
> >   #define UBOOT_MAX_GUNZIP_BYTES (64 << 20)
> > diff --git a/hw/core/loader.c b/hw/core/loader.c
> > index 31593a1171..759a62cf58 100644
> > --- a/hw/core/loader.c
> > +++ b/hw/core/loader.c
> > @@ -67,6 +67,8 @@
> >   #include <zlib.h>
> >   static int roms_loaded;
> > +static NotifierList rom_loader_notifier =
> > +    NOTIFIER_LIST_INITIALIZER(rom_loader_notifier);
> >   /* return the size or -1 if error */
> >   int64_t get_image_size(const char *filename)
> > @@ -1179,6 +1181,11 @@ MemoryRegion *rom_add_blob(const char *name, const void *blob, size_t len,
> >       return mr;
> >   }
> > +void rom_add_load_notifier(Notifier *notifier)
> > +{
> > +    notifier_list_add(&rom_loader_notifier, notifier);
> > +}
> > +
> >   /* This function is specific for elf program because we don't need to allocate
> >    * all the rom. We just allocate the first part and the rest is just zeros. This
> >    * is why romsize and datasize are different. Also, this function takes its own
> > @@ -1220,6 +1227,7 @@ ssize_t rom_add_option(const char *file, int32_t bootindex)
> >   static void rom_reset(void *unused)
> >   {
> >       Rom *rom;
> > +    RomLoaderNotify notify;
> >       QTAILQ_FOREACH(rom, &roms, next) {
> >           if (rom->fw_file) {
> > @@ -1268,6 +1276,13 @@ static void rom_reset(void *unused)
> >           cpu_flush_icache_range(rom->addr, rom->datasize);
> >           trace_loader_write_rom(rom->name, rom->addr, rom->datasize, rom->isrom);
> > +
> > +        notify = (RomLoaderNotify) {
> > +            .addr = rom->addr,
> > +            .len = rom->datasize,
> > +            .max_len = rom->romsize,
> > +        };
> > +        notifier_list_notify(&rom_loader_notifier, &notify);
> >       }
> >   }
> 
