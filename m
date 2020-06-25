Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1603088lfm;
        Thu, 25 Jun 2020 12:22:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGw2bQPe2t9Ol3dIsMyq5L9IVBJDlylv7txyzrn0iRGrrUYWGieVzivG34AeW2+2O2aDol
X-Received: by 2002:a25:d354:: with SMTP id e81mr58156761ybf.398.1593112966150;
        Thu, 25 Jun 2020 12:22:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593112966; cv=none;
        d=google.com; s=arc-20160816;
        b=Zn5h/GMZ6tXRskW7jYNpadpYNgTT0M7dDzczNPkzz5SHjUKoqCSUWgN6AHsuLwPwPX
         78DzsCCYsTvSj2E6z0Kw/lKHBqUbQpKe3FUb39YjP3STxG5SWta69q4IYUlheEj0O4dY
         76UI3/c5GdUHfdz5jqciMSJRZiFyRGKpIYJ4+OwYaAC+iJBt1USkm4mwN9rTPRFRMJwQ
         /2czavHyEnLl4VS1kcFiaY9EbpBfPUoco9VtCrlz79XhI29ZpWa7gC+54qO1D5c1d9SN
         ndUiO0Z59Ru4p3DeXc/LGAH3k0RNQFTHoA/5yCSgAurvZZDq8Ls20M/SPXwtNLMGNMKD
         dzKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=0iShD19wp9YTTxv0x44Rvr6CqNGEC/8AUUFzp+JXOpc=;
        b=H5uH1gwbZuyuw9iTaTWKa5yX3AFU0KUDr1lMmtr0YfM13ewv9hVezB7siid55318wi
         lp4C8XAEFIRegb+MH97PiIU/eNN6V+VL1yb6HOZ/7oTtMXn/HGXm0yTxijXPwVXpn2wg
         bjDMK6luTVcev801KXfIWQ/eW5q4nqbNVt+1XpuBdQr8eijBlenRhW8Wl2BFZxh9AvnI
         Ehht9RNVkyJulNvnXRrFyLzxx2prKdKCEvhP34CvVLZcoSUF9Fj+UMMD9WpJZOT7IFzi
         o5ZF3Fcql06F3dcwAjA7+PVWBgcStIiCvRdHjzrFoTd7PMp06f+fZlP2C7IjqycpaTaR
         4Lyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gaIBL0DJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f123si24474298ybg.424.2020.06.25.12.22.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 12:22:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=gaIBL0DJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1joXSP-00026d-H7
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 15:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1joXSI-00025s-BS
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 15:22:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:32362
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1joXSG-000595-Db
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 15:22:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593112955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0iShD19wp9YTTxv0x44Rvr6CqNGEC/8AUUFzp+JXOpc=;
 b=gaIBL0DJ1Q+dOfqT3l/6NCpYs7dEZTjEk7/JwV4OhwIWWENNENiaon9fTReky3cFrJrxIT
 KY9abPyYNgg6vQ5/aG8/VmF4OeNqrz2Kh2i3Xp0XAO2oyh71w6Xh887pnBFid3YFNFw59G
 RABtChFOf3lgt8Is6VezjQH90NzclfI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-khy1ZqZDM7a9KYZg9rw-4w-1; Thu, 25 Jun 2020 15:22:31 -0400
X-MC-Unique: khy1ZqZDM7a9KYZg9rw-4w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42D678064BC;
 Thu, 25 Jun 2020 19:22:30 +0000 (UTC)
