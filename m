Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp829600njc;
        Wed, 22 Jan 2025 06:55:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWncrgb1Kd4N3R1Req6XAHmH31yJ2Lvx50hM58pycotTE/Auk8nPVIymyfUjpGiPZjAuauEJB8vMc9e1A==@linaro.org
X-Received: by 2002:a05:600c:6a93:b0:438:a913:a99 with SMTP id 5b1f17b1804b1-438a9130aa4mr127910765e9.31.1737557754762;
        Wed, 22 Jan 2025 06:55:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737557754; cv=none;
        d=google.com; s=arc-20240605;
        b=EBmBrTbxMnKy2ahqny7Pwbs+38hrq+J+qtpVsSJMVmTeifLsCt1uDJZPr6iEyhG7AC
         rlJK/T39RzCcuzYzUDZyWCHf5u+7E+g4mhDudITi+e06CcjGqfmgfUavRXQ9QUAuxe3n
         AWlx43K0bz46jTWDnNTRl2EZVlGima5fvRGiXCPr9z4hBQNNLsXG0g/p/ftUPDKjr3Ij
         BQe41ltk+8wOtlBWnWVf1zYEHH9W8TD0cE46TWFMxbnSi3AlRPMtJ01uq4EXBqXq1QlG
         Q8rhtjUrhqYLCUacqaCDweiuI3udBymjzABOupC0ZdHB6EeV573RYhxOK5Wu3I1NIdtI
         653g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=egJj4a82EYatey7PDURldUikhwUZAVn4jZM8rkct+9Y=;
        fh=oJpxcHXP9SUxJ4pKFAmmcFUqyfNEzL0TVy3v862FgZM=;
        b=MBM06bdxuUMm+bWv8MlQQ4URtZnMQCuKs7Cf9ScAlStafP/WG3rViDZV9f/Xqm/im5
         jHafgel+zrouBb1fO9Vag5P0VzHC49UHQDVghlvxGDD4KFMvDXhYDBy9AkvhBtGTmYhv
         XemSPWzbaHknCu/ZMSJsbD2PnDz14qcMWUOcDYYiSWYQUUv0mkX8dce4X96nkOhGbAMA
         4k0pun4rCBZNounvGL0TG7jJGSTgcgfL5jjo5GOf+jm8k1lIWJ2QfTLlE+gEa5MAauLy
         QO8DyzOLs+/4/mJcuspBOHcJg1Isl8obEoLKIhlUOwaQcsqs3Z02MdJmTMN2vGfjzZiZ
         6Rgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j/1bnWi1";
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4389049033dsor46478725e9.6.2025.01.22.06.55.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 22 Jan 2025 06:55:54 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="j/1bnWi1";
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737557754; x=1738162554; darn=linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=egJj4a82EYatey7PDURldUikhwUZAVn4jZM8rkct+9Y=;
        b=j/1bnWi1IIUTy9Vvyx2LCf3MbKgyAYRQ5/3ZF6p0KCs7lKrPWn3kd/1lMcQn/C43ZP
         IO89y2iWMkis5TE/EjvKtFLKjNYBs/EJXCQR9ZRgiwsFO3Inph/VOBZ0USkldE+HMLvy
         Nuy6bI+Zsu0wpGENppavxuRs+enNhgYtjhTFcwnAtIrN8dvjpRKOzt7Be3vaq8QTd4DM
         UL+DAR+3d5J3pX5eq+d40rVeDGHyMRlznSNiml+eufL4ENIdW2GKFo4jrnAzzwZ+ZDnu
         rg3WpsdCAY4huuhEAx+Au9bQUtdiHgOZgq4T/mp8I7Z5oD+3AZbEOYSBk6pPjX0b4h8D
         hWXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737557754; x=1738162554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egJj4a82EYatey7PDURldUikhwUZAVn4jZM8rkct+9Y=;
        b=bXhsOwdagDKCfw1mEh/w+URpN758lvKOaZHhnspwHcD/HP+e++USz66A0KpyFwHOei
         l7oJLSaYcHPjoJcSa3HzirpDhaQXCZXE/1qa6FV3MvPw5wZO3Hm/lKrq/1V89idxmRKL
         pPwIv+6mhj5lnBP2mc97+9f05XtSgYlh0sR9b8JNRTZJiB/J0lOoyXrIezNd2ps524O4
         3vtFG14u8oXowbNM6Q1KGgBkRyRy0T4kILUY8JxnMFr0xkIiqx43xOxDW94TDevullG9
         +WBjIkWcDeO/OaJiQPSvrUBr7NjFVRCZPh1+Hlx5JGOHE+SrWg+TzRCdYjh4BxrQdCfV
         GX6A==
