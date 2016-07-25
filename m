Received: by 10.25.21.156 with SMTP id 28csp1242471lfv;
        Mon, 25 Jul 2016 08:49:04 -0700 (PDT)
X-Received: by 10.55.145.70 with SMTP id t67mr22016700qkd.19.1469461744041;
        Mon, 25 Jul 2016 08:49:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s1si18276944qkd.6.2016.07.25.08.49.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 08:49:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33157 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRi7r-0004iZ-Ed
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 11:49:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRi7n-0004hS-PG
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 11:49:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRi7m-0002ar-VK
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 11:48:59 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:34405)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRi7m-0002ai-RM
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 11:48:58 -0400
Received: by mail-vk0-x231.google.com with SMTP id s189so249079532vkh.1
	for <qemu-arm@nongnu.org>; Mon, 25 Jul 2016 08:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=eumadRcWUnFzOJKm2jO8osdg4F0rPnVkMl7Igu6G3fw=;
	b=UGXWkHrNoZBojNUwlcJfORFVp0i9RjnTqAqFapB2e9LKHNKDOVT3JVRXrbkFloMiDL
	Zr/IFqHVhddj2XWLALZkWzOMvZJe90y/gRMTaZNw1n8uou3i2qDFB+OaVl2nPrj7ty5x
	WHznPuIo32K992Fz6i2EBRjLDAcQ/3VRPsr4Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=eumadRcWUnFzOJKm2jO8osdg4F0rPnVkMl7Igu6G3fw=;
	b=eCa1hTHHHa5x2gBW8BtXZtqzzLz7pWM3w4uzSoYuE7HYfNE8XAQ5gNBXfN7NvexGIM
	ue8itqe9dHM8EOQYjpjPhdLG2lWz36MJ7rXEa05su9F1ld3iLjI4/tJJy0lUa5YofcZC
	pCJokNFt4PkSzMBTWN0JC/OSZiGcm86a7DdLOOKYV90ZO0YbqdCoYvWXxZo8zavaNgCn
	qiODAnxZYll3x+K7kx+zzXplKxK6kYusorSs5IADNVV7yzxQDft01/l5f23lPvdgmgVC
	fgxzXJjHPsLB3nMz4m6wcMhX+iySnyGkioG1Vq2LjOw4p1BwWQYnXt7ne8F6rCX6W7ue
	YH/w==
X-Gm-Message-State: AEkoouudy/zRfgdfa6gutysTPnMQ+lYfxpzp03yqtCTQSpal3yUYPaZfFmLk4QqIHU1nDi4y+cfDihG9CWPhV3oc
X-Received: by 10.31.188.203 with SMTP id m194mr8965127vkf.120.1469461738357; 
	Mon, 25 Jul 2016 08:48:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Mon, 25 Jul 2016 08:48:39 -0700 (PDT)
In-Reply-To: <8bf7719a88e0b2fcb12fd230b00df01f1b70f192.1468279072.git.alistair.francis@xilinx.com>
References: <cover.1468279072.git.alistair.francis@xilinx.com>
	<8bf7719a88e0b2fcb12fd230b00df01f1b70f192.1468279072.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2016 16:48:39 +0100
Message-ID: <CAFEAcA_H3xc_MCQSLANHYjWtUPMj+wMRtCMY3eTEfGWcnYDO1g@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
Subject: Re: [Qemu-arm] [PATCH v1 4/5] cadence_gem: Correct indentation
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VnsQ2fgiBBvv

On 12 July 2016 at 00:20, Alistair Francis <alistair.francis@xilinx.com> wrote:
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>
>  hw/net/cadence_gem.c | 182 +++++++++++++++++++++++++--------------------------
>  1 file changed, 91 insertions(+), 91 deletions(-)

I assume this patch comes out empty if you use 'git show -w';
would be nice to say so specifically in the commit message if true.

thanks
-- PMM
