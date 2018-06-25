Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp3606533wrq;
        Mon, 25 Jun 2018 02:56:59 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdXjvP6CD64ydCOfQk7dVkaH5BWDWOET4SIO5WIRJJyK0XbBV7qF0ikG4zjzgN7appTeNVc
X-Received: by 2002:ac8:3805:: with SMTP id q5-v6mr10466474qtb.410.1529920618972;
        Mon, 25 Jun 2018 02:56:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529920618; cv=none;
        d=google.com; s=arc-20160816;
        b=TOHySoRVKO5Hg3Tca/SM5s0mjrALSBlaDm2ATSPHStw28NXBn3O+saKbP6mS89a09O
         xKfo99kjijKAnka989f4YaJ9C1TUyuur7DY/Cw23MH3J+rCEhaLXRrrmJ1pFUzNX9+wh
         O5iTQ58V3qKl4VjTAcLSrxHCy8zjOnUjIHrkphlA6bKUqMGMyquggneeW//9iJdo50r1
         UaEpeqxC5Wdf1BLO12rVIgwR3sOvYlYtuaJMa+RTGHF/iS5pie0n8wdekQzNGU/GHBOF
         abZAxBAbotfHwS8xZVZ/iVRiUNveSQp0gHccb+GKkQkZfK05yy1e+mMtOVzcRPvt6Sb3
         GTCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=X7vh9+0nnBeFGZbocraJbcsepTxjcGl+F1f6G/W1pss=;
        b=iK3Agj1oBytV3E+D1tJqo65XwWvcKOdm+7bFQ3h0GxjHh7DUL+HOtgXqOEMJQIkCym
         No54ktNFjdeI2CUNPCABUomGDyF6Ap51fnxEAQAYwcSjkZF4MBxtVyGHJn7zFST8qCm0
         eddds6zYAy6r2As2hlOxWNKkR98f67DpB6ZNexT7SQfoI9lp2uTeE1mtMFfX0y/KCYIZ
         EWrp4SEroemWCeHMJQDq7RB3GkfMkW+YWhXrZxyVwcbgIFZIiLlFyJ9FQcT3jS5KIOGm
         epHV+EKFGCzYzcP2cpa1uVBS59x8Wtm/3sdwdVEufjBi5NBNTwCkl+nMZ7AgEnn9zyM+
         c9yA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AxtzDvr2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d19-v6si3185399qvk.212.2018.06.25.02.56.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jun 2018 02:56:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AxtzDvr2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45160 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fXOF0-0004TB-Fi
	for alex.bennee@linaro.org; Mon, 25 Jun 2018 05:56:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1fXOEM-00049B-Uy
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 05:56:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <hongbo.zhang@linaro.org>) id 1fXOEL-0002J1-LL
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 05:56:19 -0400
Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241]:45130)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <hongbo.zhang@linaro.org>)
	id 1fXOEL-0002Ic-F6
	for qemu-arm@nongnu.org; Mon, 25 Jun 2018 05:56:17 -0400
Received: by mail-io0-x241.google.com with SMTP id l25-v6so11929506ioh.12
	for <qemu-arm@nongnu.org>; Mon, 25 Jun 2018 02:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=X7vh9+0nnBeFGZbocraJbcsepTxjcGl+F1f6G/W1pss=;
	b=AxtzDvr2R/RAPXu1qcGUfa2jrgaR2b+GhrInej1wKzyUWmtbDg6ES7Y2X+aRq9MGNe
	qRFLGXNSCG/UxiQbrCGTJ+3peLqQEZCx5/xBOVF0rOPEQBjhsyJrz41bAzkBpmyDIghw
	JJTs2Ppy9DST7vbsJUKRxtd6xYHNISdORj8Xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=X7vh9+0nnBeFGZbocraJbcsepTxjcGl+F1f6G/W1pss=;
	b=Edyw3NslhafmrGfLRD7d8zDAlYkPS1Z0cPuSZxUdBwjDrQoHf4kW+jJ96BHXOJR6ag
	qVM4ZcU1BUEA/3NMeb576SlfS6Pj25kX4coVhQQ7Q4/nb7Y/UNm30uryWzt3SiiSvDrn
	QxXU41fSjEHTcsUtZeeBXU42mUqqwMQeEe7KKvDCenDox0xzvOc+ukujbHnkK6jk/YZO
	oWC0ERm3UpXF7TcP7iIFJZAhK+xBDEgTIHBSE9nYsKOnYESBmVnTpiTr9XRbYr/BzMoU
	O+BNqQGQ+LaKe2eW/g94vNcgRKRgDTuiN5ffsfVNn/MiIKixShsjFtEmiuY0YmQANmUT
	c6gA==
