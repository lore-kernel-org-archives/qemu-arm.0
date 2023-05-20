Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp276688ejb;
        Sat, 20 May 2023 09:29:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6BQ0C2y0vMB1qbn4EhH1J1PcS29x1OIvAOjUGl+g/NQwJ70wxFtxwPxjloSj/U0Ftp6UXJ
X-Received: by 2002:a05:622a:64e:b0:3e3:7e6f:423c with SMTP id a14-20020a05622a064e00b003e37e6f423cmr8876235qtb.34.1684600163259;
        Sat, 20 May 2023 09:29:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684600163; cv=none;
        d=google.com; s=arc-20160816;
        b=jzyZl/ZS5PR9GNEoedKgEtkXIUg7dsX8wuAzdWlzeF3v3u6yB1FY2tIx0Kzw6WZwBE
         LLfFoBexix2bj5dvwXnnbDJe2DVhcGW7a4FjaEbgt9jdIBdxrq8ayVAi0hagd4r8JB69
         K3ffJbWcshjw6wmHY3hlO+s0ZqbuDE5Xf+eb9C6tJYSpiPuecw2uI8mj6gAuBEjegATJ
         D4AVCU/edOgORJkWiWqbSmm0lqxw8rlwDR3hnto/TQSKduFcZs8w+vAcofflTjf6Fw2Y
         XCH+Y7j++gJSUS9qYWBt65tHCzaVTKgSI6jUZ+B/aD+ud2WSMc43+MtGHz9f56MTYVWQ
         DoYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=wlUqj841x578nzMKn5ImdhcaDhdsmsJg4wjQFvgryxE=;
        b=MXbdaVQUapbOHUnL/g9OnqGA9Id6wFSGEhEp4/liFHGZRtt9yAcbN/Y1lFqCwC3VEJ
         ggyRIqDNpfLxs5YdMUs+e4S6alwdqQk0kRfggzUaQ9HkmpW+s8WryyAXjSVZRpIW9J3+
         DV9m5eFDgJ50X3eTn+UVi4dsCh/n5cmSvUTDmG8P/PdA0bVcwu9DJrDApGqh37OaFECS
         u+cBfXXg6ZUqNed7R1WEQUwPbMMef5afkmmhKMMRInPCgjMMPNSCno+rGYCdD8YNvkMa
         ySX4lTmPHpSA41+WJiS+r8s1zp/qv8jpQSTHLz7J+chcYtcxaX+LP33zG2vkGmZhDaq+
         D/rw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AdVsLY18;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p24-20020a05620a113800b00746b9ee425fsi1044799qkk.29.2023.05.20.09.29.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 May 2023 09:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AdVsLY18;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0PPm-0003WK-Te; Sat, 20 May 2023 12:26:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PPm-0003Vz-97
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:26:42 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q0PPj-00034N-JO
 for qemu-arm@nongnu.org; Sat, 20 May 2023 12:26:42 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1ae6b4c5a53so20063645ad.2
 for <qemu-arm@nongnu.org>; Sat, 20 May 2023 09:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684599998; x=1687191998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wlUqj841x578nzMKn5ImdhcaDhdsmsJg4wjQFvgryxE=;
 b=AdVsLY18YJRkO0YFsCpCabtaphGX1HNg/d16gnu0nM+82yihUeUwpJvb8cIkt9vZDJ
 jheJS6o49BuXyHfzf8A3qH7eyNITu6irGuUn3lSlXKF4DpxaQHeIAb5SW8RYzygqHuU1
 ZAgoIgQlsVykpO/zgDlyo5jwSq5bUvCca4aQBKQ6gnm6zvmf04+0OIPPJx/xpgvrhfNp
 MTHe+YhU8Vi0dP3+WvyEdqlVYyhru4zgjVxogD5V5F1aUtHREbUfjFwuVcjkW1CxNchd
 cCZA0LST9B8MNMRyuS0QFUPrBXQ1IAp//BPJF2pZWzhnjW/WsQaYr8DcRqI+33QHxlIO
 HlNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684599998; x=1687191998;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wlUqj841x578nzMKn5ImdhcaDhdsmsJg4wjQFvgryxE=;
 b=mGBgmJNzcIUUJaH8MgG1pXayGKxd8Vd862oVMQn6KHSYajPeFy+pcCkd/GkkTOOvwm
 qcScyzM56cPzFVVz24quE9Kbb+aPTeQ27QDKlPdZN71Mo6gWdRevtkodLWm2vkr+1wOD
 Ddw6HMvdRyksPb2QAOf6ITGGs7L940rYWgGdyVDlz1wP/sNMnRmK1jvw7xI6WeuFw6BP
 184gI799eKDPzqjrZu0fZvJR/XgevwEkvLq6tzVkMLwgKUMGZd0fMyoHr18ulbBVtPz7
 tJjIyJxrC0FND6Qh6MJHvSCysd/7aKQrLPqy7/SNMRjRK4R1gqdMZZmtFYXRW/BOlqPs
 Fxbg==
