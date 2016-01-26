Received: by 10.25.159.19 with SMTP id i19csp2014214lfe;
        Tue, 26 Jan 2016 11:41:17 -0800 (PST)
X-Received: by 10.140.253.3 with SMTP id y3mr32310177qhc.39.1453837277889;
        Tue, 26 Jan 2016 11:41:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e195si2852461qhc.85.2016.01.26.11.41.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jan 2016 11:41:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:46374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aO9UL-0004sL-E3
	for alex.bennee@linaro.org; Tue, 26 Jan 2016 14:41:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55789)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aO9UJ-0004sB-2E
	for qemu-arm@nongnu.org; Tue, 26 Jan 2016 14:41:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aO9UH-0003Aj-Uo
	for qemu-arm@nongnu.org; Tue, 26 Jan 2016 14:41:14 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:34290)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aO9UH-0003AH-GP
	for qemu-arm@nongnu.org; Tue, 26 Jan 2016 14:41:13 -0500
Received: by mail-vk0-x22a.google.com with SMTP id e185so98022566vkb.1
	for <qemu-arm@nongnu.org>; Tue, 26 Jan 2016 11:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=C3+KJ6yCzPxnB0l8kF3y/w/XxrKQqQcNjm2iGWy8aGs=;
	b=JFOEwHDYXX2mzRLs49Uau1GPR1HXScdD5Y27ysXfIfGFQ/iYTIfo3bvKEwnPOjdOue
	ME1VxorzZVyzuWkbsMkmZCl+BGGgQge2fwyxiJcKl5dOoPt9jqe0/OLx+rDxZsSFz+Uf
	YeiT1oJHs7UhlNj4PH2EQmFzU6ndbSwfaGUIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=C3+KJ6yCzPxnB0l8kF3y/w/XxrKQqQcNjm2iGWy8aGs=;
	b=mZVzbLrwsAllPjuQWCKdLR5U2ynsCLy3j61oBAFDLCx3xw8y2vAg5AjlXZQXLiAWQI
	HME1h5SHdEMR63J6QCq0mTPKoWTWZHw+W436rv5ssEcSXIqqeEu3WO9lt611Nw7hLs0Z
	vwm4SSR7g708Y/FjKhByJUabqE7Yx8iWynf7ZLpt6ePKeIheyFHQKj9PKbecffaFfEOP
	chf93dFWSWmPDJ63H3aF4FyUnrkQB+7dWa16bDUIMVSez9lTMIYwt7R3MKksflbNEcL+
	LdfWqfp19G5H2yqYthDqt2cWz/XCBvfid1O7ZX/t2zIWIBiPYOGFoZdi5EaYHIsFcnpE
	QU5w==
X-Gm-Message-State: AG10YORH3I50K9IkoPb49zvp/W2nKbOz3tpmvrsJJGL899bMFA2WSzRIrpSLuQWVrYyhzIb+eERHdZ/gdBwLZVr5
X-Received: by 10.31.131.199 with SMTP id f190mr9030703vkd.90.1453837272779;
	Tue, 26 Jan 2016 11:41:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 26 Jan 2016 11:40:53 -0800 (PST)
In-Reply-To: <BLUPR0301MB20347E506B5172A98D5377229ED80@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1452902337-13844-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1452902337-13844-5-git-send-email-Andrew.Baumann@microsoft.com>
	<CAPokK=qp6vgfLPD+iai2-quyXD3ODPtNQgZLS1Kfwgn-ZCYMRw@mail.gmail.com>
	<BLUPR0301MB2034FAE99E63647A00D388E79ED80@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=rXwURCOc=-W1v+2=Br2kZ4fDXdPUR6gc=UdyoVisY_Bw@mail.gmail.com>
	<BLUPR0301MB20347E506B5172A98D5377229ED80@BLUPR0301MB2034.namprd03.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jan 2016 19:40:53 +0000
Message-ID: <CAFEAcA9WBwOVLmU9FYsuBGXqLdty3MAjnCcpwr96-2XSiWiptQ@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: Rob Herring <robh@kernel.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v4 4/8] bcm2835_peripherals: add rollup
	device for bcm2835 peripherals
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
X-TUID: J7LIXWmjZo6L

On 26 January 2016 at 19:12, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
>> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>> Sent: Tuesday, 26 January 2016 00:03
>> On Mon, Jan 25, 2016 at 10:23 PM, Andrew Baumann
>> <Andrew.Baumann@microsoft.com> wrote:
>> >> > +    /* Memory region for peripheral devices, which we export to our
>> >> parent */
>> >> > +    memory_region_init_io(&s->peri_mr, obj, NULL, s, "bcm2835-
>> >> peripherals",
>> >> > +                          0x1000000);
>> >>
>> >> Should this just be normal memory_region_init?
>> >
>> > I think so -- it's just a container region, and I probably copy and pasted the
>> API here. The two MR init APIs seem almost but not-quite identical when
>> NULL callbacks are used. Can you briefly explain the difference?

NULL callbacks are the same thing as memory_region_init_reservation(),
which is for defining a "you can't get here" part of the address space.
This is used only when KVM is enabled, by devices whose real implementation
of a bit of memory mapped IO is in the host kernel. The host kernel will
intercept accesses to that region and QEMU never sees accesses to them
(exception: emulated DMA, which is the only reason there's a behaviour
at all rather than an assertion). This is why such regions get marked as
mr->terminates: they really do have no "holes" in them.

So the general rules are:
 * use a plain container (created via memory_region_init())
   for almost any situation where you're creating something whose
   behaviour is built up by adding together subregions
 * use memory_region_init_io() with non-NULL ops for creating straightforward
   "leaf" regions which have defined device behaviour
 * similarly, memory_region_init_ram() for ram, etc
 * use memory_region_init_reservation() or memory_region_init_io() with a
   NULL ops pointer if you're the QEMU part of a KVM in-kernel
   irqchip/etc.
 * If you have a container memory region, but you need a "behaviour for
   the bits that aren't covered by specific subregions" that's specific to
   this device, then you have two choices:
   (a) use a "background" subregion that covers the whole space and
       has a lower priority than any of the other subregions
   (b) create your container with one of the other memory_region_init
       functions and use the IO callbacks/ram/etc to define the background
       behaviour. Such an object will still support subregions being added.
   I think (a) is generally cleaner, but the API permits adding
   subregions to MRs other than pure containers for the benefit of
   the odd few cases where (b) is done.

docs/memory.txt could probably use an update to:
(a) specifically mention the functions to use to create the various
regions listed in the 'Types of regions' section
(b) describe the 'reservation' kind of memory region

thanks
-- PMM
