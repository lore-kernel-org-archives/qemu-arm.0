Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1777292njb;
        Thu, 6 Feb 2025 11:58:20 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWrV79x33jpsNcL/AgLi0ranL1eVgL/cecFkDYfIaQabQS/VXs6vTLnbwHL72LrbSTAGkCxiYZs2LiYSg==@linaro.org
X-Google-Smtp-Source: AGHT+IFZRnnZ8CHjvtOTOcMRELnpQSWADguBtG2bEAb9cYgs14EcmHgeoYfb5nl/1LOvYuzE/8vA
X-Received: by 2002:a05:622a:1356:b0:46e:2a18:939d with SMTP id d75a77b69052e-4716880caeemr3863451cf.11.1738871900707;
        Thu, 06 Feb 2025 11:58:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738871900; cv=none;
        d=google.com; s=arc-20240605;
        b=Qclnr6rvJ5P/tFKAsWFapDobLPgFZ6KT4lka3qndmK52pZJy4psnZyITBynWMzB3dR
         A7HDmNY1ea0GBDZbsiXIBJjnXwiB/V5cFJDF9aJI0aSOkViw7coSQITYpzwMtmNnHLFd
         aPF9zaMoEClTQ80/plKt7V2DvLJfgclQEEzW9ms0yZ+9PCekdRdyoIozb2l7HnHdvWkD
         Cc2WTaXzZZDWgZutfrtesRbKB7lYnH+HtQfmZsG7Z0CaepDwRjB2f3KekAD1Cgasz8bA
         ELlTbWvy3yKIRPcKgPDClvsm5xic0meic1yy/CJcy2gcXxcoK5yUVstgIXC49JxRRcvQ
         dDdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EspsqzaZ6GlbqtXIsalcEYjHvoKmFLTIXcSUIIyZVaE=;
        fh=9Ev+QBUhk6P6vR3LT1wYeDLexozsz44nqjfoyPajZCc=;
        b=dOBPHw24ikZ1xfCfuVOa2hGIK6X7jjXHLUEA+Lp4mVMrMzA9xhf+VC4vMeULG7LV7m
         eD1Fe8LNr8XsljSZGWLL5z0Lpr3wlh7KbHbrTpj0f3XQj6PU9ztUKlYXs4HfeHQuyumf
         O/IwEPoCeUllyXmKHRc3Tn0EclP1rN6MAVMnrWg974X1krcQ/UBtDV7KeSJgjY5hjcTM
         OAL5+sMKkBS4UQyDVdUpyCcRL8rqG1SSSHl4AWuYAMDG+Loi/hAJ6fkT5v3VnfqHwpbi
         2ZeIK6H7y3hwLDZcNb2MB3Xh5A0S41lg4tyb6eOY+JGhZ1raZk6OaouDMZIrJk2rL0LS
         gA9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k3VnPnfa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153bbbf97si16615701cf.489.2025.02.06.11.58.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 11:58:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k3VnPnfa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tg80B-0007Cu-WD; Thu, 06 Feb 2025 14:57:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg805-00078h-IL
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:25 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tg803-0000Si-TY
 for qemu-arm@nongnu.org; Thu, 06 Feb 2025 14:57:25 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-21f0bc811dbso36347945ad.1
 for <qemu-arm@nongnu.org>; Thu, 06 Feb 2025 11:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738871842; x=1739476642; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EspsqzaZ6GlbqtXIsalcEYjHvoKmFLTIXcSUIIyZVaE=;
 b=k3VnPnfaaF6G6/BsDh7CSTWwcDQyW9HAk9Sd0+gityraDCj21GoUdauzXvrgaAi7wT
 jgSwEl3L9QYE1LSJVE8oJiVHX3P0979sO7Xd7ibRNcJNGk74duKKsXo5sfDbIK+yPAxF
 6gEVkc2iCEQH/jwSlU0NwztaaG4+7Psj3KWPgiRGNLSJynqcHLZEFPPj2K/kUyq+tj4z
 HCSHNyWVum1QL0TOw5QtHrrqZagvG7K2Fxl/UBMYiRJveZhDNmnAfv4gN++VHHoJF/AN
 fhnSW1UcbfoOjoDvz+7iM4zoc4Uod2rrQBOoMtSP6d/ShumLXVGcJbitSAehzYSgg5SS
 TK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738871842; x=1739476642;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EspsqzaZ6GlbqtXIsalcEYjHvoKmFLTIXcSUIIyZVaE=;
 b=I3bibjI5OJRFwkZ3JtCBkiUi0wgjC2acEHlaVjxG9H0635KEyOIAnL/gp5L5YaAIgD
 h2NuRYX4SCsfR3eQdlkcPC48uYZTOfv2/+M+CVfGBccLSU/AedHfxru9REFAU6+S4b+0
 dVD5FRp/GKrcSDKDZlQhHdaq68oJEpUxdxEcsFVJXYlt7fvxo7Uct1icyfkB29S3ydT6
 +qW2gtHFVugCEHGk/bappdzoOVxUDv2sBjVsLZ/pgMm2FWo/u7lh3dfBY9lrhnJ7QDIQ
 s6VfxO1Z5hcYI1xpOgt/YxduI41EENo5KVOGqrlYDrCDp6THrhKzrVWAUQJwo6sSxzsV
 xcBQ==
