Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp31161ejb;
        Fri, 21 Jul 2023 02:07:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHL+eNnLqyNKXMfsO4C6/Uz05fXteonRBJCD2up01jV2j2FGaKvlQmeINCiUx/Prn5WxNcq
X-Received: by 2002:a0c:f347:0:b0:635:84a1:7d5a with SMTP id e7-20020a0cf347000000b0063584a17d5amr1774915qvm.11.1689930432918;
        Fri, 21 Jul 2023 02:07:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689930432; cv=none;
        d=google.com; s=arc-20160816;
        b=QmwZOpHDwMfGT6aPs4hG0rwYFpUAKBlonT1F6jHy81syTd79IlnMqqQ8oj7wsGFES9
         vNia+EMzy27RR+ZkLKrDCMO6doA4q3uVRnaNWd9jRjXuseIx2tMme+2qyV7AiJ/LRpyo
         TODndH3I5B1Ap7t4kUpuzsHJfoemhLhlu8kZWwcgAw2dO4bDVtgUohtqKJMSBM+FuI1v
         b0FzQTDgQQyVheTuSOJB1E5AWaplC7TROU288boGj/us52TaK069dz/7JHOh7w5GN7D/
         AyuKgYQFAQA+wrSpoYkQhaoJUlEzpJ4HmaLNa7V1ySjDi3iY7HVuFUGe0b0WoT98bPH2
         SQXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=IxlaObp5N4AxtTbdfRvI/NTiN8hJ/GyIYHuHxVSnhe0=;
        fh=AUWhDBBcQJl/cpkEHjYZxji9DdAuAu9jPeTYApU/3e0=;
        b=YSsM/wWHQk0yZEgL3uEXD4Q7NoSDHU6gpu24Vs+V/v+0e7lntIEkdbF3bdIFYeP8kl
         TMz1fomNis4OET81zZ10c1Ls/xGmaifpfACAJLIdPBJVuq+UsHFBX9ccCbVccxGhT0oK
         Di5epmkanaejycqgrvp32BZyUI+/zjQ69Wxm2LQvv8h132tCYOoQ6DYGut1uAholMzqI
         LBlADfLs9M8sInpGFCZu5CwMkJWE4cwVDC11f2TGnxoCC79kUDQfgK2tLEEzdgfTBMsB
         RgP0oNx3s0mqwDqXY/4vXCMsJ5MTaIN4Zfj9aAmOsf0ABzNFgjbnGUxQIgPX9+WDTvfu
         hUgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hOHnMkpO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3-20020a0cd6c3000000b0063cbb1d4785si1186032qvi.496.2023.07.21.02.07.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Jul 2023 02:07:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hOHnMkpO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qMm6H-0000xQ-Kp; Fri, 21 Jul 2023 05:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qMm6G-0000vl-85
 for qemu-arm@nongnu.org; Fri, 21 Jul 2023 05:07:00 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qMm6E-0005i7-Mu
 for qemu-arm@nongnu.org; Fri, 21 Jul 2023 05:07:00 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fc04692e20so14932855e9.0
 for <qemu-arm@nongnu.org>; Fri, 21 Jul 2023 02:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689930416; x=1690535216;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=IxlaObp5N4AxtTbdfRvI/NTiN8hJ/GyIYHuHxVSnhe0=;
 b=hOHnMkpOJV1rziBDx9Px0OHY7KyG/O3oRYOQka3k7EV4kJRorPthTFfxPD9Kpvmqbc
 VJNciEt6nBaf1E/m7tAnscXrp0zn0Hna9jUmwUQIli6YVneRBcPANsaAxfE7woc3oPHw
 tbTmzGc51oJSSMrY7VBd/vuGoDPO7IH4l+tEs2mxsBLdwIoC8UTstz1N62+FY7KAJYs8
 fybyLt6FhsM78+d0xiiC1+rvrErwPR531MZmujQnKTZGUZCJioz/2ST/IfIqStZ47saa
 WJBco3dFmpjf1rnmOX+oLURAnPJLQ0apxCPs4+v7PNAQMAJDwwy8LkZEa+WkaVN0sc8/
 arMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689930416; x=1690535216;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IxlaObp5N4AxtTbdfRvI/NTiN8hJ/GyIYHuHxVSnhe0=;
 b=IDQFmn5Rm4ZdQThICX7LLogvpnOLCpz8Az2Cml6xFEh2n2QQvRPPvst+T+ZGAMzM2f
 w0PMQXSgkkj/i7Z9nb9yWmqOlEX7lA1R5td16/mZF/n3c+Uc8hVZDttlOIq9AzvHJxV5
 F+lJg++qiUt8iQZryOtEeg3PM24VohACmyeCJI95JTpwKzHybMNZTpaSEa+zQnLJCKMg
 ZJD90e3TIHdzPH+aZGdvAZNonLwvII+PiitlbT9m5XdiuUsSE7nt+k0DRY8DfxyVFABn
 nei8AaNXE4EzoB9zEGX229kJjrSnfQLMoQYdLCmWlmudNOinrw17i0TQzCckAdLvP8Gd
 vpEA==
