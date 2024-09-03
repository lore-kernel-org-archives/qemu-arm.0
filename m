Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1510978njf;
        Tue, 3 Sep 2024 09:38:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEQoOeDnnbLc5DVr379wxGEXn6XO0yjA9pWXUOScqKu7cwy4rJGdwnkasihyHedImTbxMDEbZ25wBnLQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFjOwaDDt4+2OQAnMzSty2cYftE4ue3bxaKvGt3WFBMxzPPwpw56UDqjeVstyEVTwSqt0am
X-Received: by 2002:a05:622a:428b:b0:453:74cc:ce09 with SMTP id d75a77b69052e-457e2d27101mr50497911cf.8.1725381496951;
        Tue, 03 Sep 2024 09:38:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725381496; cv=none;
        d=google.com; s=arc-20160816;
        b=sm2JyAi9dQD/sCf278WyTCmaZ8n8teScGkkOnWKlrAXirx3oHWW3ZrKgf6gKfvsWc5
         dZhq2PebCrj1IYzrTCgDq7+iUtAhbHybo5I9nqZ+FfoztUq0zl66hLFN2GAwl8Ej6+YO
         NQiDsU4+hPzAJGa6ihvIHGe4T67X+xLFSaWZC5gi7383tgWKIFWXI8pHB+SeYEMxm4DO
         orhQXN7J0WZn8tKizOXW5X/uiT+zhjkhIa01UUMHgBT1mnP34qOChPibR886qTDs+eeQ
         XmL3i5RO0X6tV/0ha5IU8EKW6nxZcDXuvSBtVPRa+u2J4RgQqNyg2ROfa8nGU9+I9KLY
         H83A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4nkSogmG8EqlyWUOtW2AZGduld22wLpFVTNuCgxWRD0=;
        fh=UCB5CVybDC3yhnHtlzQoBC1kCOumpcgwQ3+5L0EUyOI=;
        b=btX3UDhNWJtlkslAocGMx4E49y0YYiZU9BRk3kUjDISzCs3uaBHaH+oWm4YD6H3czm
         DvQz8pcGI7mQXmtti7RddxBIPvZnQRnMhdCpyxKiqYO9AaBTyn9DebABtKlECxF7V6Hp
         4NUFVBoTVk/ddfX6c1a7VvIETdqoz3JTyg/4ZuDIvfg1r8/jaQWzmqh2zvs3UWXS0+Dh
         HHSCbSv0r9HITx2PcBiiLnFS65llo6iQ73PVQpD7ln2n1fwgLvRCPG0mVqr7wNygB3Q6
         W8f45fmhMK6nD52mgA+jSOJbx5V/vwN4pcJ8ln/2z/2+mlofPJBDo73loARYZc0FqenO
         mNxg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zj+gN3oU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4568acbeef0si111306051cf.757.2024.09.03.09.38.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 09:38:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zj+gN3oU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slWXQ-0002sr-3B; Tue, 03 Sep 2024 12:37:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slWXO-0002nM-OG
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:37:50 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1slWXM-0006zz-VJ
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 12:37:50 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-374ca7a10d4so1366479f8f.3
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 09:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725381467; x=1725986267; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4nkSogmG8EqlyWUOtW2AZGduld22wLpFVTNuCgxWRD0=;
 b=zj+gN3oULC+uPSTSspigI6Eml5uAAFB7LacZV61AFVYUNXGTY2Sh3LQoJMDwwT/HD5
 WABoqrDv0rtb5XTBLvFVqjpoMiYpDcAszUq5fgGHAgXE9fRa4FSezOgP9ETA83oKQK8/
 PpeF55EWWGLam5KpJSQ+U3smq3wS27RLSwrCisSQyyyaTqvQfb0UqjNTmnFFCkV7YN+W
 O0CyqXal33xb8FAoqDZb7kLcaS8au62OmNvH8gk1SxLh44s92xRAHzFqET3i+a7DSo+1
 nRLWjYKpFaHfAeBHroj9AwK4rstkOPNlBZf9Ur1Eybv8RmnkaejbeWVUgEg3M6RzLcKW
 wTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725381467; x=1725986267;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4nkSogmG8EqlyWUOtW2AZGduld22wLpFVTNuCgxWRD0=;
 b=L0EKu/eY2HvT38fkoVyDQbRjUxMlZa0+bD/SJhgbxwQhlHi8yvWIAoXBLRqvpEue3f
 ZOWNT0PdobsMIMi5wuuJ8BocATCoQsJEAAcqX1Vj+nsu7OH6eYm4DmJtZCiMguJwRWFD
 AHxZB81lYn2HXdvQrwNUnGsfbjydxP5RsEIxmAaZdxg8+h3cmzqnjrEAgKFtRbfwYncx
 nl7QqXIwn/vuKgKsiBbmxCAVkWWsYacGsgDkEzq0dSgIltJAzA+wG0YuQPr3hXuMRFLf
 2jTlamGNKqffX6FcnL0Nb+8rL/Tk8Pi41HYraiprAGQu8IzEUwjdQAXObVIDVjq9DThc
 htXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqTwUEk2SkEe9KjHHLmTxv0rInSO+aUnbRhXrp0B29dc+cj3RZieS32elJgyzBs3orUgvkOyyM9g==@nongnu.org
