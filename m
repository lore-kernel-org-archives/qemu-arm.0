Received: by 10.25.208.137 with SMTP id h131csp1671609lfg;
        Mon, 9 May 2016 10:02:56 -0700 (PDT)
X-Received: by 10.141.28.204 with SMTP id f195mr37764924qhe.59.1462813376792;
        Mon, 09 May 2016 10:02:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f91si19302438qga.24.2016.05.09.10.02.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 May 2016 10:02:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42357 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1azoa8-0006BD-AE
	for alex.bennee@linaro.org; Mon, 09 May 2016 13:02:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1azoZX-00053I-1G
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:02:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1azoZV-0002Kf-1f
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:02:17 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:35702)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1azoZU-0002KB-Iq
	for qemu-arm@nongnu.org; Mon, 09 May 2016 13:02:17 -0400
Received: by mail-vk0-x22b.google.com with SMTP id f66so73777272vkh.2
	for <qemu-arm@nongnu.org>; Mon, 09 May 2016 10:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4ZZtLD7WTa940MUGvGk1+rsyajqTR2JkcT0YW0mRZVs=;
	b=eiITZP7OiXaViiCA0UaiAdgqhvCE3NxzaRP9IFj9VjOOQnfxKWr3S4lAV5VJDigK2w
	2wB7pKYBfv/BEXE5DZmO7jvTKieLhhMDtp8u1ULJZeePIana4NRQI3d+OX07OCkeXRDI
	x2XLpOMuSNnhM6hR/p6Wo+2nCViwjbW44U5Vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4ZZtLD7WTa940MUGvGk1+rsyajqTR2JkcT0YW0mRZVs=;
	b=OgVDFeEt7iWbegZ1UByLz82LNvhuLZwMrDsBVKl5KHqJfh150+GsPn0zHBrA27iEaH
	B9AH4AgT/+35AAVSHrpPa1ACmWM7u5VqqmE5dqS6M6yEgIjkYvUb/57YOBbEwu5K5DEs
	N33zn9ZiFKkygfusSIp/4nbtQ3KYsOj9EJ3HcdrTq5MkWOV458TH23gXlpbbCPiEsQ2c
	iHnxm/k5Tz/m/HahESizjaCMyOAzn4HmgBHMsIqOFCFnedZGmGfxl2u9H4xRbjEVtKqh
	lX17ti2V8q4gxz6laGkWihqg2kCE1plHNVjUo30qQLLZcEXVIl5IubuW7YZiJ2JBhqlk
	I3+A==
X-Gm-Message-State: AOPr4FXZCqiErtxyLUG1Ek859yi7K2hPLQu1kgOQsoCcD8pGPwokVvBR+okHp381sFZzVzluOUQpTXEeyovsQoYq
X-Received: by 10.31.7.70 with SMTP id 67mr6964309vkh.82.1462813335871; Mon,
	09 May 2016 10:02:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 9 May 2016 10:01:56 -0700 (PDT)
In-Reply-To: <CAKmqyKMNbNoph2s1F4ZnC_Dqc-t_=bRtm5+oAHXnvdF09KHVeg@mail.gmail.com>
References: <cover.1462557987.git.alistair.francis@xilinx.com>
	<6459df5e54365d5dbe8a1b047a85ec65c67e9232.1462557987.git.alistair.francis@xilinx.com>
	<CAFEAcA-G1jfUuK5JDFDnrFG5tKOt_VPnLBj7CD4WGkhrx_zp8w@mail.gmail.com>
	<20160507015121.GF16305@toto>
	<CAKmqyKMNbNoph2s1F4ZnC_Dqc-t_=bRtm5+oAHXnvdF09KHVeg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 May 2016 18:01:56 +0100
Message-ID: <CAFEAcA9cGbU+LdZD9YzkJ8VMEyt+gKd5+8qi+Q-m+tgtNBg10w@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v1 2/2] target-arm: Enable EL2
 for the A53s and A57s
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +JkqA+TjfOSL

On 9 May 2016 at 17:58, Alistair Francis <alistair.francis@xilinx.com> wrote:
> I might have to look at disabling EL3 support for the ZynqMP machine
> form the command line, as I can't boot Linux with EL3 but not EL2.

I think it's worth trying to find out why this doesn't work:
I'd hope that Linux can cope with a no-EL2 setup.

thanks
-- PMM
