Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp564390ejm;
        Wed, 19 Apr 2023 07:57:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350bkdJzfutreiXBWe2eYxDjWZUgy8C7eJVlUcuSnuLWE7BH3TBOPifXToaaLuAJxYOVGGbTx
X-Received: by 2002:a05:622a:4d2:b0:3ed:e5ad:4a30 with SMTP id q18-20020a05622a04d200b003ede5ad4a30mr4937275qtx.10.1681916226144;
        Wed, 19 Apr 2023 07:57:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681916226; cv=none;
        d=google.com; s=arc-20160816;
        b=aRX8f8NCowKRCbk543F/olbrtlsYHTOLaBBkUSkdmBoCiNjF0sF1qpWMMS5RnuSfc1
         EJygJ1OU93IoHtMtFLFwwFiTpWH7yI3wVyWb8/v/Zr49aHmH0ht/n8lUzF4BniCIhJQQ
         6qTy9vys9y1rHC8XfeD6d6cw3pFJPxxdH9G8lbDHsfPr+mxP3rju6MI+bt7fOALSfUkS
         7xI9tLhV9uzaOaR+IJu9zBccY3KrY9N5sEiPOJm4kUPtfCPisBYtSymgxi7aDRGYq0b2
         8PipohIAA/TzEQuAk7PThcVjqi6g4fMtZNtOaVAhYBDeSFDyXfQMgyPYcCQPQK5v7xyl
         i70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=cRT+JlplELgWdlQU/jQYf7SkUZSL0rR4DAxc+aB1O3Q=;
        b=cfanIoZs9qYWT5MaZJ5OfPOcoeFloTgJ7s8KwTxbPWzGBJm3/s0WRbjiyu78CIjCfq
         Kxl2TaTSmDoj5XZydqu2UhHwz+OwXfzKctEvsU2KzU/FJHIUT+YE1Y6YgZK71HKFjZ+A
         GsgOxBhfzeUxiVS7wHdjnbU2JiQFodH7FGGjJZcCriu5uLBafWqUNWk/SVnk560Nv6Eh
         u1PNeKCn7r1ajG1Dp1O6x+mVUo6i/b5ezQ/oMCKaM0xa+sbVES8tR9ItIZQ43zhZvSoC
         u8MS6bANoIhBCatW8OyqM7z95cXZpcskZm+jVVSekIplf08SgurPZgdqTI9arLLn0ukv
         yIwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MUrc8Ds1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2-20020a05620a44c200b0074deecead5asi5173347qkp.46.2023.04.19.07.57.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Apr 2023 07:57:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MUrc8Ds1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pp9Eh-0006RN-TZ; Wed, 19 Apr 2023 10:56:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pp9Eg-0006Qw-6X
 for qemu-arm@nongnu.org; Wed, 19 Apr 2023 10:56:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pp9Ee-0002PW-71
 for qemu-arm@nongnu.org; Wed, 19 Apr 2023 10:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681916197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cRT+JlplELgWdlQU/jQYf7SkUZSL0rR4DAxc+aB1O3Q=;
 b=MUrc8Ds1ia8hlxFTw6P5gyTcIqvMCmlWercakrMNqrcvQ7bOCnbOBTSrpEg1L/9YiqIJR6
 tseTDOueFWwCFoUPQHiVQ+ntdgC9bkNTDvKKaPRzsXVS0GyntWpcXnEtX1ymqkwkOaiHl8
 uSKKJl63UjDccLbHySU3sPzoCb6wQgE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-t-3LGt9IOWSq21PGeggNsQ-1; Wed, 19 Apr 2023 10:56:35 -0400
X-MC-Unique: t-3LGt9IOWSq21PGeggNsQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay3-20020a05600c1e0300b003f1728ce786so1156964wmb.7
 for <qemu-arm@nongnu.org>; Wed, 19 Apr 2023 07:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681916194; x=1684508194;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cRT+JlplELgWdlQU/jQYf7SkUZSL0rR4DAxc+aB1O3Q=;
 b=QyDfyCyfmsdrfqKHneAD99vOpF3oPB5kWAB+3ybHojUYONZ67aFQbpqLoiS4b4XGz/
 Up0ntjGfImyx2+/lcG15HKtr6lO8LcEMISU134bg8MesoHS3+1uJzFUdl4tSbk+4jyz/
 X2c9gFxFeg3drk67Op2oDvmBKXu+8xhO9bYwrBTV04ZdI/BGzQBgQCHlL70z2qg22CXW
 saQq+Ie73HPK98TM4PPlEyy44//mldn0zzvhBve+1Qw782FSp18VELBH5NnpqIHMyjL8
 nIEpIZ5quIT7bg9lIGmgDf2GcAeP7bUJDApSOh5tuWlDKijY3xPJ67BAxLzOQP6QMSU2
 JeBg==
