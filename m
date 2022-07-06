Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp4860996lft;
        Wed, 6 Jul 2022 09:52:00 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tkAidUYSm/nkKSSofeGI7sm/LxXF+5fIIcBXhC1ZXPa7DzV5W7ZvaWHahmbHGzyhMfbQ7I
X-Received: by 2002:a25:f210:0:b0:66e:4872:d272 with SMTP id i16-20020a25f210000000b0066e4872d272mr19110266ybe.73.1657126320344;
        Wed, 06 Jul 2022 09:52:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657126320; cv=none;
        d=google.com; s=arc-20160816;
        b=1BHpbdmIXIKOT61cRHhYAOyx+wgsCyZ9cZJc5pi8u/gJss7PvLCViCtWJNBFUWw0U9
         QovnStD3t1wCQUKfqY+I40wJyP1uJfqBVeSYwGafrwiUjOyq2aPN1G3wFoEktcVuEOfc
         ypk6RIx2d18+ICHu53jk7tPZ2BsQXdeDneBLuwsmlTql5GHQQfwvReaRCDmLjDXU3Ig0
         IZWgqb2zS6z1L2R1c2Q6XltauBfMDLu7gvfDK3i+52LaG6+rDQ5Wg/EE7rB4G3eT7L5p
         TK/88me1jC5B6OMlXoUurEDN72hv9wtJmk8mhMUhkR1x3nJ3s+V8IwFkDTqVxbvv8pPm
         ji6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LnY95ebbEKOL3mSLCMi2yyHc/+ogQ4/kJ58kxpMkYr0=;
        b=C8xqnOFHidSLg4udKIGRdcXzQn+1K8r9vdFacV2PxOXTrUHfjojFsP5OLAo8Xb88R0
         rNIdZRvwdVtZA6Z4Itr7bt3KQxxBBNEd7FJunQuvw1i6eBDgLnb2+hL7tWQUdA4/9KTH
         AI5I8aJHS+Q3SBUHvq9ka6Ju1GlKXTX546wvWq1Eowz4LNVrdAjPD3awzqkG509V2bEM
         D2McKMsoERdvFt7p7l82xupS4j8TmyapswW4jDjljm94pLb1M2MdmE/YxB4u4QaP+HhI
         3MYKeDVHj4d+SLvQxRWTJO3PeVctFRiMAhTyDmnLJo1IO2My0w4RCACGYGKuWitXUupc
         +sEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cx26fcEq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 15-20020a81090f000000b0031cb21eb1bbsi10687169ywj.21.2022.07.06.09.52.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Jul 2022 09:52:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cx26fcEq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o98Fr-0002Tn-OV
	for alex.bennee@linaro.org; Wed, 06 Jul 2022 12:51:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o98FP-0002Rc-Qq
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 12:51:31 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:43529)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o98FO-00043a-Bt
 for qemu-arm@nongnu.org; Wed, 06 Jul 2022 12:51:31 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3137316bb69so145958107b3.10
 for <qemu-arm@nongnu.org>; Wed, 06 Jul 2022 09:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LnY95ebbEKOL3mSLCMi2yyHc/+ogQ4/kJ58kxpMkYr0=;
 b=cx26fcEqJdWkYI7I75yK9m+rwBrZ3CRvuaQMKrwnkhwwnqPoBjLxdMjXm99qwheYqZ
 uWf1zlVJftMbw4IGhZRUFuLpb2qzrbfyn3QebiCo5+FFWo2YjFzXL1fIRN2wOtANdLDi
 dkJap1qO11ahbRRHiozMABsrY/ZJJCtj8S6WDqARg6h/QWzaP7eYmQNctODOoVEXWsD5
 R02WkYBlptxCqi7GVty2+ohG9q1ubJ2Bd/SsNJvczJ7Ol5eHDJ6N35gRoEQxdtTWcJKe
 qRoRljdCtNySB9TWmXmsUtZHW6aD4pJ+0IllQ3F4sYihqISYx06MpXVTJtu/9pYIYn5d
 ZIjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LnY95ebbEKOL3mSLCMi2yyHc/+ogQ4/kJ58kxpMkYr0=;
 b=zcX/IZwnse9YysDR7UqFjawU2t8FqwwEUigPBKXKqYmvV3CvGentSRxt9j+wf0mroq
 qfyhviy2NWeAqhJn/AJTFYCMbGVpAkexYCxQ3gmIZsx9tZHKeM72MjYgqiVtbfqO3hJa
 HYor84+dnl8mrhk95fQmp67G3akAauDg57JOkhmCYiyDxdjRctdjpcINYkPkm3EDuGar
 LqshxQqlKk6YIG5KPXC30xvNEk9Dy/VnYcuxl822R1ukFfmqe6IO5lO2YGw2sQQo02Dj
 XZFoYD8WmxmMk2iTc0NJGItKBEjH/LT5qh4wZDx1RdIjyytYgKeVNbsI7Uikt4jI1Dw1
 4uqg==
X-Gm-Message-State: AJIora8UrsvrxlqWeBrl7H3oRtgXHTKKmcyrQ7bHMqW9Yv++yfkJBMtx
 xLTskG+BQNROvM4hFTf9AJAZW1iiMJYU4KtjPB87IKuSGuU=
X-Received: by 2002:a81:6585:0:b0:31c:b55b:dd36 with SMTP id
 z127-20020a816585000000b0031cb55bdd36mr14771488ywb.469.1657126288951; Wed, 06
 Jul 2022 09:51:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
 <20220706082411.1664825-21-richard.henderson@linaro.org>
In-Reply-To: <20220706082411.1664825-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Jul 2022 17:50:51 +0100
Message-ID: <CAFEAcA-dAC=9de3xrTRLZ8eigFGLraKcvHcfUgkQBpqa+PUMFw@mail.gmail.com>
Subject: Re: [PATCH v5 20/45] target/arm: Implement SME LD1, ST1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NYPrMHpn15WJ

On Wed, 6 Jul 2022 at 10:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We cannot reuse the SVE functions for LD[1-4] and ST[1-4],
> because those functions accept only a Zreg register number.
> For SME, we want to pass a pointer into ZA storage.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
