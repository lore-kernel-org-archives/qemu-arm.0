Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4633300lfb;
        Tue, 27 Apr 2021 03:05:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdXFYnnRgJOk57+63pFPPGl7HeBV+MGACRSZM4m8LAVB97dcbqV3i3Z3RT/Zj6CctIQaty
X-Received: by 2002:ab0:4943:: with SMTP id a3mr16291195uad.107.1619517904647;
        Tue, 27 Apr 2021 03:05:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619517904; cv=none;
        d=google.com; s=arc-20160816;
        b=MsuU91anntjSsZj4FZgQVf472qCn/dV4opJlkgUxOFnCU4XK2C1+mVIIVvWwh3Xh91
         xIVYNFVwYjy5/vQTIoCCdRfbwSLfOK6JJUSx5e6bsF6n2OvYbAMCLX+HaIy7si7kwQGx
         oypBvgbM502jHB2/dedYW8fd5EH14F5vut9AachUOq/z+PjN4O8fSIwbPpYBReKBTKnp
         Jk/7G5j5S1/1f0jCbUk1p76yBaW9Qam7TcgwyqNQNI4B2BDQEiQJxKzK8b2HHO6wleiR
         XmbhgKB3ZfPurLCoS6eblkFusoWx7ymkgo4KmNj7bohEvgBA2WQtjuP/27MXSTS3URWW
         GncQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=r6uPOZWdjdYQvzPsl93HT7iKjKxszdRekMbSBZo0ukk=;
        b=FbfGA/VEq+nbIRfFdZ2owzelXBmz67owKSqxMGxIL75B2ZexzRZ8f/L31QPwX1BULm
         cPvAz7L+2xbPObOhZtPx2ywhifvlJ81R6l88hCP04sWjVFfKCNvDZfMjxd0wLib9UZSl
         /RZD7Kz3b8uAfZiKAe8BqbDhK7AhWTQYQ4Jg58oiGMBy6kzwx93Tl7gNjWvdty3wNlYM
         av4v5K6PnL0wXYdeLZXXo9ZzVIrxzg2Iim0a1LB9ye3mqHbW9H+8KpiGwN/zf4gNO6ek
         gHyQbOGdtw0vA2KMTKiCnaBzkV0WyoHyHlfCw/o81iry3l3oONvF/YdH6EOxh1e6Ocxf
         McNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Qh3v1Xy/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r16si8508902uae.115.2021.04.27.03.05.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 03:05:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Qh3v1Xy/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbKaV-0000Y4-U6
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 06:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbKaM-0000XB-J3
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 06:04:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbKaJ-0007iG-F3
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 06:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619517889;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r6uPOZWdjdYQvzPsl93HT7iKjKxszdRekMbSBZo0ukk=;
 b=Qh3v1Xy/1CRSqzxabw0zu0KbBpzUe/8AJVCxIa1G/xSBt5vztmvUm0D2VF1GqPY99p2y7W
 ByXTCNa+youT5P80Ltd/+ARPa8QrskNaYI13QojG/H2xfWhwXSK2J3+m1YuLNRz/RWCHi5
 7krfbmi/8XulRURLMoAkhuKXQDjB1S0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-rJKrvI2hPoiduKQPZLXvJQ-1; Tue, 27 Apr 2021 06:04:47 -0400
X-MC-Unique: rJKrvI2hPoiduKQPZLXvJQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 v5-20020a0564023485b029037ff13253bcso24609173edc.3
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 03:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=r6uPOZWdjdYQvzPsl93HT7iKjKxszdRekMbSBZo0ukk=;
 b=ZABYGSdVv49kmeliEu5SsCuPUsfePoziolCiKcomoSuQimx+Ucc7EtfRHqg9gnDq/C
 DkW2oF83qvaYr2PlT6wPYGUBVtVoWRvMDtaV2bVVxGuZhcLFfMA5sZYk2poZNCj96TA4
 7kKF47TLLDPhse68fhPrfZCMO5qvhkq/HFPTCcL7t334Ihs5+51n0CZz55pr9rCtGAGA
 C7ZBaK+qlTHyQRQBnzy2zLIXo//VfpmbkWsePz6U26eVTEZ2IE5pvCO8Ss8DYYVrSGRP
 oRu19hxZvUvgIcWnJ3GWx0IXD91LcFJVvUrn7SO5zRTZ/SSlr76Ue9QGkrtHRomtbTcx
 4OZQ==
X-Gm-Message-State: AOAM5333jxX1YDLbwFiHptJ3/KQ8wUPvHdDlwsfYuKurL5DqTf4sJsLZ
 atYnQ3sDiFxx/cEpl0//v6hpuvQJrrzvPtjfF3py1kGm4+P8qTx9jUydh4UwCg9nVE9EwrjUJIq
 CR7KqmtGDci4A
