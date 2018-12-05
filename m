Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp9472365wrt;
        Wed, 5 Dec 2018 06:55:16 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UbIkodN5LCp/geyChE2aTU27rk5ETrRf22djsE5TiZqXJPUJUN01eITOTD0ppl6BNlm9yr
X-Received: by 2002:a37:2c02:: with SMTP id s2mr22886516qkh.59.1544021716665;
        Wed, 05 Dec 2018 06:55:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544021716; cv=none;
        d=google.com; s=arc-20160816;
        b=NddslB0WicOy5SL3qY1FH5MUSrb9YuD6S/q5fpe1+TrV4Z2UKZ+/oezCxoWEQ41RtM
         oOcYhzSnZ9xY8PQct7FwhTADrvKlL/k53Fx/jZ/QvbUuxwTftFH5aXYjhmrWrVQBZAXF
         gvR+yHHuSNSXj70v0V5hEbZhkBLkkfM1ZQPVe4Jf1uq1/v0ycH3Jiqz8C5KCMI/0v/WL
         7/UjL8aQUjSRTHPOfzrG/5qSMmHXRHEXtAmqYk2e6Vfmkze2Ctd3/SRLHbcUY2A6mjiz
         jf58yEoBtFurK2AYKPqpYENWgyk+y05IqRlnQuTIY9/sJRZksvT1FjvlJT7LHMnlTM7Z
         5gvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=posjfS9WXSzTGa7jp3xUHgGLhtGe5F0KyWMhfOuQmNQ=;
        b=0gcEmT0Pw+Boxvfpm4nKLOrENkR4T9tNoNpjccFh4Gl55t54DSz9beL2qLUpr1xhUR
         vPWO+cQOIXN8KZg1MQrSyWH9n7b/QjD9h+AWyUGJBUWKoMAtPubcX6UIfU2YXyJLNwyC
         Ie86Zi0l0foYpVgChAS3fgdQlsqzWd71cvjEkogAoBcGW36+DZtdYzqp3MHU9W9wNOfL
         qV82vnptPBn7Ksar0FuubdB0UilBjGXVd05p8OEkTjzKa1YXuO8FQXtZGZlBbHBjiimo
         tSqsWKZrnjqckrBSwjqu6Qy9NyNLyCYxHaj2snW9fUyNAjxXYXLWYeIUi6AffSioeHAL
         dVUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FM8YPnN5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s135si10518658qke.231.2018.12.05.06.55.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 05 Dec 2018 06:55:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FM8YPnN5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gUYa4-0002N7-32
	for alex.bennee@linaro.org; Wed, 05 Dec 2018 09:55:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUYZS-00021D-Kn
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 09:54:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gUYZR-0001tb-5g
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 09:54:38 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:35020)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gUYZQ-0001r8-Ke
	for qemu-arm@nongnu.org; Wed, 05 Dec 2018 09:54:37 -0500
Received: by mail-oi1-x242.google.com with SMTP id v6so17746637oif.2
	for <qemu-arm@nongnu.org>; Wed, 05 Dec 2018 06:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=posjfS9WXSzTGa7jp3xUHgGLhtGe5F0KyWMhfOuQmNQ=;
	b=FM8YPnN5koS3oXCO0Tbix8CYGQLAvCGr2dRMj8mkcurlO8jY/8KkwjL37MhRsIHV/Y
	QJ4kjbewAasEgFa/BWdrrT1WqheiM4CKq48uQfZO2mcz6+YxzRprZziDvJMpHEi3G+5n
	S+U+VseDbyAFAtM87RRDmsT85AW9Yp2hbSmA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=posjfS9WXSzTGa7jp3xUHgGLhtGe5F0KyWMhfOuQmNQ=;
	b=NKk/iO+lP+RQ5oAWsmDI+L9bOOm967Y0u6t8OgYu4IKjtpPlM0OSjnnT1PB8nGxJV5
	h9EICOUWoXtB0U8nvsjVjFRgE04Gxvxk2eDwqC3NbDjRmMykRCVaZgXU35b4Jw+VneaT
	JBVnHuRHOQ0SB7rN8qY9X8hmNXfu+KMkTlpT7KGXu3leWwtciMo6ZwvzPilLdUujoESG
	PQrmLkEPa/2vNhKHTNad0hi3GY6syu4hMwI8JEQPpHBqKSiKtk4yJ34Vq+ffnzA8NO2B
	B7bklTLN4y/rVloqSN6fozNbf5z1yOLfy35CSVxtYCSI2K0cB6Qlf1V8NDPi+dfrw4HZ
	4ZGg==
