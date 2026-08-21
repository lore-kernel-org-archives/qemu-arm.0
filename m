Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88699C5DF93
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 13:26:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxPG2-00025j-Gg; Fri, 21 Aug 2026 09:26:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxPG1-00024g-1L
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 09:26:05 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wxPFz-0006Q4-0L
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 09:26:04 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-47de0093c42so887690f8f.3
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 06:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787318761; x=1787923561; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=2alkrNBhAO1wnw1fFIL9osRmaaFocWT88WNJqpH93Ps=;
 b=dI5mT2WJaWc0pvL1aQ19pOtZD8PGBqill/UXeK9aCohosTec78z+HlozxMNxAFZy5J
 8OgxuDchZ/ZImPkBUXydwy5Uuy0eJmqGuj+C5KaPFvW2t4D3i/WZ1SyzMd09IU+kd6FZ
 SIkLWgCMiHaj4inRcnj8xkTtk14TXjJhTg8hp8JFgFbK7eDawWsU3K+TA96akMJXxGu+
 3Sy2B/+jkX4rChz5wz1YsLBfTPzivoCfOPAho0r3MECpSWBKjzwmrCa/MCb3S5lMIfPa
 qniryt92XMxErqd2eutvSGjymhhGPCcqE75S/K5MvZ+RUpgalchN8D8OpSio7ULZtCaj
 zGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787318761; x=1787923561;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=2alkrNBhAO1wnw1fFIL9osRmaaFocWT88WNJqpH93Ps=;
 b=dXrFg1Ph4v94d4TKm2VjUVElKcZNdbubEGEPw7D8jvOJDutiUypvauXkTeryQsov1q
 b0g+rTSKUkoQ8a2k06b0BA5HHUamtG6eGNzM1Alk6BJCLD1gh4DQ6nEo4+NKKIOVJeAm
 iHB139ffhyk6JmO9zbLC4ke2DSXVnRVfipJg/IS48cAboPJhZ2UppcYLnXoOJFgUKWrD
 bSeptCcFQG0oQxiDZirN+mO0AGEkvutiZmeoprx89duMj7nf7eGg3XgDtjU8uCH9VCEI
 BooPvz7Of6/lj1yYBwxMZe4onMC3BjjUBRmHQWAczEyJGs2h93OQQpc+2sCMZedD5As8
 K7gQ==
X-Gm-Message-State: AFuF++nntP+yEjtloNDDL2Om8JD6wbh5/QfEaqSY9LhZPxzfmMU6kar0
 5PSxvJdha1bCvBVN+ZgNReFe8hp1iDEDLpnwcOflv5Zi2ZTXz6+B54t+1vHhfQHNEEy+5kG2Ugv
 Axta7vNc=
X-Gm-Gg: AR+sD12SR7eVxsXm0yx3ycTdH+AehAZdzUS9jqIcejdBPI7OwIOFGJJalveX0cXTweV
 hkkXOwQuVJNl1wzJ0J3BipkEUX6yTz5liQsPX3y3kNOHcpzASX/tmFNlu4iezI1sBEGYLMwI/qE
 p/HHpXYYgRokgxzcYARVLeQjN328h58GSAsi8QsV9TQZ03Zk95ewfoRQ2uIw9dJV7I2cykF4JdH
 m5KzGhUWYmKp52Gkk+8BVKJwS78jvvcssjhXJQkFNcLVe7/CVlfLTYBdsEcjvVhgVKNwt6tIUoA
 L5HJaXmTMLR+GWfGOxRx7O7W6iuv020cjOujNb5kHm6egb2j+CYsNEBwIQEtjrFaCpCqGQGC3GY
 bPpP1oI4xx/NoSgiWwZaXvAa2DSnqWLxLN/0NV2xXpEf/0zcJ4Vf04Uiq1D5CkAz3y+JSHLDrP7
 H0JgTAC5z+KQ5C2KurGkQVkEaEvKFmxk6b0AGrAJyNsorgs61dYKEIdWaEaw2n2FefOK9dzkqJ6
 C2N/6xUKbaecfWxEi3TvVvW5JIRRsgmlpWE+N5eC4upVarBS9vU0DCiqsNb0MHxdoHffOJqBnEZ
 XxbE
X-Received: by 2002:a5d:64cd:0:b0:47f:51bc:efe2 with SMTP id
 ffacd0b85a97d-482c0b95d85mr10259274f8f.11.1787318761395; 
 Fri, 21 Aug 2026 06:26:01 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-482b1450e54sm18770327f8f.11.2026.08.21.06.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2026 06:26:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/arm: Make Thumb T1 hint space UNDEF before v6T2
Date: Fri, 21 Aug 2026 14:25:50 +0100
Message-ID: <20260821132550.168896-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821132550.168896-1-peter.maydell@linaro.org>
References: <20260821132550.168896-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

The "hint space" is a region of the encoding space which is defined
to NOP if not specified as an architected instruction, so that future
instructions can be added there which fall back to NOPs on older
CPUs.  In the A32 encoding, this hint space was carved out of the MSR
(imm) insn by using the fact that a field_mask (bits [19:15]) of
0b0000 meant that an MSR (imm) would set no parts of the CPSR from
the immediate, so it was always NOP on existing CPUs.

For the T1 encoding, the hint space is in a range that used to UNDEF
in Armv5, and so the hint insns and the NOP region must all UNDEF
before v6T2.  Rather than putting this check in the trans functions
for each hint insn and for the NOP space (which is a lot of places,
and awkward since those trans functions are often shared with the A64
and A32 encodings), put in a decode line that covers the whole space
which we check before any of the hints and which will explicitly
UNDEF if necessary.

Cc: qemu-stable@nongnu.org
Resolves: https://gitlab.com/qemu-project/qemu/-/work_items/4208
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/t16.decode  |  3 +++
 target/arm/tcg/translate.c | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/target/arm/tcg/t16.decode b/target/arm/tcg/t16.decode
index 9a8f89538ac..43cd36e949c 100644
--- a/target/arm/tcg/t16.decode
+++ b/target/arm/tcg/t16.decode
@@ -224,6 +224,9 @@ REVSH           1011 1010 11 ... ...            @rdm
 
 {
   {
+    # Before v6T2 this was not NOP space and must UNDEF
+    MAYBE_UNDEF_T1_HINT 1011 1111 ---- 0000
+
     YIELD       1011 1111 0001 0000
     WFE         1011 1111 0010 0000
     WFI         1011 1111 0011 0000
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 103e2fe7c73..e889c6c6136 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
@@ -3339,6 +3339,24 @@ static bool trans_NOP(DisasContext *s, arg_NOP *a)
     return true;
 }
 
+static bool trans_MAYBE_UNDEF_T1_HINT(DisasContext *s,
+                                      arg_MAYBE_UNDEF_T1_HINT *a)
+{
+    /*
+     * The Thumb T1 encoding hint space was only defined starting
+     * in v6T2 for A-profile. For M-profile it always exists, even
+     * in v6M.
+     */
+    if (arm_dc_feature(s, ARM_FEATURE_M) ||
+        arm_dc_feature(s, ARM_FEATURE_THUMB2)) {
+        /* Allow decode to fall through to the hint insns and NOP space */
+        return false;
+    }
+    /* On the earlier cores, we must UNDEF */
+    unallocated_encoding(s);
+    return true;
+}
+
 static bool trans_MSR_imm(DisasContext *s, arg_MSR_imm *a)
 {
     uint32_t val = ror32(a->imm, a->rot * 2);
-- 
2.43.0