X-Gm-Message-State: AC+VfDwv0cKCfJpLhqErUPBsapJ4RZuuYsZy3zmnNE4L9/k7W3BTpeWB
 b378DsyryGX+YKloWHNWqk2ak1+9xl8xyiXaWq8=
X-Received: by 2002:a17:902:eccc:b0:1ae:8741:d1d9 with SMTP id
 a12-20020a170902eccc00b001ae8741d1d9mr5515732plh.17.1684599998154; 
 Sat, 20 May 2023 09:26:38 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:d078:d94e:cb2b:a055])
 by smtp.gmail.com with ESMTPSA id
 d12-20020a170903230c00b001a5260a6e6csm1697104plh.206.2023.05.20.09.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 09:26:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Juan Quintela <quintela@redhat.com>
Subject: [PATCH 02/27] util: Add cpuinfo-i386.c
Date: Sat, 20 May 2023 09:26:09 -0700
Message-Id: <20230520162634.3991009-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230520162634.3991009-1-richard.henderson@linaro.org>
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: W+zUgtOqw72U

Add cpuinfo.h for i386 and x86_64, and the initialization
for that in util/.  Populate that with a slightly altered
copy of the tcg host probing code.  Other uses of cpuid.h
will be adjusted one patch at a time.

Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/i386/host/cpuinfo.h   | 38 ++++++++++++
 host/include/x86_64/host/cpuinfo.h |  1 +
 util/cpuinfo-i386.c                | 97 ++++++++++++++++++++++++++++++
 util/meson.build                   |  4 ++
 4 files changed, 140 insertions(+)
 create mode 100644 host/include/i386/host/cpuinfo.h
 create mode 100644 host/include/x86_64/host/cpuinfo.h
 create mode 100644 util/cpuinfo-i386.c

