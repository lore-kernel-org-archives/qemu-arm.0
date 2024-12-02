Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3144257njk;
        Mon, 2 Dec 2024 11:27:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWBZfljf/iakHhxGjTgEKFZIZZne5+RhGniqbP+zqqLH/zdX6wCEunfetDr1fjh7/BK2pdbjjGU34SmDg==@linaro.org
X-Google-Smtp-Source: AGHT+IFeCEk/n58YWhf8a1jDs1xvAGbamkX7Ky0yR+RrybkbyhY+GeoC2lg3OAzDXQ3/KnwXcZHb
X-Received: by 2002:a5d:6daf:0:b0:385:fa2e:a33e with SMTP id ffacd0b85a97d-385fa2ea6admr2668914f8f.43.1733167634460;
        Mon, 02 Dec 2024 11:27:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733167634; cv=none;
        d=google.com; s=arc-20240605;
        b=dk7xxPiL6PYLNvVN58RHAEm1bXH/Xk6/zddy4Nq8x9G3xH8356jVtc6cvQFOkEXuQB
         HoeQDtMIXSIDQ7nedlxHV/DTXJrBc9i9OoeagewPYdTVNQ6eOgUtdi2bYmtgLwy6rsm9
         dUfyIIH8AOa7u/6nL82e6CirC366f3jr59/0sxd5wbLJ0NWuTyDfAUupN4PXs6vqUtcE
         Xd3hWaa/XfPJ/I85XRblKzvEYK4g5rh2i9hzI1ZuVqPV5g6LkcNMvAb0JC47zu+U6UPJ
         wstciyKPfr8noWw38JO/XnLHI5k+MoEMh/tekrjxa/0drkzfbccE282a5PYcpdEmzdeD
         dHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=dkim-signature:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from;
        bh=mBuN8+qvmlRd8d51iRoCgolDd4Xvq8M4rGmOQ4alJtM=;
        fh=eATtOrfecfUzsNWosLfMf+5V2Xi7YTIiwYFKPL+m2BI=;
        b=YqsBKHrdsNjMa4UNV34LgpMWP31BlETK7zFW9H9GyrvzR97Q579a+E64Wrn03FZ4dO
         BUpOucF9CB2VeWRZ1cmnezDTj42VhTd/jcDwmaaazUgx9dXZaL4bB8yUM/KbFKJo9qNn
         UKqCjk/2joc/bl7e8h8Y+Qxb8E68C9vLggQcu1UXTEObt95aHMKSCLLgG6J8U3XYBWCE
         xk7HOkJfUV3+H1/pdl3UAbZS9rimOUKEdfUhvVIxMHdiPRTgFrFcVaCPUNoxRrzT3P1x
         Rk7seJ94JblHy/iNfNxU3NvPGBd3YEiJyHiGn2AOl6LMTJyIVUVoDqMx3pXr/vhPrfeY
         qakQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nut.email header.s=uberspace header.b=Qxuwp23H;
       spf=pass (google.com: domain of neither@nut.email designates 2a00:d0c0:200:0:1c7b:a6ff:fee0:8ea4 as permitted sender) smtp.mailfrom=neither@nut.email
Return-Path: <neither@nut.email>
Received: from mailgate02.uberspace.is (mailgate02.uberspace.is. [2a00:d0c0:200:0:1c7b:a6ff:fee0:8ea4])
        by mx.google.com with ESMTPS id ffacd0b85a97d-385e45badc2si3260125f8f.77.2024.12.02.11.27.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 11:27:14 -0800 (PST)
Received-SPF: pass (google.com: domain of neither@nut.email designates 2a00:d0c0:200:0:1c7b:a6ff:fee0:8ea4 as permitted sender) client-ip=2a00:d0c0:200:0:1c7b:a6ff:fee0:8ea4;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nut.email header.s=uberspace header.b=Qxuwp23H;
       spf=pass (google.com: domain of neither@nut.email designates 2a00:d0c0:200:0:1c7b:a6ff:fee0:8ea4 as permitted sender) smtp.mailfrom=neither@nut.email
Received: from skiff.uberspace.de (skiff.uberspace.de [185.26.156.131])
	by mailgate02.uberspace.is (Postfix) with ESMTPS id 202EC180C43
	for <alex.bennee@linaro.org>; Mon,  2 Dec 2024 20:27:14 +0100 (CET)
