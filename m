Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4295314ejc;
        Sun, 26 Feb 2023 21:39:52 -0800 (PST)
X-Google-Smtp-Source: AK7set8e51Ka+aAddF3IGLFJtj/1nn8+o2ueRwJKPlqX0pWYm0twa3Kb1lxnmc/BdN1tBsXlkjbC
X-Received: by 2002:ad4:4ee4:0:b0:56e:b4f7:114f with SMTP id dv4-20020ad44ee4000000b0056eb4f7114fmr42144373qvb.21.1677476392466;
        Sun, 26 Feb 2023 21:39:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677476392; cv=none;
        d=google.com; s=arc-20160816;
        b=WmplHwx2LWmNe8QY8fR/v37s6PV/U2EX6CXq/bdUbmEykkgoCDVzZZ/Ei6S5bphqNP
         HRaLYX2KuihNJS2nlSsM81+jrQmRUeea7TT6EHsoeKioK/Vx8WysPxaaT1rFSxQtQ7fC
         JlnSMsqZsSjOXvQ25/db8wEPFq3osVDjax3ARqL36yO04k65vn4L2zgYl24U7pBSAlDG
         XmDoYl6mDhdRfqYFbAKl/4Fc+6BQf3xXF6GSbGUu46gGOORQRZXqLUR75tgE4TCWoV/e
         v1NbcXpq/R0khVsFh6ojUtl2pV/qyxU3xaws7W/VUfjvD4ASqpX+KRjlivgFUpwKMcO2
         j3zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Me3y4NGZuYmWF3kVGO2rrjiIggu4967Ajmd6fpL1eaM=;
        b=YK8GA58T5Hvf+hS3O6THNxBryMbM8MjPm+IPFe6+px5xAg51mHYZD34oLE9KtLVPFi
         Hkf9R5amChHHNg1LiECb0z90VDS11y3OdWwLw+27yc8J0IPn5TUZSzGGzW4YFxvxDePH
         KvHjpnQzUhpO1DTTlwA5o7k5QN1w5u0KQ0erLObxWNLAFPQDa5xDrnaXss16IWmXLTlJ
         JAhhePSnywbo9iGPxUZrZHpRsW1j1tl58pfGWdboBipE4f0XPknLLoXgik+2Jnwh1JkE
         Z1OI6Z+uza798jOLEY6dt4gNsYRjXd6BkyimqsnKvuO5GCP+ZwakgThNygXifLLUA9HW
         pKzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eZ1VDAE0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a05620a0c4700b007429ca20425si3589965qki.463.2023.02.26.21.39.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:39:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eZ1VDAE0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWWCV-0002MH-Ey; Mon, 27 Feb 2023 00:37:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCR-00027W-Ae
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:37:24 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWWCO-0002Oe-L6
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:37:22 -0500
Received: by mail-pj1-x1036.google.com with SMTP id c23so4866915pjo.4
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Me3y4NGZuYmWF3kVGO2rrjiIggu4967Ajmd6fpL1eaM=;
 b=eZ1VDAE0A4B68/UvZiQsA3HbY5a8VnVVkkO3IvXh9L7Yj+6d7kZT/GB8CvbBXRI/8K
 PQ7k4TgglZPwAq/WeFaKWdUe3cvpvgmmz66Ojsb/weewFhWyvrrlngxjSfZadTgTOl0g
 JjETL/kEFWEFMSZ7T1U5h4ac+3sao2AzuEKSsG3ZhqMGCFW73oTh1LH5Si5h6WDuRRXa
 awL4cxUDpaSSyJ6+2USLEz3TfGcQ3ZwvfXUvaRwQZ0G8oYQf25h8Lo2vrZH++doCPZVt
 hCDKhFPf1lrKNvr6W6DwXpda7ZPs0vFvK2nPSPP35EQjMDiVQ1CkECCJVYNMA6A1hOnp
 AEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Me3y4NGZuYmWF3kVGO2rrjiIggu4967Ajmd6fpL1eaM=;
 b=Wb01jFlfeCXlTYYEQxLTCLVZ5rYL5JKxREWIubClKEpeQ6SWrqg1+o5YP7Knk23nl8
 UpITCIcuIIk262FRshtqAeiym1Ej9q7EY9khMkmgfJq2JWsrAwv4phsHpWNRCCCSd8Qw
 WtZtjds+OvodWH8aAkzdAVFBsMh6wgyvfFLC8OX/Xo85FwXtaBcdyIPezOpjM4TpWz/d
 qXcXDK16mU2YFsgUhMmzoVsMkI2MxGQ3uSGkW1JxsEaLplr+FXNg1ocom0+dengRC7DB
 RD3Y+za72H4/cbSMLs77ZSUTCajeUs87OzD7Eg5N+zVYho/xO5OzyujCA/XtXdCldKQY
 0YFg==
X-Gm-Message-State: AO0yUKVFcGGwilKoIP5yl4QXC6hrafSeLYu7f2rTDKWUhOxddAI9eLPY
 IqLSHwnQNCWJGRBRFnEClTXkYw==
X-Received: by 2002:a05:6a20:7351:b0:cc:c5db:ea4a with SMTP id
 v17-20020a056a20735100b000ccc5dbea4amr7662597pzc.33.1677476239768; 
 Sun, 26 Feb 2023 21:37:19 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 k12-20020aa792cc000000b005a7c892b435sm3342137pfa.25.2023.02.26.21.37.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:37:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 05/31] tcg: Rename TEMP_LOCAL to TEMP_TB
