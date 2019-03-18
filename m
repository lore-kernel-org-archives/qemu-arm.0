Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp2579716wrt;
        Mon, 18 Mar 2019 10:00:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxbeDBopucgB+Mh0L73KhDfxtuMv5Hkt670zhd05HJrsqv6tvwh/aA9o6FPwTLFVaxukVYY
X-Received: by 2002:a1c:5581:: with SMTP id j123mr12740761wmb.10.1552928428741;
        Mon, 18 Mar 2019 10:00:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552928428; cv=none;
        d=google.com; s=arc-20160816;
        b=XyUu8FRuF1BXyRJzDshsSqTDvnYteXaX3z/YDxGWVe0psRXWdsf83hM5rjgO2VwxLp
         1SPLX5sIeUzfTa2i97uX4PCt0xi0GML/7ut7f3GFBFBeEGSM4ak9ySn1tA6wCQcAmnlt
         71HkUWa7JNKuzGMdSpxaPXut5uIsbKlJpODMaPRwwJv6oorRPN10LXENKRrePusYdDlL
         x4CjpyNK/vrZ8BsbDtBS+uLikQ3rAu8YezdjWu8lfqy9iKv4zXUhZU2qPVHlua/25+0e
         0Y5HDdwDOxkbpwxLi23RhqnEqS0b2jqzkY32kwlrQ9ZCK4QvFvlWNvDkpcYYdtELXz0O
         ovFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=AR3+K9SUbVZhx+JBxLflxWByEvPLkrrUXcngXiIbNmA=;
        b=VARktnkcGz6N6GrsKty05NXY10npsDmmoWZuHV5GL1WnFA7dPBf96uYq/pCCYxxGI2
         Vm3WCJNoY6tTFyLqioJAUyYD+BWzZPilYMgtXjZ2/VH8Tgjb0ehyBFAG0hmtI3oHkXWC
         AmeCkF5pvrScTChowdRmkCBrmgaSdzcy4MaCPjOZ2l6Wwk7hH4MIvC4vq26WxS5gnON4
         K5rdBfiVdsxIm7aIUmDPebzxR46s3dCR0qUVICtQk7DH+pr4fV83gDcuZyQ4Ja43l0fl
         e9blGHVM5/BqJ7qBjpBfi6sgOirUQ/nGMz1hw0dAtcQYRsGDwQXzUQmoGD6GZZkvRnCc
         xn7g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w16si2217559wmk.36.2019.03.18.10.00.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Mar 2019 10:00:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:44596 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h5vch-0006H3-Ts
	for alex.bennee@linaro.org; Mon, 18 Mar 2019 13:00:27 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h5vcX-0006Gu-Nt
	for qemu-arm@nongnu.org; Mon, 18 Mar 2019 13:00:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h5vcW-0000uL-MV
	for qemu-arm@nongnu.org; Mon, 18 Mar 2019 13:00:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43228)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h5vcW-0000tk-6d; Mon, 18 Mar 2019 13:00:16 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F60581F22;
	Mon, 18 Mar 2019 17:00:15 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C2764648A8;
	Mon, 18 Mar 2019 17:00:10 +0000 (UTC)
Date: Mon, 18 Mar 2019 18:00:09 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190318180009.5ee284ad@redhat.com>
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA839316F30@lhreml524-mbs.china.huawei.com>
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-10-shameerali.kolothum.thodi@huawei.com>
	<20190318132601.6cf82e50@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA839316F30@lhreml524-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 18 Mar 2019 17:00:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 09/11] hw/acpi: Add ACPI Generic Event
 Device Support
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"sameo@linux.intel.com" <sameo@linux.intel.com>,
	"shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Linuxarm <linuxarm@huawei.com>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"xuwei \(O\)" <xuwei5@huawei.com>,
	"sebastien.boeuf@intel.com" <sebastien.boeuf@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: B58gDn6uvBDw

On Mon, 18 Mar 2019 15:04:28 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> Hi Igor,
> 
> > -----Original Message-----
> > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > Sent: 18 March 2019 12:26
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> > eric.auger@redhat.com; peter.maydell@linaro.org;
> > shannon.zhaosl@gmail.com; sameo@linux.intel.com;
> > sebastien.boeuf@intel.com; Linuxarm <linuxarm@huawei.com>; xuwei (O)
> > <xuwei5@huawei.com>
> > Subject: Re: [PATCH v2 09/11] hw/acpi: Add ACPI Generic Event Device Support
> > 
> > On Fri, 8 Mar 2019 11:42:16 +0000
> > Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> >   
> > > From: Samuel Ortiz <sameo@linux.intel.com>
> > >
> > > The ACPI Generic Event Device (GED) is a hardware-reduced specific
> > > device that handles all platform events, including the hotplug ones.
> > > This patch generate the AML code that defines GEDs.
> > > Platforms need to specify their own GedEvent array to describe what kind
> > > of events they want to support through GED. The build_ged_aml routine
> > > takes a GedEvent array that maps a specific GED event to an IRQ number.
> > > Then we use that array to build both the _CRS and the _EVT section
> > > of the GED device.  
> > 
> > I'd this a part of "virtual ACPI device"  
> 
> Just to confirm, you meant, instead of separate virt-acpi.c and ged.c, move the
> contents of this patch into "virtual ACPI device" implementation (something like 
> hw/acpi/generic-event-device.c) ?
yep, and only moving bit making hw related routines form virt-acpi.c
a part of ged device model where they are called at appropriate times 
like initfn/realize or property setting time.

Then ACPI functions (not part of device but could be in the same file)
would fetch all necessary data from ged device and generate AML code from it.

> 
> Please let me know.
> 
> Thanks,
> Shameer
> 
> > > This is in preparation for making use of GED for ARM/virt
> > > platform and for now supports only memory hotplug.
> > >
> > > Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> > > Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
> > > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > > ---  
> > [...]  

