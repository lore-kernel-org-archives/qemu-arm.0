Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81082CA1000
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 18:06:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usOE7-00072C-KU; Sat, 30 Aug 2025 12:14:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usERD-0007Oe-1H
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:44 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1usER9-0004yt-W1
 for qemu-arm@nongnu.org; Sat, 30 Aug 2025 01:47:42 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b4e84a61055so71493a12.0
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 22:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756532858; x=1757137658; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u+D60QxovqJP7feCGQTWDNEZ1sD7GeN0SXsZfqsAUCI=;
 b=dGWLGp1OyJWGzxPFDlxoxWf674wroyLyudiToxYceoRhaK4ht1NioRbEYEu3K7UnlN
 iEnGiVWZ07z/nkdldYQyVnjTNRsr/J3TGo0Hf+xGvYwYwwvyccOXusVmjFNEPepDSOcW
 u1aUpnfrbVzwNVXVbP16IErNoqW/e3aVghFTKtC1WrJ1Sl0X3kjI1PDzOO/UM3muwZGp
 vi3Igt0RWeO6cAljYZg2o4pMs2QQqYF4359gyxjE9D9I0kM70SS4Bb8ErSlfGN+xNNhx
 s3ueaf8r9gykVnpkgoiz0pwmcKklTCjurqlaMMc2qHixB9VHXx9jIIoEQ0cX033HGX9Z
 bexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756532858; x=1757137658;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u+D60QxovqJP7feCGQTWDNEZ1sD7GeN0SXsZfqsAUCI=;
 b=m7Q2MVS8ly2vZrz/QPUUEb+sNTYO7nqkYdbl20OX0BUSHsCD7vDLUhjNfhsG3sBElk
 rppgNL3DxWCQbI4xuLB3ICJoIMgEb/b3JTIwLOBQDlcsoj2KTh29Sw+85a+10/biIG5v
 U+ljkUPfcJPlEk+9J6NG33ANfbyzuf+iFJjBAkQk6AUlDEeXthtVWQM1q0PXwUM1ksCV
 A0adpU6nHap9Lynuz/ih7YvyRcaF0ZO/m9M6oq791q9oM5OA6HUKgW8xq7q2oKmgITFM
 Uth/VtHE04z4mEAf7AUAV2lNalDzzSUl/MzfTd1nyOWbjm4VdUVPrpnjKVL0gFxrbhgA
 ysuw==
X-Gm-Message-State: AOJu0YwE9AlWdIoEbKvnH8ynfa5NrP0MRJxleGpzbd4zkORe2i7CapeO
 ltcY6q7CRaICnf/D8MWgSiHZrSY1YOCa13I/J1I5HRNEWV4wMOnFCxV+DPogwEtoeFU=
X-Gm-Gg: ASbGncsdcHcfM39x7APPlAXZ2RII5v2nTY6AjJn2VaI8r/IfIqrn/WXQq82sGNHP2kM
 UkuyibSJLzCGg8HVMlL40viIR9K5GWumfDvf6RDvmYJiuvKKxt5e7aULQbTNxbmbciHoBPB8EYD
 Y1PcwKka9KDSSLHVhrhsQh48/oGr65/jubYQ8YNLBANysIGJcCWnwMw/IjXZRIKscAe5xpMYIjr
 V+rVs/ViUlahbiumPp7WikFlmMoSUXxWNDDCPMcGGUy8pa1nAPPVMrYzNh9tMe6EeCGnIitctb2
 cBZMWurxcrsa9hyeRWi60Q2545IXi8tDUTZV1s7HC+ppcGQ2Qg7lxKCSHe6PJ2Fq2q0y5/hIiwX
 11WN4GUDMF34Jviiouzrd2qqlTCSa42c20LyISKj7AJWcM5U57EfWYDz7Y3SYBidG/jSOBVwpzg
 ==
X-Google-Smtp-Source: AGHT+IHfa5Sk71heWIZNx+1VPTg4RJqH6Bei5V2uYfNP4sy00p+v2CIAWqpnVwEbT05SI58XLGFU1Q==
X-Received: by 2002:a17:902:e808:b0:24a:9344:fc9b with SMTP id
 d9443c01a7336-24a93450618mr598815ad.57.1756532858544; 
 Fri, 29 Aug 2025 22:47:38 -0700 (PDT)
