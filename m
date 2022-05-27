Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1198306lfh;
        Fri, 27 May 2022 11:07:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxixacgsnl+hLrk6IA3mm67ETmHEv2Z0lGhRFH/kqTxbUuUnSpzDzrKAiHAcTDc9ODUcFIf
X-Received: by 2002:ad4:5b85:0:b0:461:f4d6:32b with SMTP id 5-20020ad45b85000000b00461f4d6032bmr35885458qvp.45.1653674852942;
        Fri, 27 May 2022 11:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653674852; cv=none;
        d=google.com; s=arc-20160816;
        b=om0Apf3j69t1U8scIQrCEUZ8mePNyc4pmDYiFGmi/aY7i/+nzK5usqRFDsIy0/rTw5
         Y1sFSl5sPzcTNrbLgbHppvE+x21y5moxzQSy3Xm1HTdJI0CsHkVZtjk5d6Mc78LcWwwP
         3XQhSgotQgh9IwFViNPEYhzvs5Pf39tJEVEPTCBHjqubcWs+S0W+xY9YoKU1bbzBAUS5
         CKG9BEsUrzOxGJHu1FXhlGk1czKcxNlOkQ/gssxu/FtZYd3lQuGbY1Er0dq0/WurgENJ
         736CBTSNtYMnSyk0TO5JipsMJLBb0leb2NZZuHBPBa/fGglWhJwaR96z+WIUhwN4vFR1
         AAsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9CQLR9+ZabdVBvj8yT9hoESiXzPxfvDoRGYhKlSAaF0=;
        b=FOIHw/VdtZ0a3IBwLQnxLdl1J/ezXtIYGIvEack+9Ibq8fv74ms/lncx8hcZkCIBkc
         R0rxxvKDkfa7LeErwby4n+ebm0nO6g8yPyM+xPBqgNGSJc5HDl9l852uuhMiZOzACQSF
         LhxfQHbr6yCYqLKy9WMyAda97WBhghJZoP8rRBavqnL+NsLOXPvBGsfKtQ+bpGkPTQcu
         4lu38iizFR3EHqTT/9mOLe8y0XQrAg+8sDd3W13rTpu/bvnrPvs0fsgerRb3aidf5rm/
         JdTBEdVTSW5XckJbYMMddEimXMp42tGFlBP2Epp/hErI9Awzt4ZNaoJWOKbPsMUdIV00
         jTxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mt03msyw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17-20020ac85ad1000000b002f926c6d7bfsi3348629qtd.3.2022.05.27.11.07.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 11:07:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mt03msyw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nueN2-00042W-Dv
	for alex.bennee@linaro.org; Fri, 27 May 2022 14:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM5-000331-Hs
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:06:33 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:37678)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueM0-0001d5-Lw
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:06:33 -0400
Received: by mail-pg1-x533.google.com with SMTP id f4so4533332pgf.4
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9CQLR9+ZabdVBvj8yT9hoESiXzPxfvDoRGYhKlSAaF0=;
 b=mt03msywCe/dPxaEu9GJ/sl3afRG3iu3cN3mqRMbZBcOiTQfRlzRD+xqavz2uQwa2c
 VngJAKod20t3pBPIHLQfus41+Kij+T0ZyAskqGkkX560L400DY/VgFIAEVOhNWmJmbVI
 7buJGsyaH8Ityah1GHjFQGDVCQzPASiN4FPMFh2H8kTAFwgdJfRs/gjVjQ36rxa1eEJw
 GYKqpLa98vMbRCBCvBsk1lz1gK4pHbjl1/EYuO94xMwaEzFVxVPZ++4wMzvGHbdOCL8S
 unY9donK+oUigcxumKbNnsyYxg+9WXI3F+FVuQejSdbb3iEXtJM+AFJKlpEaiROaknNg
 zIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9CQLR9+ZabdVBvj8yT9hoESiXzPxfvDoRGYhKlSAaF0=;
 b=IffgVsPfm9iScqi01QpQ5KxKzaIHxpdvpn5kLzZQbO+zE3FKq8ydKLtcdMGbwOM9Yi
 v5OTzu6W9YQDJitJBtey9i+mD4huhQv3NDqZjrSD1EK74lrXNi66ekZM1Ju7nPjr+0cr
 9sdUGwASR7Z4dPajpqZC2w2sdT7vMdNdWd+F8nW6wLPNhrpb7PSjFEAXh4GYXzkbJfTj
 rI7OWBxayb8sVlZiFbNKJpyih0AO0a00CziAEfJDnrtHCruALpBkH7MAzBigXpmVHN1E
 S/dWBwZVRuoOv2FnmiVfZa0KBQrqDRIwV0ufjw4T3s9gDwAhBHgvNz/Z6e5FYY2dMonp
 7jPw==
X-Gm-Message-State: AOAM5305OfQsyFSCt5TutuwjMA5usw+ndJlXasbGFi/b0ExptN37ItGG
 zsgeBAf4ve0p8afu6TzpQicSQw==
X-Received: by 2002:a05:6a00:238f:b0:4f6:b09a:4c63 with SMTP id
 f15-20020a056a00238f00b004f6b09a4c63mr45411028pfc.35.1653674787327; 
 Fri, 27 May 2022 11:06:27 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170902cf4a00b001618fee3900sm3934492plg.196.2022.05.27.11.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:06:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 03/15] target/arm: Do not use aarch64_sve_zcr_get_valid_len
 in reset
Date: Fri, 27 May 2022 11:06:11 -0700
Message-Id: <20220527180623.185261-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527180623.185261-1-richard.henderson@linaro.org>
References: <20220527180623.185261-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: B9qG0FpSNFzs

We don't need to constrain the value set in zcr_el[1],
because it will be done by sve_zcr_len_for_el.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index d2bd74c2ed..0621944167 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -208,8 +208,7 @@ static void arm_cpu_reset(DeviceState *dev)
                                          CPACR_EL1, ZEN, 3);
         /* with reasonable vector length */
         if (cpu_isar_feature(aa64_sve, cpu)) {
-            env->vfp.zcr_el[1] =
-                aarch64_sve_zcr_get_valid_len(cpu, cpu->sve_default_vq - 1);
+            env->vfp.zcr_el[1] = cpu->sve_default_vq - 1;
         }
         /*
          * Enable 48-bit address space (TODO: take reserved_va into account).
-- 
2.34.1

