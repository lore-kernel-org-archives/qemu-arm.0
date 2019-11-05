Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp809759wri;
        Tue, 5 Nov 2019 06:43:43 -0800 (PST)
X-Google-Smtp-Source: APXvYqztO/G8pE/N6eyvZIoUQijpNL8PzYkz+GAeq1cTrKUaAQBzu3WDkJ7st9OdDZyYeJUZFgM0
X-Received: by 2002:a0c:f787:: with SMTP id s7mr7225001qvn.12.1572965022843;
        Tue, 05 Nov 2019 06:43:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1572965022; cv=none;
        d=google.com; s=arc-20160816;
        b=rm3bp4MrQUVH4q5sCRvOrU/2mdmmbQ8xbfOdtEUYcXsQ6/l6q1rb0JRJeSGo6GeUk7
         MhN4oc21u6P3YW5CAHcoQdzwwi0BP+XJPEKPFDi3gsBJ5a63V1R+F7EUbg/COs3g7Olz
         ePKIZ2qg6eQm2/z9+WIK12uBZv9wCrZDmIvCFPqHk+XDkbG55SR6a51BaKx0uHPZ7JOu
         qHovWUvP/y2I3c3L6vx3Z4rGmLEXCh7A7QhNaAT2cIUcXCA4XiD9ZlXsu55Vwr3QdwwG
         NMY5rx2DW4xQLhVpZuysOvmKg1Se53BlafFF1nq3jtRDyGXBJO9x9mVlm5C9yeawQb+Y
         j4oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=DyLw0ZjFbtB4U5K0OSrn0ARlZQCk6TqjMJ11xU0KmWc=;
        b=ohhrFu58KwN7l/y5o5SlpTpzNkf9GQJTPYla0nxBc9I/kopyvSDM3gAEVeN0aq9oOH
         Aca+GVgeZ/ZxDbBmgrYXvo4J49DaWrY3wMD95Jeg5JMGejiYKM0d3SSuvAEPwBFr+bYs
         lN8/WhEDKQvhVBXKYi6EwvDwBzaeHFb1wYQH3WZoE+RraGnLFGHBJx4kmzUEU35XN8g6
         RRxH0VG2mEIL1wBecP0O0h2VoXv68IO0UylvY42eucspgZwZPG1Z0ppYsIpv6C/BKmbQ
         FR0FloV9o25yy48ebzUIdvEaP+vauJiB+Yog+MoJFvtYqPNbL33zg2IzlPw8lGC5mfDo
         kndg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18si16542202qtf.189.2019.11.05.06.43.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2019 06:43:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iS03Z-0008P8-SB
	for alex.bennee@linaro.org; Tue, 05 Nov 2019 09:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54687)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iS03I-0008KQ-Bb
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 09:43:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iS03H-0002hM-2z
 for qemu-arm@nongnu.org; Tue, 05 Nov 2019 09:43:24 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:48787)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iS03B-0002dM-UL; Tue, 05 Nov 2019 09:43:18 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MUD7D-1iJZpb3pFD-00RF8p; Tue, 05 Nov 2019 15:42:57 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 1/4] hw/misc/grlib_ahb_apb_pnp: Avoid crash when writing to PnP
 registers