Received: from stoup.. (122-150-204-179.dyn.ip.vocus.au. [122.150.204.179])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2490658999fsm40852715ad.112.2025.08.29.22.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 22:47:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>
Subject: [PATCH v4 65/84] target/arm: Implement GCSSS2
Date: Sat, 30 Aug 2025 15:41:09 +1000
Message-ID: <20250830054128.448363-66-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250830054128.448363-1-richard.henderson@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
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
 target/arm/tcg/translate-a64.c | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/target/arm/cpregs.h b/target/arm/cpregs.h
index ee8b870e17..1ee0bfd132 100644
--- a/target/arm/cpregs.h
+++ b/target/arm/cpregs.h
@@ -53,6 +53,7 @@ enum {
     ARM_CP_GCSPOPX               = 0x000b,
     ARM_CP_GCSPOPCX              = 0x000c,
     ARM_CP_GCSSS1                = 0x000d,
+    ARM_CP_GCSSS2                = 0x000e,
 
     /* Flag: reads produce resetvalue; writes ignored. */
     ARM_CP_CONST                 = 1 << 4,
diff --git a/target/arm/cpregs-gcs.c b/target/arm/cpregs-gcs.c
index 51fc8298af..b70bf47fc6 100644
--- a/target/arm/cpregs-gcs.c
+++ b/target/arm/cpregs-gcs.c
@@ -128,6 +128,9 @@ static const ARMCPRegInfo gcs_reginfo[] = {
     { .name = "GCSSS1", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 2,
       .access = PL0_W, .type = ARM_CP_GCSSS1 },
+    { .name = "GCSSS2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 1, .opc1 = 3, .crn = 7, .crm = 7, .opc2 = 3,
+      .access = PL0_R, .type = ARM_CP_GCSSS2 },
     { .name = "GCSPUSHX", .state = ARM_CP_STATE_AA64,
       .opc0 = 1, .opc1 = 0, .crn = 7, .crm = 7, .opc2 = 4,
       .access = PL1_W, .accessfn = access_gcspushx, .fgt = FGT_NGCSEPP,
diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index e0ce2bd0a3..481e748ce0 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -2660,6 +2660,35 @@ static void gen_gcsss1(DisasContext *s, int rt)
     tcg_gen_andi_i64(gcspr, inptr, ~7);
 }
 
+static void gen_gcsss2(DisasContext *s, int rt)
+{
+    TCGv_i64 gcspr = cpu_gcspr[s->current_el];
+    int mmuidx = core_gcs_mem_index(s->mmu_idx);
+    MemOp mop = finalize_memop(s, MO_64 | MO_ALIGN);
+    TCGv_i64 outptr = tcg_temp_new_i64();
+    TCGv_i64 tmp = tcg_temp_new_i64();
+    TCGLabel *fail_label =
+        delay_exception(s, EXCP_UDEF, syn_gcs_data_check(GCS_IT_GCSSS2, rt));
+
+    /* Validate that the new stack has an in-progress cap. */
+    tcg_gen_qemu_ld_i64(outptr, gcspr, mmuidx, mop);
+    tcg_gen_andi_i64(tmp, outptr, 7);
+    tcg_gen_brcondi_i64(TCG_COND_NE, tmp, 5, fail_label);
+
+    /* Push a valid cap to the old stack. */
+    tcg_gen_andi_i64(outptr, outptr, ~7);
+    tcg_gen_addi_i64(outptr, outptr, -8);
+    tcg_gen_deposit_i64(tmp, outptr, tcg_constant_i64(1), 0, 12);
+    tcg_gen_qemu_st_i64(tmp, outptr, mmuidx, mop);
+    tcg_gen_mb(TCG_BAR_SC | TCG_MO_ALL);
+
+    /* Pop the in-progress cap from the new stack. */
+    tcg_gen_addi_i64(gcspr, gcspr, 8);
+
+    /* Return a pointer to the old stack cap. */
+    tcg_gen_mov_i64(cpu_reg(s, rt), outptr);
+}
+
 /* MRS - move from system register
  * MSR (register) - move to system register
  * SYS
@@ -2976,6 +3005,11 @@ static void handle_sys(DisasContext *s, bool isread,
             gen_gcsss1(s, rt);
         }
         return;
+    case ARM_CP_GCSSS2:
+        if (s->gcs_en) {
+            gen_gcsss2(s, rt);
+        }
+        return;
     default:
         g_assert_not_reached();
     }
-- 
2.43.0


