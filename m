Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp33351lfc;
        Tue, 2 Jun 2020 18:18:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJjEam+zJVFoK0aa+7tKe2QdcTAHV2nMEfEAjD8Fd4NU7sR88vWeQbCSXMNGCZip9FlRZM
X-Received: by 2002:a25:6ac1:: with SMTP id f184mr47339261ybc.410.1591147091506;
        Tue, 02 Jun 2020 18:18:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591147091; cv=none;
        d=google.com; s=arc-20160816;
        b=QQiq/dLIfXLbh9jrGtzUyPD7jw9WvA5v4+GiWqPP4EGm1E+supgNyGCECzFDJEhRKf
         jUj3s2ZcX31Z+Jujej10WVyBEHG2/ogRkpybIleir/S3Ydh0vbXOOBBR72SDVkRIPiJ1
         uPnljsvWsoTHrI86sqDX7bYy38BElW3XtVDSHXw24Mmz/1ROYtPg+RUGKZzSuC1/yH4a
         Pac3oBjfjmhwyBH6+g7xZLjKIYH/wkXf6dsc7iqe4BUNRoNx+LBE2RLYQH9/jPa3o6by
         L8Ud2KPAT9oSESdWYhU1fq0A2ifXujSGlnlyazcq6fTToM/lRZMAWd2HL+jmlUXl6FpT
         Cw5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=e60Bq5SlAYtW55DZqRQCRGGXcLnTZe8NHr+quQk/wbA=;
        b=nNZZ65sSNVaLnCkInhDLyfu/EMOrs1oJ77ytlCEJqSfBMIv2uiG51oRO3se0HGmED+
         oKiaONv7wwQKSGaWOiZuHBo/HrF87EoyzD/Zm5kbs1ZIfMjJCY7xYLls2NL+5zpRqBY6
         fdJmbYsOk8dFYlJeYiv3wTcxGYFvfl0F8jd6Zffc3Cv6zCQciQgR2YzRnO9ROMQxVC31
         Pi4an6pfx/XceAGvK8BR60XtKAGWUvfOqifkdmOHzIlAHC9Wb4wXckTv24roqmCbqD7e
         5ESTOaq74QlGKtJBUxWZtQ9AF9KBEyg4o5atkyMockHtRxLEEiEQrj/J5XoBnHKv9Eqm
         kFOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NtTPwYY9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z8si321586ybm.9.2020.06.02.18.18.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 18:18:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NtTPwYY9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgI2k-0003Xb-TZ
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 21:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyM-0003qa-2Y
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:39 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:34495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jgHyI-0003YR-5x
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 21:13:36 -0400
Received: by mail-pl1-x641.google.com with SMTP id n9so208201plk.1
 for <qemu-arm@nongnu.org>; Tue, 02 Jun 2020 18:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e60Bq5SlAYtW55DZqRQCRGGXcLnTZe8NHr+quQk/wbA=;
 b=NtTPwYY9PU7sn13lSWl2GMDyhBoH9IxK9qoGwFkNqo4bECzelUhm29RunktbGUOOHm
 AftSaMCpkEW2V7h9I0hct+lLkKdxu+OvHcTUXhYqf0q3xXNzR4CJlz4Pw0a1FKqdZ+H3
 6xoRoleY5oPiG3/qh0KUe5u/jaTDNFOWxrxhctPlmbINs3Dc6h/LM02IP9SYOX1DcOBa
 0cqiDPLxUXcVdGhhHawA5cMMVfLfu2RyrzrKNbSMjZWqrxsitWfo8B8mTgXI86c1XKce
 JMYgc6wi1EgFXBDfEZrTtPEyetq8toYyxIacCaXzfHWAvgPWno3GAZoXcdj9MJRyNOsh
 YBew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e60Bq5SlAYtW55DZqRQCRGGXcLnTZe8NHr+quQk/wbA=;
 b=pA8jFOZiKeIha/fyD+bOPVK4YrNfAr2d9uc0FrEA1cnPh84cqBmAwSmLwChiXMdESr
 OYqYrarjLdfaQAccF70OXcsstorsvyPAzGjojTh8vyyouWq3GTrGmtdyubOH/o+hSG3J
 QGXoy9tSL4XB/9NG8jNV0J33ZmVnmfUnQJOQEaj60xiTmlrjIhuC2oo5Vy3ooTTPEFJ8
 a/P8gF3U+mgNym+2kcofIYeocfkQJUzyzCulJ6GbE+GJxPO9O61HUbK2fADJSNpcfVfu
 7RrF983vi3jKGoVP6FaXuD7RT4zSOLbzl8ujfTydQD4H4bKMxe1L7dX7TZt/vpLoh9BA
 gRpQ==
X-Gm-Message-State: AOAM533yRDBbl/Q3xkeGJatgbDmVkeaiGpQ85t98U8DwRx1GYdi7CxqU
 F3HT5k5euMC6n3t6Kzbk/7Yo6A==
X-Received: by 2002:a17:902:7783:: with SMTP id
 o3mr26908788pll.286.1591146812885; 
 Tue, 02 Jun 2020 18:13:32 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id 3sm290067pfe.85.2020.06.02.18.13.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 18:13:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/42] target/arm: Implement the GMI instruction
Date: Tue,  2 Jun 2020 18:12:46 -0700
Message-Id: <20200603011317.473934-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
References: <20200603011317.473934-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5wCr9noFRjYo

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v6: Inline the operation.
---
 target/arm/translate-a64.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a18d71ad98..7d0b7d5b58 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5325,6 +5325,21 @@ static void disas_data_proc_2src(DisasContext *s, uint32_t insn)
                                              cpu_reg_sp(s, rn));
         }
         break;
+    case 5: /* GMI */
+        if (sf == 0 || !dc_isar_feature(aa64_mte_insn_reg, s)) {
+            goto do_unallocated;
+        } else {
+            TCGv_i64 t1 = tcg_const_i64(1);
+            TCGv_i64 t2 = tcg_temp_new_i64();
+
+            tcg_gen_extract_i64(t2, cpu_reg_sp(s, rn), 56, 4);
+            tcg_gen_shl_i64(t1, t1, t2);
+            tcg_gen_or_i64(cpu_reg(s, rd), cpu_reg(s, rm), t1);
+
+            tcg_temp_free_i64(t1);
+            tcg_temp_free_i64(t2);
+        }
+        break;
     case 8: /* LSLV */
         handle_shift_reg(s, A64_SHIFT_TYPE_LSL, sf, rm, rn, rd);
         break;
-- 
2.25.1

