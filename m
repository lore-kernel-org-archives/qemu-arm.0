Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23F9CCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 12:39:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBuXI-0001Ja-3f; Thu, 23 Oct 2025 08:35:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBuUT-0005Y7-DR
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:32:33 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBuUM-0008Qy-Jf
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 08:32:24 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-471bde1e8f8so4191715e9.0
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 05:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761222736; x=1761827536; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2PQ5wLHIh1tilthViqEPnFwykJP2NvAn5yEKkrPw89I=;
 b=mVWQp41g2+HPwhIIkaoE6kkE78F+06Q6dmIE1kHDllOa8+Tqwnx+a80+NKXdpQvjRI
 diADLQJVAqxZL8AobxsCocP9d/JuBDpOXOYxhUp4FK83FLlzFr5jgl5uGfXjiftiCZEM
 uVtV/1mbM7w8O3ARdWad6PA0TUDV6Ktz/wNmXTPmJ0pIG2fZFkwzLS32kFNDTbHExqi+
 NKpty7HTsoOiF3cPBXMBy5fpOAFafnUrmReQ+GS0BpWA5x++/OVI7T56PrEQJ96vETcR
 jGr384KAh0z7VsrWY7ITMfa4gbWXa7vFVk6Soa3BM1qJRKrx8mznfxqsYGlI7AAq9gx9
 8C+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761222736; x=1761827536;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2PQ5wLHIh1tilthViqEPnFwykJP2NvAn5yEKkrPw89I=;
 b=PT1Cueg8Uf2fvGM7DSehNNT/1htb6HClacVh0HO9h/5DZRg5VPfRAiTfaIOdGSAS2a
 1Dy7ISYeJVsWbXJpktXCKrDOKEUyOle/gZJ2yIabLX1S6qqmqnCVtP3YqvKk/5pn8wV5
 3HvZjnEYM2ioC4AGCnNI+3SZ/YqS+RSIbqwBna6cCtfXXFqIL/3LGC4rUBOJjCg9ELQp
 /u8vk6iAi0nFR1igMp5lOVRnHhHCpjZYwYK+3/lMu2xXYmA46c0gqM8eGIEMLaGqDqvs
 CnQL4iJrqm9pMK7t0ViErSFMNhmY9PMjmbN2Lh07skEUjcw0rpSEQzDzjtrvfgCwXj+v
 qlcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN3LZ6QB+dF3wOA81PJXPTVWwNZK3p0l3atGAHpN3dOaNLOk0wu4m0Z0XxOr+aNi117sCzv+qAsA==@nongnu.org
X-Gm-Message-State: AOJu0Yz8g0OzaJtZf/e8i1UulCH5BFMdcSqtutzZVM8u/+EEJzyjjjRy
 Cgy5CHOb+LqA38bMVUwpGebYVJKx21WABJ4/1MwkTUWad3kIrzzzYd37sbo0Dsxl6GM=
X-Gm-Gg: ASbGncscq65Jo7n68D8kIWOQ4flonC9ugNXD7CpvHxsawE8rblusQuwpuveOhUoSUzE
 sFef+1m8kbLcYDKUfa4o84QoHSK5j/xRiwc/XZgk7PNMGDf6lWTr4MMf7byV9MSgIDqQrRWqwRD
 mwxxJYpYC/7ECnzNpy5z53lYGwZRsDJhvlFolbOoYT9PcuofBKeQVQ6xzbkehDFkeJebvdK/ZKg
 ioFcYJAgM1pL+xAWqJRB2yXUf9qkgAsTBkI8nVkjwvWPg5tPxGSW5c0VkFkcbgzyihGTzr6iSob
 v8MiFKemT0BnD3pxOEHu01wHmaZhq6MG7Kgdry69LhvVduBj8iYKy5hbsgba992r2qwklOGaIlK
 w1G7x+Gyh78JuNLIsAb8TvWhC/LvxF/S2dy7OqaR0HXei/1J70cfnNC380krXKoCwOdwkPObSaV
 xkfp8KqbthSORqx61G8xW36DIwdSsMNOF0F5pYaDt22L0dMyJtOsxG4XkvhuLP
X-Google-Smtp-Source: AGHT+IFEyjCGcHz5ogQJOffPwyTrAvi0xgweJM4wuXRqjjfXq5xT+HZfjRhvvsABr1422rmtVjG41g==
X-Received: by 2002:a05:600c:3555:b0:470:fe3c:a3b7 with SMTP id
 5b1f17b1804b1-4711786d42dmr179273425e9.5.1761222736474; 
 Thu, 23 Oct 2025 05:32:16 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475cae924a1sm44078055e9.2.2025.10.23.05.32.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 05:32:15 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>, Alexander Graf <agraf@csgraf.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, Phil Dennis-Jordan <phil@philjordan.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Cameron Esfahani <dirty@apple.com>
Subject: [PATCH v2 56/58] accel/hvf: Do not abort in
 hvf_arm_get_*_ipa_bit_size()
Date: Thu, 23 Oct 2025 14:31:40 +0200
Message-ID: <20251023123142.8062-7-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023114638.5667-1-philmd@linaro.org>
References: <20251023114638.5667-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

Do not abort in hvf_arm_get_default_ipa_bit_size()
and hvf_arm_get_max_ipa_bit_size() when the IPA can
not be fetched. Return 0 (and document it).

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/hvf_arm.h | 11 +++++++++++
 target/arm/hvf/hvf.c |  8 ++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/target/arm/hvf_arm.h b/target/arm/hvf_arm.h
index ea82f2691df..21a69e7d105 100644
--- a/target/arm/hvf_arm.h
+++ b/target/arm/hvf_arm.h
@@ -22,7 +22,18 @@ void hvf_arm_init_debug(void);
 
 void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu);
 
+/**
+ * hvf_arm_get_default_ipa_bit_size:
+ *
+ * Returns the default intermediate physical address bit length or 0 on error.
+ */
 uint32_t hvf_arm_get_default_ipa_bit_size(void);
+
+/**
+ * hvf_arm_get_max_ipa_bit_size:
+ *
+ * Returns the maximum intermediate physical address bit length or 0 on error.
+ */
 uint32_t hvf_arm_get_max_ipa_bit_size(void);
 
 #endif
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index f3cf5793ba5..12f7d09a697 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -836,24 +836,20 @@ uint32_t hvf_arm_get_default_ipa_bit_size(void)
 {
     uint32_t default_ipa_size;
     hv_return_t ret = hv_vm_config_get_default_ipa_size(&default_ipa_size);
-    assert_hvf_ok(ret);
-
-    return default_ipa_size;
+    return ret == HV_SUCCESS ? default_ipa_size : 0;
 }
 
 uint32_t hvf_arm_get_max_ipa_bit_size(void)
 {
     uint32_t max_ipa_size;
     hv_return_t ret = hv_vm_config_get_max_ipa_size(&max_ipa_size);
-    assert_hvf_ok(ret);
-
     /*
      * We clamp any IPA size we want to back the VM with to a valid PARange
      * value so the guest doesn't try and map memory outside of the valid range.
      * This logic just clamps the passed in IPA bit size to the first valid
      * PARange value <= to it.
      */
-    return round_down_to_parange_bit_size(max_ipa_size);
+    return ret == HV_SUCCESS ? round_down_to_parange_bit_size(max_ipa_size) : 0;
 }
 
 void hvf_arm_set_cpu_features_from_host(ARMCPU *cpu)
-- 
2.51.0


