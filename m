Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp166211lfm;
        Tue, 18 May 2021 00:42:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtxuuDtfWfYU4KmljpUZEq3wgFItd6c96aF6Boyl0BgGr5OggWZRSIEj+9YGf6kkG72wbt
X-Received: by 2002:a25:3c01:: with SMTP id j1mr5687284yba.176.1621323771416;
        Tue, 18 May 2021 00:42:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621323771; cv=none;
        d=google.com; s=arc-20160816;
        b=hWraoPLOWDGIFXLgKPAKVWzFTkOieKzvlyFX4Et2+dMMobcPxz/GTPQc9ePoukQSdo
         oOqDctUHDppCJXN0b2H5XXioqt06QyGhK7pri/yCc1qEMZ6DoaMc05niSUixV/OOfx4m
         cEfyOfwWmUdyr1PfOwRG2NIDzdXUdY8ifgFlQoe6fwaAmIdGrXTvs74fGzDTNbBG2x8Q
         pexVdG6SUmjyqz9WMdEiOztQnqVBfQCiBIwTy1o7BgmsKxAuksdYous9/BbqC2W7V+v0
         HjBGMXotJ7fBe1FXXt81vZk78TCdSCdkXXGh8RrwBH+GzKDVmbNDoj8MVQB35WpRsDBa
         amlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=dUvY52dngLI4C48EpQ0qr2LsH5Jxir/ijQxmffabwHM=;
        b=TjLL9sbbLik1R9qDytQiM0NZNTpBI9HTgg4B3Vd92u8IyoKsgYNdcsepAKUXfGlYmE
         DAdFv8YVtsK8xg5KNRkAmqeTcLqYuXCwaMBfl8FCthadm/qxEfozLF6boi8no2D4nwvw
         9na1Q17mgIJExnBBaH6S+5g09tVXPOs4AI6+70CH2tPQSJILk550+v9Z54TEpPyr2B/k
         3psBX1JVlgRvYnfdw6JGxbIAd16rgxxQcmkSY45HeG2WAWOI3f0U1FPk4oxYxNoe4mRY
         OoTd3EtUgqoYAZXkkYNVsU/2+5qDQmEkbxuiNH+V8LvnpjTJUbT3XsORcAaHI/UMyO5F
         CQkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E4FSzJpP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w131si7838994ybg.295.2021.05.18.00.42.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 May 2021 00:42:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=E4FSzJpP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1liuNO-0007pV-PL
	for alex.bennee@linaro.org; Tue, 18 May 2021 03:42:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liuN6-0007oC-Am
 for qemu-arm@nongnu.org; Tue, 18 May 2021 03:42:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1liuN4-0002NQ-5z
 for qemu-arm@nongnu.org; Tue, 18 May 2021 03:42:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621323749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dUvY52dngLI4C48EpQ0qr2LsH5Jxir/ijQxmffabwHM=;
 b=E4FSzJpP9WNW2/yVe6MiiyAFPgjYoavwATPHMjxW6RZFMLY6gMRtR1ESct+ZWXAR67Oogg
 AGavBS+vLRaNyYhv+ypMHWbwtNDShd1eghWfzNBW/uI4VaeTCTDYtA9VbhIoaM+tEyQr9n
 z8Bv8GNqQ8EK4RPEtM1G80WYRrpvTGo=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-AtXhsnOmMoGH1PsdFPaw_A-1; Tue, 18 May 2021 03:42:25 -0400