X-Gm-Message-State: AOJu0YyII1OgPgojqRAHiB9ZP3uklBz+EnOZcfEZrrzWnVfHvwiXqvw9
 tFc48AjijevACzD+dtJk0JKdCMqzvpf64MUd8RwyZkzjgUlgBwMA7vg8QQF8h14=
X-Gm-Gg: ASbGncspuYtN/+W8kSxigMu+rzBmnBwIUo293mBtuui4T8DtKPAkmCi9QWh2hc1T5Ju
 vSsGOhcKsXic69FWhJN6QyB5r1Np4MenV9Zyq7s+eVomQm2kgPqHxl/gG3Yrcne4G5Au03t84wB
 EW0CTIT2oEtH3ZVFLa/W1Zt7PVf6CnZLkQbsyPdRXgqX9n9H46jEbKa3dp1vkiqaTJgUoy8DwiP
 9CY4vTBvESoNoS+mA4MX3pr45HSbp4LILygHnYwpHPrbUxzgQzjGGcQ1JyFuH/b21B5tj6Ovu9N
 rKZ9G107T5+U6BgtFE94hecs3gPI2EDv9RK96t4aO4qtqok=
X-Received: by 2002:a62:b40c:0:b0:727:39a4:30cc with SMTP id
 d2e1a72fcca58-73042a57f94mr6945938b3a.1.1738871841782; 
 Thu, 06 Feb 2025 11:57:21 -0800 (PST)
Received: from stoup.. (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73048c16370sm1666993b3a.152.2025.02.06.11.57.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 11:57:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 07/61] tcg: Split out tcg_gen_gvec_mov_var
Date: Thu,  6 Feb 2025 11:56:21 -0800
Message-ID: <20250206195715.2150758-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250206195715.2150758-1-richard.henderson@linaro.org>
References: <20250206195715.2150758-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: D/Pno8mD53Sn

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg-op-gvec-common.h |  4 ++++
 tcg/tcg-op-gvec.c                | 21 +++++++++++++++------
 2 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/include/tcg/tcg-op-gvec-common.h b/include/tcg/tcg-op-gvec-common.h
index 6e8fccad01..cabbe957c8 100644
--- a/include/tcg/tcg-op-gvec-common.h
+++ b/include/tcg/tcg-op-gvec-common.h
@@ -253,6 +253,10 @@ void tcg_gen_gvec_4i(uint32_t dofs, uint32_t aofs, uint32_t bofs, uint32_t cofs,
 
 /* Expand a specific vector operation.  */
 
+void tcg_gen_gvec_mov_var(unsigned vece, TCGv_ptr dbase, uint32_t dofs,
+                          TCGv_ptr abase, uint32_t aofs,
+                          uint32_t oprsz, uint32_t maxsz);
+
 void tcg_gen_gvec_mov(unsigned vece, uint32_t dofs, uint32_t aofs,
                       uint32_t oprsz, uint32_t maxsz);
 void tcg_gen_gvec_not(unsigned vece, uint32_t dofs, uint32_t aofs,
diff --git a/tcg/tcg-op-gvec.c b/tcg/tcg-op-gvec.c
index 3e53e43354..5e58b1cc75 100644
--- a/tcg/tcg-op-gvec.c
+++ b/tcg/tcg-op-gvec.c
@@ -1741,8 +1741,9 @@ static void vec_mov2(unsigned vece, TCGv_vec a, TCGv_vec b)
     tcg_gen_mov_vec(a, b);
 }
 
-void tcg_gen_gvec_mov(unsigned vece, uint32_t dofs, uint32_t aofs,
-                      uint32_t oprsz, uint32_t maxsz)
+void tcg_gen_gvec_mov_var(unsigned vece, TCGv_ptr dbase, uint32_t dofs,
+                          TCGv_ptr abase, uint32_t aofs,
+                          uint32_t oprsz, uint32_t maxsz)
 {
     static const GVecGen2 g = {
         .fni8 = tcg_gen_mov_i64,
@@ -1750,14 +1751,22 @@ void tcg_gen_gvec_mov(unsigned vece, uint32_t dofs, uint32_t aofs,
         .fno = gen_helper_gvec_mov,
         .prefer_i64 = TCG_TARGET_REG_BITS == 64,
     };
-    if (dofs != aofs) {
-        tcg_gen_gvec_2(dofs, aofs, oprsz, maxsz, &g);
-    } else {
+
+    if (dofs == aofs && dbase == abase) {
         check_size_align(oprsz, maxsz, dofs);
         if (oprsz < maxsz) {
-            expand_clr(tcg_env, dofs + oprsz, maxsz - oprsz);
+            expand_clr(dbase, dofs + oprsz, maxsz - oprsz);
         }
+        return;
     }
+
+    tcg_gen_gvec_2_var(dbase, dofs, abase, aofs, oprsz, maxsz, &g);
+}
+
+void tcg_gen_gvec_mov(unsigned vece, uint32_t dofs, uint32_t aofs,
+                      uint32_t oprsz, uint32_t maxsz)
+{
+    tcg_gen_gvec_mov_var(vece, tcg_env, dofs, tcg_env, aofs, oprsz, maxsz);
 }
 
 void tcg_gen_gvec_dup_i32(unsigned vece, uint32_t dofs, uint32_t oprsz,
-- 
2.43.0