X-Gm-Message-State: APt69E0YMRMmUXa3Z0yd6d3azWN39CaKcmnVZ+rwOC4iUNVrU+2/VKiC
	maNIAmSudxh+Eho1Fw3uZW9nJ2Gxb/AE/nfHlWRDxw==
X-Received: by 2002:a6b:ba82:: with SMTP id
	k124-v6mr8976026iof.94.1529920576669; 
	Mon, 25 Jun 2018 02:56:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:a65a:0:0:0:0:0 with HTTP; Mon, 25 Jun 2018 02:56:16
	-0700 (PDT)
In-Reply-To: <CAFEAcA90hDS17L64YZ5H_B-kYkMaMV+ofBtdD=TEKgsnT+wUqA@mail.gmail.com>
References: <1529663827-28854-1-git-send-email-hongbo.zhang@linaro.org>
	<CAFEAcA8Bx7b_0zUxbdxFgtANFycVkUiSiemAwHpr0wpyxuLKmw@mail.gmail.com>
	<CAHmQWvCczwh0Yto=9s2j7d00ULokZ0=VrxykAyXBvvHzQaUEMA@mail.gmail.com>
	<CAFEAcA90hDS17L64YZ5H_B-kYkMaMV+ofBtdD=TEKgsnT+wUqA@mail.gmail.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Mon, 25 Jun 2018 17:56:16 +0800
Message-ID: <CAHmQWvBxTaX9f+xH3zue5w5s-eiLo00jmHq2OZ4gXTAJg0XLjA@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::241
Subject: Re: [Qemu-arm] [PATCH] hw/arm/virt: fix psci conduit in acpi when
 el3 enabled
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0Ye26xZD7xAB

On 25 June 2018 at 17:06, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 25 June 2018 at 05:06, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>> Hi Peter,
>> Yes, your considerations reasonable.
>> But in practice of hardware platforms, programmer checks that Arm TF
>> is using SMC for PSCI call conduit, then fix it manually in the ACPI
>> table, reason may be that Arm TF is lack of ACPI support, if device
>> tree used, there should be no such thing because Arm TF can support
>> it.
>> On QEMU, I just mimic the situation, if a complete reasonable
>> solution, further efforts are needed to figure it out.
>
> I'm afraid I don't really understand what you're saying
> here. Could you try rephrasing it?
>
Sorry, I say in the real hardware platforms, in practice programmer
has to write a fixed PSCI conduit value in ACPI. then on the qemu
platform, I did the similar thing -- write a fixed value too.
I know it is not a perfect solution for it, I have no better one for now.

> If we're running at EL3 and booting firmware, then QEMU doesn't
> provide PSCI. The firmware we're booting is the only thing that
> can know if that firmware has implemented PSCI. So only it can
> decide whether the ACPI tables and DTB should say that PSCI is
> present.

Agree with your comments, I hope ACPI's psci conduit node can reflect
firmware's implementation, even when firmware PSCI conduit changes,
ACPI node changes accordingly.
But for ACPI and DTB, there are different situations now.

If DTB is used, firmware(with psci implementation) can generate DTB
nodes, saying which PSCI conduit is used - smc or hvc, then uboot or
uefi can get this DTB add more DTB nodes before transfer it to kernel.
That is, using DTB, we can achieve the goal.

But when ACPI used, there is no codes in firmware to generate ACPI
node to show which PSCI conduit is used, then uefi or later stage
cannot get this info dynamically from any codes as far as I know.
(this is why programmer manually check that firmware is using smc,
then write a fixed value in ACPI FADT).
So, if we want to fix this neatly, adding ACPI support in Arm trusted
firmware may be the solution, but it should be a big feature for
firmware, not QEMU.

(since many components involved, hope my understanding correct)
>
> thanks
> -- PMM
