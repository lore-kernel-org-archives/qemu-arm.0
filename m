Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1916035lfj;
        Fri, 6 May 2022 09:23:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeLqGeyG0VqUs9Dte0PdC2Z4Dn6WQ38vKkcjg+NZEg/l+yLGRzq3NImUlHoodvR5YYSMPW
X-Received: by 2002:a37:5ac4:0:b0:69a:1423:4cac with SMTP id o187-20020a375ac4000000b0069a14234cacmr2894693qkb.41.1651854201041;
        Fri, 06 May 2022 09:23:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651854201; cv=none;
        d=google.com; s=arc-20160816;
        b=P3jZKN9e/+pIysmcnGcWCr9DcohsClDU2BTuOIL9/8FgckLzTtIrdQrLSYbob1f+cu
         namnJtH/Rjy4vCoHyNYepFfyWVWm9E4E6KGSbg9vDr5VONc9qYUL96vljKNnleyTuvFR
         9wCTbFgyzMeDHT6qYBAvzByZMSrjuQgZfBxIeVZDA3+lLCoL88D73E1pnTAd+SuSBcMr
         2Q0X1IdiykSsgEgpAFakv/t/Q3FUa5ReQLxhXrEXi0+o2pZW5Scg0H0CJkJo1kyUI1CX
         4/xBwg/c1Xa+8QY6bATh5o3b/nW+IIdUJoYUagWDM5eSDWE073gdoLIEsymrJRr+XB4p
         aMWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=s5hwKzJz7oHObalRn4AoZXqvpOR58c84KtTr/3Ljs14=;
        b=MsFFc0azcCIZ9SnK5AMnDB69r/kmHYZGjdIghbXcZOSU8GFe8I445T4yrIOJFeU/ml
         6v1qZU9FmW2S+UOw+DQc+inmhFfwL15Mlc/tico3iGSGxtCbNfAhuGHvRq45rFlNAAU8
         q3jnYVrVWmbhriNimUFSAbZ7KuMuo0lzFNx7iAlt9c0W85JFAdCTkPAFhC8P5QcJCtUA
         1D1tHQMbq0haz7xqV5zjbZ0/xmfWaEWg7UyDBZidCJJbdW0nkjv++64cf4XU4xV/iiMo
         r3gwoRNt1Xq0NOJaeFGDIijRCzNk75iFocPSLamObLfY6N4bamV4XO4cadYgmAHVP9+6
         F+1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pLXF4dt1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m19-20020a0cdb93000000b00443d0548d13si2617296qvk.324.2022.05.06.09.23.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 09:23:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pLXF4dt1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn0jg-0006uP-Iq
	for alex.bennee@linaro.org; Fri, 06 May 2022 12:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0i1-0005NM-38
 for qemu-arm@nongnu.org; Fri, 06 May 2022 12:21:37 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:45886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nn0hy-00052s-Pi
 for qemu-arm@nongnu.org; Fri, 06 May 2022 12:21:36 -0400
