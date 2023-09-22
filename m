Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1206015ejm;
        Fri, 22 Sep 2023 03:35:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdMzuPniV4tEBxfYs2Ovs+w1PHG1ke2JJ1BoQqhxIl1YFkcnIfGcXn/MQYjteXiYop4EHG
X-Received: by 2002:a0c:e24c:0:b0:658:7f94:3978 with SMTP id x12-20020a0ce24c000000b006587f943978mr7817491qvl.13.1695378919976;
        Fri, 22 Sep 2023 03:35:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695378919; cv=none;
        d=google.com; s=arc-20160816;
        b=Pnaj/6Ys7FHyj8ItMFTHa2ImgdyxlV/byu4G3mwu/5cbGqp4ess9KBsAADQq3eBMfb
         8p1HGdFB3LnLHq0lZ8T1GDR7yQFLuCljHScNf4+asUgqTqpt34BfAIwHeaYTp6bzqiKV
         gwWpORMONx/5snlxwuqxcqKFFpJmvPi0kMQJygSN5p0Q5cqdDKuoQm+ikYnXoK0H6a2H
         KlGg9UCGgqu1LWp7eAdx6juo77CW3aU90fD5xDZz1r4ngR4CPAHOMkLDuI/sSPWzs9CK
         h1tfHKEAb2bmdHVux0hVLunKyKbz1R6ytddQvVR9+HgiEsx1Six6kBMkn4Mn2EbU6dC9
         78Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=JrXlyzBdUtKbxgWkhgJFQhQT9nuoQ/EezD2z6dPOrrM=;
        fh=VWuKj5IT3rv5dFF9iSlbu4Bb7v+IVvCNZAx4HyaZ0Tw=;
        b=nWyY+tvIHwj5LBE2huHHzdVPSPjuQxZpJPAjKfxgN2kOJtUxB0eIondevHivoKG7dF
         Uw3W68HxRcSHfRP/8ZeW3tzWe9iBINwR83Abcx+T1wdM+tKslXaFFXZ4cxqBIN47Y8Ds
         nQwvfEeOqmaBF+Bt+Dk3/HlThv3woyudBEaLvpAL6FplMKQKp6U0BKvqdMzOxG6fakKH
         /C+KEgqZHM11RciLLC2tirHQLOVRJZ2RGxGBEOt3q6kLq0VEjOdIQWeFCR9VBemWg+AY
         PsycWpbltWMMAcHTZ89H0PMLmgTC9V+qNWs0tO0ChwBnnd2NWt4jpqfBfU99PkE+uwf2
         BX4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=PAKE9oum;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13-20020a0cdd8d000000b006564df07c82si1983343qvk.58.2023.09.22.03.35.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 03:35:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=PAKE9oum;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qjdUn-00010s-Jt; Fri, 22 Sep 2023 06:34:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1qjdUm-0000yX-3g
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 06:34:48 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1qjdUk-0000UA-9L
 for qemu-arm@nongnu.org; Fri, 22 Sep 2023 06:34:47 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5032a508e74so3029e87.1
 for <qemu-arm@nongnu.org>; Fri, 22 Sep 2023 03:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695378884; x=1695983684; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JrXlyzBdUtKbxgWkhgJFQhQT9nuoQ/EezD2z6dPOrrM=;
 b=PAKE9oumlNq4xn+u39nQK/MAKNN+QBc25GLjlMqIjtPjkOWj7OyyjcyeKPO2WV4EVT
 VtMarDzhi/qe8FNpPLur+u/37V6VnbjP7knb8hiu5OZFbDh6x5t041rBR8RYgP4PLWHv
 OjhbCe0IPFqwb/31of3R8c9z5tUz5ZO8zLgsKnsFZ0NeH01cT9z2NX2s6y46LbCyxFBQ
 incl3Q1mVCyuBHfRk/Nt0+MMMmeTBFL0p4O4py3p1xl3w1Wz3wA5WJsLsrblZhQZPZHP
 X7fJxZx+gD7/Usp26nzxSNnZe/FeuBa3QS5qqu0MiJ0hQtyagVrahL/4pWEaU4bw+5jJ
 hNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695378884; x=1695983684;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JrXlyzBdUtKbxgWkhgJFQhQT9nuoQ/EezD2z6dPOrrM=;
 b=M3pMS0ZxJ4+tuKtSIqkCNjOehYllZCDekbDVrh9Tm3lWBFawVmw2CGVq3Rd7J2J/hu
 VjGtjmlv8PNm1AqHxdJKIPCMbmhJXDe9MRid+zqJFdAHxbi4FqI7pOcaW9Jm5u4waRFc
 hDsdbF7ZNnTQaOA2KdUWlgVWR0IoOW0W77GvAAUag5/J16UsBzDZ0jevTysncdLOrP61
 xj2A1YYKpTMSyUajYBY3uWxOWGdjXmqgoMlU+/DyHu7IfMLGv0GTbmeGqSXPm/S3Ga/8
 lTKCydL4t8yStpnWVnh0hKA8VWCch+IBHQA/lSQjB9GN8MxkruVTMrULQQRzdMzc2lTX
 67kQ==
