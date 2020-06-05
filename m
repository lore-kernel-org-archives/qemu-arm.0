Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2074145lfc;
        Thu, 4 Jun 2020 21:21:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzy0G5rfftpThZ1RvZUrh+gtQT+ZOGMfLVcMPFnPdWtSkNi7ERqGQQFjfPE1DPYXSRKbjj7
X-Received: by 2002:a25:b942:: with SMTP id s2mr12624189ybm.437.1591330881589;
        Thu, 04 Jun 2020 21:21:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591330881; cv=none;
        d=google.com; s=arc-20160816;
        b=E8RcHbvh36ajxttetamsNjjtyvfKvF/Wv/aqaF2DUXdoI412WOXCyxSnUZUU2Yv0kp
         uO4qR2efIAP/GUriwux1WIu6IYJhsxlpTqZKNlSYTJ54zy0poIUvoLN9/M4TOoNB/wLg
         luBsIvk6A1na1TEJaF5Q1nrja56q72SxkvzbUAzrfTXuUp9BJwyFqeu355eHkDC06L+O
         mwKRrYDQlLBORleJWwZVH24VttMgrOVaKgxS7lwc9YI7LOYqYELxHVABvMEltOaBlTtK
         l1mGHyUCsJbt1TUoRDIW7xuTEqAD1MNfcInYLjGltvd0ibXgr7DxR5ezskRm7AOnT8qE
         k1lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=nCxIirgN5OzmYmJJvTz1Ncldrcyg3LSoeyCRUE7/tl0=;
        b=0FUTW+Xw5ryVTIGh4+bLzJA1U37xvhnY1S/qifNEwfkXj+xCknu/W44qq8iyLWlVu4
         ZaZLFUZmU0QBjMp4gaKpqwaFZy17AUpj2uABwxfTNknCzRn5rPmGOptbR6At7NctvIpd
         IA4w0y19VAG2BZq+J43oq7qac0HHjtxoYf7xhFus9AGHAnjWQyjk1xjM/WtOCIxa9J8u
         Slx88UrlK2lPrChXde3a6Dvd6aq1R3OwB9j3fGiYdaX8zw3Ya5VmefKjWduieueZSQTz
         Skdc4+waNVwpT3QgRziC+LftGZX5ZlgZ+rV1+iRbs4AWrO6k5br1A+qhozjOG0xwAhJk
         SoNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YxMROiUm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i83si6068642ybg.25.2020.06.04.21.21.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 21:21:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YxMROiUm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh3r6-0004IG-Sy
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 00:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3nf-0004Ty-5b
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:47 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:54923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3ne-0000kc-5D
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:46 -0400
Received: by mail-pj1-x1043.google.com with SMTP id nm22so2053015pjb.4
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2020 21:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nCxIirgN5OzmYmJJvTz1Ncldrcyg3LSoeyCRUE7/tl0=;
 b=YxMROiUmSMWoMRilm0Ow7tHnIWiDyjBi33Ml7dfIqbCZtEUDsT+NFO9ubOAnOb0WE3
 uBB5vDn6D6ta07XlPURgTyJW7kDEklNuHOr6eYuE7jg7kAbZYBRxGtvuJxRKEC6wRsa1
 2Ue0vfJsJXvw1ctA1QOLZDpPztNkwBao6fUlaRzBNJSjj/ruCMXvPZLH6itcx6pu5qko
 ner6WCZamoZZrIUlVR+FkGMfZXdK3wKzYc2P+/xh888lQsRVawCZ/RrnHsmRHZI/ZtN8
 t8WqwqM9ne333TErHpYu+n3naILGXfYnGugrK5UAjjzSEwzcgT0rXCGhSP5UBGbn141p
 0OKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nCxIirgN5OzmYmJJvTz1Ncldrcyg3LSoeyCRUE7/tl0=;
 b=bDRDRK1Uxc4P8BwFtbFBgcpiEQNxlqoL/yEwa7P0vO8u4BXaAWi4TJOz6M1lZekpcT
 ypB0s3KQsC0ripcFGLwRV3PFbLcbe45pLo6a7P4yt/fL3zlzebsMdoY3dgBCFR+wMMgL
 p4bmmUma7K7Cy53JZ7LTo+orx4jl5zuXRKcLqrKMqo8vv1X+/XlRXBhC/Rt5N2HxpaT0
 0dbJUSRlXb8I7IhbifCx8rF8Y/YufqloSDIgcnkccOP7CtPHKgSbzAKLIXEtU6O0EIKF
 DY896PhHD+bf9gnVK/2As9A0DjxZ34I8YGqXZisOErTE20zNJiLc6cpn9CqXszwx6vq6
 9OIw==
