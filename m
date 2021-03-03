Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5483958lfg;
        Wed, 3 Mar 2021 08:17:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw22jXXlEjbHsX6Jss2IRebpkqIuiOGgxuowARtK1ziWoj7TkpcHcikY77OT/IxHgNbeS/B
X-Received: by 2002:a05:6e02:b29:: with SMTP id e9mr5767173ilu.119.1614788249273;
        Wed, 03 Mar 2021 08:17:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614788249; cv=none;
        d=google.com; s=arc-20160816;
        b=KYVhqrCdnfOmBIHfKmEzNu/ZYzzuuPhe8yegLmK3FUR0xidMJoM9jcxl4BV50i+ZOA
         R4xiSHFTkJO6iLB2wnUt2YyMgoyKixilkbr5ZbTyDUx2g+rM9dthbKcl0rwthloxfvDp
         YSP7MPL3gn1ephmz+nZNuRk9R5HfSs1SmGrCs1SohkvPQ75086waVIPv8G53BErEfuux
         esbi4M1Eatjl9CFJIn1ZNqESC3GhkYOXG8dCyRaxzU/mlK54/FOWM3GCB4J5asW44xTw
         4kklvCWmEGYV9U+tKEnweS/eA0EoCC8CpV5lkbXmxL6oTA2778y2tlGb1WWRbX3kry2M
         qFpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=WPWQdPfrI7/7ckTaEhv5xErtF7mGiOYmRK1BgfR+81k=;
        b=DefGfkR0IK5i5bDU+RJGA55zcpXoJzAa5dAdnaXV2vVSX/X6yVRr7d51DMTG4ngORz
         GMwZMaUrHl1SgZbn+FjubBiI3Hfztlz4RY0tXe4sKETW9V9vQ4nkpAzGiF0rWUlTvOi7
         RUGtEvTWB+CDAFnKjR9snnpRUgPkGSVseJMCYQUmn0yEvhAZ72vLC4fq78OnqgfQPNBc
         fzTjVVYXyTYlergoSsxBxCGoax2U8AsNFLP4U2dD1VXBZ13cdcLivTp84bLBbuyaB8sF
         8wgqJfLKE51fI9RV88kBNCRx00HZDVBDxeJslr149bc/lbVqO2FYAwSr9x0v0Xxz1Ciz
         I28g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cNsvBFeU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16si22210100ilk.56.2021.03.03.08.17.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 08:17:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=cNsvBFeU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHUBk-0004CI-GV
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 11:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lHUAS-00038K-F7
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 11:16:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lHUAQ-00063x-0B
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 11:16:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614788165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WPWQdPfrI7/7ckTaEhv5xErtF7mGiOYmRK1BgfR+81k=;
 b=cNsvBFeUdAkplCMuTif7+0PuHN/UlGRqO+1jQRDLfZrQUAa8iXWCg2BFevjE0BGMM2A/HR
 9jZTCM8zJv6jcvXQ68F/l4V+C2BmHiyToB4AZGtP6IlUeH1cl1wRHZ5SoZN7UEfs9l5zo8
 DvtjnvtXF/NCHf3bD9v02/nBOELXg4M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-FnRji2PJOBCtYyLbUSaF3Q-1; Wed, 03 Mar 2021 11:16:02 -0500
X-MC-Unique: FnRji2PJOBCtYyLbUSaF3Q-1
Received: by mail-wm1-f72.google.com with SMTP id z26so3200471wml.4
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 08:16:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WPWQdPfrI7/7ckTaEhv5xErtF7mGiOYmRK1BgfR+81k=;
 b=Ukdm5umPRpDFdHDzMEnlxJKPILKI/WkiTx7xp17jhDfKBDOtL/4LX9zOZkc7zGfJCc
 /XemQ7ya0W4BMCNGM/1detbKUHKmpBPgIrZTx2Je8E5DA7rSCU5jqnO6sTtqvVPnxcZO
 KYWnODcCGsviqeJAXiPOm1rsammAfwIMDyGaxtKYYvuoCfic890a2YPT7JEW9+vQmmK7
 0I0Nhpxk5YZJC5uMWhoWatUK2hWPF7U4/rSjUiQZP3h5Xjc2K0DM1msMCcYqaqMNcs1Q
 GZkH6fNIhC6IXCiMVR/nvWkqi2JjYc7d/nh197YMhjY3szWeEpXw57zl79Nqnx9qa2h+
 4lmw==