X-Forwarded-Encrypted: i=1; AJvYcCV1wtF1QJB7KpxPZ9rkd1Pc+G4JQsabM6QzJDUxi7WLum6Bj07iJ7OO6TtAbTwgCqqyKvwqU4vaM16DEw==@linaro.org
X-Gm-Message-State: AOJu0YwOJZ54dRp9KeLrp0AWuDIKqCDPLAB05raZcIFHJMVtsogUCx1H
	1EwGh0WwDL9I0bV3vOiA4gZ5wcj4pn4RUqZWQaSPOo0OLevpEwUX6liZysE5bnPDIA==
X-Gm-Gg: ASbGnctfHzUDQ6JhKP0HyjIhu+7GRp4ZOtyYyuR/LR/9OsqVmGaoxeD4odGftPvZ3fy
	3ToagiAbjsd3uwICmdOH4KX8vnhHn6Hi7XyLXwmNKbWo29lqBhmi/7EMdOyShHkacGdDZSpWPPC
	qnvG2dGusdgcFbi9SyaO79YPzWlEgr0J6P+Kq8y/SjIhwsGnXr6bRXQH5XKyzakqyucgJXfaAlC
	hcoOjIfeeq3mLHYzHwa5CIv3SPqowNaZtaxZmcqAyU2AqaX9fD9pmGYHGRvm1kUmtVMHrc3zQi6
	4EY=
X-Google-Smtp-Source: AGHT+IHrtFPSJQYW32HgWP5LXT22fBp6dNWGOwlKmAUk/RjmVooB/TxsHOjkwGdTNu7gnbS5fesuPQ==
X-Received: by 2002:a05:600c:3c94:b0:435:192:63ca with SMTP id 5b1f17b1804b1-43891439f04mr172758555e9.21.1737557754172;
        Wed, 22 Jan 2025 06:55:54 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31c7c6asm26795495e9.35.2025.01.22.06.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 06:55:53 -0800 (PST)
Date: Wed, 22 Jan 2025 14:56:18 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.bennee@linaro.org
Subject: Re: [PATCH v3 17/26] hw/arm/virt: Reserve one bit of guest-physical
 address for RME
Message-ID: <20250122145618.GA873449@myrica>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-19-jean-philippe@linaro.org>
 <bed63115-017a-4e80-9581-680fd6f29f4c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bed63115-017a-4e80-9581-680fd6f29f4c@redhat.com>
X-TUID: WR/E2TBwyZ6v

Hi Gavin,

On Fri, Dec 13, 2024 at 10:03:08PM +1000, Gavin Shan wrote:
> Hi Jean,
> 
> On 11/26/24 5:56 AM, Jean-Philippe Brucker wrote:
> > When RME is enabled, the upper GPA bit is used to distinguish protected
> > from unprotected addresses. Reserve it when setting up the guest memory
> > map.
> > 
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >   hw/arm/virt.c | 14 ++++++++++++--
> >   1 file changed, 12 insertions(+), 2 deletions(-)
> > 
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 9836dfbdfb..eb94997914 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -3035,14 +3035,24 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
> >       VirtMachineState *vms = VIRT_MACHINE(ms);
> >       int rme_vm_type = kvm_arm_rme_vm_type(ms);
> >       int max_vm_pa_size, requested_pa_size;
> > +    int rme_reserve_bit = 0;
> >       bool fixed_ipa;
> > -    max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa);
> > +    if (rme_vm_type) {
> > +        /*
> > +         * With RME, the upper GPA bit differentiates Realm from NS memory.
> > +         * Reserve the upper bit to ensure that highmem devices will fit.
> > +         */
> > +        rme_reserve_bit = 1;
> > +    }
> > +
> > +    max_vm_pa_size = kvm_arm_get_max_vm_ipa_size(ms, &fixed_ipa) -
> > +                     rme_reserve_bit;
> 
> For realm, @max_vm_pa_size is decreased by 1 ...
> 
> >       /* we freeze the memory map to compute the highest gpa */
> >       virt_set_memmap(vms, max_vm_pa_size);
> > -    requested_pa_size = 64 - clz64(vms->highest_gpa);
> > +    requested_pa_size = 64 - clz64(vms->highest_gpa) + rme_reserve_bit;
> 
> ... For realm, @requested_pa_size is increased by 1, meaning there are two bits in
> the gap.

I think it's a 1-bit gap: max_vm_pa_size is decreased by 1 for the purpose
of memory map calculation, and here we increase by 1 what comes out of
that calculation, for the KVM IPA size setting

> 
> >       /*
> >        * KVM requires the IPA size to be at least 32 bits.
> 
> One bit instead of two bits seems the correct gap for the followup check?

Yes this check seems wrong for realm, since (requested_pa_size ==
max_vm_pa_size + 1) should be valid in this case. I'll fix this.

Thanks,
Jean


> 
>     if (requested_pa_size > max_vm_pa_size) {
>         error_report("-m and ,maxmem option values "
>                      "require an IPA range (%d bits) larger than "
>                      "the one supported by the host (%d bits)",
>                      requested_pa_size, max_vm_pa_size);
>         return -1;
>     }
> 
> Thanks,
> Gavin
> 
