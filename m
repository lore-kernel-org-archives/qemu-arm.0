Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1001196wrp;
        Wed, 25 Sep 2019 09:20:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxheQVGSKFRPcO95rmXm3Rozg0t5NX9LDPK4v1bOwa95HTFqlSqha+E254GLK5WtYOU09M1
X-Received: by 2002:a37:9b0e:: with SMTP id d14mr4297654qke.315.1569428459830;
        Wed, 25 Sep 2019 09:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569428459; cv=none;
        d=google.com; s=arc-20160816;
        b=WgJ5+hQhkazU78fel+wIHZ4hUgmQmKc4F1XI4VUaarRst6k9wpNK2P4pEYdiw/pDZ3
         oXbi5USjeKJYFdjzaqi8rHD8BSb+ftvUl0zwwbhjtkW0WcG8MS/lLl3gm8PdSAQyF5dy
         PCGUeMP9ZuA3ur60OpolyNmPDzgIvi4ipsgOIdArHbgUFaYfkQnhS5TI+hT948llKo85
         8yV14h9JckAJE85iblMrC19BLEJxu9FWIKFTTI7HvzgllZs+Gh8EbChrz2RFhIihPz/+
         XNgYyEDvEs76G57nQSvHgh0SOy0vJAXft6R20ymUte6lGIYObjKKKmeuR9JgEFXAryRf
         oAFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date;
        bh=evU1Bl6pq/idzZG0TpLCRWAK/9K0N8hDGoJHQhixoqs=;
        b=0muL6rGgnyKjAZd4nWrYK68qMx5o1xVl6Yr4C6o8H5XGaoefmzkKKNbn3nmcjRl90x
         Tk8TYQodT7Sgjy1eVuDnkIilIT0OSC1lySUT4roIsCjUqyHaUS/5T+X5Bw1tEipv+9F8
         Yu17tIZy2sogGUEYRewFE9KCO5+VVPtEosd9nBqJOB2gov/ysZGsKnW06kQ+JY3czaO7
         QBXKPrOjvosJFkmndEKHFnaBITObNvleZNc3wOrEFfl1VFRgMe6uewAEKKWp30UcGI/Q
         odGVCidSXkmaASDNJH4yrgALiVLkfsraRIcGOpYRU6jqVhneZo8h78cvU7aq7EaspQOv
         2VjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b24si4290725qkl.27.2019.09.25.09.20.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 09:20:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iDA2E-0004M2-RW
	for alex.bennee@linaro.org; Wed, 25 Sep 2019 12:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42428)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <mst@redhat.com>) id 1iDA1x-00045z-1L
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 12:20:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1iDA1u-00044Q-7m
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 12:20:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38190)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1iDA1t-000442-V3
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 12:20:38 -0400
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id C620EC04D312
 for <qemu-arm@nongnu.org>; Wed, 25 Sep 2019 16:20:36 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id s14so34699qtn.4
 for <qemu-arm@nongnu.org>; Wed, 25 Sep 2019 09:20:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=evU1Bl6pq/idzZG0TpLCRWAK/9K0N8hDGoJHQhixoqs=;
 b=FJvKUGx9m/NEiklTCtSL58yU6GqjcfX3+we+6eL4eRfOKHBcvggfS0ixV5LZ0hArrj
 ERpZ5ZoUm5kBBmcabdUDCTSjqcoA+8+6nJGOjO7tSXBzUJycjXOYYehCXjzr2ob+9mfw
 AKGbn+Rr5PubfOkw70KIwGVzWZ6cOjG5uK8G30xoVCzUlO7lmWkyBIH7XFsuboSk1Lhy
 c3UyxZhqAl/UDQ2F7jc3wWpAKHn85+5FDs+Iug2NqhvMfiFh4wLwZ6zaItlST7XpVv1Q
 2hp8oHivbnlpp6h+HnBWt6SxqFycaqQwRzYvircGYoVVPH/3Hman0i1SblbD2feKxla9
 +6kg==
X-Gm-Message-State: APjAAAXIsYxyCy9zgEBkpF4CTlfGUcJCdKPlAQ4XvC/BA9cU9FG7iCnv
 NW1QlQNrpWeJWGcjjbkG3hW7m8YRA68f3pNLLnSHO0HxE4aY7w8VelwEziu/YlwzSu7oIAn4qGk
 HIywOoBFhmJMQ
X-Received: by 2002:a0c:acbb:: with SMTP id m56mr144051qvc.93.1569428436010;
 Wed, 25 Sep 2019 09:20:36 -0700 (PDT)
