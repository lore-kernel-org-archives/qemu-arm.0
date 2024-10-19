Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp1467457njb;
        Sat, 19 Oct 2024 09:40:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXd2Ar0kEWtAkW2xLf6uIRbFBQV589ZnLa9h8Du1T+/NDJmJfGoLFyXPkX0PjiIVai7W5SHs0EnHvVWEg==@linaro.org
X-Google-Smtp-Source: AGHT+IF4CljuvYf7GpQXlpDz/tB34/6FG/+1/nch195MXtI0gSWl1lsesUaPxKpH3UIu5xen7GFP
X-Received: by 2002:a05:6214:448b:b0:6cc:2c7c:92e2 with SMTP id 6a1803df08f44-6cde150c6b8mr108401006d6.18.1729356051420;
        Sat, 19 Oct 2024 09:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729356051; cv=none;
        d=google.com; s=arc-20240605;
        b=YpgBw0Mvc8spIajiat6I+Pr5V1G9zgIj5nakbpaO3U6yjw3+FBrpmvg2J590tc0niJ
         LafWWawK9quEZmS5/ZkyrLXUpGnE8Y1h7xbkLZSsJNauEgk6KnybcSh6h1trQH7Z8rS0
         i9TmnuSvMYqCUQisgGfJ7vi/F8xzJMPTUHRM/SAQuajQNLJ7Jrh9ymCdwLjQLb44StM3
         dMXAZ19A+jQ0JXi4datdaIALh5oP2p9hH3nv+NnAK+yO+kzAmLOgX+JXgrnX2rTKWFio
         njI+9HhcLUrZsJcJID2227Rk812NrP3dfAUy2plYkaCmMxK0OnBwK114FJpDMDrpIEAL
         dz4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:dkim-signature
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=x42lIcmUVyZlGqvs687ZhBwZtsjWBlBgbePtmcDnasg=;
        fh=imbpCNWr0c9cGotT0S0gK2Ku0NTEEh1/OS2/SvdfCmI=;
        b=hpKmmVt20Sn4Yxoa35co+3A2LEOt7xGfhzEtZd2CORo5pS6hVdgSpyEaT4H7aRdjo4
         iRxNkUvEPBMYnkIkv8pk3tmJGS8UAmAUZBLoZlPXuFiHKGUfkMVzWFGMXGe4jHbeDwfp
         /2uBpK3GbJ9FVdyX7xupKUuRgdP5zzer1mWvnAPzxMnFG3vM6JW32b+CvRNUoQSri3Jx
         8KGxIaExlCnbYh6+IuiEvJUfSZrQz9p8XCuPi7RruSC05ZXll6b4CPk7An+TP0DvBVQQ
         Bh4mXonJ/VZu1vzosaLvYBGxQuD8HQ80Gl1jCsEmV7woaJuGLv38dY4Phv9cA7eIuQiQ
         bJCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nut.email header.s=uberspace header.b=Dwzd9ejy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cde115cca3si45691926d6.175.2024.10.19.09.40.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 19 Oct 2024 09:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nut.email header.s=uberspace header.b=Dwzd9ejy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t2CUt-0001vT-AI; Sat, 19 Oct 2024 12:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <neither@nut.email>) id 1t2CUr-0001v7-76
 for qemu-devel@nongnu.org; Sat, 19 Oct 2024 12:40:09 -0400
Received: from mailgate02.uberspace.is ([185.26.156.114])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <neither@nut.email>) id 1t2CUo-0003h3-TD
 for qemu-devel@nongnu.org; Sat, 19 Oct 2024 12:40:08 -0400
Received: from skiff.uberspace.de (skiff.uberspace.de [185.26.156.131])
 by mailgate02.uberspace.is (Postfix) with ESMTPS id 02A3217F9F4
 for <qemu-devel@nongnu.org>; Sat, 19 Oct 2024 18:39:59 +0200 (CEST)
Received: (qmail 9771 invoked by uid 990); 19 Oct 2024 16:39:58 -0000
Authentication-Results: skiff.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
 by skiff.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Sat, 19 Oct 2024 18:39:58 +0200
From: Julian Ganz <neither@nut.email>
To: qemu-devel@nongnu.org
Cc: Julian Ganz <neither@nut.email>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [RFC PATCH v2 4/7] target/arm: call plugin trap callbacks
Date: Sat, 19 Oct 2024 18:39:37 +0200
Message-ID: <be4c64f56a4a7f25a2769c0eccd2ed6e1d8cb9ee.1729355735.git.neither@nut.email>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1729355735.git.neither@nut.email>
References: <20231021122502.26746-1-neither@nut.email>
 <cover.1729355735.git.neither@nut.email>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: -----
