Received: by 10.80.163.71 with SMTP id 65csp604161edn;
        Thu, 29 Sep 2016 17:39:27 -0700 (PDT)
X-Received: by 10.55.180.2 with SMTP id d2mr3964363qkf.175.1475195967455;
        Thu, 29 Sep 2016 17:39:27 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s1si10402406qks.266.2016.09.29.17.39.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 29 Sep 2016 17:39:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41039 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bplrK-0004PC-Vq
	for alex.bennee@linaro.org; Thu, 29 Sep 2016 20:39:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplrE-0004Nf-Mo
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 20:39:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplrC-0007B6-Ra
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 20:39:19 -0400
Received: from mail-ua0-x22e.google.com ([2607:f8b0:400c:c08::22e]:35145)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bplrC-0007Ax-NO
	for qemu-arm@nongnu.org; Thu, 29 Sep 2016 20:39:18 -0400
Received: by mail-ua0-x22e.google.com with SMTP id q42so81074541uaq.2
	for <qemu-arm@nongnu.org>; Thu, 29 Sep 2016 17:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2L5sI+H1HRcFDXXZnx1TULJfNDdfnjOVKElcewDN23A=;
	b=DoRaG5W3sW0ApQ7cTblR0vA9cIj3OOCT+qv7+NLASGYOew2RjG0y5fyddBVhTZ9T7a
	Is+17BgFDkrqybiwDo00qyQlJRcmDhCmjd8mv1870uNszpPlhr86px1On5RF6xrOX9fE
	GsS9Sq0GR43j21+79bAqnKTU3/9VW6ge85VL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2L5sI+H1HRcFDXXZnx1TULJfNDdfnjOVKElcewDN23A=;
	b=W9KHdKUYJAu3tFXx1A4dwdac0BherjVqrkzYE9rv73GyEyR5ZkOY081ix0c1L4Odr0
	nYOIgIALI9IBk7p3UzK4suUC9bl9ay7LDVTKBMIAoXsIRHuraqTFeWN42ZBcYgyPFCOo
	InINkpCL1XwZWlk3FY2/ASX/nZScbJ18yF9WlZPVWBehOzFqlUY6sr0KXuMyZpdU2sde
	FvMnX2ep6hgam5aYkmNGSv7KA1DLWiri3z97ldkj+VK2R5AYIhebTdbBAkXlGPMqiT4m
	lxXAnPMIzCFMjNfjvyj5GoH1dCXY0zUnhXImxz9ana5J/b24P+l8x+PIU6mPeqr1Rb0S
	zH4g==
X-Gm-Message-State: AA6/9RmXUjLKa/ohkbgpHFxn1FgBM+xXH6raIeH1k16anmJukbtmVWFXJMwgv5XPCif/AH4UFbUyS2Wf5y5uJzw7
X-Received: by 10.176.69.238 with SMTP id u101mr1107415uau.175.1475195958328; 
	Thu, 29 Sep 2016 17:39:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.16.98 with HTTP; Thu, 29 Sep 2016 17:38:57 -0700 (PDT)
In-Reply-To: <CAFEAcA8YpEL-Ox=Qdf7gFch_03VwEuAzFXW_uL+xUfoUfYr==A@mail.gmail.com>
References: <1474616617-366-1-git-send-email-eric.auger@redhat.com>
	<1474616617-366-6-git-send-email-eric.auger@redhat.com>
	<CAFEAcA8YpEL-Ox=Qdf7gFch_03VwEuAzFXW_uL+xUfoUfYr==A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Sep 2016 17:38:57 -0700
Message-ID: <CAFEAcA-dfXQtHpZ5EGmUO_HY=OKty=xQpcjRXToTB9pNw5nvWw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::22e
Subject: Re: [Qemu-arm] [PATCH v7 5/8] hw/intc/arm_gicv3_its: Implement
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
X-TUID: mcllxjaSoUWD

On 29 September 2016 at 17:38, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 23 September 2016 at 00:43, Eric Auger <eric.auger@redhat.com> wrote:
>> From: Pavel Fedin <p.fedin@samsung.com>
>>
>> The ITS control frame is in-kernel emulated while accesses to the
>> GITS_TRANSLATER are mediated through the KVM_SIGNAL_MSI ioctl (MSI
>> direct MSI injection advertised by the CAP_SIGNAL_MSI capability)
>>
>> the kvm_gsi_direct_mapping is explicitly set to false to emphasize the
>> difference with GICv2M. Direct mapping cannot work with ITS since
>> the content of the MSI data is not the target interrupt ID but an
>> eventd id.
>>
>> GSI routing is advertised (kvm_gsi_routing_allowed) as well as
>> msi/irqfd signaling (kvm_msi_via_irqfd_allowed).
>>
>> The MSI frame (GITS_TRANSLATER) absolute GPA is computed on first
>> kvm_its_send_msi() call. It is then passed through KVM_SIGNAL_MSI
>> ioctl.
>>
>> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
>
>
> Applied to target-arm.next, thanks.

Oops, meant to send that as a followup to the cover letter!

thanks
-- PMM