X-Received: by 2002:a0c:acbb:: with SMTP id m56mr144024qvc.93.1569428435728;
 Wed, 25 Sep 2019 09:20:35 -0700 (PDT)
Received: from redhat.com (bzq-79-176-40-226.red.bezeqint.net. [79.176.40.226])
 by smtp.gmail.com with ESMTPSA id q126sm3322962qkf.47.2019.09.25.09.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 09:20:34 -0700 (PDT)
Date: Wed, 25 Sep 2019 12:20:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH-for-4.2 v11 00/11] ARM virt: ACPI memory hotplug support
Message-ID: <20190925122006-mutt-send-email-mst@kernel.org>
References: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
 <20190925112804-mutt-send-email-mst@kernel.org>
 <20190925173753.7382593d@Igors-MacBook-Pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190925173753.7382593d@Igors-MacBook-Pro>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, shannon.zhaosl@gmail.com,
 ard.biesheuvel@linaro.org, qemu-devel@nongnu.org,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, linuxarm@huawei.com,
 eric.auger@redhat.com, qemu-arm@nongnu.org, xuwei5@hisilicon.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oDHgI1rG46Ma

On Wed, Sep 25, 2019 at 05:37:53PM +0200, Igor Mammedov wrote:
> On Wed, 25 Sep 2019 11:28:42 -0400
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Wed, Sep 18, 2019 at 02:06:22PM +0100, Shameer Kolothum wrote:
> > > This series is an attempt to provide device memory hotplug support 
> > > on ARM virt platform. This is based on Eric's recent works here[1]
> > > and carries some of the pc-dimm related patches dropped from his
> > > series.
> > > 
> > > The kernel support for arm64 memory hot add was added recently by
> > > Robin and hence the guest kernel should be => 5.0-rc1.
> > > 
> > > NVDIM support is not included currently as we still have an unresolved
> > > issue while hot adding NVDIMM[2]. However NVDIMM cold plug patches
> > > can be included, but not done for now, for keeping it simple.
> > > 
> > > This makes use of GED device to sent hotplug ACPI events to the
> > > Guest. GED code is based on Nemu. Thanks to the efforts of Samuel and
> > > Sebastien to add the hardware-reduced support to Nemu using GED
> > > device[3]. (Please shout if I got the author/signed-off wrong for
> > > those patches or missed any names).
> > > 
> > > This is sanity tested on a HiSilicon ARM64 platform and appreciate
> > > any further testing.
> > > 
> > > Note:
> > > Attempted adding dimm_pxm test case to bios-tables-test for arm/virt.
> > > But noticed the issue decribed here[5]. This is under investigation 
> > > now.
> > > 
> > > Thanks,
> > > Shameer
> > 
> > 
> > Which tree is this going through? Mine or ARM?
> 
> I'd assume your tree???
> (You are the wizard who knows how to handle bios-tables-test-allowed-diff.h on merge)

Sure. Peter if you agree, could you send your ack for that please?


