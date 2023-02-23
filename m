Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp813440ejc;
        Thu, 23 Feb 2023 07:14:51 -0800 (PST)
X-Google-Smtp-Source: AK7set8Jv1IHDC+go2tqlbi/EEeZH51f4VY1v6qJZjyRQ+frlip0UW2zO1hLDbWMOHI3x/Y0Ao2s
X-Received: by 2002:a05:6214:d6a:b0:56e:f640:6e8c with SMTP id 10-20020a0562140d6a00b0056ef6406e8cmr22752080qvs.36.1677165291019;
        Thu, 23 Feb 2023 07:14:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677165291; cv=none;
        d=google.com; s=arc-20160816;
        b=ZER379WWbxxj8DS8ylyLvZ1zewgU2UeSWpt0KIMSv2P1OQFboWrvadFqkmmarOP2vt
         dYaFA7d8n1x9PhE40Dl0DlDLKdophjv8ZKSqN4VcD5KNKWDtT57HZ08Zf+UDJ3TnvvJf
         DxnN9EPi6JSmwly7McShBvuWhWYLc+kN7mJwXoHIGfJk/l0jsWMN1LhJyRiR3v7aX6UT
         4mqHDbfaSkPjBWm3KEc4gXA1Uo8Zvs1o4Osu2ZxvSKc/zMI6UZAZ/BwDfGMySKmFTj35
         0s215GOmcz+RtHPCRjiedmdLR6rOEAQnbBYXuWz3pqosV+7+8ufMI59PcErdNIDb9Kl2
         2jQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IlfosX10H75Fz0MxH8DjYMloZoMUbmny9+yf0k2mNRM=;
        b=MAJCMepCGOXqmnh/n/kfndaix1oZdQGnmKcOGxfLXCORENLdtSRvdJjikKzWmM95oJ
         d4A4JL0ZmlF1KaeaILXg9a5LtvzGnI7HH+kdma60LDlpD/Pcu9J2jf0YbtEfFimO36Je
         6mk7/sxTN71LZ8ZddIUB5U6xb3eTPP7Yu89Z0kJOhDCm2SqvvgsMFWBEW5oIeTwykt8x
         gsQSlDNmjmd3r7jjwnBjZ+0GjhJ0oYirCHsv4Q1OOL/V+MWf/dzsldHM1mOW1pdWPAo/
         kL5YmKqlzhNKDfbSEttz4ObQc1fctduh9eapoMoxVjurJOEuI8wDRHwqZ2/8IJjiPLZZ
         clZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TggfeCKH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15-20020a0c8c4f000000b0056eb40a88fdsi4714911qvb.484.2023.02.23.07.14.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 07:14:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TggfeCKH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVDIk-0003hT-9B; Thu, 23 Feb 2023 10:14:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDIi-0003gQ-Ph
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 10:14:28 -0500
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDIg-0006WB-MK
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 10:14:28 -0500
Received: by mail-pl1-x636.google.com with SMTP id s5so13198553plg.0
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 07:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IlfosX10H75Fz0MxH8DjYMloZoMUbmny9+yf0k2mNRM=;
 b=TggfeCKHDibr+xhYVZfVWHCxyeL9DgiLN1qZOuFVYGLW+JBY6YkIkC31tspMWDc79D
 SE0s0vJ1LaAI5jHPeXCY3aKNL/Jdx2bfsfHMTeIkk4mkaNRiU3d3Vs7xVzLM5erpzPNH
 7meQrwrBszQrt+/inAT+BNk+/DAXbDXMVPXEDEoTm6BjN8uQ6l+C1WLhzp4P5yvgsPO6
 u0gZZchghuxvUY8aU3IGeFrYp4biUCErS0fb7PDz2bPdKLG7d3KB65T7CN7sY5qV7aX2
 uSppHWgczmXDludhxwSiliD44I7cGAFFp5fBwwNJu1qaEqwa2xivqHTWwkJPys40ouFO
 TxOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IlfosX10H75Fz0MxH8DjYMloZoMUbmny9+yf0k2mNRM=;
 b=NMSnkdy5k9tQScVLkF2u5QcDfZbmoa2bmI4D0CBSFNEOPo5MNPe+HwHke3bM4dGlCZ
 fGM73KFN9BqfA0lIKKZPRaPJT6HvWpo7MVMNVVsUv6NSucAnBn7VWj3zvN+z43SsOZdI
 Oz3LhwUBjDahGeVtuLLg3qpfwdywZC+QHApIsvD8+boAyZDQY91nlJz60KTkinFQU63y
 ISSGbJzh1m8fSRaPBi25kSuTv3mQsN3O3KTZQDC8ktdwHpfHY05Lx8pMqpTAIseVZgRH
 /+wrrcyWtGiiHiN0PEqqnOnHyBWwbSe+dJt9qLsG5bTzcANuhb4k55eO7XIQgmoQFTKL
 oLqQ==
X-Gm-Message-State: AO0yUKWlefBrIDkN6FC0ukNDdiNBa9bBnDNJPFe56IR7N4LPdTrVH1vm
 ua5KkuTZyV1eW0L6xr4+c/BzpXeakGCRVAEur0AM5A==
X-Received: by 2002:a17:90b:4d04:b0:237:50b6:984c with SMTP id
 mw4-20020a17090b4d0400b0023750b6984cmr1195006pjb.137.1677165264224; Thu, 23
 Feb 2023 07:14:24 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-2-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 15:14:12 +0000
Message-ID: <CAFEAcA8LQPEAQ34otcgNeqOFbi1PVVs-d3M41ar2jycjJYQF1w@mail.gmail.com>
Subject: Re: [PATCH v1 01/19] target/arm: Make cpu_exclusive_high hold the
 high bits
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: Axw1q16eKKxh

On Thu, 16 Feb 2023 at 03:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We currently treat cpu_exclusive_high as containing the
> second word of LDXP, even though that word is not "high"
> in big-endian mode.  Swap things around so that it is.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 54 ++++++++++++++++++++------------------
>  1 file changed, 29 insertions(+), 25 deletions(-)

This code change looks OK as far as it goes, but the bad
news is that we migrate the env.exclusive_val and
env.exclusive_high values in the machine state. So a
migration from a QEMU before this change to a QEMU with
this change on a BE host will get confused...

thanks
-- PMM
