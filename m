Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2417485lfb;
        Tue, 7 Jun 2022 14:08:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgm/HxeQlkgtJeTFkmHf6vYr1D0spsyY+1om5E/Dqgncbd1AaFxpIidw9fdiVr2Vo8clIg
X-Received: by 2002:ad4:5fcd:0:b0:46a:a0f8:db51 with SMTP id jq13-20020ad45fcd000000b0046aa0f8db51mr14184776qvb.11.1654636108659;
        Tue, 07 Jun 2022 14:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654636108; cv=none;
        d=google.com; s=arc-20160816;
        b=pZJG+tpokoXqOF0KbZEzzUERYBEt09j4/ipE2v7PYa2Da4Jnd/CIqfVOcp/6CEWvlR
         UqJ76CG9FhZ2F4hYBzQrW7zdurMCCncjJ70bVkpSwPA00VXZqFUNbGS/WJfoa7asqWjI
         WbdQ7/NstOm5tgPiaAWa9/+jzBe+YwYb381JB57ldbS4ihRqFh20lxqdFzQjUGFPdqfX
         +8e0rj8vwr3r+48nldUYgfihhm2hhA58vLiv+NCfikaNP+wL3UPKmlPXwENVmHOFRgaq
         daMI857plvtaCkSV/5DmC7NRe2sXkCEj5MVQjtHUNa6cyr1FvRed2gsm6WDg7dW8pE7q
         ncCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EBTWvQZP/RYxFNlEjf8hqWkdSO6h/uW0wx557hiI+xw=;
        b=kVHxkH+tODs5b62y5+56hFzxEfXBHkSUhVVKK1qZXh09hflPYVQlxKogtqcsabQXvb
         dtwMhdvIO9rRghA7nWjEwGVJnNE1biWmOSplNdOROPr/tHhTLnVClGU/Dbm0fHMMbIix
         qAaw5+KPXfdelZXyioHYbuq3rzo85pOx4aKwj3FTgBnxZAEsl+Y4aHisRCkpn/KIT4RT
         4fqPrEo/hWf7TAyl5gi+Nv1HMvcLDm1K2Z+qBD1fq8g4ftnXZKopGInqPsrr3+BseBlq
         tO63g9PJrqCKh9fDv6IqExazkocBsd1OFwQftOVxAehchBGRR237ijaL2S1OHflq4kuV
         HcYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mh9AYBq3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f21-20020a05620a409500b0067e4be2398csi11312610qko.465.2022.06.07.14.08.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:08:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mh9AYBq3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygRA-0005wb-5e
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftY-0008RS-46
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:44 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:42533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftQ-0007Ql-8h
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:33:43 -0400
Received: by mail-pl1-x636.google.com with SMTP id d22so15779840plr.9
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EBTWvQZP/RYxFNlEjf8hqWkdSO6h/uW0wx557hiI+xw=;
 b=Mh9AYBq3cU8LhosEfmERJz+m3mYNjuWH9xNqSnyMa4mOxYWNy5rh9iwg1sZ1n+yQCD
 npzDdeExp0tm+eIgk0q6g35WAaCxBx7kIGsT+5Fu7kfBa8ICFtC9WA0aWUHKismnfurm
 drt5mBnDKDR+Euo1qDw8aEAvBsnwLF1/4b9a67E8cmsUU1Zq/QqFopj+6RnmKi5FYcJi
 HOh6cnrhaJ9kIXJE8k4724hhEpTkNxPZPguMIQzxrlB8IGO8hsE2Sm2346P60khJ19uO
 86b0t+naqs31TD0CraQQBrRbkRiuxJbFT8U/qEgZluXiXrTkRN/jY8zOIEvk2TNSGJ3Q
 gOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EBTWvQZP/RYxFNlEjf8hqWkdSO6h/uW0wx557hiI+xw=;
 b=ItDZ8irhDlTJAy2Iew/3IR14kVN+0DyRZuN6comOfDPKn2VCyHc4K99YmQJj8qDMYs
 /+tSpCjToXxJ8Ln8p1zLM47NmKV4/DoyPbkR6MMsi8bhkibGkwhOyD8cgps9HdyxMoj7
 5j1OaQtGPpAgqxysv1dpoWNc7Jpij+eSW0P9AcwWgTUgva2tQxngZqBg7ea7DFyWbbOd
 cwfCzz4JWsXwzAYAz4WcBq6aZgHqGJ+fH98HcsUwE0rhbbTfa/Cbb27TrK1zSy3QlOdV
 OY1ImiReNj5SR7vdJS+tXXLHXz9CSCpVTrI0+qkfMZnk1FJ24EQsAHd+Tpn2d2VFaf/m
 0Jsg==
X-Gm-Message-State: AOAM530I6QtuUXFJ42ts/egohuyqO9+MLu04llnugT6JeqyNe78uVgU1
 ItlXb6sn0wvp+X4ihiBwKIIY2Q==
X-Received: by 2002:a17:903:2112:b0:166:496a:74b5 with SMTP id
 o18-20020a170903211200b00166496a74b5mr25958473ple.138.1654634014690; 
 Tue, 07 Jun 2022 13:33:34 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 29/71] target/arm: Add the SME ZA storage to CPUARMState
Date: Tue,  7 Jun 2022 13:32:24 -0700
Message-Id: <20220607203306.657998-30-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
X-TUID: x5bkeFclOpmd

Place this late in the resettable section of the structure,
to keep the most common element offsets from being > 64k.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h     |  8 ++++++++
 target/arm/machine.c | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index b48a80dab7..ef374eefe8 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -694,6 +694,14 @@ typedef struct CPUArchState {
     } keys;
 
     uint64_t scxtnum_el[4];
+
+    /*
+     * SME ZA storage -- 256 x 256 byte array, with bytes in host word order,
+     * as we do with vfp.zregs[].  Because this is so large, keep this toward
+     * the end of the reset area, to keep the offsets into the rest of the
+     * structure smaller.
+     */
+    ARMVectorReg zarray[ARM_MAX_VQ * 16];
 #endif
 
 #if defined(CONFIG_USER_ONLY)
diff --git a/target/arm/machine.c b/target/arm/machine.c
index 285e387d2c..54c5c62433 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -167,6 +167,39 @@ static const VMStateDescription vmstate_sve = {
         VMSTATE_END_OF_LIST()
     }
 };
+
+static const VMStateDescription vmstate_vreg = {
+    .name = "vreg",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64_ARRAY(d, ARMVectorReg, ARM_MAX_VQ * 2),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static bool za_needed(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    /*
+     * When ZA storage is disabled, its contents are discarded.
+     * It will be zeroed when ZA storage is re-enabled.
+     */
+    return FIELD_EX64(cpu->env.svcr, SVCR, ZA);
+}
+
+static const VMStateDescription vmstate_za = {
+    .name = "cpu/sme",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = za_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_STRUCT_ARRAY(env.zarray, ARMCPU, ARM_MAX_VQ * 16, 0,
+                             vmstate_vreg, ARMVectorReg),
+        VMSTATE_END_OF_LIST()
+    }
+};
 #endif /* AARCH64 */
 
 static bool serror_needed(void *opaque)
@@ -884,6 +917,7 @@ const VMStateDescription vmstate_arm_cpu = {
         &vmstate_m_security,
 #ifdef TARGET_AARCH64
         &vmstate_sve,
+        &vmstate_za,
 #endif
         &vmstate_serror,
         &vmstate_irq_line_state,
-- 
2.34.1