X-Rspamd-Report: REPLY(-4) BAYES_HAM(-2.83479) MID_CONTAINS_FROM(1)
 MIME_GOOD(-0.1) R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -5.43479
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nut.email; s=uberspace;
 h=from:to:cc:subject:date;
 bh=QW5b+c8GerXmJWDNBXe+kTqzYLQkqZ+V6ikpQTJsG78=;
 b=Dwzd9ejyKQW+iC6emONffpP14xKf6tH85Pp3LCf3wawqHFZHM/nrBRRrnN6hfpmuiG0hKnFrbS
 aG1W1P4Ng/k+3WOVGgNAt3JRZXw6nz1rIuhdLlJOvcdUxralJIuUsXx64Dle78VjR9ptrelCQcmn
 LmDZZW85shk1H1Aff2YA6d+aphCSSbLZeEPyyHU3btUfOl/drs/gwk+WEwQfRekg16p5xY3n80YR
 n7ODFibt+cbEiqIXAidJdKi0v0kB6VPAtBH6weFMhmnBMmb+nIwc/jVSPaSkh6khhELYYw7oZtLm
 MMk9JDzpl5FGJFSht3FqhYbiz5G/y+bUB2wolQxCr/PnSUWd+es1s3jlaCJ0kwkHT8hwa2Hld8vA
 lMGA25QrST6h39s4uABTlZYHCAk6/C8Wg+aIIKyYku+zyc7s7kOiq/R4vgjQOnz7NWxKbL7ZThQp
 I741x7rweD3RQn6YeMN3C3mKAWrEmEslDKMSBktaKbHpbAhQ54/ipb4FcnGq8PY6lDVPg3wunQHx
 1XhMKbYTo6wcOgh/wVD9o8gcj+E9shLe6UaSPuAS74gAtlpsxENLaTpGKmcMwFh//FaFTwNMzP+v
 IDSBExGb7Yiz7Im9VCZ6/CdnCCzhRvJ5+MrwCYtKHh5InX4ftzuAiZR0zDyD4KDHuImo3srsdA6E
 w=
Received-SPF: pass client-ip=185.26.156.114; envelope-from=neither@nut.email;
 helo=mailgate02.uberspace.is
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9FjKuEkmBndY

We recently introduced API for registering callbacks for trap related
events as well as the corresponding hook functions. Due to differences
between architectures, the latter need to be called from target specific
code.

This change places hooks for ARM (and Aarch64) targets. We decided to
treat the (V)IRQ, (VI/VF)NMI, (V)FIQ and VSERR exceptions as interrupts
since they are, presumably, async in nature.

Signed-off-by: Julian Ganz <neither@nut.email>
---
 target/arm/helper.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0a731a38e8..f636e216c8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -31,6 +31,7 @@
 #endif
 #include "cpregs.h"
 #include "target/arm/gtimer.h"
+#include "qemu/plugin.h"
 
 #define ARM_CPU_FREQ 1000000000 /* FIXME: 1 GHz, should be configurable */
 
@@ -11147,6 +11148,24 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
     }
 }
 
+static void arm_do_plugin_vcpu_interrupt_cb(CPUState *cs)
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
+        qemu_plugin_vcpu_interrupt_cb(cs);
+        break;
+    default:
+        qemu_plugin_vcpu_exception_cb(cs);
+    }
+}
+
 static void arm_cpu_do_interrupt_aarch32_hyp(CPUState *cs)
 {
     /*
@@ -11819,6 +11838,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
     if (tcg_enabled() && arm_is_psci_call(cpu, cs->exception_index)) {
         arm_handle_psci_call(cpu);
         qemu_log_mask(CPU_LOG_INT, "...handled as PSCI call\n");
+        arm_do_plugin_vcpu_interrupt_cb(cs);
         return;
     }
 
@@ -11830,6 +11850,7 @@ void arm_cpu_do_interrupt(CPUState *cs)
 #ifdef CONFIG_TCG
     if (cs->exception_index == EXCP_SEMIHOST) {
         tcg_handle_semihosting(cs);
+        qemu_plugin_vcpu_semihosting_cb(cs);
         return;
     }
 #endif
@@ -11855,6 +11876,8 @@ void arm_cpu_do_interrupt(CPUState *cs)
     if (!kvm_enabled()) {
         cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
     }
+
+    arm_do_plugin_vcpu_interrupt_cb(cs);
 }
 #endif /* !CONFIG_USER_ONLY */
 
-- 
2.45.2

