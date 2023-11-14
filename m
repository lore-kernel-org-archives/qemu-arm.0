Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2190532ejc;
        Tue, 14 Nov 2023 09:14:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5odJkfSTHatDwkyXRIew3LAag8vSqfXhPKGVBM5r8HHthSHfDNuNBwMQDqv7BNSM2ZEFD
X-Received: by 2002:a05:600c:4fc3:b0:405:3be0:c78d with SMTP id o3-20020a05600c4fc300b004053be0c78dmr2972352wmq.3.1699982078989;
        Tue, 14 Nov 2023 09:14:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699982078; cv=none;
        d=google.com; s=arc-20160816;
        b=kAbbkBKY6klD062ECf9zuC8v3SERxrVZEtgInPzKka5TllQdafP2Jpz+pSB1VTV3s8
         yDCF3jqZ8h1d0GWKkhEBalSefLZ+JVMxqou/52N/sfm2XSCsdpxBvwrmeMy/gk8e003j
         ZdJ3snN8crTldEvtokoGfhOlh+MVdIcH1njiZb/+1BlObx9vQm62A3vWT2S/TQWmnugL
         /V8blZy51GHxtiiO/C384Ogjd+c+UVPIbtF13QX0rWHmpvDOREzrTPCKJRouoiLpOaIZ
         vCbkXLnAJG1Ua+Cy3X3ga/Ls/82jEv30LCdXsWfdMlRppDpSeQdRWwJW9fx5CrFySSRu
         wZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=VjIw4Bu3EPxhdXeKr7A+9QZgOLb13tZ8T17jgSOeo4o=;
        fh=c9e8ZdZT8wwMBwRGuaC0xkbztqutrDCy/JBNLaqw0pY=;
        b=Q6Jfo9gbDV9Pyg8bItCYRMxE0UuWFr/trT+dqnjYUNcSxdBVGtegByB1yF7EP2na1F
         2utfEJs7ZteZEbV8lVpHW8rrjy0fPtxWr8HIPy2Be8TcpMFnK8ecAPovaPBlC83yuSb5
         NiFDglAY/z6mB1ULGD0uTAcHhOrovxnRwAr8lL4gQiMVSUvlSyxCHPXP5fiiAP/pi7Zo
         cNmVI4rkXBRIwctngS5Rk+hxWwtZQ8lSi63Au984v+FTbvsTxs8Iwxmq2Iqgl9k1dW/P
         j/FcRE/LTgdofJbaz7aP+IUBkRoJbWA2lAM2TO5hU1EtgcvL/lQ+nGnstos9CjwkZy2/
         fQ/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V07ClREs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do10-20020a0560000c4a00b003313a19d602si4613030wrb.716.2023.11.14.09.14.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 09:14:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=V07ClREs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2wza-0002qj-AV; Tue, 14 Nov 2023 12:14:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r2wzX-0002mJ-BH
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 12:14:23 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1r2wzV-0008E9-Mn
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 12:14:23 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-54796f18365so1618137a12.0
 for <qemu-arm@nongnu.org>; Tue, 14 Nov 2023 09:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699982060; x=1700586860; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VjIw4Bu3EPxhdXeKr7A+9QZgOLb13tZ8T17jgSOeo4o=;
 b=V07ClREs9aD64viu8z8mwUNBMcBnhSZHN9L6prviJAvvltEd+1dJUY4dhtfI/Jmd6r
 whBds/Ju/5G1jmwKvyDsCQbBJkFKw/djPn2Pt4gPb8Mycc/yzCCawS7lsqPkKsfncmqH
 MeDHmH7I6p3skGZYYG7NXsh3hWG45UL0yK7p7uRcSBoyudd3sofcKJS2GXuzWF86mGrC
 dhgk8bY9V8aeK/GA2VziRa+LXReKZlbaKB1nr4Vs3s64hRQpPmZP++cs9CbiP1QvAAYg
 0myGsJA8LvjKjORk2FhBjqgqNmzV7S9W5r5ErW1SD+z5AflfNLyBvf6dMYpaQ1SQuYaM
 jovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699982060; x=1700586860;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VjIw4Bu3EPxhdXeKr7A+9QZgOLb13tZ8T17jgSOeo4o=;
 b=XaO2jdeZ40JfDqKNHVYSaUmP40z3kfy0dGIlWEpKsZB8bVrSa7KLusbmRL2H3ROOxd
 ToObwcEPRhiJOgEJ9dpPDoU0LBCsEoijF7HiKEvS4+bVt37a8AdsLY6jA2cclA2trbRX
 oTSEx/lcOKAPyosBiCKwFMxbDIFrVOKDPxao3We5MHdxyHEOQVPRUsCjuf6N1j9UiYAQ
 0ToGFN8UIsYcSu0fJLekyx+fTd8vARyBpFohXF4DPKYp6Sa8Otpc6W0BKmkMTyPnt+KM
 PsNbtVt6yU0wTRnE9eei/YNSUxkh06A5FalhLb4wKmPkgL8L9jPENoaa57rP4DpOkyDL
 AAMw==
X-Gm-Message-State: AOJu0YywNBEAKOVQDgMr+1pQjTUMO+OmVp47Jg/y1Lze0+JsZ7iyfEXP
 AVq8wdVHVWR4KaAGkAsz01fmsLLJs96Nv07+dcLmtIBaWG+uckP9
X-Received: by 2002:aa7:d48c:0:b0:545:5601:414d with SMTP id
 b12-20020aa7d48c000000b005455601414dmr3139481edr.17.1699982059869; Tue, 14
 Nov 2023 09:14:19 -0800 (PST)
MIME-Version: 1.0
References: <20231114165404.681826-1-ben.dooks@codethink.co.uk>
In-Reply-To: <20231114165404.681826-1-ben.dooks@codethink.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 14 Nov 2023 17:14:08 +0000
Message-ID: <CAFEAcA-MG+ak8+xVyqgpWqmKAryOXJtOckUmA=GysQwnpuz5SQ@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3: ICC_PMR_EL1 high bits should be RAZ
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: zGkLvjQN5bMt

On Tue, 14 Nov 2023 at 16:54, Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> The ICC_PMR_ELx bit msak returned from icc_fullprio_mask
> should technically also remove any bit above 7 as these
> are marked reserved (read 0) and should therefore should
> not be written as anything other than 0.
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  hw/intc/arm_gicv3_cpuif.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> index d07b13eb27..986044df79 100644
> --- a/hw/intc/arm_gicv3_cpuif.c
> +++ b/hw/intc/arm_gicv3_cpuif.c
> @@ -803,7 +803,7 @@ static uint32_t icc_fullprio_mask(GICv3CPUState *cs)
>       * with the group priority, whose mask depends on the value of BPR
>       * for the interrupt group.)
>       */
> -    return ~0U << (8 - cs->pribits);
> +    return (~0U << (8 - cs->pribits)) & 0xff;
>  }

The upper bits of ICC_PMR_ELx are defined as RES0, which has a
complicated technical definition which you can find in the GIC
architecture specification glossary. It's valid for RES0 bits to
be implemented as reads-as-written, which is the way our current
implementation works. Valid guest code should never be writing
any non-zero value into those bits.

What problem are you running into that you're trying to fix
with this patch? If our implementation misbehaves as a result
of letting these high bits through into cs->icc_pmr_el1 that
would be a good reason for making the change.

If we do want to change this, for consistency we'd want
to change icv_fullprio_mask() too.

thanks
-- PMM
