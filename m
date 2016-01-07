Received: by 10.182.158.201 with SMTP id ww9csp68913obb;
        Thu, 7 Jan 2016 10:09:41 -0800 (PST)
X-Received: by 10.55.55.72 with SMTP id e69mr137131755qka.42.1452190181690;
        Thu, 07 Jan 2016 10:09:41 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g5si486159qgf.113.2016.01.07.10.09.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Jan 2016 10:09:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:59966 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aHF0H-0001Rd-B6
	for alex.bennee@linaro.org; Thu, 07 Jan 2016 13:09:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aHF0F-0001RG-89
	for qemu-arm@nongnu.org; Thu, 07 Jan 2016 13:09:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aHF0E-0004KS-GO
	for qemu-arm@nongnu.org; Thu, 07 Jan 2016 13:09:39 -0500
Received: from mail-vk0-x22c.google.com ([2607:f8b0:400c:c05::22c]:35811)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aHF0E-0004KF-D0
	for qemu-arm@nongnu.org; Thu, 07 Jan 2016 13:09:38 -0500
Received: by mail-vk0-x22c.google.com with SMTP id k1so178478132vkb.2
	for <qemu-arm@nongnu.org>; Thu, 07 Jan 2016 10:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5GKzd4TV2tWxsLIbaLD224lS9S+9yuko8zuovD644xE=;
	b=jtnwCdSJ0BLhcts4CDElUBKoFPTpzIhBa0b3VrQARV5qj14smcDY/XriWDwAuSMjuC
	GM2ClefYCrBnCYumarLr61LzNrqyu7mypMYkzyvlwX/Waic4DUQR6iCKmmjc5q9IWuMn
	Xm933KyvxJmE+gp5xRM8T4JSJ6dJoF/Ie5gDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5GKzd4TV2tWxsLIbaLD224lS9S+9yuko8zuovD644xE=;
	b=c7xgVvq0FDdu4aJpaYZPFwMkPswLRBnkxEei+/YHET2qNT6O5l8/9nCIf6GpRlEra5
	g6sj7usbHQ28hRDmuUtQtExTlxKqK7VK4PAgaePoKFLz74ZzFoMGfcTUspx0U5HAMLUn
	DT4R3kMJltvQJ0Xf7hXqxlShSFy+COUYFsjoL7tqoq4QC+m4lMNVXmNSKOw8in6HRLd8
	3lPRIOulgLTvLyhkJ2axXKapN+CZrLC//vTT8Rv3vJ4F6GwownIHvk4ZcOneMKN4cAwj
	ZnAk+a1K8hhFXiGC9mlcb8aJQV+osJZHnrcyBMameZYadhukgJrAKc6PPmb5UFyra7Hu
	valQ==
X-Gm-Message-State: ALoCoQlRcaAT1jukdA4gWsxVPMGEP0CgXBvw4KgOba57IWfE+8aYGuiei4b6Gm82A1qNSWdtaIWJ885xACOeTwrGUtWjAecAGMdURtx/mDmt6mRMoYej8t0=
X-Received: by 10.31.141.2 with SMTP id p2mr51019424vkd.37.1452190178116; Thu,
	07 Jan 2016 10:09:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Thu, 7 Jan 2016 10:09:18 -0800 (PST)
In-Reply-To: <CAPokK=pPvPxLu3fkkz7qA9gahG1Sm2cWJYBYeDgw6A1Q2bfjeQ@mail.gmail.com>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-5-git-send-email-peter.maydell@linaro.org>
	<20151219213830.GE4164@pcrost-box>
	<CAFEAcA8MKt-dJU5p=w_jOLv4+dFXtHaCHps=51=9ZM49wXesjw@mail.gmail.com>
	<CAPokK=pPvPxLu3fkkz7qA9gahG1Sm2cWJYBYeDgw6A1Q2bfjeQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Jan 2016 18:09:18 +0000
Message-ID: <CAFEAcA8U1U67yy6wJErZYUyEEGcqnmGTTeDLbiUqzc7wG3tiPQ@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22c
Cc: Kevin O'Connor <kevin@koconnor.net>, Qemu-block <qemu-block@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, Patch Tracking <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 04/10] hw/sd: Add QOM bus which SD cards plug
	in to
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
X-TUID: WqxUrhTDfZ1R

On 20 December 2015 at 20:51, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Sun, Dec 20, 2015 at 9:10 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> For user-level back compat I think we need to retain "might have
>> an sdcard object with no block backend, and that means
>> 'no-card-present'". This is both for the user facing
>> monitor commands to manipulate the sd card, and also
>
> What are the user-facing monitor commands? I tried using "change" and
> "eject", but they don't seem to work for SD, due to the tray being
> closed. Has this ever worked in a way that is user manipulatable for
> SD or is it just to handle the case of unconditional SD card creation
> (with the card never hotplugging over the system lifetime)?

I investigated this, and it looks like we accidentally broke
'change' for SD cards in 2.5 (specifically in commit de2c6c05).
I think we should fix that regression, which in turn implies that
we still want to support the "sd card object with no block backend" case.

thanks
-- PMM
