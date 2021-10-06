Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp319938lfp;
        Wed, 6 Oct 2021 06:47:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1lhOwTAN62HmOqiy9AA3JZrqQOui+2ZhDniZvBXfcRy3rLNaH5QWOOziDxviGGBMZmUlV
X-Received: by 2002:a05:620a:53d:: with SMTP id h29mr19868096qkh.395.1633528043637;
        Wed, 06 Oct 2021 06:47:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633528043; cv=none;
        d=google.com; s=arc-20160816;
        b=p7MJ3ZktnIvx8o4SPzDvFE0NEoKEU+rY4tZGtXai3no0B4iWrTtrM3H1uZ3t5SKipE
         dSLzSzwaZnNe6NaYgsX3iaAEH5j6kTSfO2FDyI7CX/2waRYuWL+R7aKjEtFZbps5IPS5
         CAycBLZHFWCTYLzNZaP7vdYhYV+RuWpoCcIkEWW/xv0mrdkVJMtP1b7CKTHVSfCSfi/p
         /AV1QTz2/G+RfedIwqcIrmXANXq370BLKpVUb4yD6Ksh/fDekAVuoueEItVRC42Dhas+
         lrCrofJZf43e/TyIM/tVvbNJj6xZTfX547AT9fD/6P8t5vEDiz5qRfwnOUuhC2RPGv65
         qcow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=2M75C17tT7mt5I/zArCCXm+9bGDOhnIqeSIjzdiMWH0=;
        b=vU0Q9+wPeL2NYe5vBDKT/i6WXnJl1135UOmjQVUoVF17B0Pg4GCbgNtxcVpHkzQYUp
         aP5VUXZgFJ6Zl1+2ASMEdtQh6mUhUNQ5/kPNe73lkjwSmfY8PrvHF9teChwASfQSdcEo
         +eB2DDXVS5rTHz6xBcz4D2DPlsFVo/ynErNRyAbksBjq0Yc7ELQzAvXJi9zuLmQWsVhr
         2WilMjovjPZy7Lh36jTIJC0qio+L4WZvDfGRHDW7BDeShFPl3lCT3aN02OzgIQLQaloi
         ovOnvzKp7L938aRXMcDuqKpKcvA3LmvOw5QYbTDYCesV40azdZwrre1J4L9RNCCIaxyV
         9uFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ha9d9d8r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b17si11616880qvf.109.2021.10.06.06.47.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Oct 2021 06:47:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ha9d9d8r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mY7GV-0002b5-47
	for alex.bennee@linaro.org; Wed, 06 Oct 2021 09:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY7Fm-00027I-JU
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 09:46:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mY7Fk-0006Fk-Kv
 for qemu-arm@nongnu.org; Wed, 06 Oct 2021 09:46:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633527995;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2M75C17tT7mt5I/zArCCXm+9bGDOhnIqeSIjzdiMWH0=;
 b=Ha9d9d8rNnBFqevYODwBVHm4Z1IAJ/ViioUEcMFJTUAvOdTWb13DYiZIXM10i3iz5sJKF8
 peOMfQ1qfcCh5uzuZAGAy9N/LWG52DPUZBvetX9EwwrhNqwxf1HFvs1O59+0yH24lXORLn
 0Au6cMtG7Wvec6MXsuJJjlNqvOxMMoU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-qQ4FTtiTNdOoPxBU-3qwFA-1; Wed, 06 Oct 2021 09:46:33 -0400
X-MC-Unique: qQ4FTtiTNdOoPxBU-3qwFA-1
Received: by mail-wr1-f72.google.com with SMTP id
 c2-20020adfa302000000b0015e4260febdso2074530wrb.20
 for <qemu-arm@nongnu.org>; Wed, 06 Oct 2021 06:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2M75C17tT7mt5I/zArCCXm+9bGDOhnIqeSIjzdiMWH0=;
 b=pkVenl6cNN6oALP1JdNpt1u8JwJ4/qMUQym8qCSk/k6hSBTF2fHenuwikj1i93X2n4
 ml6qthh213UsYmihTJBmKfEF2ttmWUI04Fjf4pr6Y96xB05idTaHzr1vU8cRAWl+0BAF
 lNFSQSS0J+R8zPh4zG7KmUCO/mrCDrxsc4DMhpFnb+QLBfainDvUXFiiNQxbO43c9pjF
 gLX7mvw0Hm3eKlqwUCQMvSaQRn5m9D5aRbwelQV888LlET9fJMr+tJdFw5icHeuLvRVF
 OoBJtI3uD7VMcp024h3sVhUfLFi6IK4fpjBIx08S81gp8QZxE+rCEIrAb09hxXZlbc4q
 hDFQ==
