Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp293233njb;
        Thu, 5 Dec 2024 09:23:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWFn4M1svaEKvjlAAVN3LxglVyGcwfF7Lc+/mtXlH02+1ZEnExjN8EmRtozbdgOEva4aOMCr5hMQBsepQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHMZne3Wdc273SS2XuYGqrCT8/leePBfuZGLntfDu4BwYZnx3uDj5ebNikNjOcxp8uwor3D
X-Received: by 2002:a05:6214:f6f:b0:6d8:accb:5a30 with SMTP id 6a1803df08f44-6d8b740ea63mr207730036d6.36.1733419386889;
        Thu, 05 Dec 2024 09:23:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733419386; cv=none;
        d=google.com; s=arc-20240605;
        b=KptoB8mvNfDSLqjdVrkk3SpGx24mpZamUD3zMUB4qI7o81/oB9hSWdXE9F0GmM4dar
         3rXk71dAp2+tkvVIyEg9o3m69hu6DifqVDDJGagdN59YB+2+N2s3qa+KCGeFri2P8XFB
         B9W0saROIEIq2A6cuoR8V5s8cG2DLE/XC86KRZ648AoqlzjEJNHmj04N15HYg0+SJkj6
         P6+QsqsIa7sKHZc3H0Vs+RJ1ti6immRyEa0gvxe4+VGQHoL2j0gh25+6F7QSQbfRigLw
         gOtWBx7eAA6aBcbpIQpjp7tKJRKSo13C07jeTsA1VOGX8x0uxZOFUkHF3ZtC1AsGl6S0
         B/8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KvK6fM6cedGc08xRIHN/JKs4YH6IwlIlR//3KzThG2M=;
        fh=ne6D2Ts3iWLlQdufd4kdEYm+m105kR7G0xmQltLH8DI=;
        b=VKPlPC7htzQnPDYHP+PVL6lEklggpVspyenGFHiuR+6be0Zw82xNnHMYmrlkDjIEE3
         1NG1jpOPyk+lWTIpnrfQjkmokks41RJiIbOvUGiu/vcCXToMWNMO8veHiJhUaNEypRv3
         Cn8u8AhQrdsvS6ogbZU/us+hzvonvzmWVxChnRyX255fx/8G6SrH+WcGsOeUHbNDgzdw
         udt4LtofcXCRbjreedo5OV9tg/QNS4MwThSNjK6Uxo1f6cWxSrzqWDx14Gi74p2weR8U
         EFiFvobIk9iBBEZGi/HB2R7R/WbRiIgcj2lcooWC6vMqpx6244CNqnCC6cwigurqvBrm
         JwLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t9pSOtkg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8dac2ac34si23622346d6.483.2024.12.05.09.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 09:23:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=t9pSOtkg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJFYw-0001bO-BP; Thu, 05 Dec 2024 12:22:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJFYu-0001aq-L6
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 12:22:48 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJFYt-0007U2-8j
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 12:22:48 -0500
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5d340313a4fso533114a12.2
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 09:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733419365; x=1734024165; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KvK6fM6cedGc08xRIHN/JKs4YH6IwlIlR//3KzThG2M=;
 b=t9pSOtkgi2UTyq/QSHAcayErvzwipymsoMbGpdaz6n3SSkzOHODmPDeBFFYlu73kyv
 jJxYYYFDYy0BKza//TG00+yzR+m3DQEJmo6Gaki70f/GoPA3dRq5wphvKOx93x+b6gOC
 zCsq2tg/58hqS+YP/6xyUcL1WPKchP5hw5n0h3accI8lquZImXotY4SpLmyiaCF4YSVM
 YulqsuXuqnDShWUlBPfizXAypxdoLi5DeM6uEedmq/RbmX7mugi8qcAo/v7Lzg4UQJR4
 ucJqktKMdbgU5MPO8IrLaauKTqXFFGW/uCiTpVrSamB5vkGteQwbTTy2ni6NbyEwr35k
 fMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733419365; x=1734024165;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KvK6fM6cedGc08xRIHN/JKs4YH6IwlIlR//3KzThG2M=;
 b=wwGF4ggO0g7o5XJMDolchXUc0MJS9c1pDjITzmQJg6NVFmMnkyCSQ4A+Hbs3sUx+y0
 YN2TJBaAzoHsE4qAJ0o16uARFf/IzGBIn5ULmro3TFRzeEpfT1yRmNQ7YcnUsuDLGKql
 BX8Jo251Wq020hjLne2ROZ/lg53WT+RB18oMaz/JEH0UweY1h820+aan5okEqaBDkT3H
 sjgLF9NnYNF/1IasjMZBNsGHMyLyKwyhVhCQggNBNbx3RzpXdjNcNa7/u/DsnVjoE8uL
 OvsvLVI210XiHQcTvEfb+SEkjB8pvaX0nYhY0GuWPq/eLv7g/ynTvWzl0mx1OcELUoSC
 sTuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV4nrNf28uINUDjelMboHXhAWDu0ifeZB3PVaP1L3j6fDwnhAwzkIkyiu3DkeAM+BE49Yp73gnkg==@nongnu.org
X-Gm-Message-State: AOJu0YxQcGEdOLGAnU5cv3P55bMao82oMGOzAnk+01+A2oxYXl66KWo/
 Ns2Of+z45lGmKjMjQuASrf9XBigwx8PVE0QPTk1l0CUkf3SbZiNT4oZ5FJBYAYwcQ0Dd+ZlX8iu
 DH+5L7ZyU4/GnYCkKZg+8Xk0yeDi6ZzQHgr4BPEg/WV+/LT51
X-Gm-Gg: ASbGncu+P4VwCWQEqzjpQcUisII6SmXhftdOfvaZ/wsnoi02BCs7rBuwyTbElNOXQ80
 lt3ea2dAWQIn+UL1FBtvPL3wNr7TYEHQU
X-Received: by 2002:a05:6402:274d:b0:5d0:c67e:e26a with SMTP id
 4fb4d7f45d1cf-5d10cb4df78mr9300483a12.1.1733419365185; Thu, 05 Dec 2024
 09:22:45 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-8-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 17:22:34 +0000
Message-ID: <CAFEAcA87Mx45zLTnSGOQDRp0SqP0EtaD3WMzDNLf+TF4xXuY7Q@mail.gmail.com>
Subject: Re: [PATCH 07/67] target/arm: Convert RBIT, REV16, REV32,
 REV64 to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: lySTXM1JscOE

On Sun, 1 Dec 2024 at 15:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 137 +++++++++++++++------------------
>  target/arm/tcg/a64.decode      |  11 +++

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
