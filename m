Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3080DC43458
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 03:07:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1welG8-0005v4-6X; Tue, 30 Jun 2026 23:05:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welG1-0005ks-VU
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 23:05:02 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welFx-0002sJ-4d
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 23:05:01 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2ca06ad2d11so1499235ad.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 20:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875096; x=1783479896; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bn7nR5aCNzjwIjjAfoSQIcT16OvTScPNGETb7yLySDw=;
 b=cLX6OQSJrcyDlg/eHUOcX3E0MfG2lE6rW+7AFwPGXS3LUNfhGXvhKYe2KNluj58/KQ
 4+E4VdeR8J5RAsCNtoYs37apCuHSrdGO/Sg2FJVETa+0d39hzAClo1nXuW1RJyCtcSXA
 t6NCG/ZK5T1hilDYnrn7TADn+fJsexNJx5GCtIuGKqJz3ZQqfAXDDejeLaNXIvjDXDBo
 /mbtz7OB95dJ5tc/ApBoyrkLKHQA8QS6Zt4n1lWpV5EyuB/vCW7Tys/Ibrrj2vrZqeqs
 OcYlX3UiQUCYFDayYqzN+zkdHnRHFhGJLbBEEAq50y041OQCNCSj70JmU06NlpBK2e1I
 VoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875096; x=1783479896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Bn7nR5aCNzjwIjjAfoSQIcT16OvTScPNGETb7yLySDw=;
 b=LjEQulDRCGspFN4yBsUD7NcgVy6ZGe8oXjQDp1E4dh21Kw3OKpPmf2DOP5yjMV6wZB
 nZRZBbQYCl6CAdxy5tuAK4FLAA+IKsKzTIFHIGBrpT5lYS1udZB8AtfuXN4qnvi2xJlP
 y13Rj2LKrTuQJ63a/xI8Dv8aI5kxm2k2RTcjcHBXy45dWL+0WGk2SNmgRZK2GWQC6jlg
 Gj/3FWnPpP56yJb0h3+PlaudLNZHgbx9FJNBIU2K0Q7OBKNbm3f0memSuKDsUIg8Jnwr
 DPVQ9TBC//iPoriJl1X/u0ZpL0mCsMOHE849KgsP4IkEm52K8lEXdT0B1C6kFpfYBA18
 xe2A==
X-Forwarded-Encrypted: i=1;
 AHgh+RrRmJsf3vt/ULacI/OKP2a416LZN5jjGvL9MWzL9ph571bgDybboYfgnzYlMvyUlKf4c7HmjrUyNQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw1jCCP+cP/jCjEIWGVyX1SADYdQ4etg5kZGXW2RsPDIsf0vJ3s
 LR5QLUB9jKgjX9mz5AI3Kh/LknoRKxEJPSM0P6eAPtzCJiUYfoYhWipOn8FKrP1ft2s=
X-Gm-Gg: AfdE7cko7zeF8w+BGkVyN1Da7gicPEkTXr+vZfwOlePUCVCN938AAOx3F+/qEsEh6/K
 pKXmuf8flBvBirUi38E13nGI3E00zFn1uQyKEnZpsaffOJEp6f9RMiLy1PTfPms6LojFvz85nuL
 OhX6Ft4QOwTuJ39hzdKmUUYgVcsmiYoK5iaIYpC5zPRCyV5+2cYxS9NrnzNa8cvQDSbgMIgH0vK
 5k83Ss0CKio70/7ell0zUhNRsJ5SUIwPKhHQUPw2ENnDn9YnzkWPTexGf9aBl2xnxA8q6844j4I
 uS7Xr22o6zC0AHg+lNg3QiCHHtXCsRaG51i8Z1/PYFE8Fk6/Lb8gHl4AP6t1or51RtLUIRU5NSF
 P5+Y75MKv4DyE8BOAJ1pOUnMex6DfKpId3JfxrqHLjFPVPziqmPhV4lE7xU7aXEDGCTxrit0CNX
 cyfLu/34F1vWr0u9pV52dvbTdo5lqcVLmV6t55L8/VLwbdEXUOjQ==
X-Received: by 2002:a17:903:f8d:b0:2ca:75af:1a92 with SMTP id
 d9443c01a7336-2ca75af1c05mr6048165ad.33.1782875095494; 
 Tue, 30 Jun 2026 20:04:55 -0700 (PDT)
Received: from stoup.. (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ca37c74261sm23758085ad.22.2026.06.30.20.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2026 20:04:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 13/17] target/riscv: Set ID for watchpoints and breakpoints
Date: Tue, 30 Jun 2026 20:04:39 -0700
Message-ID: <20260701030443.1382447-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260701030443.1382447-1-richard.henderson@linaro.org>
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
 target/riscv/debug.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/debug.c b/target/riscv/debug.c
index ad9df09cf7..5f76dd4b7a 100644
--- a/target/riscv/debug.c
+++ b/target/riscv/debug.c
@@ -479,7 +479,7 @@ static void type2_breakpoint_insert(CPURISCVState *env, target_ulong index)
     target_ulong addr = env->tdata2[index];
     bool enabled = type2_breakpoint_enabled(ctrl);
     CPUState *cs = env_cpu(env);
-    int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
+    int flags = BP_CPU | BP_STOP_BEFORE_ACCESS | (index << BP_CPU_ID_SHIFT);
     uint32_t size, def_size;
 
     if (!enabled) {
@@ -604,7 +604,7 @@ static void type6_breakpoint_insert(CPURISCVState *env, target_ulong index)
     target_ulong addr = env->tdata2[index];
     bool enabled = type6_breakpoint_enabled(ctrl);
     CPUState *cs = env_cpu(env);
-    int flags = BP_CPU | BP_STOP_BEFORE_ACCESS;
+    int flags = BP_CPU | BP_STOP_BEFORE_ACCESS | (index << BP_CPU_ID_SHIFT);
     uint32_t size;
 
     if (!enabled) {
-- 
2.43.0


