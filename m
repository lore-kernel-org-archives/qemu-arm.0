Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp684044ejq;
        Tue, 16 May 2023 14:28:30 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5hRbXzBK3vkL3fvEVUt186xus03xeJ7e9bXTT2Mjo2UeQebc0DCq/tOC5PC89nn6nCtAeq
X-Received: by 2002:a05:622a:285:b0:3f5:2838:df34 with SMTP id z5-20020a05622a028500b003f52838df34mr15228269qtw.52.1684272510240;
        Tue, 16 May 2023 14:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684272510; cv=none;
        d=google.com; s=arc-20160816;
        b=aUPBOe4iAT1kNnrvpcMgWl68Qh+wcU1JvYsLwkk0T4jUk1qXLZ7zYV2/nG3D9XJg8O
         6sDIS/5RHrqjmSOfMggbUJ1RRE2sWZsTnRpn4JYlADBesV2dXg03zytv3zyPOry8aegL
         Yg/7FbqXiEUx63OQkFOX5+rhB/hNaz/1FH1e1YUVU2i8Ygbsb+dx6qK9K+/UFBCU+xym
         Bi1EBYl+If+MUU5VU9Bv2BJEFTMdNpMoEb2uoLt7ckaMNTjESDRASXOQnlB+iMFxEW77
         O6gPDFIWWOccFqCzuPbU3t7UTx2jdGlFHi4evsaGI0r8fPAVJCnIpnoko70sTGCrIDvp
         asdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=TFAUgf29GjbYcm/qm0sOT4i4fQMO8RQaCqw25hYYDHs=;
        b=UdW3UDOJ+FZXrhXQin7Y0aphjI7frHWlsUPXddd8ZluAUlpJq3rEV5avbRg8aKBvnz
         JIEJ0mm1j3xkXKPLWBPaHTNf5UhuI+LPAKTN2Y6qmfnAeILAsA7KYqZDnzLvQILBuYmV
         5rIcjRLVxR1PlrEEnG8WW8Yv1imcs0PjLV3/M5d+lmTiVklcCFeeA+cvqwWeqzxn9Ibb
         Hgg85kO4HvOYoVbfcotB6QuwNEhf0pIc37NQOFa0PxVA8I+epZyC+0KcfznkyAHRBH/6
         5iEiAYH6rLZAbU3qXFqvDScrmZ2eNGsMqmw/Rus/5S1fqL7TciOz/HBxYYqVi7yJ8BNM
         AEBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IcJHaQL+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2-20020ac85882000000b003e85bea7fdcsi11131009qta.19.2023.05.16.14.28.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 14:28:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IcJHaQL+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pz2DV-0007Xj-QM; Tue, 16 May 2023 17:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pz2DT-0007XL-Ne
 for qemu-arm@nongnu.org; Tue, 16 May 2023 17:28:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pz2DQ-0002tU-K6
 for qemu-arm@nongnu.org; Tue, 16 May 2023 17:28:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684272494;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TFAUgf29GjbYcm/qm0sOT4i4fQMO8RQaCqw25hYYDHs=;
 b=IcJHaQL+/tY/1xPdaP4Ao0DQVTGvRAKQCBGHpEpgZsEn4+zXRd6LLZPuda7IZc1fnWkL95
 1mg55pbWd3Pyt4IudSuSfs1o7SaJhrYjLUhp+BDth996E2Oiz8+8CQ2qmpYPLEMbVjpchm
 XXk/XJYfVfUx+MmBOXKxk5pIie5CH4w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-411-tQo-XfgPNvqeZvXvz51tJw-1; Tue, 16 May 2023 17:28:12 -0400
X-MC-Unique: tQo-XfgPNvqeZvXvz51tJw-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-30793c16c78so7331775f8f.3
 for <qemu-arm@nongnu.org>; Tue, 16 May 2023 14:28:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684272492; x=1686864492;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TFAUgf29GjbYcm/qm0sOT4i4fQMO8RQaCqw25hYYDHs=;
 b=BW5ZNAVrQAkSzU7G8BaFKAJa1XKAg3EBY/H9yJR/gxP9UGoUNzEqrGn1OsD6qYPzfi
 BXegPwY0+m4RSuVd+MOoI614I0JaHTpFNkQTl7OHbuaZw0o1IBuyy0sH1N6YMdayMbjF
 5084iBBIyCWytznl54MWDxN1/bH0uwQc/Tbh+EvUVMX6kHDQJhBycWAkwUCA5IHglNmG
 Dhkk5zuN71jOmxe4qKn4pCQhcolZp4aYjGgWEWUM8TcUhhOQ0li1ysQB6kmEgicR+gUg
 mWq/Ij42gpyFoMUt3g/4pJPNazU6THgI103CX4r435WPdfPDMMFQ8xMusZMdatlyTKy/
 iTWA==
