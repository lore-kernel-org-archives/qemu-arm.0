Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4975529lfb;
        Tue, 31 Aug 2021 05:18:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9DJkR20vnrzClMfPeCFwgkhFCie8l3P1mhHDM/pU/eqdrHbfs34qFPP6x2lATX2H/SU/i
X-Received: by 2002:a17:906:b18c:: with SMTP id w12mr30789113ejy.534.1630412336118;
        Tue, 31 Aug 2021 05:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630412336; cv=none;
        d=google.com; s=arc-20160816;
        b=kodeuZVvcQKSeW1ePyvA9A2ncRHLBOnLYDBj5SbtP4U0asq1oBEkS3QfuywBAPIA7G
         sJGLoK6W/PH4fLl5/9V/G8RfO6ozzcqQwhROzuKf/kaGvoOUiwmq7IhMWkUqG4OmqFwt
         nbzWy0qZP2ule3vKl03WkD4STgrY9f2gI0vrwvr8WmPMtaZRsIF8a3tfVTu869x6j5jW
         bfKb68frMpHlX50qB/WQsXLEUey15md+76d9lXvS+fjZKGWV9kWQ1lW4DHMNGO8RdyxY
         h+4uBquv9Xv1p9dL/5mk0mRpd0bYHICoYGPR3rWCRPdwRw4rEd5u+gjeprLxglUsrOfw
         Ug7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=1FX/az27XaMeHUvM8QQkgGCCE/jWAwmUfVJoWBRI9Wg=;
        b=wDCac3bzi/iGke+aHeXn4xIGWWbg97hfroqJsnHifQGZuBefF1Bvm5Hf9cxCXh+LiB
         dqeCSxz/iScfprDq8zobzoSKU4jwAtAjSoFOT1dSNj/FwJTh0Zk+myfJTSwVGgP9OCne
         lJ+wJlV8uW9nhdBJqa/cGod7tuUyKJniJwTOaO4yniaELXLP9F9rjMZly+lJM/BMLmfj
         nJOuqiR7lTMHDOtjyFcBdL4+WammXqr4vIERmFR033iDB3EdGvCJx4AZdkHRfpGesj0e
         FqHTyJ2i6HTykcOY3zGKFJCYRcKPqM//l8i0r2VWkzczCMG+nFIQrUsJqyBK0R8m2LhR
         HFbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B4wSE++P;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kraxel@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id w2si19197276edi.202.2021.08.31.05.18.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 31 Aug 2021 05:18:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=B4wSE++P;
       spf=pass (google.com: domain of kraxel@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=kraxel@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630412335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1FX/az27XaMeHUvM8QQkgGCCE/jWAwmUfVJoWBRI9Wg=;
	b=B4wSE++P4vv40nk831JgoU/ZA38uI+9s7+pNxIxKbbcrEO4GGgGmhx9kzLXitBMjLUbsyY
	ZBXy6/V4Kg8LLqTYwuSdj/JLxBVY1AKbByqumCw/gQrNtH7vP/YJiDNUPd9W54z7Zz4jsv
	AIZdB5rU7KHalCzM9+lY3pyTry18kQM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-hhaxD5rUMbGlAywzxULgFw-1; Tue, 31 Aug 2021 08:18:53 -0400
X-MC-Unique: hhaxD5rUMbGlAywzxULgFw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DE6C18C9F42;
	Tue, 31 Aug 2021 12:18:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24F6627CB1;
	Tue, 31 Aug 2021 12:18:34 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id CCB7E18009E6; Tue, 31 Aug 2021 14:15:46 +0200 (CEST)
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
Subject: [PATCH 22/29] tcg_i386_funcs: Add update_fp_status to TCGI386ModuleOps
Date: Tue, 31 Aug 2021 14:15:38 +0200
Message-Id: <20210831121545.2874233-23-kraxel@redhat.com>
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
X-TUID: TEqRbbvqMlhL

Also add TCGI386ModuleOps struct, which works like TCGModuleOps
but for i386-specific functions.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/tcg/tcg-module-i386.h |  9 +++++++++
 target/i386/cpu.h             |  4 ++--
 accel/tcg/tcg-module-i386.c   | 10 ++++++++++
 target/i386/machine.c         |  2 +-
 target/i386/tcg/fpu_helper.c  |  9 ++++++++-
 accel/tcg/meson.build         |  6 ++++++
 6 files changed, 36 insertions(+), 4 deletions(-)
 create mode 100644 include/tcg/tcg-module-i386.h
 create mode 100644 accel/tcg/tcg-module-i386.c

diff --git a/include/tcg/tcg-module-i386.h b/include/tcg/tcg-module-i386.h
new file mode 100644
index 000000000000..3854b506d5dc
--- /dev/null
+++ b/include/tcg/tcg-module-i386.h
@@ -0,0 +1,9 @@
+#ifndef TCG_MODULE_I386_H
+#define TCG_MODULE_I386_H
+
+struct TCGI386ModuleOps {
+    void (*update_fp_status)(CPUX86State *env);
+};
+extern struct TCGI386ModuleOps tcg_i386;
+
+#endif /* TCG_MODULE_I386_H */
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index 6c50d3ab4f1d..5769c1292683 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1802,6 +1802,7 @@ struct X86CPU {
     int32_t hv_max_vps;
 };
 
+#include "tcg/tcg-module-i386.h"
 
 #ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_x86_cpu;
@@ -2127,7 +2128,6 @@ static inline bool cpu_vmx_maybe_enabled(CPUX86State *env)
 int get_pg_mode(CPUX86State *env);
 
 /* fpu_helper.c */
-void update_fp_status(CPUX86State *env);
 void update_mxcsr_status(CPUX86State *env);
 void update_mxcsr_from_sse_status(CPUX86State *env);
 
@@ -2143,7 +2143,7 @@ static inline void cpu_set_fpuc(CPUX86State *env, uint16_t fpuc)
 {
      env->fpuc = fpuc;
      if (tcg_enabled()) {
-        update_fp_status(env);
+        tcg_i386.update_fp_status(env);
      }
 }
 
diff --git a/accel/tcg/tcg-module-i386.c b/accel/tcg/tcg-module-i386.c
new file mode 100644
index 000000000000..41ce2ba4eb76
--- /dev/null
+++ b/accel/tcg/tcg-module-i386.c
@@ -0,0 +1,10 @@
+#include "qemu/osdep.h"
+#include "cpu.h"
+
+static void i386_update_cpu_stub(CPUX86State *cpu)
+{
+}
+
+struct TCGI386ModuleOps tcg_i386 = {
+    .update_fp_status = i386_update_cpu_stub,
+};
diff --git a/target/i386/machine.c b/target/i386/machine.c
index 571e98853c64..7f5d80766f28 100644
--- a/target/i386/machine.c
+++ b/target/i386/machine.c
@@ -371,7 +371,7 @@ static int cpu_post_load(void *opaque, int version_id)
     }
     if (tcg_enabled()) {
         target_ulong dr7;
-        update_fp_status(env);
+        tcg_i386.update_fp_status(env);
         update_mxcsr_status(env);
 
         cpu_breakpoint_remove_all(cs, BP_CPU);
diff --git a/target/i386/tcg/fpu_helper.c b/target/i386/tcg/fpu_helper.c
index eddf0bb9dfc4..0f7206e834fd 100644
--- a/target/i386/tcg/fpu_helper.c
+++ b/target/i386/tcg/fpu_helper.c
@@ -672,7 +672,7 @@ uint32_t helper_fnstcw(CPUX86State *env)
     return env->fpuc;
 }
 
-void update_fp_status(CPUX86State *env)
+static void update_fp_status(CPUX86State *env)
 {
     FloatRoundMode rnd_mode;
     FloatX80RoundPrec rnd_prec;
@@ -3039,3 +3039,10 @@ void helper_movq(CPUX86State *env, void *d, void *s)
 
 #define SHIFT 1
 #include "ops_sse.h"
+
+static void tcgi386_module_ops_fpu(void)
+{
+    tcg_i386.update_fp_status = update_fp_status;
+}
+
+type_init(tcgi386_module_ops_fpu);
diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
index 93cbbf9f3926..7f1fdd68233b 100644
--- a/accel/tcg/meson.build
+++ b/accel/tcg/meson.build
@@ -1,6 +1,12 @@
 specific_ss.add(files(
   'tcg-module.c',
 ))
+specific_ss.add(when: 'TARGET_I386', if_true: files(
+  'tcg-module-i386.c',
+))
+specific_ss.add(when: 'TARGET_X86_64', if_true: files(
+  'tcg-module-i386.c',
+))
 
 specific_ss.add(when: 'CONFIG_TCG', if_true: files(
   'cpu-exec-common.c',
-- 
2.31.1
