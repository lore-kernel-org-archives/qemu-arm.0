Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp718464lfb;
        Thu, 9 Jun 2022 14:51:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBDnAoBFkcdb8L5dDorhHxt3VKDj3BiU5AFY8ElQdPuJBQ87SrF51NteyMRn3lXQaSxpTG
X-Received: by 2002:a05:622a:34a:b0:304:f25a:ecf0 with SMTP id r10-20020a05622a034a00b00304f25aecf0mr16575785qtw.62.1654811468120;
        Thu, 09 Jun 2022 14:51:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654811468; cv=none;
        d=google.com; s=arc-20160816;
        b=VdpiIHygIExyW+Kd1hAikVyM6x/jvkq/ASALgD68Y8Eym9wzdaDfnEV/IE6Svc8/k9
         xHhr+A0oAaKfL02dx5ZjAbULztTjLiPCWMSQQbdtqQnPhpesTrNy/gmh99R6oD3JQaGh
         U6FTKDFqG1M47KfabNC17mPaVZtufZJmTU0ERXaPKGxp7044p69ck0k4yESz4NooB7dy
         qua6yDC9IBLOAzpSQBIXEZcVqBOdzJhmPEbJkz20F0boly+ZYrCtEEKRCDmAZo0q0GwY
         DO+kBdxO1ZSstOC9AnSSwFZUKlYftsBDIBWM7a6ioejCX1CMlfdMNkQ1EPUsvaggvtZi
         Vbuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LBl5lC6+BEWBx9CDz/ugV2RwSxtDzpdW2uqAoTk2bvo=;
        b=jGXIbss6pFP5wuxxawaXYsWsBFC86fA6y2rzIXWKoSbxqsmhMPzfPX/obpEm4v/8eO
         rEFW43EfCSDe/sUBZAaxIj/OPtUgnZtM6H/shfLlkREVZs0QVqFFVjqZQx7uSazMqFGj
         s0KqgmkP5xl0pNFHlE3t4IQw4O7x6pAmmS6LsS3w7uFIT5UH14eeuIVSo/EnVY1Vg2es
         ajHKznIO7XPlI6PnZthvJhG8wZNhDDGX72OdRIYEPV71UMG14dzQ6ROLTFEl9FPuGUFR
         z7Qkz59TjMfwA6N9C/nG7y7sNqpA7OwV0EU65EGszFQnS/JDRciuAmLWGOuRk10+orWD
         7hEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wFfk04we;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020a05621419cb00b0046287aca25csi13276631qvc.173.2022.06.09.14.51.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 14:51:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wFfk04we;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzQ3W-0004UU-O6
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 17:51:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58276)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzPzd-0001to-2a
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 17:47:05 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:35707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzPzZ-0003ov-Ei
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 17:47:04 -0400
Received: by mail-pf1-x42b.google.com with SMTP id u2so22206377pfc.2
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LBl5lC6+BEWBx9CDz/ugV2RwSxtDzpdW2uqAoTk2bvo=;
 b=wFfk04we4VvoPTKrJt5HbLxAAM28fGHfwb6GIhejSnkXgbHpj8KjPtDixTcJpwMjWj
 J/8gtAcLfTne5Jk7+43rX0Ys2KXx2GIq75m07Bk123G2ZiC08zou50ogJVefdNbFmeht
 OWYm5mFsTFwf6pxjG06X8LhlF0XtaU1Zhkgyd23o02YmszbkQIqn69NaN+KTzrvaJU6E
 waIbI6ZC2XItwQvgZPSIsYZ51rrcVEnSZ6vismD6GfNzbAkP5RWSILiW1JaYU+eijuMc
 rLpAGB9n78CgyiNtofsg92hjYiN/oC+ZMIm9wf8RP3V8/S9WtFDTaccu5yDmCgnjf1+J
 6Ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LBl5lC6+BEWBx9CDz/ugV2RwSxtDzpdW2uqAoTk2bvo=;
 b=FNfKfz1FtncYkohj6Ll9ysQNvEgkGdbK0Dk5Hgi8r16NtI0WLDIu3my+Ol2rNOl3Tt
 ejjwOK3qMGIQrmv3i1rojJXrTscipPT95Hp9TkhLJffPvtQTvgxlYnIZqrz83q86H9tl
 F77JQiDrS7F3b5R47m6BqFbexbjhe05q9Uj0xPh9w+5hxGq1VQwp6+/kgGvZPn5tIUWg
 kQ4sR4v2qYVY7WrAsGvY1dwwlFG2nUW1eDF579kk5OhYqFI5WHmuTvGA7CyIhOWJwuUk
 jZ0bV83iCnbQJLHytAi+GkXSei4aNCzz5pbUelLw55tZlYgc2OS48dhlH3KZ1HDXqfM/
 iPMg==
X-Gm-Message-State: AOAM532q94uWtEHtuYFGGBtz2N2ZxUzOZOfz84gUZO9lWkLGF87wao0A
 MMj4CAjBf3I4wbk1R5wWmqVdUQZfTi6T7A==
X-Received: by 2002:a65:6044:0:b0:3fc:674:8f5a with SMTP id
 a4-20020a656044000000b003fc06748f5amr36606074pgp.436.1654811219951; 
 Thu, 09 Jun 2022 14:46:59 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 gw9-20020a17090b0a4900b001e2f6c7b6f6sm179167pjb.10.2022.06.09.14.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 14:46:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 2/2] target/arm: SCR_EL3.RW is RAO/WI without AArch32 EL[12]
Date: Thu,  9 Jun 2022 14:46:57 -0700
Message-Id: <20220609214657.1217913-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609214657.1217913-1-richard.henderson@linaro.org>
References: <20220609214657.1217913-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w3Id8QhRqKYp

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
index 78dbcb5592..c489519923 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3978,6 +3978,11 @@ static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
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
index d6818f281a..0d1670f89b 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -1747,6 +1747,10 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
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