X-Gm-Message-State: AAQBX9ebvfYJd9WdEgUI1yNWAb11PuzQEumpV+8kyuqyITVCEoGXHRuy
 +3URH/dymvYs9Xf3ZYZh9CwRskg76vgXn/1rcP/5KIsf4YB7Mnq3ekBrRVsqradxyRT25qKCguP
 MmIQ8QaduVj0x
X-Received: by 2002:a1c:7c15:0:b0:3f0:b095:15d9 with SMTP id
 x21-20020a1c7c15000000b003f0b09515d9mr13505119wmc.40.1681916193837; 
 Wed, 19 Apr 2023 07:56:33 -0700 (PDT)
X-Received: by 2002:a1c:7c15:0:b0:3f0:b095:15d9 with SMTP id
 x21-20020a1c7c15000000b003f0b09515d9mr13505101wmc.40.1681916193503; 
 Wed, 19 Apr 2023 07:56:33 -0700 (PDT)
Received: from redhat.com ([2a06:c701:742d:fd00:c847:221d:9254:f7ce])
 by smtp.gmail.com with ESMTPSA id
 l8-20020a7bc448000000b003f179fc6d8esm2398995wmi.44.2023.04.19.07.56.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 07:56:32 -0700 (PDT)
Date: Wed, 19 Apr 2023 10:56:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: shannon.zhaosl@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, boris.ostrovsky@oracle.com
Subject: Re: [PATCH v2 3/4] hw/acpi: i386: bump MADT to revision 5
Message-ID: <20230419105515-mutt-send-email-mst@kernel.org>
References: <20230418165219.2036-1-eric.devolder@oracle.com>
 <20230418165219.2036-4-eric.devolder@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20230418165219.2036-4-eric.devolder@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 9pOtE7tPt0Lj

On Tue, Apr 18, 2023 at 12:52:18PM -0400, Eric DeVolder wrote:
> Currently i386 QEMU generates MADT revision 3, and reports
> MADT revision 1. ACPI 6.3 introduces MADT revision 5.
> 
> For MADT revision 4, that introduces ARM GIC structures, which do
> not apply to i386.
> 
> For MADT revision 5, the Local APIC flags introduces the Online
> Capable bitfield.
> 
> Making MADT generate and report revision 5 will solve problems with
> CPU hotplug (the Online Capable flag indicates hotpluggable CPUs).
> 
> Link: https://lore.kernel.org/linux-acpi/20230327191026.3454-1-eric.devolder@oracle.com/T/#t
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  hw/i386/acpi-common.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> index 52e5c1439a..286c1c5c32 100644
> --- a/hw/i386/acpi-common.c
> +++ b/hw/i386/acpi-common.c
> @@ -38,8 +38,15 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
>  {
>      uint32_t apic_id = apic_ids->cpus[uid].arch_id;
>      /* Flags – Local APIC Flags */
> -    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
> -                     1 /* Enabled */ : 0;
> +    bool enabled = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
> +                     true : false;
> +    /*
> +     * ACPI 6.3 5.2.12.2 Local APIC Flags: OnlineCapable must be 0
> +     * if Enabled is set.
> +     */
> +    bool onlinecapable = enabled ? false : true;

Pls write this as onlinecapable = !enabled or just open-code on the next
line - does not look like this variable adds  a lot of value.

> +    uint32_t flags = onlinecapable ? 0x2 : 0x0 | /* Online Capable */
> +                     enabled ? 0x1 : 0x0; /* Enabled */
>  
>      /* ACPI spec says that LAPIC entry for non present
>       * CPU may be omitted from MADT or it must be marked
> @@ -102,7 +109,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
>      MachineClass *mc = MACHINE_GET_CLASS(x86ms);
>      const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
>      AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
> -    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
> +    AcpiTable table = { .sig = "APIC", .rev = 5, .oem_id = oem_id,
>                          .oem_table_id = oem_table_id };
>  
>      acpi_table_begin(&table, table_data);
> -- 
> 2.31.1

