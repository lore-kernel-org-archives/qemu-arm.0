Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11519218wrv;
        Thu, 25 Jul 2019 23:47:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz7W9C9o2wUNT9I5nGTgYNrBQwdC7oBvfUIqvyT9vBBsxvlZuf6x7oMzGTkg9bWj3dXEp7W
X-Received: by 2002:a50:fa96:: with SMTP id w22mr81976895edr.45.1564123675561;
        Thu, 25 Jul 2019 23:47:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564123675; cv=none;
        d=google.com; s=arc-20160816;
        b=pIOaIxttRAES7+yeCPge01Vi86+P6Bvy3q0GIRDI0vAUCVShiL0YvBJF1U4w0cm1VQ
         cO3kUyJNvTLeli8exVASMUS2d8rdDbByOCrij2oXi2bexDwOrTUXF+4d9T2CREiU/Nuq
         pNRoFfWakYWSKIILN0DGMjbrHfuHddAyrPrvFoOFGSYMajKuDvEsPTBDk9CDF3YB9iW1
         ND2AjWuWjVO7U6hJxKna0ad7K+Q7pMnTZBgLK35Hy/BlqsiA1+yKJpWBTscj/gyNyOkV
         A2Sx1GNDBCRPsM/Y2Zfeinr+LshndgzAAOw+OwxEfPEhZ9tU+HnheswFTMnhpwOfmUyt
         kLfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:to:from;
        bh=x0cdLggzUMt6aD7mDqFN+xkk8+F8vxhdxGSnmeT9Zlo=;
        b=zfXbGUE7Wp6ULrz+jylDTqEvjTngtcyvyq3zzIfANP6sgXSF2IK1HCKawtXI4s3ur/
         GVtihu/n19GiU1RkxWgdBmbb5TFJracxeXfM2p3B7p6yc/SNivhDK+pB7dZ6uPPJzDH7
         cZBu1NhsRi9pCBvVXsP/nB+dRYjcLlBNaLW98p4/iSemxd2XdTRUbeteJfOdNvISiVC3
         VOfF8QkWwtwMewSSXvrVQaUubIKJyGeAZr+jcHA+9cq3ptGwhcKCSG5qLsn39fEEdqQv
         KcwIcUejmUbq3EdwaRd/fSZZS0BaYihuLd+QM0TJVQM1Ft66TO6YqVO2nVXx8uuumbhn
         xdSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e49si12657595ede.394.2019.07.25.23.47.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jul 2019 23:47:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=bt.com
Received: from localhost ([::1]:36710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hqu1B-000380-CO
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 02:47:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52019)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <tony.nguyen@bt.com>) id 1hqu0i-0001rt-7C
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 02:47:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <tony.nguyen@bt.com>) id 1hqu0f-00040D-Le
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 02:47:23 -0400
Received: from smtpe1.intersmtp.com ([62.239.224.235]:32449)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <tony.nguyen@bt.com>)
 id 1hqu0P-00032B-Oe; Fri, 26 Jul 2019 02:47:06 -0400
Received: from tpw09926dag18f.domain1.systemhost.net (10.9.212.26) by
 RDW083A011ED67.bt.com (10.187.98.37) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Fri, 26 Jul 2019 07:52:09 +0100
Received: from tpw09926dag18e.domain1.systemhost.net (10.9.212.18) by
 tpw09926dag18f.domain1.systemhost.net (10.9.212.26) with Microsoft SMTP
 Server (TLS) id 15.0.1395.4; Fri, 26 Jul 2019 07:46:58 +0100
Received: from tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c]) by tpw09926dag18e.domain1.systemhost.net
 ([fe80::a946:6348:ccf4:fa6c%12]) with mapi id 15.00.1395.000; Fri, 26 Jul
 2019 07:46:58 +0100
From: <tony.nguyen@bt.com>
To: <qemu-devel@nongnu.org>
Thread-Topic: [Qemu-devel] [PATCH v5 09/15] cputlb: Access MemoryRegion with
 MemOp
Thread-Index: AQHVQ33sEAGS5m5KhE2amU/8grrKQg==
Date: Fri, 26 Jul 2019 06:46:58 +0000
Message-ID: <1564123618147.19868@bt.com>
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
In-Reply-To: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
Accept-Language: en-AU, en-GB, en-US
Content-Language: en-AU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.187.101.42]
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 62.239.224.235
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: [Qemu-devel] [PATCH v5 09/15] cputlb: Access MemoryRegion with MemOp
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 mst@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 laurent@vivier.eu, Alistair.Francis@wdc.com, edgar.iglesias@gmail.com,
 arikalo@wavecomp.com, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, rth@twiddle.net, atar4qemu@gmail.com,
 ehabkost@redhat.com, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 stefanha@redhat.com, shorne@gmail.com, david@gibson.dropbear.id.au,
 qemu-riscv@nongnu.org, kbastian@mail.uni-paderborn.de, cohuck@redhat.com,
 alex.williamson@redhat.com, qemu-ppc@nongnu.org, amarkovic@wavecomp.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WiD3DTFv79u+

