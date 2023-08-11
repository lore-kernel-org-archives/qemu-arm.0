Received: by 2002:a17:906:3683:b0:98d:b2f5:1316 with SMTP id a3csp1649274ejc;
        Fri, 11 Aug 2023 14:41:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpcetYHDDkIiuCUxTQoN6C535oCicpIZpso/VSj5Yjr83zoL41sYefxAcfLRVJCiT4n/eR
X-Received: by 2002:a37:e101:0:b0:767:3fb8:12dd with SMTP id c1-20020a37e101000000b007673fb812ddmr2986475qkm.38.1691790093577;
        Fri, 11 Aug 2023 14:41:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691790093; cv=none;
        d=google.com; s=arc-20160816;
        b=AmuX1KYqp1YaG2CC5CeD8srJi5hw+I4GsHWkPEHRd3IN7dv+Y/pxONK2tg02goH3zK
         ki2UB0J3RB+sabREDCWqdNboinER35OXDNOq71cGXtQ7lu1cK3mR5AW03lanE/m9nmkJ
         Ubjub515bpxGcbs5er8GRGNby6pN4FDh5lAeulV80FDzF72RokXXUOlz9v/FoNGxS5WN
         kS5DOR81qVZ81+auByYV/fAhvt2GJVS++3UnndJty5uCJMStlkePHYcTtks856TYzLy8
         lVGO03Itlvn2VV2/00DDVfaj95Lw0IeDqS95XGNNa4WjLQWa8IYtlJ5yHtloaS0kAkFl
         PXwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=I86vWrv0Cc2N6eMqS6LlR2KIP2s/6lRmmGaMULMJ1bU=;
        fh=oweadga+1U1BKjDqlK8hSmEWEC1EUfcsKuPkDinEDsU=;
        b=wVOAUk81Xu1GHxsm/2USWe6/apkbIzEgEIxEyNJDyhMH7MxsnSErLa3Kfd37nhqiLN
         1RaoA1Cs37RldDJ1W5qOu4+/npLF1FJiIEulyALMM3YpCRqJL9e1q9DFt/+YB8LujySA
         t46ujS4y+/retXvYkOInyTvxru9Xx1xrIVqMOGmaxFB6uhBmYub04Vl5ZunaFyAxXMu8
         ldebvcRet7l0amaqMm/3007zNyRvSnkMgJG/Vdf7Xz4rpcQ7NIcj26qN9qv20DiX3c55
         YhZCvW5r2p7c/hD30YvbYlWrNwA6jODton1Y/sU3NSbii3UzX8/tY2fZn2Dtyp5oQjJg
         lOgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Msk+SLRo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18-20020a05620a259200b0075cd143233asi2907099qko.507.2023.08.11.14.41.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Aug 2023 14:41:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Msk+SLRo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qUZsL-0003FU-KP; Fri, 11 Aug 2023 17:40:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUZsI-0003CB-I2
 for qemu-devel@nongnu.org; Fri, 11 Aug 2023 17:40:50 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qUZsB-00028w-Lp
 for qemu-devel@nongnu.org; Fri, 11 Aug 2023 17:40:50 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1bfb91ac4edso2176893fac.3
 for <qemu-devel@nongnu.org>; Fri, 11 Aug 2023 14:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691790040; x=1692394840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I86vWrv0Cc2N6eMqS6LlR2KIP2s/6lRmmGaMULMJ1bU=;
 b=Msk+SLRoyKgGBMCzMRb2YzsGPWfBgamn5sQrsZJ49b3Ow1zlkHzSrggD9UVptyYlsf
 KxqWB74rohYFh4YefVImymWT3mewHbMI6bUHTaircxv1OzRnwmbsY+NOR/YrCDv+8372
 ju0B5tSFQl5LtD24eHBByD7MS7JKAEeUDnupFd/47uiigqSAdPh/IRztZSSRob489P5O
 wB8IVedlw7YHdCv2NDwGONzdTBjGbnbAR5VhbjcMu5Z+nvmFKfYHDL+7BXEBXerOl28S
 sCQGi0S3s3WIKRoB+VQcLkh1o+H+TaM9sYed7Uu18tlJAuIdmURAP/4BkFSOQWM2y9ys
 u5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691790040; x=1692394840;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I86vWrv0Cc2N6eMqS6LlR2KIP2s/6lRmmGaMULMJ1bU=;
 b=f9l7yt7PPIPohRBhes5JHqNJFnV6LNyQUectqK67Yr6CB/ZDbaXxu+XRTunn2n9Rf9
 Lt+evesFC5CBPjY6M1faL9CaIpH+DPRSOHchwZIeZ/WRXzzUZ8OqHf26x+MQ3yCxjfIB
 0QA9QjCvQaiewzvC6DJ2riC7gxh5uVGKbTk/G0IZ7NF6xZ11NjcEhyUNYYgiu7eNQ+Kk
 JV5qa7W61I6hKwDwI+ko0Dhp099lhMEzVUi8hMRYH0fhGt/rjARtyJgRYY5lhlDjAdGq
 rz8Ywnr38QaW0K09rdUDwlxLMXbvcHrB00zDhl8FCxUmFmdMYA675ruWnonKuu01Jh3p
 w5qg==
