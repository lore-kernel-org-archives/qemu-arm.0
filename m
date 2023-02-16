Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp511863ejb;
        Thu, 16 Feb 2023 05:52:31 -0800 (PST)
X-Google-Smtp-Source: AK7set/NU/7AUQOg1CrZNpbGNrmwcQgbebT/IHEUYsxp8SeG0zt3ZgqFZpEHwYP433Chm2rAIuiP
X-Received: by 2002:a05:6214:2587:b0:56e:fb4c:c1c4 with SMTP id fq7-20020a056214258700b0056efb4cc1c4mr3613648qvb.14.1676555551085;
        Thu, 16 Feb 2023 05:52:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676555551; cv=none;
        d=google.com; s=arc-20160816;
        b=IunXN1wgL4JyMJVd7uHtYz6oJ3lveXbLzuSJR4JUwIRkIfbUDU+9Sv8Fx1VJkuwLrF
         umJSkMYJSGKTC5/KLQLMhxmpjM6JKGQRxkhdwIpqtdh60xU4JAfZyJ9EMkyLgSjUyKtB
         Q4ak/MVtbRc3sOm3apwnYKUOBdd+vmKWsCyGqLofKvLcP/CWMonmUSrtQGA5H2fpqxE1
         fygk804rwo5Fba4mJqq5Sr64Nl3d1S0uZ4vkZCpaq+/w4Sz+sndbl4EUZAF1JmSGxyfB
         Iakh2RSBvYuB/pGvOMSnOVVAmKLovAEqwFuCNIr/QbHxxJuai1gcxfr3QS0alOKRv6Az
         1l3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=2/13tiYI81FpDKKddFvA7ILvHfUZPvmt2iXRLFgT3x4=;
        b=vmn3yIU8ief9Ht+ZAUBqWK9UccYy1w/3qWlJvIILvCfayevSj9MiY9oC0pFPiMQt7V
         IYsrbggkWbDMOiuZfc8oARsLvJwubusn5u/UygOGjDZvQDAQBO7BJyXQV19ba3H+Yiqc
         uFYn/8Wp63EI+D0JYNQeVG3wuk0mcOHahLhFnuxluJNkkdOG6hejW80PHGtG0zHVY2/W
         BAS+78v6majD7/SSHZvgC7h3GwVHPtf7z0CtF4a7cj3QDf5ePfZFbPuWVRGTjsqfdvTh
         WKV+UsalgKW6SpGPgGnpYXRk4SCr5QT+kH3axFABwY6kAvcN9rN82Q3hu3sFjRtiFtj+
         OeqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=h7VGCGcA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17-20020a0ccd11000000b0056ec0727a45si1264139qvm.285.2023.02.16.05.52.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 05:52:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=h7VGCGcA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSegJ-0007KZ-GB; Thu, 16 Feb 2023 08:52:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSegH-0007Dh-9V
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 08:52:13 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSegF-0006TB-FR
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 08:52:12 -0500
Received: by mail-wm1-x332.google.com with SMTP id n36so895952wmr.1
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 05:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2/13tiYI81FpDKKddFvA7ILvHfUZPvmt2iXRLFgT3x4=;
 b=h7VGCGcAdZB5bW9dXaQVi4uXOdPLZwq4zcwLhIdRpwd4uJrBCSdxiWJTeb30W6m1Bo
 P3viYnWPa/WUsm2gCm/p0YMyMJJAakrbyrwvoVei4o1aPNoMHxMtV3PhdEMtdYIardZ1
 Z1HnRg/4ICUYZbu6y1Ddjev2/YxdyqCnyVt1CJRL0198qKUP1UsgoO3+Xjxe7GIuCtjS
 r41qJQMCmxjf+iOrsF9Hkk9uV9CNs4yZ/Ed+auyXbxRZuSWXeGynH5w2nWevrehlnwdN
 RiHZmnLrGvaggE3Rg6bCQFKhWZubylhV6j6Qer6+LB0S/WGMVKHc01VFx1YCB8r2OPnG
 Hx9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2/13tiYI81FpDKKddFvA7ILvHfUZPvmt2iXRLFgT3x4=;
 b=EfdAJ0gEcEUoTSSKkTK6Vr30CjPj2yAgZSl8f+Bh+5xhNwQ5ftGoQ+lp/e/9s7aRNs
 g/jz+kIFbkVxW4swiK3kXdjDcD2e9zTIH6bwJoyuF6uYJjBJf+ANlVPxmpE6l4htgYwk
 50sSTNM4SCE4j72+t41UvfuWzKxYhvw0uxOEpcfhJZDeh8FyscgQm+A5LJap90Mfh9pZ
 jQbXvfauz7ay+i/+D92eJSLrzm+bkUm9wYH0dUpNe9h0o2rL/DdhmAdug+5miymXhhnr
 axxSkzkY0sTqtWDk437LFIX4p8U41F8yrtjXndqzB8loouraXe4MlhkPWHTS0rMpXP0Y
 YZWg==
X-Gm-Message-State: AO0yUKVBmTgZ1P41KaS//iR7No3i4RyZ2pQDUwQeEx0WTAFJ0jrL0Mtl
 NgyWHoDy65beIbBX41+fOL4iM72pLVU8GM50vmI=
X-Received: by 2002:a05:600c:1d8c:b0:3df:f3cb:e8cd with SMTP id
 p12-20020a05600c1d8c00b003dff3cbe8cdmr224199wms.6.1676555530100; 
 Thu, 16 Feb 2023 05:52:10 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 a8-20020a5d5088000000b002c567881dbcsm1569703wrt.48.2023.02.16.05.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:52:09 -0800 (PST)
Date: Thu, 16 Feb 2023 13:52:05 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 12/16] hw/arm/smmuv3: Add VMID to tlb tagging
Message-ID: <Y+41BbcL2WxCfbTk@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-13-smostafa@google.com>
 <Y+02xgL5RhO3vh6S@myrica>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+02xgL5RhO3vh6S@myrica>
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=smostafa@google.com; helo=mail-wm1-x332.google.com
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
X-TUID: UndKqurE8lYo

Hi Jean,

Thanks for taking the time to check the patches.

On Wed, Feb 15, 2023 at 07:47:18PM +0000, Jean-Philippe Brucker wrote:
> > diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> > index 541c427684..028a60949a 100644
> > --- a/hw/arm/smmu-common.c
> > +++ b/hw/arm/smmu-common.c
> > @@ -56,10 +56,11 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
> >             (k1->level == k2->level) && (k1->tg == k2->tg);
> 
> I'm getting some aliasing in the TLB, because smmu_iotlb_key_equal() is
> missing the VMID comparison. With that fixed my handful of tests pass
> 
Oh, I missed that, I will update it in v2.

Thanks,
Mostafa