X-Gm-Message-State: AOJu0YzhNNxNxo+0nc+T5QfN9dZ8eAf63FqxVh5l1ErWwXkMu150Vfaq
 rOpgacz1EkNZi0VbOYmwPCxQoeI2IjiGVgGq5WSMPA==
X-Received: by 2002:ac2:4c22:0:b0:501:3d3:cbc0 with SMTP id
 u2-20020ac24c22000000b0050103d3cbc0mr44865lfq.2.1695378883725; 
 Fri, 22 Sep 2023 03:34:43 -0700 (PDT)
Received: from google.com (203.75.199.104.bc.googleusercontent.com.
 [104.199.75.203]) by smtp.gmail.com with ESMTPSA id
 f1-20020a5d50c1000000b003142e438e8csm4095665wrt.26.2023.09.22.03.34.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 03:34:43 -0700 (PDT)
Date: Fri, 22 Sep 2023 10:34:38 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 3/3] hw/arm/smmuv3: Advertise SMMUv3.1-XNX feature
Message-ID: <ZQ1tvgUOLga21EkF@google.com>
References: <20230914145705.1648377-1-peter.maydell@linaro.org>
 <20230914145705.1648377-4-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230914145705.1648377-4-peter.maydell@linaro.org>
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=smostafa@google.com; helo=mail-lf1-x12a.google.com
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
X-TUID: 15mO7l8EDEhw

Hi Peter,

On Thu, Sep 14, 2023 at 03:57:05PM +0100, Peter Maydell wrote:
> The SMMUv3.1-XNX feature is mandatory for an SMMUv3.1 if S2P is
> supported, so we should theoretically have implemented it as part of
> the recent S2P work.  Fortunately, for us the implementation is a
> no-op.
> 
> This feature is about interpretation of the stage 2 page table
> descriptor XN bits, which control execute permissions.
> 
> For QEMU, the permission bits passed to an IOMMU (via MemTxAttrs and
> IOMMUAccessFlags) only indicate read and write; we do not distinguish
> data reads from instruction reads outside the CPU proper.  In the
> SMMU architecture's terms, our interconnect between the client device
> and the SMMU doesn't have the ability to convey the INST attribute,
> and we therefore use the default value of "data" for this attribute.
> 
> We also do not support the bits in the Stream Table Entry that can
> override the on-the-bus transaction attribute permissions (we do not
> set SMMU_IDR1.ATTR_PERMS_OVR=1).
> 
> These two things together mean that for our implementation, it never
> has to deal with transactions with the INST attribute, and so it can
> correctly ignore the XN bits entirely.  So we already implement
> FEAT_XNX's "XN field is now 2 bits, not 1" behaviour to the extent
> that we need to.
> 
> Advertise the presence of the feature in SMMU_IDR3.XNX.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/smmuv3.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> index 94d388fc950..d9e639f7c41 100644
> --- a/hw/arm/smmuv3.c
> +++ b/hw/arm/smmuv3.c
> @@ -279,6 +279,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
>      s->idr[1] = FIELD_DP32(s->idr[1], IDR1, CMDQS,   SMMU_CMDQS);
>  
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, HAD, 1);
> +    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, XNX, 1);
May be this can be guarded when S2P is present? according the UM
"In SMMUv3.1 and later, support for this feature is mandatory when
stage 2 is supported, that is when SMMU_IDR0.S2P == 1."
So I am not sure what it would mean for XNX and S1P only.

>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, RIL, 1);
>      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, BBML, 2);

> -- 
> 2.34.1

Thanks,
Mostafa

