Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp999785ejf;
        Tue, 16 Jan 2024 08:56:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEyqKoEoGucsGUhHWpIsb+E80muhIekaPoK9qtoD7zKEkQ//TZXTnfcQJRDzezzk4AtsNcO
X-Received: by 2002:ac8:7f10:0:b0:429:be18:8150 with SMTP id f16-20020ac87f10000000b00429be188150mr10604774qtk.100.1705424193853;
        Tue, 16 Jan 2024 08:56:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705424193; cv=none;
        d=google.com; s=arc-20160816;
        b=H1Oxdxn8+4qhc1h+TwRu3WhFhaMe3PNMBnEGcYI14jcu7/mQzJYgcUk8i04uYzdPXc
         pYdQK1YLjhsaRsXSnpAgR1vu5WUiNNkbuGNyL8Fh+S92Dwp4vFcLAVa1zyJUyE65mU9i
         doXCMa41sJaA+3ca72PlulQchpS4sAsGg9yWM/vSyCKWWaKdh2QUp3rUjB6c6FAIyCNA
         xeBGjpDM0VzGfeFCkCVDvXoEfaykM4xSWh7u8sb3SJrywLx/uY4DhP82MsxHwOIdDfM1
         2CQYTZxalIs4hV7pUoAHtXTCkw7wQZkh+CQkGJMyQDpX5yhyss7ktZKfbAIKEdRYlhmO
         darg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=g5+MoEdJcCdHmkaazghwpTww92NWQ0eEpf8jlJ56rWs=;
        fh=RngBVondoO8Rybm7DS4h37/aX8/Cu6PJZygxu/v2CFo=;
        b=wF0mS72xaKuX24vm2CoLjMaPWw+ojwqNsmMG86WyW9nEuvb4n0jVmyGe2oZJlRFPLw
         eSDAjwq/9ote9B4xDqAqDxl7YjCOQlTphxG1jIbAajNITb3zu6okwIJz+WpUFAoWQvW9
         V+LwFRbols7JNjG/WSOXGZaligJb5tiN8Kv7B2m83E+PcUy2iXIv8akOxbPqx43cP+qp
         /tH0zBBofvgJBvHwslTfLt/pu12FJ5egbOSnUQkTTwUqK0NsJyI2PHbjb6eORKWB4vWB
         mmMVkm1pELnTEzxrJTISm3KxHHWIWT++veJiVfixJwMsne+n7IV0gZlNlOjBcCpARfZh
         xqfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TcJhCRCn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8-20020a05622a11c800b00429fe13e602si2302856qtk.8.2024.01.16.08.56.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jan 2024 08:56:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TcJhCRCn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPmjT-00063K-Hx; Tue, 16 Jan 2024 11:56:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPmjR-00062W-L7
 for qemu-arm@nongnu.org; Tue, 16 Jan 2024 11:56:09 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPmjQ-0008AG-6X
 for qemu-arm@nongnu.org; Tue, 16 Jan 2024 11:56:09 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e800461baso14534795e9.3
 for <qemu-arm@nongnu.org>; Tue, 16 Jan 2024 08:56:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705424166; x=1706028966; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g5+MoEdJcCdHmkaazghwpTww92NWQ0eEpf8jlJ56rWs=;
 b=TcJhCRCnLLFa3ABKuPxkWBLbYVql0nrLOrLbhLuvpLF8GF2nOL2XRlZvNoHEIoTW1y
 U+KGuY0auprbUrh/4entfIjTqcFXX7Hxv6WLgoh0R3HPr/qR8Z0MPMBNYLYxosbKdT7N
 uiq9a1GUZYm9VYSFUFv8vKGQEkhG+YW6/BKRkpzZcGY0lJyUxUulgkKdu0KFIkput2XY
 8Ato5s4rl5Gisi1rX9eMsy/DLneyU+fUSVtedz+kcA7GpQoupsG6d6HzpYAkdI2Qd0+K
 Rd/xploKWLH+C6WTBuk+DBIhXl7BXocm+ZYogQv7ss8mJa7yoI/6rg3yOJxJv2QzTGyT
 Ik3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705424166; x=1706028966;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g5+MoEdJcCdHmkaazghwpTww92NWQ0eEpf8jlJ56rWs=;
 b=f+uy5esL7gjdjmyJUam7U04+PP8Z7tUHnCZsLKQUtRptlvU/+BrAGxai+irBZ9aWEc
 2ooAGFQzkyvKsWrWGeTevEmklxr7Ie7DDsEpXzpofmvvNJpYi2ADOPq5E9sK+OYx100S
 eQ6W7N3TIvjny3Ldr1sz16HIZMeIVoRuD4cwHtnLtbi3KzD17Wi+TRIxtKHbYImvaCuv
 6hVeu9bI8AiBrspQy7NpdnMYuFpUy9J7uOKfNe4SSUP4LTY35XevWl/IHazhzj6QYufW
 ixQmbztrKJHU/ZtmV9pbje4XhjAbB8BVS9vQB4EHv3Uci4WGnkUnYdk5kh+Elc4VQk5n
 NDaA==
X-Gm-Message-State: AOJu0YzZ2k/KB3Uq75lsjzAsJOwpH/CGpsvjZhyJFKgifiDz5ZfkQNvB
 b91g4pDMnSMFxKwDsanFfLWCB8DHwPTSHYC2X0DC+Ene8A0=
X-Received: by 2002:a05:600c:2ed2:b0:40e:491e:e387 with SMTP id
 q18-20020a05600c2ed200b0040e491ee387mr2101176wmn.355.1705424166462; 
 Tue, 16 Jan 2024 08:56:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bg23-20020a05600c3c9700b0040d91fa270fsm19968636wmb.36.2024.01.16.08.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 08:56:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [PATCH] target/arm: Fix VNCR fault detection logic
Date: Tue, 16 Jan 2024 16:56:05 +0000
Message-Id: <20240116165605.2523055-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7UL4dktZS2AG

In arm_deliver_fault() we check for whether the fault is caused
by a data abort due to an access to a FEAT_NV2 sysreg in the
memory pointed to by the VNCR. Unfortunately part of the
condition checks the wrong argument to the function, meaning
that it would spuriously trigger, resulting in some instruction
aborts being taken to the wrong EL and reported incorrectly.

Use the right variable in the condition.

Fixes: 674e5345275d425 ("target/arm: Report VNCR_EL2 based faults correctly")
Reported-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
In less lax languages the compiler might have pointed out that
the type of the LHS and the RHS in the comparison didn't match :-)
---
 target/arm/tcg/tlb_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index dd5de74ffb7..5477c7fb7dc 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -184,7 +184,7 @@ void arm_deliver_fault(ARMCPU *cpu, vaddr addr,
      * (and indeed syndrome does not have the EC field in it,
      * because we masked that out in disas_set_insn_syndrome())
      */
-    bool is_vncr = (mmu_idx != MMU_INST_FETCH) &&
+    bool is_vncr = (access_type != MMU_INST_FETCH) &&
         (env->exception.syndrome & ARM_EL_VNCR);
 
     if (is_vncr) {
-- 
2.34.1

