Received: by 2002:a19:ee17:0:0:0:0:0 with SMTP id g23csp705714lfb;
        Fri, 22 Jan 2021 02:18:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyQkR/7K441YxMfp1rYkwxakYmenI7YqboAI0xbMpLeU4umqVjRjI+hGNuBv6dE4L2zry8
X-Received: by 2002:a25:2554:: with SMTP id l81mr5427581ybl.243.1611310681836;
        Fri, 22 Jan 2021 02:18:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611310681; cv=none;
        d=google.com; s=arc-20160816;
        b=sd4X0wKKLLEYFYDbFLj9s9XVxQqG7Xdb/dqm3fdN7EKzLDuUxo+j7bYmYUTwxd7TqR
         i8xGZqnwzZBn7Ag6tEKAKf/br8FwLmY+p7U85PmROvMIQStoUub4nSvDywVgJZkhZIxA
         b69OLLhOX/Q03l6hfscdKazOfWPUIPIUOlBvMudzOOYja6Awg7S4qvIfhTkyCCMCgc1K
         fseTZPJJ2/4ks5Yv6E7Vw8Q3IxKHEBZ+l1Uc6ggUaFDsjJ4DZSXta9olv/0vIP5+QUen
         6BdKljpNwoUEcczN4eEdaY5AcwWbChffF4nbNjfTi0sICgLbQdr47zf+jv7GK0Y0P0Tr
         Am8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=uOGq1pf/oSqwehpeVVjmz839Z/VDxUSKqGp7ob3DT14=;
        b=z75Bs+mPy1L/oNlm22CXnvhXZ28hWl88PgLCP94u4cvCo7aXHXjrs/SVRU4RCAB9g3
         DqkdT/dGw+6BxY2w5PcueHZBQbqt9m7tWRroeVLggzTkCk9HnRAolHlvsnBz7DOCBxYi
         VFDhl9YNhz8M5dIuzeloVKNR6rk72LTcbuwHtSJ1YHj8UJX0IhKiSvqzmyLUhyIPeesc
         RocZZ9/ulkA1o6gqe0uXH4XWpyYMJKWoPHtXFMLz9aUOe/i8yiEUNYg91yHe2NHTiAMl
         Bn+vyaN1PvFfcfqOLXYWqeaOamC7NoRD2VnhbJcIunbQC+wCyo4VSGaY3mdZRurjJ+yD
         4CdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="UwvyV/53";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19si8127989yba.458.2021.01.22.02.18.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Jan 2021 02:18:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="UwvyV/53";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l2tVx-00050N-7g
	for alex.bennee@linaro.org; Fri, 22 Jan 2021 05:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l2tVh-0004xe-CD
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 05:17:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1l2tVe-0001zE-G9
 for qemu-arm@nongnu.org; Fri, 22 Jan 2021 05:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611310661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uOGq1pf/oSqwehpeVVjmz839Z/VDxUSKqGp7ob3DT14=;
 b=UwvyV/53oAhfL6wrHD4bqqZmVa140i16sOUN9jaA5JtURig/pexsw/vKbFiHpc58SLMnRK
 4GwpHA6COYPLI5UExN4CgsFfZr9dGDGLhj6Y9rRjpOELq/Ed3IxWwHTev+giGzk9wFvnSz
 sBl7OgJhv7nXXJ3FUb5LUtAWaiIdKbY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-597-8qABLODOOv-w0fch2GHv6Q-1; Fri, 22 Jan 2021 05:17:39 -0500
X-MC-Unique: 8qABLODOOv-w0fch2GHv6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D448107ACE3;
 Fri, 22 Jan 2021 10:17:32 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.139])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70CAF19C59;
 Fri, 22 Jan 2021 10:17:30 +0000 (UTC)
