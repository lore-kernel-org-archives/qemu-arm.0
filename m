Received: by 10.25.208.211 with SMTP id h202csp1141413lfg;
        Mon, 4 Apr 2016 06:35:49 -0700 (PDT)
X-Received: by 10.140.222.136 with SMTP id s130mr13145534qhb.62.1459776949166;
        Mon, 04 Apr 2016 06:35:49 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c207si10647675qhc.18.2016.04.04.06.35.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 04 Apr 2016 06:35:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58701 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1an4fU-0000cG-NU
	for alex.bennee@linaro.org; Mon, 04 Apr 2016 09:35:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an4fR-0000c8-Mo
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 09:35:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an4fL-0006xW-TM
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 09:35:45 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:34623)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1an4fL-0006xO-Oc
	for qemu-arm@nongnu.org; Mon, 04 Apr 2016 09:35:39 -0400
Received: by mail-vk0-x234.google.com with SMTP id e185so179399273vkb.1
	for <qemu-arm@nongnu.org>; Mon, 04 Apr 2016 06:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jtD2YUBPbFDpPVcBJDsYL4KkjruejpQrhhaNaeIlTlA=;
	b=Xxgx5FKhb+mkX9e4AexflsGvITpA57cIZRaGOZTp6MdJ37Se+oF3fuJjGuGu4lAEdL
	RxJWbuqZGU2lscB5/ll2YNTdFh9Fz9j6aOv+mnt7OEotK6yPLStkrptJTTxTf0GgPVaY
	/m4lGbUSTQXB0qE62/ny27N1No6ArPVkd0P6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jtD2YUBPbFDpPVcBJDsYL4KkjruejpQrhhaNaeIlTlA=;
	b=dJQhDVVLMHnkGT7i/LNYEGp9+MjtC7Y4BZ8kaQT4tmyKdrAgxGWwA2w+/gGw0ES1dF
	cNSTBaVrwvbJTQ+fI84Wxt34Rrn6kGHWnugMZti6ZJZCran9dZcDcjqeObUzzMkbfXW3
	bnDFDbaou27FEcaklOITz7H6JQQHnUpSc/8ulwgmCDMWmWVdOTDRMVSNZOsbS+7UycLG
	U1q7+ccVRVjbcR/SLGKyoSDBmoDo08k+mKz7S1+fa6ys85aS00pM08JaBEWr6hp8H0lz
	9vCnY8LlMYz+2CoMFlYdHSUvfatTTOeHo6+XgWcGQm28psakCQfzm9yfJI+Rd0x8zIdY
	df+g==
X-Gm-Message-State: AD7BkJLUKbE5hMDwaAyVA+luI4fHOvqG7I8YQ420lK+DdPSfEXi9EzBCNOb5Gl7MWLn5Er3rZ1CWFbsL8bPpf4XV
X-Received: by 10.31.52.147 with SMTP id b141mr7254208vka.82.1459776939307;
	Mon, 04 Apr 2016 06:35:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Mon, 4 Apr 2016 06:35:19 -0700 (PDT)
In-Reply-To: <CAOw6FiiPvuAx8=+DOptEFcnk4otm7M=eVxNB0VXfTihfQf1KzA@mail.gmail.com>
References: <CAOw6FiiPvuAx8=+DOptEFcnk4otm7M=eVxNB0VXfTihfQf1KzA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Apr 2016 14:35:19 +0100
Message-ID: <CAFEAcA8A=Q5yYHKWe5VFdV-n67RdSOnLXgcQM3MocfeNxRxwmQ@mail.gmail.com>
To: dharmik thakkar <dharmikthakkar16@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [Qemu-arm] Unable to run QEMU with ubuntu ARM image on mac.
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
X-TUID: L4jFN9EJKZCY

On 4 April 2016 at 06:30, dharmik thakkar <dharmikthakkar16@gmail.com> wrot=
e:
> I am trying to run ubuntu for arm using qemu. I have tried using differen=
t
> images for ubuntu but have ended up with same error =E2=80=98Trying to ex=
ecute code
> outside RAM or ROM at 0x08000000=E2=80=99.
>
> Below are the steps I have followed to run ubuntu on qemu -
>
>
> 1. qemu-img create -f qcow2 linuxarm.qcow2 10G.
>
> 2. qemu-system-arm -hda linuxarm.qcow2 -cdrom
> ~/Downloads/2015-04-06-ubuntu-trusty.zip -boot d -m 512 -M virt

This command line does not specify either:
   (a) a kernel to boot via -kernel
or (b) a BIOS image to boot via -bios (like UEFI)

So the emulator starts trying to execute instructions starting at
address zero, which are all NOPs until it reaches the end of the
emulated flash memory at 0x800000. Then it gives you this error.

You should change your command line one way or the other.

thanks
-- PMM
