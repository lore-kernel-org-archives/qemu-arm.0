Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4976035lfb;
        Tue, 31 Aug 2021 05:19:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3Jk4SnvA23Gmrv+PYAziUylRSLgNvTFD6CVSDT9WizOVQHpvuTNa1h8+oKzDHRexZwmyV
X-Received: by 2002:a17:906:368e:: with SMTP id a14mr31789825ejc.60.1630412370873;
        Tue, 31 Aug 2021 05:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412370; cv=none;
        d=google.com; s=arc-20160816;
        b=sbUrQW24ZRZbzezuapyW2N6j9l1RhMuREF3rsskzcHQNKjVP1+TIqIb3vboYeTKxri
         DSVRA3OgkUTrPw+ZCpTFyKD4k+xtrySpzdMxHH781b5iLEjLwy5Gf0sI3W5dkigKCCM7
         RMUFITiNPfPMoGmCv0gIXeYIv6mF0siPeeA3td+kDB85nRi+OcSWKrl2phgbRJef3FbC
         Mmsru34c5vOo/rFIzHy6w1a6No+EuaFtdA86f3XwhXaBxLEQ8xnJ3mLhgbOLefkrk3YX
         01ZbA16/NSO1ql4JBDyMZOUNGLt/c3OAc1pt9uMFOxr4x6PfT2TrKOp6kxCksoQciy8o
         VhTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=/3ujaq1NT6nZmAaAMZak8E793ppg3V97NR3xFqYDTs8=;
        b=swCA9wLR/ZU1pHKuK1bp35yXmSVDhFZBGbSGWewbaqbFvm3FCI/C0Wi8yb5aIi477B
         I1F8iaRyoh/H+Zed49k+qN+ogEUPnfcow+vN2KfwI973dHp2Z4OJtEkKNFpu8ehw9EL7
         CSbioRCOsglEVyJSaWYm3sjYg3OGd0udT2vM4odJ5aCm4aG5AZH/itHzwUjKYsMzgMDl
         eVOPh2LxZue+QR6scxoGpQL5SaknmGFNlFpUvH12w9W7JVSOUw3kSAMHLEPNYHrxlnVZ
         riNbCEmkalA3/nDKjwDfV96/ybkaJDwC9ShXPLUCslD1cc8ya4WXZgIViG5dU7byNe1i
         Lh2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ELmow3su;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 4si17228942ejm.546.2021.08.31.05.19.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:19:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ELmow3su;
       spf=pass (google.com: domain of kraxel@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412369;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/3ujaq1NT6nZmAaAMZak8E793ppg3V97NR3xFqYDTs8=;
	b=ELmow3suXIQtxc60N4mWMP+jzl5f4KgoRdIp4kweT8dsbweNWEGj19kNAh9qIgca1X8yQ1
	87eUUCyrFTUDkw9/QkE16FzOQLrO8oS3tK0wsCIPzetA0igxkyxoZ2bp0wA7ZBkeiDjLOz
	jju80oO4frr6m/TAWwsRcLDMdUXywQU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-tix8G2sPOqmNDDjCgBMWqw-1; Tue, 31 Aug 2021 08:19:28 -0400
X-MC-Unique: tix8G2sPOqmNDDjCgBMWqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 725B8802B9F;
	Tue, 31 Aug 2021 12:19:25 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 743A627CB1;
	Tue, 31 Aug 2021 12:19:09 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 407BB18009F0; Tue, 31 Aug 2021 14:15:47 +0200 (CEST)
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
Subject: [PATCH 27/29] tcg_i386_funcs: Add cpu_x86_update_dr7 to TCGI386ModuleOps
Date: Tue, 31 Aug 2021 14:15:43 +0200
Message-Id: <20210831121545.2874233-28-kraxel@redhat.com>
In-Reply-To: <20210831121545.2874233-1-kraxel@redhat.com>
References: <20210831121545.2874233-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
X-TUID: U6H2CYwaO1KH

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/tcg/tcg-module-i386.h       | 1 +
 target/i386/cpu.h                   | 1 -
 accel/tcg/tcg-module-i386.c         | 5 +++++
 target/i386/machine.c               | 2 +-
 target/i386/tcg/seg_helper.c        | 2 +-
 target/i386/tcg/sysemu/bpt_helper.c | 9 ++++++++-
 6 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/include/tcg/tcg-module-i386.h b/include/tcg/tcg-module-i386.h
index aa96aca82c4a..02a9716e2e66 100644
--- a/include/tcg/tcg-module-i386.h
+++ b/include/tcg/tcg-module-i386.h
@@ -7,6 +7,7 @@ struct TCGI386ModuleOps {
     void (*update_mxcsr_from_sse_status)(CPUX86State *env);
     void (*x86_register_ferr_irq)(qemu_irq irq);
     void (*cpu_set_ignne)(void);
+    void (*cpu_x86_update_dr7)(CPUX86State *env, uint32_t new_dr7);
 };
 extern struct TCGI386ModuleOps tcg_i386;
 
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 6b9b1fad016f..0f3922939eb6 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1995,7 +1995,6 @@ void x86_stq_phys(CPUState *cs, hwaddr addr, uint64_t val);
 void cpu_x86_update_cr0(CPUX86State *env, uint32_t new_cr0);
 void cpu_x86_update_cr3(CPUX86State *env, target_ulong new_cr3);
 void cpu_x86_update_cr4(CPUX86State *env, uint32_t new_cr4);
-void cpu_x86_update_dr7(CPUX86State *env, uint32_t new_dr7);
 
 /* hw/pc.c */
 uint64_t cpu_get_tsc(CPUX86State *env);
diff --git a/accel/tcg/tcg-module-i386.c b/accel/tcg/tcg-module-i386.c
index 307238e3bc78..1025943c8b21 100644
--- a/accel/tcg/tcg-module-i386.c
+++ b/accel/tcg/tcg-module-i386.c
@@ -13,10 +13,15 @@ static void x86_register_ferr_irq_stub(qemu_irq irq)
 {
 }
 
+static void cpu_x86_update_dr7_stub(CPUX86State *env, uint32_t new_dr7)
+{
+}
+
 struct TCGI386ModuleOps tcg_i386 = {
     .update_fp_status = i386_update_cpu_stub,
     .update_mxcsr_status = i386_update_cpu_stub,
     .update_mxcsr_from_sse_status = i386_update_cpu_stub,
     .x86_register_ferr_irq = x86_register_ferr_irq_stub,
     .cpu_set_ignne = i386_update_stub,
+    .cpu_x86_update_dr7 = cpu_x86_update_dr7_stub,
 };
diff --git a/target/i386/machine.c b/target/i386/machine.c
index dc63de37dd6f..44736cb036c0 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -381,7 +381,7 @@ static int cpu_post_load(void *opaque, int version_id)
            let the helper re-enable them.  */
         dr7 = env->dr[7];
         env->dr[7] = dr7 & ~(DR7_GLOBAL_BP_MASK | DR7_LOCAL_BP_MASK);
-        cpu_x86_update_dr7(env, dr7);
+        tcg_i386.cpu_x86_update_dr7(env, dr7);
     }
     tcg.tlb_flush(cs);
     return 0;
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 3ed20ca31d75..f39d5be97b94 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -460,7 +460,7 @@ static void switch_tss_ra(CPUX86State *env, int tss_selector,
 #ifndef CONFIG_USER_ONLY
     /* reset local breakpoints */
     if (env->dr[7] & DR7_LOCAL_BP_MASK) {
-        cpu_x86_update_dr7(env, env->dr[7] & ~DR7_LOCAL_BP_MASK);
+        tcg_i386.cpu_x86_update_dr7(env, env->dr[7] & ~DR7_LOCAL_BP_MASK);
     }
 #endif
 }
diff --git a/target/i386/tcg/sysemu/bpt_helper.c b/target/i386/tcg/sysemu/bpt_helper.c
index 4d96a48a3ca3..b90c5e267ddf 100644
--- a/target/i386/tcg/sysemu/bpt_helper.c
+++ b/target/i386/tcg/sysemu/bpt_helper.c
@@ -121,7 +121,7 @@ static void hw_breakpoint_remove(CPUX86State *env, int index)
     }
 }
 
-void cpu_x86_update_dr7(CPUX86State *env, uint32_t new_dr7)
+static void cpu_x86_update_dr7(CPUX86State *env, uint32_t new_dr7)
 {
     target_ulong old_dr7 = env->dr[7];
     int iobpt = 0;
@@ -296,3 +296,10 @@ void helper_bpt_io(CPUX86State *env, uint32_t port,
         raise_exception(env, EXCP01_DB);
     }
 }
+
+static void tcgi386_module_ops_bpt_sys(void)
+{
+    tcg_i386.cpu_x86_update_dr7 = cpu_x86_update_dr7;
+}
+
+type_init(tcgi386_module_ops_bpt_sys);
-- 
2.31.1