X-Gm-Message-State: AC+VfDyA/iEdP6IfbHlnOYaYuudTvwNwpIQNswoBr8DYqylMdOezMtZq
 BwXqPEdHmz3WFBXDjvM4CjCl1yzbsMQmHFmNc4HHaMkjCWma+46a07t9wWuOfF7MVzZXNcHOC7k
 RvbNAUoAhP6yD
X-Received: by 2002:adf:f30b:0:b0:2f8:f775:c885 with SMTP id
 i11-20020adff30b000000b002f8f775c885mr27372347wro.6.1684272491807; 
 Tue, 16 May 2023 14:28:11 -0700 (PDT)
X-Received: by 2002:adf:f30b:0:b0:2f8:f775:c885 with SMTP id
 i11-20020adff30b000000b002f8f775c885mr27372325wro.6.1684272491484; 
 Tue, 16 May 2023 14:28:11 -0700 (PDT)
Received: from redhat.com ([2a02:14f:172:3448:6dd9:9d1c:f4ae:94f0])
 by smtp.gmail.com with ESMTPSA id
 p1-20020a5d4e01000000b002c70ce264bfsm526176wrt.76.2023.05.16.14.28.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 14:28:10 -0700 (PDT)
Date: Tue, 16 May 2023 17:28:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 peter.maydell@linaro.org, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net,
 boris.ostrovsky@oracle.com, miguel.luis@oracle.com
Subject: Re: [PATCH 2/3] ACPI: i386: bump to MADT to revision 3
Message-ID: <20230516172635-mutt-send-email-mst@kernel.org>
References: <20230515203311.2139-1-eric.devolder@oracle.com>
 <20230515203311.2139-3-eric.devolder@oracle.com>
 <20230516143149.42ad6810@imammedo.users.ipa.redhat.com>
 <CAARzgww1zX5Ss9gpredzt9X83df5yd3Y_P7kVzauw58yXTryZA@mail.gmail.com>
 <72a526b6-420e-6a85-8cbd-dc589c220c58@oracle.com>
MIME-Version: 1.0
In-Reply-To: <72a526b6-420e-6a85-8cbd-dc589c220c58@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0mnpDZ4uMJut

