Received: by 10.80.163.71 with SMTP id 65csp86479edn;
        Thu, 22 Sep 2016 10:14:58 -0700 (PDT)
X-Received: by 10.200.48.156 with SMTP id v28mr3160617qta.49.1474564498545;
        Thu, 22 Sep 2016 10:14:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id k40si1806167qtb.149.2016.09.22.10.14.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Sep 2016 10:14:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54228 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bn7aL-0005tR-Ua
	for alex.bennee@linaro.org; Thu, 22 Sep 2016 13:14:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn6PV-0004io-C9
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 11:59:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn6PT-0000zK-GH
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 11:59:40 -0400
Received: from mail-ua0-x232.google.com ([2607:f8b0:400c:c08::232]:33585)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bn6PT-0000yh-9Y
	for qemu-arm@nongnu.org; Thu, 22 Sep 2016 11:59:39 -0400
Received: by mail-ua0-x232.google.com with SMTP id u68so3469006uau.0
	for <qemu-arm@nongnu.org>; Thu, 22 Sep 2016 08:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W8rpLAItNA7YOGdGCZNPrx2cEtioNeZ093d40wKsmBw=;
	b=erYm1QxhjxBFWQ2OW1b1UKsIw8sRIh1KF0EkN5roAFKXusDeszMNLkJEcb8q4VY+mc
	zaZVOlBW3ld6cs+IipJZysWefKGQsr5TBasq8X9gcG0sfcz6nA7SHkogxO0PvBf9s14B
	dYJpyY0FKqbqP7xYkL5tqzFcluJjo5sP92MrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W8rpLAItNA7YOGdGCZNPrx2cEtioNeZ093d40wKsmBw=;
	b=KvgIt1CCPRG2oLfcl+JN+5iuM7p3FKpFKsVO7MTXEm3I58oB+N63pVPfnoV9tpSK5v
	3+oM7JNtbjUTy8IGSVdjTNpaPQub7Nw7dHuEwUb3A4ulBzXwIHzZVhZ82yEbtp9F7l2p
	3DZgQ6xFqRBd/GAovaRFS1aNHgBFszT2fCoA4EGfKAmQZaH1Z5XE8f91PdeQZ6wb950F
	tUKIPOKAwMzpOCLiMzKVmQeWVejtVvqogvYoBPtp8+p26+UYCCUrj9/2mUabkXFPoBu0
	lZpt+HHq3lcmVOp8J72Qiqgq2B1PYcQhWlzxxKDB3D+7ilVzirNAfz3OMmcts3bg6nWz
	6Z5Q==
X-Gm-Message-State: AA6/9RkHTvly3SOaIoXoii/QKzG6NLdt41x6ZZ6DJFZ3W5FQ+DB9M5kN94lzoOMoxVze38oL+ZekPPKYFPaI0fSP
X-Received: by 10.176.3.129 with SMTP id 1mr429140uau.19.1474559978534; Thu,
	22 Sep 2016 08:59:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 22 Sep 2016 08:59:18 -0700 (PDT)
In-Reply-To: <c7f19ade-2d7b-9e09-91a9-e324b3c4efa1@redhat.com>
References: <1473442237-3746-1-git-send-email-eric.auger@redhat.com>
	<1473442237-3746-6-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8cy4LxamAXu86DmpGUebpuvaoNdUWCySbbZYzRNjN6Fw@mail.gmail.com>
	<c7f19ade-2d7b-9e09-91a9-e324b3c4efa1@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Sep 2016 16:59:18 +0100
Message-ID: <CAFEAcA-i_AJXc_=Voa1x7QkjfXQ1dZCZinhjo8e9XZATBuFeyw@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::232
Subject: Re: [Qemu-arm] [PATCH v6 5/8] hw/intc/arm_gicv3_its: Implement
 support for in-kernel ITS emulation
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
Cc: Andrew Jones <drjones@redhat.com>, Tomasz Nowicki <tn@semihalf.com>,
	Shlomo Pongratz <shlomopongratz@gmail.com>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Shannon Zhao <shannon.zhao@linaro.org>,
	Diana Craciun <diana.craciun@freescale.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SmFZLDlH9vwm

On 22 September 2016 at 16:53, Auger Eric <eric.auger@redhat.com> wrote:
> Hi Peter,
>
> On 22/09/2016 17:03, Peter Maydell wrote:
>> Also, I think it would be simpler to just have kvm_its_send_msi() do
>>
>>    if (unlikely(!s->translater_gpa_known)) {
>>        s->gits_translater_gpa = ...;
>>        s->translater_gpa_known = true;
>>    }
> My issue precisely is to get the absolue GPA of the ITS translater.
> kvm_its_send_msi is called by the region write callback which works on
> relative address wrt start of the translation region while kvm ioctl
> uses the absolute GPA. I did not see any other way to retrieve the
> absolute GPA than using a machine init done notifier.

I don't understand. There should be no difference between
(1) calculate gits_translater_gpa in the machine init done notifier
(2) calculate gits_translater_gpa the first time that we need it,
ie on first call to kvm_its_send_msi()

We don't use it anywhere else, do we ?

thanks
-- PMM
