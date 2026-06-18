Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB01CD98F8
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 04:16:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wa4AT-0005hd-7h; Thu, 18 Jun 2026 00:15:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa4A6-0005VB-CF
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:15:30 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wa4A4-0005bn-JP
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 00:15:29 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2c6c57c5c07so3839265ad.1
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2026 21:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781756127; x=1782360927; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BfHcgqSQ36vYhDqHmgC8PrWZm4ZineJsZ74HvJVrPIM=;
 b=A9BXRNGtETvbCqvpIrA3waz2PlmFvJKCol548Je1VNOur3+GfuiAtvuGMPPOzuQddZ
 9viRHUKfFWm5hT9++qHzPbtODznH6lzHE5YSYES+T+JP0FJIt3FHhCiLAu8n8lz5Cfqn
 sH/W5HKuEPGrKsc78yfEMYbyOdwn6Sr3p2bUfR4+rLZkmqrqcEYGsT/pd00YO0bAWqO5
 U6n7kfiVeNRbzjkOGOyu/+DPlvyKq+JJU8oiJuq9sRzVMFvytVRrkQfHxFVRqm6NIHFW
 Qo3RqMWqiBHSvpw2FPYnsNlFbWJzYku2gYPm9AAt2/dJLElU/l139OnT7WGwoY5PvtmK
 w7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781756127; x=1782360927;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=BfHcgqSQ36vYhDqHmgC8PrWZm4ZineJsZ74HvJVrPIM=;
 b=dZL8pE5VW+SUE35qL5X3TZPVEa3ecBGtn+vuO7Pbj/SjwucQcg2elUeGD3YZ1BOSmD
 6HtPSapWSzKnHPPUlZSGF9b47mKuH/wfGpXh83Pr9nxBJMQ7c9E5M55Y452c6FJ2aCZd
 O+h0OI5sENNecaWxLOriTG0aafYeSpQN4tHCIve4LU4pydJh39oYfACtDWLS/D9XDkov
 v84pBvk1XacIT6YiAqrz3Zc2MsblBuJT/B+qGEmVTCIlsmM7TviRf1UVE9HU8erl/rik
 21SyVaxQDnNrYnjpLxLwGlxT7HKOx6VjhMXqrcCLvngQAM4VNF4hDraSRuYi4/mtySfs
 japg==
X-Gm-Message-State: AOJu0YyVUyryTZyAXIFGoj94wWMG2IMIIa+sKvkWjLAUB8Rrnc+iE6ug
 jFaArmhTDddHd80XpYn4pghqiRpsalJCGTo1VGciuyITq5wvMd4L5/obVybwEOqlsEg=
X-Gm-Gg: AfdE7ckQrdgW7alynx2cdLBwtwNLoVhqCHISQ3A79pp6FeBP5E+WsXXS+HPU2CDujoy
 qcsFRUS9OREuWw143YSYJl0WtbNZuxV4r0BZrzAVHt3OJl4nm2Lbv43UnRJH44L/Yl62muuPV8l
 HJdih6hBJd5CGabK8+Dlm2gOHzYx9kqccRxjNF5uZiuKjGZfw6/t2UW5Zvs23bq7E/fqLht3NRU
 BMb/157QGdI2rswTwK/qy+2EF2utODuWL8gXZUTahC5mVhSdl2aVg29OVY/EgUjYo9DwtcJvOEe
 e8YUqkRbpwCzIuix6RdTedAKHpFjuvEdlN5ku1RZAjI2E3WL8HTIK5Z+gaJrJFAfYqMkmjrTAp3
 paNkCIYGdPiDBH1+urSZYFfdehgtizyWEkVgpjPODim7FF9jNdbD4m6N0IjZPfIsYCXgPRxN+e5
 dBteMNiCUXj5EGLCwNCp0A5UzNcrI4SU7nvqjPyA1zIk+BhmVFyQ==
X-Received: by 2002:a17:903:32d1:b0:2bf:2015:5b93 with SMTP id
 d9443c01a7336-2c6bc0b4c2cmr72800895ad.11.1781756126969; 
 Wed, 17 Jun 2026 21:15:26 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c42f2e535csm173905935ad.6.2026.06.17.21.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jun 2026 21:15:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 06/10] target/arm: Implement FDOT (multiple and single vector)
Date: Wed, 17 Jun 2026 21:15:13 -0700
Message-ID: <20260618041517.573469-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260618041517.573469-1-richard.henderson@linaro.org>
References: <20260618041517.573469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sme.c | 8 ++++++++
 target/arm/tcg/sme.decode      | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/target/arm/tcg/translate-sme.c b/target/arm/tcg/translate-sme.c
index cc85c6d6e0..8fea451089 100644
--- a/target/arm/tcg/translate-sme.c
+++ b/target/arm/tcg/translate-sme.c
@@ -1170,6 +1170,14 @@ static bool do_fdot(DisasContext *s, arg_azz_n *a, bool multi)
 TRANS_FEAT(FDOT_n1, aa64_sme2, do_fdot, a, false)
 TRANS_FEAT(FDOT_nn, aa64_sme2, do_fdot, a, true)
 
+static bool do_fdot_fp8(DisasContext *s, arg_azz_n *a, bool multi)
+{
+    return do_azz_acc_fp8(s, a->n, 1, a->rv, a->off, a->zn, a->zm,
+                          0, 0, multi, gen_helper_gvec_fdot_sb);
+}
+
+TRANS_FEAT(FDOT_n1_sb, aa64_sme_f8f32, do_fdot_fp8, a, false)
+
 static bool do_fdot_nx(DisasContext *s, arg_azx_n *a)
 {
     return do_azz_acc_fp(s, a->n, 1, a->rv, a->off, a->zn, a->zm,
diff --git a/target/arm/tcg/sme.decode b/target/arm/tcg/sme.decode
index 80ad674cf2..3c7caf8bdb 100644
--- a/target/arm/tcg/sme.decode
+++ b/target/arm/tcg/sme.decode
@@ -449,6 +449,9 @@ FMLALL_n1_b     11000001 001 1 .... 0 .. 001 ..... 000 ..   @azz_nx1_o2x4 n=1
 FMLALL_n1_b     11000001 001 0 .... 0 .. 000 ..... 0001 .   @azz_nx1_o1x4 n=2
 FMLALL_n1_b     11000001 001 1 .... 0 .. 000 ..... 0001 .   @azz_nx1_o1x4 n=4
 
+FDOT_n1_sb      11000001 001 0 .... 0 .. 100 ..... 11 ...   @azz_nx1_o3 n=2
+FDOT_n1_sb      11000001 001 1 .... 0 .. 100 ..... 11 ...   @azz_nx1_o3 n=4
+
 ### SME2 Multi-vector Multiple Array Vectors
 
 %zn_ax2         6:4 !function=times_2
-- 
2.43.0


