Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C67CDE004
	for <qemu-arm@archiver.kernel.org>; Wed, 24 Jun 2026 13:47:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wcNoG-00020m-VZ; Wed, 24 Jun 2026 09:38:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wcNnW-0001gv-Up
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 09:37:48 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jim.macarthur@linaro.org>)
 id 1wcNnV-00017Q-3q
 for qemu-arm@nongnu.org; Wed, 24 Jun 2026 09:37:46 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-460166910e6so683040f8f.2
 for <qemu-arm@nongnu.org>; Wed, 24 Jun 2026 06:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782308264; x=1782913064; darn=nongnu.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2NDL9GgJTskgV85Mg/cUiyt7YaGnfBnRCfyqg2zl2uk=;
 b=IDk3Xwv9lhnZNSZB7BIGmChY9S62o7arNEWU25sR9gCVU0UlnlnFEIKpe2J2QIHhfs
 v1UxuE7MYI3RsHuTKqcchracEt566slnDuQ1qeNObgd5lZiBhrLverL4Q0lk5F0WlmKH
 DcfN7PBMNyYPFmiS7a0vyAS6Amjm01hSuRWNk0cdXQEDtnrH4fW59Irzn5ynYwU1LAdo
 LXADIN3uVnx0tZQkdxqk80xQSaOo8BMTrh+WNVC6LtmeqqvXRTgHa//7cZerwY4serHo
 2/2OFbG8qKz7h5KwhPWE82TPR1WmX6zd6n/nmHdG/0vRJ5Kisq7v9ie/QkNJi7R2D0Ru
 20KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782308264; x=1782913064;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2NDL9GgJTskgV85Mg/cUiyt7YaGnfBnRCfyqg2zl2uk=;
 b=We2JuymjsR/VsMDscWeiBOFFvvCTS+G5onKc0V/uwLw36z7HgaibZsgFMajTAlRA3j
 IAmMSoAtDzB5S5MN7DnmfHIyj1WNGqEYIdiQRRycaojhBveTcW2DLIFSv0mNMl3ogevC
 TptlM5A0HV7wNigOslSAjbIyZISKdBuYNZ5DbR89fdijua7eCQcc4EE+3t5UP8NVwKn1
 /0NxMuo5xWk23wmbwc7imwKjOEcI9D6X96kx2sfOKwdjuBIL6JNQScKBg1yXKmphvWTD
 WWvX4iGXRf/nYvyEiYp0uug1cYXo7ZzoES4Y55vjTvdPAXxDWTdGUCNDez8qpatDlTo9
 HyqQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoL107txTty33XvyLvOc8UdsYZnP4zSShEcBqThPVPT0XwKFRh3o68aBpxUvIN6SpIK5qQtPaKWpg==@nongnu.org
X-Gm-Message-State: AOJu0YzxGKD1UmxhLZA/aJTkKRizj3jQ1RXCceq4l/Csi4cjc1/qdPPo
 E9NeSbXfh9Nh4a9rlc/hMZUcLuilO5h6CYUFJ9RI55uWCYJ+qTSxgqj6ZJBkgpfznlk=
X-Gm-Gg: AfdE7claXbKqNEkx8an7R242qch1eHfYmZOmrXWurcpP+mjUFJuyU9BlyjRnGuoSpfx
 Sc22lFHW7zvaJiineptef+KwxyMYOf6+Qc729mL7iwk04LciJcYTYN+CJkHumql5RPI0BmRQ62p
 2c93xJxzRXSIZEkuFdW1q6gmAxA2FQxEADdv1HbB53+FAJ0WRbrdcksZr8zxlQMP85iS58KxbVO
 b32XgF41I4hDROntGUJK5OrsW6t9KtFxIDokYrw/iVb7hKGJmvJ/HiuT/sMXHr5WhWTfRd9SVZR
 Isn+lPZ28NPyx6iWeSNVmjVZe3QA2TpK6Ub6Sx7ycHVFoo2lqO/+076W3DrH9jq1l5GCR68rzWy
 J5D4wW1RvPrSlRg7JbFF/7eJRQxEgWycdtVVJ2lmTcvYsTysGlAfra9c8QeoeNBUY5qwwcGqvQD
 AarbKJv5k9i6k1dhopgyv5VVqsoQ==
X-Received: by 2002:a5d:63c8:0:b0:460:70ff:fe14 with SMTP id
 ffacd0b85a97d-46c0af15c37mr4130065f8f.42.1782308263725; 
 Wed, 24 Jun 2026 06:37:43 -0700 (PDT)
