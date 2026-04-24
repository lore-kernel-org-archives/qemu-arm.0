Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C25FB44A7
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Apr 2026 04:35:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wG8Ds-0003zI-Mo; Fri, 24 Apr 2026 00:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8Do-0003ZP-If
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:32:56 -0400
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wG8Dn-0003rP-65
 for qemu-arm@nongnu.org; Fri, 24 Apr 2026 00:32:56 -0400
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-479e4835e26so2682750b6e.3
 for <qemu-arm@nongnu.org>; Thu, 23 Apr 2026 21:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777005173; x=1777609973; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PlcOFioDbZFbr9t83saHWs68EnI69xAMOgUGA4zwY5Q=;
 b=pG9Ie54GLOZFoWu52gL8xEs81Nrx1lGP7OHxoo1A5/33svfWd75tqq5lPnxpSjwqqa
 iU9yPodPO4e6XBlMIIweba6QKFZGVLd0LBdAN9XjVplyHs9MwbUn2Qjuteb1wH39oznD
 h6tnjos7FlrLVzevSZEPnWag6dw4pwEiKHPr0AWl5JRRdTxSXlsQW7enq2oKdlF4ySEM
 zRjmdsSxMGdh6CBTSorvEDWISTrwwbFv5SomJsfNooFmJoZjyRdZ6rCowHjE1sauPMC4
 nKsVQxGsIiEIHQTxygUaPxn7/HPFoR1K6Q0AlvQsN+zlaGEaR49kWB4VpYVe0U2tKuGA
 Hi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777005173; x=1777609973;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PlcOFioDbZFbr9t83saHWs68EnI69xAMOgUGA4zwY5Q=;
 b=YjCyLoukQcrXrl1GzNt1+NkL8fuZMAgw1+NCThGozEWK0uIyX0OIJCUqxjjAZO6MTX
 C3BL27mMRDOGm6UkX7mh8LrCo1y1DA0gUwaAX/gjrqHw8K/8jQoGZ/cupcar2IZgwtHe
 H8nip6R0Nz/m+5TfywQ9dF+GwqZ78XzGaqPi5odAjuxMHGEJUbJmSedhbjEhxlvlltKh
 tgjr3wXTkV33AuxSmB3NAaWDacKOGaXEYBrnZo28MSpiQqaZYXhWcADQa9kp4X5Grd2a
 Tg23qnxr3CDxXDdWUG/tY3M5sOfUPzfpWIbQ7w3fjCIj9/EJz3LiJzlJ2BnS5r7KlJmQ
 zJag==
X-Gm-Message-State: AOJu0YyIvNNwyqzCRPW5s5sVIbiuEyhin7OspvHFsLbKoCqZ8F3GpU9a
 N5ms5DhH8LIRW6yGK8n0GPffd40cyrgFSs7LvNm45OaZvCbCl6hjdrPFOmPmeqN1aj2NQuUbIlt
 /JTeA8KY=
X-Gm-Gg: AeBDievc08hdYcCjHrBdLSfo0AYwZWabFx8QkJef/0hz5gVKVPiXArzuzBCfcK7UkoM
 YnK4BwS+98NCpRrSL3/lVNJ5CEZLlTdyAbzrodqv+15xnFCTfq3nu2hSX8cniQ8fbqJr5Vo8LDM
 quPjDkSv1r6wsLs53LO9hcug78kVPmoaM4wCEu/Ua2OPRjxrH6xbU4MjxE1znXraowUIaGX4m3I
 5qgZCPS2CTgMt+7mJksoaIeyyAP5VbnemhiLYiN922kcNP5fiNtw6zmCd7agy/3LgykO1yVa6Kp
 9+IKbpXGvVn3HsDPY36ZZaJKQjZTHmqY/Vf+UJoZr234NK6PHNzd4ve+DIsXYteRbJvWKVdj2UI
 NOiTfPwXuTDmL8v0Bj/Le0WCTZsB/h6JXa26TQ0I4vGxeY93eHuUBzpgyleBGD9z/Yr+TnZUs8d
 cONFSrDSEnSpKGgaFknKIa+GEcHuzaxbX/m4igcTxZ4N6dwGgN2Ji7dr5TjA/MYw==
X-Received: by 2002:a05:6808:bcf:b0:467:bfa:bd9d with SMTP id
 5614622812f47-4799c9669e5mr18338226b6e.18.1777005173060; 
 Thu, 23 Apr 2026 21:32:53 -0700 (PDT)
Received: from stoup.. ([172.58.183.19]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-42b9ac54ec5sm18880864fac.13.2026.04.23.21.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 21:32:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 39/40] target/arm: Enable FEAT_LUT for -cpu max
Date: Fri, 24 Apr 2026 14:30:13 +1000
Message-ID: <20260424043014.46305-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260424043014.46305-1-richard.henderson@linaro.org>
References: <20260424043014.46305-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::229;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x229.google.com
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
 target/arm/tcg/cpu64.c        | 1 +
 docs/system/arm/emulation.rst | 1 +
 2 files changed, 2 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index 40ed799fb8..9b974d6f52 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -1253,6 +1253,7 @@ void aarch64_max_tcg_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64ISAR2, BC, 1);       /* FEAT_HBC */
     t = FIELD_DP64(t, ID_AA64ISAR2, WFXT, 2);     /* FEAT_WFxT */
     t = FIELD_DP64(t, ID_AA64ISAR2, CSSC, 1);     /* FEAT_CSSC */
+    t = FIELD_DP64(t, ID_AA64ISAR2, LUT, 1);      /* FEAT_LUT */
     t = FIELD_DP64(t, ID_AA64ISAR2, ATS1A, 1);    /* FEAT_ATS1A */
     SET_IDREG(isar, ID_AA64ISAR2, t);
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index fda73d3d07..b38a188088 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -99,6 +99,7 @@ the following architecture extensions:
 - FEAT_LSE (Large System Extensions)
 - FEAT_LSE2 (Large System Extensions v2)
 - FEAT_LSE128 (128-bit Atomics)
+- FEAT_LUT (Lookup table instructions with 2-bit and 4-bit indices)
 - FEAT_LVA (Large Virtual Address space)
 - FEAT_MEC (Memory Encryption Contexts)
 
-- 
2.43.0


