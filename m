Received: by 10.25.21.156 with SMTP id 28csp408384lfv;
        Tue, 12 Jul 2016 07:26:20 -0700 (PDT)
X-Received: by 10.200.56.35 with SMTP id q32mr3934317qtb.32.1468333580504;
        Tue, 12 Jul 2016 07:26:20 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z57si2651095qtz.88.2016.07.12.07.26.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Jul 2016 07:26:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40840 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bMydg-0001P0-1N
	for alex.bennee@linaro.org; Tue, 12 Jul 2016 10:26:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42503)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMydP-00014p-AK
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 10:26:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMydN-0000aS-9U
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 10:26:02 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:34485)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bMydN-0000aB-5L
	for qemu-arm@nongnu.org; Tue, 12 Jul 2016 10:26:01 -0400
Received: by mail-vk0-x232.google.com with SMTP id o63so23932513vkg.1
	for <qemu-arm@nongnu.org>; Tue, 12 Jul 2016 07:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SD9sdRJsAo0uP9F3kHny1RW2Tm+t2A7qKxnXVixA03g=;
	b=BePAaHnQxgg+rzeEd4eLI5YOvRN6YlHdmWU365cmclLRonVsmS4PHarQ3+iDahJX2Q
	SiJU9xD7zm36slN3UJpaJI6FL5Ju0cRgzSlgr7Jh8h7dz+hREZ87skQMoAEVPUUdiKXA
	d32mkTXnBYgNmEvZfzXHRCJTJU8W14SkIY2qw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SD9sdRJsAo0uP9F3kHny1RW2Tm+t2A7qKxnXVixA03g=;
	b=eaLqU3mkhsOqX7vWZtWL+Gq6Kd3knE3H3raf39gWrh25YEih2xqyEeT20Nm3egAGNy
	f3Ts1YWs/M5zZIHMpg7CGExYgKvP+Ra/LR1kmGyYd/nqertvbEIMS8eajALs4MiWpLAr
	m+p8aosR+3l3CChZgw7Cotzebba9v5T4i8X/2LmuDB4sA7jxEzfu9ck1bHJcWq6ndoTQ
	FS9irtL7IXW/DkLFBWW9Ebfff86XtksN/OZDMdT28UdcVC29bvoRrCIARvXTYwSbXXDJ
	E4rC2SC8cG2IMsM8iJfBDasTtVVpwHYfSZDSzgRHkMFlBU3xF8BKEZ2xAvTaPKrecTzQ
	2cmQ==
X-Gm-Message-State: ALyK8tJUKElN6ho83AKc2z5uZsmlduE0N16Wqv7izcxFxpvzPlEHiX0Zla7NaEZfqMo40aY+Ttj5mEMDV5OR1cds
X-Received: by 10.31.208.196 with SMTP id h187mr1284970vkg.120.1468333560752; 
	Tue, 12 Jul 2016 07:26:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.69 with HTTP; Tue, 12 Jul 2016 07:25:41 -0700 (PDT)
In-Reply-To: <cover.1468279072.git.alistair.francis@xilinx.com>
References: <cover.1468279072.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Jul 2016 15:25:41 +0100
Message-ID: <CAFEAcA9V=dV8qiuQ_HOfU=9=GiCJ6u=+g075CU=x8h-iBMiC2A@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-arm] [PATCH v1 0/5] Add support for Cadence GEM priority
 queues
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
X-TUID: mQPnd3XFS2Y2

On 12 July 2016 at 00:20, Alistair Francis <alistair.francis@xilinx.com> wrote:
> This patch series adds initial priority queue support to the Cadence GEM
> device. This is based on original work by Peter C, that has been ported
> to the latest version of QEMU.
>
> There is more GEM work that I'd like to upstream after this, but I
> figured this a good place to start. I have done limited testing on the
> Xilinx machine, including running some of our GEM regressions, although
> they don't cover everything. I can't really think of too many other test
> cases that I can run at the moment.

Hi; I'll get to a proper review at some point in the future, but
for the moment I just wanted to let you know that I'm classifying
this as "not for 2.7", given where we are in the release process.

thanks
-- PMM
