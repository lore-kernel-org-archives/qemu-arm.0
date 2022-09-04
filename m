Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp1991251ejh;
        Sun, 4 Sep 2022 11:22:09 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6qhguOpqKhwF0dgQrx29hKV4Qoqm+HpbYJY6OM8sg7dCB+lLR8lphqnuqzx/X6opjECCXr
X-Received: by 2002:ac8:5e54:0:b0:344:59a9:865b with SMTP id i20-20020ac85e54000000b0034459a9865bmr36843142qtx.107.1662315728925;
        Sun, 04 Sep 2022 11:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662315728; cv=none;
        d=google.com; s=arc-20160816;
        b=ekfBAXMcDOjeKQ1Z6G+ILisDStX0B16U5yuLXPfUpf3aq+g1d2fdbiJAtvrf5enOkJ
         iGZ63Bv9IswFkpPr2/v/qJBp4qIPR5faYuWTHxgAyGdEMbOwy8lK6fi2+r96gl8YFgHV
         B40e6hem8581PK8Pw42BIBRyHqCJ7feulzJNfLHM00qud9IZB1oZiyQxMSYbQcZDY7X2
         EW8u2PB5CTBAx6+/CpfcFDmGfe6QIdFmtTjBBglC9cFweVsHvMuuuujEpgboZvqJXPAK
         6QBBQq5aFl7wvQa0Cvg9HOoSgJ/Ck88BgCnitFFkDqUhX1HzA8HluWcp4CDhyeLfElAJ
         i3pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=g3Ys1vqCZKhs9PhWoP2A+7O+kDt8sVZUNlfvVykaMac=;
        b=c7+Pd8cA0VSKmGafUfzsp+KH9sTUdIUAJtQqpY/pJUSLsIrjwySJ1h5gsV390ivk+q
         rSpMLxdSgJF+X76e4Wwzz+xpJF5bI8ijqyfhJhrbNxRCNrPuapl4PFhbTT6EtjrOHT7k
         YcUAZ3VIzdzPNknjtOAzy/wpY7Lwz1SoXTCsELz9/4w9eDdA1CGlqMl/IHyogMzMOpd0
         lscRakXHxgEA7uABrKLWuQiUw5mY4h0bydIOlQJLJe259U0vLpiSRyzgPqw2O4l7hc3l
         6uH/LVRLVmVIeaLe0JXC/Ykh2i1sQslY5r+xUz+dIIudOy5V0Z36rfxmhpPjxGqnjhtv
         E3Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FHzTVcsH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s3-20020a05620a0bc300b006bc0137c12bsi4942867qki.329.2022.09.04.11.22.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 04 Sep 2022 11:22:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FHzTVcsH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oUuG0-0004Jw-Fh
	for alex.bennee@linaro.org; Sun, 04 Sep 2022 14:22:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oUuFh-0004Jn-RU
 for qemu-arm@nongnu.org; Sun, 04 Sep 2022 14:21:50 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:34656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oUuFg-0003J8-3x
 for qemu-arm@nongnu.org; Sun, 04 Sep 2022 14:21:49 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-3452214cec6so12024327b3.1
 for <qemu-arm@nongnu.org>; Sun, 04 Sep 2022 11:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=g3Ys1vqCZKhs9PhWoP2A+7O+kDt8sVZUNlfvVykaMac=;
 b=FHzTVcsHHhTyQz3OlWL6v8l9vy0TDHAhxrzdF2/kvDbwiERukYKGnZNvw/+vVzQHOK
 UrgGbvxp12dm2zXEPoK9cBKCB9/rzw7UaDhEggMTyrduyYASrOiE6fvRiknejmD9IKMl
 Q8+3WfSp1iQluF8c9vFtSGC7igGILZzAsRo4qMJJq28KLCLBEyMIf8SbN2hidmWuDQ1H
 d3CbaNclK6H+eDsVMsYJG/R4pczwLY5vtqJoidJ1rHwkfBrx8GIaN5kAJy6n9CC7F2Px
 h1ENEFMxw14DByvfVHdxb1GZBxZaZO9bMi3l4uz9Yr1vnN29f4P4vzih74QOLHUvQr4Q
 HL6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=g3Ys1vqCZKhs9PhWoP2A+7O+kDt8sVZUNlfvVykaMac=;
 b=tqEW6ikWHkWyDedhlGYuRnkK5cDrjKH4SkfOkYOCdSvhwPlKbBftNELU5OxmVXns9k
 JMD03CnysSChiWrAr03LI1ngAmfrQt6TvD6Xnz4c4Zj+UsqHly4PV8D2XFbkvSs/7aCP
 HSPcfz6MzfrptdjQd4lDKW3ZGdgMh/4q80Q65/DH9GLpsp+vKErQPHnFuHfI4LudSmwm
 yWBjH2xcKHmmONMoHtt9Ivgy8RUbs2t/4c0jlxwQdeo6Y8qij+svox0qeXqwIK96mtF9
 HNDy+eysTK8Q6DdsD/Avh0+ShkMpPmGA1SCo/wwFEEhXWqARWau2ScGGKJ2sUxh/olKY
 b6Yg==