X-Gm-Message-State: AOAM532JtfMcsVzKKTZ8amas9ORsKOp79eQxEHEgpc8u7D10m4YXeKmz
 nA2kiIDLrooOwTO/kyLW1dTDYUrHrQ6RJTvmVGsWU9/u1xL943Ok2t29bsehRTQgGUBezJXjzLK
 RWq9R3OQsv6gZ
X-Received: by 2002:adf:a101:: with SMTP id o1mr28338469wro.379.1633527992029; 
 Wed, 06 Oct 2021 06:46:32 -0700 (PDT)
X-Received: by 2002:adf:a101:: with SMTP id o1mr28338427wro.379.1633527991765; 
 Wed, 06 Oct 2021 06:46:31 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id d7sm21176404wrh.13.2021.10.06.06.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 06:46:31 -0700 (PDT)
Date: Wed, 6 Oct 2021 15:46:30 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 2/3] hw/arm/virt_acpi_build: Generate DBG2 table
Message-ID: <20211006154630.0acd896d@redhat.com>
In-Reply-To: <2b284309-1dd6-6d73-225d-f83ad4af8657@redhat.com>
References: <20210927131732.63801-1-eric.auger@redhat.com>
 <20210927131732.63801-3-eric.auger@redhat.com>
 <20211006091523.qaub5xg3kxuwjmlh@gator.home>
 <2b284309-1dd6-6d73-225d-f83ad4af8657@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 gshan@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 shannon.zhaosl@gmail.com, qemu-arm@nongnu.org, philmd@redhat.com,
 ardb@kernel.org, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BO5UFxhPWsYO

