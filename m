Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp361461lfu;
        Tue, 26 Apr 2022 09:39:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyC/M8W1rkew+beHY/W15+YkW47yLMTuJJUmPU08ChzRWr0IKeDdi4z1hGV1FOwVLux2Xpe
X-Received: by 2002:a05:6902:c9:b0:641:1998:9764 with SMTP id i9-20020a05690200c900b0064119989764mr21812227ybs.427.1650991185008;
        Tue, 26 Apr 2022 09:39:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650991185; cv=none;
        d=google.com; s=arc-20160816;
        b=o+AFJiPBf5mE9BrNFGx6u0Z9G+eDDToVaruxdQN3Z/Ysw/F9PvqQmHLhHl7YSLZuuc
         Ht81Nm0JyHHoV42oQ41uu1bm0BejhVy381hLKg0hVDQsOsXK8l9hRQjulByCt2PXIDfN
         /Z65cEA5NdmKzcBct2w8Q32WJrLkQgfufu43FpSB2Nq9eiJKWgPUbQrQaEXberibof+Y
         g0KFkB12LdbQVXqqLIUZnOh9xYyHIzyrJ2kQrc4KtzDbBaCXak5MvG1k7UEI/x0EpIDY
         Dy2a2RtCGVaw/wUR8k02NC4y8mQRDAZtaW6wUP/ghF0wKnLJEMkwjPyxmKXvC+olkjTi
         zbjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vzxlqZXqhHtcD97hQvqP2vHJvqGZMZwhdj9ttXr1TGs=;
        b=DRSSMPh/j1bVvtNbxfr/xOybJ6NNkE/YVYYUF1BIRIqiiR++Iq0kDP7AzMDSRtcIWO
         P4Yl7nFsj66BkXpJDUh+YM+CeKiABl9I3Zjucbsr1zudY/6rfMdqCBIXzJumq3lMbupR
         Qfh1xfFTMow6U/MfBimS+OibdqabZ3mI1Kf2sSSiw4rjIugrXakGnvcRC2U744iUVnwh
         Rk4oioQFIR9MNQNskwMUXokv79U/tz7xbW9sUEuQMrz89sl5JAHVvhYUL68DTbHViq5j
         cxbYGzFnKvUkqC4uWclyYEHth+9MvrRob7dPxG7l4nsjQ7BTie4etzm2xS3TEMWi018e
         vpQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y8iO9kJC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bg25-20020a05690c031900b002f7f8796ad8si4789036ywb.218.2022.04.26.09.39.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:39:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y8iO9kJC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOE4-0003Rb-0O
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5Y-0002vk-IN
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:30:56 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:37731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5T-0003ll-Ig
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:30:53 -0400
Received: by mail-pf1-x42a.google.com with SMTP id bo5so18447721pfb.4
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vzxlqZXqhHtcD97hQvqP2vHJvqGZMZwhdj9ttXr1TGs=;
 b=y8iO9kJCUNraWPH69oG5RP/DabRLXthLftoNzUS90JagKAdAkHPe0eRrfCwMMSY/rH
 v22t7vFqfS+sdB2rqehNlz6qpOlA2Vlqs+vXpaFs10LzYPUyz09igVO4s3ZEnIixs8Ic
 UNhpqsXXn9QJIc7heEGjmz4ojGaa/fxtErnalQl5/M6WbhHIK6L2H1Q+vB0YiU6Q5XOs
 hbk2SDyrx1TWhWkOr1lD5lf6YRJi3cz1qr9ZoDba6qquRy/5H3Q+WcksFL9AGSiNLYWA
 8WU2z8l3MHFsnvL/drLzD0pNsZiQVzBTevh3SKOXvV0pZbW0Ay8UxYchfWIClCxjVTSW
 J+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vzxlqZXqhHtcD97hQvqP2vHJvqGZMZwhdj9ttXr1TGs=;
 b=PuLzTE7kIQ9887xc1xkLMWBTN+yht5uEKNO5JA/GMcj3AB8gGGghXcuILkwIzOL1d3
 og4dnxyYQvcYE0YdsVplN2qKuPptY1YpTiszjLsDhYdR3Q+XROnjwvk8soWd0w7h8brv
 e6D+rxawzphMPBDMFD8W/4TLCdAKlymHhtr2dVCwOjFdL/HtbobBm89Av17EZ64GREOC
 wubN5d5hl/W1rdoHUY5uuSw8U6R9TJUJR+Ns7D/W3zjo1RemGndozThtvLUDS5uioM6W
 Qo8Rsoggcr8Rm+eFkhqN9EtmKb5qyYWPH+Mp+9AmE0FVGMw1/xIE0VnDiqZGhIdcXooi
 XVdg==
