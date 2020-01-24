Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp741135lfp;
        Fri, 24 Jan 2020 08:07:08 -0800 (PST)
X-Google-Smtp-Source: APXvYqzcPP3PqAJbnUDXtIm0yUMmEM2fz90XzrmGDaLNaijp6r41G1sD+mYtLsQ7QZtjJGbwv38y
X-Received: by 2002:ac8:2bcd:: with SMTP id n13mr2930595qtn.21.1579882028408;
        Fri, 24 Jan 2020 08:07:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579882028; cv=none;
        d=google.com; s=arc-20160816;
        b=owF4XC9cXlgZjdc0fn3SdSkrkw/jzDSgAT40tAgVbHDMvtsHBpSPyXYshmY2bwyNo0
         4cjnHtYsw9eCSn8iPY34+pzcL+PnuwesrUcBNSKZ0dyQCtXhe5pFRSPaTpChVG8FAwKj
         e0NOacLWuUxTWpiD6a1SRnJEZGsbavV5KcvyuiJZQjQ/2dNci3zqAMDKRS0AcdhmsbxK
         LLtXnRNBp536eIDR7CRRTkJ1fUFF7vQOFb2/fIkZclRNhcqzmhw6zMbCtRbGcLGWdJQ9
         XdqmqGDmPugsUDXHLaSCw9xzYVDC9+CpR++y+Bz4Nn55UOfB8+csIuIRbud9R4W6y/QC
         JOdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=2OD6EmgVRI606kaR3df7L7ceXBYGNXrBYq3J7BJX4dU=;
        b=sopAIUdfOzG1z+52Cb0ZMzX9PTvsi/bfL3nUu2glOT+d7cCxZfXWV8xmHCXTwof7ix
         NDjcJianmfzxGBu4O5l+ZEyRz8GpI/YoYfMB36V8JnNxgpenBVk6MpRgTXIioMOVLEck
         BPOhlG3Hd+xcEF3uEKEjhyt3dPgjKFigW/O/WfMGNZkOWJrbbMvxeXI+4kg7XamtdWBO
         BM3NRahoceLa0WCnduyRvJhgldtOAOymxdNn3nSLePIWrrs8dXSl5Dpo1c+srYHhhuAd
         KMK7hPgauAY6vZndR7HNocUtCk4q4aPReGbojb4j0mH3EEbBQGxGD8/gKbVcG53GYEx0
         bBew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XRHxBj05;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21si3922708qtp.41.2020.01.24.08.07.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Jan 2020 08:07:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XRHxBj05;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iv1UB-0008EF-Q0
	for alex.bennee@linaro.org; Fri, 24 Jan 2020 11:07:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33069)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iv1U2-0008E6-Tg
 for qemu-arm@nongnu.org; Fri, 24 Jan 2020 11:07:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iv1U1-0004UU-Fa
 for qemu-arm@nongnu.org; Fri, 24 Jan 2020 11:06:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:34236
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iv1U1-0004Ta-BL
 for qemu-arm@nongnu.org; Fri, 24 Jan 2020 11:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579882016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2OD6EmgVRI606kaR3df7L7ceXBYGNXrBYq3J7BJX4dU=;
 b=XRHxBj05zp4RE3PZaiHiu6Z5mud0oBC7n8DwlyLZGYW/eQcGzekSW5GoLy9uEUNxWeLll9
 V5uIebkpiZAFpxDa2py/XqSrAKXoYRW+Xqxnlkzjr8Zxh4cYhHyXBtozIqg6WHEAnjcjUw
 e0WGhl/tJy42a0mwtZsrkimVUJr1bWo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-54-GkHPOsdPN4ict0Gbpc1i6g-1; Fri, 24 Jan 2020 11:06:50 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE4BA192C0A5;
 Fri, 24 Jan 2020 16:06:48 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7447B4DA0D;
 Fri, 24 Jan 2020 16:06:47 +0000 (UTC)
Date: Fri, 24 Jan 2020 17:06:45 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Subject: Re: [Question] Regarding containers
 "unattached/peripheral/anonymous" - their relation with hot(un)plug of
 devices
Message-ID: <20200124170645.3d794ac6@redhat.com>
In-Reply-To: <77dbc712482545078986adcd72567630@huawei.com>
References: <70446b6cbf5442488a40fe809f38c3c8@huawei.com>
 <20200124145404.1d15209e@redhat.com>
 <77dbc712482545078986adcd72567630@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: GkHPOsdPN4ict0Gbpc1i6g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, pbonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8Tz35V/wz6n0