Received: from localhost (unknown [10.40.208.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B31785D9E7;
 Thu, 25 Jun 2020 19:22:19 +0000 (UTC)
Date: Thu, 25 Jun 2020 21:22:17 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v4] arm/virt: Add memory hot remove support
Message-ID: <20200625212217.554a3233@redhat.com>
In-Reply-To: <3375d8e35d3a481d8298ce3e6a4ce531@huawei.com>
References: <20200622124157.20360-1-shameerali.kolothum.thodi@huawei.com>
 <20200624160834.5191b73e@redhat.com>
 <3375d8e35d3a481d8298ce3e6a4ce531@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 01:47:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, "mst@redhat.com" <mst@redhat.com>,
 Linuxarm <linuxarm@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "xuwei \(O\)" <xuwei5@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mde9K3linHfp

On Wed, 24 Jun 2020 16:50:11 +0000
Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com> wrote:

> > -----Original Message-----
> > From: Igor Mammedov [mailto:imammedo@redhat.com]
> > Sent: 24 June 2020 15:09
> > To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> > Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org;
> > peter.maydell@linaro.org; mst@redhat.com; Linuxarm
> > <linuxarm@huawei.com>; xuwei (O) <xuwei5@huawei.com>;
> > eric.auger@redhat.com; Zengtao (B) <prime.zeng@hisilicon.com>
> > Subject: Re: [PATCH v4] arm/virt: Add memory hot remove support
> > 
> > On Mon, 22 Jun 2020 13:41:57 +0100
> > Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:
> >   
> > > This adds support for memory(pc-dimm) hot remove on arm/virt that
> > > uses acpi ged device.
> > >
> > > NVDIMM hot removal is not yet supported.
> > >
> > > Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> > > ---
> > > v2 --> v3
> > >   -Addressed Eric's comments on v3.
> > > v2 --> v3
> > >   -Addressed Eric's review comment and added check for NVDIMM.
> > > RFC v1 --> v2
> > >   -Rebased on top of latest Qemu master.
> > >   -Dropped "RFC" and tested with kernel 5.7-rc6
> > > ---
> > >  hw/acpi/generic_event_device.c | 29 ++++++++++++++++
> > >  hw/arm/virt.c                  | 62  
> > ++++++++++++++++++++++++++++++++--  
> > >  2 files changed, 89 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/hw/acpi/generic_event_device.c  
> > b/hw/acpi/generic_event_device.c  
> > > index 1cb34111e5..b8abdefa1c 100644
> > > --- a/hw/acpi/generic_event_device.c
> > > +++ b/hw/acpi/generic_event_device.c
> > > @@ -193,6 +193,33 @@ static void  
> 
> [...]
> 
> > > +static void virt_dimm_unplug(HotplugHandler *hotplug_dev,
> > > +                             DeviceState *dev, Error **errp)
> > > +{
> > > +    VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
> > > +    Error *local_err = NULL;
> > > +
> > > +    hotplug_handler_unplug(HOTPLUG_HANDLER(vms->acpi_dev), dev,  
> > &local_err);  
> > > +    if (local_err) {
> > > +        goto out;
> > > +    }
> > > +
> > > +    pc_dimm_unplug(PC_DIMM(dev), MACHINE(vms));
> > > +    qdev_unrealize(dev);  
> > 
> > doesn't pc_dimm_unplug() do unrealize already?
> > (/me wonders why it doesn't explode here,
> > are we leaking a refference somewhere so dimm is still alive?)  
> 
> Does it? From a quick look at the code it is not obvious.
> 
> pc_dimm_unplug()
>   memory_device_unplug()
>     memory_region_del_subregion()
>   vmstate_unregister_ram()
>     qemu_ram_unset_idstr()
>     qemu_ram_unset_migratable()
> 
> If it does, then we may need to fix x86/ppc as well.
you are right, it's correct.
I mixed it up with:
 pc_memory_unplug()
     pc_dimm_unplug(PC_DIMM(dev), MACHINE(pcms));
     object_property_set_bool(OBJECT(dev), false, "realized", &error_abort);


> 
> Thanks,
> Shameer
> 
> > > +
> > > +out:
> > > +    error_propagate(errp, local_err);
> > > +}
> > > +
> > >  static void virt_machine_device_unplug_request_cb(HotplugHandler  
> > *hotplug_dev,  
> > >                                            DeviceState *dev, Error  
> > **errp)  
> > >  {
> > > -    error_setg(errp, "device unplug request for unsupported device"
> > > -               " type: %s", object_get_typename(OBJECT(dev)));
> > > +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > > +        virt_dimm_unplug_request(hotplug_dev, dev, errp);
> > > +    } else {
> > > +        error_setg(errp, "device unplug request for unsupported device"
> > > +                   " type: %s", object_get_typename(OBJECT(dev)));
> > > +    }
> > > +}
> > > +
> > > +static void virt_machine_device_unplug_cb(HotplugHandler *hotplug_dev,
> > > +                                          DeviceState *dev, Error  
> > **errp)  
> > > +{
> > > +    if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> > > +        virt_dimm_unplug(hotplug_dev, dev, errp);
> > > +    } else {
> > > +        error_setg(errp, "virt: device unplug for unsupported device"
> > > +                   " type: %s", object_get_typename(OBJECT(dev)));
> > > +    }
> > >  }
> > >
> > >  static HotplugHandler *virt_machine_get_hotplug_handler(MachineState  
> > *machine,  
> > > @@ -2262,6 +2319,7 @@ static void virt_machine_class_init(ObjectClass  
> > *oc, void *data)  
> > >      hc->pre_plug = virt_machine_device_pre_plug_cb;
> > >      hc->plug = virt_machine_device_plug_cb;
> > >      hc->unplug_request = virt_machine_device_unplug_request_cb;
> > > +    hc->unplug = virt_machine_device_unplug_cb;
> > >      mc->numa_mem_supported = true;
> > >      mc->nvdimm_supported = true;
> > >      mc->auto_enable_numa_with_memhp = true;  
> 