X-Gm-Message-State: AOAM5338/fumFuCC6drTkFM2EwXaHeEF0wd5ebUJw+PI0SFV0w9m+wTk
 JJpkDi552LkJbzPOBQA5NCzLMuZDrYXdi+Xsa7MveVS6GsEeloHkov7t9CIsoxWJ3Vuuqa9PIC1
 ahPwuLLwD6VE7
X-Received: by 2002:a5d:6991:: with SMTP id g17mr27797507wru.172.1614788160530; 
 Wed, 03 Mar 2021 08:16:00 -0800 (PST)
X-Received: by 2002:a5d:6991:: with SMTP id g17mr27797482wru.172.1614788160206; 
 Wed, 03 Mar 2021 08:16:00 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id n186sm6255918wmn.22.2021.03.03.08.15.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 08:15:59 -0800 (PST)
Date: Wed, 3 Mar 2021 11:15:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v1] acpi: increase maximum size for "etc/table-loader" blob
Message-ID: <20210303111333-mutt-send-email-mst@kernel.org>
References: <20210301104833.45580-1-david@redhat.com>
 <20210302172323.6cac394a@MiWiFi-RA69-srv>
 <09fbdaa9-2882-2056-a5a2-2ca0da8c12cf@redhat.com>
 <7d8281a8-0479-ac81-c602-ed87c71ce3e2@redhat.com>
 <9c74847e-9cea-3eb5-d9fc-5d969b6bb35d@redhat.com>
 <20210303162639.369b6035@MiWiFi-RA69-srv>
MIME-Version: 1.0
In-Reply-To: <20210303162639.369b6035@MiWiFi-RA69-srv>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X7kYYSLFiBoC