> > 
> > 
> > > [1] https://patchwork.kernel.org/cover/10837565/
> > > [2] https://patchwork.kernel.org/cover/10783589/
> > > [3] https://github.com/intel/nemu/blob/topic/virt-x86/hw/acpi/ged.c
> > > [4] http://lists.infradead.org/pipermail/linux-arm-kernel/2019-May/651763.html
> > > [5] https://www.mail-archive.com/qemu-devel@nongnu.org/msg632651.html
> > > 
> > > v10 --> v11
> > > -Changed patch #10 to update bios-tables-test-allowed-diff.h with a
> > >  list of expected ACPI tables.
> > > -GED document changed to rst format (patch #9)
> > > -Addressed comments from Igor (patch #3 & #5)
> > > -Igor's R-by to #7, #8 & #11.
> > > 
> > > v9 --> v10
> > >  -Fix for "make check" failure on x86_64(Patch #1).
> > >  -Minor updates based on Eric's comments.
> > >  -Dropped patch "hw/arm/virt: Add 4.2 machine type" as this is already
> > >   in master now.
> > >  -Added R-by tags by Eric.
> > > 
> > > v8 --> v9
> > >  -Changes related to GED being a TYPE_SYS_BUS_DEVICE now.
> > >  -Re-arranged patches 8 and 9.
> > >  -Added GED ABI documentation(patch #10).
> > >  -Added numamem and memhp tests to arm/virt(#11 and #12)
> > >  -Dropped few R-by tags as code has changed a bit.
> > >  -Please see Individual patch history for details.
> > >  
> > > v7 --> v8
> > >  -Addressed comments from Igor.Please see individual patches.
> > >  -Updated bios-tables-test-allowed-diff.h to avoid "make check"
> > >   failure (patch #6) and dropped patch #10
> > >  -Added Igor's R-by to patches 4 & 5.
> > >  -Dropped Erics's R-by from patch #9 for now.
> > > 
> > > v6 --> v7
> > > - Added 4.2 machine support and restricted GED creation for < 4.2
> > >   This is to address the migration test fail reported by Eric.
> > > - Included "tests: Update DSDT ACPI table.." patch(#10) from Eric
> > >   to fix the "make check" bios-tables-test failure.
> > >   
> > > v5 --> v6
> > > 
> > > -Addressed comments from Eric.
> > > -Added R-by from Eric and Igor.
> > > 
> > > v4 --> v5
> > > -Removed gsi/ged-irq routing in virt.
> > > -Added Migration support.
> > > -Dropped support for DT coldplug case based on the discussions
> > >  here[4]
> > > -Added system_powerdown support through GED.
> > > 
> > > v3 --> v4
> > > Addressed comments from Igor and Eric,
> > > -Renamed "virt-acpi" to "acpi-ged".
> > > -Changed ged device parent to TYPE_DEVICE.
> > > -Introduced DT memory node property "hotpluggable" to resolve device
> > >  memory being treated as early boot memory issue(patch #7).
> > > -Combined patches #3 and #9 from v3 into #3.
> > > 
> > > v2 --> v3
> > > 
> > > Addressed comments from Igor and Eric,
> > > -Made virt acpi device platform independent and moved
> > >  to hw/acpi/generic_event_device.c
> > > -Moved ged specific code into hw/acpi/generic_event_device.c
> > > -Introduced an opt-in feature "fdt" to resolve device-memory being
> > >  treated as early boot memory.
> > > -Dropped patch #1 from v2.
> > > 
> > > RFC --> v2
> > > 
> > > -Use GED device instead of GPIO for ACPI hotplug events.
> > > -Removed NVDIMM support for now.
> > > -Includes dropped patches from Eric's v9 series.
> > > 
> > > Eric Auger (1):
> > >   hw/arm/virt: Add memory hotplug framework
> > > 
> > > Samuel Ortiz (2):
> > >   hw/acpi: Do not create memory hotplug method when handler is not
> > >     defined
> > >   hw/acpi: Add ACPI Generic Event Device Support
> > > 
> > > Shameer Kolothum (8):
> > >   hw/acpi: Make ACPI IO address space configurable
> > >   hw/arm/virt: Enable device memory cold/hot plug with ACPI boot
> > >   hw/arm/virt-acpi-build: Add PC-DIMM in SRAT
> > >   hw/arm: Factor out powerdown notifier from GPIO
> > >   hw/arm: Use GED for system_powerdown event
> > >   docs/specs: Add ACPI GED documentation
> > >   tests: Update ACPI tables list for upcoming arm/virt tests
> > >   tests: Add bios tests to arm/virt
> > > 
> > >  docs/specs/acpi_hw_reduced_hotplug.rst |  70 ++++++
> > >  docs/specs/index.rst                   |   1 +
> > >  hw/acpi/Kconfig                        |   4 +
> > >  hw/acpi/Makefile.objs                  |   1 +
> > >  hw/acpi/generic_event_device.c         | 311 +++++++++++++++++++++++++
> > >  hw/acpi/memory_hotplug.c               |  43 ++--
> > >  hw/arm/Kconfig                         |   4 +
> > >  hw/arm/virt-acpi-build.c               |  35 ++-
> > >  hw/arm/virt.c                          | 124 +++++++++-
> > >  hw/i386/acpi-build.c                   |   7 +-
> > >  hw/i386/pc.c                           |   3 +
> > >  include/hw/acpi/acpi_dev_interface.h   |   1 +
> > >  include/hw/acpi/generic_event_device.h | 103 ++++++++
> > >  include/hw/acpi/memory_hotplug.h       |   9 +-
> > >  include/hw/arm/virt.h                  |   5 +
> > >  include/hw/i386/pc.h                   |   3 +
> > >  tests/bios-tables-test-allowed-diff.h  |  16 ++
> > >  tests/bios-tables-test.c               |  49 ++++
> > >  18 files changed, 748 insertions(+), 41 deletions(-)
> > >  create mode 100644 docs/specs/acpi_hw_reduced_hotplug.rst
> > >  create mode 100644 hw/acpi/generic_event_device.c
> > >  create mode 100644 include/hw/acpi/generic_event_device.h
> > > 
> > > -- 
> > > 2.17.1
> > > 