Date: Tue,  5 Nov 2019 15:42:44 +0100
Message-Id: <20191105144247.10301-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191105144247.10301-1-laurent@vivier.eu>
References: <20191105144247.10301-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Ml/MHDlWxXyppXpZMCGFBDj/O++YcL10kd1yqebCkUb1KJkFOVS
 lxZqglzv7krRW55VEUF8rKzJJeH8WGkLaDCt/e81/sxi5CkxuEtyq7sM5ofLr5H6/zIalIB
 iLnze1k1sKg2MMFCZZwcDgjjMvJ9BCMevYZop6WdlieYNOduUNE2tmhxm3TrqZFsuMHfiKq
 XXMUNfnZM3rRTyEbEjLWA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wAwd8f1ozMU=:3tGAlFcrRzVUy4stv1h2Kj
 DOfwVb62tvFhpMbcNeMQMmnYRRpXCrgHBKbpocMPQIIJfNhFSFXnqMpE2EytXFj11gHw36Iqs
 4ExOhLmy30jCgD1gvqhHkjsfLAgqFDKuG09mC9eZqdnD7uC6la3DdV4zxOxoXPGale+2VA9wW
 cfFphRt1Y2Nh9sII63JhOb1G/zJrKdbandh6cZYyQhtcDHF6FSJGKYvGnWpQBT5ElDzzfpVRD
 nxS4Y3Nz9QFLPT80E7iq1CjyLfrACRXGNYyl4k9ulT8ZIxYisvOPsi6PWGlqamPxvgAAoPEBR
 5Yi6RUK+zY4IFnoIpgKVktwk4Aa5EdP0Efdf1rbaGN9n7MnQCWVD88sRDqhZ7+lkV2dgZa08E
 SEKOB68JmKVcow9nkvCHUHkwvgeIqoh672T2fank2pNtbIJfa9K73EnsPQXPV15gqLpQC1fzw
 vzTZnQErBvGt7TVq8AFwXpAtdXXrjHh1I3mcBTNk0uk5AyUVPl7+qum29PwyA1CeOQkTRK2t2
 nvmnxG3LC7G1O1bmtATDf/e5KB3qzrYE0RGWBy76AkZ2KIRBmuOIYrtdiO0TSh6nkWGoU9y85
 Fsgt0Kv/ZGyJ3DInGx7rvKMdiQtHEB6rqOEutG0XOjcwdloG/X8tO/rg5u9LIPqBTVfDTOUEv
 1vaoiJnulMeMFsO2v7kUFJuPDfP09PBru2EumJdm29q73lGEvEJUebE0QFKTlM0UXL4wIwyoa
 t71rYj8mpNKbWswgITuI0blS56FVzyCqugZhzS5N+TPYhmHXVtyBREjdGarv89AsNyXqxOI1H
 TQQZlM2ZJejhydPM8QDb7WwvuRN28ANscaXT7gSUYbGrgAClqjAeFPpdxrtGS1p52PHhmEBlO
 nU38rCnhbWAcbf3/vYaPi3rtE1FX7wE27Bd64jaq4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.131
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
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Durrant <paul@xen.org>, qemu-trivial@nongnu.org,
 Claudio Fontana <claudio.fontana@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZfW0NDPUvAXc

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Guests can crash QEMU when writting to PnP registers:

  $ echo 'writeb 0x800ff042 69' | qemu-system-sparc -M leon3_generic -S -bios /etc/magic -qtest stdio
  [I 1571938309.932255] OPENED
  [R +0.063474] writeb 0x800ff042 69
  Segmentation fault (core dumped)

  (gdb) bt
  #0  0x0000000000000000 in  ()
  #1  0x0000555f4bcdf0bc in memory_region_write_with_attrs_accessor (mr=0x555f4d7be8c0, addr=66, value=0x7fff07d00f08, size=1, shift=0, mask=255, attrs=...) at memory.c:503
  #2  0x0000555f4bcdf185 in access_with_adjusted_size (addr=66, value=0x7fff07d00f08, size=1, access_size_min=1, access_size_max=4, access_fn=0x555f4bcdeff4 <memory_region_write_with_attrs_accessor>, mr=0x555f4d7be8c0, attrs=...) at memory.c:539
  #3  0x0000555f4bce2243 in memory_region_dispatch_write (mr=0x555f4d7be8c0, addr=66, data=69, op=MO_8, attrs=...) at memory.c:1489
  #4  0x0000555f4bc80b20 in flatview_write_continue (fv=0x555f4d92c400, addr=2148528194, attrs=..., buf=0x7fff07d01120 "E", len=1, addr1=66, l=1, mr=0x555f4d7be8c0) at exec.c:3161
  #5  0x0000555f4bc80c65 in flatview_write (fv=0x555f4d92c400, addr=2148528194, attrs=..., buf=0x7fff07d01120 "E", len=1) at exec.c:3201
  #6  0x0000555f4bc80fb0 in address_space_write (as=0x555f4d7aa460, addr=2148528194, attrs=..., buf=0x7fff07d01120 "E", len=1) at exec.c:3291
  #7  0x0000555f4bc8101d in address_space_rw (as=0x555f4d7aa460, addr=2148528194, attrs=..., buf=0x7fff07d01120 "E", len=1, is_write=true) at exec.c:3301
  #8  0x0000555f4bcdb388 in qtest_process_command (chr=0x555f4c2ed7e0 <qtest_chr>, words=0x555f4db0c5d0) at qtest.c:432

Instead of crashing, log the access as unimplemented.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: KONRAD Frederic <frederic.konrad@adacore.com>
Message-Id: <20191025110114.27091-2-philmd@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/misc/grlib_ahb_apb_pnp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/misc/grlib_ahb_apb_pnp.c b/hw/misc/grlib_ahb_apb_pnp.c
index 7338461694c9..f3c015d2c35f 100644
--- a/hw/misc/grlib_ahb_apb_pnp.c
+++ b/hw/misc/grlib_ahb_apb_pnp.c
@@ -22,6 +22,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/log.h"
 #include "hw/sysbus.h"
 #include "hw/misc/grlib_ahb_apb_pnp.h"
 
@@ -231,8 +232,15 @@ static uint64_t grlib_apb_pnp_read(void *opaque, hwaddr offset, unsigned size)
     return apb_pnp->regs[offset >> 2];
 }
 
+static void grlib_apb_pnp_write(void *opaque, hwaddr addr,
+                                uint64_t val, unsigned size)
+{
+    qemu_log_mask(LOG_UNIMP, "%s not implemented\n", __func__);
+}
+
 static const MemoryRegionOps grlib_apb_pnp_ops = {
     .read       = grlib_apb_pnp_read,
+    .write      = grlib_apb_pnp_write,
     .endianness = DEVICE_BIG_ENDIAN,
 };
 
-- 
2.21.0

