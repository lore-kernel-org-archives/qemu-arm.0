Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4975517lfb;
        Tue, 31 Aug 2021 05:18:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQQSsBSO7NadLhflHDnlFrpO9pkMCXNhsdyhQYMgzUISBvjIGtG4LfEqZAS+FJm/1iYN4y
X-Received: by 2002:a17:906:f111:: with SMTP id gv17mr30809018ejb.315.1630412335105;
        Tue, 31 Aug 2021 05:18:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412335; cv=none;
        d=google.com; s=arc-20160816;
        b=FPRn6oW1ws2/83kQNyxe53wUvABSJop/W+PTuaGegEZgcbciJ02jNbAYKicKs0u1Nn
         KAcC6dAuR9aor+61qmIixjsbjIp7quLF4IhLyhSP+U4crJ8ANIBZUWSP4OH95CubYMSM
         /Hab0A/NfVZHn8acyRUwzWJYR920lh2vsOFKvZ5XJEf4GowTb1MrIDJuPo9HUvoKYLat
         e2Z4TgIIUAlyTos/MPrMBtdfZfq3YUc43AiAzuL9UKHxah0xgC6MJNRPC6+KBHXsQf55
         hezfM2rKooSLykDYInLLguqI56Cz/FHSz3Qdwawrvr2TI0/TqXt3+5H/Yqszes05EQA8
         NckQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=l7/kp6ZcRFvxoK6BJgtBhQaabSWzcO2N+/IvjX3LuSo=;
        b=V6aClIoqWWM8nRb1jIivmQTI83a6+u94Y4MVy9BYySnEdMHfy2clsRBNvuGAFkkmCx
         PrWc0/hl+h+GAt626vjKLmGHa3QtXNjN0F3O15dn27Hgk19hrBynu1dxAEidCWOju+Zt
         L+8mFtouN8IoJUnMMT0NQS1nnJmH5moLmNn3v27OKcc9MBJGCra+J7m6qonbSxbV7RI/
         hGghjXRDbBdZ6AT1V/WmdlHX4GixBelQCPP3ywsBYSYsawHUabsUdoglkt96Vh/wbNHs
         GgbfPhAitG/cB6fGcgofy4Ude6t4zvXOCrk1C3ff64AWf0j3yg5SVp/PEDMZrlWTj8R+
         mGZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hTXf3cKG;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id dm18si3108557ejc.257.2021.08.31.05.18.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:18:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hTXf3cKG;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l7/kp6ZcRFvxoK6BJgtBhQaabSWzcO2N+/IvjX3LuSo=;
	b=hTXf3cKGbJHUsY0gJfIixYMO1yK/AsKfhw9PfDjMgJZCpU/6OaCEyfh2DQXcYnzIl236Oq
	4BA8KIAqhJPO7ySAFoXYPlmg//tlTH7RYRAs8xbshGiVCyLG2QbqgiUT0/JLUO0qbrTuub
	iHyWSGE12DwIs8Ionuqw72wQUDi6OoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-wzZQLAZwOJq8XmMfOrETSg-1; Tue, 31 Aug 2021 08:18:52 -0400
X-MC-Unique: wzZQLAZwOJq8XmMfOrETSg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72819875118;
	Tue, 31 Aug 2021 12:18:49 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D522060BD8;
	Tue, 31 Aug 2021 12:18:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id DF22F18009E9; Tue, 31 Aug 2021 14:15:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Laurent Vivier <laurent@vivier.eu>,
	Peter Xu <peterx@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Cornelia Huck <cohuck@redhat.com>,
	qemu-ppc@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	qemu-riscv@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	Stafford Horne <shorne@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Halil Pasic <pasic@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bin.meng@windriver.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Greg Kurz <groug@kaod.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	qemu-s390x@nongnu.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	David Hildenbrand <david@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 23/29] tcg_i386_funcs: Add update_mxcsr_status to TCGI386ModuleOps
Date: Tue, 31 Aug 2021 14:15:39 +0200
Message-Id: <20210831121545.2874233-24-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: gu+8qlHlwPHk

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/tcg/tcg-module-i386.h | 1 +
 target/i386/cpu.h             | 3 +--
 accel/tcg/tcg-module-i386.c   | 1 +
 target/i386/machine.c         | 2 +-
 target/i386/tcg/fpu_helper.c  | 3 ++-
 5 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/include/tcg/tcg-module-i386.h b/include/tcg/tcg-module-i386.h
index 3854b506d5dc..5d8f6434e32d 100644
--- a/include/tcg/tcg-module-i386.h
+++ b/include/tcg/tcg-module-i386.h
@@ -3,6 +3,7 @@
 
 struct TCGI386ModuleOps {
     void (*update_fp_status)(CPUX86State *env);
+    void (*update_mxcsr_status)(CPUX86State *env);
 };
 extern struct TCGI386ModuleOps tcg_i386;
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 5769c1292683..bdfdbdb0d8a8 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2128,14 +2128,13 @@ static inline bool cpu_vmx_maybe_enabled(CPUX86State *env)
 int get_pg_mode(CPUX86State *env);
 
 /* fpu_helper.c */
-void update_mxcsr_status(CPUX86State *env);
 void update_mxcsr_from_sse_status(CPUX86State *env);
 
 static inline void cpu_set_mxcsr(CPUX86State *env, uint32_t mxcsr)
 {
     env->mxcsr = mxcsr;
     if (tcg_enabled()) {
-        update_mxcsr_status(env);
+        tcg_i386.update_mxcsr_status(env);
     }
 }
 
diff --git a/accel/tcg/tcg-module-i386.c b/accel/tcg/tcg-module-i386.c
index 41ce2ba4eb76..fa455a2e02cb 100644
--- a/accel/tcg/tcg-module-i386.c
+++ b/accel/tcg/tcg-module-i386.c
@@ -7,4 +7,5 @@ static void i386_update_cpu_stub(CPUX86State *cpu)
 
 struct TCGI386ModuleOps tcg_i386 = {
     .update_fp_status = i386_update_cpu_stub,
+    .update_mxcsr_status = i386_update_cpu_stub,
 };
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 7f5d80766f28..dc63de37dd6f 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -372,7 +372,7 @@ static int cpu_post_load(void *opaque, int version_id)
     if (tcg_enabled()) {
         target_ulong dr7;
         tcg_i386.update_fp_status(env);
-        update_mxcsr_status(env);
+        tcg_i386.update_mxcsr_status(env);
 
         cpu_breakpoint_remove_all(cs, BP_CPU);
         cpu_watchpoint_remove_all(cs, BP_CPU);
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 0f7206e834fd..12dd6c9a65df 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -2947,7 +2947,7 @@ void helper_xsetbv(CPUX86State *env, uint32_t ecx, uint64_t mask)
 #define SSE_RC_CHOP         0x6000
 #define SSE_FZ              0x8000
 
-void update_mxcsr_status(CPUX86State *env)
+static void update_mxcsr_status(CPUX86State *env)
 {
     uint32_t mxcsr = env->mxcsr;
     int rnd_type;
@@ -3043,6 +3043,7 @@ void helper_movq(CPUX86State *env, void *d, void *s)
 static void tcgi386_module_ops_fpu(void)
 {
     tcg_i386.update_fp_status = update_fp_status;
+    tcg_i386.update_mxcsr_status = update_mxcsr_status;
 }
 
 type_init(tcgi386_module_ops_fpu);
-- 
2.31.1
