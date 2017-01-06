Received: by 10.25.205.13 with SMTP id d13csp10267863lfg;
        Fri, 6 Jan 2017 04:15:01 -0800 (PST)
X-Received: by 10.55.165.76 with SMTP id o73mr53474319qke.32.1483704901648;
        Fri, 06 Jan 2017 04:15:01 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 11si26551061qkl.61.2017.01.06.04.15.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jan 2017 04:15:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52139 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPTQB-0000yQ-0r
	for alex.bennee@linaro.org; Fri, 06 Jan 2017 07:14:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55818)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPTQ5-0000yG-HK
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 07:14:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPTQ4-0007lO-Gv
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 07:14:53 -0500
Received: from mail-ua0-x236.google.com ([2607:f8b0:400c:c08::236]:34474)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cPTQ4-0007lC-AG
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 07:14:52 -0500
Received: by mail-ua0-x236.google.com with SMTP id 34so364854800uac.1
	for <qemu-arm@nongnu.org>; Fri, 06 Jan 2017 04:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=so+qiSze6pBiWJ/n/ckZmtGANdp62vgFfPnapAksmdY=;
	b=WxnkyvQSQ8S2n13RekAoxbVuZbiHeyL566YgIzFZ0iZpe8BankniJXsiQynKR9az0o
	Y3e7Fqpg2KMORdhM4S7E0m/SQPUY72BGb1FMHAZj9qqFabrJdCs4pwPykMxJS2Y4i2Mp
	BLkTl2amomUH6uO/9Or+MM8MSWJEOJ3WRh40Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=so+qiSze6pBiWJ/n/ckZmtGANdp62vgFfPnapAksmdY=;
	b=s5yWJy9RTd3QwBvKaMtKJJ1F8myvJ3KSMTI9CG89S5Tuu3Qo9YpodBffAriJa+Rsk7
	YYcbFGwW9aqyhwZln0CpVqdnHlbU7UDSr3d9gtj7WAwfL+aa9SVtQpA6qHCnCuK5ZHdi
	K3d1k2aD37dENzLOtc/CFFjazu6xztKxCdUJmE4bWZyI8kLSE0NfzdbfmInr6XsmkXXN
	vJbul+Dz8haWHExSmTPViNsZw1DsvAAglAQO2phfomiJdnm7hGQxQkG7Ct6njJ/KqvYi
	DjQ/vgVdBoOTbX770G4oziE0FadrJlKE5un0WMBRNvCylvGKmcBPAXRINikuHAFuE5nZ
	DU3A==
X-Gm-Message-State: AIkVDXLgAkRBoFWeN7gU4nN0xFOexn6NmW3TyafoGLgHq0/33FkUGaF0RIzJXtzztDtVmdi9EJjiKLvatMrXyofW
X-Received: by 10.176.2.14 with SMTP id 14mr52382293uas.8.1483704891801; Fri,
	06 Jan 2017 04:14:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Fri, 6 Jan 2017 04:14:31 -0800 (PST)
In-Reply-To: <1476792973-18508-1-git-send-email-peter.maydell@linaro.org>
References: <1476792973-18508-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2017 12:14:31 +0000
Message-ID: <CAFEAcA-ycRY_BEJTy7Q+juWsUhv9HUeOj-GdYRFNdEGTwfJ_Xg@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::236
Subject: Re: [Qemu-arm] [PATCH] target-arm: Implement new HLT trap for
 semihosting
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
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EttHvHTBXx+n

On 18 October 2016 at 13:16, Peter Maydell <peter.maydell@linaro.org> wrote:
> Version 2.0 of the semihosting specification introduces new trap
> instructions for AArch32: HLT 0xF000 for A32 and HLT 0x3C for T32.
> Implement these (in the same way we implement the existing HLT
> semihosting trap for A64).
>
> The old traps via SVC and BKPT are unaffected.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The public doc for the new spec is not quite done yet, but I
> wanted to get support for the new trap insns into QEMU 2.8
> (they're the only thing where a semihosting user can't probe
> to see whether the new-in-2.0 feature they want is present).

Just for the record, the public doc is now up:

https://developer.arm.com/docs/100863/latest/

thanks
-- PMM