X-MC-Unique: AtXhsnOmMoGH1PsdFPaw_A-1
Received: by mail-ej1-f69.google.com with SMTP id
 k9-20020a17090646c9b029039d323bd239so2014552ejs.16
 for <qemu-arm@nongnu.org>; Tue, 18 May 2021 00:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dUvY52dngLI4C48EpQ0qr2LsH5Jxir/ijQxmffabwHM=;
 b=taMGNHTTAyWYs0zjKBAyJRhhCOsXGlZriSuZ6anGGX7XY9nUx0+1HW+nIPS2A3kV+O
 dIkjXPwOH8di3Qo5HGNgSmAK+thxf3WAxtef+3PtoR1vNyUY5gv62FNPxZgoSHK9Fxil
 hW2tzT/d0xgBwLCdSZmy90Z7VYjolZRs7NZZ+xWyqnm6k7RPgSVLxv8hOWjTcuRhqQWb
 WiUJOWvELBTskzxgV8Fp0UX3QGE6NVhXtTFRUsNUEvZg9nBaAYHOJ//W7UvB9pWkInG/
 7qo4E9ty4uV8q19VbJJweSQ36usScmPfbZJpaRxK/cjRE7l7TKWMN0NQ5sj7VY5ZI/3g
 0dXA==
X-Gm-Message-State: AOAM531TQB793cwY+vYc2JdTjFxnhxbv4lqaMmG8k+o+MAiv3x0PW2EH
 Ovc4CZr+HvRk6eqpJhOXcSomX+yWOnAG/h+CTio/wRxSMT2viatg6vWNHUsO8R0n+xUkKbR5dN8
 79HRkwqBP9Thv
X-Received: by 2002:a17:906:a51:: with SMTP id
 x17mr4731096ejf.25.1621323744534; 
 Tue, 18 May 2021 00:42:24 -0700 (PDT)
X-Received: by 2002:a17:906:a51:: with SMTP id
 x17mr4731062ejf.25.1621323744293; 
 Tue, 18 May 2021 00:42:24 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id h9sm9978486edr.10.2021.05.18.00.42.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 00:42:24 -0700 (PDT)
Date: Tue, 18 May 2021 09:42:21 +0200
From: Andrew Jones <drjones@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Subject: Re: [RFC PATCH v2 5/6] hw/arm/virt-acpi-build: Add PPTT table
Message-ID: <20210518074221.umezsdedzyzmcbsk@gator.home>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-6-wangyanan55@huawei.com>
 <1551b7d6-e010-e5c7-47e1-c347ca78a1db@huawei.com>
 <a6ccb20f19b743a29f6aaffcf3088df2@huawei.com>
MIME-Version: 1.0
In-Reply-To: <a6ccb20f19b743a29f6aaffcf3088df2@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "linuxarm@openeuler.org" <linuxarm@openeuler.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>, "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Zengtao \(B\)" <prime.zeng@hisilicon.com>, yangyicong <yangyicong@huawei.com>,
 yuzenghui <yuzenghui@huawei.com>,
 "Wanghaibin \(D\)" <wanghaibin.wang@huawei.com>,
 zhukeqian <zhukeqian1@huawei.com>, "lijiajie \(H\)" <lijiajie11@huawei.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gUaRh3mjbdlA

