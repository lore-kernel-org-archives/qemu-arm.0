Received: by 2002:a17:906:3fc4:b0:a04:79f0:9a0e with SMTP id k4csp149691ejj;
        Wed, 22 Nov 2023 20:43:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJ0h9S8NzvEwkF1ZI6HWVreROmMRpQZZwE7z0agWTXbI6roRTUS3yCIR4o+l6EFvoQxlKo
X-Received: by 2002:ac8:5a13:0:b0:423:6d73:8e69 with SMTP id n19-20020ac85a13000000b004236d738e69mr5978826qta.54.1700714605040;
        Wed, 22 Nov 2023 20:43:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700714605; cv=none;
        d=google.com; s=arc-20160816;
        b=AE8WhVqs8qP4M2OdyELkXDNw1IQQ5Cya3MM9lHTQldnFiLS0VeDvmQgsr7ZnzSyu8U
         vTrvW2zBxL26hdXkFktL4+wpwgtVEOlGsu5bSiI4VPJB9lJZKYyjxP1BA+/FJredDy51
         tLT54sQiRVw3QxnNFptWj2Te34l3jgxEsILFg7ZFb7k2KTXQYP33UUSOTqXl3g94XjWf
         1rnJYFxa/oYPhN66WjfyXnf9YecgdNbAYhKhqUuftsn/1ecesgUvzu6rOf7zXTF1uZcR
         +3qlJZgmrmverpX1k2VPe1FQWjfRTRJR6x+5YEzWf7HmEB7EdfueaWV3bYk8cfZy6qyj
         PIIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zCITuvk4f7RVKkgdoPWw8dDcnr4IYcKR0RlzuYraGn4=;
        fh=EaNc0ujBQMxPylavkxNieUjGC72IBPs3/7TWuJnbw5Q=;
        b=lzTWrtMdYNyovOYkxS0wColJ2t1OvweWjOUuVjzaQrHX3C6FUUWjI3Np4lqRCTK302
         WMGgdOSsOaqRPUA2Mp294ycmv6JssWsajUMTkl1lugUKFnYV/bm65aYL4VkavY/on2dd
         RA945wumpKLrdzC6LxeHKh5iYdQc05E0tqZr4lgu3Jg8NHLSfLIr3aQrqjlnw0cKeugj
         iA9BJhyI1pMhDnJJ3Hnc3mHhRvzUViGJMEnisGfnes78vVIQ5/JPaL9g4XcJ/w0/9cOb
         8QQb7iev11VIiDHvIqMEIn6zFk9Gc/Q6GACAsUEvnPt7JFD+ZM0WpzaWoAGX8Ijdx+Pg
         ufnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IS3APXVa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q17-20020a05622a04d100b004236f52ea2bsi433754qtx.321.2023.11.22.20.43.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Nov 2023 20:43:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IS3APXVa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r61Xo-0006L3-Pb; Wed, 22 Nov 2023 23:42:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Xn-0006Ij-D8
 for qemu-devel@nongnu.org; Wed, 22 Nov 2023 23:42:27 -0500
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1r61Xl-00064t-8O
 for qemu-devel@nongnu.org; Wed, 22 Nov 2023 23:42:27 -0500
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1f0f94a08a0so340734fac.2
 for <qemu-devel@nongnu.org>; Wed, 22 Nov 2023 20:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700714543; x=1701319343; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zCITuvk4f7RVKkgdoPWw8dDcnr4IYcKR0RlzuYraGn4=;
 b=IS3APXVaoAlhTUnhHb5VPTqDUrh+PJ5Pscz+3UME/Ba/XLDwxk5G/4L2LCn5wDEwih
 w1jQjql0QmLjMf8Y8mUBp2ppCtbdFbiYFqwHdYwpgmMe5lXfXSU/970x/b71R0xKcRlf
 ld/nwEl77Eq+sR1YMCjynAgmRZ0ix0HqS3kFZL+y1q+0pHP6oba7En5r+sPLw3Xjfv1b
 RkidTOmzwAmIHA/YN3qh8Uuz8ki8wuYc7Iuu4TTGUWUesnMv1ucUNibUtGkx1ZGofML0
 +aoxux6qtNGCzAwocCximkH7J+RRZ6WHNtiN4vTA/W+RjEemvRRF7KBW+DQA5KWwTg/Z
 9yzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700714543; x=1701319343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zCITuvk4f7RVKkgdoPWw8dDcnr4IYcKR0RlzuYraGn4=;
 b=rpt8QXP8yOcJ1FvDD9wIZ+RVdumOD676Y9GNYAdan4mq0MbqmkCSxNaka+HJvcXhOx
 uiHZjj4W3Z0Oc77K6IAkFX08j/g7DiE1+QDYJt73ZNwu0PLY7lt0vKPBOj6VZCGjry+I
 eYGVrIpoIl1+QtqbRsSXG/IyBM23lUbPLM9AiejcUNrAsQLcaD8hED/OGzPVRu/9BJSC
 yIKP0J9XUIH1YKf3HhhwriLnMBkjYbQlcYnmipXIDtgxGDwq4y2ehMWqbHJjRkaxOydN
 Cu+KwzmB761sHw7LWWef5cCcup+rA5/1ZKK9ZvsUf5TIUwjn4U7oFcyHJf5WcPA5djwS
 53RQ==
