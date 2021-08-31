Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4975842lfb;
        Tue, 31 Aug 2021 05:19:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzVF9c3mqxgpqCdcEqSKTwAiM6P/wNUJ/M94Wp/a1gRZwFP0ujAp76qbhaPwBnkmhQ0jI4l
X-Received: by 2002:a17:906:1f82:: with SMTP id t2mr30150951ejr.499.1630412356516;
        Tue, 31 Aug 2021 05:19:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412356; cv=none;
        d=google.com; s=arc-20160816;
        b=IZb3kYnTDVDRJfeWqFcPn3GHMbOQKCe9cVDK/DcR78oNOG4ZPvst2+jiSfsptNUPRO
         ZJ+t2EKEcNOoDSVVIx6Z6SNaEKABkH553aljMSYo7o/ejhlFW1GB44qB9XaMEBZKotXz
         /hxj2mmLYVUYPcn6gJa83TeldNAsLqe9gcyUQS5eeiaYIJrDR86L/yTuTF0iPkT2pUsz
         KYD4SgyFGbXlEnUloBI6WYniw+BjucLKDpPFtCADJdpq5dmjej7hhALuXjYEA7Z9hl0e
         XYG6ivBF8ayRcMWmK+AO4nAHxA0KrhW2o2J9ThCzEH5oTMc3/cnGgDvfACSVlZkgxDpw
         zZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TfHHzUf/ne1SzGHt9JtdfF6smhUP6CvP/geWH7Zk86k=;
        b=riuFx14USBcdsm07FMdFx6LVntu51Fgk/u6xDyqPeSKC20kNjvEJn5e4zvGdlcirSP
         7P+USFKGDQzwaSvIS/jIp+WAI7qCxAeYB9PQk6zRtOHQr/B1mF7SW8Mps+MdjtokzxBj
         Ux8lBQkVXXlygHIVprD+DAcvIYOQAFeiGACWA2VP4lXHk35IfbtRgE0zbGb5DqSYNhfJ
         IVmmBo60JQTWbRh/EL30ETYI67XfSbCnPAWT1DMAyW0SZzJiYWmYMA/G3XndLnnXYfTW
         A8kxX7+/fdnsSzu16jL+3sZQ9DM1eFMbhbxqYxR1xcAFlnuy0z4GB5mYSxV11yAJS1Og
         vCpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gIc4o1Zq;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id o4si16855702eje.262.2021.08.31.05.19.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:19:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gIc4o1Zq;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TfHHzUf/ne1SzGHt9JtdfF6smhUP6CvP/geWH7Zk86k=;
	b=gIc4o1ZqUZxF3E3YDg0MZRuDEPFDdOAKosYMEzWcmyM845WmSkESDbLqGO2ZjQbmDDwCvo
	6z19L0WAEWFIeL3ChjG1pBDZOvpZOy05Yz2bUDExnoV55Kbm310Zk6FJBEiCJExRYaC4Wq
	hSDqER1IGrIXn0HWx6yINakfuj6Q+K0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-UlBueg-JPtqnKN6hmEjUIg-1; Tue, 31 Aug 2021 08:19:14 -0400
X-MC-Unique: UlBueg-JPtqnKN6hmEjUIg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E3C71009600;
	Tue, 31 Aug 2021 12:19:10 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FAEB1001281;
	Tue, 31 Aug 2021 12:19:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 5C26218009F1; Tue, 31 Aug 2021 14:15:47 +0200 (CEST)
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
Subject: [PATCH 28/29] tcg_i386_funcs: Add cpu_cc_compute_all to TCGI386ModuleOps
Date: Tue, 31 Aug 2021 14:15:44 +0200
Message-Id: <20210831121545.2874233-29-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: ogExUwyw873H

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/tcg/tcg-module-i386.h | 1 +
 target/i386/cpu.h             | 4 +---
 accel/tcg/tcg-module-i386.c   | 6 ++++++
 target/i386/tcg/cc_helper.c   | 9 ++++++++-
 target/i386/tcg/fpu_helper.c  | 4 ++--
 target/i386/tcg/int_helper.c  | 8 ++++----
 target/i386/tcg/mem_helper.c  | 8 ++++----
 target/i386/tcg/misc_helper.c | 2 +-
 target/i386/tcg/seg_helper.c  | 8 ++++----
 9 files changed, 31 insertions(+), 19 deletions(-)

