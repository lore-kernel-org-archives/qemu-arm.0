Received: by 2002:a17:906:2484:b0:98d:b2f5:1316 with SMTP id e4csp1442350ejb;
        Thu, 27 Jul 2023 10:14:38 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGdcF2hV/WJgwT18z0ok6cDfsf/3OHQIfmCm5usT/jmbUxC3zZ8kVoyOU23PJZrTebxCHAb
X-Received: by 2002:a05:622a:609:b0:403:ebb2:dd4f with SMTP id z9-20020a05622a060900b00403ebb2dd4fmr134118qta.59.1690478078669;
        Thu, 27 Jul 2023 10:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690478078; cv=none;
        d=google.com; s=arc-20160816;
        b=zYr9vhb1XErFirHnkgDNykUzsuoL5+AXRoy0mBfrzCBsmy7OMxtpiYPNBLcnSb2+e8
         weXhoWJWgD1TI+ol1NSTqiUL2MJXPPNFkOppfKu2Nf7JLiiXSvC1UzqSNDrdxKnl2pKc
         iyUudtM40BEHLV3tK5E2eJ+tSab0XOX2fkUSjvBNAqVpxaRrtR6z2Ej8TeO6NZzQM9vL
         RYl62f5z/bBre8ccrv7OwKoXvsEFBtyA9+Xfc7agiQnr2JpZd4xIToPqau3PTHTQmHjV
         kqRtP5RhFfteVWp9agqe2ezyH0XilLkXVZFquRwDPAZ3+CcC4t0sCIkzuZqOPBzynbZf
         SHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CMtpyiyPv3+t5Uvcv4Tv2aBXS8NdLCmOXzk4TsZHVBU=;
        fh=vaDpLBJmz5JjobJK3RXWYZonZ7WwqDVHFeS4aZ+rLcg=;
        b=IYGFVeUKbq5gkWK5IU8D10f/zjCv9cz82s7uk1qiu/xA2FatTUAsSCjGwpbivPO26B
         rxuPaW8xJBKVqFRuw2n+Xfbj9ScXu14McKTZMhrn5OFe33xy9PtRyS7iWdv/WK4k1ZNI
         EFtEIZNBWbnmeKiLpe83Py7urKFkVKE8NqWNMoWiJmcL9aEOOMIiZaD/arjTpucaIBU1
         FWQ4Emjq6VpyV2nLAZ6CwBxmLgCYqIDx3w1w32E5Lb038jSSe7wq6qpWoHu0azdGu6cO
         D1yPskxNTBaOvqzUFc2mQj11IbcV465FpDQJspqLcvBXZVZrCzXDIJaKCVR1PyK87IdQ
         MW2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nYs6nI7z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g22-20020ac87d16000000b003ff1fe3856dsi1087288qtb.138.2023.07.27.10.14.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jul 2023 10:14:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nYs6nI7z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qP43c-0008FP-F3; Thu, 27 Jul 2023 12:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qP43b-0008Eh-GT
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 12:41:43 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qP43a-0004bw-0X
 for qemu-arm@nongnu.org; Thu, 27 Jul 2023 12:41:43 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fbfcc6daa9so12458295e9.3
 for <qemu-arm@nongnu.org>; Thu, 27 Jul 2023 09:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690476100; x=1691080900;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CMtpyiyPv3+t5Uvcv4Tv2aBXS8NdLCmOXzk4TsZHVBU=;
 b=nYs6nI7zVA1JckfJ+7cB0+sGRuS0zl82mJgutdvTjdvYO8BqJycwmX1KXQTgbSOkTi
 dCQhBWKPixG/VjPCGvT1SxNxH5aZf7ai+/RnzT6g7B+kytb3ZNGyL+brm67N7HynknDX
 B3fMgUsl8o3Jxn6I3vJHpxm/EkZAbQOlvaTUQ2VjM3kVykfGrEHHgrD5yA64k8HKb+GM
 jyTKeVPXjUvRw54u37fp9Ecm7jRQ4E8mOWneURvzPDIbSLs8EQ3FLU/DK7Gmxy9DJ+n0
 sqlm/LtaFa1SHTY82M1G2J0Sg6tn+dPbpB/NRtzYKN/4AxhtKbhp2WPFJUBu8LksK96n
 cuTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690476100; x=1691080900;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CMtpyiyPv3+t5Uvcv4Tv2aBXS8NdLCmOXzk4TsZHVBU=;
 b=fZvi/Gqw98zEqmL+zu8KTW9OFCEmG4z/MroYRxdNjKK8GV3r+DZ51sIyPW6S1i7Y0I
 ZjhgkWoBSjgY55TG0198iW/Sam1LQVxS9+VXJ9vq1OjxGs6hZI/44XI2wOsHLoFyNX9C
 KvMqkB6tRGIQ0sLK4hsy5dm+l+hJ3Bki8JbbYuvdIQymZiHYFd0b9DcMpSkcWEhiAcvz
 EboYnffyTMAmcoAFOR82iTmu62lTSsWMWGceSIWDWBHSm62XmTn0tuxztfv7Os7tkat1
 u72FmV6fg34rVunPx0bVvmFG8bM9a9IshJ+9gOTXfgH7rvOGHaBx0MJtO9A0P8yhjNFY
 sQ/w==
