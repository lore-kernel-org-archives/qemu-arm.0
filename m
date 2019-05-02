Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp7136187wrh;
        Thu, 2 May 2019 08:24:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzEyv6IRI67dFztey4hOx9ALKEzX5h20m18m1WWZlA41KW9tz8yjrImnADvV4uy38GtlOvi
X-Received: by 2002:a7b:c301:: with SMTP id k1mr2731460wmj.37.1556810691440;
        Thu, 02 May 2019 08:24:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556810691; cv=none;
        d=google.com; s=arc-20160816;
        b=Tj5ddcpc4AGL0TKZr2NdP1QslPfQ06mU6O4u08SBCA1pp/ngSZENZjkOB3ncLSHWmk
         8w4jsheyy6JMTvmVGj3cQbWL7DAaVUXDJms45D3sjXi3u2c0aOmc7VnkdWM8xXsEtXg/
         sis/JFSHMA1g7ASq430ViJDg+udGl1EX+hcdaf1Ys9sxx2AF1LScLLPe6KAx9zebg/vw
         Kt4KDlUHgjMBEQvLRQ60DLVJocrGxArNR12QWfKOHM2DrgbINOVejAneAvW/ZfSRW9pc
         Zq9iM/38FKdOU0oeMpcrW1z+2S9P0tQX9DN6G8Tk54FCpP58P1A609uDL2vWK+GJ/Wkb
         LV5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=6yWA2iLeOR23NjYvy7b/S4UgKGliK5MSB01HF0JAV+I=;
        b=KYSA5PW+pDY50VapB+zd5EUZv6kIvHp+Dh5+3o8u1IOGtiRfqp36yqcMFrN/jKQWi9
         Zn0Sms0x6dpd2a9fd5aoJ5yQqHD+4XazvngM+S1CsWAlU20+4Jbs1zKzQ474P5TOIObM
         hmEzuEOxhErWiabdgyu+zpJinVze1FyuhPorDMTURWuvYzARA/8TPp1GQzIW1X845SAV
         /6uCMSGqSXCCpXbZZnw3eV6xxRl1Lt5MoLZ7zeb1kyrHeOHRyPb1426M1PHRTAzEHD7v
         M6FX7KnAjfw8SlCXLvjrOohOm9CMNGQk3OO/wsumv5Huw3W0LVHV+bLylbmPBR4AJLel
         XbBA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14si7562342wrp.44.2019.05.02.08.24.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 May 2019 08:24:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:53094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hMDZq-0005yh-E2
	for alex.bennee@linaro.org; Thu, 02 May 2019 11:24:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hMDZa-0005wp-4x
	for qemu-arm@nongnu.org; Thu, 02 May 2019 11:24:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hMDZY-0008Dp-S9
	for qemu-arm@nongnu.org; Thu, 02 May 2019 11:24:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43077)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hMDZW-00084A-Ui; Thu, 02 May 2019 11:24:31 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC33130917AA;
	Thu,  2 May 2019 15:24:29 +0000 (UTC)
Received: from Igors-MacBook-Pro (unknown [10.40.205.168])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 61CF517A67;
	Thu,  2 May 2019 15:24:24 +0000 (UTC)
Date: Thu, 2 May 2019 17:24:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190502172418.2b7d6d84@Igors-MacBook-Pro>
In-Reply-To: <CAKv+Gu9yw6s=N+LkKmQ+0d5ZQBJ+5tE0_cKtZAYHh_cTXnjyCQ@mail.gmail.com>
References: <20190409102935.28292-1-shameerali.kolothum.thodi@huawei.com>
	<20190409102935.28292-4-shameerali.kolothum.thodi@huawei.com>
	<CAKv+Gu_guvAydmCZDeVnj0NR_WyTHeCmwh4tK9WKUBY6cy-4Pg@mail.gmail.com>
	<5FC3163CFD30C246ABAA99954A238FA83F137685@lhreml524-mbs.china.huawei.com>
	<CAKv+Gu9yw6s=N+LkKmQ+0d5ZQBJ+5tE0_cKtZAYHh_cTXnjyCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 02 May 2019 15:24:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 3/8] hw/acpi: Add ACPI
 Generic Event Device Support
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	Auger Eric <eric.auger@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Linuxarm <linuxarm@huawei.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>,
	Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RI9zo+MJd4Y9