diff --git a/include/tcg/tcg-module-i386.h b/include/tcg/tcg-module-i386.h
index 02a9716e2e66..f6cd2bc075c7 100644
--- a/include/tcg/tcg-module-i386.h
+++ b/include/tcg/tcg-module-i386.h
@@ -8,6 +8,7 @@ struct TCGI386ModuleOps {
     void (*x86_register_ferr_irq)(qemu_irq irq);
     void (*cpu_set_ignne)(void);
     void (*cpu_x86_update_dr7)(CPUX86State *env, uint32_t new_dr7);
+    uint32_t (*cpu_cc_compute_all)(CPUX86State *env1, int op);
 };
 extern struct TCGI386ModuleOps tcg_i386;
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 0f3922939eb6..43f97fe5686d 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -2064,13 +2064,11 @@ void cpu_x86_inject_mce(Monitor *mon, X86CPU *cpu, int bank,
                         uint64_t status, uint64_t mcg_status, uint64_t addr,
                         uint64_t misc, int flags);
 
-uint32_t cpu_cc_compute_all(CPUX86State *env1, int op);
-
 static inline uint32_t cpu_compute_eflags(CPUX86State *env)
 {
     uint32_t eflags = env->eflags;
     if (tcg_enabled()) {
-        eflags |= cpu_cc_compute_all(env, CC_OP) | (env->df & DF_MASK);
+        eflags |= tcg_i386.cpu_cc_compute_all(env, CC_OP) | (env->df & DF_MASK);
     }
     return eflags;
 }
diff --git a/accel/tcg/tcg-module-i386.c b/accel/tcg/tcg-module-i386.c
index 1025943c8b21..0954fbbc2db5 100644
--- a/accel/tcg/tcg-module-i386.c
+++ b/accel/tcg/tcg-module-i386.c
@@ -17,6 +17,11 @@ static void cpu_x86_update_dr7_stub(CPUX86State *env, uint32_t new_dr7)
 {
 }
 
+static uint32_t cpu_cc_compute_all_stub(CPUX86State *env1, int op)
+{
+    return 0;
+}
+
 struct TCGI386ModuleOps tcg_i386 = {
     .update_fp_status = i386_update_cpu_stub,
     .update_mxcsr_status = i386_update_cpu_stub,
@@ -24,4 +29,5 @@ struct TCGI386ModuleOps tcg_i386 = {
     .x86_register_ferr_irq = x86_register_ferr_irq_stub,
     .cpu_set_ignne = i386_update_stub,
     .cpu_x86_update_dr7 = cpu_x86_update_dr7_stub,
+    .cpu_cc_compute_all = cpu_cc_compute_all_stub,
 };
diff --git a/target/i386/tcg/cc_helper.c b/target/i386/tcg/cc_helper.c
index cc7ea9e8b9d9..d61f5c5131aa 100644
--- a/target/i386/tcg/cc_helper.c
+++ b/target/i386/tcg/cc_helper.c
@@ -220,7 +220,7 @@ target_ulong helper_cc_compute_all(target_ulong dst, target_ulong src1,
     }
 }
 
-uint32_t cpu_cc_compute_all(CPUX86State *env, int op)
+static uint32_t cpu_cc_compute_all(CPUX86State *env, int op)
 {
     return helper_cc_compute_all(CC_DST, CC_SRC, CC_SRC2, op);
 }
@@ -387,3 +387,10 @@ void helper_sti_vm(CPUX86State *env)
     }
 }
 #endif
+
+static void tcgi386_module_ops_cc(void)
+{
+    tcg_i386.cpu_cc_compute_all = cpu_cc_compute_all;
+}
+
+type_init(tcgi386_module_ops_cc);
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index 9a0d1798985b..12d4988713b8 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -469,7 +469,7 @@ void helper_fcomi_ST0_FT0(CPUX86State *env)
     FloatRelation ret;
 
     ret = floatx80_compare(ST0, FT0, &env->fp_status);
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     eflags = (eflags & ~(CC_Z | CC_P | CC_C)) | fcomi_ccval[ret + 1];
     CC_SRC = eflags;
     merge_exception_flags(env, old_flags);
@@ -482,7 +482,7 @@ void helper_fucomi_ST0_FT0(CPUX86State *env)
     FloatRelation ret;
 
     ret = floatx80_compare_quiet(ST0, FT0, &env->fp_status);
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     eflags = (eflags & ~(CC_Z | CC_P | CC_C)) | fcomi_ccval[ret + 1];
     CC_SRC = eflags;
     merge_exception_flags(env, old_flags);
diff --git a/target/i386/tcg/int_helper.c b/target/i386/tcg/int_helper.c
index 87fa7280eec7..658989ebd464 100644
--- a/target/i386/tcg/int_helper.c
+++ b/target/i386/tcg/int_helper.c
@@ -189,7 +189,7 @@ void helper_aaa(CPUX86State *env)
     int al, ah, af;
     int eflags;
 
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     af = eflags & CC_A;
     al = env->regs[R_EAX] & 0xff;
     ah = (env->regs[R_EAX] >> 8) & 0xff;
