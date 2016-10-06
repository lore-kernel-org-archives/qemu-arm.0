Received: by 10.80.163.71 with SMTP id 65csp3354129edn;
        Thu, 6 Oct 2016 11:00:06 -0700 (PDT)
X-Received: by 10.237.49.5 with SMTP id 5mr15167546qtg.136.1475776806699;
        Thu, 06 Oct 2016 11:00:06 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s127si8363334qkc.40.2016.10.06.11.00.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Oct 2016 11:00:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58669 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bsCxh-000628-G8
	for alex.bennee@linaro.org; Thu, 06 Oct 2016 14:00:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsCxa-00060f-Eh
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 13:59:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsCxY-0000Bc-MH
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 13:59:58 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:33894)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bsCxY-0000BA-8y
	for qemu-arm@nongnu.org; Thu, 06 Oct 2016 13:59:56 -0400
Received: by mail-vk0-x235.google.com with SMTP id b186so25154019vkb.1
	for <qemu-arm@nongnu.org>; Thu, 06 Oct 2016 10:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hRFyE4RmXhi7gB1z/HxnmTmdXDDMjgQvbEdAkySmbH0=;
	b=CGAM+7kCT1Mst8dBL7evR8WC64MbD+Ttu+jhjGsIaAKr+jwzP000hNZg+LArAai1tm
	0hA5oEImClIYQKibDsPfYzcnwzf81XnIZ2tVCn9CeoiP9O+flpKHrebwjCmGi8BAFrUR
	AUeIWjQQAtjdZe+xeQUY5HyFz4gbRp3wUL6II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hRFyE4RmXhi7gB1z/HxnmTmdXDDMjgQvbEdAkySmbH0=;
	b=SgT0xVEt7yIm0KwuOLX19wiKb7EURF7jzi4x8jzky6KAOJaHA+utRPqyB1mWNWyLuY
	si/ApGInFJZJ9xBjDlp2iBT3oEU9e0jZuMhiUdSsBuaDPIIv5cWEMTog3HxdL1AXe3jE
	NwKAPA9VJl05pjUSSUzv+uucVay09ydnpMSwlSCqJK/GA34AtW+Y/WJV86bNQErzcMpE
	GS8vuXny3keSINOX+loDrZfD32OO5qNRR1LxaPo8zoMDVsH4l8KZX22Bf7fdhxYCN7zh
	LgrOYjvAoSgro0R5Nyjpw6A4F1q7uVqcEaEfKFI5Y0pT3yIpzQywSE765IlBmdfmm8ES
	PfcA==
X-Gm-Message-State: AA6/9RneZoNblnu2szyBvKA2mccpOn2+V54Rsw/Om2hOJuyBiZQkKycS2v9RVL4TMaYm8E6l7V1YjJTqJAChVhlZ
X-Received: by 10.31.64.75 with SMTP id n72mr10314647vka.170.1475776795472;
	Thu, 06 Oct 2016 10:59:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.195.70 with HTTP; Thu, 6 Oct 2016 10:59:34 -0700 (PDT)
In-Reply-To: <CAFEAcA_855eaHmu8gdHhbocmMujaJ9+ucm9Lqj31PLQP2t4g5Q@mail.gmail.com>
References: <1475760067-25756-1-git-send-email-peter.maydell@linaro.org>
	<20161006165921.GD28109@toto>
	<CAFEAcA_855eaHmu8gdHhbocmMujaJ9+ucm9Lqj31PLQP2t4g5Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2016 18:59:34 +0100
Message-ID: <CAFEAcA-vhLyq63M4uknPmcenvV9xEzvhAeF8cvK9L8ykQWOxcg@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-arm] [PATCH 0/3] preliminaries for GICv3 virt support
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kNe3a+zM8NwW

On 6 October 2016 at 18:48, Peter Maydell <peter.maydell@linaro.org> wrote:
> Trying the kvm-unit-tests, the simple 'setup' test
> works OK, but the one which tries to PSCI boot other SMP cores
> fails.

This is probably because the outer QEMU is intercepting those
PSCI calls and executing them itself rather than allowing the
EL2 guest to do the work...

-- PMM
