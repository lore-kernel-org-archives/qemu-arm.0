Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5053603ejc;
        Mon, 27 Feb 2023 13:35:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+QZoUuZDKOLHGsH6wWCwZZUFdqrA++T7s+kqC/Ug9QIDkI1btOEolZKeJND372DrVuW/N9
X-Received: by 2002:a05:622a:1052:b0:3b6:3e4f:f876 with SMTP id f18-20020a05622a105200b003b63e4ff876mr1458386qte.18.1677533726758;
        Mon, 27 Feb 2023 13:35:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677533726; cv=none;
        d=google.com; s=arc-20160816;
        b=F044G5dG9YU6GnP+FgpTGJdlZmMD75DX1DCZnXTDw32OKQz0rw0GSfASh4d+dw/Zb2
         IZKmk3zqlFDJmwA9BtlYMUD3BrqxkDOvrQgnwoKxKiSK6G2oNN0JklEgDEUgGWYX3RME
         zdzfifazAdxApDzxs6LeCTavuDaKEQaiaaoGrfabIwjtcRAtUWKOcGz/1/hnXvzRVJ23
         jIgHqVUOme1yXL1/W0qdQeHHvhGgcRPzNXkRAb0pM3ze6XP7ACtPvTVBNpyB0UKWJdN2
         IybiLj/+BJz7jBcFaWMP+M5lfG0VAm42ejnQLHbZhTnTk54oUq1Np7A4MdbMfMwCc8NF
         EEAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MvN6MH9XtbRDVN7/usi5kmILWEamfWIGeSaIRJTwC88=;
        b=MaHJlaE85EVEdpLb1JQIF9ZAfcQkvLJ63ZG9X3ZDAoYaRYHSiL6A/drAvu249nit3Z
         t6AHsb/CHfN3po7EM/QW5tihD1hRhJoLWS2Pf7Srp5dxOkGS3u/kFYMlbQYJYfmEZOzz
         T0hzClG2rqudb7zvGpdWVFKSNj5Zqkc6jt6QiaJ+pX9nHFKfijFYX/GVsTtmI1Htwipt
         KDCnv9dXWy8sfSev0ssEgRDGsbIaptjmr36B9W01EkOXp0OICyfE2bm/nL2OWdZfBhAR
         a6n7kzv+ANVdnE8n0xdRwS1dIbcUd+ciZYTIREYaKoHQqKxQloNXGKQFaCIjSR3hSDIQ
         4d3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n0wJg8do;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2-20020a05622a100200b003ba2a171913si7060204qte.578.2023.02.27.13.35.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 13:35:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=n0wJg8do;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWl84-0007FF-97; Mon, 27 Feb 2023 16:33:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl82-0007EQ-M5
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:50 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWl81-0004K6-62
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 16:33:50 -0500
Received: by mail-pl1-x62c.google.com with SMTP id c1so8277696plg.4
 for <qemu-arm@nongnu.org>; Mon, 27 Feb 2023 13:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MvN6MH9XtbRDVN7/usi5kmILWEamfWIGeSaIRJTwC88=;
 b=n0wJg8dooAPjYYANl4Zs0R8tvA4FgrUvQZ/sJIzxBmFoeFleQoOesaaxwwbJbCTw5i
 E2x3Zx+6myEP3+vJGR23vm2x5x+94Rm9thvlYZFRz1Z1hGpnP0R2I9G6zHS+8KX9C7e8
 0W10K+hizPTOuc986iLq/mWu64Hk47GoR4rJTPjpLmks4OTKTia/iUyAsHhP0jQCJ4l/
 z/s2ozZ/9Sdwq949vKsMYVp6S0dWJvDtmlxPaE1l5H1wx0TAjpJLexkAbsj7xFhIUrv8
 fRVn2hTDMM4eyHGsnSkUVc1LxCRimWJnTXakHINLvR30uNm2UpzPw4SasJeYYA1oaN1L
 sH1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MvN6MH9XtbRDVN7/usi5kmILWEamfWIGeSaIRJTwC88=;
 b=RUlQkoc6mkGCUAa8edUtP9zo2hBOHsLQTOh3LtEwVKaKou0cHGm+vzcyWPRfXpiCLc
 Za1lIKixVPzedd0G6wMxh3rZgkJh5z4Jjo4WKeoYMUNYvYdhRyoJyi0lUFWENBMDiVDp
 E4cL7C/k5jwfstURNDzsnD1CijbUCLjFvB3KpkBzyD669Z685Prk0CjwzzY0pM/BX4Wp
 iI1zsHPsn7HhbYaVMp3flxhxUE6mQrgXSy6J4uBq55I9kihVcJYJzx1IaErysHxXQzzy
 gkCGBDtw+sn8/JOFxcwLIubHBe+Dt5D7PlLGeCmrFN19oDUOXzm+HTX/m39JckpIlt/a
 el8w==