@@ -213,7 +213,7 @@ void helper_aas(CPUX86State *env)
     int al, ah, af;
     int eflags;
 
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     af = eflags & CC_A;
     al = env->regs[R_EAX] & 0xff;
     ah = (env->regs[R_EAX] >> 8) & 0xff;
@@ -236,7 +236,7 @@ void helper_daa(CPUX86State *env)
     int old_al, al, af, cf;
     int eflags;
 
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     cf = eflags & CC_C;
     af = eflags & CC_A;
     old_al = al = env->regs[R_EAX] & 0xff;
@@ -263,7 +263,7 @@ void helper_das(CPUX86State *env)
     int al, al1, af, cf;
     int eflags;
 
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     cf = eflags & CC_C;
     af = eflags & CC_A;
     al = env->regs[R_EAX] & 0xff;
diff --git a/target/i386/tcg/mem_helper.c b/target/i386/tcg/mem_helper.c
index 2da3cd14b66d..5338b26be7f7 100644
--- a/target/i386/tcg/mem_helper.c
+++ b/target/i386/tcg/mem_helper.c
@@ -33,7 +33,7 @@ void helper_cmpxchg8b_unlocked(CPUX86State *env, target_ulong a0)
     uint64_t oldv, cmpv, newv;
     int eflags;
 
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
 
     cmpv = deposit64(env->regs[R_EAX], 32, 32, env->regs[R_EDX]);
     newv = deposit64(env->regs[R_EBX], 32, 32, env->regs[R_ECX]);
@@ -59,7 +59,7 @@ void helper_cmpxchg8b(CPUX86State *env, target_ulong a0)
     uint64_t oldv, cmpv, newv;
     int eflags;
 
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
 
     cmpv = deposit64(env->regs[R_EAX], 32, 32, env->regs[R_EDX]);
     newv = deposit64(env->regs[R_EBX], 32, 32, env->regs[R_ECX]);
@@ -96,7 +96,7 @@ void helper_cmpxchg16b_unlocked(CPUX86State *env, target_ulong a0)
     if ((a0 & 0xf) != 0) {
         raise_exception_ra(env, EXCP0D_GPF, GETPC());
     }
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
 
     cmpv = int128_make128(env->regs[R_EAX], env->regs[R_EDX]);
     newv = int128_make128(env->regs[R_EBX], env->regs[R_ECX]);
@@ -130,7 +130,7 @@ void helper_cmpxchg16b(CPUX86State *env, target_ulong a0)
     if ((a0 & 0xf) != 0) {
         raise_exception_ra(env, EXCP0D_GPF, ra);
     } else if (HAVE_CMPXCHG128) {
-        int eflags = cpu_cc_compute_all(env, CC_OP);
+        int eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
 
         Int128 cmpv = int128_make128(env->regs[R_EAX], env->regs[R_EDX]);
         Int128 newv = int128_make128(env->regs[R_EBX], env->regs[R_ECX]);
diff --git a/target/i386/tcg/misc_helper.c b/target/i386/tcg/misc_helper.c
index dc974dad6acc..15c549277ebc 100644
--- a/target/i386/tcg/misc_helper.c
+++ b/target/i386/tcg/misc_helper.c
@@ -40,7 +40,7 @@ void helper_into(CPUX86State *env, int next_eip_addend)
 {
     int eflags;
 
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     if (eflags & CC_O) {
         raise_interrupt(env, EXCP04_INTO, 1, 0, next_eip_addend);
     }
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index f39d5be97b94..cae88059689f 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -2252,7 +2252,7 @@ target_ulong helper_lsl(CPUX86State *env, target_ulong selector1)
     int rpl, dpl, cpl, type;
 
     selector = selector1 & 0xffff;
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     if ((selector & 0xfffc) == 0) {
         goto fail;
     }
@@ -2299,7 +2299,7 @@ target_ulong helper_lar(CPUX86State *env, target_ulong selector1)
     int rpl, dpl, cpl, type;
 
     selector = selector1 & 0xffff;
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     if ((selector & 0xfffc) == 0) {
         goto fail;
     }
@@ -2348,7 +2348,7 @@ void helper_verr(CPUX86State *env, target_ulong selector1)
     int rpl, dpl, cpl;
 
     selector = selector1 & 0xffff;
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     if ((selector & 0xfffc) == 0) {
         goto fail;
     }
@@ -2386,7 +2386,7 @@ void helper_verw(CPUX86State *env, target_ulong selector1)
     int rpl, dpl, cpl;
 
     selector = selector1 & 0xffff;
-    eflags = cpu_cc_compute_all(env, CC_OP);
+    eflags = tcg_i386.cpu_cc_compute_all(env, CC_OP);
     if ((selector & 0xfffc) == 0) {
         goto fail;
     }
-- 
2.31.1