Date: Fri, 22 Jan 2021 11:17:27 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCHv8 3/3] arm-virt: add secure pl061 for reset/power down
Message-ID: <20210122101727.6sf6x6wrpjwo2h34@kamzik.brq.redhat.com>
References: <20210120092748.14789-1-maxim.uvarov@linaro.org>
 <20210120092748.14789-4-maxim.uvarov@linaro.org>
 <20210122082926.nakttrh53zzt6d2x@kamzik.brq.redhat.com>
 <CAFEAcA9Oa7BXPhzK4BytsQiByP-MWEnm6OsdBhc6w9+5y4BnFQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9Oa7BXPhzK4BytsQiByP-MWEnm6OsdBhc6w9+5y4BnFQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>, Jose Marinho <Jose.Marinho@arm.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 tf-a@lists.trustedfirmware.org, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iXBWhVt5oAV3

On Fri, Jan 22, 2021 at 10:09:35AM +0000, Peter Maydell wrote:
> On Fri, 22 Jan 2021 at 08:29, Andrew Jones <drjones@redhat.com> wrote:
> >
> > On Wed, Jan 20, 2021 at 12:27:48PM +0300, Maxim Uvarov wrote:
> > > Add secure pl061 for reset/power down machine from
> > > the secure world (Arm Trusted Firmware). Connect it
> > > with gpio-pwr driver.
> > >
> > > Signed-off-by: Maxim Uvarov <maxim.uvarov@linaro.org>
> > > ---
> > >  hw/arm/Kconfig        |  1 +
> > >  hw/arm/virt.c         | 47 +++++++++++++++++++++++++++++++++++++++++++
> > >  include/hw/arm/virt.h |  2 ++
> > >  3 files changed, 50 insertions(+)
> > >
> > > diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> > > index 0a242e4c5d..13cc42dcc8 100644
> > > --- a/hw/arm/Kconfig
> > > +++ b/hw/arm/Kconfig
> > > @@ -17,6 +17,7 @@ config ARM_VIRT
> > >      select PL011 # UART
> > >      select PL031 # RTC
> > >      select PL061 # GPIO
> > > +    select GPIO_PWR
> > >      select PLATFORM_BUS
> > >      select SMBIOS
> > >      select VIRTIO_MMIO
> > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > index c427ce5f81..060a5f492e 100644
> > > --- a/hw/arm/virt.c
> > > +++ b/hw/arm/virt.c
> > > @@ -153,6 +153,7 @@ static const MemMapEntry base_memmap[] = {
> > >      [VIRT_ACPI_GED] =           { 0x09080000, ACPI_GED_EVT_SEL_LEN },
> > >      [VIRT_NVDIMM_ACPI] =        { 0x09090000, NVDIMM_ACPI_IO_LEN},
> > >      [VIRT_PVTIME] =             { 0x090a0000, 0x00010000 },
> > > +    [VIRT_SECURE_GPIO] =        { 0x090b0000, 0x00001000 },
> > >      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
> > >      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
> > >      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> > > @@ -841,6 +842,43 @@ static void create_gpio_keys(const VirtMachineState *vms,
> > >                             "gpios", phandle, 3, 0);
> > >  }
> > >
> > > +#define SECURE_GPIO_POWEROFF 0
> > > +#define SECURE_GPIO_REBOOT   1
> > > +
> > > +static void create_gpio_pwr(const VirtMachineState *vms,
> >
> > This function is specific to the secure view. I think it should have
> > "secure" in its name.
> >
> > > +                            DeviceState *pl061_dev,
> > > +                            uint32_t phandle)
> > > +{
> > > +    DeviceState *gpio_pwr_dev;
> > > +
> > > +    /* gpio-pwr */
> > > +    gpio_pwr_dev = sysbus_create_simple("gpio-pwr", -1, NULL);
> >
> > Should this device be in secure memory?
> 
> It's not in any memory at all -- -1 as the address argument
> to sysbus_create_simple() means "no MMIO regions to map". The
> only way it's connected to the rest of the system is via  the
> secure-only PL061, so the NS world can't get at it.
> 
> (sysbus_create_simple("device", -1, NULL) is equivalent to:
>  dev = qdev_new("device");
>  sysbus_realize_and_unref(SYSBUS_DEVICE(dev), &error_fatal);
> )
>

Thanks, I should have looked more closely at that.

With the function name change to include "secure".

Reviewed-by: Andrew Jones <drjones@redhat.com>

