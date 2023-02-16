Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp478051ejb;
        Thu, 16 Feb 2023 05:09:53 -0800 (PST)
X-Google-Smtp-Source: AK7set9nYVEziDf3jFxTNu9Fy2CFcroUHcA2UUQhIRbz4gz/o0Bvpzc115jmH6xh0sc2Ud2NjJWM
X-Received: by 2002:ac8:594a:0:b0:3bd:a75:1cb with SMTP id 10-20020ac8594a000000b003bd0a7501cbmr3284347qtz.53.1676552992578;
        Thu, 16 Feb 2023 05:09:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676552992; cv=none;
        d=google.com; s=arc-20160816;
        b=I3a74qoILyxv8aKTHA8J6/YoKY6PE4ql2oNyxpx8vc01MlTYy8507nyk+9a6pnrmX8
         YArT+Q0MxJ1Ys9XtPWFn4d3aaapgyV+SDRl/zWGXGkXKQ78VX5gvrPC5Ppos6CkPQNda
         X77ANFI/hgY0NThD2XxslnX7lJqPE4jyLFN93pKNPXUNBL0F/SBw1Y0gE2Pdx4gz7Kfp
         BFcAqlYaCfbNfAeVH0JSJ9xG9vqfYoxAJQk1RKBoh/DsvptnVl0zhLh/i8PoYzwxBAdN
         zI9okpBKPC3dLoPwJLIt3/m14AmsF+lcRhlkCCuDsc8Pr+71QUt+BYiYq+TtLCRZtZIj
         2XKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=8xlSkTxyXfKZH7lMMbTkAafg1qJQfOFwkeB8on/nFpY=;
        b=qK4nShTp0Rl2Q6leT4Q3Hx4fQh6ykDD6p066JE0tMTicwlcnDMbFioCftZgwGsEmtj
         aSlIh8dWtgKEhoRpoYfrd6MbjtVsfLzG9nXuwT/C5SNUIBGtUCBF1DilEX4Jvs85EZER
         bBQxwwpzMHXPJAKV2I3l9bTcAdEcYdWgnglAZHcdQtAjBQJeIow6Z8u7+K4i18EjFC0D
         FhN8eQYhSxSYEYH5NTW+XQEDaV52R18Krf989+ZlKNc1VkzLwd7QEx+VV+WpgYkGeedK
         bhTVJc05vpQ7/nlo71fygtqx69S3ewpyZZGI1OQ+Mtt6DBH0o8RsXUvdpmySWAp25/xx
         vkKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="cY/R4Nj0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m16-20020a05622a119000b003ba31a4972bsi1658281qtk.532.2023.02.16.05.09.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 05:09:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b="cY/R4Nj0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSe1A-0004rJ-UU; Thu, 16 Feb 2023 08:09:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSe18-0004lr-DS
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 08:09:42 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSe16-0006Tu-KX
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 08:09:42 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 o19-20020a05600c379300b003e21af96703so392369wmr.2
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 05:09:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8xlSkTxyXfKZH7lMMbTkAafg1qJQfOFwkeB8on/nFpY=;
 b=cY/R4Nj0hSqSdc1u1ir2qOMhIcBFqHzU93jJ73JTdnSeeZKWdCoKCKPP51v0lMZFKb
 uHu2xxRTUD8bCHW0Zq9jcPdJnw9NKuPlW8dINmkPF6ODqMbndJvBl/7tyuMEDce5R/u3
 IXpLD34ZH9MtLvs/gcWc3frVYbsI2l7gaMNiTONvgG/rh1KluVnTXWi4M5SjUdPcXeUa
 LJ4ZoivOsubyrrzr9r0/gaprn6+HWoldu/yIZOtaiCAY0Dv7ECFDRZzMEV2xjfhRqIzZ
 Q0sgI+PpCtISYCVek0dsIl/FVLQDDelr999tE59K1tKBN+oNSbD2NgZfmIORLhImsXVz
 n4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8xlSkTxyXfKZH7lMMbTkAafg1qJQfOFwkeB8on/nFpY=;
 b=xtisx64rnrMHAewY/nWeefd0EQk2dc0+HmLkGb4Ub+FOf9hgWczhOkWTdiwQ8fCjy2
 5fvGOsyRW4LyYVaSGuxJAR4qAr1eP86/tDDeV319gYT9mlSbPz6RFIGNTTo1QqaZsMSc
 2+Qkh42eCtcq8sSfj8Zs3rrZDkaXgzbSEn9Hxh/Xd2OpoxADL4K8ec2mO3fFlf796MD/
 oLnrs52vixdZxdPsa9kATGOgWZmOFAuaoIzTbPze29C6PjRrGU8x89oPcy/47wcT/wzH
 HqUtyJYQejb/Mrld0o3J9fvlz24yEDb6Q9zrTDbVc7B/WI1jBbTwhmpuOt71YxRtF7VY
 aD3g==