X-Gm-Message-State: AOJu0YwJxr1RcV2siOiMtsQI2F04qP5j9RcC7atH5rBEsKoeQatJoNFV
 0HBiPLA9yVJ197iYiCS9VKAFYAw+2U1yw7xQVZ/aTwF7
X-Received: by 2002:a05:6870:be8c:b0:1f5:7e47:e297 with SMTP id
 nx12-20020a056870be8c00b001f57e47e297mr6186991oab.11.1700714543289; 
 Wed, 22 Nov 2023 20:42:23 -0800 (PST)
Received: from stoup.. ([187.217.227.247]) by smtp.gmail.com with ESMTPSA id
 i7-20020a056808030700b003b8347de3c2sm73888oie.19.2023.11.22.20.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Nov 2023 20:42:22 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Chao Du <duchao@eswincomputing.com>
Subject: [PATCH 02/21] target/arm: kvm64: remove a redundant
 KVM_CAP_SET_GUEST_DEBUG probe
Date: Wed, 22 Nov 2023 22:42:00 -0600
Message-Id: <20231123044219.896776-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231123044219.896776-1-richard.henderson@linaro.org>
References: <20231123044219.896776-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2d.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: q//lLFcWy+bu

From: Chao Du <duchao@eswincomputing.com>

The KVM_CAP_SET_GUEST_DEBUG is probed during kvm_init().
gdbserver will fail to start if the CAP is not supported.
So no need to make another probe here, like other targets.

Signed-off-by: Chao Du <duchao@eswincomputing.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231025070726.22689-1-duchao@eswincomputing.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 3c175c93a7..b8bb25a1ea 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -32,13 +32,9 @@
 #include "hw/acpi/acpi.h"
 #include "hw/acpi/ghes.h"
 
-static bool have_guest_debug;
 
 void kvm_arm_init_debug(KVMState *s)
 {
-    have_guest_debug = kvm_check_extension(s,
-                                           KVM_CAP_SET_GUEST_DEBUG);
-
     max_hw_wps = kvm_check_extension(s, KVM_CAP_GUEST_DEBUG_HW_WPS);
     hw_watchpoints = g_array_sized_new(true, true,
                                        sizeof(HWWatchpoint), max_hw_wps);
@@ -1141,33 +1137,23 @@ static const uint32_t brk_insn = 0xd4200000;
 
 int kvm_arch_insert_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
-    if (have_guest_debug) {
-        if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0) ||
-            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
-            return -EINVAL;
-        }
-        return 0;
-    } else {
-        error_report("guest debug not supported on this kernel");
+    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0) ||
+        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
         return -EINVAL;
     }
+    return 0;
 }
 
 int kvm_arch_remove_sw_breakpoint(CPUState *cs, struct kvm_sw_breakpoint *bp)
 {
     static uint32_t brk;
 
-    if (have_guest_debug) {
-        if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk, 4, 0) ||
-            brk != brk_insn ||
-            cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 1)) {
-            return -EINVAL;
-        }
-        return 0;
-    } else {
-        error_report("guest debug not supported on this kernel");
+    if (cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&brk, 4, 0) ||
+        brk != brk_insn ||
+        cpu_memory_rw_debug(cs, bp->pc, (uint8_t *)&bp->saved_insn, 4, 1)) {
         return -EINVAL;
     }
+    return 0;
 }
 
 /* See v8 ARM ARM D7.2.27 ESR_ELx, Exception Syndrome Register
-- 
2.34.1

