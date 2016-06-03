Received: by 10.25.27.66 with SMTP id b63csp395593lfb;
        Fri, 3 Jun 2016 11:37:43 -0700 (PDT)
X-Received: by 10.55.95.199 with SMTP id t190mr4859016qkb.53.1464979063630;
        Fri, 03 Jun 2016 11:37:43 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o106si3178002qgd.28.2016.06.03.11.37.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 03 Jun 2016 11:37:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57164 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b8tyY-0007bP-4w
	for alex.bennee@linaro.org; Fri, 03 Jun 2016 14:37:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39255)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8tyU-0007az-HY
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 14:37:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8tyM-0004iZ-GC
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 14:37:37 -0400
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:36812)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b8tyM-0004iH-Al
	for qemu-arm@nongnu.org; Fri, 03 Jun 2016 14:37:30 -0400
Received: by mail-vk0-x22f.google.com with SMTP id a6so126114537vkg.3
	for <qemu-arm@nongnu.org>; Fri, 03 Jun 2016 11:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tmDBhZpwl9fLaaHbIaI998+KDn6bVyiouf2zvUyIP0M=;
	b=HO0OEQapk1bYYaNv+NDbt0BfbkxHTUipMnahmMd3R5PWDZnynXEJ9PW3ASvu7deHjO
	C0MUmGl3Y9PzEEuUPOJUSCLMKp0ALze9aTnAz3qbCxYldjuUTYIXrCJwMMfA4B12/kJq
	wkXJ1Cpn8Yf6nSrcvLpmP5VS6WSu0r6BcFR4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tmDBhZpwl9fLaaHbIaI998+KDn6bVyiouf2zvUyIP0M=;
	b=ZnMn4CbyxlnR4a6GlOuQoHT84sxJiCWuXG60tMZJNdm3Ltj8uAwPr7JLyoI0jnblo0
	Qa6H2dhz93q5jIYNWvcyugaqK9yNul+sryc45/hOy+3sjFGgNSvmYETK9eFzuGCytpm7
	Th1PqZswPk71OIOhGAjCyPWATFs1oRssdBKVRc3YkO3Gtq3UUkF4pVj/PJWHxjSVzsTU
	X05G3ofqMeYbJbtCGGphvJBepVwNYM1QUAODFq+uL8J2OPZ4DNpVspCYB/4lhM9STQLg
	HR85h77TzbgNv54IgLhFMJhtaXtsBYRihLjnBm9MBp0xSOCvA9Ij5xIaHeZtOiHXM5Dv
	amhg==
X-Gm-Message-State: ALyK8tLG9wLNGLepRFd4xwZ0Alb9U9AfA7/dzhwnwQAXJDoEdreyI2Sp6bglSFPa/pxCCd02rIjAP7pth5ucYfKz
X-Received: by 10.176.0.172 with SMTP id 41mr2248077uaj.17.1464979049758; Fri,
	03 Jun 2016 11:37:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.69.66 with HTTP; Fri, 3 Jun 2016 11:37:10 -0700 (PDT)
In-Reply-To: <1464173555-12800-1-git-send-email-edgar.iglesias@gmail.com>
References: <1464173555-12800-1-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Jun 2016 19:37:10 +0100
Message-ID: <CAFEAcA_5VBvdEnx8YzZD7yEzAaoRt5+8JbOXUQQNqR+2oJZiCQ@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Subject: Re: [Qemu-arm] [PATCH v2 0/4] xlnx-zynqmp: Fix various issues with
 KVM runs
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OVBBl+RQ9b7W

On 25 May 2016 at 11:52, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> This series fixes a bunch of issues with KVM runs using the ZynqMP
> machine.
>
> When using KVM, we don't have support for TrustZone, the RPU subsystem
> with Cortex R5s and we also need to use the in-kernel GIC model.
>
> This adds a set of properties to the ZynqMP allowing the creation
> of the KVM friendly machine.
>
> I've opted to default the ZynqMP to the KVM friendly machine for
> consistensy between KVM and TCG and also because some of the options
> are currently of limited use (i.e the RPU) or were actually disabled to
> start with (e.g TrustZone sneaked in as we enabled EL3 on the A53s).
> I'm OK either way though, so if people think differently we can change
> the defaults.



Applied to target-arm.next, thanks.

-- PMM
