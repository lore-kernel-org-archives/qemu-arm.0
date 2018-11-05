Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2297309wro;
        Mon, 5 Nov 2018 00:17:26 -0800 (PST)
X-Google-Smtp-Source: AJdET5eBzFJT5r80+GpiGhQ1arPXGGr4vXgTjVsojbDgPZ5V3Hr++QH++/zOstJFDepFtFhk4IOq
X-Received: by 2002:ac8:1243:: with SMTP id g3mr16715344qtj.139.1541405845943;
        Mon, 05 Nov 2018 00:17:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541405845; cv=none;
        d=google.com; s=arc-20160816;
        b=UvW72zEWJhB4AEVHVAb4JDDazvBfExYPcavGm1Z6IkTNjxBtzn0ICEwQpF0xHICQ2q
         6eHDOsvIkHYl4A2lnpA/qF4tvVEAgEqbBrUkF5QP9YMkN4BF2eQq7FAM6F6NWynyiOah
         lkKS+ylz7Jmjf4YMdJrtX3lkGhkPWOet9mCSmgw/QCJw85nIUXy5tfN19+l0TDuo9tfR
         RBp+ZMDZPAjNY/GNr4oCxlAM5NTBG4sBz3UEokH5vOuNBfdohb+4HAQeXaclpCvuBNxw
         1GNrYDOKB2tlgR074nzVjnn7fUr+LxC6Y8RBFEytZyayftymJwiUipUWO7V85pZg0WqN
         k7sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=z2qyoADdVCYl+nAsqbvKNIc59Po+j7hDjMTWSZBPfZk=;
        b=rWiWlKtxlopAkrI1yXQ4jWXDu/YtwJOfrLX2AU9ZfWdlMbNFk6FoE8N/KLo435eA4j
         XVsfAMHKwETv007ZNI8W3pW//nJG42SNqBf1JnH9RbjewvUlsksTBxOX/AIGQT8lB9rg
         0tlWa3/V8EhuZC5ZSvMs3TeT+kuub5Bq3FNDA/c6+IMAm5BLUE/RIEFWlRhr8hQkgDvK
         Ts7r4bRm/uALAjbV1lD4q5BnXsQDiVzG9bZL21orxuYrMcOhYfLgMWARERcCw7vsX5uM
         BNFsLDowczJcf7r00WwoXytWWJFXBSXxbEfTG0qZLJQFcoP2b9BJMxABx/EqF3J/zDIl
         UxQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 52si143154qvr.211.2018.11.05.00.17.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Nov 2018 00:17:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33713 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJa4b-00078c-Av
	for alex.bennee@linaro.org; Mon, 05 Nov 2018 03:17:25 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39642)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gJa4G-00076a-9r
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 03:17:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1gJa4C-0008L9-VG
	for qemu-arm@nongnu.org; Mon, 05 Nov 2018 03:17:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:49750)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1gJa4C-0008KG-MU; Mon, 05 Nov 2018 03:17:00 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A59B458E2D;
	Mon,  5 Nov 2018 08:16:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-158.ams2.redhat.com
	[10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 582D41822C;
	Mon,  5 Nov 2018 08:16:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 7D202945; Mon,  5 Nov 2018 09:16:56 +0100 (CET)
Date: Mon, 5 Nov 2018 09:16:56 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <20181105081656.3u5vankppvabxmlg@sirius.home.kraxel.org>
References: <20181029223207.31878-1-philmd@redhat.com>
	<20181029223207.31878-4-philmd@redhat.com>
	<20181030063830.edjacusffvgwvnt2@sirius.home.kraxel.org>
	<fc4b00b2-dda0-a0fb-e7b8-487065dbf6cc@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc4b00b2-dda0-a0fb-e7b8-487065dbf6cc@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 05 Nov 2018 08:16:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 3/3] arm: allwinner: Enable USB EHCI
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Icenowy Zheng <icenowy@aosc.xyz>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wCY4dOlmx6oN

> > > @@ -116,6 +116,8 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
> > >       if (machine_usb(current_machine)) {
> > >           sysbus_create_simple("sysbus-ohci", 0x01c14400, s->irq[64]);
> > >           sysbus_create_simple("sysbus-ohci", 0x01c1c400, s->irq[65]);
> > > +        sysbus_create_simple(TYPE_AW_A10_EHCI, 0x01c14000, s->irq[39]);
> > > +        sysbus_create_simple(TYPE_AW_A10_EHCI, 0x01c1c000, s->irq[40]);
> > 
> > Hmm, is this a companion controller setup?  If so, then this is a bit
> > more complicated  (see ehci_create_ich9_with_companions()).
> 
> I don't have enough USB knowledge. Can we have companion setup without PCI?
> 
> Per the datashit [1] p. 215 "21. USB Host Controller", each controller share
> the same PHY. There is no mention of companion setup:
> 
>   The USB host controller includes the following features:
>   ..
>   - Complies with EHCI Specification, Version 1.0,
>   - and  the OHCI Specification, Version 1.0a.
>   ..
>   - Support only 1 USB Root Port shared between EHCI and OHCI.

Looks like a companion setup.  Short introduction:

The port is shared, and ehci controls whenever the port is assigned to
ehci or the companion (ohci in this case).  Typically the ehci driver
sets the bit depending on usb device speed, i.e. usb2 devices are
handled by ehci and usb1 devices are handled by ohci.

By default ohci owns the devices, so in case the OS has no ehci driver
ohci can be used to handle usb2 devices in usb1 compat mode.  Pretty
much moot these days.

On the qemu side you basically have to initialize ehci first (so the usb
bus exists), then set the masterbus property to the ehci usb-bus for the
ohci controller.

HTH,
  Gerd

