Received: by 10.25.159.19 with SMTP id i19csp1324910lfe;
        Mon, 8 Feb 2016 05:19:03 -0800 (PST)
X-Received: by 10.55.48.80 with SMTP id w77mr12146563qkw.7.1454937543677;
        Mon, 08 Feb 2016 05:19:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z2si30402140qkg.60.2016.02.08.05.19.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 05:19:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@linaro.org
Received: from localhost ([::1]:44651 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSliZ-0001zF-2r
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 08:19:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36229)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSliR-0001qL-S6
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 08:19:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSliQ-0006Mu-LT
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 08:18:55 -0500
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:34628)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSliQ-0006Mn-HQ
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 08:18:54 -0500
Received: by mail-vk0-x22b.google.com with SMTP id e185so94629400vkb.1
	for <qemu-arm@nongnu.org>; Mon, 08 Feb 2016 05:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=8is2Yi/NUI19MZ4q1BVorSqOSIduC8JayXBMP6ezgbo=;
	b=g5nqEZM5XbOEwg6Ceh8WSDvfannPb4O23lyVp2XAA2rtQ7M6ItkFQ7/Ij+sf1PNKDb
	we1y0ivzZ8HEqN3NWSsYgiaqRpAuqvXR02WwFB0GDeLmpI4pL38Ihu54S6GSxH5j5pTW
	/HiXmD13q1KZxcxvXyKj8vGLVb97ACoaTT9VA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=8is2Yi/NUI19MZ4q1BVorSqOSIduC8JayXBMP6ezgbo=;
	b=FRq6FOUFMWTQuRFNKbWamoXjtVyXbyexeop08IAFZe803nyIGGrSNT3AlddFsO7YgB
	m6cKnhzjEnCSEH8qypYmgjhzd5bTjGaXX0LFKrYA81FJN4Iih3KyKESnpRE8Oj7D3YDq
	BHcZOSYbntW49HWdn/CXQVIGk/wNs/2uTbiaqZEyCj4JQkkxP5FGd/ASfYVKqzm2sIUk
	vpDiX6t81OBjU08Y6qnm1WHKdxdNg6RUsZTx1VmLGSw8kfB0qGx1ODc5jvJvBiWaFpCX
	eRoc22Q7THDo0hX9oPgeZktG5D6d4Xmk6emKigQ4AEx5KSMOTiHkL2aQITpiE7A3mkYa
	zodw==
X-Gm-Message-State: AG10YOQc1DrnJQmDay2e/eEzaDi8FaE6xnl3LrdanzRM66yZDdthehGLbxQdBCIVBdywQlWCBPr3H/28hmApS7JS
X-Received: by 10.31.194.130 with SMTP id s124mr19907256vkf.92.1454937534231; 
	Mon, 08 Feb 2016 05:18:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 8 Feb 2016 05:18:34 -0800 (PST)
In-Reply-To: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2016 13:18:34 +0000
Message-ID: <CAFEAcA-7s0DCVLH=yHPcY+T=OOFNJedVrHA+t-y8CPYx7j0B6A@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Cc: qemu-arm <qemu-arm@nongnu.org>, Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH 0/7] Fix some more EL3 things and enable EL3
 for AArch64
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yeYt3p7S7Gy6

On 3 February 2016 at 13:38, Peter Maydell <peter.maydell@linaro.org> wrote:
> This series fixes a couple more minor EL3 related missing parts,
> and then turns on EL3 for AArch64 CPUs. The minor fixed things are:
>  * implement MDCR_EL3 and SDCR
>  * trap Secure EL1 accesses to SCR and MVBAR to EL3
>  * add EL3 support to the code that decides whether to generate
>    debug exceptions
>  * fix corner cases in our NSACR handling
>
> To do the NSACR fix I had to change the CPAccessFn API to take
> an extra bool to tell the function if the access is a read or write.
>
> The only major thing I know of that we're missing for 64-bit EL3
> is that we need to go through the "EL3 configurable controls" section
> of the ARM ARM to make sure we trap on the right things. But
> (a) I expect we're missing some for 32-bit as well and (b) this
> is enough to run some real-world EL3 code (ARM Trusted Firmware
> and OP-TEE), so it makes sense to me to turn on EL3 now.

Applied to target-arm.next with some very minor tweaks to patch 2
(add .resetvalue = 0 to the MDCR_EL3 regdef, add a line to the comment.)

thanks
-- PMM