No-op MEMOP_SIZE and SIZE_MEMOP macros allows us to later easily
convert memory_region_dispatch_{read|write} paramter "unsigned size"
into a size+sign+endianness encoded "MemOp op".

Being a no-op macro, this patch does not introduce any logical change.

Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
---
 accel/tcg/cputlb.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 523be4c..5d88cec 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -881,7 +881,7 @@ static void tlb_fill(CPUState *cpu, target_ulong addr, =
int size,

 static uint64_t io_readx(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
                          int mmu_idx, target_ulong addr, uintptr_t retaddr=
,
-                         MMUAccessType access_type, int size)
+                         MMUAccessType access_type, MemOp op)
 {
     CPUState *cpu =3D env_cpu(env);
     hwaddr mr_offset;
@@ -906,14 +906,13 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBE=
ntry *iotlbentry,
         qemu_mutex_lock_iothread();
         locked =3D true;
     }
-    r =3D memory_region_dispatch_read(mr, mr_offset,
-                                    &val, size, iotlbentry->attrs);
+    r =3D memory_region_dispatch_read(mr, mr_offset, &val, op, iotlbentry-=
>attrs);
     if (r !=3D MEMTX_OK) {
         hwaddr physaddr =3D mr_offset +
             section->offset_within_address_space -
             section->offset_within_region;

-        cpu_transaction_failed(cpu, physaddr, addr, size, access_type,
+        cpu_transaction_failed(cpu, physaddr, addr, MEMOP_SIZE(op), access=
_type,
                                mmu_idx, iotlbentry->attrs, r, retaddr);
     }
     if (locked) {
@@ -925,7 +924,7 @@ static uint64_t io_readx(CPUArchState *env, CPUIOTLBEnt=
ry *iotlbentry,

 static void io_writex(CPUArchState *env, CPUIOTLBEntry *iotlbentry,
                       int mmu_idx, uint64_t val, target_ulong addr,
-                      uintptr_t retaddr, int size)
+                      uintptr_t retaddr, MemOp op)
 {
     CPUState *cpu =3D env_cpu(env);
     hwaddr mr_offset;
@@ -947,15 +946,15 @@ static void io_writex(CPUArchState *env, CPUIOTLBEntr=
y *iotlbentry,
         qemu_mutex_lock_iothread();
         locked =3D true;
     }
-    r =3D memory_region_dispatch_write(mr, mr_offset,
-                                     val, size, iotlbentry->attrs);
+    r =3D memory_region_dispatch_write(mr, mr_offset, val, op, iotlbentry-=
>attrs);
     if (r !=3D MEMTX_OK) {
         hwaddr physaddr =3D mr_offset +
             section->offset_within_address_space -
             section->offset_within_region;

-        cpu_transaction_failed(cpu, physaddr, addr, size, MMU_DATA_STORE,
-                               mmu_idx, iotlbentry->attrs, r, retaddr);
+        cpu_transaction_failed(cpu, physaddr, addr, MEMOP_SIZE(op),
+                               MMU_DATA_STORE, mmu_idx, iotlbentry->attrs,=
 r,
+                               retaddr);
     }
     if (locked) {
         qemu_mutex_unlock_iothread();
@@ -1306,7 +1305,7 @@ load_helper(CPUArchState *env, target_ulong addr, TCG=
MemOpIdx oi,
         }

         res =3D io_readx(env, &env_tlb(env)->d[mmu_idx].iotlb[index],
-                       mmu_idx, addr, retaddr, access_type, size);
+                       mmu_idx, addr, retaddr, access_type, SIZE_MEMOP(siz=
e));
         return handle_bswap(res, size, big_endian);
     }

@@ -1555,7 +1554,7 @@ store_helper(CPUArchState *env, target_ulong addr, ui=
nt64_t val,

         io_writex(env, &env_tlb(env)->d[mmu_idx].iotlb[index], mmu_idx,
                   handle_bswap(val, size, big_endian),
-                  addr, retaddr, size);
+                  addr, retaddr, SIZE_MEMOP(size));
         return;
     }

--
1.8.3.1


