Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp849511lfb;
        Sun, 5 Jun 2022 09:16:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBsvhjpB17Httu/tsVMxp7kcDheteE4tgWk8A7xzi4lluHO074qbZUvh9oeOUGi4iYMwP7
X-Received: by 2002:a05:622a:1346:b0:304:d512:afe5 with SMTP id w6-20020a05622a134600b00304d512afe5mr13668748qtk.622.1654445775660;
        Sun, 05 Jun 2022 09:16:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654445775; cv=none;
        d=google.com; s=arc-20160816;
        b=Qpy1xWt5gcKh9CUL6nrBt7bPyuP8NS1dPG3C84KEQR12ZheW5RxpBS8kMNeebFv066
         4ebYXEPxi9IBY7eq5eEu/POiRCbXOI08lX+1wLQnxVeIHKlpBYUTInJ+YaRRJrplZsfG
         AjVSTyhiaXBJZMrle83uHU7CZJb3hy/TqKyn14IGP9a+LiIb4PbTTUbGi8aN3AoNOOYE
         Vjl/nYvibU3BzGj9x0a466Lw+CRxj0OgGV3V12VOVclp6mNdq+k/uf1t6kfr2C6MIRaH
         XTLJkjL/si+jNUcw9MsNppPg4HiWOTr2ed9EAHPiWzyFS7sQp2cQ5LxMhU/raHYDgJrN
         k5hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BiCy+cPE5Fp9O9R0zWpEP/6dC1PqcMNp2AcNLHCUCp0=;
        b=NLZFyVjf0yF8crB7MdxSfaNn1LV7abxMNScUIFjvaC6zNsKFLuCVaXvb5Eaa5f5H6A
         Dt7rhnjW6RH05kWebRpUU7PavR4Iv1MKXUa4VT1Wme5XkOyjSK9Lp6kvr7EpIwpwZ7Jr
         In0E298XE5IFj2zXsN8kGHqE0/gHcsV8kGCHSKgoCv17Q76zlkQ5kAbei+VkTcRQ/Kad
         tro5qr4+z7Kh3yEA5GMQBOoGmdg7IouXtXJhzZIPzjNzzJoxnZejuxFb0Lc115e1cxFs
         DtiaSLrVuDp6z9LsVh2iPL7BVqeXdYX9M7lWrz0ZM8VkU5AhYchL8oQiLAVfHbn/ZXDo
         VjdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d1L4lCEg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj25-20020a056214529900b0046436db0406si6330920qvb.76.2022.06.05.09.16.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jun 2022 09:16:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d1L4lCEg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nxsvH-0000IO-3N
	for alex.bennee@linaro.org; Sun, 05 Jun 2022 12:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxsqH-0004Wi-Eu
 for qemu-arm@nongnu.org; Sun, 05 Jun 2022 12:11:07 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:40907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nxsqE-0000Th-Of
 for qemu-arm@nongnu.org; Sun, 05 Jun 2022 12:11:04 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 v3-20020a17090a0c8300b001e862664a08so2090307pja.5
 for <qemu-arm@nongnu.org>; Sun, 05 Jun 2022 09:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BiCy+cPE5Fp9O9R0zWpEP/6dC1PqcMNp2AcNLHCUCp0=;
 b=d1L4lCEgThGbpoyUeAz9yp1S+/oerstTHGDhWx2Fq+NQlyb6TXlBrhXjv2WBdBeP5o
 /tb9QHIGIKdZfaoRlsqzhOM3UEnq0W4zq8bXa2YUWxuFch6P4KyBwHOy7vSHGj+jjFxS
 eqDnFqWmBFV00krWPbRTJ/K2zLt23WcaeYo32YirjITkdTHBydlRYfs49vnNOtpBia7e
 m85QVjTAaNa9KKPaVJjMyL4zkj9IWdu5s/ABy17AeUfqIrw2WnYRWK8h2J8xrH1FLy+2
 lYnjuY3Rhx+ccMKRcJY2e3X9nllmqJfT70Jt35zfBPiahJSMbxKX80Kmlra1ceBJcTCZ
 l0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BiCy+cPE5Fp9O9R0zWpEP/6dC1PqcMNp2AcNLHCUCp0=;
 b=MYkM3aQ1KnP8SrmYEzmVO4UITcIGFASROyQ3IKOJy2Nkn9wRteeLCTOB/QoS+gPKJ7
 SOgNXUImKCpoOi+JLpHqwJSQENtaAVHPdporN/+h0cIYCZspfl57uXy91b3oImmlnHh/
 DMiIjI/XB9HZAhzDtoiWLYZAyvXbHTv7DFehk4gi6Vu3ylxAxYY3Idjt8NwRXborZm0f
 HHIFo5ijM4Kfk4q3IpKm+01B0BUb+3qktWhmKRKeX/Ckq41ncmNYBYvXUX8ei7326yi7
 NPclkVX1lAPZ7hMlCzyqpivf0C9TERCy9EoUavFMEoGbZMUUyeIcZWQMzXmB9p6U2Lfp
 yDOg==
X-Gm-Message-State: AOAM5304hn8Tm7PSgQH/I4u6iL5Zf0svLZqjrXPDS+SkTLlt7lkzUurO
 WZPZE/zXq2+VbHc6faVQacvjBA==
X-Received: by 2002:a17:902:ef45:b0:155:cede:5a9d with SMTP id
 e5-20020a170902ef4500b00155cede5a9dmr20010175plx.93.1654445461455; 
 Sun, 05 Jun 2022 09:11:01 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3fb8:a3e1:bf34:75a2])
 by smtp.gmail.com with ESMTPSA id
 q133-20020a632a8b000000b003c14af505fesm8932165pgq.22.2022.06.05.09.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Jun 2022 09:11:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 2/2] target/arm: SCR_EL3.RW is RAO/WI without AArch32 EL[12]
Date: Sun,  5 Jun 2022 09:10:56 -0700
Message-Id: <20220605161056.293920-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220605161056.293920-1-richard.henderson@linaro.org>
References: <20220605161056.293920-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wWeltjTxr54F

Since DDI0487F.a, the RW bit is RAO/WI.  When specifically
targeting such a cpu, e.g. cortex-a76, it is legitimate to
ignore the bit within the secure monitor.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1062
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    | 5 +++++
 target/arm/helper.c | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index c1865ad5da..a7c45d0d66 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3947,6 +3947,11 @@ static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL1) >= 2;
 }
 
+static inline bool isar_feature_aa64_aa32_el2(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL2) >= 2;
+}
+
 static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RAS) != 0;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c262b00c3c..84232a6437 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1755,6 +1755,10 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
         value |= SCR_FW | SCR_AW;      /* RES1 */
         valid_mask &= ~SCR_NET;        /* RES0 */
 
+        if (!cpu_isar_feature(aa64_aa32_el1, cpu) &&
+            !cpu_isar_feature(aa64_aa32_el2, cpu)) {
+            value |= SCR_RW;           /* RAO/WI*/
+        }
         if (cpu_isar_feature(aa64_ras, cpu)) {
             valid_mask |= SCR_TERR;
         }
-- 
2.34.1

