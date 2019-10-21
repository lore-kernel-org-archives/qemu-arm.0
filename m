Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4984812wrm;
        Mon, 21 Oct 2019 12:11:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwK0dne3/KWouPniOQmKUEq+CMG9w4OBrQhPJQIS0SJPEIiTIIsclCS3C7uK0NZkMYf4s5A
X-Received: by 2002:ac8:6146:: with SMTP id d6mr26484589qtm.271.1571685092034;
        Mon, 21 Oct 2019 12:11:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571685092; cv=none;
        d=google.com; s=arc-20160816;
        b=ehtbrvibVaEYzb/WCfDupAKKAWoYAdTZBlVXJL6fNVdtNf4BYSCBia3VE5R0InMKUM
         LM0gx/7hocdEwOG8XWdwSn6GZ8xljRsL1CMDAXfCHGcwtmELMjJXsiGWT+ZNozS7URzG
         1RcVBUjy11L0zOP28KsQCvLYRh+yPO8gtJ6IDBtUxRGG3dvRai1Gvxyr9om9IkQyQ4BD
         X8PYRbfbsDZyUNwzczSkXBPXOIaErNZ90iEXMJ4RcSQrt0teMbLiR/una+A2uuckD8z9
         m9WbCudPzzGQrUBGoi6mqJ124SYKyBbrL9V9D/2a7oJFP18lanqWSpSijw+m0Nb7fysE
         2eHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=7mvEiwYhWi38A3Q4VwmKuPn4Vw0EqFfBIT1Jfwf4t0k=;
        b=fNeNJLK27jO/oB3yQB7ozlBHseRkSDEGMkjkyjG9NQYcpfRNpMPAJPHzPsi5UVf4Jg
         VHBj3woU3Hfdqk1CGqWzp3AXIuY74kXDoPMX+Rs+zg49Kq8gHAn22qg2Wud6JT3ehzJT
         08bVFa3iLVUVYrtCIcNXyjVW538uT5hxikB/AOvqQNq8IWOVv9P4jyjnbmwwvYROu+Al
         YAsTU3QoPWGT4SmGLBbnJ0If45YHfmfJ5nvciZ5TI0Lzu39mkvgbfipDm1epKS5FNJ1V
         RydBl9Qj/3D3vIG+YvvNIipI+eT4IVx3k/8uiGN0Qkb2cU3SvTwxljkgPd/BKL/rOyWh
         ycZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dc0CBeg4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18si14341967qve.50.2019.10.21.12.11.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 12:11:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Dc0CBeg4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMd5X-0007Wr-Ec
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 15:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57981)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iMd1V-0003u8-LF
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 15:07:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iMd1U-0001vK-9G
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 15:07:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:50792
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iMd1U-0001v3-6P
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 15:07:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571684839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7mvEiwYhWi38A3Q4VwmKuPn4Vw0EqFfBIT1Jfwf4t0k=;
 b=Dc0CBeg4oXNb++0400mDMlgALxb0YG5zijEM/UlrrjzI0zlvQSvK0k4XNwMPBjmdVqb6V6
 VDwJfIDpLnfMFt+bHgsHVNftYaSt2HrlLlaNzTzqE+9ftiobKlYkD4i7/AUELZUeyIYpfK
 5vqaY05Xsm78HDQxS+G1ct3a3xUPu6Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-KWD7N01UMjObdtlzTaXO2A-1; Mon, 21 Oct 2019 15:07:16 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2ABF1800D79;
 Mon, 21 Oct 2019 19:07:14 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-124.brq.redhat.com [10.40.204.124])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 55ACC196AE;
 Mon, 21 Oct 2019 19:07:11 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 3/6] hw/arm/collie: Create the RAM in the board
Date: Mon, 21 Oct 2019 21:06:50 +0200
Message-Id: <20191021190653.9511-4-philmd@redhat.com>
In-Reply-To: <20191021190653.9511-1-philmd@redhat.com>
References: <20191021190653.9511-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: KWD7N01UMjObdtlzTaXO2A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sMRQ+Lei29g5

The SDRAM is incorrectly created in the SA1110 SoC.
Move its creation in the board code, this will later allow the
board to have the QOM ownership of the RAM.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/arm/collie.c    | 8 ++++++--
 hw/arm/strongarm.c | 7 +------
 hw/arm/strongarm.h | 4 +---
 3 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/hw/arm/collie.c b/hw/arm/collie.c
index b1288ccea8..970a4405cc 100644
--- a/hw/arm/collie.c
+++ b/hw/arm/collie.c
@@ -27,9 +27,13 @@ static void collie_init(MachineState *machine)
 {
     StrongARMState *s;
     DriveInfo *dinfo;
-    MemoryRegion *sysmem =3D get_system_memory();
+    MemoryRegion *sdram =3D g_new(MemoryRegion, 1);
=20
-    s =3D sa1110_init(sysmem, collie_binfo.ram_size, machine->cpu_type);
+    s =3D sa1110_init(machine->cpu_type);
+
+    memory_region_allocate_system_memory(sdram, NULL, "strongarm.sdram",
+                                         collie_binfo.ram_size);
+    memory_region_add_subregion(get_system_memory(), SA_SDCS0, sdram);
=20
     dinfo =3D drive_get(IF_PFLASH, 0, 0);
     pflash_cfi01_register(SA_CS0, "collie.fl1", 0x02000000,
diff --git a/hw/arm/strongarm.c b/hw/arm/strongarm.c
index dc65d88a65..6bee034914 100644
--- a/hw/arm/strongarm.c
+++ b/hw/arm/strongarm.c
@@ -1586,8 +1586,7 @@ static const TypeInfo strongarm_ssp_info =3D {
 };
=20
 /* Main CPU functions */
-StrongARMState *sa1110_init(MemoryRegion *sysmem,
-                            unsigned int sdram_size, const char *cpu_type)
+StrongARMState *sa1110_init(const char *cpu_type)
 {
     StrongARMState *s;
     int i;
@@ -1601,10 +1600,6 @@ StrongARMState *sa1110_init(MemoryRegion *sysmem,
=20
     s->cpu =3D ARM_CPU(cpu_create(cpu_type));
=20
-    memory_region_allocate_system_memory(&s->sdram, NULL, "strongarm.sdram=
",
-                                         sdram_size);
-    memory_region_add_subregion(sysmem, SA_SDCS0, &s->sdram);
-
     s->pic =3D sysbus_create_varargs("strongarm_pic", 0x90050000,
                     qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ),
                     qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_FIQ),
diff --git a/hw/arm/strongarm.h b/hw/arm/strongarm.h
index e98840b461..192821f6aa 100644
--- a/hw/arm/strongarm.h
+++ b/hw/arm/strongarm.h
@@ -55,7 +55,6 @@ enum {
=20
 typedef struct {
     ARMCPU *cpu;
-    MemoryRegion sdram;
     DeviceState *pic;
     DeviceState *gpio;
     DeviceState *ppc;
@@ -63,7 +62,6 @@ typedef struct {
     SSIBus *ssp_bus;
 } StrongARMState;
=20
-StrongARMState *sa1110_init(MemoryRegion *sysmem,
-                            unsigned int sdram_size, const char *rev);
+StrongARMState *sa1110_init(const char *cpu_type);
=20
 #endif
--=20
2.21.0