diff --git a/host/include/i386/host/cpuinfo.h b/host/include/i386/host/cpuinfo.h
new file mode 100644
index 0000000000..e6f7461378
--- /dev/null
+++ b/host/include/i386/host/cpuinfo.h
@@ -0,0 +1,38 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Host specific cpu indentification for x86.
+ */
+
+#ifndef HOST_CPUINFO_H
+#define HOST_CPUINFO_H
+
+/* Digested version of <cpuid.h> */
+
+#define CPUINFO_ALWAYS          (1u << 0)  /* so cpuinfo is nonzero */
+#define CPUINFO_CMOV            (1u << 1)
+#define CPUINFO_MOVBE           (1u << 2)
+#define CPUINFO_LZCNT           (1u << 3)
+#define CPUINFO_POPCNT          (1u << 4)
+#define CPUINFO_BMI1            (1u << 5)
+#define CPUINFO_BMI2            (1u << 6)
+#define CPUINFO_SSE2            (1u << 7)
+#define CPUINFO_SSE4            (1u << 8)
+#define CPUINFO_AVX1            (1u << 9)
+#define CPUINFO_AVX2            (1u << 10)
+#define CPUINFO_AVX512F         (1u << 11)
+#define CPUINFO_AVX512VL        (1u << 12)
+#define CPUINFO_AVX512BW        (1u << 13)
+#define CPUINFO_AVX512DQ        (1u << 14)
+#define CPUINFO_AVX512VBMI2     (1u << 15)
+#define CPUINFO_ATOMIC_VMOVDQA  (1u << 16)
+
+/* Initialized with a constructor. */
+extern unsigned cpuinfo;
+
+/*
+ * We cannot rely on constructor ordering, so other constructors must
+ * use the function interface rather than the variable above.
+ */
+unsigned cpuinfo_init(void);
+
+#endif /* HOST_CPUINFO_H */
diff --git a/host/include/x86_64/host/cpuinfo.h b/host/include/x86_64/host/cpuinfo.h
new file mode 100644
index 0000000000..67debab9a0
--- /dev/null
+++ b/host/include/x86_64/host/cpuinfo.h
@@ -0,0 +1 @@
+#include "host/include/i386/host/cpuinfo.h"
diff --git a/util/cpuinfo-i386.c b/util/cpuinfo-i386.c
new file mode 100644
index 0000000000..434319aa71
--- /dev/null
+++ b/util/cpuinfo-i386.c
@@ -0,0 +1,97 @@
+/*
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Host specific cpu indentification for x86.
+ */
+
+#include "qemu/osdep.h"
+#include "host/cpuinfo.h"
+#ifdef CONFIG_CPUID_H
+# include "qemu/cpuid.h"
+#endif
+
+unsigned cpuinfo;
+
+/* Called both as constructor and (possibly) via other constructors. */
+unsigned __attribute__((constructor)) cpuinfo_init(void)
+{
+    unsigned info = cpuinfo;
+
+    if (info) {
+        return info;
+    }
+
+#ifdef CONFIG_CPUID_H
+    unsigned max, a, b, c, d, b7 = 0, c7 = 0;
+
+    max = __get_cpuid_max(0, 0);
+
+    if (max >= 7) {
+        __cpuid_count(7, 0, a, b7, c7, d);
+        info |= (b7 & bit_BMI ? CPUINFO_BMI1 : 0);
+        info |= (b7 & bit_BMI2 ? CPUINFO_BMI2 : 0);
+    }
+
+    if (max >= 1) {
+        __cpuid(1, a, b, c, d);
+
+        info |= (d & bit_CMOV ? CPUINFO_CMOV : 0);
+        info |= (d & bit_SSE2 ? CPUINFO_SSE2 : 0);
+        info |= (c & bit_SSE4_1 ? CPUINFO_SSE4 : 0);
+        info |= (c & bit_MOVBE ? CPUINFO_MOVBE : 0);
+        info |= (c & bit_POPCNT ? CPUINFO_POPCNT : 0);
+
+        /* For AVX features, we must check available and usable. */
+        if ((c & bit_AVX) && (c & bit_OSXSAVE)) {
+            unsigned bv = xgetbv_low(0);
+
+            if ((bv & 6) == 6) {
+                info |= CPUINFO_AVX1;
+                info |= (b7 & bit_AVX2 ? CPUINFO_AVX2 : 0);
+
+                if ((bv & 0xe0) == 0xe0) {
+                    info |= (b7 & bit_AVX512F ? CPUINFO_AVX512F : 0);
+                    info |= (b7 & bit_AVX512VL ? CPUINFO_AVX512VL : 0);
+                    info |= (b7 & bit_AVX512BW ? CPUINFO_AVX512BW : 0);
+                    info |= (b7 & bit_AVX512DQ ? CPUINFO_AVX512DQ : 0);
+                    info |= (c7 & bit_AVX512VBMI2 ? CPUINFO_AVX512VBMI2 : 0);
+                }
+
+                /*
+                 * The Intel SDM has added:
+                 *   Processors that enumerate support for Intel® AVX
+                 *   (by setting the feature flag CPUID.01H:ECX.AVX[bit 28])
+                 *   guarantee that the 16-byte memory operations performed
+                 *   by the following instructions will always be carried
+                 *   out atomically:
+                 *   - MOVAPD, MOVAPS, and MOVDQA.
+                 *   - VMOVAPD, VMOVAPS, and VMOVDQA when encoded with VEX.128.
+                 *   - VMOVAPD, VMOVAPS, VMOVDQA32, and VMOVDQA64 when encoded
+                 *     with EVEX.128 and k0 (masking disabled).
+                 * Note that these instructions require the linear addresses
+                 * of their memory operands to be 16-byte aligned.
+                 *
+                 * AMD has provided an even stronger guarantee that processors
+                 * with AVX provide 16-byte atomicity for all cachable,
+                 * naturally aligned single loads and stores, e.g. MOVDQU.
+                 *
+                 * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=104688
+                 */
+                __cpuid(0, a, b, c, d);
+                if (c == signature_INTEL_ecx || c == signature_AMD_ecx) {
+                    info |= CPUINFO_ATOMIC_VMOVDQA;
+                }
+            }
+        }
+    }
+
+    max = __get_cpuid_max(0x8000000, 0);
+    if (max >= 1) {
+        __cpuid(0x80000001, a, b, c, d);
+        info |= (c & bit_LZCNT ? CPUINFO_LZCNT : 0);
+    }
+#endif
+
+    info |= CPUINFO_ALWAYS;
+    cpuinfo = info;
+    return info;
+}
diff --git a/util/meson.build b/util/meson.build
index e1f1c39e10..b3be9fad5d 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -108,3 +108,7 @@ if have_block
   endif
   util_ss.add(when: 'CONFIG_LINUX', if_true: files('vfio-helpers.c'))
 endif
+
+if cpu in ['x86', 'x86_64']
+  util_ss.add(files('cpuinfo-i386.c'))
+endif
-- 
2.34.1