On Thu, 2 May 2019 09:22:35 +0200
Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:

> On Wed, 1 May 2019 at 13:25, Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com> wrote:
> >
> > Hi Ard,
> >
> > > -----Original Message-----
> > > From: Ard Biesheuvel [mailto:ard.biesheuvel@linaro.org]
> > > Sent: 01 May 2019 12:10
> > > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > > Cc: QEMU Developers <qemu-devel@nongnu.org>; qemu-arm
> > > <qemu-arm@nongnu.org>; Auger Eric <eric.auger@redhat.com>; Igor
> > > Mammedov <imammedo@redhat.com>; Peter Maydell
> > > <peter.maydell@linaro.org>; shannon.zhaosl@gmail.com;
> > > sameo@linux.intel.com; sebastien.boeuf@intel.com; xuwei (O)
> > > <xuwei5@huawei.com>; Laszlo Ersek <lersek@redhat.com>; Linuxarm
> > > <linuxarm@huawei.com>
> > > Subject: Re: [PATCH v4 3/8] hw/acpi: Add ACPI Generic Event Device Support
> > >
> > > On Tue, 9 Apr 2019 at 12:31, Shameer Kolothum
> > > <shameerali.kolothum.thodi@huawei.com> wrote:
> > > >
> > > > From: Samuel Ortiz <sameo@linux.intel.com>
> > > >
> > > > The ACPI Generic Event Device (GED) is a hardware-reduced specific
> > > > device[ACPI v6.1 Section 5.6.9] that handles all platform events,
> > > > including the hotplug ones.This patch generates the AML code that
> > > > defines GEDs.
> > > >
> > > > Platforms need to specify their own GedEvent array to describe what
> > > > kind of events they want to support through GED.  Also this uses a
> > > > a single interrupt for the  GED device, relying on IO memory region
> > > > to communicate the type of device affected by the interrupt. This
> > > > way, we can support up to 32 events with a unique interrupt.
> > > >
> > > > This supports only memory hotplug for now.
> > > >
> > > > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > > > Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
> > > > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > >
> > > Apologies if this question has been raised before, but do we really
> > > need a separate device for this? We already handle the power button
> > > via _AEI/_Exx on the GPIO device, and I think we should be able to add
> > > additional events using that interface, rather than have two event
> > > signalling methods/devices on the same platform.
> >
> > Right. The initial RFC was based on GPIO device[1] and later Igor commented
> > here[2] that,
> >
> > " ARM boards were first to use ACPI hw-reduced profile so they picked up
> > available back then GPIO based way to deliver hotplug event, later spec
> > introduced Generic Event Device for that means to use with hw-reduced
> > profile, which NEMU implemented[1], so I'd use that rather than ad-hoc
> > GPIO mapping. I'd guess it will more compatible with various contemporary
> > guests and we could reuse the same code for both x86/arm virt boards) "
> >
> 
> On mach-virt, we already use the GPIO controller for the ACPI event
> involving the power button, so by aligning with virt-x86, we end up in
> the opposite situation for mach-virt.
> 
> The problem with the GED device is that it only supports GSI
> interrupts, while the GPIO device supports arbitrary interrupts (such
> as GPIO signalled ones). This means that mach-virt will be stuck with
> having two different methods of signalling ACPI events, unless we
> rewire the power button not to use a GPIO interrupt but use a GSI
> directly.

we can rewire power button then.


> In general, I think the ACPI event delivery mechanism doesn't really
> have to be aligned: the ACPI event is ultimately converted into a AML
> notification to the right device, and how we end up there can remain
> platform specific.

Reasoning for using GED is to reduce code duplication with x86
and not creating zoo of different approached (if it could be avoided).
