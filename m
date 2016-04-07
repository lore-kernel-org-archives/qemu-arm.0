Received: by 10.25.208.211 with SMTP id h202csp408328lfg;
        Thu, 7 Apr 2016 03:11:56 -0700 (PDT)
X-Received: by 10.55.26.95 with SMTP id a92mr2279153qka.99.1460023916502;
        Thu, 07 Apr 2016 03:11:56 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 74si5327488qhc.32.2016.04.07.03.11.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Apr 2016 03:11:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48747 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ao6up-0002L1-B2
	for alex.bennee@linaro.org; Thu, 07 Apr 2016 06:11:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ao6ug-0002Bf-B6
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 06:11:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ao6uc-00046w-EA
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 06:11:46 -0400
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:34416)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ao6uc-00044e-7P
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 06:11:42 -0400
Received: by mail-vk0-x22a.google.com with SMTP id e185so92688659vkb.1
	for <qemu-arm@nongnu.org>; Thu, 07 Apr 2016 03:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sWN1wjqGKKDEswxsc+p2hHv13CGn5VN8OabGIKNgycU=;
	b=cGOHzB0N3e4r29RDROFhzyjfsPS29tlqn+eFvxXAQM/3Ywe4KyaPSt9UY2+rEoG1PT
	iwO3AVoKjS9ebRrlv463xHOIoXJH2S94BCz2xVooLFsBSGnVM6MQAkm5oAdXvtAIv8jm
	0Awd77qEE3HpyPxCkKSTFZeGeBo6wM8d+F/Vs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sWN1wjqGKKDEswxsc+p2hHv13CGn5VN8OabGIKNgycU=;
	b=WL5G1jOYzOlpClMQGqNubIOoXWrDe8nHNoe86Hm+a/lbgU1ZPPPFW0L0YZQDejdhXw
	glyBez8V9OQjoFJFEm5uNDilALla7FSr90tM3NVC0g97QyDDRCbvdp9wMRri0QmOJos7
	XuysyH4rRqU7ra6PDjBlushhPbO0+fGy8jZaIetr9m55EIQawJYir32EjTeFsR+GRhB3
	/2gTAYwhTGsOc4hCiU2qFSTgln1w0i2DdMHzGINBOM2kBZgLHOHxRrAvXrZUD2X/Rbiq
	F0PlPMR0J1U6sjO9u/wJ4pRC22D7LCV/66eThibGXFtfnRrBI1sTciMfxsE8qp7fR9DN
	Gc0A==
X-Gm-Message-State: AD7BkJJpnU/IuxLLbwSKOizDhpTAM8V0zFzAFiAgGjdHJ6lrEiZBR4GmhU8khRv4lInaFerKWVyYXAPgA2dh749K
X-Received: by 10.31.149.73 with SMTP id x70mr776767vkd.83.1460023900530; Thu,
	07 Apr 2016 03:11:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 7 Apr 2016 03:11:21 -0700 (PDT)
In-Reply-To: <1460023087-31509-3-git-send-email-vijayak@caviumnetworks.com>
References: <1460023087-31509-1-git-send-email-vijayak@caviumnetworks.com>
	<1460023087-31509-3-git-send-email-vijayak@caviumnetworks.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Apr 2016 11:11:21 +0100
Message-ID: <CAFEAcA_0ssT32oNrgTHChKsAJNkjUfCHFGg2vPtk8-AWsRjVqw@mail.gmail.com>
To: Vijaya Kumar K <vijayak@caviumnetworks.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: Vijay Kilari <vijay.kilari@gmail.com>,
	Prasun Kapoor <Prasun.Kapoor@caviumnetworks.com>, knv.suresh2009@gmail.com,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Suresh <ksuresh@caviumnetworks.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [RFC PATCH v2 2/3] utils: Add cpuinfo helper to
	fetch /proc/cpuinfo
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
X-TUID: 083ilI4HUtFw

On 7 April 2016 at 10:58,  <vijayak@caviumnetworks.com> wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>
>
> utils cannot read target cpu information to
> fetch cpu information to implement cpu specific
> features or erratas. For this parse /proc/cpuinfo
> and fetch cpu information.
>
> For now this helper only fetches cpu information
> for arm architectures.

As I understand it /proc/cpuinfo is intended only for
humans to read. Please don't write code to parse it;
find a different way to get this information instead
if you really need it.

(I'm not really happy about such specific-to-a-particular-vendor
patches in QEMU anyway; we should have migration code that
works acceptably for any implementation.)

thanks
-- PMM