Received: from [127.0.1.1] ([2a10:d582:31e:0:2e21:1ee8:260f:9a76])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1e840efdsm6646334f8f.5.2026.06.24.06.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2026 06:37:43 -0700 (PDT)
From: Jim MacArthur <jim.macarthur@linaro.org>
Date: Wed, 24 Jun 2026 14:37:30 +0100
Subject: [PATCH v2 6/6] tests/tcg/arm: Tests for new FPRCVT instructions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260624-jmac-fprcvt-v2-6-dc6cf8e512b6@linaro.org>
References: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
In-Reply-To: <20260624-jmac-fprcvt-v2-0-dc6cf8e512b6@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Alex Bennee <alex.bennee@linaro.org>, 
 Jim MacArthur <jim.macarthur@linaro.org>
X-Mailer: b4 0.13.0
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=jim.macarthur@linaro.org; helo=mail-wr1-x430.google.com
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

We autodetect the presence of FPRCVT in the test cross compiler,
which is a recent feature in GCC and not supported by many distros
yet. If this is in place, we compile the existing fcvt.c test with
an extra compiler flag which uses the new SIMD instructions; the
output from the test is unchanged.

The existing [US]CVTF instructions do not have a test, so no new
tests are added for the SIMD versions. They have been tested manually
to check the new SIMD versions produce the same numerical results as
the existing versions.

Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
---
 tests/tcg/aarch64/Makefile.target | 14 +++++++++++++-
 tests/tcg/arm/fcvt.c              |  7 +++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
index 6203ac9b51..32f2689273 100644
--- a/tests/tcg/aarch64/Makefile.target
+++ b/tests/tcg/aarch64/Makefile.target
@@ -28,9 +28,21 @@ config-cc.mak: Makefile
 	    $(call cc-option,-march=armv8.5-a,              CROSS_CC_HAS_ARMV8_5); \
 	    $(call cc-option,-mbranch-protection=standard,  CROSS_CC_HAS_ARMV8_BTI); \
 	    $(call cc-option,-march=armv8.5-a+memtag,       CROSS_CC_HAS_ARMV8_MTE); \
-	    $(call cc-option,-Wa$(COMMA)-march=armv9-a+sme $$fnia, CROSS_AS_HAS_ARMV9_SME)) 3> config-cc.mak
+	    $(call cc-option,-Wa$(COMMA)-march=armv9-a+sme $$fnia, CROSS_AS_HAS_ARMV9_SME); \
+	    $(call cc-option,-march=armv9-a+fprcvt,         CROSS_CC_HAS_ARMV9_FPRCVT)) 3> config-cc.mak
 -include config-cc.mak
 
+ifneq ($(CROSS_CC_HAS_ARMV9_FPRCVT),)
+AARCH64_TESTS += fcvt-fprcvt
+fcvt-fprcvt: LDFLAGS += -lm
+fcvt-fprcvt: CFLAGS += $(CROSS_CC_HAS_ARMV9_FPRCVT) -DFPRCVT
+fcvt-fprcvt: fcvt.c
+	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
+run-fcvt-fprcvt: fcvt-fprcvt
+	$(call run-test,$<,$(QEMU) $<)
+	$(call diff-out,$<,$(AARCH64_SRC)/fcvt.ref)
+endif
+
 ifneq ($(CROSS_CC_HAS_ARMV8_2),)
 AARCH64_TESTS += dcpop
 dcpop: CFLAGS += $(CROSS_CC_HAS_ARMV8_2)
diff --git a/tests/tcg/arm/fcvt.c b/tests/tcg/arm/fcvt.c
index ecebbb0247..7c0cc4367e 100644
--- a/tests/tcg/arm/fcvt.c
+++ b/tests/tcg/arm/fcvt.c
@@ -171,8 +171,14 @@ static void convert_single_to_integer(void)
 #if defined(__arm__)
         /* asm("vcvt.s32.f32 %s0, %s1" : "=t" (output) : "t" (input)); */
         output = input;
+#else
+#ifdef FPRCVT
+        asm("fcvtzs d0, %s1\r\n"
+            "fmov %0, d0" :
+            "=r" (output) : "w" (input));
 #else
         asm("fcvtzs %0, %s1" : "=r" (output) : "w" (input));
+#endif
 #endif
         print_int64(i, output);
     }
@@ -425,6 +431,7 @@ int main(int argc, char *argv[argc])
     convert_double_to_integer();
     convert_half_to_integer();
 
+
     /* And now with ARM alternative FP16 */
 #if defined(__arm__)
     asm("vmrs r1, fpscr\n\t"

-- 
2.43.0


