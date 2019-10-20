Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3789028wrm;
        Sun, 20 Oct 2019 16:01:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxfLUqXHV9suZN8lbIXy7Jknd0v+iqFXtcaTpwADbWfeffwRN/UBduA1Q8WiODxHicqVy7N
X-Received: by 2002:a0c:ef4d:: with SMTP id t13mr20430137qvs.24.1571612515406;
        Sun, 20 Oct 2019 16:01:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571612515; cv=none;
        d=google.com; s=arc-20160816;
        b=Zdpjg+JVKRfqRqo+i822FBes+1xp4awnYdQ8VmXC7CD1Cgfl97cp6ldvYBrAPP18/k
         xvysCNQXJDqt4ZRFhMnjvZNIfwK/EY5RzPVN4FWHx+5c5PmEATvF7rU4JEGyY9YoNhC0
         wyXVNayYrtsprzi8ecFW8K8Agtq8cdATia8pipFxTuxD31Y1878+HQbDfF/jstWU9S4d
         cHOLH8xhHf6dNi1InTneZ5Et5ao6Zdshj/hUqAO2cswg4yz6QH6rE70Cve47Kp6uZwG5
         uLro+fCZmR6wrlntmHmWeJsQ3ZlGMPvCPs8uHCRtUbVC2uGMD7cgTOaExOIxl+jgVv5l
         FdtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LBfcXdZi7rmaayMUIJe621EviYh+sNbuG1duBKXRdNY=;
        b=n4QI7l67Ko0ii2JzrjuR93Pq0Gfr28h8zHlLMx4nuyZrZ8az1as93z+5USKTdAaI9X
         rW1bVObotnkpxNS+eQFuSAWRV1JLyi3rYLJveToFvVOlxyCc8rSKmblx26UOfBfTFpie
         65tAr7bxHb5aleW5cw4JBnmocAjSNzlgqneLzv8AIjVvF1ZGHpca+LrVT0IUBEFrMdiI
         d03sBNYsL8q25IIgXfILbiS5qFc/f/kelxiLvsjD4t4Fks1BXFDnVm8l6Ykm0PJC3xJJ
         j5OuAHxjaUK7EWpObxV+zflwbMFX06SvcxMnjXi6D8k9ZWBkuwvLhH7zNyAnZi8985QH
         OSKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SCZJC8OZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4si12722324qkd.85.2019.10.20.16.01.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2019 16:01:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=SCZJC8OZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMKCw-0001oe-Ks
	for alex.bennee@linaro.org; Sun, 20 Oct 2019 19:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34858)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMKBT-0001if-3H
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:00:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMKBR-0001XL-4U
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:00:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:58333
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMKBQ-0001Ww-V8
 for qemu-arm@nongnu.org; Sun, 20 Oct 2019 19:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571612420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LBfcXdZi7rmaayMUIJe621EviYh+sNbuG1duBKXRdNY=;
 b=SCZJC8OZ3ADs7OYyklSAdLQboARsYvBuWE2Lpmv/JX4xhiWwaDMLXcQnqz1zfqVzKoxkKm
 Mcth87pAzT/Wy9xZJndLuSNMEqTCsyEnzo31z1SAVbhZrM2COmA1EvCUBv6Ql9CZQS9u2p
 ve2LBvHrokzyM0fbMlEHxRgjOqoHpGY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-8yE4KQl8NF6B_y0XkBCCtQ-1; Sun, 20 Oct 2019 19:00:16 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 999DB800D41;
 Sun, 20 Oct 2019 23:00:12 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-40.brq.redhat.com [10.40.204.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BFD860C18;
 Sun, 20 Oct 2019 22:59:49 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 09/21] hw: Let memory_region_allocate_system_memory take
 MachineState argument
Date: Mon, 21 Oct 2019 00:56:38 +0200
Message-Id: <20191020225650.3671-10-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-1-philmd@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 8yE4KQl8NF6B_y0XkBCCtQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>, Rob Herring <robh@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Antony Pavlov <antonynpavlov@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Fabien Chouteau <chouteau@adacore.com>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Thomas Huth <huth@tuxfamily.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, Andrew Jeffery <andrew@aj.id.au>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>, Jan Kiszka <jan.kiszka@web.de>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WYhGddO9w28D

All the codebase calls memory_region_allocate_system_memory() with
a NULL 'owner' from the board_init() function.
Let pass a MachineState argument, and enforce the QOM ownership of
the system memory.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/core/numa.c      | 11 +++++++----
 include/hw/boards.h |  6 ++++--
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 038c96d4ab..2e29e4bfe0 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -520,21 +520,24 @@ static void allocate_system_memory_nonnuma(MemoryRegi=
on *mr, Object *owner,
     vmstate_register_ram_global(mr);
 }
=20
-void memory_region_allocate_system_memory(MemoryRegion *mr, Object *owner,
+void memory_region_allocate_system_memory(MemoryRegion *mr, MachineState *=
ms,
                                           const char *name,
                                           uint64_t ram_size)
 {
     uint64_t addr =3D 0;
     int i;
-    MachineState *ms =3D MACHINE(qdev_get_machine());
+
+    if (!ms) {
+        ms =3D MACHINE(qdev_get_machine());
+    }
=20
     if (ms->numa_state =3D=3D NULL ||
         ms->numa_state->num_nodes =3D=3D 0 || !have_memdevs) {
-        allocate_system_memory_nonnuma(mr, owner, name, ram_size);
+        allocate_system_memory_nonnuma(mr, OBJECT(ms), name, ram_size);
         return;
     }
=20
-    memory_region_init(mr, owner, name, ram_size);
+    memory_region_init(mr, OBJECT(ms), name, ram_size);
     for (i =3D 0; i < ms->numa_state->num_nodes; i++) {
         uint64_t size =3D ms->numa_state->nodes[i].node_mem;
         HostMemoryBackend *backend =3D ms->numa_state->nodes[i].node_memde=
v;
diff --git a/include/hw/boards.h b/include/hw/boards.h
index de45087f34..3b6cb82b6c 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -14,7 +14,7 @@
 /**
  * memory_region_allocate_system_memory - Allocate a board's main memory
  * @mr: the #MemoryRegion to be initialized
- * @owner: the object that tracks the region's reference count
+ * @ms: the #MachineState object that own the system memory
  * @name: name of the memory region
  * @ram_size: size of the region in bytes
  *
@@ -38,8 +38,10 @@
  * Smaller pieces of memory (display RAM, static RAMs, etc) don't need
  * to be backed via the -mem-path memory backend and can simply
  * be created via memory_region_init_ram().
+ *
+ * The #MachineState object will track the region's reference count.
  */
-void memory_region_allocate_system_memory(MemoryRegion *mr, Object *owner,
+void memory_region_allocate_system_memory(MemoryRegion *mr, MachineState *=
ms,
                                           const char *name,
                                           uint64_t ram_size);
=20
--=20
2.21.0

