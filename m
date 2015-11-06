Received: by 10.182.105.169 with SMTP id gn9csp1109314obb;
        Fri, 6 Nov 2015 06:50:16 -0800 (PST)
X-Received: by 10.31.135.12 with SMTP id j12mr13944054vkd.73.1446821416404;
        Fri, 06 Nov 2015 06:50:16 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x22b.google.com (mail-vk0-x22b.google.com. [2607:f8b0:400c:c05::22b])
        by mx.google.com with ESMTPS id o9si438167vke.23.2015.11.06.06.50.16
        for <alex.bennee@linaro.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Nov 2015 06:50:16 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22b as permitted sender) client-ip=2607:f8b0:400c:c05::22b;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::22b as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro_org.20150623.gappssmtp.com
Received: by vkfw189 with SMTP id w189so15519006vkf.2
        for <alex.bennee@linaro.org>; Fri, 06 Nov 2015 06:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro_org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=zWZrHRpHdAoVuffoairh3oQHt3/HNPmnkVRZ+vfHT7I=;
        b=KWsfBJNQtLYnzOVuTOlk64Rp4WnATI1PbBfc6vClRW+7pR9KVhxBKCMNef/mFZnCdE
         SrS/94f09rQ+45gz9Qc8jrR6NKCnYzBM2XJkBH7lgTaSNXiY+/DBJuLCn4HQ68YbNoEg
         OnFzgJ+1902lEQLKdjFwmFAOxbLbny3ZZw4Bl87L9ORCG5XwACAChhlN3Exx24ExXb8b
         0seKMV1YjWHFpvv3zoevOpIO/atZOqQ86r3G1WTcHEaG86+Z1lVyQ2CLs9ZCyPF2VP/d
         W7lqa2vl0eU50A2cvnbYXbl65DdYxrPZYHFZGp3CPCPxCWX8MrZKEyWOwdDh0OsoPsz6
         1nGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=zWZrHRpHdAoVuffoairh3oQHt3/HNPmnkVRZ+vfHT7I=;
        b=B8oOO7oO2ByEi9qbrrsYJ5vl1jQoNoaL48x5HCRZ5XE4Xn9VC4DXUuM662mPrtjDWC
         xuaNM3Ri2oDjR3qDgCo9ylXHsDq45eVd9el1J4wbUTjjBn+ffPBe+oSOBfDAOA27vbW9
         +zzDI15Hy/fOGS5KMsMrgVITo7tU4TSoCkPISf0/qb30CQT3dubDpubY2kiiCxHpKqWv
         BmnI9kgKiQlDsCYp7QaJz+kHDKGasGkGDFu31rLmmMRq1RtqhCSHmjo51pdiEv+Z3Q6B
         Sz5sJaFU6qJIzQbO8Z3m0BER/BSwPIA8P8ln2fmzHYjUSm1hlC0FqkszN9aUUbzePLyL
         +V0g==
X-Gm-Message-State: ALoCoQm0kOm0vzAmPRPVq9N7s9USY/FMSC429TL3/KnKR5yZBtDu5+ppgP4t2VPvco4gfkqIh6eX
X-Received: by 10.31.8.69 with SMTP id 66mr13606988vki.82.1446821416126; Fri,
 06 Nov 2015 06:50:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 6 Nov 2015 06:49:56 -0800 (PST)
In-Reply-To: <20151106142955.GN13308@toto>
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-12-git-send-email-peter.maydell@linaro.org> <20151106142955.GN13308@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Nov 2015 14:49:56 +0000
Message-ID: <CAFEAcA_9Bv6_ktNJPZ06m4HL3DCmk66vN7T2450atzwF-3EGgg@mail.gmail.com>
Subject: Re: [PATCH 11/16] memory: Add address_space_init_shareable()
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Patch Tracking <patches@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset=UTF-8
X-TUID: SSFxdXZoKzWB

On 6 November 2015 at 14:29, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> On Thu, Nov 05, 2015 at 06:15:53PM +0000, Peter Maydell wrote:

>> +AddressSpace *address_space_init_shareable(MemoryRegion *root, const char *name)
>> +{
>> +    AddressSpace *as;
>> +
>> +    QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
>> +        if (root == as->root) {
>> +            as->ref_count++;
>> +            return as;
>> +        }
>> +    }
>> +
>> +    as = g_malloc0(sizeof *as);
>> +    address_space_init(as, root, name);
>
> Nit-pick but IIUC, address_space_init does not need AS to be zeroed
> so this could be changed to a g_malloc().

I tend to prefer to be conservative about these things,
so I use zero-allocation unless I'm really sure it's
unnecessary.

> either-way:
>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

thanks
-- PMM
