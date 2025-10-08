Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F81CAC5BB
	for <qemu-arm@archiver.kernel.org>; Wed,  8 Oct 2025 22:12:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v6cCM-0008A5-II; Wed, 08 Oct 2025 17:59:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCL-0007vh-6G
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:59:49 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1v6cCG-0007Li-N7
 for qemu-arm@nongnu.org; Wed, 08 Oct 2025 17:59:48 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-78af3fe5b17so224836b3a.2
 for <qemu-arm@nongnu.org>; Wed, 08 Oct 2025 14:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759960781; x=1760565581; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KHfSbeTr/rimygDbgj468oY36/UwK7Kx+0f3UZZDZlw=;
 b=qEar9feaUtHqQ7lDlq3ImdZa3Rz7AAC7MvR4KBbDg/Fovh2pgRB8qgkiKdtkXarTKd
 0ai1QJwIDpTl1/eymimE4I8Q9a7LILkuA7ZQPCWoj47vHYzfkge2SJax4+NJyv8pW0EN
 ZYIM5QfFMnNJ3kJCaHdFEl7GtxRpUwyktEp7aGduVQG0VikXJOWOE8fyvYl+XzHT/NGS
 Fy6ZYgweZ2IDFc1pGA/rQqVRv2ysagpPoHygTSj3qeLi3k1ArQfczheGvv/6GkP8Kzgx
 ItkdW/fY/ajbBIDLFtqfV0vi6FpmmpxQM9jHlQ2lGB2WCdzQZlGYY14mB9wEhOEnVVw6
 JIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759960781; x=1760565581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KHfSbeTr/rimygDbgj468oY36/UwK7Kx+0f3UZZDZlw=;
 b=ejOxD3oJOmNzx6+4CEAvO3RiWg55LtJ3ytiuP6NqXNv7Tx9wDgTKwR8n0vFSPAEWJX
 bv1RDfnzQYyvZCG7rGaDJ/ZzlNeDeElQqbIgzRO+OeayX5JEyLnPBD5uodB0Jyy30Qns
 G2YAjWhkISlJml7sfBn++bK/zDYbgpehHOx+5bA7m0k5qK0D1laPr2yA/+U0MzXhvkaM
 U3YUHmy7uijb842h+1b91rZunjglm5lW7q5bH47bVZImSUTOPbHg0IsBoRGnkQxu4ocl
 B4apWDSitrblLe5g9b3VYggrnEzniM3+mQd074e6ABp5ZDxJygYQ6aE0jABu3mWtFf0X
 WUfg==
X-Gm-Message-State: AOJu0Yw1/Rh1qr3MEqiNcm6mU4J8/awqVOtbUTzWMjjnUCjH4pjjAlrj
 RCRZQsj/CJjCL7T905oWisp2u4VWfz1A+2+ZsnfSlCUimHNaUE6v/Zx3W4OlJ+hybm8=
X-Gm-Gg: ASbGncsdD/ACleJTIONjW6aswADhOQnDD9GrW+CGopXjj0jSdwfZod4JSSlxiyIz15B
 8nWl2xIm9zmH18EAAugexydIJPK0mpDRuGSJsrpVBlvlH6bjaGZ547p68nQPHVHLTz+S5eEfJok
 VFq5JP1VHAGVULUWO5sZhpMwPYJL1a/ubSHS3Ore334ZOTatb+QvhpYqcZpTZ7stcAea5hATySU
 be/fUfQ8tbgB6nGGZc+jwsGkcOeD5eKbg9sUL1UB7cmD5C1Wv3krXWcvB/gVhapekmxaw3dp9aT
 A8DVwXdO4qB+76rx2BXjlVFmmN+WkcJ8aGb1znm0hwCqR0lqBZK6axvwq+e/uUqLEomBrfsEku9
 iyuPo7KF+dgbrHQWR2M/qScrdXpxxhzW0Oauexd2YLqTNC40W5fAWtQUhvXOVDdWQHzM=
X-Google-Smtp-Source: AGHT+IGSCRQQ1aeUuqLhFhLxpRLOVVi5tN2qUi1qLPb16P0o92XklZ3YEr/nK/h8v3Pja7Oy3d6bYA==
X-Received: by 2002:a05:6a00:2302:b0:77b:943e:7615 with SMTP id
 d2e1a72fcca58-793878294a4mr5911866b3a.16.1759960780676; 
 Wed, 08 Oct 2025 14:59:40 -0700 (PDT)
Received: from stoup.. ([71.212.157.132]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-794e1fc9db6sm740724b3a.66.2025.10.08.14.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 14:59:40 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 40/73] target/arm: Split out access_nv1_with_nvx
Date: Wed,  8 Oct 2025 14:55:40 -0700
Message-ID: <20251008215613.300150-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251008215613.300150-1-richard.henderson@linaro.org>
References: <20251008215613.300150-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 2875f0ddd2..5d40266d96 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -3423,15 +3423,16 @@ static void mdcr_el2_write(CPUARMState *env, const ARMCPRegInfo *ri,
     }
 }
 
+static CPAccessResult access_nv1_with_nvx(uint64_t hcr_nv)
+{
+    return hcr_nv == (HCR_NV | HCR_NV1) ? CP_ACCESS_TRAP_EL2 : CP_ACCESS_OK;
+}
+
 static CPAccessResult access_nv1(CPUARMState *env, const ARMCPRegInfo *ri,
                                  bool isread)
 {
     if (arm_current_el(env) == 1) {
-        uint64_t hcr_nv = arm_hcr_el2_nvx_eff(env);
-
-        if (hcr_nv == (HCR_NV | HCR_NV1)) {
-            return CP_ACCESS_TRAP_EL2;
-        }
+        return access_nv1_with_nvx(arm_hcr_el2_nvx_eff(env));
     }
     return CP_ACCESS_OK;
 }
-- 
2.43.0