Received: by mail-wr1-x436.google.com with SMTP id w4so10660805wrg.12
 for <qemu-arm@nongnu.org>; Fri, 06 May 2022 09:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=s5hwKzJz7oHObalRn4AoZXqvpOR58c84KtTr/3Ljs14=;
 b=pLXF4dt1YULS2dJNp1N6sAxWyGU+7tQPTqookMr1nTArZbRuQGq6EW0AN+WYacusDS
 Ts1f0Sh1jRjEZ3AfGdAsgWHJb4PzEfmSTFaSW7H+VdP8SgaiQaptuLhJ/hqs4p5UqSQw
 UUVBnFaNlMvGMh8y5H3+bXAOhyxsertWQI7N+uJSXOuRAfIJR2CclmeBgdN86ti8vjMa
 1zZYYuceJOnYKWE77jQHld+hePRci16VFE1JnHGwACjGPqpEdV5Pxl37IwZ3tlpLpl+d
 3cZwfzyNAt+fosXCQsMrxOl2UUK/VpzkUuwEcpoRVA+x7JPWjDNxviS9HQKm9kQRSEBY
 Kykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s5hwKzJz7oHObalRn4AoZXqvpOR58c84KtTr/3Ljs14=;
 b=yYK84gZRF9/g+NN5coiOV9jRWzuIxPnRxbIORrMZDDzBhmLFk8ssGHxAPEbusqgHB8
 vlJDySxByPRjrjf6RzcwInOmBDqINPeVkp3ZGKZuCBaSj70nZRxHX8e/aAvbrNvHL/q3
 8IibFNPkmcpdoEaWF/Ruk1woy9ppfwP7pkSJFNYzPAHAiy7xA6THir5mP3j7j4LYpeCL
 yS7GDpDdJHZqmsoOWbwa/iygJgiAlCmmLib7fzlMFYtmnXtjVO3N7+EeWcwiFt1bDGID
 BqxhNeuOkbQIhf59fvIOq/7V+p66+im4vSlhnpD6nZWzJo9i6kiQkX8JITixMvS0h8mT
 1kMg==
X-Gm-Message-State: AOAM530XZ5NE3ZLB8BRvN7Y7ztCbntRsnlmZHjRkF8HSxyqr5NYb+EF6
 MHGRqGkXmIExhH4ewHjqdV7/CsQlhUPYjQ==
X-Received: by 2002:a05:6000:1868:b0:20c:95c4:ed9a with SMTP id
 d8-20020a056000186800b0020c95c4ed9amr3302258wri.243.1651854093461; 
 Fri, 06 May 2022 09:21:33 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j2-20020a5d4482000000b0020c5253d926sm3782082wrq.114.2022.05.06.09.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 May 2022 09:21:33 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/5] hw/intc/arm_gicv3_kvm.c: Stop using GIC_MIN_BPR constant
Date: Fri,  6 May 2022 17:21:26 +0100
Message-Id: <20220506162129.2896966-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220506162129.2896966-1-peter.maydell@linaro.org>
References: <20220506162129.2896966-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GiMRY6wHN0Mr

The GIC_MIN_BPR constant defines the minimum BPR value that the TCG
emulated GICv3 supports.  We're currently using this also as the
value we reset the KVM GICv3 ICC_BPR registers to, but this is only
right by accident.

We want to make the emulated GICv3 use a configurable number of
priority bits, which means that GIC_MIN_BPR will no longer be a
constant.  Replace the uses in the KVM reset code with literal 0,
plus a constant explaining why this is reasonable.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_kvm.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
index 2922c516e56..3ca643ecba4 100644
--- a/hw/intc/arm_gicv3_kvm.c
+++ b/hw/intc/arm_gicv3_kvm.c
@@ -673,9 +673,19 @@ static void arm_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
     s = c->gic;
 
     c->icc_pmr_el1 = 0;
-    c->icc_bpr[GICV3_G0] = GIC_MIN_BPR;
-    c->icc_bpr[GICV3_G1] = GIC_MIN_BPR;
-    c->icc_bpr[GICV3_G1NS] = GIC_MIN_BPR;
+    /*
+     * Architecturally the reset value of the ICC_BPR registers
+     * is UNKNOWN. We set them all to 0 here; when the kernel
+     * uses these values to program the ICH_VMCR_EL2 fields that
+     * determine the guest-visible ICC_BPR register values, the
+     * hardware's "writing a value less than the minimum sets
+     * the field to the minimum value" behaviour will result in
+     * them effectively resetting to the correct minimum value
+     * for the host GIC.
+     */
+    c->icc_bpr[GICV3_G0] = 0;
+    c->icc_bpr[GICV3_G1] = 0;
+    c->icc_bpr[GICV3_G1NS] = 0;
 
     c->icc_sre_el1 = 0x7;
     memset(c->icc_apr, 0, sizeof(c->icc_apr));
-- 
2.25.1

