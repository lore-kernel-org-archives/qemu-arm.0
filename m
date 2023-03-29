Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp260139ejb;
        Tue, 28 Mar 2023 22:19:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZirZB5Xs730affEJMuW3hCl+hWkEm26ybv6lN279b56Q5hR+m+zphEFT6HEgYHPy5sjZeB
X-Received: by 2002:a05:6214:d0a:b0:5ac:77ef:f76 with SMTP id 10-20020a0562140d0a00b005ac77ef0f76mr28150956qvh.44.1680067166983;
        Tue, 28 Mar 2023 22:19:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680067166; cv=none;
        d=google.com; s=arc-20160816;
        b=P1q7/8hfSmMB3aZUp2qqHakcgFt86RfuYuytrg9kniTKMDts0E7kTxkjIz4U1GkiYD
         z2tOLV+rA+V4PaREin+simm52V1LdtBA6XIbtr8zDtbN/1vfzN4Dj9IeI+GpTCXDM/RL
         xcOpSfVqOQqHveEbCL+8ENIfgCFSL+74yI81PFW9NBaJdiLwcGCFpz5YmpQsUGAdl5bY
         RQRR6K1zprPgUPv6firxbFfRacfeE6daLzOioibvDEqvY0725o3Bt8sDKarpOGWQ+7Gl
         Pd3fy/o0fN7KXUBTIQJ+kG9mBB+CU7SSxGT5ywvnkb4Ff2u8NFV6Lw2KNW90LfuAF3Tj
         Y3gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=HVUitrpaSslecH8rL629i2jw6V4SZNJqYRllCW9EZuo=;
        b=LYMATIXjPrDIM1dqCGTYvVcFUEjg/P189xMNod+qXVN55HL8iqVAqMaWmuUYSCog2+
         5pi09IzKUImdgdmmGnXkoPzv+KGZmStJVN3m/0qXPwToYQCtvWLYNWA84WKl4yEPLjMU
         igJKQd36xljKG/gKv97Pfta9NoQSN2zO1T3fw4gPBe3iyxpJSURT7zVttY0h8ANDTGgx
         Qou9R/TSCbB+TG0byN1dsw1KdXVsA+AWMlx4QYytyb3aptpSw/9KsoN9tEPZZNXxKlXi
         P/HUz+NKjw6EsfNXJD9Xk/gzS92D31zyd8K1t6XDrFDHpfhsYMTDCfmoVPUApKnOPXai
         WodQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WdM99JqH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w21-20020ac87e95000000b003b6914d574dsi7314008qtj.157.2023.03.28.22.19.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Mar 2023 22:19:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WdM99JqH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phODP-0007SH-Dy; Wed, 29 Mar 2023 01:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1phODN-0007S1-5k
 for qemu-arm@nongnu.org; Wed, 29 Mar 2023 01:19:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1phODJ-0000rO-HA
 for qemu-arm@nongnu.org; Wed, 29 Mar 2023 01:19:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680067151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HVUitrpaSslecH8rL629i2jw6V4SZNJqYRllCW9EZuo=;
 b=WdM99JqH3t1TfpRmIdteI82UB0P+wmnLDJIdL44XqFq6b4z6FacyCIDuJR5MxRAXb4z9uc
 y0ZHAnpeGOdHSMfzyDDr4UT5eOQqWaUx+XFCcRgvtFqzATgWXVRu3CdDlPwcLtXd3/DncQ
 dfN6hfHSZmmZOGdmJMrrC7hEJeNY8+Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-A0NsrLHfMPKu4Zq4hw3WKg-1; Wed, 29 Mar 2023 01:19:10 -0400