Received: (qmail 7181 invoked by uid 990); 2 Dec 2024 19:27:14 -0000
Authentication-Results: skiff.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by skiff.uberspace.de (Haraka/3.0.1) with ESMTPSA; Mon, 02 Dec 2024 20:27:13 +0100
From: Julian Ganz <neither@nut.email>
To: qemu-devel@nongnu.org
Cc: Julian Ganz <neither@nut.email>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC PATCH v3 06/11] target/arm: call plugin trap callbacks
Date: Mon,  2 Dec 2024 20:26:47 +0100
Message-ID: <5c4b8e6f913e3257fee662708a69902676edc628.1733063076.git.neither@nut.email>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1733063076.git.neither@nut.email>
References: <cover.1733063076.git.neither@nut.email>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: ----
X-Rspamd-Report: REPLY(-4) SUSPICIOUS_RECIPS(1.5) MID_CONTAINS_FROM(1) MIME_GOOD(-0.1) BAYES_HAM(-2.999999) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -4.099999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=nut.email; s=uberspace;
	h=from:to:cc:subject:date;
	bh=n9gM0kBmO83WxtZS2NBl9dSShYXqE3eiFoCKNq/tViA=;
	b=Qxuwp23H6cgGzKlkzOADioJ0R0jHv2nPMzgCIY3OPj4UuYV6eO//sTyjc9gVjfKPMcmNcxlHSn
	qo/nsDxI00UZbaTYDN5sz75C3AMupRMK94EPcAdeGn1HP7OGACBW1TJKqSU/IKnbzGiGLX8VS3Ds
	NeSXVp6EumTrEVn4MgQ9WghRvQtyJQ4HoZDqKvvQw57x+IFkcnCmkt439IiUPPa5byek2iT2q9gs
	pkYsoHam2jO21gU4d+B6RNYPe++4DJufyix7Uoj1Q4zvk76tGTyrfrh08N+YRv0pKXDb9UuuRiRX
	1Gh8OWtDAEVBHUiHm1gavTJQKOcN+mtJeqjzO0w2Xzc45QSMMotoZcWXUlbgMRuNTqH5qGNEvTCb
	AfaoVBZwrC69yQuqfLGkXv7wRLjdET7hNyt+cqSnc21ArpXR3jMXYn0ntEJkj4JDxU0qGRDsaxEv
	yV8cpmbUMlFqk9z2/XnEDodGbKU4EY5ScVf9FLldontf0RrwQs3DvjSCLNcIHbt36+XbistADyqo
	uqshKlE0bjmWYUHoCil7KOPYDhdzF/VLhao82Zj4mBG+GFiJ7kY31XRtb90TartdYWsmBWLyvlb5
	jLVglESze1TN65VObf9PkpuCgNUur2/cqHuktBQyPxd1vfmQ8WPRQFox4JAA7sEmo5/c3XMQIzSU
	0=
X-TUID: 53z1JxMl2WxL

We recently introduced API for registering callbacks for trap related
events as well as the corresponding hook functions. Due to differences
between architectures, the latter need to be called from target specific
code.

This change places hooks for ARM (and Aarch64) targets. We decided to
treat the (V)IRQ, (VI/VF)NMI, (V)FIQ and VSERR exceptions as interrupts
since they are, presumably, async in nature.
---
 contrib/plugins/traps.c   |  2 +-
 target/arm/helper.c       | 25 +++++++++++++++++++++++++
 target/arm/tcg/m_helper.c | 18 ++++++++++++++++++
 3 files changed, 44 insertions(+), 1 deletion(-)

diff --git a/contrib/plugins/traps.c b/contrib/plugins/traps.c
index ecd4beac5f..cdb503e499 100644
--- a/contrib/plugins/traps.c
+++ b/contrib/plugins/traps.c
@@ -87,7 +87,7 @@ int qemu_plugin_install(qemu_plugin_id_t id, const qemu_info_t *info,
     qemu_plugin_register_vcpu_init_cb(id, vcpu_init);
     qemu_plugin_vcpu_for_each(id, vcpu_init);
 
-    qemu_plugin_register_vcpu_discon_cb(id, QEMU_PLUGIN_DISCON_TRAPS,
+    qemu_plugin_register_vcpu_discon_cb(id, QEMU_PLUGIN_DISCON_ALL,
                                         vcpu_discon);
 
     qemu_plugin_register_atexit_cb(id, plugin_exit, NULL);
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f38eb054c0..57f274a037 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -31,6 +31,7 @@
 #endif
 #include "cpregs.h"
 #include "target/arm/gtimer.h"
+#include "qemu/plugin.h"
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
@@ -11166,6 +11167,25 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
     }
 }
 
