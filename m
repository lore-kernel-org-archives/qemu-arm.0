Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp945616ejj;
        Mon, 25 Mar 2024 13:47:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWq7zjXEzQiHT+tKQpT6FWygImTRTSVuy4U1b2KdT7rvpdzZkJZMM9dL351okeyzrnLuU9sRXmKyXvub0Yq5kT6NwiSrrrN
X-Received: by 2002:a05:600c:998:b0:414:22b5:c32c with SMTP id w24-20020a05600c099800b0041422b5c32cmr6352807wmp.37.1711399643049;
        Mon, 25 Mar 2024 13:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711399643; cv=none;
        d=google.com; s=arc-20160816;
        b=tAX/UNqmas+4kK14SAGlPTOcBLWu161lRLY2g9gdK1+mjrdHDwYZCu1AIqowzjZNYC
         HQ7Ru69ctrdzWYczUgM66H4fk7J3DAN7MKHBVWEB4t1y/RF8GrhT2SaTei8lIMA5i8i5
         9bDu+HdDWeI5jBx9L1t0bcUK3Lp4X1uDaB1pCU3u0Ex4pR3mc8nOYeutBI8tNVl8mGjp
         UD8rh0Ihmdf/sYqYw8skMBo53qEDvmdf360wQOLuLmHFXQDfoFaPJqIpSJSkfLoL/Sk/
         6xa/P1uqNgzVQGgOEcactcZbfCiDaD9qODltDvSQBtILa5EkDvDMZ/HaDSyWk4Pujzaj
         acYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=KzzT5/g7h3BtKN08HVpS/NBgjLGvcyxBh480N/I/y6A=;
        fh=0NwkkDocMhJD5g3bLM/hh3VO/rvxs/SIoHh0KvcqNNU=;
        b=LCowKDCZV5uxQreo2I89tdlRBG7raRQFO6g8MlH30If4puO/jTQQvRazcKwdr9K034
         rMdPA2+9AYVU3Bna2l/9GUrSOFwoqZWtLjjvb6DzvnlNpdYfklinDneqMvjg+E0WP68z
         Gak+DJZtFOdPT2u+OxRgs+ujuXp9dja58LkLSW1ex+ck7yNRWdpjEQGBXZLC7z6ImwdZ
         fuqM8KSwXqMgbGYu/YmnkUKVr+KJzG+/1uOPlGWBrYtNABJfdQioDYlJPx1oZkjXPV4n
         kOD/vgl2j7grjS7dXLALe6lY4n7X6tscOBazh6owPFPEDbuWFP+BqM6gQNCBgqhut5WC
         z3cg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=szaVnlXV;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <smostafa@google.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id jn18-20020a05600c6b1200b004147dcf9fa8sor213392wmb.6.2024.03.25.13.47.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Mar 2024 13:47:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=szaVnlXV;
       spf=pass (google.com: domain of smostafa@google.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=smostafa@google.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711399642; x=1712004442; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KzzT5/g7h3BtKN08HVpS/NBgjLGvcyxBh480N/I/y6A=;
        b=szaVnlXV3F9q/SfQpI5uDeOr5vjrT7Qtyt6Rl5X7vcFrwFiuzHYg3MIZ1xom1BTaVh
         t9Qa7Yy/t0jn2VK0Nb7WMeFiCfJOtMtQJDubuE6+NkLiVRQejidSlFDuXzhtcL9krZM/
         1BhhmnS+AKQPEsLUkaGBCX/t+uYoKpq5E0gPbB4OnTrCNk8GhKUOOOORcBloUn04PRhr
         yDmi9Sg9QBBv8MZd2Tw7SAuMRxt+dn9Q4cP4L/4krTQSaLgWSs+vHb2SNVRhoXogFzPm
         1uNHjaZEzIBSbb8LxfyFNGpSdgNEb45VWoUJpob5wXw/tw3BU8X+luAoMUG7DFVEFtSI
         sDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711399642; x=1712004442;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KzzT5/g7h3BtKN08HVpS/NBgjLGvcyxBh480N/I/y6A=;
        b=cnyqBiLhQSnEc7/BDje094CMJ2J29bty4VoSWNbbYRXgVFgxJgZbtzHlNPujOwNOE2
         IU6RaSIAm7qiniWU+xyLScxocx+BqJe8nAqG7qWV98FinaF2kpvHIamtE+/qKE1sKYxk
         +qv6wEAoo9h6vlpWJ8Oa39cPRs3z45xwar4w6ByouViNJocqEmE6FPK0Y+5IZg97e3VB
         LtJWhSC/a1ahjgSRWrDt2ygO6dNW1tjegEAEuEUQd3VXOc2C9OvSxAEo+yv2z490nO6p
         HTW4DcnkJ96Kot5EyGI7r40SgMbZNpRfkOWsgmEQJPXTOKgwO3Gdn60Zr+uOAvtzFkHs
         sp3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcAUbX23XMfFBztZUm9vXZMBFFtyXQKYak72cLJYm//va9ta4dX6QQsxqgFm87vh8+QpyiXP89OFYiHvXuGsa6becAiLWN
X-Gm-Message-State: AOJu0YzjXihgt+jWUwLhBmqGqi1yLNnVV6+pHqrNJhUqSTwfIEeFMhcD
	oIGQiNbtZGkiuH7b803S9HZ2F11PGLmKVib5jRdRoKtFXQAQKx5zdKs0gWSUvQ==
X-Google-Smtp-Source: AGHT+IFX0D1hkRYCJNUuU0gq4lc3j5XsVVwR7qg72xtqIYu/WkP/8t8GeqC2aDlNPKDtdVU3DvlO/Q==
X-Received: by 2002:a05:600c:3793:b0:414:7f46:95f with SMTP id o19-20020a05600c379300b004147f46095fmr11078wmr.5.1711399642503;
        Mon, 25 Mar 2024 13:47:22 -0700 (PDT)
Return-Path: <smostafa@google.com>
Received: from google.com (180.232.140.34.bc.googleusercontent.com. [34.140.232.180])
        by smtp.gmail.com with ESMTPSA id d9-20020a05600c3ac900b004148dee09afsm119163wms.14.2024.03.25.13.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 13:47:22 -0700 (PDT)
Date: Mon, 25 Mar 2024 20:47:18 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Julien Grall <julien@xen.org>
Cc: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, jean-philippe@linaro.org,
	alex.bennee@linaro.org, maz@kernel.org, nicolinc@nvidia.com
Subject: Re: [RFC PATCH 07/12] hw/arm/smmu-common: Support nested translation
Message-ID: <ZgHi1s3RCayh6uyp@google.com>
References: <20240325101442.1306300-1-smostafa@google.com>
 <20240325101442.1306300-8-smostafa@google.com>
 <bd24dc1a-d474-4cc7-87f9-2d5059a19602@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bd24dc1a-d474-4cc7-87f9-2d5059a19602@xen.org>
X-TUID: i5FYlYoSXi6Y

Hi Julien,

On Mon, Mar 25, 2024 at 02:20:07PM +0000, Julien Grall wrote:
> Hi Mostafa,
> 
> On 25/03/2024 10:14, Mostafa Saleh wrote:
> > @@ -524,7 +551,7 @@ static int smmu_ptw_64_s2(SMMUTransCfg *cfg,
> >           tlbe->entry.translated_addr = gpa;
> >           tlbe->entry.iova = ipa & ~mask;
> >           tlbe->entry.addr_mask = mask;
> > -        tlbe->entry.perm = s2ap;
> > +        tlbe->parent_perm = tlbe->entry.perm = s2ap;
> >           tlbe->level = level;
> >           tlbe->granule = granule_sz;
> >           return 0;
> > @@ -537,6 +564,35 @@ error:
> >       return -EINVAL;
> >   }
> > +/* Combine 2 TLB enteries and return in tlbe. */
> > +static void combine_tlb(SMMUTLBEntry *tlbe, SMMUTLBEntry *tlbe_s2,
> > +                        dma_addr_t iova, SMMUTransCfg *cfg)
> > +{
> > +        if (cfg->stage == SMMU_NESTED) {
> > +
> > +            /*
> > +             * tg and level are used from stage-1, while the addr mask can be
> With the current approach, I can't boot a guest if I create a dummy stage-1
> using 512GB mapping and a stage-2 using 2MB mapping. It looks like this is
> because the level will be used during the TLB lookup.

Agh, I guess that case is’t common with Linux.

I was able to reproduce it with a hacked Linux driver, and the issue
happens in smmu_iotlb_lookup() because it assumes the cached entry has
a mask matching level and granularity, which is not correct with
nesting and I missed it, and fixing the mask is not enough here.

Looking at the mask of the found entry, not good also, if there is
disparity between stage-1 and stage-2 levels we always miss in TLB
even for the same address.

> 
> I managed to solve the issue by using the max level of the two stages. I
> think we may need to do a minimum for the granule.
> 

Just fixing the granularity and level, will alway miss in TLB if they
are different as granularity is used in lookup, I guess one way is to
fall back for stage-2 granularity in lookup if stage-1 lookup fails,
I will have another look and see if there is a better solution for v2.

But for now as you mentioned (also we need update the IOVA to match
the mask), that just should at least work:

diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
index ef5edfe4dc..ac2dc3efeb 100644
--- a/hw/arm/smmu-common.c
+++ b/hw/arm/smmu-common.c
@@ -572,21 +572,13 @@ static void combine_tlb(SMMUTLBEntry *tlbe, SMMUTLBEntry *tlbe_s2,
                         dma_addr_t iova, SMMUTransCfg *cfg)
 {
         if (cfg->stage == SMMU_NESTED) {
-
-            /*
-             * tg and level are used from stage-1, while the addr mask can be
-             * smaller in case stage-2 size(based on granule and level) was
-             * smaller than stage-1.
-             * That should have no impact on:
-             * - lookup: as iova is properly aligned with the stage-1 level and
-             *   granule.
-             * - Invalidation: as it uses the entry mask.
-             */
             tlbe->entry.addr_mask = MIN(tlbe->entry.addr_mask,
                                         tlbe_s2->entry.addr_mask);
             tlbe->entry.translated_addr = CACHED_ENTRY_TO_ADDR(tlbe_s2,
                                           tlbe->entry.translated_addr);
-
+            tlbe->granule = MIN(tlbe->granule, tlbe_s2->granule);
+            tlbe->level = MAX(tlbe->level, tlbe_s2->level);
+            tlbe->entry.iova = iova & ~tlbe->entry.addr_mask;
             /* parent_perm has s2 perm while perm has s1 perm. */
             tlbe->parent_perm = tlbe_s2->entry.perm;

> 
> > +             * smaller in case stage-2 size(based on granule and level) was
> > +             * smaller than stage-1.
> > +             * That should have no impact on:
> > +             * - lookup: as iova is properly aligned with the stage-1 level and
> > +             *   granule.
> > +             * - Invalidation: as it uses the entry mask.
> > +             */
> > +            tlbe->entry.addr_mask = MIN(tlbe->entry.addr_mask,
> > +                                        tlbe_s2->entry.addr_mask);
> > +            tlbe->entry.translated_addr = CACHED_ENTRY_TO_ADDR(tlbe_s2,
> > +                                          tlbe->entry.translated_addr);
> > +
> > +            /* parent_perm has s2 perm while perm has s1 perm. */
> > +            tlbe->parent_perm = tlbe_s2->entry.perm;
> > +            return;
> > +        }
> > +
> > +        /* That was not nested, use the s2. */
> > +        memcpy(tlbe, tlbe_s2, sizeof(*tlbe));
> > +}
> 
> Cheers,
> 
> -- 
> Julien Grall

Thanks,
Mostafa