X-MC-Unique: A0NsrLHfMPKu4Zq4hw3WKg-1
Received: by mail-wm1-f70.google.com with SMTP id
 m5-20020a05600c4f4500b003ee8db23ef9so8073402wmq.8
 for <qemu-arm@nongnu.org>; Tue, 28 Mar 2023 22:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680067149;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HVUitrpaSslecH8rL629i2jw6V4SZNJqYRllCW9EZuo=;
 b=T/lo4JCUDaFqX90sdx9X1Veuen7ClxpNEW0yNFBTnAD8NnqiOG5bsg/cmP3ENEzJIk
 2t0mtQRdPiE42ZCVSQsFUOQiiMB7s4nt64cLPSHXg8aXI/5AYTkLvAejHOjm/SituBt+
 A7F9UfvbMBsRPST1q/8JFPO3vCEfel++eXqPIvdmz0P/BaPGHfzB06CXjqybgQB6hxf/
 nIb6ZV3MC0GM6xG/XAk1ZjkeqDmjUH7uczw7Wgf2wEzofZBq7kvu94LT5nQS5bIR92wj
 1BTqPreMZJLaoiEKzuNUD84UH8ksLloscu209V5/bqS3wEgDtuZAn1xoD3kPYOvs+bR3
 pjzQ==
X-Gm-Message-State: AAQBX9dGOOGOeU8gp9Y3UBQpU4yego+cYBxFWg+G0kVfADnmGJ3hZobe
 89IuXeGKmvQXt5Qy0h6X6UfDfsXwPlTYzstxBASuWxigDcpVIIJ3Ubqs0m+TvzYFx11/+1Nkym0
 aEkuNiUvA+yxr
X-Received: by 2002:adf:e288:0:b0:2ce:a93d:882d with SMTP id
 v8-20020adfe288000000b002cea93d882dmr14676384wri.11.1680067148953; 
 Tue, 28 Mar 2023 22:19:08 -0700 (PDT)
X-Received: by 2002:adf:e288:0:b0:2ce:a93d:882d with SMTP id
 v8-20020adfe288000000b002cea93d882dmr14676365wri.11.1680067148547; 
 Tue, 28 Mar 2023 22:19:08 -0700 (PDT)
Received: from redhat.com ([2.52.18.165]) by smtp.gmail.com with ESMTPSA id
 c12-20020a05600c0acc00b003ed2987690dsm830426wmr.26.2023.03.28.22.19.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 22:19:08 -0700 (PDT)
Date: Wed, 29 Mar 2023 01:19:04 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: shannon.zhaosl@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, boris.ostrovsky@oracle.com
Subject: Re: [PATCH 0/2] hw/acpi: bump MADT to revision 5
Message-ID: <20230329010406-mutt-send-email-mst@kernel.org>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20230328155926.2277-1-eric.devolder@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: l8jnXK82Un27