X-Gm-Message-State: AOJu0Yz863cYz44QJLfkAGROiSFJgQ8vG6ZcuS2Kv4cwRUo6rzklFjLV
 c71R1QDckjnVNOc3myE1xVGyrXSkeRQ3jYc6Ff0=
X-Received: by 2002:a05:6870:609b:b0:1be:c586:31ae with SMTP id
 t27-20020a056870609b00b001bec58631aemr3487297oae.40.1691790040059; 
 Fri, 11 Aug 2023 14:40:40 -0700 (PDT)
Received: from stoup.. ([2602:47:d483:7301:e773:351d:2db2:8a8a])
 by smtp.gmail.com with ESMTPSA id
 gk18-20020a17090b119200b00263ba6a248bsm5723840pjb.1.2023.08.11.14.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 14:40:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 08/11] target/arm: Implement RMR_EL3 for neoverse-v1
Date: Fri, 11 Aug 2023 14:40:28 -0700
Message-Id: <20230811214031.171020-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230811214031.171020-1-richard.henderson@linaro.org>
References: <20230811214031.171020-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: yVOBE3t7Ha0d

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/cpu64.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
index b0cac05be6..0054bb6dfa 100644
--- a/target/arm/tcg/cpu64.c
+++ b/target/arm/tcg/cpu64.c
@@ -573,6 +573,18 @@ static const ARMCPRegInfo neoverse_v1_cp_reginfo[] = {
       .access = PL3_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
 };
 
+/*
+ * TODO: For a write with bit 1 set, do something with arm_reset_cpu().
+ * In the meantime, "the bit is strictly a request", so we are in spec
+ * just ignoring writes.
+ */
+static const ARMCPRegInfo rmr_reginfo = {
+    .name = "RMR_EL3", .state = ARM_CP_STATE_AA64,
+    .opc0 = 3, .opc1 = 6, .crn = 12, .crm = 0, .opc2 = 2,
+    .access = PL3_RW, .type = ARM_CP_CONST,
+    .resetvalue = 1, /* [31:2] RES0, [1] reset 0, [0] RES1 */
+};
+
 static void define_neoverse_v1_cp_reginfo(ARMCPU *cpu)
 {
     /*
@@ -581,6 +593,7 @@ static void define_neoverse_v1_cp_reginfo(ARMCPU *cpu)
      */
     define_arm_cp_regs(cpu, neoverse_n1_cp_reginfo);
     define_arm_cp_regs(cpu, neoverse_v1_cp_reginfo);
+    define_one_arm_cp_reg(cpu, &rmr_reginfo);
 }
 
 static void aarch64_neoverse_n1_initfn(Object *obj)
-- 
2.34.1