X-Received: by 2002:a17:906:a212:: with SMTP id
 r18mr15383864ejy.438.1619517886494; 
 Tue, 27 Apr 2021 03:04:46 -0700 (PDT)
X-Received: by 2002:a17:906:a212:: with SMTP id
 r18mr15383833ejy.438.1619517886177; 
 Tue, 27 Apr 2021 03:04:46 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id g20sm657421edr.45.2021.04.27.03.04.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 03:04:45 -0700 (PDT)
Date: Tue, 27 Apr 2021 12:04:42 +0200
From: Andrew Jones <drjones@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH v2 2/6] hw/arm/virt: DT: Add cpu-map
Message-ID: <20210427100442.elz3bjgl6mcntevc@gator.home>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-3-wangyanan55@huawei.com>
 <648ff988-35f6-1857-2194-0d3e11e0d15c@redhat.com>
MIME-Version: 1.0
In-Reply-To: <648ff988-35f6-1857-2194-0d3e11e0d15c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, Jiajie Li <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KTjDu3PbxozP

On Tue, Apr 27, 2021 at 11:47:17AM +0200, Philippe Mathieu-Daudé wrote:
> Hi Yanan, Drew,
> 
> On 4/13/21 10:07 AM, Yanan Wang wrote:
> > From: Andrew Jones <drjones@redhat.com>
> > 
> > Support device tree CPU topology descriptions.
> > 
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > ---
> >  hw/arm/virt.c         | 41 ++++++++++++++++++++++++++++++++++++++++-
> >  include/hw/arm/virt.h |  1 +
> >  2 files changed, 41 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index 9f01d9041b..f4ae60ded9 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -352,10 +352,11 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
> >      int cpu;
> >      int addr_cells = 1;
> >      const MachineState *ms = MACHINE(vms);
> > +    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> >      int smp_cpus = ms->smp.cpus;
> >  
> >      /*
> > -     * From Documentation/devicetree/bindings/arm/cpus.txt
> > +     *  See Linux Documentation/devicetree/bindings/arm/cpus.yaml
> >       *  On ARM v8 64-bit systems value should be set to 2,
> >       *  that corresponds to the MPIDR_EL1 register size.
> >       *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
> > @@ -408,8 +409,45 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
> >                  ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
> >          }
> >  
> > +        if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
> > +            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
> > +                                  qemu_fdt_alloc_phandle(ms->fdt));
> > +        }
> > +
> >          g_free(nodename);
> >      }
> > +
> > +    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
> > +        /*
> > +         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
> > +         * In a SMP system, the hierarchy of CPUs is defined through four
> > +         * entities that are used to describe the layout of physical CPUs
> > +         * in the system: socket/cluster/core/thread.
> > +         */
> > +        qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
> > +
> > +        for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
> > +            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
> > +            char *map_path;
> > +
> > +            if (ms->smp.threads > 1) {
> > +                map_path = g_strdup_printf(
> > +                    "/cpus/cpu-map/%s%d/%s%d/%s%d",
> > +                    "socket", cpu / (ms->smp.cores * ms->smp.threads),
> > +                    "core", (cpu / ms->smp.threads) % ms->smp.cores,
> > +                    "thread", cpu % ms->smp.threads);
> > +            } else {
> > +                map_path = g_strdup_printf(
> > +                    "/cpus/cpu-map/%s%d/%s%d",
> > +                    "socket", cpu / ms->smp.cores,
> > +                    "core", cpu % ms->smp.cores);
> > +            }
> > +            qemu_fdt_add_path(ms->fdt, map_path);
> > +            qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
> > +            g_free(map_path);
> > +            g_free(cpu_path);
> > +        }
> > +    }
> >  }
> >  
> >  static void fdt_add_its_gic_node(VirtMachineState *vms)
> > @@ -2769,6 +2807,7 @@ static void virt_machine_5_2_options(MachineClass *mc)
> >      virt_machine_6_0_options(mc);
> >      compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
> >      vmc->no_secure_gpio = true;
> > +    vmc->no_cpu_topology = true;
> 
> Bare with me because "machine versioning" is something new to me, I was
> expecting it to be only related to migrated fields.
> Why do we need to care about not adding the FDT node in older machines?
> Shouldn't the guest skip unknown FDT nodes?

It probably should, the question is whether it would. Also, the nodes may
not be unknown, so the guest will read the information and set up its
topology as instructed. That topology may not be the same as what was
getting used by default without the topology description. It's possible
that a user's application has a dependency on the topology and if that
topology gets changed under its feat it'll behave differently.

In short, machine versioning isn't just about vmstate, it's also about
keeping a machine type looking the same to the guest.

Now, it's possible that we're being overly cautious here, but this compat
variable doesn't complicate code too much. So I think I'd prefer to use it
than not.

Thanks,
drew

