Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFC2F45A0C
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Apr 2026 19:42:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wBHkP-0004Cx-Fn; Fri, 10 Apr 2026 15:42:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wBHkP-0004Cp-2w
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 15:42:33 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wBHkN-0002OB-Kr
 for qemu-arm@nongnu.org; Fri, 10 Apr 2026 15:42:32 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-43d5ec211abso1282951f8f.0
 for <qemu-arm@nongnu.org>; Fri, 10 Apr 2026 12:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775850150; x=1776454950; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CKAvcWXpbfUXyfm02WmTUpHmGf7JvGvxgw1GkwpEpH8=;
 b=Rh+2X2imowB0H90dNzVNVeVdtqnFHMfNttV3n23HPbR8XLAB/ctfWGLddeV/WJhxS4
 THGMZQti4a4Gmddbt2SHkAHzDGqCspe4JeuJrvWY6tRe15BiBgsEDwmvVKUcVlPYCJM+
 WXdb49TVBTEBli9+hQrpfXDHPd/alSVE3I5eWMenh4H0mJYWF4dbdAb7wDvskB5QFOpL
 VrnaIbN8UY7mEI1l47VGPdtakg+QS1sUiVd67p//95mvEuqOPtYy3cFa/RGoQaFKZbnH
 X9sphXFOnXlOWzTXGgFSqtj0LmRb5RDU9cV/Ta0pV1aAU7axGkl9Rz3M5L8haFR+dvP1
 QNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775850150; x=1776454950;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CKAvcWXpbfUXyfm02WmTUpHmGf7JvGvxgw1GkwpEpH8=;
 b=Ih25XJhruZpA15XoW4eMfGbyTOY6un7uf/oQ9v1jgQttmPyQicHowKktfzX4Gf8XcD
 JYP8JCwQjf1KDTfgvOJP/NTWd2OnxPmmZG0ySPW/XuHOxXsTLKG7STK+m280SKI1pGiE
 i1DemKMlA71I1g7b6kctJZIx0+NbDb0Lgtj/3wgVuLbcOi9+pin6hTkaX3VPz6jXe/Ko
 aOV4hNbeGJs039S8T4DgRN7yf49nWbBR4DycHwC25ofputVLOpUwwFQLoler/bGUaurZ
 UPa5KSfwbR7nm5TZD3ctk1MCS+TXW4WHCIYaqdd10t3CeQ8/nF9ZE3a87ujqygEAXbA/
 1kNQ==
X-Gm-Message-State: AOJu0YwV93DqQLLyurJPXeX98mAvMFVLtIGo7Us/6cuq5fWrQHdCaMX4
 /z1eTlgFDFDKn1PlcWkwQXqcPcmNfAllrkQAP+9ka7gye0TGBALsjdjmWsnnYHywqdo=
X-Gm-Gg: AeBDietWAe4V1OehvUY0I9WvlCWgO+9zJ9+TS8xym5L1doZzskK9YokJYWi7iJUPACT
 ygxw+Knyi7WnBb5RF7pINW7XSfPwJyP48+vvJlVrVRyMPTPaozRgmwQ8BB25Lj1UAf9fJRY+4Jk
 Q+jtE1qGKzWShJdVhNg5ON5XL0fHAWXPJj7NizFGY5EFJQmb5m+ZfcYCUARLbfC2fsT9ueEzE8p
 EN4RkTUIJ5+WYZjCxiZn9NOaAIDG558DrIyyGVQWHs15Z73B2sCY97+AW7pesoDLEEb0ySAbCj4
 YtRk0f8iNlPRk1Pwvr016hITtuN+GiKZFvgADLP9H40vjpcj0+tSfxfGCnlLDYRG8uPS2tumMz9
 JC6L6qFUjcRACYQZDd3xS0v2FEDadATwgdWs9eKcmqtm/QcRln7O9+T116DrstGIAFAjRMrelf6
 4Yj62z6aTBckVWwuteLoEg9c8fhzdJba/kPjVL8oz+vNINxnFvMZMoqhdn/gGHgzzA/rFXvSh3
X-Received: by 2002:a05:6000:40c8:b0:439:b4dc:1e1e with SMTP id
 ffacd0b85a97d-43d642da6f8mr6513067f8f.29.1775850149648; 
 Fri, 10 Apr 2026 12:42:29 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63e5062fsm9144142f8f.31.2026.04.10.12.42.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Apr 2026 12:42:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Alexander Graf <agraf@csgraf.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH-for-11.1 v5] target/arm: Remove target_ulong use in
 hvf_handle_psci_call()
Date: Fri, 10 Apr 2026 21:42:27 +0200
Message-ID: <20260410194227.16357-1-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

Similarly to commit 3580aa03547 ("target/arm/tcg/psci.c: make
compilation unit common") which replaced the target_ulong use in
arm_handle_psci_call(), replace the one in hvf_handle_psci_call.

This could be vaddr, because entry is the start pc for the on-lining
cpu, but we prefer uint64_t because this is what we get in param[]
and pass to arm_set_cpu_on().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/hvf/hvf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 5fc8f6bbbd9..678afe5c8e1 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -1418,7 +1418,7 @@ static bool hvf_handle_psci_call(CPUState *cpu, int *excp_ret)
     bool target_aarch64 = true;
     CPUState *target_cpu_state;
     ARMCPU *target_cpu;
-    target_ulong entry;
+    uint64_t entry;
     int target_el = 1;
     int32_t ret = 0;
 
-- 
2.53.0