On Wed, Mar 03, 2021 at 04:26:39PM +0100, Igor Mammedov wrote:
> On Wed, 3 Mar 2021 10:49:08 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
> > On 02.03.21 19:43, David Hildenbrand wrote:
> > >>>> The resizeable memory region that is created for the cmd blob has a maximum
> > >>>> size of ACPI_BUILD_ALIGN_SIZE - 4k. This used to be sufficient, however,  
> > >>
> > >> The expression "ACPI_BUILD_ALIGN_SIZE - 4k" makes no sense to me.
> > >> ACPI_BUILD_ALIGN_SIZE is #defined in "hw/i386/acpi-build.c" as 0x1000,
> > >> so the difference (ACPI_BUILD_ALIGN_SIZE - 4k) is zero.
> > >>
> > >> (1) Did you mean "ACPI_BUILD_ALIGN_SIZE -- 4k"? IOW, did you mean to
> > >> quote the value of the macro?
> > >>
> > >> If you mean an em dash, then please use an em dash, not a hyphen (or
> > >> please use parens).  
> > > 
> > > Yes, or rather use ACPI_BUILD_ALIGN_SIZE (4k).
> > >   
> > >>
> > >>  
> > >>>> as we try fitting in additional data (e.g., vmgenid, nvdimm, intel-iommu),
> > >>>> we require more than 4k and can crash QEMU when trying to resize the
> > >>>> resizeable memory region beyond its maximum size:
> > >>>>     $ build/qemu-system-x86_64 --enable-kvm \
> > >>>>         -machine q35,nvdimm=on \
> > >>>>         -smp 1 \
> > >>>>         -cpu host \
> > >>>>         -m size=2G,slots=8,maxmem=4G \
> > >>>>         -object memory-backend-file,id=mem0,mem-path=/tmp/nvdimm,size=256M \
> > >>>>         -device nvdimm,label-size=131072,memdev=mem0,id=nvdimm0,slot=1 \
> > >>>>         -nodefaults \
> > >>>>         -device vmgenid \
> > >>>>         -device intel-iommu
> > >>>>
> > >>>> Results in:
> > >>>>     Unexpected error in qemu_ram_resize() at ../softmmu/physmem.c:1850:
> > >>>>     qemu-system-x86_64: Size too large: /rom@etc/table-loader:
> > >>>>       0x2000 > 0x1000: Invalid argument
> > >>>>
> > >>>> We try growing the resizeable memory region (resizeable RAMBlock) beyond
> > >>>> its maximum size. Let's increase the maximum size from 4k to 64k, which
> > >>>> should be good enough for the near future.  
> > >>
> > >> The existent code calls acpi_align_size(), for resizing the ACPI blobs
> > >> (the GArray objects).
> > >>
> > >> (Unfortunately, the acpi_align_size() function is duplicated between
> > >> "hw/i386/acpi-build.c" and "hw/arm/virt-acpi-build.c", which seems
> > >> unjustified -- but anyway, I digress.)
> > >>
> > >> This seems to come from commit 868270f23d8d ("acpi-build: tweak acpi
> > >> migration limits", 2014-07-29) and commit 451b157041d2 ("acpi: Align the
> > >> size to 128k", 2020-12-08).
> > >>
> > >> (2) Why is the logic added in those commits insufficient?  
> > > 
> > > We are dealing with different blobs here (tables_blob vs. cmd_blob).
> > >   
> > >>
> > >> What is the exact call tree that triggers the above error?  
> > > 
> > > [...]
> > > 
> > > acpi_build_update()->acpi_build_update()->memory_region_ram_resize()->qemu_ram_resize()
> > > 
> > > A longer calltrace can be found in https://bugzilla.redhat.com/show_bug.cgi?id=1927159.
> > >   
> > >>>> +++ b/hw/i386/acpi-microvm.c
> > >>>> @@ -255,7 +255,8 @@ void acpi_setup_microvm(MicrovmMachineState *mms)
> > >>>>                          ACPI_BUILD_TABLE_MAX_SIZE);
> > >>>>        acpi_add_rom_blob(acpi_build_no_update, NULL,
> > >>>>                          tables.linker->cmd_blob,
> > >>>> -                      "etc/table-loader", 0);
> > >>>> +                      ACPI_BUILD_LOADER_FILE,
> > >>>> +                      ACPI_BUILD_LOADER_MAX_SIZE);
> > >>>>        acpi_add_rom_blob(acpi_build_no_update, NULL,
> > >>>>                          tables.rsdp,
> > >>>>                          ACPI_BUILD_RSDP_FILE, 0);  
> > >>
> > >> (3) Why are we using a different "tool" here, from the previous
> > >> approach? We're no longer setting the GArray sizes; instead, we make the
> > >> "rom->romsize" fields diverge from -- put differently, grow beyond --
> > >> "rom->datasize". Why is that useful? What are the consequences?  
> > > 
> > > See ACPI_BUILD_TABLE_MAX_SIZE handling just in the acpi_add_rom_blob() above.
> > >   
> > >>
> > >> Where is it ensured that data between "rom->datasize" and "rom->romsize"
> > >> reads as zeroes?  
> > > We only expose the current memory_region_size() to our guest, which is
> > > always multiples of 4k pages.
> > > 
> > > rom->datasize and rom->romsize will be multiple of 4k AFAIKs.
> > > 
> > > acpi_align_size()-> g_array_set_size() will take care of zeroing out
> > > any unused parts within a single 4k page.
> > > 
> > > So all unused, guest-visible part should always be 0 I think.
> > >   
> > >>
> > >>  
> > >>>> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> > >>>> index 380d3e3924..93cdfd4006 100644
> > >>>> --- a/include/hw/acpi/aml-build.h
> > >>>> +++ b/include/hw/acpi/aml-build.h
> > >>>> @@ -6,6 +6,7 @@
> > >>>>
> > >>>>    /* Reserve RAM space for tables: add another order of magnitude. */
> > >>>>    #define ACPI_BUILD_TABLE_MAX_SIZE         0x200000
> > >>>> +#define ACPI_BUILD_LOADER_MAX_SIZE        0x40000
> > >>>>
> > >>>>    #define ACPI_BUILD_APPNAME6 "BOCHS "
> > >>>>    #define ACPI_BUILD_APPNAME8 "BXPC    "  
> > >>>  
> > >>
> > >> The commit message says "Let's increase the maximum size from 4k to
> > >> 64k", and I have two problems with that:
> > >>
> > >> (4a) I have no idea where the current "4k" size comes from. (In case the
> > >> 4k refers to ACPI_BUILD_ALIGN_SIZE, then why are we not changing that
> > >> macro?)  
> > > 
> > > Changing ACPI_BUILD_ALIGN_SIZE would affect the legacy_table_size in
> > > acpi_build() - so that can't be right.
> > > 
> > > What would also work is something like (to be improved)
> > > 
> > > diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> > > index 45ad2f9533..49cfedddc8 100644
> > > --- a/hw/i386/acpi-build.c
> > > +++ b/hw/i386/acpi-build.c
> > > @@ -81,6 +81,8 @@
> > >    #define ACPI_BUILD_LEGACY_CPU_AML_SIZE    97
> > >    #define ACPI_BUILD_ALIGN_SIZE             0x1000
> > >    
> > > +#define ACPI_BUILD_LOADER_ALIGN_SIZE      0x2000
> > > +
> > >    #define ACPI_BUILD_TABLE_SIZE             0x20000
> > >    
> > >    /* #define DEBUG_ACPI_BUILD */
> > > @@ -2613,10 +2615,10 @@ void acpi_build(AcpiBuildTables *tables, MachineState *machine)
> > >                error_printf("Try removing CPUs, NUMA nodes, memory slots"
> > >                             " or PCI bridges.");
> > >            }
> > > -        acpi_align_size(tables_blob, ACPI_BUILD_TABLE_SIZE);
> > > +        acpi_align_size(tables_blob, ACPI_BUILD_ALIGN_SIZE);
> > >        }
> > >    
> > > -    acpi_align_size(tables->linker->cmd_blob, ACPI_BUILD_ALIGN_SIZE);
> > > +    acpi_align_size(tables->linker->cmd_blob, ACPI_BUILD_LOADER_ALIGN_SIZE);
> > > 
> > > 
> > > At least for hw/i386/acpi-build.c.
> > > 
> > > We will end up creating the resizeable memory region/RAMBlock always with
> > > a size=maximum_size=8k. (could also go for 64k here)
> > > 
> > > The only downside is that we might expose a bigger area to the
> > > guest than necessary (e.g., 8k instead of 4k) and will e.g., migrate
> > > 8k instead of 4k (not that we care).
> > > 
> > > 
> > > On incoming migration from older QEMU versions, we should be able to just
> > > shrink back from 8k to 4k - so migration from older QEMY versions should
> > > continue working just fine.  
> > 
> > Correction: Older QEMU versions (e.g., before 
> > 62be4e3a5041e84304aa23637da623a205c53ecc) did not support resizeable RAM 
> > MemoryRegions / RAMBlocks. This affects ~ < QEMU v2.3.0.
> > 
> > So unconditionally changing the size of the cmd_blob memory region 
> > (e.g., 4k -> 8k) would most probably break migration from never QEMU to 
> > older QEMU (v2.2.0.). Not sure if we really care.
> > 
> > @MST, Igor what's your take?
> We shouldn't change aligned size (an alignment value), since it's what goes
> on migration stream wire.
> Changing max should not affect migrations stream directly.
> In most cases ping-pong migration should work as both sides will have
> the same configuration, in unlikely case newer QEMU goes over current 4k,
> it will jump to the next aligned size (8k) and migration will fail cleanly
> due size mismatch and it can't be made any more prettier.
> (similar to border cases when we switched to resizable regions for main tables
> blob)

Right. We can backort the change in the stable tree too.
I do think that we should add some kind of entry to the
command though when mcfg is disabled so the size doesn't change
like that. Will avoid weird failures if there's a convoluted config
which overflows again, it will fail cleanly on qemu start.
How about a dummy SSDT?

-- 
MST

