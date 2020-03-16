Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp251360lfe;
        Mon, 16 Mar 2020 09:08:05 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vt9tH83lPqtdP3f60NsRS0Xb4giKB8MKDwbN8k47pYBeSI74+0xl0Isa17pyNbeSd3krMjy
X-Received: by 2002:a25:5756:: with SMTP id l83mr457173ybb.334.1584374885761;
        Mon, 16 Mar 2020 09:08:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584374885; cv=none;
        d=google.com; s=arc-20160816;
        b=Qj96pfpx1Gi0cO0towCDjCKHUfBOt6nXz9OoFJCnwUei75+ucLkEIadIM5VE09ypeb
         zIXus/a/XhuLBJWwH0vZqnFNBnQoW7ZWVOkT5S+DYOMSTLOpkzximIB3rD11Xvwbb+N3
         KhNxgEENzimaQRmTDIme24HT0lU8EDwKbPVJfaKFNjqVLHzNM7O4OAcIxM34rtE3EI38
         56tqgi4764OS1aVU3sAy6mke/pKdyjGrRJJPlBdYQZ+PRJMS7FicJnl0cb0onz3QmrQB
         J1VKyViA1W69thoacA3UfOndICToAhHTL1Vv8mKd4DWlHNXoeyoaPs5uS71bIXlyscD2
         zj1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ui04JwX7OiOXq/laFXLsBkQhZYSQ3MHjobkDuHeSfV0=;
        b=jot8XZmKxnOUNLTw+T+u6Z2waYwRy09tU00IXdOHc6nyXqtJNY9pmohF0DlZDdnoZv
         XVgHS3Xht8m5xfJOGMo6HlGmyKY93vSqvAVQBVme/3CGThPuYtTVSw7u58X+VUQNUIee
         uv/YIPkVYdQFWLEzjS8ipapglxpsfnvaXV9vxRKy3BJ3r9yZwcsyKI6sxces+k28jKMK
         2DQia58iVDObdnEfUfyP0bdJHx9b3msetW9/ttopaW4hPdDw1kqQcAWJ1UjDwmE+aGWK
         jssgz2j/nMo+tbQFjSk/4PsMsIgna0K4tYM84xr3g77wtNxi42FU50ZzMmupsop+7cbr
         9J9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CEqpVH6A;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [63.128.21.74])
        by mx.google.com with ESMTPS id i202si104645yba.481.2020.03.16.09.08.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Mar 2020 09:08:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) client-ip=63.128.21.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CEqpVH6A;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584374885;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ui04JwX7OiOXq/laFXLsBkQhZYSQ3MHjobkDuHeSfV0=;
	b=CEqpVH6AccFgE6OyyCvobv1P6Su+fxjdCjaDOipj+K1FNLRVvgp9YvCfFihycQxI/Tfo6F
	xz9i3oVdcgBOA4GL/CuoQYTAkOEVTH8EQUSecp0VpqqROHpmHtc3qIb56liFb/HcBZ3w9f
	XOf/H6Wpj+6COyfhAqaOudmA1ae+h8Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-360-fW8yQ3F1NgC2rbC7NrkI7A-1; Mon, 16 Mar 2020 12:08:01 -0400
X-MC-Unique: fW8yQ3F1NgC2rbC7NrkI7A-1
Received: by mail-wm1-f70.google.com with SMTP id a13so6012258wme.7
        for <alex.bennee@linaro.org>; Mon, 16 Mar 2020 09:08:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sJ9bxuRVskXYC2aJKl03+Z9cSr20F7Dbm9JRwxmo2e4=;
        b=ciA8M3SjigJ5Z2fmiyhXfWl7Zpm5ot4RQkx7EjfkW0QCqV5XnGMpEKapgS14//MhPj
         xQDpKwM71ZrPUUhYOgKMQi4jt+7ePJl7DK1QPB6gNcSXFpQqYltPuiqqsbMnBCxVW2l/
         AUpfMjusUzYhNAjbtGjDhJSvyaxaKgCatib70XBUhAoGYh2+WbVkFk15LktjRg+cQ0q5
         X2qzC3LF4KAkszkKitscoe6MCvX6LmPcUceSUYS9Gv6mHbrmYZUDgdjeaKaxLTHawKvf
         NAAFojyIQmm/AnVxfZqNSWz8n8feHPldqpzjEPuT76g/nvJEOEOnARM2LVwz2RP6yky5
         PQ+g==
X-Gm-Message-State: ANhLgQ1FMHypO2jFg7e04ENgu42hnJQHQkpzswc7qGs+ljSTzf+69X6f
	CXUSv397e0xhx/7L+cdhxS4iyrvAps+AHxAVBt1L9VmzpPz10hGfcNbrdehDES5pm9vTtCBxGF+
	sTyEy7SKRiG/Q1zcP
X-Received: by 2002:a5d:4488:: with SMTP id j8mr96064wrq.306.1584374879942;
        Mon, 16 Mar 2020 09:07:59 -0700 (PDT)
