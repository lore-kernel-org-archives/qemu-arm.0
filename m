Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BE2EF9B608
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 10:14:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFUYm-0007PD-2B; Wed, 22 Apr 2026 06:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXq-0006tc-P4
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:59 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFUXo-0000mA-3L
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 06:10:58 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43cfbd17589so4132850f8f.0
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 03:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776852654; x=1777457454; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AJ6frWkT466kUBA2I2u6c2X58fkiBAsV+LbvLNVH5Kk=;
 b=or2KlmudFSa5ZRH6JDstaf6ixiyRlcdOkakx4p6gUZnwIlmpQieL7BXJxrZZIClq0+
 VrnyCO0lAAkl2M7fnt/TKvY3GadEH0i06iuP3SvrVCLVi63kWlYLNgHqOAnZNe+Ernpg
 WxD7+SD14/lEI9bn2o1QAVbg2Gnrbr009Ao3+q7s6qs8mUIY1CU4WX1L3/8cjmW0PE4f
 003tdkU9yMuozQWyFu4PqjArTCyNWImcR/q05VAaegKWwv7HYqP4qZYoepox2GNK0SNo
 cgK6MVuxZApsiXVRTJF3a83R1Ua8rcA/J58YjWMEBBO4C7IN+tkXAmdYmDIn3mODbzMN
 n+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776852654; x=1777457454;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AJ6frWkT466kUBA2I2u6c2X58fkiBAsV+LbvLNVH5Kk=;
 b=shW4C4P2dr8+xBRgIjW+TuwqeTHNlIfudeP80j54MIXP4Q7B8chJd//dxLgnBBYRMO
 nXGxX617fwz8WoYIk8JDnpx7OkjuhqXzmIYZTIt7zVJNFimASz3No0ND5vjg9AqI1YRf
 JljkBhp0PqC/QsFkTH4+vMI1YH9O+XgNyDlqDWmSGIZLRbwlxzXQ6oGLBLlI/npN4vxH
 E76R9A6C9BmsYWL84vZBWiJTyJXu/r7VRnzo24DTvEiM4RJDkDBh1bnczRVGDJy7aKeC
 77JxDLJbNOMmPNIs8bpX41+MoDLQ1EvCLl8ogPvo/Gu52fdokqBbVxO4OnV4WPblac5c
 26Jg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Efio5C/rZuB2hwVN/l2YYsZgYh4XMZhAAvBcqM0RjqjLyZZ1X8GvLOT6umcTOkdnAVfu81IllQA==@nongnu.org
X-Gm-Message-State: AOJu0YyNiTc8UFtAkK3qjERaemr/JaYPrRORZ8Hi/sVHJ7rXkrqqbwu5
 JgS+ailc4HCwwqc7UoK6C8lzFz6P8UuELCH3bN9R+CmmNPWnJsIqIkmZY0ZwiD2e/j4=
X-Gm-Gg: AeBDievtYegmQ/nLrU3mj7w7q83VMleAM9Wg1kEp41wPC/LwiDKy2I98JSjTHgPIc2b
 l12MlOee+iTkaaPznFYneieA6KBvE4gCuw2M/GonzLkS4gNVv1luLi7NBQlyhc9kuNuIUROPMY5
 0FEqO4u0/i4RfAc1tCrBq+2A+ARmo+DxIRWKhaoHHpo79XEjog6kYKCZKZ1g8tdQD/wJuaqZlAg
 75azZQL83J62sZkYpCleMsSLdUEJTQiZ3fEBmKg4Il+CwmjRF3Y1ztf8Bsq7m65ytrd6g5IWWnF
 5NmKScQj7P4ISDhzpOpQZ84Lp14yQpSuywLwmrXIHFLJpaX4yhPMM0VY8yWs6CCNhUFMO5EWh7M
 Ax7FZu88fnYQNbPMcVCm8HYIvRqVMevrltu5G8goJQnaP7iDo0yx6xaypTV5lm17oYM8MVghnoS
 H4Bv1SshCXFJIlsKdNeX2OqJoIZvc/4qQlYw==
X-Received: by 2002:a05:6000:1a8c:b0:43e:b0f8:66f1 with SMTP id
 ffacd0b85a97d-43fe3e0b86emr33151843f8f.43.1776852654367; 
 Wed, 22 Apr 2026 03:10:54 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e4eec9sm42224451f8f.34.2026.04.22.03.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 03:10:52 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 880F161028;
 Wed, 22 Apr 2026 11:10:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 Pedro Barbuda <pbarbuda@microsoft.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 14/31] target/arm: migrate memory op syndromes to
 registerfields
Date: Wed, 22 Apr 2026 11:10:25 +0100
Message-ID: <20260422101043.1234229-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422101043.1234229-1-alex.bennee@linaro.org>
References: <20260422101043.1234229-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 7ff8c30e2bb..841fd3292b8 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -742,14 +742,39 @@ static inline uint32_t syn_serror(uint32_t extra)
     return res;
 }
 
+/*
+ * ISS encoding for an exception from the Memory Copy and Memory Set
+ * instructions.
+ */
+FIELD(MOP_ISS, SIZEREG, 0, 5)
+FIELD(MOP_ISS, SRCREG, 5, 5)
+FIELD(MOP_ISS, DESTREG, 10, 5)
+FIELD(MOP_ISS, FORMATOPT, 16, 2)
+FIELD(MOP_ISS, OPT_A, 16, 1)
+FIELD(MOP_ISS, WRONG_OPT, 17, 1)
+FIELD(MOP_ISS, EPILOGUE, 18, 1)
+FIELD(MOP_ISS, OPTIONS, 19, 4)
+FIELD(MOP_ISS, IS_SETG, 23, 1)
+FIELD(MOP_ISS, MEMINST, 24, 1)
+
 static inline uint32_t syn_mop(bool is_set, bool is_setg, int options,
                                bool epilogue, bool wrong_option, bool option_a,
                                int destreg, int srcreg, int sizereg)
 {
-    return (EC_MOP << ARM_EL_EC_SHIFT) | ARM_EL_IL |
-        (is_set << 24) | (is_setg << 23) | (options << 19) |
-        (epilogue << 18) | (wrong_option << 17) | (option_a << 16) |
-        (destreg << 10) | (srcreg << 5) | sizereg;
+    uint32_t res = syn_set_ec(0, EC_MOP);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, MOP_ISS, MEMINST, is_set);
+    res = FIELD_DP32(res, MOP_ISS, IS_SETG, is_setg);
+    res = FIELD_DP32(res, MOP_ISS, OPTIONS, options);
+    res = FIELD_DP32(res, MOP_ISS, EPILOGUE, epilogue);
+    res = FIELD_DP32(res, MOP_ISS, WRONG_OPT, wrong_option);
+    res = FIELD_DP32(res, MOP_ISS, OPT_A, option_a);
+    res = FIELD_DP32(res, MOP_ISS, DESTREG, destreg);
+    res = FIELD_DP32(res, MOP_ISS, SRCREG, srcreg);
+    res = FIELD_DP32(res, MOP_ISS, SIZEREG, sizereg);
+
+    return res;
 }
 
 
-- 
2.47.3


