Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C8E4F9EDC5
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 12:53:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFX4m-000623-N7; Wed, 22 Apr 2026 08:53:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4d-0005vN-5K
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:52:59 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1wFX4b-0005SO-Ju
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 08:52:58 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-43d7645adbdso2944265f8f.1
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 05:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776862376; x=1777467176; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XRTiu65oEEP/NVXKQGmyzqv/GBntii32+7VLEeXU9Tc=;
 b=gyHW7rG8C8QZflsWVCFeA3+wYVi8bdRtLVlwYvpaVSNM9QxnjT0YtLfGS90U4EftSm
 cWpCVQTQzjLqNDK9b3oME4iVnUXy+J6AwbFLR4OfS5Zvs38L3XkDUXt+MY2leN91334t
 iVNsCGO5E5nH3f2KaMEBXzDeoPRr++BonY0ZFpsMC9i9017rkJQFPiExljNf9cQhDjer
 t+JQ4C99uFatvSLR4rMYfuPbiA8z0tEbRf92PWDSf4/MjBCkEhKVoKy0YwkS3RLFG5Bc
 Oef939WYPJAuHZmuo8nqAq4J1vHnEvRk28hATIlc86U6MzOIrjMzOTbOsf7KomH2Paq9
 iPNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776862376; x=1777467176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=XRTiu65oEEP/NVXKQGmyzqv/GBntii32+7VLEeXU9Tc=;
 b=dwglxSUcJA4SBSgduioeCwADC1J7ZhU1/ScAxpLmdvKa+WiQHn8ZkBdvkUembvdcUS
 PyUeE7EEJaoha9kltXS8TsZbDMYE77n/WfMZiLGy4rB3ZMl2U3szAO6u+NrRxQAsokuC
 x341JiV9fwa/UDHfUPsPIhIFsJd0CrZAMXIZ7J86ZaH4tZOigpMKCUinP+63Vdyq8ArN
 IrqRlcyLiKbXXg3Uvo2p/2Mk1Pamq5d1VkHuEPyFx7xrRVKn7jHyHHWyWvxwcW1g758h
 btb5x1nhiR61DfOFsaZzMDIFXzmyhn7F6pNNquPP2GHfDKLJ/AJIT8EqF4yKoEYnJnpR
 CjKg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/n+FYLUIW6QD5A7LFVevA1E89De3S4nZc8T55gAfaX3relbUh2F7PsramJ31JjSOUZuGoWtDOK4A==@nongnu.org
X-Gm-Message-State: AOJu0YxZTmg8ERPF8XgGVqG6015CsrRD8UpA5nShS35VfO742vkYJImR
 vdOsm3La+mhXyKAqqZLqrM0yHr7/sY5ZcZv+/OE2I5Wk/jWGp65mXt9DZnuyioG68uQ=
X-Gm-Gg: AeBDieuMkzFPnMrd07rGRrcyahSPM81R7AdjRzROR6zLEuGz8Bt7ahIYu5oI4mleeaN
 OPh076kK7wyRqnJBLSVMV4ND2L6dKhjyivpwx53seuhgB4u3HzagjawLAegUhy5iXV9t/NMewBR
 0LJNVHpmkYwr82ABlHZ4FDW5hMJtlU1HjaPL1Ob6BcjJObibIb77EkiUh5ugys9h5xuyR8VGdqm
 UnEo6zOlgA9QswSCrTIGE6yFpF/S1cbpPSEFGUx/+9/80uyrjvE3kBOFv1q5rU4LXBjI2Xcuaiw
 jwtlkj9nvbiTlkh0s89Yx/IIU85unUxuH8bUJMmCEEPX++09kdqxTOr8Bp/Ts9SvYmJNmgDbU3+
 uOwFHTjEL2R7XWW5T8/OrsE28/vCBN3dg3RbW6PuWBvmCvszuZJQqZ8Ml3SlrDTqaaqeuPtKfGI
 djPYHMIzNaO+jVuIM4Uasy41msbCzm3p67+g==
X-Received: by 2002:a05:6000:2207:b0:43d:6a02:b7ad with SMTP id
 ffacd0b85a97d-43fe3da668bmr32520165f8f.4.1776862375765; 
 Wed, 22 Apr 2026 05:52:55 -0700 (PDT)
Received: from draig.lan ([185.124.0.195]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43fe4cb1365sm48295853f8f.7.2026.04.22.05.52.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2026 05:52:52 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 46D9A60338;
 Wed, 22 Apr 2026 13:52:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, kvm@vger.kernel.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 04/32] target/arm: migrate eret trap syndromes to
 registerfields
Date: Wed, 22 Apr 2026 13:52:21 +0100
Message-ID: <20260422125250.1303100-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260422125250.1303100-1-alex.bennee@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

For simplicity keep the OP as a two bit field rather than the two
interlinked fields in the docs (ERET/ERETA).

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 72051443d59..63c8e66ea91 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -367,12 +367,21 @@ static inline uint32_t syn_sve_access_trap(void)
 }
 
 /*
+ * ISS encoding for an exception from an ERET, ERETAA or ERETAB
+ * instructions.
+ *
  * eret_op is bits [1:0] of the ERET instruction, so:
  * 0 for ERET, 2 for ERETAA, 3 for ERETAB.
  */
+FIELD(ERET_ISS, OP, 0, 2)
+
 static inline uint32_t syn_erettrap(int eret_op)
 {
-    return (EC_ERETTRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL | eret_op;
+    uint32_t res = syn_set_ec(0, EC_ERETTRAP);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    res = FIELD_DP32(res, ERET_ISS, OP, eret_op);
+
+    return res;
 }
 
 static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
-- 
2.47.3


