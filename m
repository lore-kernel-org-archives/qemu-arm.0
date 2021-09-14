Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp780770lfp;
        Tue, 14 Sep 2021 08:16:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPFijDVyQRiE5C8Y08wFsiN9qhrhagvGQRrEmyiDrXVLBk33fZzISxK/7vEl+ueZPS7NWH
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr2851143wml.30.1631632609142;
        Tue, 14 Sep 2021 08:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631632609; cv=none;
        d=google.com; s=arc-20160816;
        b=o4wRbL0KnJvVBGgo1bn99BT80fY83Jz2YlB1pOhooyLK7SlxThFbm4RMhV7vgQyp+o
         9LkW6TZo69A6K91NquZQLtEsmnFbMOAmx7Xh9WOyoYjIw6ALM/zuD91ObjbICBeosVoK
         TmbINZwhiDTLdxt8T9P2T6025eXSuY6BnUMQglQDLAG6aYG2us6HZIKRNXEy6W/cEXf7
         P5hdQrofwk3/oR3MFTUCkBXjNdVLazhxeBk7K3HphXBLIiZDgnn8FLdeU5HOcxpz2eSf
         he0XWRmKq8ySGCmicptOD7H3kHe92rGRcI6OKZxWfX7wpcw+frlETUbJWV1jWBcuGD8W
         0D5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=eytxsOj3cJWedkTLYFQf30aw8CYCDUwdC6UE6kvmYNI=;
        b=i/vvXhUHtcSVlrPqbt4700IcT0X7sGcr/AGwVezdKwrRyonT/rc7uMby7xbtRUZf5l
         pyfLBlh0vytjTdCN+cONqXoLBDmpKTpq6hEg0ZQ2D4GDJItRxFEeEjU2KDfGj/QvEBqO
         xMoUScZTQSB71k6yVg6zYlvemV3uaZ9CWKeiMzhNNw0M0Fe0Jge0NLUX5EftVCeXxb38
         jqs/clxDWHcp1h5z4EvW17YrR6KUfkkYXrso8fB3/W5+p+9/QPkkBv3GrULH7S8t+xV7
         nYGZhcQ4IHJxdjAJg2xqShrBF4/j07uSmzJJZNY7EODVXmg6MeSdoR//dJR4mqY2vxdZ
         DuZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ChSn5wP8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si1410404wmi.197.2021.09.14.08.16.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 08:16:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ChSn5wP8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQAAy-0001kX-3I
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 11:16:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9Wa-0004iW-0s
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:35:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59101)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mQ9WX-0004X3-A2
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:35:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631630100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eytxsOj3cJWedkTLYFQf30aw8CYCDUwdC6UE6kvmYNI=;
 b=ChSn5wP8HsD8H9gIqJ4vtLTyZoeKoDxbFrrDiRZo+1tmtihCdrnv9AMcQahkjiTa0eqXzG
 utMUeEEgj0D43l/BT9NHTc8vRLagPv18/Vl7gci77v2msZLeXuoRp6ky5eN7vMYjQA0rBF
 1fRGnkF1GSugD0HbqTEr+h7QnPtSxCU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-WrwCVSFUMpKehRjjLzk-bQ-1; Tue, 14 Sep 2021 10:34:57 -0400
X-MC-Unique: WrwCVSFUMpKehRjjLzk-bQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 862DE8145EF;
 Tue, 14 Sep 2021 14:34:53 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 327825D9CA;
 Tue, 14 Sep 2021 14:34:33 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 47/53] target/sh4: convert to use format_tlb callback
Date: Tue, 14 Sep 2021 15:20:36 +0100
Message-Id: <20210914142042.1655100-48-berrange@redhat.com>
In-Reply-To: <20210914142042.1655100-1-berrange@redhat.com>
References: <20210914142042.1655100-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PGFkrfe3PTA5

Change the "info tlb" implementation to use the format_tlb callback.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 target/sh4/cpu.c     |  3 +++
 target/sh4/cpu.h     |  1 +
 target/sh4/monitor.c | 48 +++++++++++++++++++++++++++-----------------
 3 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index 0ac881d6af..0e49755b2a 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -260,6 +260,9 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = superh_cpu_class_by_name;
     cc->has_work = superh_cpu_has_work;
     cc->format_state = superh_cpu_format_state;
