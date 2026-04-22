Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC0A4F9EDC4
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 12:55:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFX5d-0006XT-2g; Wed, 22 Apr 2026 08:54:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4l-000619-Fc
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:07 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4i-0005VB-9r
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:53:07 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43cfbd17589so4297215f8f.0
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 05:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862383; x=1777467183; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AJ6frWkT466kUBA2I2u6c2X58fkiBAsV+LbvLNVH5Kk=;
 b=iEYjAhuf1K3tcWevmHgmWCg0aZbBHmAsIJKAbCoMoYYg5gkJWgyLISeHnzLupYH/IB
 vEdj+G/SA7PuaiK9CPR9MLSdKges0j9/ZbCDtzsJCPuoLNEkBlRxCCGpbsKnUAA+gJvK
 EyEWDZxPXw5BQ2pv64UJOd0wHabqCtUfhBM2Tjmhs79GU6WdIL6waFCqGLkQYIsCS9HJ
 kO6xpc/P8jeU3tEkYa8pk3Mk+OqHUYXF96OXlU6+xi2M7s4kb8PAwdFlbRMAACrIrUx3
 A4KdGQt+vtdhPQS9GnjKo9VD8qH/36tv/nsGZSXJDbSXMOkaX3k7GpzwVANaxwKO04p+
 v0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862383; x=1777467183;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AJ6frWkT466kUBA2I2u6c2X58fkiBAsV+LbvLNVH5Kk=;
 b=Chhs8QP1cHFDhgFAwJvQPcTM00xlKZibpYxiYtE8Od1/bAXbDAm2GM0A1OwGwWsJT8
 DGkC7lz3PBWrdnNDC3qfOJ8nSJ+S34zhpmwr1lmA0ezz6hHqmyYQBPhoa8CereLCck7t
 oW4MCGxl9mUrbqkPrEuqjStz9Laj1Y5QmX9CxZpOzsx/VyXTh/PKAFl70en0ZbLZun9D
 iBNHncS+7fJhyipGCC5b8xvJ5/pQlh0OyFVq+CIS2LpEl59nCI5Cy1CF2J5GACdF7ys4
 Byl4V//9G7UTqk5HkKW+AEJX165gWllWpf/frpKFB7iZVQ0ukm9SSUpTKxaq9EhcoBFv
 fnJw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+pmC0jgJ96mMgePrlY9uFFkrY7Rh2zOLlwDkg1hgnU5TUzkU8UutXafXPdLK9oOqQ447NX3WAJbQ==@nongnu.org
X-Gm-Message-State: AOJu0YxZs6Dl9S8Ap+HndvuqHzuAwlM2o9pb5aPv6Jf0wqjeeg/BHsuL
 wRP76I+ZXkYDC0b6qVO37GeH3sMlaxaUqnptLltq1VKVKRrzOIGA5OrCFIfbs0HUix0=
X-Gm-Gg: AeBDiesF9/gg9LT79UpPPUckSFXFtITNyXvmpkAcqZa7kEuQx8LXzNz5zi+5zj0xNyH
 9M0SOTganD/f4DH6iT+xGFjleK4FmFJsIfjJA+QxtJSIVxCxxtjpNcw0cBPc16lJSXDf3k1jnI4
 jfge8ChGuuPcJd0Y2zYIRK/iK9jJaze3wygktKzccuBolzRJR0atlRgdefO9do0oiOGal27Y5vf
 ak6COGu3hohtMInvdJadN3y0yUuaUSwF5ErP28kcLdgsxys45YuP2C9iwkNoBHVEROojD1bPIHt
 82Q3EFL3Z6nVuuWWgPdA3HJi1TnJFOXIzjPAf6y3uZJ1rHuE9VoeB/yNxwoX3w0RuRgsg1T1MwS
 mmpU9TqKdP6AfEaFoDCQxjQFIloeJEtNQC94uK+d/z2oRDqyzJyHKsadMgzX/eFEVM27LshFNE6
 yz/DDbgzPnhgXpSvqjDZzuJq0IfefZgiH6WA==
X-Received: by 2002:a05:6000:184d:b0:43c:ef4f:79e4 with SMTP id
 ffacd0b85a97d-43fe3dfd36fmr33892324f8f.37.1776862382774; 
 Wed, 22 Apr 2026 05:53:02 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4e59f97sm50548552f8f.37.2026.04.22.05.52.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 05:53:02 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 15B9961028;
 Wed, 22 Apr 2026 13:52:52 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 14/32] target/arm: migrate memory op syndromes to
 registerfields
Date: Wed, 22 Apr 2026 13:52:31 +0100
Message-ID: <20260422125250.1303100-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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


