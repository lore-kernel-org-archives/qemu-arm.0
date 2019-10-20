Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3803864wrm;
        Sun, 20 Oct 2019 16:22:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxgFOoFVHlNSasvO4r+yKNT/2F7d+877/v9PAKlMKfidGAqFGh0cTW6VjHKDHYzgqx2dkRl
X-Received: by 2002:a17:906:3b4e:: with SMTP id h14mr233208ejf.111.1571613747015;
        Sun, 20 Oct 2019 16:22:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571613747; cv=none;
        d=google.com; s=arc-20160816;
        b=xdxM11J7RLWfoaKA1pOFj8qd9NM9Rz2dLZ5EukOd9Qu1gRF+Lf1ogPCVt1m/tsITFM
         IEgsM+wWKKVLJu8dR73Thrz7eNxetOo/JKA7SgG38WTPjw2OERuzanDp0u8IEB5zUBFg
         qqLuT07mefmPgcvvwxTDZuFHo8+JfjGItFqm9ueEwg0id+XuqtxnNlOqtW9GeBdRnX1T
         qVnAJcRudmD17f3MaA1g3M0/uWfuHSNjeORWecleojG7L/+NvGklejde7SqJG/CM2iom
         g33ozlbQjJGDTBkzs07YN3V9jcs7VmnVSjeiEqD1oWmRem4Z7RC5v00xdPTO2Qb0+ta5
         S9iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Jjri3ozqyIA7pC6fyQCHJXD213k68SJrwDbSmMBjY3Q=;
        b=oBc6W3bNZ6EzAOJGzFU3HtQ5WinY/NVD6ORxAnc15vZt7E43clya7hhdvKichZWtLS
         ezHbBODf6PLOLlU+xnLYDEMHSqkY9w8oGb3cgfZzYLCD0UEq0jUqh0tQ7K4C+Ce3g0Ra
         5AoXLodTqye2ujPDIHb9fOIwFGI7JVMEuRETTXT/oxFw0uphnQm0PLezpImMKV94727Q
         7ld6GPhhpNUDlyPct6QVIfY9oUzSYBmbxP0bN2gcGQU2RCzLpMfGs5Zly90rE8EFtRNG
         Hjb6mhqLnD1IIrIz/rHLZgqfWfCZ0iU5OsLdgv0CFxL0aezesgY39GzJ1yX5LxToSl0D
         llIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OUqYV38C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18si7531738eje.297.2019.10.20.16.22.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Oct 2019 16:22:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=OUqYV38C;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMKWo-0005hn-2H
	for alex.bennee@linaro.org; Sun, 20 Oct 2019 19:22:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35740)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMKF8-0004ea-L2
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 19:04:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMKF7-0002wY-EE
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 19:04:10 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:45078
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMKF7-0002wC-AU
 for qemu-devel@nongnu.org; Sun, 20 Oct 2019 19:04:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571612648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Jjri3ozqyIA7pC6fyQCHJXD213k68SJrwDbSmMBjY3Q=;
 b=OUqYV38C65PlrrxWwI6Gi7hS4UNqiuqWpjec2waZQ6cd2ip+FT486lztgXnVmg8mPIdZjr
 cc9zBI9gQUt8AByCGxWAc75b5tklKomAtP9VGEWAEHCNXAahsymDAF9yzpxB0ExaiuJoO4
 K8HjIH4nCYrFKQGvlIswtpI3ZEP8QWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-0Z60vgfLOp2K7RkyzB4Ntw-1; Sun, 20 Oct 2019 19:04:01 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1D0D1005509;
 Sun, 20 Oct 2019 23:03:57 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-40.brq.redhat.com [10.40.204.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6808060C18;
 Sun, 20 Oct 2019 23:03:39 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PATCH 21/21] hw/core: Assert memory_region_allocate_system_memory
 has machine owner
Date: Mon, 21 Oct 2019 00:56:50 +0200
Message-Id: <20191020225650.3671-22-philmd@redhat.com>
In-Reply-To: <20191020225650.3671-1-philmd@redhat.com>
References: <20191020225650.3671-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: 0Z60vgfLOp2K7RkyzB4Ntw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Leif Lindholm <leif.lindholm@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Rob Herring <robh@kernel.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Helge Deller <deller@gmx.de>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yTvdsrB2vGJF

All the memory_region_allocate_system_memory() pass a MachineState
argument. Add an assertion to ensure the new boards/machines added
set this argument, so all system memory object have the machine as
its QOM owner.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/core/numa.c      | 4 +---
 include/hw/boards.h | 2 +-
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/core/numa.c b/hw/core/numa.c
index 2e29e4bfe0..3e07e94d00 100644
--- a/hw/core/numa.c
+++ b/hw/core/numa.c
@@ -527,9 +527,7 @@ void memory_region_allocate_system_memory(MemoryRegion =
*mr, MachineState *ms,
     uint64_t addr =3D 0;
     int i;
=20
-    if (!ms) {
-        ms =3D MACHINE(qdev_get_machine());
-    }
+    g_assert(ms);
=20
     if (ms->numa_state =3D=3D NULL ||
         ms->numa_state->num_nodes =3D=3D 0 || !have_memdevs) {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 3b6cb82b6c..31ab6e7586 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -14,7 +14,7 @@
 /**
  * memory_region_allocate_system_memory - Allocate a board's main memory
  * @mr: the #MemoryRegion to be initialized
- * @ms: the #MachineState object that own the system memory
+ * @ms: the #MachineState object that own the system memory (must not be N=
ULL)
  * @name: name of the memory region
  * @ram_size: size of the region in bytes
  *
--=20
2.21.0