X-Gm-Message-State: AO0yUKUbOabq/mXHSKZ4NRQbIo+ChYhZhM3vcH9HCFoaEYr9Ir7FJ/AS
 GokdySCMM23IcR/BMCXPca4jEw==
X-Received: by 2002:a05:600c:1c83:b0:3dc:434b:39b4 with SMTP id
 k3-20020a05600c1c8300b003dc434b39b4mr224834wms.2.1676552979161; 
 Thu, 16 Feb 2023 05:09:39 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 m11-20020a5d6a0b000000b002c558228b6dsm1459443wru.12.2023.02.16.05.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:09:38 -0800 (PST)
Date: Thu, 16 Feb 2023 13:09:33 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 05/16] hw/arm/smmuv3: Add page table walk for stage-2
Message-ID: <Y+4rDVGJdhnN+p9z@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-6-smostafa@google.com>
 <4e248ff8-3032-0697-d50c-d3b62b072a82@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e248ff8-3032-0697-d50c-d3b62b072a82@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: fb8iy5y1ZGbM

Hi Eric,

On Wed, Feb 15, 2023 at 05:52:39PM +0100, Eric Auger wrote:
> > In preparation for adding stage-2 support. Add Stage-2 PTW code.
> > Only Aarch64 fromat is supported as stage-1.
> format
I will update it.

> > +        uint64_t subpage_size = 1ULL << level_shift(level, granule_sz);
> > +        uint64_t mask = subpage_size - 1;
> > +        uint32_t offset = iova_level_offset(iova, inputsize, level, granule_sz);
> > +        uint64_t pte, gpa;
> > +        dma_addr_t pte_addr = baseaddr + offset * sizeof(pte);
> > +        uint8_t ap;
> > +
> > +        if (get_pte(baseaddr, offset, &pte, info)) {
> > +                goto error;
> > +        }
> > +        trace_smmu_ptw_level(level, iova, subpage_size,
> > +                             baseaddr, offset, pte);
> I can the trace point names should be updated as well (and
> differentiated between S1/S2)
I was thinking we could leave those with stage argument, and only
update trace_smmu_ptw_level to have stage argument as the others.

> > +        if (is_permission_fault_s2(ap, perm)) {
> > +            info->type = SMMU_PTW_ERR_PERMISSION;
> don't we have to different S1 versus S2 faults?
Yes, I missed that, I see setting info->u.f_walk_eabt.s2 should be
enough, this will set the S2 field in the fault event.

> >  int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> >               SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> >  {
> > -    if (!cfg->aa64) {
> > -        /*
> > -         * This code path is not entered as we check this while decoding
> > -         * the configuration data in the derived SMMU model.
> > -         */
> > -        g_assert_not_reached();
> if that's still true for S2, maybe keep that check here upfront?
Stage-2 is checked in STE parsing and throws BAD_STE if not aa64,
which I believe is not correct, however I think we can just call
g_assert_not_reached() during STE parsing, I don’t see added value for
saving this field in SMMUTransCfg if we don’t use it.
I am not sure why this check exists for stage-1 as it is hardcoded in
decode_cd anyway.

> > +{
> > +    uint64_t ret;
> > +    /*
> > +     * Get the number of bits handled by next levels, then any extra bits in
> > +     * the address should index the concatenated tables. This relation can
> > +     * deduced from tables in ARM ARM: D8.2.7-9
> > +     */
> > +    int shift = (SMMU_MAX_LEVELS - start_level) * (granule - 3) + granule;
> can't we factorize anything with the S1 PTW?
> indexmask = (1ULL << (inputsize - (stride * (4 - level)))) - 1;
Yes, I think we can refactor some of these in common functions/macros, I
will do that in v2.


> > @@ -28,6 +28,7 @@
> >  #define SMMU_PCI_DEVFN(sid)   (sid & 0xFF)
> >  
> >  #define SMMU_MAX_VA_BITS      48
> > +#define SMMU_MAX_LEVELS       4
> can't this be reused as well with S1 PTW?
I believe yes, I will update it.

Thanks,
Mostafa