X-Gm-Message-State: ABy/qLbUsgOU5/xWrc3UjNP/49cS9pvhfqsmZedr1LDPPGf+7tKXgs5T
 OkikP5mQMpkIW/05Aq/CcCG+lQ==
X-Received: by 2002:a1c:7c0b:0:b0:3fb:9ea6:7a73 with SMTP id
 x11-20020a1c7c0b000000b003fb9ea67a73mr985266wmc.23.1689930416433; 
 Fri, 21 Jul 2023 02:06:56 -0700 (PDT)
Received: from myrica ([2.219.138.198]) by smtp.gmail.com with ESMTPSA id
 z20-20020a1c4c14000000b003fc6179e20asm5535825wmf.1.2023.07.21.02.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 02:06:55 -0700 (PDT)
Date: Fri, 21 Jul 2023 10:06:59 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [PATCH 2/5] target/arm/helper: Fix vae2_tlbmask()
Message-ID: <20230721090659.GA778079@myrica>
References: <20230719153018.1456180-2-jean-philippe@linaro.org>
 <20230719153018.1456180-4-jean-philippe@linaro.org>
 <CAFEAcA9Wc00X3oqN2aLP1QeVbv4Ji+8x0a8nDUtgkA3fjyNWQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9Wc00X3oqN2aLP1QeVbv4Ji+8x0a8nDUtgkA3fjyNWQg@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: EXdPEIAS5f0b

On Thu, Jul 20, 2023 at 05:35:49PM +0100, Peter Maydell wrote:
> On Wed, 19 Jul 2023 at 16:56, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > When HCR_EL2.E2H is enabled, TLB entries are formed using the EL2&0
> > translation regime, instead of the EL2 translation regime. The TLB VAE2*
> > instructions invalidate the regime that corresponds to the current value
> > of HCR_EL2.E2H.
> >
> > At the moment we only invalidate the EL2 translation regime. This causes
> > problems with RMM, which issues TLBI VAE2IS instructions with
> > HCR_EL2.E2H enabled. Update vae2_tlbmask() to take HCR_EL2.E2H into
> > account.
> >
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  target/arm/helper.c | 26 ++++++++++++++++++--------
> >  1 file changed, 18 insertions(+), 8 deletions(-)
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index e1b3db6f5f..07a9ac70f5 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -4663,6 +4663,21 @@ static int vae1_tlbmask(CPUARMState *env)
> >      return mask;
> >  }
> >
> > +static int vae2_tlbmask(CPUARMState *env)
> > +{
> > +    uint64_t hcr = arm_hcr_el2_eff(env);
> > +    uint16_t mask;
> > +
> > +    if (hcr & HCR_E2H) {
> > +        mask = ARMMMUIdxBit_E20_2 |
> > +               ARMMMUIdxBit_E20_2_PAN |
> > +               ARMMMUIdxBit_E20_0;
> > +    } else {
> > +        mask = ARMMMUIdxBit_E2;
> > +    }
> > +    return mask;
> > +}
> > +
> >  /* Return 56 if TBI is enabled, 64 otherwise. */
> >  static int tlbbits_for_regime(CPUARMState *env, ARMMMUIdx mmu_idx,
> >                                uint64_t addr)
> 
> > @@ -4838,11 +4853,11 @@ static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >                                     uint64_t value)
> >  {
> >      CPUState *cs = env_cpu(env);
> > +    int mask = vae2_tlbmask(env);
> >      uint64_t pageaddr = sextract64(value << 12, 0, 56);
> >      int bits = tlbbits_for_regime(env, ARMMMUIdx_E2, pageaddr);
> 
> Shouldn't the argument to tlbbits_for_regime() also change
> if we're dealing with the EL2&0 regime rather than EL2 ?

Yes, it affects the result since EL2&0 has two ranges

Thanks,
Jean

> 
> >
> > -    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr,
> > -                                                  ARMMMUIdxBit_E2, bits);
> > +    tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
> >  }
> 
> thanks
> -- PMM