X-Gm-Message-State: AO0yUKWzbKus0UOW44ijC2GSmugKHwH9jccplZXILLFqgzwhFztbmh8q
 s+5BCTcic6zt3JA+5nRz6xf9f7O2zGpIdmd1wB8=
X-Received: by 2002:a05:6a20:bc8f:b0:cc:606a:4349 with SMTP id
 fx15-20020a056a20bc8f00b000cc606a4349mr716607pzb.8.1677533627633; 
 Mon, 27 Feb 2023 13:33:47 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 d137-20020a63368f000000b00478c48cf73csm4375262pga.82.2023.02.27.13.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 13:33:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 10/14] target/arm: Create pauth_ptr_mask
Date: Mon, 27 Feb 2023 11:33:25 -1000
Message-Id: <20230227213329.793795-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227213329.793795-1-richard.henderson@linaro.org>
References: <20230227213329.793795-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DoMlAy9Op2bG

Keep the logic for pauth within pauth_helper.c, and expose
a helper function for use with the gdbstub pac extension.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h        | 10 ++++++++++
 target/arm/tcg/pauth_helper.c | 26 ++++++++++++++++++++++----
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 725244d72d..c02dd59743 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -1366,6 +1366,16 @@ int exception_target_el(CPUARMState *env);
 bool arm_singlestep_active(CPUARMState *env);
 bool arm_generate_debug_exceptions(CPUARMState *env);
 
+/**
+ * pauth_ptr_mask:
+ * @env: cpu context
+ * @ptr: selects between TTBR0 and TTBR1
+ * @data: selects between TBI and TBID
+ *
+ * Return a mask of the bits of @ptr that contain the authentication code.
+ */
+uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data);
+
 /* Add the cpreg definitions for debug related system registers */
 void define_debug_regs(ARMCPU *cpu);
 
diff --git a/target/arm/tcg/pauth_helper.c b/target/arm/tcg/pauth_helper.c
index d0483bf051..20f347332d 100644
--- a/target/arm/tcg/pauth_helper.c
+++ b/target/arm/tcg/pauth_helper.c
@@ -339,14 +339,32 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     return pac | ext | ptr;
 }
 
-static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
+static uint64_t pauth_ptr_mask_internal(ARMVAParameters param)
 {
-    /* Note that bit 55 is used whether or not the regime has 2 ranges. */
-    uint64_t extfield = sextract64(ptr, 55, 1);
     int bot_pac_bit = 64 - param.tsz;
     int top_pac_bit = 64 - 8 * param.tbi;
 
-    return deposit64(ptr, bot_pac_bit, top_pac_bit - bot_pac_bit, extfield);
+    return MAKE_64BIT_MASK(bot_pac_bit, top_pac_bit - bot_pac_bit);
+}
+
+static uint64_t pauth_original_ptr(uint64_t ptr, ARMVAParameters param)
+{
+    uint64_t mask = pauth_ptr_mask_internal(param);
+
+    /* Note that bit 55 is used whether or not the regime has 2 ranges. */
+    if (extract64(ptr, 55, 1)) {
+        return ptr | mask;
+    } else {
+        return ptr & ~mask;
+    }
+}
+
+uint64_t pauth_ptr_mask(CPUARMState *env, uint64_t ptr, bool data)
+{
+    ARMMMUIdx mmu_idx = arm_stage1_mmu_idx(env);
+    ARMVAParameters param = aa64_va_parameters(env, ptr, mmu_idx, data);
+
+    return pauth_ptr_mask_internal(param);
 }
 
 static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
-- 
2.34.1

