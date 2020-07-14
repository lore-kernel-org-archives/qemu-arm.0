Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4063852lfm;
        Tue, 14 Jul 2020 02:32:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFLAmzCYqNVxHOQiT0nGGwycOfuHxbo+i137BfmfcwnOd5vcFfzfbDbEWk0ru/Aldypffg
X-Received: by 2002:a25:8801:: with SMTP id c1mr6491645ybl.174.1594719122035;
        Tue, 14 Jul 2020 02:32:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594719122; cv=none;
        d=google.com; s=arc-20160816;
        b=zo5ADa/A9ZVn1uJ2FTYkQe+m5KQ5kd+82oYPAPeR3bSUnuTH9MHRLfwVfMN1DEBnT2
         L/X3UqbJ2UddzYZ/jMtYwAzf8i863zLW9DumoPRTTUviP1xanhGM/KSwJXgiJHK05oTW
         2+DFaBx3jbypkY2w5UfhNqHG7P9ebqNTuIGxX2E24ztFRbgoh6QsYJy8T01jmulmkXVb
         4xRXQea54OQn3MvU6iqCOXJO/9PRbqbTZBZ4IuF/9vsNgLamfQGgIhJT2l7X+86c7kNG
         A+nf76cgSdrJbRQWfVYDHfLSngbdbnHRxFLLAHLUq5Ib1Hac87y1d35RWSWHE7WYQkxC
         NO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=z8JvkBd0R8tKW1PwI1aEAkvIaqXUeLX6SqSLALIC3M8=;
        b=Nu0SDqXf1KfOTT8jkMn9Jb0+UMpOguRP3IMke9bBx/or0muptpWtBvz7Wc1EHOSb//
         GoN+hNyNhDgqqvG+pkmZUoMY1wj/LJMrxwKKtT2jkdzJ1IPcuF2qce2NDCVDd2ndYmnQ
         td9TKE4pr97n7Q6LbyAOh62GiSZU5cfRwYPMJDs3As9uhJU82vxYsMXKFOsz2icDfeSL
         JiaZV+x/iMfEysk5nS0C8eqlbdgcxzq3NaX6ssrw9YJBBX6x3aVuW9Bii8w4eE7Ou5yr
         6bkbqhNKXJYMtfXa77GADMyglVmtLLxfSKEUBD+IIn3LkAOwp6EQunShyD3f6b/OtOGi
         XluQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eHyKzut6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k134si16868131ybk.384.2020.07.14.02.32.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jul 2020 02:32:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=eHyKzut6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jvHI9-0001AJ-Dj
	for alex.bennee@linaro.org; Tue, 14 Jul 2020 05:32:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jvHI1-0001A8-DL
 for qemu-arm@nongnu.org; Tue, 14 Jul 2020 05:31:53 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47705
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1jvHHz-00015i-Jl
 for qemu-arm@nongnu.org; Tue, 14 Jul 2020 05:31:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594719110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z8JvkBd0R8tKW1PwI1aEAkvIaqXUeLX6SqSLALIC3M8=;
 b=eHyKzut6es+CUuYiSDCpgAVhZ69/bWK58Ss4GGq+4hsZJAzSXtDgVgnReE/REToIZHtcjd
 V8ewTgIm9Qf/8vrlZ/2ijHhZMsqOkSIPmd9qr13n1DhDQoWL2Sc0Aa5ZXViJjfwuafYj8d
 Kh6gonM7NuxT+qAmoDwD4QxDT+gMHws=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-283-O5LBqMcvMYibttTbEjxB2Q-1; Tue, 14 Jul 2020 05:31:48 -0400
X-MC-Unique: O5LBqMcvMYibttTbEjxB2Q-1
Received: by mail-wm1-f71.google.com with SMTP id y204so3071712wmd.2
 for <qemu-arm@nongnu.org>; Tue, 14 Jul 2020 02:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z8JvkBd0R8tKW1PwI1aEAkvIaqXUeLX6SqSLALIC3M8=;
 b=E735lOlpKJ9OKfwe2R4NcwqDTc/e8r51Nw0LJmRlaOINW3GxgBbr6IEI9ihFMQJEd6
 1tyTP+GCLX4hFHRrX1HBjvKYD1atr366Wrym6snkidvt9maNL4jxhpF7O6cIXPL/HM3k
 saBUoPBJfxynbeM9wXMIHoQxVcu1sZY7F2aIKcMgUCtTh+yeMiaVwoucXjDI24lqu4eE
 GUga+n+8xFZ/QIAvrZH7xVetXnP+H55AZ7yVmMXp05bScMv8I81LRCHtTuAFp8ICVZbK
 BGo4Vozt/5ZcScp+ToszOih3fE9Ek1wXEl91hzMLiyZZT9eAoObCtBBLLlfJZskMHVmX
 3jXw==
X-Gm-Message-State: AOAM532y9lENfTQxV/etgkeGliUxmP+ONrTmQXjuVEbs/lqASY7Yf7Tr
 4AZ/lQE1Z4bD1rmdJ2JvgzC9QTDEEawVS87CLig0NiPAn6dbkaquWNPAFCBLbfbf4KWK1OTKQ58
 YfGjblwXw887e
X-Received: by 2002:a1c:dcd5:: with SMTP id t204mr3265232wmg.17.1594719107387; 
 Tue, 14 Jul 2020 02:31:47 -0700 (PDT)
X-Received: by 2002:a1c:dcd5:: with SMTP id t204mr3265211wmg.17.1594719107111; 
 Tue, 14 Jul 2020 02:31:47 -0700 (PDT)
Received: from redhat.com (bzq-79-180-10-140.red.bezeqint.net. [79.180.10.140])
 by smtp.gmail.com with ESMTPSA id n16sm3306725wmc.40.2020.07.14.02.31.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 02:31:46 -0700 (PDT)
