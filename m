Received: by 2002:ac2:5ccb:0:0:0:0:0 with SMTP id f11csp176944lfq;
        Fri, 8 Apr 2022 17:23:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6zhzB/r22YCwVfWofM4j6BR0nUIM+VgVkxubC+HuCoFMl4ANUqs8j45Op577xs7jVZ5Gw
X-Received: by 2002:a05:622a:291:b0:2e1:fee4:8a56 with SMTP id z17-20020a05622a029100b002e1fee48a56mr17724143qtw.624.1649463786251;
        Fri, 08 Apr 2022 17:23:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649463786; cv=none;
        d=google.com; s=arc-20160816;
        b=MDjAqCpL5D4QNp5oQNkjXG2dQ/fLJSfdpakDhGFhZ4Vwb2CiDcuqlecEU5uaysUd0A
         M/7773p2z737rxftCfFXevuRlGPy7uHqF4aV8rLSkfXtxNHr7qminvs6yrJCuaXaonmK
         wRm3E3TTBI/1ogYarqOMOZbvAWuRtCqmUdN2oWpUNP9C0zN5k+dp/YO0hDQoRHYvUX4l
         kIsbiwz4WbXGKgyYPcyKS81fl5RhbzbcxNz5kEJ41/LfN5y5wPUbzw0LvGie6w59fJlJ
         GZO9WzvVjAaEJsHZhc+9eQ7IzV8Y6ElgtBCystAEo1BjWS+Az/s0Ha7XasOlrKfBNm3J
         LewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=q+NlwqyQSZalosOWPHcbsVEejz0bpldPcXN2ZslQ7DA=;
        b=bCbY/REopwIDq7ogG6KvWgsN5etaudfSJP9Rlm4KXjmt12J+QKPwNMyCfhsH5e6SxY
         bNw46YUDnqLVdsmO4pov9vErfY51u6755GvCOphjDArJ+nCZP4N7CeoLdCoqBlJO4uEG
         L8LLMEBqZ+SEjDCBKJSV+jUlIYJ6YZ97SKHI3ioIIO8q6Rolz4ClC5TR2OGNCK+W/eib
         Vtr7sBZwukecvLN8l8omrVZc7q0jf0j0bH4f7lRhNX37zHkfMQ1l4vs9IG8JikwcMQ77
         Z4UaTxPc16m3UXEr/h7rn//v//AXQmq+eJeJp4sw+iaRL9YJ9d7I6Yp7yWkF8zC5vW/x
         Babw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PKZRZPek;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h10-20020ac8568a000000b002ebc4c03a92si1251434qta.150.2022.04.08.17.23.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Apr 2022 17:23:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PKZRZPek;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ncysb-0007iE-Nu
	for alex.bennee@linaro.org; Fri, 08 Apr 2022 20:23:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncye2-00007Z-Gw
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:08:04 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:53076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ncydz-0003WK-QM
 for qemu-arm@nongnu.org; Fri, 08 Apr 2022 20:08:02 -0400
Received: by mail-pj1-x1036.google.com with SMTP id 2so10067792pjw.2
 for <qemu-arm@nongnu.org>; Fri, 08 Apr 2022 17:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=q+NlwqyQSZalosOWPHcbsVEejz0bpldPcXN2ZslQ7DA=;
 b=PKZRZPekTT/IhFJLLRCM4HPB5ZkgsadpgzFEc/j8fwlhSrNrvmdaV92OBPSnVFjUqV
 5ExHf2CFiJFhl6BY7brKRF69WCAMI10Ba1XK4Jobh5fh7e5dSQm/JfwHHWz7mPqbVTss
 s/jxwxyQc1sTayj/05iHD8KxDJkki5AgYayG8KPJYU3EYmoWvOZIKezhywC3BrVpw5Qc
 RC5OnYn2P+T+d65OwbCQcl5fQccNP3/yYn2SfiD41blHkqw8rf+nAy5TK1aBrHBi35Yp
 r3EHR1jk2fi+8X84YntnEqyivhQZbRcilDMTqvruLWdqEDAepCXakkNjZZIM1XRej8wT
 +hSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q+NlwqyQSZalosOWPHcbsVEejz0bpldPcXN2ZslQ7DA=;
 b=YA3icQXmdYvFXSFfIBYy3sqivlF7Bf1Fctxv1nqxpH2koHrDE3xG/TnkJdhs8VnxX2
 0pk8nNMpihYNOVKGTc3M7MtDpAVwGOScENupcWAi8iZBEi2/adM+yNdgeKApHoKQYzlE
 gQsEYcijZ64fLUqkT1nW9GhZAYs6FNsYf9k01mLrc4BeSNouuP9GoGRad4jDPUXAI6Ji
 v+9GA+vDX7B3/HmyGZtG8PBVvf/lfnyMjg34UfP0zoRw6t/XFD9E9yQoiYOTJtxzaz5w
 1ZDgIbSNGI00QGBIFgWaob8bnG2K5fFqINXBrqGqWGmniPDaS7Dz7rHCTSu72Eio8Q/G
 /AKA==
X-Gm-Message-State: AOAM530uWbKx4DV7hj/9xkEsfFhbD0RGFOvJlVeTNdd/KjT7R4XL5o2a
 NSU2JD6aLHDtgUer9KItqT+Hcw==
X-Received: by 2002:a17:90a:4604:b0:1bc:8bdd:4a63 with SMTP id
 w4-20020a17090a460400b001bc8bdd4a63mr24613194pjg.147.1649462878511; 
 Fri, 08 Apr 2022 17:07:58 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 t69-20020a637848000000b0039831d6dc23sm22073961pgc.94.2022.04.08.17.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 17:07:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/16] target/arm: Enable FEAT_IESB for -cpu max
Date: Fri,  8 Apr 2022 17:07:42 -0700
Message-Id: <20220409000742.293691-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220409000742.293691-1-richard.henderson@linaro.org>
References: <20220409000742.293691-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /f1cpIUtkgZE

This feature is AArch64 only, and applies to physical SErrors,
which QEMU does not implement, thus the feature is a nop.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 03c6707111..def0f1fdcb 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -838,6 +838,7 @@ static void aarch64_max_initfn(Object *obj)
     t = cpu->isar.id_aa64mmfr2;
     t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1);      /* FEAT_TTCNP */
     t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
+    t = FIELD_DP64(t, ID_AA64MMFR2, IESB, 1);     /* FEAT_IESB */
     t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
     t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
     cpu->isar.id_aa64mmfr2 = t;
-- 
2.25.1

