Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3330204ejx;
        Tue, 22 Nov 2022 06:23:06 -0800 (PST)
X-Google-Smtp-Source: AA0mqf49O5cYVA95XbqnxS+v02zev2OkfQVI6JZdn/dw7SYutzVmmxgaDvXzXpkt5VCNENcr/SYH
X-Received: by 2002:ac8:6051:0:b0:3a5:62ca:14e3 with SMTP id k17-20020ac86051000000b003a562ca14e3mr7037520qtm.144.1669126986638;
        Tue, 22 Nov 2022 06:23:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669126986; cv=none;
        d=google.com; s=arc-20160816;
        b=rxPFnu8OUd1JXx4Cot0see/Rz86d1YrIpprCsMw++4plGnRhtdg9wDkw5x1C0DFVk2
         UDacFKKnBSSY7cafJQJJDOKnrCndgoeavXmDaQapZnNTqRbuKTtoZXDt7bmOR1SwW2gd
         TspMJts1jTEeMQOizyXh0HJLIBAbT9iY8D++uf9zAGMYLpo3jci/duB0hyuxMw02gYgJ
         IIg2YcbdGR2yq9dtEO0oadlO6zZAw5730TmEH+1Dm2V3ttzBzXhNrVF1PCbs3MTL56Lf
         7VAzSpFGq9mSWLenK7WEgyIWPWwlM/mwCHJjrn7Gy767vs76pp0MZikR5ggl6OLKwlNR
         ImbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ox8EwBmvAcCek8yD+Q2rfJi3wmvXnFUHXnqQRxVR8+k=;
        b=vvwiaUS8ynErzkmLP0/fpgMX/EzZVIug4VORTJSZlCeSDKJUEc4qu8X+z0kiTatJ4T
         dZTC+cqfAHwHEeD0lzhWuLfzbTFJv8lL3hPgm8Q8Fmh65kbfH5/0RWYz1M8egiJ5H/AP
         nxvaw/JsRJU3DHqBjuApV0ir/et2/wmekpg12K+w3wPH5b+pRsZCDx0Oksj01vVOR7Uy
         dd4asJ005a7Wyiqdi5MXbV6gx08HcR8uC8vZO8v36wDCNPdnnBnRp4OUhCvXOKhjPklE
         TA2s+y9N5Z/Q4Ed0/tWpiiy/sjPxHxDAc3Sz4RqpTBEav/vKk6Ez1UETK3yWCwIDR24n
         31yQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tvfDm0kS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u6-20020a05620a430600b006fa0fed9bdbsi8161254qko.324.2022.11.22.06.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Nov 2022 06:23:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tvfDm0kS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oxUAV-0002RM-1l; Tue, 22 Nov 2022 09:22:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxUAR-0002QW-5J
 for qemu-arm@nongnu.org; Tue, 22 Nov 2022 09:22:32 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxUAM-0003Xx-AY
 for qemu-arm@nongnu.org; Tue, 22 Nov 2022 09:22:30 -0500
Received: by mail-pl1-x631.google.com with SMTP id y4so13796817plb.2
 for <qemu-arm@nongnu.org>; Tue, 22 Nov 2022 06:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ox8EwBmvAcCek8yD+Q2rfJi3wmvXnFUHXnqQRxVR8+k=;
 b=tvfDm0kSiYcdzNMm0hMwf3/v5Wb4SGdH8WEmNpnxmxHcjhyh2CU0Dy9eQCyDf6yJ4V
 Cn1wO+O83bZnhvd4LqnUAl7VojKWv5bKEAnbRILDizYPB+rzMp7QveHnPliuTIlJ3rYk
 RMA5iGI4BJPYBRMFM8zMU1jhpOqCdeJF5VmHMy0UfdrM7mQHAQzr5u2k8MZUoONJ69AX
 ntKXJdSb/2AmecLHbSQ+qYP1+KOt34Awf0d9lzUjqrbhrKr6a5TNkgJo4Mvrsy06yfN9
 iAcC9qYXHh196iLqPF/lvEIOnPxI8VXi2LKJNPesnxlYhDokZC1EfwJbjVzFmgEwU2E4
 S4ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ox8EwBmvAcCek8yD+Q2rfJi3wmvXnFUHXnqQRxVR8+k=;
 b=EPtWy0bZn0Sy8mugzT6Y8mEfUI2DNnevDWz4pE5VPkFHsXPyxKr973opWoLmckjM8g
 sfrNkx+KftRrzbISOp1cy0MWh0Mfp/jmo4843NysLvcEtLapsTc/f1Rwe7p+okgc5U86
 J8Fz3xKFcvla7mwjLAWmU438qMA+NvLkgU0ypgiZQFt4jrj+CpAiHuHgmbv+nJq592N2
 JRvHh1slj6pFptSC4s2H2pmlJi9wBbgYFENiO1PGDZAJiqowEPY58qNYKi8HiVXhLqWO
 KNogPc1Q1xGB9BQHgGdoiL9XPSfMYSN+Bh1KsPhL+8kVi9tbxK7l6nAX0rctkEBkyE5h
 wDPw==
X-Gm-Message-State: ANoB5pkHdwiX1I46xEZvnWygo314xMjeDUBCVgzbwiaJZ7tdhbieZVAq
 pVaX7YglMq4oUuhiN9rguIuogko4QLCuUNRXDI+1HQ==
X-Received: by 2002:a17:90a:7003:b0:212:f169:140e with SMTP id
 f3-20020a17090a700300b00212f169140emr25240542pjk.215.1669126944795; Tue, 22
 Nov 2022 06:22:24 -0800 (PST)
MIME-Version: 1.0
References: <20221112042555.2622152-1-richard.henderson@linaro.org>
 <20221112042555.2622152-3-richard.henderson@linaro.org>
In-Reply-To: <20221112042555.2622152-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 14:22:13 +0000
Message-ID: <CAFEAcA8Btaou=YRo9Af-vO2Du_N4-yP0r4k2Sv2eL78HgFzo9w@mail.gmail.com>
Subject: Re: [PATCH for-8.0 2/2] target/arm: Use tcg_gen_atomic_cmpxchg_i128
 for CASP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: EfL+LViFZYE3

On Sat, 12 Nov 2022 at 04:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-a64.h    |  2 --
>  target/arm/helper-a64.c    | 43 ---------------------------
>  target/arm/translate-a64.c | 61 +++++++++++---------------------------
>  3 files changed, 18 insertions(+), 88 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
