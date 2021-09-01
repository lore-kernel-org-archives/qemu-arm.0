Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp250701lfb;
        Wed, 1 Sep 2021 01:04:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmG59Q2/EXKURGkYkWp/qXMQ6Pl42//7OoCZ9QB1x09ov8pxbHPuXmDZj/5wo6O2gNSnco
X-Received: by 2002:adf:b347:: with SMTP id k7mr35461705wrd.239.1630483457442;
        Wed, 01 Sep 2021 01:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630483457; cv=none;
        d=google.com; s=arc-20160816;
        b=VR/pPDyf3QkzI18EZHc/PdgXAXx6xZv0IbEsaqcQSDEx+qb2sDba0TdxXHjAClyl8m
         FwXzPt9xr+U6jBMv5oWTgY5lo4O/qbIHkKD6QB9CX/VjGok81+N4fLEXJodh2knMhxcq
         iqiyNQXLtV0KZo1X6D9Cf+rpJfhBBAALjVTjwemnVdlUWEIZWgBi4w0sJPMOm/5O6x2X
         DTA9zntb/Qhe0UG1nozZzrw18gknVM9ooCHWfUcwLlZqbYHDEZgflIKBbZI6BHp9i+j/
         jYv38wJ9WAcHtwBqklkYxpI58cPKyfLFWtXJ9U6Ew6z6O7b0/HQPChhwUSOC2joLaxLJ
         nj4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=2EFasJRPaWNSp5dBYvRrNqey6IACM0MXhZC7bnd/8GE=;
        b=sZ0ANQOPLnhCOqoV/KlepmXn5ojKbJ8O9qrdvbiGuuKiHgCMfw8WkSlS9eb490GN3p
         DQYhawEk86cCdrVq3vABqdz9LAFLzmo0cm5Lz2OWb8oqMyHV10s2DFNA6UmvMx/Ot+Gq
         YqMpe1YLr7ELYGOx19sa9JJGAieFa4db3hSFcxncX1aC9zag4HEUrrx4XC6LaqKRvW72
         aUY97tMu1T+bSBxzMRg0s/LSvj07Bq2n5AGP3IWBVHWvg7WbSBj94BFo4DdpLptsshC6
         4jj9NoSuyjVraKHUGYRlMuFblFjo7NSOJETH9oM6MW5JnOUMKnesL9MEnCqXhXZWUzq0
         wxuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hAyXUrJs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si363202wrq.104.2021.09.01.01.04.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Sep 2021 01:04:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hAyXUrJs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mLLEG-0007ir-Eq
	for alex.bennee@linaro.org; Wed, 01 Sep 2021 04:04:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLLDc-0007dE-KQ
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 04:03:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mLLDY-0000tY-2w
 for qemu-arm@nongnu.org; Wed, 01 Sep 2021 04:03:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630483410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2EFasJRPaWNSp5dBYvRrNqey6IACM0MXhZC7bnd/8GE=;
 b=hAyXUrJsvDV6gUyxeKED61cpM4SAr/8hvkfs1oeaLaGvuccUaAQ8V6w8h+zxxMiB5XUFku
 9OvvNXhK4jLKZSyyYU6Yl5Sz7Z/oD6Xqc8varMLMqUv7P1K6LV6W0BTd8JkCQ8BqMLBlEz
 6+O1BJ56GozW8wDD1kc/yZOy9oi2iSs=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-tFdCg2IANmyPFxFeAwdShg-1; Wed, 01 Sep 2021 04:03:27 -0400