X-Gm-Message-State: ACgBeo0eg/k3kMF3UuibyK5EKjmLKyoxDbFNbcCT6vD82BziJyBijAQO
 zqez1Qb60vN6VG+v0qBNNFgVX/EpZKmEqKCCPwJK1g==
X-Received: by 2002:a81:5a56:0:b0:33b:52a8:c360 with SMTP id
 o83-20020a815a56000000b0033b52a8c360mr34064583ywb.329.1662315705959; Sun, 04
 Sep 2022 11:21:45 -0700 (PDT)
MIME-Version: 1.0
References: <CADsNLn3cZmZkSzmX6wiaujgpuBO3w+7s+QoUxTCZ3X4n1OEzkg@mail.gmail.com>
In-Reply-To: <CADsNLn3cZmZkSzmX6wiaujgpuBO3w+7s+QoUxTCZ3X4n1OEzkg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 4 Sep 2022 19:21:35 +0100
Message-ID: <CAFEAcA9c9kWRc8TtPzgJSaZHQHxkzRWKzLhDzFE1Dc5ecNJTrg@mail.gmail.com>
Subject: Re: Can qemu-system-aarch64 boot a Linux kernel with 16K PAGE_SIZE?
To: Karim Manaouil <k.manaouil@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: m04ACHGkriwk

On Wed, 31 Aug 2022 at 17:13, Karim Manaouil <k.manaouil@gmail.com> wrote:
> I compiled Linux v6-rc3 for aarch64 using 16K pages (CONFIG_ARM64_64K_PAGES=y)
> but it doesn't seem to boot with qemu-system-aarch64 (no logs appear. However,
> it boots fine with 4K and 64K pages).
>
> I use the following command:
>
> qemu-system-aarch64 \
>        -machine virt \
>        -cpu cortex-a72 \
>        -smp 4 \
>        -m 2G \
>        -kernel $ARM_KERNEL \
>        -append "root=/dev/vda rw console=ttyAMA0 earlyprintk=serial" \
>        -hda $DISK_IMG
>        -nographic
>
> Then just a blank screen.
>
> Thus, the question is, can qemu-system-aarch64 boot a Linux kernel compiled with 16K pages?

That depends which CPU you ask QEMU to emulate. A real hardware
Cortex-A72 does not support 16K pages, so the one QEMU emulates
does not implement them either. You might try the 'max' CPU
type, which enables support for all features that QEMU has
emulation support for, including all the architecturally
supported page sizes.

NB:

> Qemu version: QEMU emulator version 3.1.0

This is a very old version of QEMU. I can't remember when
we added 16K page support, you might well also need to use
a newer QEMU.

thanks
-- PMM
