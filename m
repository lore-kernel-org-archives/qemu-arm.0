Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7494CA0EE4
	for <qemu-arm@archiver.kernel.org>; Thu, 14 Aug 2025 13:22:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umXeL-00040b-Aj; Thu, 14 Aug 2025 09:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXdG-0002h7-4B
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:04:39 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1umXd9-0005FH-4v
 for qemu-arm@nongnu.org; Thu, 14 Aug 2025 09:04:36 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-76e2ea94c7cso875885b3a.2
 for <qemu-arm@nongnu.org>; Thu, 14 Aug 2025 06:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755176668; x=1755781468; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9ovJLOo5Iz7w9oyScfUfi5Nm6yOe9LOjZOdiP+PMnCQ=;
 b=ubqVVZTNMXb7wo8jxmHu/XAAHFZr/6gWyzAwFC2RBc+svnC/U/nSKl+HUMGbOcKjqm
 pQQHrPSN/km+G+F0QtDpDSRMTBf8qVJWM6T3AuSz8HqSxuP4TBgJ7LXrhEMQ0Y/8fcVe
 SWKCAOgV7OWnBaSU5qIvTF5cVTnIyIi+0hN15gyBvdq2sTkQbiErRC62e1i5n7BPcmRU
 JqUjsggh/73b0Xm6Z9tdLVMJ3dzAmt76JDiIK3hLEFDEYPg+Yn2c4ugNq5D7bfFJBQip
 Rz+EDq3P+Myz9KW4DLv/fF5wGWfhqtuo/ia0JtTiO/IdpmHNm8jkNYymEqV1CKzsLMky
 3b5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755176668; x=1755781468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9ovJLOo5Iz7w9oyScfUfi5Nm6yOe9LOjZOdiP+PMnCQ=;
 b=RJt7KrjZSv+4zlrkoc5L7mk0SBJ6rDrw+k78t7sjzXR3dl4jlbuIxQvmzWgnrRHXva
 0YtIH3tHaJm0u7cJ0O9SOMFSp8eyFwIGiY99Mtc7Lbc4fquemLA6lTEL/FBWoIFNefvO
 oGs9bmy8J/fiTDFZp1C0NfVwdPmZl8fd5W1Ajo2MvgOI0u45E5IWi4HlXLKLRk2ykl7T
 SY1aOXT7uHmW53Kwi5jcbZbf1ehV19uDSrTLPmOyEzzeu+zPQtGbODJlrquIBEV+KmWN
 8P2nFhYouNhKw7u6Ab/lk3+P/TjHcwEp8ASl2u20THmv4MWODV+Z+uaqqwok+W3Mwpg/
 mvyA==
X-Gm-Message-State: AOJu0YxzAhwDs9MSapgQWci7vajiaLoCmRb/HKEcskbkuQV9V1EO7O5w
 +Deh4yjkpapAnsKAMhT0BwNQfqykl8qMSgZBuu5G+oI0J43JfEiYb9mUCBRUrdlJ4RRQ2XSkIVA
 DjlRwC20=
X-Gm-Gg: ASbGncvyZqlH+IBqg510B6LRc7zLGBgMmZrI+/9N6U1ricV3ni9y9RxlIuDK3GO5GbN
 j65z7xE7tR4tlRB75kY/jcdEKHND5T8aaijaTK0jv7WVg488jZ+Ehruhwp76hXRmz2wrcJKGRwq
 XECSOmmpUoZmhhVk7nN9+BLd3c7RWQx2PvU2Fdz8AmsFgKiO1lywXtcjJJOESSlur2RilwG7BIv
 xP3YTxKV5ubKMT1anI+1CvGwshlq2Y/Ft+uBG46ytZXEqS1//SLyY0BRLtCTF6avnadJy6x5ssv
 jZUX4220YevkbKFiFAJExGd/OIyV3tKtLLPedOnTaXuUqNoEB2gFPa+nWcz4MTlf5xlQwcLuDQZ
 vBm6IXSELefboQDV4rLOOPPTymUG66kCEapt8+9oBa9aznbw=