X-MC-Unique: tFdCg2IANmyPFxFeAwdShg-1
Received: by mail-wm1-f69.google.com with SMTP id
 m22-20020a7bca56000000b002e7508f3faeso706886wml.2
 for <qemu-arm@nongnu.org>; Wed, 01 Sep 2021 01:03:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2EFasJRPaWNSp5dBYvRrNqey6IACM0MXhZC7bnd/8GE=;
 b=T97M3gk8hNJdVogYOT1x7jVd1DeVsZ0lqyW8pwV4ooj7gFPaL3VDFBFcFgi/k/1qtZ
 C6D75tZEhCHrdkDX93EQECStm3DiOwWF1Iluq4CF2/X0Mq+EO5q7FAQdfLmC6YaqiimB
 vvTmrqOOao5kNY8QkTYK9n+pmddnrYloOD+scLGaIb2RlTaRUMW6HvXimfGVB8AYcvvx
 D9okWNcnyDvZFptPL5F6MiiGBbnI2bKPUJD/ff45MNIkzCUTWMdBKa6v0lagWgQ/ECSc
 pdu3BXj49gXpKQQsZQIS6nkggn6Uhv23u9SAZAl4gT9g44pIOE71XTXolF+aZAJqlTiV
 iKQw==
X-Gm-Message-State: AOAM533WCV9hUOUDJAqXh/elGaJx+K00npbZxRllKpsSwnwUp/auVXpW
 VOl3An3olRTgKCJ4UJS/h7cQLJxcO88NAk1dWHcIC2jF2YVDgQJzg81QmIJMwUBzYW06OA2vWtz
 QU9E5VGeLsDYN
X-Received: by 2002:a05:600c:4293:: with SMTP id
 v19mr8233378wmc.32.1630483406158; 
 Wed, 01 Sep 2021 01:03:26 -0700 (PDT)
X-Received: by 2002:a05:600c:4293:: with SMTP id
 v19mr8233357wmc.32.1630483405953; 
 Wed, 01 Sep 2021 01:03:25 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id b24sm4367376wmj.43.2021.09.01.01.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 01:03:25 -0700 (PDT)
Date: Wed, 1 Sep 2021 10:03:24 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shashi Mallela <shashi.mallela@linaro.org>
Subject: Re: [PATCH v7 10/10] tests/data/acpi/virt: Update IORT files for ITS
Message-ID: <20210901100324.3ce458f6@redhat.com>
In-Reply-To: <20210805223002.144855-11-shashi.mallela@linaro.org>
References: <20210805223002.144855-1-shashi.mallela@linaro.org>
 <20210805223002.144855-11-shashi.mallela@linaro.org>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, mst@redhat.com, rad@semihalf.com,
 qemu-devel@nongnu.org, eric.auger@redhat.com, qemu-arm@nongnu.org,
 leif@nuviainc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1cJdrsWAJOPa