X-Gm-Message-State: AOAM5320a1H1booA5oUkE+0ER71Tr9pJX23+Uu2uhRXGr4a1P5zB6Cks
 EXecMGo8v3DpmT+6r3qZ0JS0Dw==
X-Received: by 2002:a17:90a:6047:: with SMTP id
 h7mr738751pjm.145.1591330664883; 
 Thu, 04 Jun 2020 21:17:44 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h15sm5440902pgl.12.2020.06.04.21.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 21:17:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/17] exec: Add support for TARGET_TAGGED_ADDRESSES
Date: Thu,  4 Jun 2020 21:17:24 -0700
Message-Id: <20200605041733.415188-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200605041733.415188-1-richard.henderson@linaro.org>
References: <20200605041733.415188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FnxMkwEm/PsH

The AArch64 Linux ABI has always enabled TBI, but has historically
required that pointer tags be removed before a syscall.  This has
changed in the lead-up to ARMv8.5-MTE, in a way that affects the
ABI generically and not specifically to MTE.

This patch allows the target to indicate that (1) there are tags
and (2) whether or not they should be taken into account at the
syscall level.

Adjust g2h, guest_addr_valid, and guest_range_valid to ignore
pointer tags, similar to how TIF_TAGGED_ADDR alters __range_ok
in the arm64 kernel source.

The prctl syscall is not not yet updated, so this change by itself
has no visible effect.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu_ldst.h | 22 ++++++++++++++++++----
 target/arm/cpu-param.h  |  3 +++
 bsd-user/main.c         |  5 +++++
 linux-user/main.c       |  5 +++++
 4 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index 066cf33f70..d84847dc70 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -69,17 +69,31 @@ typedef uint64_t abi_ptr;
 #define TARGET_ABI_FMT_ptr "%"PRIx64
 #endif
 
+#ifdef TARGET_TAGGED_ADDRESSES
+extern abi_ptr untagged_addr_mask;
+static inline abi_ptr untagged_addr(abi_ptr x)
+{
+    return x & untagged_addr_mask;
+}
+#else
+static inline abi_ptr untagged_addr(abi_ptr x) { return x; }
+#endif
+
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
-#define g2h(x) ((void *)((unsigned long)(abi_ptr)(x) + guest_base))
+static inline void *g2h(abi_ptr x)
+{
+    return (void *)(uintptr_t)(untagged_addr(x) + guest_base);
+}
 
 static inline bool guest_addr_valid(abi_ptr x)
 {
-    return x <= GUEST_ADDR_MAX;
+    return untagged_addr(x) <= GUEST_ADDR_MAX;
 }
 
-static inline int guest_range_valid(unsigned long start, unsigned long len)
+static inline bool guest_range_valid(abi_ptr start, abi_ulong len)
 {
-    return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
+    return len - 1 <= GUEST_ADDR_MAX &&
+           untagged_addr(start) <= GUEST_ADDR_MAX - len + 1;
 }
 
 #define h2g_valid(x)  ((uintptr_t)(x) - guest_base <= GUEST_ADDR_MAX)
diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
index 6321385b46..f922aa0650 100644
--- a/target/arm/cpu-param.h
+++ b/target/arm/cpu-param.h
@@ -20,6 +20,9 @@
 
 #ifdef CONFIG_USER_ONLY
 #define TARGET_PAGE_BITS 12
+# ifdef TARGET_AARCH64
+#  define TARGET_TAGGED_ADDRESSES
+# endif
 #else
 /*
  * ARMv7 and later CPUs have 4K pages minimum, but ARMv5 and v6
diff --git a/bsd-user/main.c b/bsd-user/main.c
index 0bfe46cff9..87c99fc6c2 100644
--- a/bsd-user/main.c
+++ b/bsd-user/main.c
@@ -45,6 +45,11 @@ unsigned long guest_base;
 bool have_guest_base;
 unsigned long reserved_va;
 
+#ifdef TARGET_TAGGED_ADDRESSES
+/* Default to no tagged addresses, i.e. all pointer bits valid.  */
+abi_ptr untagged_addr_mask = -1;
+#endif
+
 static const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;
 const char *qemu_uname_release;
 extern char **environ;
diff --git a/linux-user/main.c b/linux-user/main.c
index 3597e99bb1..8fcca3f5f1 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -103,6 +103,11 @@ static int last_log_mask;
 
 unsigned long reserved_va;
 
+#ifdef TARGET_TAGGED_ADDRESSES
+/* Default to no tagged addresses, i.e. all pointer bits valid.  */
+abi_ptr untagged_addr_mask = -1;
+#endif
+
 static void usage(int exitcode);
 
 static const char *interp_prefix = CONFIG_QEMU_INTERP_PREFIX;
-- 
2.25.1

