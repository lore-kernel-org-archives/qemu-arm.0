Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9267ECA0FF0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 Aug 2025 01:20:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ur4j9-0003a6-UI; Tue, 26 Aug 2025 21:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hl-0001b4-3o
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:12:02 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ur4hQ-0000Aq-R8
 for qemu-arm@nongnu.org; Tue, 26 Aug 2025 21:11:58 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2445824dc27so60729425ad.3
 for <qemu-arm@nongnu.org>; Tue, 26 Aug 2025 18:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756257096; x=1756861896; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NBOnBkxFaEwe2K3Bn4cTXQl/fQtmv3u9jbbXCvu41Ds=;
 b=CV80/sSCt7fcdxW7SHqsAhpP0WvRn2SAnhwqWqd9xmyGY1CBuCo3jYaI7HdeTeIxU2
 3PpN7JrrpzUrwDlzxjZfMSo9mIN6lck+bRkcK/vAHENofMxGZJCh0er3OaiKTrFIwE5a
 mYeq5pRs57nOszvmfPEKXuxvGlzDgXwSk9OC5tvz560IlQG5+ETNQpXWLzOT9oIAQy2n
 FM2+WZZ+j2AghYY4zTGfA5h/omm68iiCRIKEzkmB2hMTVUNTa7WpBAhkY+SxGh8nGW9G
 9F1NURy7DmMqroeirMGOR++uYpz5j5RRmak13FldAwhls9gRKTUbBdnooqKZQbfuUbuq
 BwMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756257096; x=1756861896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NBOnBkxFaEwe2K3Bn4cTXQl/fQtmv3u9jbbXCvu41Ds=;
 b=tOhqrxgWHFTnYGJ+rOyk+DxOeSCdYACYsyO2NCBrRpeVnT3zMD4Y2hPZ40R++5YdQ3
 KP7Pw/nOA6QlOwCPYug4VW4SouxxrlfpZxdrJr1xiZ4/Lia6XHWSFEbPrAXDhPk0dMYy
 EYKU++ZKh8Jtqh6AyvuJHZLTu2pS+nScoLRURGlXHZHgKMWdv8bGbD69VpV04ZE0ieCC
 8v+U/KEEGQv0FUU6X23okSdhoNYhGcJyOuMKVt3MEeQ/QwEEzSGTzzs6ywTeNndn2XHG
 U+RdWHXvDWilTs/7r3K14Y8G2qIoVKYLSn1BKWNtNDH+Fv/SZ5eDQZtRyfhvfmK61FTN
 2GiA==
X-Gm-Message-State: AOJu0Yx+rlX26hualVQJq/Fhry6kNAWsVHvvbS6c5JvCuf+IB739idEl
 bDMamLpJ8ZF8QCHLGiqGCj3RGdAvt1u49vjU18lv9r2GkALh+998qhysSACl8mmz70s=
X-Gm-Gg: ASbGncu1+yDsSdA5aIiAVLjqBiPvdeCcSa1fj0UlkYIRZNzdHYRkeV2oOC34kGUVvuW
 q+ooP+jOhRQ8n97bS5uP1OkmLsWR+YiT6dRK+vSa7v3MNliIcSYyvDvhqD93iVF1exy+bJ+sSn2
 4KUaVoMKNg5ZrkKC7wF2/fDYlhomXltU1NYfnlzebmZYKzPL8QoRWoogHhQKF96TKRNn6qgHLir
 RZrM+Dbpd38E3n3xiRLGJs1NPLPOb0RizWdJCPfXlfy6zAnr8/KzVVA+hUTZF3lA4nLKU3vIZgE
 DQvY/oimXiln+D3+qLX/w50wVTPVqCNKfCKIF2hyT73AcBSjhGQlxhsIgjjH8f9MCd6YptmT1iD
 hsc69OHglRMI9KNSJITI6CxLUmlfHieLTDOnT