X-Gm-Message-State: ABy/qLaX3Kus+s4wTtRJwMDg/V97DLtKq3O8GPaDZFhxeYvKpp5psTyM
 IjnvbkFI5voEYF0mNzvgcZTewwvfIMGFv2R11BzC3w==
X-Received: by 2002:a1c:ed16:0:b0:3fc:9e:eead with SMTP id
 l22-20020a1ced16000000b003fc009eeeadmr1969200wmh.20.1690476099832; 
 Thu, 27 Jul 2023 09:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690385928.git.jcd@tribudubois.net>
 <84ace91e6076ed4460fb6c1f9fe699660dda30d5.1690385928.git.jcd@tribudubois.net>
In-Reply-To: <84ace91e6076ed4460fb6c1f9fe699660dda30d5.1690385928.git.jcd@tribudubois.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jul 2023 17:41:28 +0100
Message-ID: <CAFEAcA-sjHQK=VmQ4TYEY73C5vpxQBME1j8eF=ZXUkWTb4naTw@mail.gmail.com>
Subject: Re: [PATCH 1/3] Rework i.MX6UL device implementation/instantiation
To: Jean-Christophe Dubois <jcd@tribudubois.net>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3dDBpj5iXVbm

On Wed, 26 Jul 2023 at 16:55, Jean-Christophe Dubois
<jcd@tribudubois.net> wrote:
>
> From: jcdubois <jcd@tribudubois.net>
>
> * Add Addr and size definition for all i.MX6UL devices in i.MX6UL header file.
> * Use those newly defined named constants whenever possible.
> * Standardize the way we init a familly of unimplemented devices
>   - SAI
>   - PWM (add missing PWM instances)
>   - CAN
> * Add TZASC as unimplemented device.
>   - Allow bare metal application to access this (unimplemented) device
> * Add CSU as unimplemented device.
>   - Allow bare metal application to access this (unimplemented) device
> * Change CAAM specific memory from ROM to RAM.
> * Add/rework few comments

This generally looks OK, but please can you split
out "refactoring, no behaviour change" changes into
separate patches from "change the behaviour" changes ?
The refactoring bits can all stay in one patch, but these
changes:

> * Add TZASC as unimplemented device.
>   - Allow bare metal application to access this (unimplemented) device
> * Add CSU as unimplemented device.
>   - Allow bare metal application to access this (unimplemented) device
> * Change CAAM specific memory from ROM to RAM.

should not be in the same patch with them.

It would also be handy for the commit message for the CAAM
patch to say why we want to change it to RAM.

thanks
-- PMM