+static void arm_do_plugin_vcpu_interrupt_cb(CPUState *cs, uint64_t from,
+                                            uint64_t to)
+{
+    switch (cs->exception_index) {
+    case EXCP_IRQ:
+    case EXCP_VIRQ:
+    case EXCP_NMI:
+    case EXCP_VINMI:
+    case EXCP_FIQ:
+    case EXCP_VFIQ:
+    case EXCP_VFNMI:
+    case EXCP_VSERR:
+        qemu_plugin_vcpu_interrupt_cb(cs, from, to);
+        break;
+    default:
+        qemu_plugin_vcpu_exception_cb(cs, from, to);
+    }
+}
+
 static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
 {
     /*
@@ -11822,6 +11842,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     ARMCPU *cpu = ARM_CPU(cs);
     CPUARMState *env = &cpu->env;
     unsigned int new_el = env->exception.target_el;
+    uint64_t last_pc = env->pc;
 
     assert(!arm_feature(env, ARM_FEATURE_M));
 
@@ -11838,6 +11859,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     if (tcg_enabled() && arm_is_psci_call(cpu, cs->exception_index)) {
         arm_handle_psci_call(cpu);
         qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
+        qemu_plugin_vcpu_hostcall_cb(cs, last_pc, env->pc);
         return;
     }
 
@@ -11849,6 +11871,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
 #ifdef CONFIG_TCG
     if (cs->exception_index == EXCP_SEMIHOST) {
         tcg_handle_semihosting(cs);
+        qemu_plugin_vcpu_hostcall_cb(cs, last_pc, env->pc);
         return;
     }
 #endif
@@ -11874,6 +11897,8 @@ void arm_cpu_do_interrupt(CPUState *cs)
     if (!kvm_enabled()) {
         cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
     }
+
+    arm_do_plugin_vcpu_interrupt_cb(cs, last_pc, env->pc);
 }
 #endif /* !CONFIG_USER_ONLY */
 
diff --git a/target/arm/tcg/m_helper.c b/target/arm/tcg/m_helper.c
index f7354f3c6e..3a8b55db82 100644
--- a/target/arm/tcg/m_helper.c
+++ b/target/arm/tcg/m_helper.c
@@ -24,6 +24,7 @@
 #if !defined(CONFIG_USER_ONLY)
 #include "hw/intc/armv7m_nvic.h"
 #endif
+#include "qemu/plugin.h"
 
 static void v7m_msr_xpsr(CPUARMState *env, uint32_t mask,
                          uint32_t reg, uint32_t val)
@@ -2186,6 +2187,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
     CPUARMState *env = &cpu->env;
     uint32_t lr;
     bool ignore_stackfaults;
+    uint64_t last_pc = env->pc;
 
     arm_log_exception(cs);
 
@@ -2353,6 +2355,7 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
         g_assert_not_reached();
 #endif
         env->regs[15] += env->thumb ? 2 : 4;
+        qemu_plugin_vcpu_hostcall_cb(cs, last_pc, env->pc);
         return;
     case EXCP_BKPT:
         armv7m_nvic_set_pending(env->nvic, ARMV7M_EXCP_DEBUG, false);
@@ -2419,6 +2422,21 @@ void arm_v7m_cpu_do_interrupt(CPUState *cs)
 
     ignore_stackfaults = v7m_push_stack(cpu);
     v7m_exception_taken(cpu, lr, false, ignore_stackfaults);
+
+    switch (cs->exception_index) {
+    case EXCP_IRQ:
+    case EXCP_VIRQ:
+    case EXCP_NMI:
+    case EXCP_VINMI:
+    case EXCP_FIQ:
+    case EXCP_VFIQ:
+    case EXCP_VFNMI:
+    case EXCP_VSERR:
+        qemu_plugin_vcpu_interrupt_cb(cs, last_pc, env->pc);
+        break;
+    default:
+        qemu_plugin_vcpu_exception_cb(cs, last_pc, env->pc);
+    }
 }
 
 uint32_t HELPER(v7m_mrs)(CPUARMState *env, uint32_t reg)
-- 
2.45.2