X-Gm-Message-State: AOJu0Yw5XFToXnUqgmwagvRSsuanlGne19gFJA2g9Hl5TygSQD5/jxH+
 K1ExYlQDmR8AwR6LYm/URj5Q9IK/fH27uz5/akBJRAhQUZK/xFKUVvRZc0UotnzyEs3d27ENlvR
 KrnJZmFaSdbAuyx/Nj5YjL1t9LvkqhPaLboKJhQ==
X-Received: by 2002:adf:e98f:0:b0:374:c287:2afe with SMTP id
 ffacd0b85a97d-374c2872bf0mr7397571f8f.56.1725381466585; Tue, 03 Sep 2024
 09:37:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240828005019.57705-1-sebastian.huber@embedded-brains.de>
 <CAFEAcA-p+CBeKTgH-YXzrATKDpwG5iY+A3WGaVkbEeHCXxTzug@mail.gmail.com>
 <ZtF9P_QtnH1nAYuu@zapote>
In-Reply-To: <ZtF9P_QtnH1nAYuu@zapote>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Sep 2024 17:37:19 +0100
Message-ID: <CAFEAcA8Lv_9nW7GwHwEdc-CQb36iRC0hx5X75BC_cjR=sVGuUA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/xilinx_zynq: Enable Security Extensions
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Sebastian Huber <sebastian.huber@embedded-brains.de>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
X-TUID: gP2Hoxx06IXx

On Fri, 30 Aug 2024 at 09:05, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> On Thu, Aug 29, 2024 at 01:50:02PM +0100, Peter Maydell wrote:
> > On Wed, 28 Aug 2024 at 01:51, Sebastian Huber
> > <sebastian.huber@embedded-brains.de> wrote:
> > >
> > > The system supports the Security Extensions (core and GIC).  This change is
> > > necessary to run tests which pass on the real hardware.
> > >
> > > Signed-off-by: Sebastian Huber <sebastian.huber@embedded-brains.de>
> >
> > (Added the maintainers to cc.)
> >
> > Does the system have any secure-only devices, RAM, etc?
>
> Yes, on real HW there are but I don't think we've modelled any of it yet.
> There's TZ both on the SoC and also ability to create FPGA logic that
> can issue secure/non-secure transactions. Here's an overview:
> https://docs.amd.com/v/u/en-US/ug1019-zynq-trustzone
>
> The primary use-case for the upstream Zynq-7000 QEMU models has historically
> been to run the Open Source SW stack from Linux (some times from u-boot)
> and up. It's important that we don't break that.
>
> So as long as we add additional support without breaking direct Linux
> boots, I think it's OK to incrementally enable missing pieces even
> if there's not yet coherent support for firmware boot.
>
> In this case, IIUC, when doing direct Linux boot, TYPE_ARM_LINUX_BOOT_IF
> will take care of the GIC setup for us.

Yep, that's the way it's supposed to work. OK, let's enable this;
it's the beginning of the release cycle for 9.2 so there's
plenty of time to fix any problem that might get reported
to us before release.

Applied to target-arm.next, thanks.

-- PMM