On Tue, May 16, 2023 at 04:22:58PM -0500, Eric DeVolder wrote:
> 
> 
> On 5/16/23 07:51, Ani Sinha wrote:
> > On Tue, May 16, 2023 at 6:01 PM Igor Mammedov <imammedo@redhat.com> wrote:
> > > 
> > > On Mon, 15 May 2023 16:33:10 -0400
> > > Eric DeVolder <eric.devolder@oracle.com> wrote:
> > > 
> > > > Currently i386 QEMU generates MADT revision 3, and reports
> > > > MADT revision 1. Set .revision to 3 to match reality.
> > > > 
> > > > Link: https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@ora
> > > > cle.com/T/#t
> > > > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> > > > ---
> > > >   hw/i386/acpi-common.c | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> > > > index 52e5c1439a..8a0932fe84 100644
> > > > --- a/hw/i386/acpi-common.c
> > > > +++ b/hw/i386/acpi-common.c
> > > > @@ -102,7 +102,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
> > > >       MachineClass *mc = MACHINE_GET_CLASS(x86ms);
> > > >       const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
> > > >       AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
> > > > -    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
> > > > +    AcpiTable table = { .sig = "APIC", .rev = 3, .oem_id = oem_id,
> > > >                           .oem_table_id = oem_table_id };
> > > > 
> > > >       acpi_table_begin(&table, table_data);
> > > 
> > > make check fails for me at this point
> > > (my guess is that not all APIC tables are whitelisted)
> > 
> > I think the patchset needs to be rebased and the blobs regenerated.
> 
> So I've been trying to overcome this today and not having much luck.
> 
> When I run "make check V=2", I see at the end:
> 
> Summary of Failures:
> 
>  45/786 qemu:qtest+qtest-i386 / qtest-i386/bios-tables-test
>  68/786 qemu:qtest+qtest-x86_64 / qtest-x86_64/bios-tables-test
> 
> If I go look at 45/786, for example, I see:
> 
> Looking for expected file 'tests/data/acpi/pc/FACP'
> Using expected file 'tests/data/acpi/pc/FACP'
> Looking for expected file 'tests/data/acpi/pc/APIC'
> Using expected file 'tests/data/acpi/pc/APIC'
> Looking for expected file 'tests/data/acpi/pc/HPET'
> Using expected file 'tests/data/acpi/pc/HPET'
> Looking for expected file 'tests/data/acpi/pc/WAET'
> Using expected file 'tests/data/acpi/pc/WAET'
> Looking for expected file 'tests/data/acpi/pc/FACS'
> Using expected file 'tests/data/acpi/pc/FACS'
> Looking for expected file 'tests/data/acpi/pc/DSDT'
> Using expected file 'tests/data/acpi/pc/DSDT'
> acpi-test: Warning! APIC binary file mismatch. Actual [aml:/tmp/aml-R4D741],
> Expected [aml:tests/data/acpi/pc/APIC].
> See source file tests/qtest/bios-tables-test.c for instructions on how to update expected files.
> acpi-test: Warning! APIC mismatch. Actual [asl:/tmp/asl-GVD741.dsl,
> aml:/tmp/aml-R4D741], Expected [asl:/tmp/asl-1F9641.dsl,
> aml:tests/data/acpi/pc/APIC].
> --- /tmp/asl-1F9641.dsl 2023-05-16 15:18:31.292579156 -0400
> +++ /tmp/asl-GVD741.dsl 2023-05-16 15:18:31.291579149 -0400
> @@ -1,32 +1,32 @@
>  /*
>   * Intel ACPI Component Architecture
>   * AML/ASL+ Disassembler version 20230331 (64-bit version)
>   * Copyright (c) 2000 - 2023 Intel Corporation
>   *
> - * Disassembly of tests/data/acpi/pc/APIC, Tue May 16 15:18:31 2023
> + * Disassembly of /tmp/aml-R4D741, Tue May 16 15:18:31 2023
>   *
>   * ACPI Data Table [APIC]
>   *
>   * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue (in hex)
>   */
> 
>  [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Description Table (MADT)]
>  [004h 0004 004h]                Table Length : 00000078
> -[008h 0008 001h]                    Revision : 01
> -[009h 0009 001h]                    Checksum : 8A
> +[008h 0008 001h]                    Revision : 03
> +[009h 0009 001h]                    Checksum : 88
>  [00Ah 0010 006h]                      Oem ID : "BOCHS "
>  [010h 0016 008h]                Oem Table ID : "BXPC    "
>  [018h 0024 004h]                Oem Revision : 00000001
>  [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
>  [020h 0032 004h]       Asl Compiler Revision : 00000001
> [...]
> 
> And the q35 looks very very similar.
> 
> It suggests that I need to list tests/data/acpi/pc/APIC, which I have done
> in bios-tables-test-allowed-diff.h:
> 
> /* List of comma-separated changed AML files to ignore */
> "tests/data/acpi/pc/APIC",
> "tests/data/acpi/q35/APIC",
> "tests/data/acpi/microvm/APIC",
> "tests/data/acpi/virt/APIC",
> 
> But as I looked closer at the files that changed in the last step
> of the previous post, there are a bunch of them:
> 
>  tests/data/acpi/microvm/APIC                  | Bin 70 -> 70 bytes
>  tests/data/acpi/microvm/APIC.ioapic2          | Bin 82 -> 82 bytes
>  tests/data/acpi/microvm/APIC.pcie             | Bin 110 -> 110 bytes
>  tests/data/acpi/pc/APIC                       | Bin 120 -> 120 bytes
>  tests/data/acpi/pc/APIC.acpihmat              | Bin 128 -> 128 bytes
>  tests/data/acpi/pc/APIC.cphp                  | Bin 160 -> 160 bytes
>  tests/data/acpi/pc/APIC.dimmpxm               | Bin 144 -> 144 bytes
>  tests/data/acpi/q35/APIC                      | Bin 120 -> 120 bytes
>  tests/data/acpi/q35/APIC.acpihmat             | Bin 128 -> 128 bytes
>  tests/data/acpi/q35/APIC.acpihmat-noinitiator | Bin 144 -> 144 bytes
>  tests/data/acpi/q35/APIC.core-count2          | Bin 2478 -> 2478 bytes
>  tests/data/acpi/q35/APIC.cphp                 | Bin 160 -> 160 bytes
>  tests/data/acpi/q35/APIC.dimmpxm              | Bin 144 -> 144 bytes
>  tests/data/acpi/q35/APIC.xapic                | Bin 2686 -> 2686 bytes
> 
> Should all of these files be listed in allowed-diff.h?

unfortunately, yes.

> And I would also need to provide the diff for each in the patch
> containing this last step, correct?
> 
> Thanks,
> eric

if you mean commit log, if the diff is the same it is
enough to list it once and mention it is the same.

-- 
MST

