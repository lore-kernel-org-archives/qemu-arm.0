Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp630009lfo;
        Thu, 28 Jan 2021 15:00:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwJoLtKyc3FKfJXcDf1UFIDX4gkGKzazguJQe1KJEcuIts3LhgMx6Naz8z/6UYaVTdLQwGy
X-Received: by 2002:a25:1645:: with SMTP id 66mr2114160ybw.238.1611874801089;
        Thu, 28 Jan 2021 15:00:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611874801; cv=none;
        d=google.com; s=arc-20160816;
        b=o2oggENjhUYfOB7aUzDjwWK3/9QERQys4zbtFhy0uGYTfKyDrU5vpFtcSTGKlp5Y2f
         sYtLhS0GxEjDGSkMv4VMgjvopTauWlHnF9TgL+DBMF7xKzKdQu+0neRzB5C9IhrzxvY7
         ZDdyJzR2dWJZpWKknyl4oUV8W2xN8FQU2Zj4cVNnMxanEKlviipsSi9CCvn4uhnz4WhG
         LkWdTQ32S6gb1JweizPr5aHnMr/f3g87MBGOQjwrTSys4HAK7hrlLFbBfr5lkV1DRGsU
         vcBAgsG7y3JpduuQKJiGCH+O4O6LT/WJXsMFIR2X+Kh9PAiDRYcVOL71O8TN8t12Et7s
         RpLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=X+LaZKuwwsvEvbJ+r5ztAOZO016eLRKSU8aYWIJf1AQ=;
        b=r6ou5uHy7GbpgwxlkfcxQJfeqaxDdRWEjuOJ8YwLQ5+aWiZBi41Vf7yUPewq91Le34
         v4jor38OsTcIOy5sbGTw59kim2uh06+Zqb8YUSPBpaWrcSzFgruJKU8Nr5HgOvmIZsrH
         5m+yozwWKCJzkBLoqaONnPgW/7r1BCbyCbGpZsAgRKRpW0MEceyzUnhR8vm5G0R7aI9+
         wbYQck/LHFMdGk3jkK98fKUQU9kbpXQdfl/FPQLQwzZWrRpoBnpgozZkIOhM9LDcHkt+
         D6YeDm4rblB458+meFsfcjkyRT9OLhY0CzpgR63UVSVm3AeBN5vBz5lgReYx1cposd6n
         7a9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FLojX3ix;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s13si6365992ybm.152.2021.01.28.15.00.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 15:00:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=FLojX3ix;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5GGe-0007FV-Ce
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 18:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzS-0005ZS-GV
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:42:15 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e]:40646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l5FzI-00089K-CV
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 17:42:14 -0500
Received: by mail-pj1-x102e.google.com with SMTP id jx18so5244457pjb.5
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 14:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+LaZKuwwsvEvbJ+r5ztAOZO016eLRKSU8aYWIJf1AQ=;
 b=FLojX3ixA2yr6qJk8jYuO88bLmrIyoPpSgF02ee9VcqomnUs/FTBOJA0xeHzhF1gSK
 GlhwJZQ5QwBbfCE4UH5m22DPj84x47SVcdZGQDfskbT8Y09V/ZIts/pGOEd/E3sTQjxk
 NHa8aFWn8obcD+G2ApgvQL8CImzytrk47EFVdtt4zvVJMK4B6z2CU60/SjhTF2ANHiOv
 0bchzib+5SCXPv1jvkOdS9HIBM5XvntEcmrWdrzQxFiS3B+yL0B6hdRmBMItm7Okk/97
 PktnWWqEe8wnn1T0kNOwG1rF5LrQgBtw3gqH2ETkCRDPUh7LE40ihOd6Glxs1D/MlDRI
 0VGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X+LaZKuwwsvEvbJ+r5ztAOZO016eLRKSU8aYWIJf1AQ=;
 b=duusV2OawFrBQ3I99VRSBYGRGGB0j1x6oFf2hCV7K3Q52Sc4/SWXojK6tjeCSxk0eF
 z5NjaAtxoCl2mlCZlAa7QlUBR/ZttoN1IOEZFCWR7t9YlFe+FDAE4JaERz2eAC+NKVSg
 1ow/6mLD6bzMzmriSIYWsUBfq8RSXcur4ZleAhy8rb0TjD15KzcGODhL67Rki6GU+Z8l
 5VF31CUpfZBAhCMWBZZcob6eHnVt+IAFbhoG/TFUbqJ9JaSHBfRZ15KJO5IXXCSQ8Ipc
 0liXPkjM+/lwzSOUQdh2FyDWdAVILtFwYgn/zXZ1PIh5FPnwHUQ4sQKjJJCuv5hY8M5h
 rtyg==
X-Gm-Message-State: AOAM532cTmBuk5NnXsWou2QAB8fitQKTOXtjY4YGiDFlw/O7hDfJTf50
 5GYG9d3TM0z6msIR+GfTporeOg==
X-Received: by 2002:a17:90a:17c8:: with SMTP id
 q66mr1515883pja.167.1611873722704; 
 Thu, 28 Jan 2021 14:42:02 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id m10sm6042358pjs.25.2021.01.28.14.42.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 14:42:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/23] exec: Add support for TARGET_TAGGED_ADDRESSES
Date: Thu, 28 Jan 2021 12:41:29 -1000
Message-Id: <20210128224141.638790-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210128224141.638790-1-richard.henderson@linaro.org>
References: <20210128224141.638790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SDr+O0bmE3IC

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
 include/exec/cpu_ldst.h | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/exec/cpu_ldst.h b/include/exec/cpu_ldst.h
index e62f4fba00..1df9b93e59 100644
--- a/include/exec/cpu_ldst.h
+++ b/include/exec/cpu_ldst.h
@@ -69,17 +69,31 @@ typedef uint64_t abi_ptr;
 #define TARGET_ABI_FMT_ptr "%"PRIx64
 #endif
 
+static inline abi_ptr untagged_addr(abi_ptr x)
+{
+#ifdef TARGET_TAGGED_ADDRESSES
+    if (current_cpu) {
+        return cpu_untagged_addr(current_cpu, x);
+    }
+#endif
+    return x;
+}
+
 /* All direct uses of g2h and h2g need to go away for usermode softmmu.  */
-#define g2h(x) ((void *)((uintptr_t)(abi_ptr)(x) + guest_base))
+static inline void *g2h(abi_ulong x)
+{
+    return (void *)((uintptr_t)untagged_addr(x) + guest_base);
+}
 
 static inline bool guest_addr_valid(abi_ulong x)
 {
-    return x <= GUEST_ADDR_MAX;
+    return untagged_addr(x) <= GUEST_ADDR_MAX;
 }
 
 static inline bool guest_range_valid(abi_ulong start, abi_ulong len)
 {
-    return len - 1 <= GUEST_ADDR_MAX && start <= GUEST_ADDR_MAX - len + 1;
+    return len - 1 <= GUEST_ADDR_MAX &&
+           untagged_addr(start) <= GUEST_ADDR_MAX - len + 1;
 }
 
 #define h2g_valid(x) \
-- 
2.25.1

