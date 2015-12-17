Received: by 10.182.158.201 with SMTP id ww9csp464376obb;
        Thu, 17 Dec 2015 07:40:24 -0800 (PST)
X-Received: by 10.140.92.147 with SMTP id b19mr29859266qge.104.1450366824508;
        Thu, 17 Dec 2015 07:40:24 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z204si11772837qka.99.2015.12.17.07.40.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 07:40:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:54353 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9afI-0000uE-8B
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 10:40:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9afF-0000t1-Ja
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 10:40:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9afA-0005G3-12
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 10:40:21 -0500
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:34111)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9af9-0005FY-Sw
	for qemu-arm@nongnu.org; Thu, 17 Dec 2015 10:40:15 -0500
Received: by mail-vk0-x22e.google.com with SMTP id j66so48533598vkg.1
	for <qemu-arm@nongnu.org>; Thu, 17 Dec 2015 07:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Hr2vrgSJMAMJuHwSsJ/kHd066YmwuRNF0fCAgN/E/3Q=;
	b=ELHf5kNJZRAf8mgehpbmMJByMkSe1bK81N0GPobBTGfrP9OYXtrULFH718S7tcm1UY
	AVUKhgxMEi/4yLvTBBpLe1GEHaS/oa8g4TipY2r5e4R/vumHQ6CE0HUvX8VOa8gQSBYn
	6Ut6BVLLVGDedRd1UfVf42eXCsiCVqX29p43k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Hr2vrgSJMAMJuHwSsJ/kHd066YmwuRNF0fCAgN/E/3Q=;
	b=ScuS8QqEY6oFPQOZA9RZ8xPX6Zjn/qd4WT35qAIdpKB7eLpvGBYEbeXKc9OW/OpK/l
	ctIyfit2cVDFSbHLTVRZYJ2q1R1E5cbOCRtjVjwdYzBgs8VRqTDWKekg3E+OgEIZzbH5
	5htPlZBcA3NIFsCQUEwWN6xElsZSs/BYVjzvHj8h9L1zr0xmtGWwe1KWcxtwuH3bRc0e
	MKI2KMdDJrF/3pTaHBqcEe4jdMhMlaSmi2lFgxiKaGO/hUvASG4CAKi+1xlC+NQPFD/V
	9mksQY5OufBymi4xQ0ZUqKSQUyRglk90SX+gutzrylIqmE0grMe/mdHulRV4Aet3p1TS
	Dkxw==
X-Gm-Message-State: ALoCoQkJ3KIGbtW6hDHNrLzu6nHzFy7krzpxSe3acz5aBPQJQKYan2ezp7qaVbWnIunE3AcSudckkDCogIAeIIqHcUR58ZhTUlDY5TOU93qMGhFcGJ0Yr4Q=
X-Received: by 10.31.194.21 with SMTP id s21mr36714360vkf.92.1450366815541;
	Thu, 17 Dec 2015 07:40:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 17 Dec 2015 07:39:56 -0800 (PST)
In-Reply-To: <1449101933-24928-8-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-8-git-send-email-mdavidsaver@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Dec 2015 15:39:56 +0000
Message-ID: <CAFEAcA8W5evrAozaM8rU5QCxn1T0tY4QokGK1E81AUObZJLP2g@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 07/26] armv7m: simpler/faster exception
	start
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
X-TUID: FUa0sQHD7ZQm

On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
> No need to bounce through EXCP_IRQ handling
> for non-IRQ exceptions.  just update CPU
> state directly.
> ---
>  target-arm/helper.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)

This commit takes my stellaris test image from "broken and sits
there with a black screen" to "aborts on startup":

Peripheral reset not implemented
Peripheral reset not implemented
qemu: hardware error: Interrupt but no vector

CPU #0:
R00=40028000 R01=00000003 R02=00000000 R03=00000000
R04=40028000 R05=00000003 R06=00000000 R07=00000000
R08=00000000 R09=00000000 R10=00000000 R11=00000000
R12=40005000 R13=20006620 R14=fffffff9 R15=20006668
PSR=60000153 -ZC- A svc32
FPSCR: 00000000
Aborted (core dumped)

thanks
-- PMM