X-Gm-Message-State: AOAM530rKdLXpmzNRrWdnJoh/tYfQ0SljRVI0L6kIx6/DxFqCHXthB18
 uZ04TScdOix0soY3jlHudv6vGaDIk4dJdQ==
X-Received: by 2002:aa7:9802:0:b0:50d:4f5d:fef6 with SMTP id
 e2-20020aa79802000000b0050d4f5dfef6mr6369753pfl.9.1650990648995; 
 Tue, 26 Apr 2022 09:30:48 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:30:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/47] target/arm: Use tcg_constant in gen_adc_CC
Date: Tue, 26 Apr 2022 09:30:00 -0700
Message-Id: <20220426163043.100432-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nWy0+wdTATwl

Note that tmp was doing double-duty as zero
and then later as a temporary in its own right.
Split the use of 0 to a new variable 'zero'.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b0b5e8b26d..5c0fd897d6 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -814,15 +814,15 @@ static void gen_adc(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
 static void gen_adc_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
 {
     if (sf) {
-        TCGv_i64 result, cf_64, vf_64, tmp;
-        result = tcg_temp_new_i64();
-        cf_64 = tcg_temp_new_i64();
-        vf_64 = tcg_temp_new_i64();
-        tmp = tcg_const_i64(0);
+        TCGv_i64 result = tcg_temp_new_i64();
+        TCGv_i64 cf_64 = tcg_temp_new_i64();
+        TCGv_i64 vf_64 = tcg_temp_new_i64();
+        TCGv_i64 tmp = tcg_temp_new_i64();
+        TCGv_i64 zero = tcg_constant_i64(0);
 
         tcg_gen_extu_i32_i64(cf_64, cpu_CF);
-        tcg_gen_add2_i64(result, cf_64, t0, tmp, cf_64, tmp);
-        tcg_gen_add2_i64(result, cf_64, result, cf_64, t1, tmp);
+        tcg_gen_add2_i64(result, cf_64, t0, zero, cf_64, zero);
+        tcg_gen_add2_i64(result, cf_64, result, cf_64, t1, zero);
         tcg_gen_extrl_i64_i32(cpu_CF, cf_64);
         gen_set_NZ64(result);
 
@@ -838,15 +838,15 @@ static void gen_adc_CC(int sf, TCGv_i64 dest, TCGv_i64 t0, TCGv_i64 t1)
         tcg_temp_free_i64(cf_64);
         tcg_temp_free_i64(result);
     } else {
-        TCGv_i32 t0_32, t1_32, tmp;
-        t0_32 = tcg_temp_new_i32();
-        t1_32 = tcg_temp_new_i32();
-        tmp = tcg_const_i32(0);
+        TCGv_i32 t0_32 = tcg_temp_new_i32();
+        TCGv_i32 t1_32 = tcg_temp_new_i32();
+        TCGv_i32 tmp = tcg_temp_new_i32();
+        TCGv_i32 zero = tcg_constant_i32(0);
 
         tcg_gen_extrl_i64_i32(t0_32, t0);
         tcg_gen_extrl_i64_i32(t1_32, t1);
-        tcg_gen_add2_i32(cpu_NF, cpu_CF, t0_32, tmp, cpu_CF, tmp);
-        tcg_gen_add2_i32(cpu_NF, cpu_CF, cpu_NF, cpu_CF, t1_32, tmp);
+        tcg_gen_add2_i32(cpu_NF, cpu_CF, t0_32, zero, cpu_CF, zero);
+        tcg_gen_add2_i32(cpu_NF, cpu_CF, cpu_NF, cpu_CF, t1_32, zero);
 
         tcg_gen_mov_i32(cpu_ZF, cpu_NF);
         tcg_gen_xor_i32(cpu_VF, cpu_NF, t0_32);
-- 
2.34.1