Hmm I don't think we can reasonably make such a change for 8.0.
Seems too risky.
Also, I feel we want to have an internal (with "x-" prefix") flag to
revert to old behaviour, in case of breakage on some guests.  and maybe
we want to keep old revision for old machine types.


On Tue, Mar 28, 2023 at 11:59:24AM -0400, Eric DeVolder wrote:
> The following Linux kernel change broke CPU hotplug for MADT revision
> less than 5.
> 
>  commit e2869bd7af60 ("x86/acpi/boot: Do not register processors that cannot be onlined for x2APIC")

Presumably it's being fixed? Link to discussion? Patch fixing that in
Linux?


> As part of the investigation into resolving this breakage, I learned
> that i386 QEMU reports revision 1, while technically it is at revision 3.
> (Arm QEMU reports revision 4, and that is valid/correct.)
> 
> ACPI 6.3 bumps MADT revision to 5 as it introduces an Online Capable
> flag that the above Linux patch utilizes to denote hot pluggable CPUs.
> 
> So in order to bump MADT to the current revision of 5, need to
> validate that all MADT table changes between 1 and 5 are present
> in QEMU.
> 
> Below is a table summarizing the changes to the MADT. This information
> gleamed from the ACPI specs on uefi.org.
> 
> ACPI    MADT    What
> Version Version
> 1.0             MADT not present
> 2.0     1       Section 5.2.10.4
> 3.0     2       Section 5.2.11.4
>                  5.2.11.13 Local SAPIC Structure added two new fields:
>                   ACPI Processor UID Value
>                   ACPI Processor UID String
>                  5.2.10.14 Platform Interrupt Sources Structure:
>                   Reserved changed to Platform Interrupt Sources Flags
> 3.0b    2       Section 5.2.11.4
>                  Added a section describing guidelines for the ordering of
>                  processors in the MADT to support proper boot processor
>                  and multi-threaded logical processor operation.
> 4.0     3       Section 5.2.12
>                  Adds Processor Local x2APIC structure type 9
>                  Adds Local x2APIC NMI structure type 0xA
> 5.0     3       Section 5.2.12
> 6.0     3       Section 5.2.12
> 6.0a    4       Section 5.2.12
>                  Adds ARM GIC structure types 0xB-0xF
> 6.2a    45      Section 5.2.12   <--- yep it says version 45!
> 6.2b    5       Section 5.2.12
>                  GIC ITS last Reserved offset changed to 16 from 20 (typo)
> 6.3     5       Section 5.2.12
>                  Adds Local APIC Flags Online Capable!
>                  Adds GICC SPE Overflow Interrupt field
> 6.4     5       Section 5.2.12
>                  Adds Multiprocessor Wakeup Structure type 0x10
>                  (change notes says structure previously misplaced?)
> 6.5     5       Section 5.2.12
> 
> For the MADT revision change 1 -> 2, the spec has a change to the
> SAPIC structure. In general, QEMU does not generate/support SAPIC.
> So the QEMU i386 MADT revision can safely be moved to 2.
> 
> For the MADT revision change 2 -> 3, the spec adds Local x2APIC
> structures. QEMU has long supported x2apic ACPI structures. A simple
> search of x2apic within QEMU source and hw/i386/acpi-common.c
> specifically reveals this.

But not unconditionally.

> So the QEMU i386 MADT revision can safely
> be moved to 3.
> 
> For the MADT revision change 3 -> 4, the spec adds support for the ARM
> GIC structures. QEMU ARM does in fact generate and report revision 4.
> As these will not be used by i386 QEMU, so then the QEMU i386 MADT
> revision can safely be moved to 4 as well.
> 
> Now for the MADT revision change 4 -> 5, the spec adds the Online
> Capable flag to the Local APIC structure, and the ARM GICC SPE
> Overflow Interrupt field.
> 
> For the ARM SPE, an existing 3-byte Reserved field is broken into a 1-
> byte Reserved field and a 2-byte SPE field.  The spec says that is SPE
> Overflow is not supported, it should be zero.
> 
> For the i386 Local APIC flag Online Capable, the spec has certain rules
> about this value. And in particuar setting this value now explicitly
> indicates a hotpluggable CPU.
> 
> So this patch makes the needed changes to move both ARM and i386 MADT
> to revision 5. These are not complicated, thankfully.
> 
> Without these changes, the information below shows "how" CPU hotplug
> breaks with the current upstream Linux kernel 6.3.  For example, a Linux
> guest started with:
> 
>  qemu-system-x86_64 -smp 30,maxcpus=32 ...
> 
> and then attempting to hotplug a CPU:
> 
>   (QEMU) device_add id=cpu30 driver=host-x86_64-cpu socket-id=0 core-id=30 thread-id=0
> 
> fails with the following:
> 
>   APIC: NR_CPUS/possible_cpus limit of 30 reached. Processor 30/0x.
>   ACPI: Unable to map lapic to logical cpu number
>   acpi LNXCPU:1e: Enumeration failure
> 
>   # dmesg | grep smpboot
>   smpboot: Allowing 30 CPUs, 0 hotplug CPUs
>   smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x)
>   smpboot: Max logical packages: 1
>   smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
> 
>   # iasl -d /sys/firmware/tables/acpi/APIC
>   [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Descript
>   [004h 0004   4]                 Table Length : 00000170
>   [008h 0008   1]                     Revision : 01          <=====
>   [009h 0009   1]                     Checksum : 9C
>   [00Ah 0010   6]                       Oem ID : "BOCHS "
>   [010h 0016   8]                 Oem Table ID : "BXPC    "
>   [018h 0024   4]                 Oem Revision : 00000001
>   [01Ch 0028   4]              Asl Compiler ID : "BXPC"
>   [020h 0032   4]        Asl Compiler Revision : 00000001
> 
>   ...
> 
>   [114h 0276   1]                Subtable Type : 00 [Processor Local APIC]
>   [115h 0277   1]                       Length : 08
>   [116h 0278   1]                 Processor ID : 1D
>   [117h 0279   1]                Local Apic ID : 1D
>   [118h 0280   4]        Flags (decoded below) : 00000001
>                              Processor Enabled : 1          <=====
> 
>   [11Ch 0284   1]                Subtable Type : 00 [Processor Local APIC]
>   [11Dh 0285   1]                       Length : 08
>   [11Eh 0286   1]                 Processor ID : 1E
>   [11Fh 0287   1]                Local Apic ID : 1E
>   [120h 0288   4]        Flags (decoded below) : 00000000
>                              Processor Enabled : 0          <=====
> 
>   [124h 0292   1]                Subtable Type : 00 [Processor Local APIC]
>   [125h 0293   1]                       Length : 08
>   [126h 0294   1]                 Processor ID : 1F
>   [127h 0295   1]                Local Apic ID : 1F
>   [128h 0296   4]        Flags (decoded below) : 00000000
>                              Processor Enabled : 0          <=====
> 
> The (latest upstream) Linux kernel sees 30 Enabled processors, and
> does not consider processors 31 and 32 to be hotpluggable.
> 
> With this patch series applied, by bumping MADT to revision 5, the
> latest upstream Linux kernel correctly identifies 30 CPUs plus 2
> hotpluggable CPUS.
> 
>   CPU30 has been hot-added
>   smpboot: Booting Node 0 Processor 30 APIC 0x1e
>   Will online and init hotplugged CPU: 30
> 
>   # dmesg | grep smpboot
>   smpboot: Allowing 32 CPUs, 2 hotplug CPUs
>   smpboot: CPU0: Intel(R) Xeon(R) CPU D-1533 @ 2.10GHz (family: 0x6, model: 0x56, stepping: 0x3)
>   smpboot: Max logical packages: 2
>   smpboot: Total of 30 processors activated (125708.76 BogoMIPS)
> 
>   # iasl -d /sys/firmware/tables/acpi/APIC
>   [000h 0000 004h]                   Signature : "APIC"    [Multiple APIC Descript
>   [004h 0004 004h]                Table Length : 00000170
>   [008h 0008 001h]                    Revision : 05          <=====
>   [009h 0009 001h]                    Checksum : 94
>   [00Ah 0010 006h]                      Oem ID : "BOCHS "
>   [010h 0016 008h]                Oem Table ID : "BXPC    "
>   [018h 0024 004h]                Oem Revision : 00000001
>   [01Ch 0028 004h]             Asl Compiler ID : "BXPC"
>   [020h 0032 004h]       Asl Compiler Revision : 00000001
> 
>   ...
> 
>   [114h 0276 001h]               Subtable Type : 00 [Processor Local APIC]
>   [115h 0277 001h]                      Length : 08
>   [116h 0278 001h]                Processor ID : 1D
>   [117h 0279 001h]               Local Apic ID : 1D
>   [118h 0280 004h]       Flags (decoded below) : 00000001
>                              Processor Enabled : 1          <=====
>                         Runtime Online Capable : 0          <=====
> 
>   [11Ch 0284 001h]               Subtable Type : 00 [Processor Local APIC]
>   [11Dh 0285 001h]                      Length : 08
>   [11Eh 0286 001h]                Processor ID : 1E
>   [11Fh 0287 001h]               Local Apic ID : 1E
>   [120h 0288 004h]       Flags (decoded below) : 00000002
>                              Processor Enabled : 0          <=====
>                         Runtime Online Capable : 1          <=====
> 
>   [124h 0292 001h]               Subtable Type : 00 [Processor Local APIC]
>   [125h 0293 001h]                      Length : 08
>   [126h 0294 001h]                Processor ID : 1F
>   [127h 0295 001h]               Local Apic ID : 1F
>   [128h 0296 004h]       Flags (decoded below) : 00000002
>                              Processor Enabled : 0          <=====
>                         Runtime Online Capable : 1          <=====
> 
> Regards,
> Eric

Can you please report which guests were tested?


> 
> Eric DeVolder (2):
>   hw/acpi: arm: bump MADT to revision 5
>   hw/acpi: i386: bump MADT to revision 5
> 
>  hw/arm/virt-acpi-build.c |  6 ++++--
>  hw/i386/acpi-common.c    | 13 ++++++++++---
>  2 files changed, 14 insertions(+), 5 deletions(-)
> 
> -- 
> 2.31.1
> 
> 
> 

