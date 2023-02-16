Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp465893ejb;
        Thu, 16 Feb 2023 04:56:37 -0800 (PST)
X-Google-Smtp-Source: AK7set/MJiveE4T3DIBQl2qtSUvAKB5A8WkJejGD6Te+QESro+ISVrJ70lFx0f/Fh5Qy71Yqpo0F
X-Received: by 2002:a05:6214:27ee:b0:56e:aeaa:95b2 with SMTP id jt14-20020a05621427ee00b0056eaeaa95b2mr9610696qvb.9.1676552197060;
        Thu, 16 Feb 2023 04:56:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676552197; cv=none;
        d=google.com; s=arc-20160816;
        b=c8/7DXqbiHJGaqjF5ia70U6pZdDG/v/evs/udW08TdD9h7IwUYPkXzehU2VhU15C5v
         qhQVD/NjhdTA9qPTXNBSaF62+cOR6+ei7cK3DO2stUIeKHqvGL0hQ+W7lXo1uMQWtwJ0
         5ykLCA5csMVSqNEorVKn81M+gNjGbma+iYQBfFDgxmnno6XFJvP+UsdxnLZDa1ZdV2Pe
         6zusUGTp2hZcggeAyhPrZGHMc9EY3lRSpatGgOLxRPGSuwKmdxYaVJmaILiqzX2fSQFw
         pZY3L1AM5pTnZUNtwNfMoS2OoRMRdEprXOxcMSXq1k9xUd2A3JNiWxUKwpHcTTuJA+rL
         /5vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=DWNzeXDYa5Q+N3xw5nFPU0mYbAvIsHA93QjIHPil1d8=;
        b=BhAj2L+GH7fayfJc043SZNVowPkMnbDoyVAREetiwFCUKhM/FFDC0UVO48A/QEpSsJ
         r3sngtZjAyv5as8qs0Cansz10CqNOmE9KXP3ykf2pxJQp+Yfl5C6izZBbr+QjmORgW/r
         TJh0Rxg55Kh5db2vB6W1hWymlejMTKmYuSvLEan0Dt18n5ZM0jXFMtJdtohVv5UeLaMP
         cHznh0PDvldzj2qSpOJCxBJpd0mzXvE/V6Q/1uUv7L50HovThbMYkp/Pf+vzB9MPpDw7
         KmNYVK+FgvBxYKkEmJ4GTC5Piy9U9hV+14SFjdXdj4dON7EQ7/zfchmlvM2/5S3EUp7v
         k0KA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=mDXNpzK3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17-20020a0ccd11000000b0056ee5ebb3c5si1172882qvm.284.2023.02.16.04.56.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 04:56:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=mDXNpzK3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSdoJ-0005UW-QK; Thu, 16 Feb 2023 07:56:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSdoI-0005Sf-7R
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 07:56:26 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSdoG-0006Tg-5y
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 07:56:25 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 bg5-20020a05600c3c8500b003e00c739ce4so1554937wmb.5
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 04:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DWNzeXDYa5Q+N3xw5nFPU0mYbAvIsHA93QjIHPil1d8=;
 b=mDXNpzK3YMMWLmQ5Y/tQ2W+6rze0y1afl9wY7IVw/D1GGk4+lg/Lec9a+fAbukKj1H
 lro1DKDlTySKPxoQ727wz4mPSU6BeFOVBpw4X+mMSXYcTHg0q20wCT4i11VoTdoVC2CA
 bRRBv/HIjH+wRK+NgV8oYwUjG8jIswXjyWJD5tqb5KRZjviFjQb4FfjxzT6PBiKiZY62
 briwK5KxD5VsTtmXE6RzBPo1RALFWANEHJux19taPMiO6Mo7VRzXeEMmFZRtW0RjULKq
 hA9OKbAQ2zhU6xsyA1QBOYxSU8vBAWPLHC41ITm20wrE5XoqSV3dcpRrRzWuGdiMHvBo
 APEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DWNzeXDYa5Q+N3xw5nFPU0mYbAvIsHA93QjIHPil1d8=;
 b=knzKulQpRFlp9qq1jRfhr74D0iKXr9N6lTmXBf0kI3EN+uXW+c7Md5lEUUKeyV6DS6
 U+jmLsVVkeQfIc+M5BSLWSvdugBgo84tANY2yUsl6CK05qm0WYxevVVK9/ISTxkJI6Sy
 D/y9BogDdNiVON5oc9qsPy659fHOuR8kPOZ4ofxutQhp8aF2j7IdURzjKdzZbfqqoJRH
 d2Bc6V9poobqFQkOJSX1cLwrbR8Py2q6ercPzB/ermdrPfpe+4lQavi2VTgyQKvDIe2N
 M37y5x6kDDxUXrfURyVoH/3q8ESN4f7V2NDsHIzh7QGbbdK7lD1M5i7ecvNzQVUUFpZu
 5L8w==
X-Gm-Message-State: AO0yUKWD8xvQBeBv/W96i3DBvdcPWgk9U2Nih2bHeJZOjfHGPKOFLCOi
 VDNLiL7J3ROvfDROiKLnoW7V8w==
X-Received: by 2002:a05:600c:1d25:b0:3dd:c896:d2b1 with SMTP id
 l37-20020a05600c1d2500b003ddc896d2b1mr219883wms.0.1676552182336; 
 Thu, 16 Feb 2023 04:56:22 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 b7-20020a5d5507000000b002c550eb062fsm1498474wrv.14.2023.02.16.04.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 04:56:21 -0800 (PST)
Date: Thu, 16 Feb 2023 12:56:17 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 03/16] hw/arm/smmuv3: Rename smmu_ptw_64
Message-ID: <Y+4n8aJkQu/479Ir@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-4-smostafa@google.com>
 <608e2401-83f1-e7c6-af17-25da22df76a6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <608e2401-83f1-e7c6-af17-25da22df76a6@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=smostafa@google.com; helo=mail-wm1-x336.google.com
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
X-TUID: 6kkYpNssbIo7

On Wed, Feb 15, 2023 at 05:53:23PM +0100, Eric Auger wrote:
> > +                          SMMUTLBEntry *tlbe, SMMUPTWEventInfo *info)
> >  {
> >      dma_addr_t baseaddr, indexmask;
> >      int stage = cfg->stage;
> > @@ -384,7 +384,7 @@ int smmu_ptw(SMMUTransCfg *cfg, dma_addr_t iova, IOMMUAccessFlags perm,
> >          g_assert_not_reached();
> >      }
> >  
> > -    return smmu_ptw_64(cfg, iova, perm, tlbe, info);
> > +    return smmu_ptw_64_s1(cfg, iova, perm, tlbe, info);
> May need to rename the trace points as well
> 
All PTW trace points have a stage argument which is set correctly
from stage-1/stage-2 ptw functions:
trace_smmu_ptw_page_pte
trace_smmu_ptw_block_pte
trace_smmu_ptw_invalid_pte

trace_smmu_ptw_level is the only one that had no stage argument, I can
change it to be consistent with the others.

Thanks,
Mostafa
