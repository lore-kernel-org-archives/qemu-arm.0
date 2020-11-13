Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1229250lfb;
        Fri, 13 Nov 2020 02:22:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxm52wFoM2RhpdWf26seuFL9sDjyLhQW14EWVyY/Db3LPopIQBT1jXlvZe+yNd9JqOeyINv
X-Received: by 2002:a25:e088:: with SMTP id x130mr2098778ybg.97.1605262942862;
        Fri, 13 Nov 2020 02:22:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605262942; cv=none;
        d=google.com; s=arc-20160816;
        b=MeSDLfxMUvr8sIGB0D0CyMsMwjpzoKYaYyigK7vfTV9GBMynZQL/AXMKJfQs5umHzf
         X67DaiGUZ6kJftjzbZp1T0CLOQBUR9TIMs1hgo6zZiDgiKmMur60sf6zKovinKmETOGV
         DOkr6eFqkSvMhDjUSmJ1a29kYVtC2GzIYb9qGXrYSvQ3TT236uznFUO356XJnbd7qMWT
         5pfK0fgg1718ZjCJBl0Y5W+3SRS7ZTKiKfuCedyXGwDM46NEYCIMDPbEF1kqAfaLxtlY
         diRfcASUlH+78w5mj2LXHsTZaDPH9WYHTibKjmu5Afi8/oqHw3wc1Y64envVV5I/Zn3e
         Kwow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=8Jx7IcnnTEnJFuufAyVt0KVFFgy7BoFaS2hndOR0zKI=;
        b=Q7hL3wZVjzHFHzL04w99CJj7c+K5S2wYUKh707QraJJ4Q3IuN+mJTId5Wdd3vXPeCK
         VTESuEMw++4oTp7Ld0oNTlPVx8oaeCWA5ifvishgf+QqfZE6qYO86JPSAoUm945mEvUd
         UI34cAn27ZnCjSapQ+jSf5RG8Yma+PF/Q4qbZY4klnAgyNX8y95D7hJaiYINRWgAZtuf
         IQzWsjAmr+w/uv09K7vSoPEaLcz0tit4icZwuNI68lZ/j1EPOKTOSxUSx2BNN80m3klb
         ht6bqxCevVsx35CyzGoN+7x17JGJUzhqI37AxTg/c3OUa9Se9hNueQXnZFLHLlrbYgei
         9dTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c6A6ML8P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 66si8748772ybu.339.2020.11.13.02.22.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Nov 2020 02:22:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c6A6ML8P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kdWDm-0005Rd-9e
	for alex.bennee@linaro.org; Fri, 13 Nov 2020 05:22:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:32780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdW8w-0007xp-T0
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 05:17:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kdW8v-0003uA-6b
 for qemu-arm@nongnu.org; Fri, 13 Nov 2020 05:17:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605262640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8Jx7IcnnTEnJFuufAyVt0KVFFgy7BoFaS2hndOR0zKI=;
 b=c6A6ML8PRIsyD0z7YyCgBk2urzEfyAemQx9xLrC+Z21H/uFPmDeaAZpgJ93GJJUtTfGeOo
 qYykDj3oFstxQobM3gW62ugR5zLwNkYiYceF8koTTcDyt8nODozJrwx6vVXGEIpKxsf3qN
 3ceF3AzeY9zdIy3f+X911DMvpMNJ4EI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-bqbf7y5bOpidCnWtxk4tXw-1; Fri, 13 Nov 2020 05:17:17 -0500
X-MC-Unique: bqbf7y5bOpidCnWtxk4tXw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCDA8108E1A5;
 Fri, 13 Nov 2020 10:17:15 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8D8015C1C2;
 Fri, 13 Nov 2020 10:17:15 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] digic: remove bios_name
Date: Fri, 13 Nov 2020 05:17:15 -0500
Message-Id: <20201113101715.1438460-1-pbonzini@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aTdEmRwGI8XF

Pull defaults to digic4_board_init so that a MachineState is available.

Cc: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/arm/digic_boards.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/hw/arm/digic_boards.c b/hw/arm/digic_boards.c
index d5524d3e72..fd228fa96f 100644
--- a/hw/arm/digic_boards.c
+++ b/hw/arm/digic_boards.c
@@ -70,19 +70,20 @@ static void digic4_board_init(MachineState *machine, DigicBoard *board)
     memory_region_add_subregion(get_system_memory(), 0, machine->ram);
 
     if (board->add_rom0) {
-        board->add_rom0(s, DIGIC4_ROM0_BASE, board->rom0_def_filename);
+        board->add_rom0(s, DIGIC4_ROM0_BASE,
+                        machine->firmware ?: board->rom0_def_filename);
     }
 
     if (board->add_rom1) {
-        board->add_rom1(s, DIGIC4_ROM1_BASE, board->rom1_def_filename);
+        board->add_rom1(s, DIGIC4_ROM1_BASE,
+                        machine->firmware ?: board->rom1_def_filename);
     }
 }
 
 static void digic_load_rom(DigicState *s, hwaddr addr,
-                           hwaddr max_size, const char *def_filename)
+                           hwaddr max_size, const char *filename)
 {
     target_long rom_size;
-    const char *filename;
 
     if (qtest_enabled()) {
         /* qtest runs no code so don't attempt a ROM load which
@@ -91,12 +92,6 @@ static void digic_load_rom(DigicState *s, hwaddr addr,
         return;
     }
 
-    if (bios_name) {
-        filename = bios_name;
-    } else {
-        filename = def_filename;
-    }
-
     if (filename) {
         char *fn = qemu_find_file(QEMU_FILE_TYPE_BIOS, filename);
 
@@ -119,7 +114,7 @@ static void digic_load_rom(DigicState *s, hwaddr addr,
  * 64M Bit (4Mx16) Page Mode / Multi-Bank NOR Flash Memory
  */
 static void digic4_add_k8p3215uqb_rom(DigicState *s, hwaddr addr,
-                                      const char *def_filename)
+                                      const char *filename)
 {
 #define FLASH_K8P3215UQB_SIZE (4 * 1024 * 1024)
 #define FLASH_K8P3215UQB_SECTOR_SIZE (64 * 1024)
@@ -131,7 +126,7 @@ static void digic4_add_k8p3215uqb_rom(DigicState *s, hwaddr addr,
                           0x00EC, 0x007E, 0x0003, 0x0001,
                           0x0555, 0x2aa, 0);
 
-    digic_load_rom(s, addr, FLASH_K8P3215UQB_SIZE, def_filename);
+    digic_load_rom(s, addr, FLASH_K8P3215UQB_SIZE, filename);
 }
 
 static DigicBoard digic4_board_canon_a1100 = {
-- 
2.26.2