+#ifndef CONFIG_USER_ONLY
+    cc->format_tlb = superh_cpu_format_tlb;
+#endif
     cc->set_pc = superh_cpu_set_pc;
     cc->gdb_read_register = superh_cpu_gdb_read_register;
     cc->gdb_write_register = superh_cpu_gdb_write_register;
diff --git a/target/sh4/cpu.h b/target/sh4/cpu.h
index 6940ca417a..7c139f561c 100644
--- a/target/sh4/cpu.h
+++ b/target/sh4/cpu.h
@@ -207,6 +207,7 @@ struct SuperHCPU {
 void superh_cpu_do_interrupt(CPUState *cpu);
 bool superh_cpu_exec_interrupt(CPUState *cpu, int int_req);
 void superh_cpu_format_state(CPUState *cpu, GString *buf, int flags);
+void superh_cpu_format_tlb(CPUState *cpu, GString *buf);
 hwaddr superh_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
 int superh_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int superh_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
diff --git a/target/sh4/monitor.c b/target/sh4/monitor.c
index 2da6a5426e..5ccb95af93 100644
--- a/target/sh4/monitor.c
+++ b/target/sh4/monitor.c
@@ -27,32 +27,44 @@
 #include "monitor/hmp-target.h"
 #include "monitor/hmp.h"
 
-static void print_tlb(Monitor *mon, int idx, tlb_t *tlb)
+static void print_tlb(GString *buf, int idx, tlb_t *tlb)
 {
-    monitor_printf(mon, " tlb%i:\t"
-                   "asid=%hhu vpn=%x\tppn=%x\tsz=%hhu size=%u\t"
-                   "v=%hhu shared=%hhu cached=%hhu prot=%hhu "
-                   "dirty=%hhu writethrough=%hhu\n",
-                   idx,
-                   tlb->asid, tlb->vpn, tlb->ppn, tlb->sz, tlb->size,
-                   tlb->v, tlb->sh, tlb->c, tlb->pr,
-                   tlb->d, tlb->wt);
+    g_string_append_printf(buf,  " tlb%i:\t"
+                           "asid=%hhu vpn=%x\tppn=%x\tsz=%hhu size=%u\t"
+                           "v=%hhu shared=%hhu cached=%hhu prot=%hhu "
+                           "dirty=%hhu writethrough=%hhu\n",
+                           idx,
+                           tlb->asid, tlb->vpn, tlb->ppn, tlb->sz, tlb->size,
+                           tlb->v, tlb->sh, tlb->c, tlb->pr,
+                           tlb->d, tlb->wt);
+}
+
+void superh_cpu_format_tlb(CPUState *cpu, GString *buf)
+{
+    CPUArchState *env = cpu->env_ptr;
+    size_t i;
+
+    g_string_append_printf(buf,  "ITLB:\n");
+    for (i = 0 ; i < ITLB_SIZE ; i++) {
+        print_tlb(buf, i, &env->itlb[i]);
+    }
+    g_string_append_printf(buf,  "UTLB:\n");
+    for (i = 0 ; i < UTLB_SIZE ; i++) {
+        print_tlb(buf, i, &env->utlb[i]);
+    }
 }
 
 void hmp_info_tlb(Monitor *mon, const QDict *qdict)
 {
-    CPUArchState *env = mon_get_cpu_env(mon);
-    int i;
+    g_autoptr(GString) buf = g_string_new("");
+    CPUState *cpu = mon_get_cpu(mon);
 
-    if (!env) {
+    if (!cpu) {
         monitor_printf(mon, "No CPU available\n");
         return;
     }
 
-    monitor_printf (mon, "ITLB:\n");
-    for (i = 0 ; i < ITLB_SIZE ; i++)
-        print_tlb (mon, i, &env->itlb[i]);
-    monitor_printf (mon, "UTLB:\n");
-    for (i = 0 ; i < UTLB_SIZE ; i++)
-        print_tlb (mon, i, &env->utlb[i]);
+    cpu_format_tlb(cpu, buf);
+
+    monitor_printf(mon, "%s", buf->str);
 }
-- 
2.31.1

