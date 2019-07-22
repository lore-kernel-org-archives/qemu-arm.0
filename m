Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7042384wrv;
        Mon, 22 Jul 2019 08:47:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyPPRLMLGB6IqoY/sXVAIQlqBHpCrV3Bflh2B2MsBX4sWKjoflt3+VeLftCNbriDCNcdHkh
X-Received: by 2002:aa7:d1da:: with SMTP id g26mr61134206edp.198.1563810478175;
        Mon, 22 Jul 2019 08:47:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563810478; cv=none;
        d=google.com; s=arc-20160816;
        b=v36qwULzl8uNsPab2hAcWDUs+y3WjiB+/4GNpeE/jmSoPP+Ui/Of0pjWZYfFoIs6Zw
         rot2d/zvKqvSMjg+m60UdPTNKDxgML45w+QsT0oxGGH/+rTLYt6ckveXGezUZ2AOM+ED
         qBpHz9vO0aqubyoJKPG8z0NUK6w60h8MKHSiVKEsb7v4VPEgRwCYH7DbPex8YuXvEU71
         Vgw+7g4m0t/yX/BcmVZK+A6+DSkblEYnAoOpXzbK3eLlgDDY6ILmsxFoPwpd+nfAVtM9
         OPgQNGwSATiZuyQBQNSJzMZ9rr4UfDv78HluqtN1NBnK2n8GT+bGgJqSS3uGwIrWRkdk
         SFPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:from;
        bh=Gdnpw5ZdPWYjVdE2FDLseD0y+QcE4Ymw1tUi4gk1/8s=;
        b=uXfM5yBr1DQhFNmG5Vqrh4zdyH3Tl4gNodm88BhBA7EyE41l1Y8nETp0zWVhE+y4TE
         FC8pJEnYm7ZeFf/hL3zLER3JY8B5MBoKNnaNmdcuEg+4Hut5nc4vbZr0Ex8lkm4vtnFF
         y8ybYvjDUn14Uvqp5fcLHj6JM52UX0RRiMkKZObhBULQ+42Aqh1oq9x5mh+fHufVS4aa
         kwf2XEvATpzVliIdKIPRnPOLoHQKDpwRGh8UekE6j2p0DiGCETBKMSmWKjiqm6IBD9Gq
         1uYP7k+McroEGwIk8+LAbTdJB1XwdcwSkrzCJV6YB9/WQIr44UbhYv+ttDQarN09jntv
         S9rw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a41si5116072edc.273.2019.07.22.08.47.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2019 08:47:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:34902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hpaXd-0000to-5y
	for alex.bennee@linaro.org; Mon, 22 Jul 2019 11:47:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53309)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaX8-0000Lf-Kj
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:47:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hpaX7-00073J-FT
 for qemu-devel@nongnu.org; Mon, 22 Jul 2019 11:47:26 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.234]:17653)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hpaX2-00070T-NZ; Mon, 22 Jul 2019 11:47:20 -0400
Received: from tpw09926dag18g.domain1.systemhost.net (10.9.212.34) by
 RDW083A012ED68.bt.com (10.187.98.38) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Mon, 22 Jul 2019 16:47:04 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18g.domain1.systemhost.net (10.9.212.34) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Mon, 22 Jul 2019 16:46:36 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Mon, 22 Jul
 2019 16:46:36 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v2 09/20] hw/s390x: Access MemoryRegion with
 MemOp
Thread-Index: AQHVQKSk8LcfgfYgPkm73Z/ToL9YDA==
Date: Mon, 22 Jul 2019 15:46:36 +0000
Message-ID: <1563810395912.98369@bt.com>
References: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <e9c6e5310b1a4863be45d45bf087fc3d@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.37]
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.234
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: [Qemu-devel] [PATCH v2 09/20] hw/s390x: Access MemoryRegion with
 MemOp
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, mst@redhat.com,
 palmer@sifive.com, mark.cave-ayland@ilande.co.uk, Alistair.Francis@wdc.com,
 arikalo@wavecomp.com, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, rth@twiddle.net, atar4qemu@gmail.com,
 ehabkost@redhat.com, sw@weilnetz.de, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 cohuck@redhat.com, claudio.fontana@huawei.com, alex.williamson@redhat.com,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vTLroWpKrD+V

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 hw/s390x/s390-pci-inst.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 0023514..c126bcc 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -15,6 +15,7 @@
 #include "cpu.h"
 #include "s390-pci-inst.h"
 #include "s390-pci-bus.h"
+#include "exec/memop.h"
 #include "exec/memory-internal.h"
 #include "qemu/error-report.h"
 #include "sysemu/hw_accel.h"
@@ -372,7 +373,7 @@ static MemTxResult zpci_read_bar(S390PCIBusDevice *pbde=
v, uint8_t pcias,
     mr =3D pbdev->pdev->io_regions[pcias].memory;
     mr =3D s390_get_subregion(mr, offset, len);
     offset -=3D mr->addr;
-    return memory_region_dispatch_read(mr, offset, data, len,
+    return memory_region_dispatch_read(mr, offset, data, SIZE_MEMOP(len),
                                        MEMTXATTRS_UNSPECIFIED);
 }

@@ -471,7 +472,7 @@ static MemTxResult zpci_write_bar(S390PCIBusDevice *pbd=
ev, uint8_t pcias,
     mr =3D pbdev->pdev->io_regions[pcias].memory;
     mr =3D s390_get_subregion(mr, offset, len);
     offset -=3D mr->addr;
-    return memory_region_dispatch_write(mr, offset, data, len,
+    return memory_region_dispatch_write(mr, offset, data, SIZE_MEMOP(len),
                                         MEMTXATTRS_UNSPECIFIED);
 }

@@ -780,7 +781,8 @@ int pcistb_service_call(S390CPU *cpu, uint8_t r1, uint8=
_t r3, uint64_t gaddr,

     for (i =3D 0; i < len / 8; i++) {
         result =3D memory_region_dispatch_write(mr, offset + i * 8,
-                                              ldq_p(buffer + i * 8), 8,
+                                              ldq_p(buffer + i * 8),
+                                              SIZE_MEMOP(8),
                                               MEMTXATTRS_UNSPECIFIED);
         if (result !=3D MEMTX_OK) {
             s390_program_interrupt(env, PGM_OPERAND, 6, ra);
--
1.8.3.1