On Wed, 6 Oct 2021 11:57:07 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Hi,
> 
> On 10/6/21 11:15 AM, Andrew Jones wrote:
> > On Mon, Sep 27, 2021 at 03:17:31PM +0200, Eric Auger wrote:  
> >> ARM SBBR specification mandates DBG2 table (Debug Port Table 2)
> >> since v1.0 (ARM DEN0044F 8.3.1.7 DBG2).
> >>
> >> The DBG2 table allows to describe one or more debug ports.
> >>
> >> Generate an DBG2 table featuring a single debug port, the PL011.
> >>
> >> The DBG2 specification can be found at
> >> "Microsoft Debug Port Table 2 (DBG2)"
> >> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table?redirectedfrom=MSDN
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>
> >> ---
> >>
> >> v2 -> v3:
> >> Took into account all comments from Igor on v2:
> >> mostly style adjustment, revision references
> >>
> >> v1 -> v2:
> >> - rebased on Igor's refactoring
> >> ---
> >>  hw/arm/virt-acpi-build.c | 62 +++++++++++++++++++++++++++++++++++++++-
> >>  1 file changed, 61 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> index 6cec97352b..257d0fee17 100644
> >> --- a/hw/arm/virt-acpi-build.c
> >> +++ b/hw/arm/virt-acpi-build.c
> >> @@ -616,6 +616,63 @@ build_gtdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>      acpi_table_end(linker, &table);
> >>  }
> >>  
> >> +/* Debug Port Table 2 (DBG2) */
> >> +static void
> >> +build_dbg2(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)  
> > nit: I didn't think QEMU liked this style, i.e. QEMU prefers
> >
> >  static void build_dbg2(GArray *table_data, BIOSLinker *linker,
> >                         VirtMachineState *vms)
> >
> > Eh, I see that hw/arm/virt-acpi-build.c is full of the format you have
> > here, so never mind.
> >  
> >> +{
> >> +    AcpiTable table = { .sig = "DBG2", .rev = 3, .oem_id = vms->oem_id,  
> > Can you explain where the .rev = 3 comes from? The spec says "For this
> > version of the specification, this value is 0."  
> The above revision field belongs to the acpi table header. Not to be
> mixed with the Revision field of the DBG2 table
> which is set below (set to 0):
> 
> +    build_append_int_noprefix(table_data, 0, 1); /* Revision */
> 
> Besides that's a good question. I have rev=3 here but that must come from a copy/paste. when googling I
> found
> 
> https://lists.denx.de/pipermail/u-boot/2015-June/217134.html
> /header->revision = 1; /* ACPI 1.0/2.0: 1, ACPI 3.0: 2, ACPI 4.0: 3 */
> Not sure if 3 is the right value though? Igor, please could you advise?
> Thanks Eric /
> 

"Table 1. Debug Port Table 2 format"
says table revision must be 0

> >
> >  
> >> +                        .oem_table_id = vms->oem_table_id };
> >> +    int dbg2devicelength;
> >> +    const char name[] = "COM0";
> >> +    const int namespace_length = sizeof(name);
> >> +
> >> +    acpi_table_begin(&table, table_data);
> >> +
> >> +    dbg2devicelength = 22 /* BaseAddressRegister[] offset */ +
> >> +                       12 /* BaseAddressRegister[] */ +
> >> +                       4 /* AddressSize[] */ +  
> > I'd personally prefer the '+' before the comment, but maybe Igor has a
> > special ACPI code format preference here.

indeed '+' before comment should look better

> >  
> >> +                       namespace_length /* NamespaceString[] */;
> >> +
> >> +    /* OffsetDbgDeviceInfo */
> >> +    build_append_int_noprefix(table_data, 44, 4);
> >> +    /* NumberDbgDeviceInfo */
> >> +    build_append_int_noprefix(table_data, 1, 4);
> >> +
> >> +    /* Table 2. Debug Device Information structure format */
> >> +    build_append_int_noprefix(table_data, 0, 1); /* Revision */
> >> +    build_append_int_noprefix(table_data, dbg2devicelength, 2); /* Length */
> >> +    /* NumberofGenericAddressRegisters */
> >> +    build_append_int_noprefix(table_data, 1, 1);
> >> +    /* NameSpaceStringLength */
> >> +    build_append_int_noprefix(table_data, namespace_length, 2);
> >> +    build_append_int_noprefix(table_data, 38, 2); /* NameSpaceStringOffset */
> >> +    build_append_int_noprefix(table_data, 0, 2); /* OemDataLength */
> >> +    /* OemDataOffset (0 means no OEM data) */
> >> +    build_append_int_noprefix(table_data, 0, 2);
> >> +
> >> +    /* Port Type */
> >> +    build_append_int_noprefix(table_data, 0x8000 /* Serial */, 2);
> >> +    /* Port Subtype */
> >> +    build_append_int_noprefix(table_data, 0x3 /* ARM PL011 UART */, 2);
> >> +    build_append_int_noprefix(table_data, 0, 2); /* Reserved */
> >> +    /* BaseAddressRegisterOffset */
> >> +    build_append_int_noprefix(table_data, 22, 2);
> >> +    /* AddressSizeOffset */
> >> +    build_append_int_noprefix(table_data, 34, 2);
> >> +
> >> +    /* BaseAddressRegister[] */
> >> +    build_append_gas(table_data, AML_AS_SYSTEM_MEMORY, 8, 0, 1,
> >> +                     vms->memmap[VIRT_UART].base);
> >> +
> >> +    /* AddressSize[] */
> >> +    build_append_int_noprefix(table_data, 0x1000 /* Register Space */, 4);
> >> +
> >> +    /* NamespaceString[] */
> >> +    g_array_append_vals(table_data, name, namespace_length);
> >> +
> >> +    acpi_table_end(linker, &table);
> >> +};
> >> +
> >>  /*
> >>   * ACPI spec, Revision 5.1 Errata A
> >>   * 5.2.12 Multiple APIC Description Table (MADT)
> >> @@ -875,7 +932,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> >>      dsdt = tables_blob->len;
> >>      build_dsdt(tables_blob, tables->linker, vms);
> >>  
> >> -    /* FADT MADT GTDT MCFG SPCR pointed to by RSDT */
> >> +    /* FADT MADT GTDT MCFG SPCR DBG2 pointed to by RSDT */
> >>      acpi_add_table(table_offsets, tables_blob);
> >>      build_fadt_rev5(tables_blob, tables->linker, vms, dsdt);
> >>  
> >> @@ -898,6 +955,9 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> >>      acpi_add_table(table_offsets, tables_blob);
> >>      build_spcr(tables_blob, tables->linker, vms);
> >>  
> >> +    acpi_add_table(table_offsets, tables_blob);
> >> +    build_dbg2(tables_blob, tables->linker, vms);
> >> +
> >>      if (vms->ras) {
> >>          build_ghes_error_table(tables->hardware_errors, tables->linker);
> >>          acpi_add_table(table_offsets, tables_blob);
> >> -- 
> >> 2.26.3
> >>  
> > Thanks,
> > drew 
> >  
> 

