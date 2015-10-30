Received: by 10.182.105.169 with SMTP id gn9csp92696obb;
        Fri, 30 Oct 2015 13:46:05 -0700 (PDT)
X-Received: by 10.140.218.133 with SMTP id o127mr13892048qhb.4.1446237965413;
        Fri, 30 Oct 2015 13:46:05 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h145si7464233qhc.123.2015.10.30.13.46.05
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Fri, 30 Oct 2015 13:46:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:53005 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZsGYn-0004pc-2Z
	for alex.bennee@linaro.org; Fri, 30 Oct 2015 16:46:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46819)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsGXv-0003yO-Vd
	for qemu-devel@nongnu.org; Fri, 30 Oct 2015 16:45:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsGXv-0003oo-9Y
	for qemu-devel@nongnu.org; Fri, 30 Oct 2015 16:45:11 -0400
Received: from mail-vk0-x229.google.com ([2607:f8b0:400c:c05::229]:36802)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ZsGXv-0003oe-6f
	for qemu-devel@nongnu.org; Fri, 30 Oct 2015 16:45:11 -0400
Received: by vkex70 with SMTP id x70so54688207vke.3
	for <qemu-devel@nongnu.org>; Fri, 30 Oct 2015 13:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=iGVtGL6yKO6mogp8uVOrOn5GhScSIbuwQ3vpHygXdSI=;
	b=QZGFQqNoPHeF7D7ZUmlaftjILSogbvEYTc1v931/tfgef4DVn/LYxElFVjaz9BM8DR
	LkXGNLDoc4lxVm/4xWFhayyrKEleqe0hccCVS0ThHNDZafnVQTeh5i2PKhk8u+B/r44K
	BwlERt3iutMCA2C3fGb3YRr0OuhWNiXK2nI/NTyevvIdpBxXxaUthugZwDaIE04j+/03
	C9SIVW5uSdoxNOJRXuUxYyWQL1sMnWi9zMDIbrfd0n61S/7QJIfK2Lqbq6GQoHznvMtf
	OAAO2X0BVvGP3Zyf3zfLOtW/g3o45xvO2M0Lq245l3xX/bzzRUd1MJJXob6TqlWRAAOg
	Ahiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=iGVtGL6yKO6mogp8uVOrOn5GhScSIbuwQ3vpHygXdSI=;
	b=nC12UQPr04PsBb1nNZlhQrhN1HkRySW2Dxf5G6X1zNBGVY+vepcIbEN9H0h9RJruUJ
	X12xvhoFPj5HVgugNxLvmY2H5iVshGyo+GDLoFY0FdCLOVHM46UE/aoloqJnWYUGKlNn
	6IHMfF/TE7iMBTgP8agQABnKd4gMsJ/TQBmEYk2BmclX8Z12xhunSmq4pJOXJ3aCbk0l
	HbJqeM40peuMILLW3/MgAyv4+06V01nL145comBKCZmuOSWwVQ6pLKoSNzCSKIE4SvbK
	lW059vBYuAEdJhpXduhZcBAU/PkWKXWGHBxer/NpVq5x2ZwJ1bz7bVFJK8WZ4MwV9dsM
	dX+A==
X-Gm-Message-State: ALoCoQkzeTFBQHhlSq4Ccp8xL8n5n3nUokm4g+rT+FJXlz8bdDezsQtFzh98qZ5UDO+hMQBXriVC
X-Received: by 10.31.136.144 with SMTP id k138mr6634331vkd.92.1446237910752;
	Fri, 30 Oct 2015 13:45:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 30 Oct 2015 13:44:51 -0700 (PDT)
In-Reply-To: <cover.1446182614.git.crosthwaite.peter@gmail.com>
References: <cover.1446182614.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2015 20:44:51 +0000
Message-ID: <CAFEAcA-8dEiY6LbkSMScSrBujRHYZz1-fkKa2tpVLTu-Ok8KKw@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::229
Cc: Rob Herring <robh@kernel.org>, qemu-arm@nongnu.org,
	QEMU Developers <qemu-devel@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 0/5] ARM: Machine specific boot blobs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: UwfRBby9y0Jc

On 30 October 2015 at 05:34, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> Hi,
>
> This adds support for machine-specific primary boot blobs. This can be
> used to install little bits of firmware or boot code without having
> to throw the whole QEMU bootloader out and BYO (with device drivers
> and all).
>
> It is then used to fix two boards, Zynq and Highbank, both which have
> small but critical expectations of pre-boot software setup.
>
> Regards,
> Peter
>
> Changed since v1:
> Addressed PMM review.
> Added secure_board_setup flag (P4)
> Added Zynq patch first, then Highbank
> See indiv. patches for detailed change logs.
>
>
> Peter Crosthwaite (5):
>   arm: boot: Adjust indentation of FIXUP comments
>   arm: boot: Add board specific setup code API
>   arm: xilinx_zynq: Add linux pre-boot
>   arm: boot: Add secure_board_setup flag
>   arm: highbank: Implement PSCI and dummy monitor

Patches 1..3 are OK and I've put them in target-arm.next.
Patches 4 and 5 I have comments on.

thanks
-- PMM