X-Google-Smtp-Source: AGHT+IHhVG3d4/RQmmSImi5jHw22tv/coqFbAJRqG09RUr4+MwZWRZMtyvTr5Pv+5G3TqP4MhNUO/A==
X-Received: by 2002:a05:6a00:2d0d:b0:749:bc7:1577 with SMTP id
 d2e1a72fcca58-76e2fc2af7amr4107904b3a.9.1755176668327; 
 Thu, 14 Aug 2025 06:04:28 -0700 (PDT)
Received: from localhost.localdomain ([206.83.105.236])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76bcce6f6fesm34480631b3a.26.2025.08.14.06.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 06:04:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v3 62/85] target/arm: Implement GCSPOPX
Date: Thu, 14 Aug 2025 22:57:29 +1000
Message-ID: <20250814125752.164107-63-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org>
References: <20250814125752.164107-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
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

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpregs.h            |  1 +
 target/arm/cpregs-gcs.c        |  3 +++
 target/arm/tcg/translate-a64.c | 35 ++++++++++++++++++++++++++++++++++
 3 files changed, 39 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index 3d76afd20b..084ea00e51 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -50,6 +50,7 @@ enum {
     ARM_CP_GCSPUSHM              = 0x0008,
     ARM_CP_GCSPOPM               = 0x0009,
     ARM_CP_GCSPUSHX              = 0x000a,
+    ARM_CP_GCSPOPX               = 0x000b,
 
     /* Flag: reads produce resetvalue; writes ignored. */
     ARM_CP_CONST                 = 1 << 4,
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index c688d0c391..2d39b17188 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -116,6 +116,9 @@ static const ARMCPRegInfo gcs_reginfo[] = {
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 4,
       .access = PL1_W, .accessfn = access_gcspushx, .fgt = FGT_NGCSEPP,
       .type = ARM_CP_GCSPUSHX },
+    { .name = "GCSPOPX", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 6,
+      .access = PL1_W, .type = ARM_CP_GCSPOPX },
 };
 
 void define_gcs_cpregs(ARMCPU *cpu)
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 75a6ff0452..7a51836cdc 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2560,6 +2560,33 @@ static void gen_gcspushx(DisasContext *s)
     clear_pstate_bits(PSTATE_EXLOCK);
 }
 
+static void gen_gcspopx(DisasContext *s)
+{
+    TCGv_i64 gcspr = cpu_gcspr[s->current_el];
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 addr = tcg_temp_new_i64();
+    TCGv_i64 tmp = tcg_temp_new_i64();
+    TCGLabel *fail_label =
+        delay_exception(s, EXCP_UDEF, syn_gcs_data_check(GCS_IT_GCSPOPX, 31));
+
+    /* The value at top-of-stack must be an exception token. */
+    tcg_gen_qemu_ld_i64(tmp, gcspr, mmuidx, mop);
+    tcg_gen_brcondi_i64(TCG_COND_NE, tmp, 0b1001, fail_label);
+
+    /*
+     * The other three values in the exception return record
+     * are ignored, but are loaded anyway to raise faults.
+     */
+    tcg_gen_addi_i64(addr, gcspr, 8);
+    tcg_gen_qemu_ld_i64(tmp, addr, mmuidx, mop);
+    tcg_gen_addi_i64(addr, addr, 8);
+    tcg_gen_qemu_ld_i64(tmp, addr, mmuidx, mop);
+    tcg_gen_addi_i64(addr, addr, 8);
+    tcg_gen_qemu_ld_i64(tmp, addr, mmuidx, mop);
+    tcg_gen_addi_i64(gcspr, addr, 8);
+}
+
 /* MRS - move from system register
  * MSR (register) - move to system register
  * SYS
@@ -2855,6 +2882,14 @@ static void handle_sys(DisasContext *s, bool isread,
             gen_gcspushx(s);
         }
         return;
+    case ARM_CP_GCSPOPX:
+        /* Choose the CONSTRAINED UNPREDICTABLE for UNDEF. */
+        if (rt != 31) {
+            unallocated_encoding(s);
+        } else if (s->gcs_en) {
+            gen_gcspopx(s);
+        }
+        return;
     default:
         g_assert_not_reached();
     }
-- 
2.43.0