Date: Tue, 14 Jul 2020 05:31:43 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Subject: Re: [PATCH 3/4] hw/arm/virt-acpi-build: Only expose flash on older
 machine types
Message-ID: <20200714053023-mutt-send-email-mst@kernel.org>
References: <20200629140938.17566-1-drjones@redhat.com>
 <20200629140938.17566-4-drjones@redhat.com>
 <20200713104907.335bf762@redhat.com>
 <20200714055109.owrlob6m53notzh3@kamzik.brq.redhat.com>
 <20200714045537-mutt-send-email-mst@kernel.org>
 <20200714092325.5klaeqelu46mhg76@kamzik.brq.redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200714092325.5klaeqelu46mhg76@kamzik.brq.redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/14 03:06:09
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, eric.auger@redhat.com, philmd@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 ard.biesheuvel@arm.com, Igor Mammedov <imammedo@redhat.com>, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TcMfNcFkp+RB

On Tue, Jul 14, 2020 at 11:23:25AM +0200, Andrew Jones wrote:
> On Tue, Jul 14, 2020 at 04:57:50AM -0400, Michael S. Tsirkin wrote:
> > On Tue, Jul 14, 2020 at 07:51:09AM +0200, Andrew Jones wrote:
> > > On Mon, Jul 13, 2020 at 10:49:07AM +0200, Igor Mammedov wrote:
> > > > On Mon, 29 Jun 2020 16:09:37 +0200
> > > > Andrew Jones <drjones@redhat.com> wrote:
> > > > 
> > > > > The flash device is exclusively for the host-controlled firmware, so
> > > > > we should not expose it to the OS. Exposing it risks the OS messing
> > > > > with it, which could break firmware runtime services and surprise the
> > > > > OS when all its changes disappear after reboot.
> > > > > 
> > > > > As firmware needs the device and uses DT, we leave the device exposed
> > > > > there. It's up to firmware to remove the nodes from DT before sending
> > > > > it on to the OS. However, there's no need to force firmware to remove
> > > > > tables from ACPI (which it doesn't know how to do anyway), so we
> > > > > simply don't add the tables in the first place. But, as we've been
> > > > > adding the tables for quite some time and don't want to change the
> > > > > default hardware exposed to versioned machines, then we only stop
> > > > > exposing the flash device tables for 5.1 and later machine types.
> > > > > 
> > > > > Suggested-by: Ard Biesheuvel <ard.biesheuvel@arm.com>
> > > > > Suggested-by: Laszlo Ersek <lersek@redhat.com>
> > > > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > > > ---
> > > > >  hw/arm/virt-acpi-build.c | 5 ++++-
> > > > >  hw/arm/virt.c            | 3 +++
> > > > >  include/hw/arm/virt.h    | 1 +
> > > > >  3 files changed, 8 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > > > index 1384a2cf2ab4..91f0df7b13a3 100644
> > > > > --- a/hw/arm/virt-acpi-build.c
> > > > > +++ b/hw/arm/virt-acpi-build.c
> > > > > @@ -749,6 +749,7 @@ static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
> > > > >  static void
> > > > >  build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > > > >  {
> > > > > +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> > > > >      Aml *scope, *dsdt;
> > > > >      MachineState *ms = MACHINE(vms);
> > > > >      const MemMapEntry *memmap = vms->memmap;
> > > > > @@ -767,7 +768,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > > > >      acpi_dsdt_add_cpus(scope, vms->smp_cpus);
> > > > >      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
> > > > >                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
> > > > > -    acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
> > > > > +    if (vmc->acpi_expose_flash) {
> > > > > +        acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
> > > > > +    }
> > > > >      acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
> > > > >      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
> > > > >                      (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
> > > > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > > > index cd0834ce7faf..5adc9ff799ef 100644
> > > > > --- a/hw/arm/virt.c
> > > > > +++ b/hw/arm/virt.c
> > > > > @@ -2482,9 +2482,12 @@ DEFINE_VIRT_MACHINE_AS_LATEST(5, 1)
> > > > >  
> > > > >  static void virt_machine_5_0_options(MachineClass *mc)
> > > > >  {
> > > > > +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> > > > > +
> > > > >      virt_machine_5_1_options(mc);
> > > > >      compat_props_add(mc->compat_props, hw_compat_5_0, hw_compat_5_0_len);
> > > > >      mc->numa_mem_supported = true;
> > > > > +    vmc->acpi_expose_flash = true;
> > > > 
> > > > we usually do not version ACPI tables changes
> > > > (unless we have a good reason to do so)
> > > 
> > > Even when the change is to remove the exposure of hardware from the guest?
> > > Before this change, if a guest looked, it had a flash, after this change,
> > > if a guest looks, it doesn't.
> > 
> > It's up to the relevant maintainers who know what the semantics are.
> > FYI ACPI tables only change across a reset though.
> > So it's a question of whether guests get confused even if this
> > changes after a reboot.
> 
> Yup, but it's still the same "machine", so a user may wonder why it
> changed.
> 
> > Versioning is generally safer, but it's a good idea to document
> > the motivation for it.
> >
> 
> Well, in this case, we could probably push this change to old machine
> types and nobody would notice. If a guest is using ACPI, then it must
> be using firmware, and if they're using firmware, then they can't be
> using the flash. So the user shouldn't care if it's there or not. The
> only justification for the versioning is because "it's safer". If
> people feel strongly about avoiding versioning when it's not obviously
> necessary, then I can respin without it.
> 
> Thanks,
> drew

It's up to maintainers either way, but please do tweak the motivation in the commit log
to include the above.

-- 
MST

