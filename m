Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFDDCA0EDC
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:07:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXYc-0002Rf-5Q; Thu, 14 Aug 2025 08:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXYT-0002A1-Ks
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:59:42 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXYN-0004OF-3I
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 08:59:40 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-32326e67c95so1320767a91.3
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 05:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176373; x=1755781173; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6jXVVpPrnUxKOJDwLJ9Z6F/DAfv+srkdIqMUZ2+d07Y=;
 b=NoOd+bNTKGdFMEF2obRXwrnPTJE3/x2Tn2VNhDut91ztaXENeXQAeHq0opn3ZTjW4V
 oclM6GybcRr2opaJK7X3YRXu0OiYx04Atd2QQ1dK+7w3UY2gxjOT9bfmxKCa4/WjL4ov
 NOR2tgCWtJFQfWomG4nxZeDG1x+e2cwKGKciPX1DVKCljCTbDDktEeQn5GXBe1MXrEKe
 xfGvguDRNMv11ZWjUZ5J5OIYeOfTAKU9VtBuJ17suUVx+RfgYA3RwtSqZkp27myoElb4
 +Gupe1hNqnVzQgi15brvRZ/CPvGRi8dYgG+l3gBXR93lK+Ml+9MX1XSqW3P9Kt4kp9dF
 BGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176373; x=1755781173;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6jXVVpPrnUxKOJDwLJ9Z6F/DAfv+srkdIqMUZ2+d07Y=;
 b=cty2j2cm/PpLnqg+l704ki8pIytcdMYEL6I5HtJE9txqjAoQ65Xlh8qO3Qu4G0iDoW
 6QY7pHWOEIvG5t5NGzPIvcALPDnI7GCcdvzk9JoGIRhTfkbNmGLNuEhtBT4oHgj1/o4l
 uIliUXAa4luTVmOEnqIAQ1PV16awJBD9G+CkwXdPA60X2tkenYWLW/JHu31OjVsgMDJ2
 0H6eagW63WrwtWdH3BsHMzDKWnmkAgjUY7O1UCKCH9MYo7FrynON2cU/ThEgWlyY32h0
 Ux8lfhOfdSCFnSGVVebIiBmHJnpv7IhUEqCnSttRv8OXPHgbTR+O52rGa+uVO4ljdPs7
 n6fQ==
X-Gm-Message-State: AOJu0YyhDovnzqPuttSL8ArgR5vXwjcHfSa0vOK57bW3V4mIAMwbm0Ri
 R7mRB3mxaw9XNipcJXazttkLbrCv3iT0z3XYHmy2HSdOXYoy0s+PuFrFdKu8hMk/bRsdL7Kmgio
 Q92P64Is=
X-Gm-Gg: ASbGncs7QfunbRadxMUjytfDdxQMUTeyCrDmVuSTwqSBb26D0yX3g5q2YyZyOeQpjt9
 cKIWgOE3ztFaip53bbrARDe7lzEwq3Ya0EIrHGKBeXmwL5sWPhWWWCyNN2OMcVF9Zn4GWFrJnJd
 gkiV+CWgIeDfnB6WXRTH+NCdU30ASrWcMbrwmZvM3I7tZowqGCQ1W3FeDFHNyyihwBn/2ufrTaT
 ny9WkYZEjPGQ+Km2B7de8I0m6t925/4zs3hikxq/e0LrHisM4R86dGzRIl8z6gmDtuzBWGyBpnO
 jOXHSD42Y4I6OaQL0pxxdNVxt6aGU4CU+DDmPxbOIYVN0YaPGeuZvhC77OD2umrFYr5BAgofcTy
 cppyBBs4yfgQ3ZzYcbNyn67SQdGQDa/vkKNFZ52H/luwr3sY=
X-Google-Smtp-Source: AGHT+IFf5KlrS5MZdN5NRx/elB0yvd3BtzYzpNp8fYM2FyZXxs70S8zW/rap1cDozRx1KdvKVbGdVA==
X-Received: by 2002:a17:90a:c2c4:b0:321:6e1a:1b71 with SMTP id
 98e67ed59e1d1-32327a8a851mr4399164a91.29.1755176372685; 
 Thu, 14 Aug 2025 05:59:32 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3233100c994sm1766256a91.21.2025.08.14.05.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 05:59:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 28/85] include/hw/core/cpu: Invert the indexing into
 CPUTLBDescFast
Date: Thu, 14 Aug 2025 22:56:55 +1000
Message-ID: <20250814125752.164107-29-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

This array is within CPUNegativeOffsetState, which means the
last element of the array has an offset from env with the
smallest magnitude.  This can be encoded into fewer bits
when generating TCG fast path memory references.

When we changed the NB_MMU_MODES to be a global constant,
rather than a per-target value, we pessimized the code
generated for targets which use only a few mmu indexes.
By inverting the array index, we counteract that.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h | 11 ++++++++++-
 tcg/tcg.c             |  3 ++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index bd835b07d5..23eb849a9b 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -594,9 +594,18 @@ static inline CPUArchState *cpu_env(CPUState *cpu)
 }
 
 #ifdef CONFIG_TCG
+/*
+ * Invert the index order of the CPUTLBDescFast array so that lower
+ * mmu_idx have offsets from env with smaller magnitude.
+ */
+static inline int mmuidx_to_fast_index(int mmu_idx)
+{
+    return NB_MMU_MODES - 1 - mmu_idx;
+}
+
 static inline CPUTLBDescFast *cpu_tlb_fast(CPUState *cpu, int mmu_idx)
 {
-    return &cpu->neg.tlb.f[mmu_idx];
+    return &cpu->neg.tlb.f[mmuidx_to_fast_index(mmu_idx)];
 }
 #endif
 
diff --git a/tcg/tcg.c b/tcg/tcg.c
index afac55a203..294762c283 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -425,7 +425,8 @@ static uintptr_t G_GNUC_UNUSED get_jmp_target_addr(TCGContext *s, int which)
 static int __attribute__((unused))
 tlb_mask_table_ofs(TCGContext *s, int which)
 {
-    return (offsetof(CPUNegativeOffsetState, tlb.f[which]) -
+    int fi = mmuidx_to_fast_index(which);
+    return (offsetof(CPUNegativeOffsetState, tlb.f[fi]) -
             sizeof(CPUNegativeOffsetState));
 }
 
-- 
2.43.0