Date: Sun, 26 Feb 2023 19:36:35 -1000
Message-Id: <20230227053701.368744-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227053701.368744-1-richard.henderson@linaro.org>
References: <20230227053701.368744-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
X-TUID: +XGN/xI2er2L

Use TEMP_TB as that is more explicit about the default
lifetime of the data.  While "global" and "local" used
to be contrasting, we have more lifetimes than that now.

Do not yet rename tcg_temp_local_new_*, just the enum.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/tcg/tcg.h | 12 ++++++++----
 tcg/optimize.c    |  2 +-
 tcg/tcg.c         | 18 +++++++++---------
 3 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 59854f95b1..2010e746ca 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -433,11 +433,15 @@ typedef enum TCGTempVal {
 typedef enum TCGTempKind {
     /* Temp is dead at the end of all basic blocks. */
     TEMP_NORMAL,
-    /* Temp is live across conditional branch, but dead otherwise. */
+    /*
+     * Temp is dead at the end of the extended basic block (EBB),
+     * the single-entry multiple-exit region that falls through
+     * conditional branches.
+     */
     TEMP_EBB,
-    /* Temp is saved across basic blocks but dead at the end of TBs. */
-    TEMP_LOCAL,
-    /* Temp is saved across both basic blocks and translation blocks. */
+    /* Temp is live across the entire translation block, but dead at end. */
+    TEMP_TB,
+    /* Temp is live across the entire translation block, and between them. */
     TEMP_GLOBAL,
     /* Temp is in a fixed register. */
     TEMP_FIXED,
diff --git a/tcg/optimize.c b/tcg/optimize.c
index 763bca9ea6..ce05989c39 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -190,7 +190,7 @@ static TCGTemp *find_better_copy(TCGContext *s, TCGTemp *ts)
         } else if (i->kind > ts->kind) {
             if (i->kind == TEMP_GLOBAL) {
                 g = i;
-            } else if (i->kind == TEMP_LOCAL) {
+            } else if (i->kind == TEMP_TB) {
                 l = i;
             }
         }
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 0992fb4f31..bf2af8b0fe 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1258,7 +1258,7 @@ TCGTemp *tcg_global_mem_new_internal(TCGType type, TCGv_ptr base,
 TCGTemp *tcg_temp_new_internal(TCGType type, bool temp_local)
 {
     TCGContext *s = tcg_ctx;
-    TCGTempKind kind = temp_local ? TEMP_LOCAL : TEMP_NORMAL;
+    TCGTempKind kind = temp_local ? TEMP_TB : TEMP_NORMAL;
     TCGTemp *ts;
     int idx, k;
 
@@ -1369,7 +1369,7 @@ void tcg_temp_free_internal(TCGTemp *ts)
          */
         return;
     case TEMP_NORMAL:
-    case TEMP_LOCAL:
+    case TEMP_TB:
         break;
     default:
         g_assert_not_reached();
@@ -1915,7 +1915,7 @@ static void tcg_reg_alloc_start(TCGContext *s)
         case TEMP_EBB:
             val = TEMP_VAL_DEAD;
             /* fall through */
-        case TEMP_LOCAL:
+        case TEMP_TB:
             ts->mem_allocated = 0;
             break;
         default:
@@ -1937,7 +1937,7 @@ static char *tcg_get_arg_str_ptr(TCGContext *s, char *buf, int buf_size,
     case TEMP_GLOBAL:
         pstrcpy(buf, buf_size, ts->name);
         break;
-    case TEMP_LOCAL:
+    case TEMP_TB:
         snprintf(buf, buf_size, "loc%d", idx - s->nb_globals);
         break;
     case TEMP_EBB:
@@ -2759,7 +2759,7 @@ static void la_bb_end(TCGContext *s, int ng, int nt)
         switch (ts->kind) {
         case TEMP_FIXED:
         case TEMP_GLOBAL:
-        case TEMP_LOCAL:
+        case TEMP_TB:
             state = TS_DEAD | TS_MEM;
             break;
         case TEMP_NORMAL:
@@ -2804,7 +2804,7 @@ static void la_bb_sync(TCGContext *s, int ng, int nt)
         int state;
 
         switch (ts->kind) {
-        case TEMP_LOCAL:
+        case TEMP_TB:
             state = ts->state;
             ts->state = state | TS_MEM;
             if (state != TS_DEAD) {
@@ -3497,7 +3497,7 @@ static void temp_free_or_dead(TCGContext *s, TCGTemp *ts, int free_or_dead)
     case TEMP_FIXED:
         return;
     case TEMP_GLOBAL:
-    case TEMP_LOCAL:
+    case TEMP_TB:
         new_type = TEMP_VAL_MEM;
         break;
     case TEMP_NORMAL:
@@ -3785,7 +3785,7 @@ static void tcg_reg_alloc_bb_end(TCGContext *s, TCGRegSet allocated_regs)
         TCGTemp *ts = &s->temps[i];
 
         switch (ts->kind) {
-        case TEMP_LOCAL:
+        case TEMP_TB:
             temp_save(s, ts, allocated_regs);
             break;
         case TEMP_NORMAL:
@@ -3822,7 +3822,7 @@ static void tcg_reg_alloc_cbranch(TCGContext *s, TCGRegSet allocated_regs)
          * Keep tcg_debug_asserts for safety.
          */
         switch (ts->kind) {
-        case TEMP_LOCAL:
+        case TEMP_TB:
             tcg_debug_assert(ts->val_type != TEMP_VAL_REG || ts->mem_coherent);
             break;
         case TEMP_NORMAL:
-- 
2.34.1