X-Gm-Message-State: AA+aEWYgsBZ6cBhJCSDWwW7zEdV07VNNnQbCG6bDxhGoDNQb12PSPizz
	Q4aOMqDqtIazlIk+/vIOmVqnrfEmCyP1kTFIgeEGMQ==
X-Received: by 2002:aca:2dc9:: with SMTP id
	t192mr15837009oit.325.1544021675782; 
	Wed, 05 Dec 2018 06:54:35 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA8hw_PHrBTC+v9rr8VoeU5uiV3Z6nMRknDM7WWdG1Ti5g@mail.gmail.com>
	<201812050827458661131@zte.com.cn>
In-Reply-To: <201812050827458661131@zte.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Dec 2018 14:54:24 +0000
Message-ID: <CAFEAcA8s87tB4LGaVvJNpS0RN1gQ-ZjtzOBO0mWWQamBFiTzYw@mail.gmail.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH V11 0/8] add pvpanic mmio support
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6Py6axLZWot4

On Wed, 5 Dec 2018 at 00:28, <peng.hao2@zte.com.cn> wrote:
>
> >I'm afraid I don't understand. If it's a PCI device then
> >it does not need to be listed in the device tree or the
> >ACPI tables at all, because it is probeable by the guest.
> >This also significantly simplifies the changes needed in QEMU.
> >
>
> It is precisely because PCI devices can not be controlled by FDT or ACPI tables,
> I do not want to implement it as a pci device.
> X86/pvpanic is implemented as ISA device in QEMU and ACPI device in kernel.
> My implementation extends the implementation of x86/pvpanic, and a large of x86/pvpanic
> codes are reused.If PCI devices are implemented in qemu, then ACPI devices and PCI
> devices may appear simultaneously in the kernel. This would add both devices to the
> crash notifier list, which is odd. I want to see only one device at any time.

Yes, certainly we only need one pvpanic device. If it's implemented
as a PCI device, then that's what appears. We don't need and
would not implement the MMIO version. On x86 a user could
in theory use the command line to request both ISA and PCI
pvpanic devices. That would not be very sensible, but there
are lots of QEMU command lines the user can request that
don't make sense.

> Of course, many
> architectures can use PCI devices, but we are currently reusing x86/pvpanic code as much
> as possible in qemu and kernel , rather than reimplementing it. At the same time,
> backward compatibility also needs to be considered.
>
>                                      pvpanic in guest kernel
> ARM:   ACPI table         acpi device
>             FDT                  mmio device  (start guest bypassing uefi)
> x86      ACPI table         acpi device

For Arm, there is no backward compatibility issue, as we have
not yet implemented or shipped anything.

> >> Secondly, I don't want it to be a pluggable device. If the user
> >> deletes the device by mistake, it may lead to unpredictable results.
> >
> >If the user deletes the PCI device they're using for their
> >disk or networking this will also lead to unpredictable
> >results. We expect users not to randomly unplug things from
> >their system if they want it to continue to work. In any
> >case your guest driver can easily handle the unplug: the
> >guest would then just lose the ability to notify on panic,
> >falling back to as if the pvpanic device had never been
> >present.
>
> If two devices can exist simultaneously by modifying the code,
>  then because ACPI devices rely on a PCI device, if PCI devices are dynamically
>  unplugged, ACPI device will not work when panic is triggered.

If somebody modifies the code to QEMU or the guest kernel
such that something breaks, that's their issue to deal with.
My proposal is that we would ship:
 * a QEMU with a PCI pvpanic device (which you could plug in
   if you wanted it)
 * no changes to the Arm virt board, so nothing in the ACPI
   or device tree
 * no "mmio pvpanic" device

thanks
-- PMM
