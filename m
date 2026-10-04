Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC01CA5FCE
	for <qemu-arm@archiver.kernel.org>; Sun,  4 Oct 2026 15:09:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xDNpm-0001iq-FW; Sun, 04 Oct 2026 11:09:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDNpl-0001iY-E3
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 11:09:01 -0400
Received: from mail-yx2-x0d.google.com ([2607:f8b0:4864:41::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1xDNpk-0004ht-0a
 for qemu-arm@nongnu.org; Sun, 04 Oct 2026 11:09:01 -0400
Received: by mail-yx2-x0d.google.com with SMTP id
 00721157ae682-8aecf8568b6so5144377b3.2
 for <qemu-arm@nongnu.org>; Sun, 04 Oct 2026 08:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791126539; cv=none;
 d=google.com; s=arc-20260327;
 b=kUXCSnPwE/TDZug1vQJDPoYpi3WZcDH6UFJIuJkaKOLg3QFKbqfbJL1iufeGptIsM6
 oUeuwY67+AJ2rXyX/U32Fj/W/M+Z93ESvpHw1wLQqAx7bYwC7nh6osFIvALFGOavrV9P
 oRXxzvuiYveH1GtzD5KT3DtNnqcsLGl9tbaC1Ml02ntbBdYQuCTmAeMqfzNAV+f8Fme8
 KNcxUjPM6DHGAd81uN4W6ymKbWRDhsowoY8gcbIhmk4ytBWnPCHqlAyG3l7hBxCsadqz
 NF0sIG9Xp1/y2Nebq6cqJUHr8zXhGdwLLwUFQk1HynVqwhqwtb4YvzNoTGqySLUix9l/
 K85A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=swwDlfuawrFpdRpb/+g2X2yVGFLlCvaxB6zYNeM63Ps=;
 fh=kPSgRW3+i1r2IqKmHUVQRX8MfzIOah05j2Im4bXv/6Q=;
 b=VRMiBlQ9D8blMLJtCtzxuuFHq9osVtnjIQXqzslzKQSJB0G5zpvWVmoQjpIAuEmNoR
 4roCpPMc+2hoXPWWLcTPEhyY/JG45cDM0VUZtQ/b0PeDzya0q4AkGm1oOGAq3JKAjHfx
 qmCXMr7WLx9DAvG/gCtVU3XzoHLsULIPHG8z4ppQ2ILO/YXbjGREzyAj5vAMiRj/vizN
 oOIy/LRuIflNzPSyngSfTEGUCDKTCr52+cqNtKaYikWntH3lxkjvDxfZ6YruAYgT0NAr
 h2Pg9V05HJpVgBgM3LcrEnQdlXgA5fveQnWxQ6Az4jJIYa9esfSwSnHjBEKW1CVyh/yr
 gwBQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791126539; x=1791731339; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=swwDlfuawrFpdRpb/+g2X2yVGFLlCvaxB6zYNeM63Ps=;
 b=fLrEdxepqS5zf3nFun8bw6KcJa7d8yzc0InJycW9N5Frxg0nxx0R7p6kic2cTJ4NHc
 xRQG6M/tqRuclcKayirA3BuSwCtjf1vj0x9WIwKQYZLBK+eMI1QRHlCgQxXpC9+tVVmg
 aUpF0IvBFwXH1EcHuFPjmFpFg0A0yRabrOfq/dXUgqeBJ4K2DIK8YaOmGQUGy+gUssOv
 vDmO3IrSFL3o0/VvHO/O7ZCnF6K5J+jT0GZpsSiYTvhGE7gDEteTEVxDQgjdqUhhCjsV
 6bK81sYJjjqaIDVdbzKqV6v6CuofoeY7opPpwB6XLgu804yVqA4R4b8x/yexWxyNvZAt
 FgkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791126539; x=1791731339;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=swwDlfuawrFpdRpb/+g2X2yVGFLlCvaxB6zYNeM63Ps=;
 b=Avk7/0RxpBoTtwPXTojNhmnTm7mH7TLZlkkLS25no8bv3ESQdsy7Z0XWeIjgFOsmQB
 E6wDIZySh04FcOAr97z8K+pR0zZjBh+vvp1LwM3uvk6toyNZSVdAaPUSkBkBYkPELdVG
 meih+EFKjnSy3q9q5arhqMEde+Ns3Zy/Mt34BAQEM4jvXzTJoYrKtnzQEhOOLLjVnVfN
 JldjyJqX6pIDPW11sJm1Dc0VyluzO7EQy6tPYUGa27L95nuji1ok8ri8HbKbzc9IVAth
 DpQO+73LtQ+S0NUqd0fmyIT0P6L+YHIQKQN+by6r2LnjOsef2De5D4Q/ivJh+uT0HTax
 BCbw==
X-Forwarded-Encrypted: i=1;
 AKwUvByourHh49u/AEWqzwtbxVLTmw11u2Q1XTnwX2eFZJ57duVLnvncM5htqAsCTBuWEOxEYYNWTc9Dgg==@nongnu.org
X-Gm-Message-State: AFq9FYIfu0p+nUFSpptxaYUDMZ62oNGXumZHha+X1kHSLPNVXFr7dtk7
 zrXsAQQaxSwhEx1BUrVkk+vN2DNDIUnRrjk2rx1PqdtFsKQhSTe3Q9Oe0QSIVEtnrCBwVXTE3hZ
 xXIV1mLbLXGEemaLXSWWkWlECo8fxxEQ=
X-Gm-Gg: AYBFou0fB7+P/xtV9FQ0NmqJ5BSX8rMgySNgSU+tjgS7tilF4PONmNzttXNlH8Il+M0
 oaqMUxpGgDKRKEtcRQjDmBOhVXKyFifISHpHsJuVmEa7IfRS/u+j7Z5I8ph56pEFEt1R2SbF+Fa
 aWorGUbgYUAmTXkT3LngaZ3SoHOO3KVqMHsyb7CFHLTK615w4klT6jzEFz8MPSTglYYl02HnrnL
 qHK70/Ci2Szhl6gaX0xeJIddC3ukNfj47AccuCNcqJ2FLZbci61dLYFf4Efmy7StA12e/HEOiyk
 KCU1SAu5GqeeJPfNQw0Nv0rmYfWeg4csoadkXMfza0DHwXmtAavSBIZJykJbOeKVJaEyITxQ4v0
 8WfUPs5IIgBfTfg==
X-Received: by 2002:a05:690c:85:b0:88f:8384:d446 with SMTP id
 00721157ae682-8ae39aac4c0mr29111447b3.29.1791126538777; Sun, 04 Oct 2026
 08:08:58 -0700 (PDT)
MIME-Version: 1.0
References: <20261004122647.3913-1-shentey@gmail.com>
 <20261004122647.3913-2-shentey@gmail.com>
In-Reply-To: <20261004122647.3913-2-shentey@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 4 Oct 2026 23:08:46 +0800
X-Gm-Features: AclHuK80uxrhMBr9kymKWWSt1x9OX-okUUKszIJeZK8hPz9soArQ3B2pCf1hqXI
Message-ID: <CAEUhbmW4ArGsDv6zKQM2=S7_oayEfKMp1f+uNkYpBXeJv3ayNg@mail.gmail.com>
Subject: Re: [PATCH v2 01/30] hw/watchdog/wdt_imx2: Fix handling of write-once
 WCR bits
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>,
 Gaurav Sharma <gaurav.sharma_7@nxp.com>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Jason Wang <jasowangio@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Bin Meng <bin.meng@processmission.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:41::d;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yx2-x0d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sun, Oct 4, 2026 at 8:29=E2=80=AFPM Bernhard Beschow <shentey@gmail.com>=
 wrote:
>
> Guests such as u-boot may experience inadvertant reboots when configuring

a typo: inadvertent

> the WCR register. Apparently there is a typo in the WCR locked bits
> handling: The locked values for s->wcr must come from itself rather than
> from s->wicr, so fix that.
>
> Fixes: daca13d495a1 ("hw/watchdog: Implement full i.MX watchdog support")
> cc: qemu-stable
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/watchdog/wdt_imx2.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>

Regards,
Bin