On Tue, May 18, 2021 at 07:17:56AM +0000, Salil Mehta wrote:
> > From: Qemu-arm [mailto:qemu-arm-bounces+salil.mehta=huawei.com@nongnu.org]
> > On Behalf Of wangyanan (Y)
> > Sent: Thursday, May 13, 2021 6:10 AM
> > 
> > Hi Drew,
> > 
> > I got a question below, and hope your reply. Thanks!
> > On 2021/4/13 16:07, Yanan Wang wrote:
> > > Add the Processor Properties Topology Table (PPTT) to present
> > > CPU topology information to ACPI guests. Note, while a DT boot
> > > Linux guest with a non-flat CPU topology will see socket and
> > > core IDs being sequential integers starting from zero, e.g.
> > > with -smp 4,sockets=2,cores=2,threads=1
> > >
> > > a DT boot produces
> > >
> > >   cpu:  0 package_id:  0 core_id:  0
> > >   cpu:  1 package_id:  0 core_id:  1
> > >   cpu:  2 package_id:  1 core_id:  0
> > >   cpu:  3 package_id:  1 core_id:  1
> > >
> > > an ACPI boot produces
> > >
> > >   cpu:  0 package_id: 36 core_id:  0
> > >   cpu:  1 package_id: 36 core_id:  1
> > >   cpu:  2 package_id: 96 core_id:  2
> > >   cpu:  3 package_id: 96 core_id:  3
> > >
> > > This is due to several reasons:
> > >
> > >   1) DT cpu nodes do not have an equivalent field to what the PPTT
> > >      ACPI Processor ID must be, i.e. something equal to the MADT CPU
> > >      UID or equal to the UID of an ACPI processor container. In both
> > >      ACPI cases those are platform dependant IDs assigned by the
> > >      vendor.
> > >
> > >   2) While QEMU is the vendor for a guest, if the topology specifies
> > >      SMT (> 1 thread), then, with ACPI, it is impossible to assign a
> > >      core-id the same value as a package-id, thus it is not possible
> > >      to have package-id=0 and core-id=0. This is because package and
> > >      core containers must be in the same ACPI namespace and therefore
> > >      must have unique UIDs.
> > >
> > >   3) ACPI processor containers are not required for PPTT tables to
> > >      be used and, due to the limitations of which IDs are selected
> > >      described above in (2), they are not helpful for QEMU, so we
> > >      don't build them with this patch. In the absence of them, Linux
> > >      assigns its own unique IDs. The maintainers have chosen not to use
> > >      counters from zero, but rather ACPI table offsets, which explains
> > >      why the numbers are so much larger than with DT.
> > >
> > >   4) When there is no SMT (threads=1) the core IDs for ACPI boot guests
> > >      match the logical CPU IDs, because these IDs must be equal to the
> > >      MADT CPU UID (as no processor containers are present), and QEMU
> > >      uses the logical CPU ID for these MADT IDs.
> > >
> > > Tested-by: Jiajie Li <lijiajie11@huawei.com>
> > > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > > Signed-off-by: Ying Fang <fangying1@huawei.com>
> > > Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> > > ---
> > >   hw/arm/virt-acpi-build.c | 63 ++++++++++++++++++++++++++++++++++++++++
> > >   1 file changed, 63 insertions(+)
> > >
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index 2ad5dad1bf..03fd812d5a 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -436,6 +436,64 @@ build_srat(GArray *table_data, BIOSLinker *linker,
> > VirtMachineState *vms)
> > >                    vms->oem_table_id);
> > >   }
> > >
> > > +/* PPTT */
> > > +static void
> > > +build_pptt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > > +{
> > > +    int pptt_start = table_data->len;
> > > +    int uid = 0, cpus = 0, socket = 0;
> > > +    MachineState *ms = MACHINE(vms);
> > > +    unsigned int smp_cores = ms->smp.cores;
> > > +    unsigned int smp_threads = ms->smp.threads;
> > > +
> > > +    acpi_data_push(table_data, sizeof(AcpiTableHeader));
> > > +
> > > +    for (socket = 0; cpus < ms->possible_cpus->len; socket++) {
> > > +        uint32_t socket_offset = table_data->len - pptt_start;
> > > +        int core;
> > > +
> > > +        build_processor_hierarchy_node(
> > > +            table_data, 1, /* Physical package */
> > > +            0, socket, /* No parent */
> > > +            NULL, 0);  /* No private resources */
> > > +
> > > +        for (core = 0; core < smp_cores; core++) {
> > > +            uint32_t core_offset = table_data->len - pptt_start;
> > > +            int thread;
> > > +
> > > +            if (smp_threads <= 1) {
> > > +                build_processor_hierarchy_node(
> > > +                    table_data,
> > > +                    (1 << 1) | /* ACPI Processor ID valid */
> > > +                    (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
> > > +                    socket_offset, uid++, /* Parent is a Socket */
> > > +                    NULL, 0);  /* No private resources */
> > > +            } else {
> > > +                build_processor_hierarchy_node(
> > > +                    table_data, 0,
> > > +                    socket_offset, core, /* Parent is a Socket */
> > > +                    NULL, 0); /* No private resources */
> > > +
> > > +                for (thread = 0; thread < smp_threads; thread++) {
> > > +                    build_processor_hierarchy_node(
> > > +                        table_data,
> > > +                        (1 << 1) | /* ACPI Processor ID valid */
> > > +                        (1 << 2) | /* ACPI 6.3 - Processor is a Thread */
> > > +                        (1 << 3),  /* ACPI 6.3 - Node is a Leaf */
> > > +                        core_offset, uid++, /* Parent is a Core */
> > > +                        NULL, 0);  /* No private resources */
> > > +                }
> > > +            }
> > > +        }
> > > +        cpus += smp_cores * smp_threads;
> > > +    }
> > > +
> > > +    build_header(linker, table_data,
> > > +                 (void *)(table_data->data + pptt_start), "PPTT",
> > > +                 table_data->len - pptt_start, 2,
> > > +                 vms->oem_id, vms->oem_table_id);
> > > +}
> > > +
> > >   /* GTDT */
> > >   static void
> > >   build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > > @@ -707,6 +765,11 @@ void virt_acpi_build(VirtMachineState *vms,
> > AcpiBuildTables *tables)
> > >       acpi_add_table(table_offsets, tables_blob);
> > >       build_madt(tables_blob, tables->linker, vms);
> > >
> > > +    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
> > I'm not really sure why we need to care about "ms->smp.cpus > 1" here?
> > 
> > IMO, just like MADT in which we create both ENABLED and DISABLED
> > gicc nodes no matter of number of ENABLED nodes is one or not, we
> > should create PPTT table for all the possible cpus and not care about
> > number of smp cpus, too. This will be more consistent with the ACPI
> > specification and the PPTT table will be used for ACPI cpu hotplug in
> > the future even with  "smp.cpus == 1".
> 
> 
> A humble request:
> Let us not anticipate the changes of vcpu Hotplug here. Things are fluid
> with respect to the vcpu Hotplug right now and I think it will not be
> right to base PPTT Table changes in anticipation of something we are not
> sure of what it looks like.
> 
> Any such decisions should be postponed and be made part of the actual
> vcpu Hotplug changes when(and if ever) they come for ARM64. This will
> also ensure proper review of such changes and useful in that particular
> context.

Hi Salil,

Can you please elaborate on this and send some pointers to the hot plug
discussions? You're not saying that we shouldn't try to generate PPTT
tables for AArch64 guests until a solution for hot plug has been
determined, are you? If so, I don't think I would agree with that. There
are benefits to properly describing cpu topology to guests, even without
hot plug. Those benefits, when vcpu pinning is used, are the same benefits
as for the host, which already use PPTT tables to describe topology, even
though hot plug isn't supported.

Now, if you're saying we should only generate tables for smp.cpus, not
smp.maxcpus, because hot plug isn't supported anyway, then I see your
point. But, it'd be better to require smp.cpus == smp.maxcpus in our
smp_parse function to do that, which we've never done before, so we may
have trouble supporting existing command lines.

Thanks,
drew

> 
> 
> Thanks
> 
> > 
> > Care of "smp.cpus > 1" in the DT cpu-map part makes sense to me,
> > because we are required to only add present cpu nodes to the DT and
> > Linux Doc says that a cpu-map is not needed for uniprocessor systems.
> > 
> > Thanks,
> > Yanan
> > > +        acpi_add_table(table_offsets, tables_blob);
> > > +        build_pptt(tables_blob, tables->linker, vms);
> > > +    }
> > > +
> > >       acpi_add_table(table_offsets, tables_blob);
> > >       build_gtdt(tables_blob, tables->linker, vms);
> > >
> 

