Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1298787ejc;
        Fri, 3 Mar 2023 08:53:45 -0800 (PST)
X-Google-Smtp-Source: AK7set+3Y1Eem1hGND84AWTiWkBs2rK+/GgEyVhYh1uvyh5ymoRf5OoWM/3Bzlk0vBUAJ79aDSDs
X-Received: by 2002:a05:6214:d4c:b0:56b:f28e:628a with SMTP id 12-20020a0562140d4c00b0056bf28e628amr4431257qvr.6.1677862424991;
        Fri, 03 Mar 2023 08:53:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677862424; cv=none;
        d=google.com; s=arc-20160816;
        b=RoPPsQlwbuxTv7HV0rulULbr7sudN9YezAzNEyDKY4NC8kPXpGTx7O/LDvFAb/hw3s
         GcplkQ4F2+NAEu1KSAlIZ2Ayd5OPbGgfJLujdc+BLV9/0YNbTzzO1fHMgFiEvqTIu8zd
         vslWXsyHrY8KK0bGtHPsFSwWDcvKnLNk93bCVhndMTHgWTxXX6zGWRMwcWFhINy7Inyt
         4ALl05q7mJYtSqpI0QlZUSdK+SQxFckweaAsmBxCQ88Fddv6piNxZtPuvKOdZwBoqPTL
         /yGs+IY/hzWJF78l328qpAremtkzLsRSPGOWBWjnGHnYeUM66Jyhv+w+WdPgqZ/W3JmD
         XANQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=vUiuUCLkGKHbQUlqBxlb0GziU8RIet/YBzg43fKiCvc=;
        b=vsOXej0qbcweScvfuWsf70kpLq9AwS65/KruTayCZqtFIyF+KipMET8sgeTEBc5kj0
         lH9XI1Sxj7ecyxpg5isld7qMgr4qmMwt91ijKN8jbYp3YHu++QNVBjSJWqWHcs0dM1DB
         i4dntvDap7Zahn34Jf8NRQhw8eznuwNKQ33OSNdpytkTQdeqm63LpXNTHTNURAZE8I73
         YfzQFv8tOt29qTgM6szqXSjCT1Fdziw1Qbs0+GI4rcNMvf22TzGo01J+P9txKgI2g6+X
         1LYRntTjdw+zpqKttYzIZYIEtRY3C7kOf2NzgHwb9AFR29qdMzj3t7U9Bfq8yqx02ZT1
         ye9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vcxjXYs+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4-20020a0cf184000000b0056ed2f3049dsi1807402qvl.457.2023.03.03.08.53.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 08:53:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vcxjXYs+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pY8f1-0001Ur-WE; Fri, 03 Mar 2023 11:53:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8f0-0001Uf-Jt
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 11:53:34 -0500
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pY8ey-0003cg-7a
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 11:53:33 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 ce8-20020a17090aff0800b0023a61cff2c6so2668338pjb.0
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 08:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677862410;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vUiuUCLkGKHbQUlqBxlb0GziU8RIet/YBzg43fKiCvc=;
 b=vcxjXYs+kCt4VciFXaVfbe2VotGmL51jd94aGWH5GHHHSUuNLoAKxBHjmxgMXSnSBl
 t9osr78F6B3IiCw2XeuCP9QZenhSPOWykbrmwm0gf+BFfzzjDM0nlV9WieiFmaf8MWM0
 QxkjbP4ue2IVMhHFfVbM0irAMgthTAhOLFfeJ+tWePFK7vHj8K7YhdM0pTQ1x0/hdErV
 evza9a+pRedi3x78dZ3TNMefXoN649nVMZjivNAZEWLszPRcqWNlpjeCgZFAJWwH5tP9
 HJb0FV6swpsG4drYAWGvmypULJK21cBn1lkDcjtWIfJkm8AydWweWOTLmxVUAtJrWehv
 LtPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677862410;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vUiuUCLkGKHbQUlqBxlb0GziU8RIet/YBzg43fKiCvc=;
 b=CfhWTB6Uj0okVyL+QnO94VncoDThsjwKIYUMP1eyglWS3mBtOS0ht/mSwhHsC1HU3W
 Y8NgjBv1AqmgnpoNXOLYZ3bw9MhXoPRWqlUKPRNR6BW1VX+ISIARdDM/T9W0jfO+jwZE
 hGlQn5wg+EmU+0XTiRFTxu/ry9dyVwVIH+t+Rxrj7sq7SALB2BXREmHQaCrIXEsWDxHw
 VPLd3WsMgN0VOGHmNPkq84uIrbDJ7/I1+6e+QFYm3hxOOHH0CiC3CkPKgzbsYjujfieV
 xl/MaYa+RSSEGvrKQ1xOGKYVeqi85DL2bhxrYigbo2PsaoZcyquKAid4tZSi4Qh06guL
 3K9A==
X-Gm-Message-State: AO0yUKW2JCj/Jo7RQOdnpAvB5266ICuugA5AWjJikoQnOfSGKd/uVtXw
 jABVEWZ4zbv1QUIbhhp2tzmI7n1Op5/YOC/NXTJ8Wg==
X-Received: by 2002:a17:903:2581:b0:19a:8bc7:d814 with SMTP id
 jb1-20020a170903258100b0019a8bc7d814mr922242plb.13.1677862410636; Fri, 03 Mar
 2023 08:53:30 -0800 (PST)
MIME-Version: 1.0
References: <20230223204342.1093632-1-richard.henderson@linaro.org>
 <20230223204342.1093632-8-richard.henderson@linaro.org>
In-Reply-To: <20230223204342.1093632-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 16:53:19 +0000
Message-ID: <CAFEAcA9=+NU6M-NHt26+eqNHETTLpohNsMUo1k9LA9D2inWb_g@mail.gmail.com>
Subject: Re: [PATCH 07/13] accel/tcg: Move TLB_WATCHPOINT to
 TLB_SLOW_FLAGS_MASK
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: SCx6pVEVDsek

On Thu, 23 Feb 2023 at 20:45, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This frees up one bit of the primary tlb flags without
> impacting the TLB_NOTDIRTY logic.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> --

I think I'd need to look at a tree with this code in it to
review the change, and unfortunately patchew failed to apply
the series :-(

-- PMM