not directly related to the patch but while I was testing IORT testcase
(https://github.com/imammedo/qemu acpi-tests)
after rebase to 6.1, I get test failure due to change in MADT table vs
expected blobs made in 6.0 time and it does look like ABI change
(what is bad, it also happens to virt-6.0 machine type).
Can ARM folks check if we didn't break something?

acpi-test: Warning! APIC mismatch. Actual [asl:/tmp/asl-1TCW80.dsl, aml:/tmp/aml-OUIW80], Expected [asl:/tmp/asl-O8DW80.dsl, aml:tests/data/acpi/virt/APIC].
--- /tmp/asl-O8DW80.dsl	2021-09-01 03:49:02.311023292 -0400
+++ /tmp/asl-1TCW80.dsl	2021-09-01 03:49:02.311023292 -0400
@@ -1,78 +1,82 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20180629 (64-bit version)
  * Copyright (c) 2000 - 2018 Intel Corporation
  * 
- * Disassembly of tests/data/acpi/virt/APIC, Wed Sep  1 03:49:02 2021
+ * Disassembly of /tmp/aml-OUIW80, Wed Sep  1 03:49:02 2021
  *
  * ACPI Data Table [APIC]
  *
  * Format: [HexOffset DecimalOffset ByteLength]  FieldName : FieldValue
  */
 
 [000h 0000   4]                    Signature : "APIC"    [Multiple APIC Description Table (MADT)]
-[004h 0004   4]                 Table Length : 000000A8
+[004h 0004   4]                 Table Length : 000000B4
 [008h 0008   1]                     Revision : 03
-[009h 0009   1]                     Checksum : 50
+[009h 0009   1]                     Checksum : CA
 [00Ah 0010   6]                       Oem ID : "BOCHS "
 [010h 0016   8]                 Oem Table ID : "BXPC    "
 [018h 0024   4]                 Oem Revision : 00000001
 [01Ch 0028   4]              Asl Compiler ID : "BXPC"
 [020h 0032   4]        Asl Compiler Revision : 00000001
 
 [024h 0036   4]           Local Apic Address : 00000000
 [028h 0040   4]        Flags (decoded below) : 00000000
                          PC-AT Compatibility : 0
 
 [02Ch 0044   1]                Subtable Type : 0C [Generic Interrupt Distributor]
 [02Dh 0045   1]                       Length : 18
 [02Eh 0046   2]                     Reserved : 0000
 [030h 0048   4]        Local GIC Hardware ID : 00000000
 [034h 0052   8]                 Base Address : 0000000008000000
 [03Ch 0060   4]               Interrupt Base : 00000000
-[040h 0064   1]                      Version : 02
+[040h 0064   1]                      Version : 03
 [041h 0065   3]                     Reserved : 000000
 
 [044h 0068   1]                Subtable Type : 0B [Generic Interrupt Controller]
 [045h 0069   1]                       Length : 4C
 [046h 0070   2]                     Reserved : 0000
 [048h 0072   4]         CPU Interface Number : 00000000
 [04Ch 0076   4]                Processor UID : 00000000
 [050h 0080   4]        Flags (decoded below) : 00000001
                            Processor Enabled : 1
           Performance Interrupt Trigger Mode : 0
           Virtual GIC Interrupt Trigger Mode : 0
 [054h 0084   4]     Parking Protocol Version : 00000000
 [058h 0088   4]        Performance Interrupt : 00000017
 [05Ch 0092   8]               Parked Address : 0000000000000000
-[064h 0100   8]                 Base Address : 0000000008010000
-[06Ch 0108   8]     Virtual GIC Base Address : 0000000008040000
-[074h 0116   8]  Hypervisor GIC Base Address : 0000000008030000
+[064h 0100   8]                 Base Address : 0000000000000000
+[06Ch 0108   8]     Virtual GIC Base Address : 0000000000000000
+[074h 0116   8]  Hypervisor GIC Base Address : 0000000000000000
 [07Ch 0124   4]        Virtual GIC Interrupt : 00000000
 [080h 0128   8]   Redistributor Base Address : 0000000000000000
 [088h 0136   8]                    ARM MPIDR : 0000000000000000
 /**** ACPI subtable terminates early - may be older version (dump table) */
 
-[090h 0144   1]                Subtable Type : 0D [Generic MSI Frame]
-[091h 0145   1]                       Length : 18
+[090h 0144   1]                Subtable Type : 0E [Generic Interrupt Redistributor]
+[091h 0145   1]                       Length : 10
 [092h 0146   2]                     Reserved : 0000
-[094h 0148   4]                 MSI Frame ID : 00000000
-[098h 0152   8]                 Base Address : 0000000008020000
-[0A0h 0160   4]        Flags (decoded below) : 00000001
-                                  Select SPI : 1
-[0A4h 0164   2]                    SPI Count : 0040
-[0A6h 0166   2]                     SPI Base : 0050
+[094h 0148   8]                 Base Address : 00000000080A0000
+[09Ch 0156   4]                       Length : 00F60000
 
-Raw Table Data: Length 168 (0xA8)
+[0A0h 0160   1]                Subtable Type : 0F [Generic Interrupt Translator]
+[0A1h 0161   1]                       Length : 14
+[0A2h 0162   2]                     Reserved : 0000
+[0A4h 0164   4]               Translation ID : 00000000
+[0A8h 0168   8]                 Base Address : 0000000008080000
+[0B0h 0176   4]                     Reserved : 00000000
 