X-Google-Smtp-Source: AGHT+IH/zMfczHEuoM7jzSkWFJSo4yMbbQ7zHhsJ/G+n+LuTnOIoWsq+VUUjnfR0aMph1uP23F3TZw==
X-Received: by 2002:a17:902:e784:b0:246:42a9:d38b with SMTP id
 d9443c01a7336-24642a9d45fmr162358605ad.21.1756257095733; 
 Tue, 26 Aug 2025 18:11:35 -0700 (PDT)
Received: from stoup.. ([144.6.121.55]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-771f2b2d2bfsm4348408b3a.93.2025.08.26.18.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Aug 2025 18:11:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 48/61] target/arm: Migrate cpreg128 registers
Date: Wed, 27 Aug 2025 11:04:39 +1000
Message-ID: <20250827010453.4059782-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827010453.4059782-1-richard.henderson@linaro.org>
References: <20250827010453.4059782-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
 target/arm/machine.c | 50 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/target/arm/machine.c b/target/arm/machine.c
index 6986915bee..35ff28cc30 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -868,6 +868,34 @@ static const VMStateInfo vmstate_powered_off = {
     .put = put_power,
 };
 
+static bool sysreg128_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+    return cpu->cpreg128_array_len != 0;
+}
+
+static const VMStateDescription vmstate_sysreg128 = {
+    .name = "cpu/sysreg128",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = sysreg128_needed,
+    .fields = (const VMStateField[]) {
+        /*
+         * The length-check must come before the arrays to avoid
+         * incoming data possibly overflowing the array.
+         */
+        VMSTATE_INT32_POSITIVE_LE(cpreg128_vmstate_array_len, ARMCPU),
+        VMSTATE_VARRAY_INT32(cpreg128_vmstate_indexes, ARMCPU,
+                             cpreg128_vmstate_array_len,
+                             0, vmstate_info_uint64, uint64_t),
+        VMSTATE_VARRAY_INT32(cpreg128_vmstate_values, ARMCPU,
+                             cpreg128_vmstate_array_len,
+                             0, vmstate_info_int128, Int128),
+
+        VMSTATE_END_OF_LIST()
+    },
+};
+
 static int cpu_pre_save(void *opaque)
 {
     ARMCPU *cpu = opaque;
@@ -900,6 +928,12 @@ static int cpu_pre_save(void *opaque)
     memcpy(cpu->cpreg_vmstate_values, cpu->cpreg_values,
            cpu->cpreg_array_len * sizeof(uint64_t));
 
+    cpu->cpreg128_vmstate_array_len = cpu->cpreg128_array_len;
+    memcpy(cpu->cpreg128_vmstate_indexes, cpu->cpreg128_indexes,
+           cpu->cpreg128_array_len * sizeof(uint64_t));
+    memcpy(cpu->cpreg128_vmstate_values, cpu->cpreg128_values,
+           cpu->cpreg128_array_len * sizeof(Int128));
+
     return 0;
 }
 
@@ -994,6 +1028,21 @@ static int cpu_post_load(void *opaque, int version_id)
         v++;
     }
 
+    for (i = 0, v = 0; i < cpu->cpreg128_array_len
+             && v < cpu->cpreg128_vmstate_array_len; i++) {
+        if (cpu->cpreg128_vmstate_indexes[v] > cpu->cpreg128_indexes[i]) {
+            /* register in our list but not incoming : skip it */
+            continue;
+        }
+        if (cpu->cpreg128_vmstate_indexes[v] < cpu->cpreg128_indexes[i]) {
+            /* register in their list but not ours: fail migration */
+            return -1;
+        }
+        /* matching register, copy the value over */
+        cpu->cpreg128_values[i] = cpu->cpreg128_vmstate_values[v];
+        v++;
+    }
+
     if (kvm_enabled()) {
         if (!kvm_arm_cpu_post_load(cpu)) {
             return -1;
@@ -1119,6 +1168,7 @@ const VMStateDescription vmstate_arm_cpu = {
         &vmstate_serror,
         &vmstate_irq_line_state,
         &vmstate_wfxt_timer,
+        &vmstate_sysreg128,
         NULL
     }
 };
-- 
2.43.0


