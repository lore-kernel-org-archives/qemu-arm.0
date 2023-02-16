Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp487314ejb;
        Thu, 16 Feb 2023 05:20:56 -0800 (PST)
X-Google-Smtp-Source: AK7set/KCrrVX+h2eY/NHvkEeKkAINJ9s+iFG7upGcnFjFXlNJd5VvQ41NvAzCW5qPe9Dxb/28OR
X-Received: by 2002:a05:622a:1748:b0:3ba:1d3d:2e5d with SMTP id l8-20020a05622a174800b003ba1d3d2e5dmr8084164qtk.20.1676553655974;
        Thu, 16 Feb 2023 05:20:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676553655; cv=none;
        d=google.com; s=arc-20160816;
        b=cHHUSmM6el/3UPEQMwFyoMvYBSidM8M8JL+LGPMDvsZbYZKS3b9tSGdOPP2daXVySN
         j6DTSaSQP4tvxepFrxBJcewsVjFHrhnDcGOWrlnqMJXo9YZ5WBFPcd9U0yiow4Z3djfB
         InYy5WRBSQMlpGZxvbcHlcFPaCKd7imMsKViqFOwJ7UgDQeseDA0dSR80HjRopXK9cdx
         5Co96BhhOLlzCudX0wfsvGtvXZSJAg/3Mo180jZsIPPn8jx6UvLWXC1+fxc/4vTgoxea
         P812/jZ0nPTa9LCiKAE8qF904Qsbi/R6fgCKvAAjDEf8NvkuhrmrGgCFToRTXzsh6RUq
         pmBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=F2Rd/JAkB8zfh2mxfyx84jQXNSZ7sIQycVHTiDTMRbc=;
        b=ngJSogzz2ruCHsOeB1Z5eoxwxRaoFYG0bJeWlu5CBKANio1OOBSMi3Q5wWj+/VR4SJ
         yngMiBjR89RFpRpWNvsnJpIMNygnu4xpgX0ZzPe9tgv0PENa/08XHDixQ28OM2mO/MIk
         9f7ZD3JLVM40gD3lO8DQ8JgkAauJxVzKAMRhvrGJR3MDQnkyyrSaC5vhnHMziVwkkqeM
         12iGpbxhF4SS3qqiRuNQCFX8+tn8OJ8GKOOtosjbqoegdoxXTnA5C7b96jhZ7yEKiB6b
         XsB1VdTQEW9sSt8YsKa6B+R928i7NSN8+9/DxVCF2jGy9qm+KL0HU+aaHdF4Ax+z1GYQ
         oZ+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=oQxq7qjd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6-20020a37b406000000b0073b58c177e0si1284585qkf.760.2023.02.16.05.20.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 05:20:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=oQxq7qjd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSeBa-00046s-FN; Thu, 16 Feb 2023 08:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSeBW-00045s-Pz
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 08:20:26 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSeBU-0003Z3-A3
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 08:20:26 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso4169544wms.2
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 05:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F2Rd/JAkB8zfh2mxfyx84jQXNSZ7sIQycVHTiDTMRbc=;
 b=oQxq7qjdLqp7+v5fwsaiKYdX0aQTLFcDG7e0KpjJu179GyibIo130ELAF7X+ygMMCY
 eimfyAg1GVmXOWroQvFsBSPZXq8iUVZznVnEgEl/qQpMH5Y/ZHDKmX6D/EHBmkJhzxYS
 Bg7Xy49Fzk1f5tuOUvqp9Ir18vT3FrgS/rmEOszDEn2lqiVHelncUzhgKy/qaXkH3XE1
 vEqjngZxlg5Rb4EO5V7tztqhLuZC11UvvcBszBgb2qTvmnAVEQzdT9HIm2KybYtBjoEx
 i1cbqQCiP2iIX6XyvqK1/YaD6OrD5gCKmh3HKurF2d+U6IwhztGTIhrg0UR4EPudQ6Xk
 5p5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F2Rd/JAkB8zfh2mxfyx84jQXNSZ7sIQycVHTiDTMRbc=;
 b=MysEDL1C5+RzTmaUurAr72mNwYxsZVqSZVDkk7rIlBVGK9jFE8ODtHeB/WWDJRRleg
 Ua8WJwX8/XmttBj8QihhA0DftPApE79wAieTdANdrHST5C33YEede9uD6QfbMSdCOewl
 +LSoI1QIMdqPG/eu67z/ELJE3V977A3mL1sDGJnQbG+31EcaCmt7trKY9GCDCSbnHK0F
 /6IpGN/qPJ05fAtDqhpvH/ohJpC8bGAhyERe7SbD2aQeAI1BCGZnF7O2i8afwOnxfKDj
 L0naN4T8fwDdh00QKmN/E0iin5+3AbT7yXw0jLdVFcVHHzVeG/gEPCFP3CCy0aTRRHL3
 sDlQ==
X-Gm-Message-State: AO0yUKW8EdzRsaXXv5+X+I1gHE7+Fd+Bp4RuezKaqDkAtZC+g2Dl/tT/
 QILwubuJiIkSeNxtQUEnEowO0w==
X-Received: by 2002:a05:600c:556f:b0:3de:b7ba:f8ce with SMTP id
 ja15-20020a05600c556f00b003deb7baf8cemr167131wmb.1.1676553622459; 
 Thu, 16 Feb 2023 05:20:22 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 r128-20020a1c2b86000000b003dff2b493c8sm5602673wmr.36.2023.02.16.05.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:20:22 -0800 (PST)
Date: Thu, 16 Feb 2023 13:20:16 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 07/16] hw/arm/smmuv3: Check validity of stage-2 page
 table
Message-ID: <Y+4tkHQum5XEhsiU@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-8-smostafa@google.com>
 <8a051757-8452-5c69-b929-576f8c93e887@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a051757-8452-5c69-b929-576f8c93e887@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=smostafa@google.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 46MEbEkPqkhW

Hi Eric,

> > can have a valid page table as described in ARM ARM D8.2 Translation
> > process.
> > The idea is to see for the highest possible number of IPA bits, how
> > many concatenated tables we would need, if it is more than 16, then
> > this is not possible.
> 
> This rather checks the validity and consistency of the STE S2 fields.
> The patch title sounds a bit misleading to me.
I will update the wording.

> > +static bool s2_pgtable_config_valid(uint8_t sl0, uint8_t t0sz, uint8_t gran)
> > +{
> > +    int level = get_start_level(sl0, gran);
> > +    uint64_t ia_bits = 64 - t0sz;
> s/ia/ipa
I will update it.

> > +    uint64_t mx = (1ULL << ia_bits) - 1;
> s/mx/max_ipa
I will update it.

> >  
> > +        if (!s2_pgtable_config_valid(cfg->s2cfg.sl0, cfg->s2cfg.tsz,
> > +                                     cfg->s2cfg.granule_sz)) {
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                          "SMMUv3 STE stage 2 config not valid!\n");
> > +            goto bad_ste;
> > +        }
> > +
> To me this would need to be integrated into the STE decoding patch. This
> latter shall be self-contained if possible to ease the review
I will squash it, I was trying to keep patches small, but it makes sense
to validate STE in the same patch parsing it.

Thanks,
Mostafa