X-Received: by 2002:a5d:4488:: with SMTP id j8mr96041wrq.306.1584374879656;
        Mon, 16 Mar 2020 09:07:59 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from localhost.localdomain (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id f203sm206459wmf.18.2020.03.16.09.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 09:07:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	kvm@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 15/19] target/arm: Make m_helper.c optional via CONFIG_ARM_V7M
Date: Mon, 16 Mar 2020 17:06:30 +0100
Message-Id: <20200316160634.3386-16-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200316160634.3386-1-philmd@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: v5GTgJsR9DkE

From: Thomas Huth <thuth@redhat.com>

We've already got the CONFIG_ARM_V7M switch, but it currently can
not be disabled yet. The m_helper.c code should not be compiled
into the binary if the switch is not enabled. We also have to
provide some stubs in a separate file to make sure that we still
can link the other code without CONFIG_ARM_V7M.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20190903154810.27365-4-thuth@redhat.com>
[PMD: add write_v7m_exception() stub when not using TCG,
      remove CONFIG_ARM_V7M=3Dy in default-configs/arm-softmmu.mak]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 default-configs/arm-softmmu.mak |  6 ----
 target/arm/cpu.h                |  7 ++++
 target/arm/m_helper-stub.c      | 59 +++++++++++++++++++++++++++++++++
 target/arm/Makefile.objs        |  3 +-
 4 files changed, 68 insertions(+), 7 deletions(-)
 create mode 100644 target/arm/m_helper-stub.c

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.=
mak
index 511d74da58..7ae8006556 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -1,11 +1,5 @@
 # Default configuration for arm-softmmu
=20
-# CONFIG_SEMIHOSTING is always required on this architecture
-CONFIG_SEMIHOSTING=3Dy
-
-# TODO: ARM_V7M is currently always required - make this more flexible!
-CONFIG_ARM_V7M=3Dy
-
 # CONFIG_PCI_DEVICES=3Dn
 # CONFIG_TEST_DEVICES=3Dn
=20
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 4ffd991b6f..84e14ce5a9 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1278,7 +1278,14 @@ void pmu_init(ARMCPU *cpu);
 /* Write a new value to v7m.exception, thus transitioning into or out
  * of Handler mode; this may result in a change of active stack pointer.
  */
+#if !defined(CONFIG_TCG)
+static inline void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
+{
+    g_assert_not_reached();
+}
+#else
 void write_v7m_exception(CPUARMState *env, uint32_t new_exc);
+#endif
=20
 /* Map EL and handler into a PSTATE_MODE.  */
 static inline unsigned int aarch64_pstate_mode(unsigned int el, bool handl=
er)
diff --git a/target/arm/m_helper-stub.c b/target/arm/m_helper-stub.c
new file mode 100644
index 0000000000..9316a9995b
--- /dev/null
+++ b/target/arm/m_helper-stub.c
@@ -0,0 +1,59 @@
+/*
+ * ARM V7M related stubs.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/helper-proto.h"
+#include "internals.h"
+
+void HELPER(v7m_bxns)(CPUARMState *env, uint32_t dest)
+{
+    abort();
+}
+
+void HELPER(v7m_blxns)(CPUARMState *env, uint32_t dest)
+{
+    abort();
+}
+
+uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
+{
+    abort();
+}
+
+void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
+{
+    abort();
+}
+
+uint32_t HELPER(v7m_tt)(CPUARMState *env, uint32_t addr, uint32_t op)
+{
+    abort();
+}
+
+void HELPER(v7m_preserve_fp_state)(CPUARMState *env)
+{
+    abort();
+}
+
+void write_v7m_exception(CPUARMState *env, uint32_t new_exc)
+{
+    abort();
+}
+
+void HELPER(v7m_vlldm)(CPUARMState *env, uint32_t fptr)
+{
+    abort();
+}
+
+void HELPER(v7m_vlstm)(CPUARMState *env, uint32_t fptr)
+{
+    abort();
+}
+
+ARMMMUIdx arm_v7m_mmu_idx_for_secstate(CPUARMState *env, bool secstate)
+{
+    abort();
+}
diff --git a/target/arm/Makefile.objs b/target/arm/Makefile.objs
index a0df58526b..993899d731 100644
--- a/target/arm/Makefile.objs
+++ b/target/arm/Makefile.objs
@@ -66,7 +66,8 @@ obj-y +=3D tlb_helper.o debug_helper.o
 obj-y +=3D translate.o op_helper.o
 obj-y +=3D crypto_helper.o
 obj-y +=3D iwmmxt_helper.o vec_helper.o neon_helper.o
-obj-y +=3D m_helper.o
+obj-$(CONFIG_ARM_V7M) +=3D m_helper.o
+obj-$(call lnot,$(CONFIG_ARM_V7M)) +=3D m_helper-stub.o
=20
 obj-$(CONFIG_ARM_V4) +=3D cpu_v4.o
 obj-$(CONFIG_ARM_V5) +=3D cpu_v5.o
--=20
2.21.1