On Fri, 24 Jan 2020 15:02:10 +0000
Salil Mehta <salil.mehta@huawei.com> wrote:

> > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > Sent: Friday, January 24, 2020 1:54 PM
> > To: Salil Mehta <salil.mehta@huawei.com>
> > 
> > On Fri, 24 Jan 2020 11:20:15 +0000
> > Salil Mehta <salil.mehta@huawei.com> wrote:
> >   
> > > Hello,
> > > I am working on vCPU Hotplug feature for ARM64 and I am in mid of understanding
> > > some aspect of device_add/device_del interface of the QEMU.
> > >
> > > Observations:
> > > 1. Any object initialised by qmp_device_add() gets into /machine/unattached
> > > container. I traced the flow to code leg inside  device_set_realized()
> > > 2. I could see the reverse qmp_device_del() expects the device to be in
> > > /machine/peripheral container.
> > > 3. I could see any object initially added to unattached container did not had
> > > their parents until object_add_property_child() was called further in the leg.
> > > which effectively meant a new property was created and property table
> > > populated and child was parented.
> > > 4. Generally, container  /machine/peripheral was being used wherever
> > > DEVICE(dev)->id was present and non-null.
> > >
> > > Question:
> > > 1. Wanted to confirm my understanding about the use of having separate
> > > containers like unattached, peripheral and anonymous.  
> >   
> > > 2. At init time all the vcpus goes under *unattached* container. Now,
> > > qmp_device_del() cannot be used to unplug them. I am wondering  
> > 
> > device is put into 'unattached' in case it wasn't assigned a parent.
> > Usually it happens when board creates device directly.  
> 
> 
> Sure, but if we decide that certain number(N) of vcpus are hotplugabble
> and certain subset of N (say 'n' < 'N') should be allowed to be present
> or cold-plugged at the init time then I wonder which of the following
> is correct approach:
> 
> 1. Bring all of N vcpus at boot time under "peripheral" container
>                                    OR
> 2. Just bring subset 'n' of 'N' under "peripheral" container and rest
>     under "unattached" container? And later as and when rest of the
>     vcpus are hotplugged they should be transferred from "unattached"
>     container to "peripheral" container?

issue with that is that to put device into "peripheral" container,
'the user' must provide 'id'. (currently QEMU isn't able to do it on its own [1])

But it doesn't mean that cold-plugged CPUs can't be unpluged.
What current users could do is start QEMU like this (simplified version):

 $QEMU -smp 1,maxcpus=N -device foo-cpu-type,id=CPU00 -device foo-cpu-type,id=CPU01 ...

i.e. 1st CPU is not manageable due to lack if 'id' and is created by board code,
the rest have 'id' and could be managed.


Question is:
  why you are looking into 'what container' is used for CPUs?


1) here is what I could find on IDs topic
   https://lists.gnu.org/archive/html/qemu-block/2015-09/msg00011.html
 
> > >    if all the hotplug devices need to go under the *peripheral* container while
> > > they are hotplugged and during object init time as well?  
> > 
> > theoretically device_del may use QOM path (the later users can get with
> > query-hotpluggable-cpus),
> > but I think it's mostly debugging feature.  
> 
> 
> Sure.
> 
> 
> > users are supposed to specify 'id' during -device/device_add if they are going
> > to manage that device.
> > afterwards (like unplugging it). Then they could use that 'id' in other commands
> > (including device_del)
> > 
> > So 'id'-ed devices end up in 'peripheral' container.  
> 
> 
> Sure, what if hotplugged device is removed and then added again? It looks 
> qmp_device_add() interface will again end up calling the device_set_realized()
> which eventually would put hotplugged devices under "unattached" container?

it won't, see call chain:

  qmp_device_add()
      -> qdev_device_add()
          -> qdev_set_id()

 
> > > 3. I could not see any device being place under *anonymous* container during  
> > init time. What is the use of this container?
> > 
> > if I recall it right, devices created with help of device_add but without 'id'
> > go to this container  
> 
> 
> Any examples on top of your head where such an interface might be of use?

ex:
one could use -device/device_add without any ids if such devices aren't planned
to be unplugged during runtime or for unpluggable devices

> 
> 
> Many thanks
> Salil.
>

