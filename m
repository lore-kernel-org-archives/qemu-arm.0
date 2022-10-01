Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp470743ocs;
        Sat, 1 Oct 2022 09:55:45 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5H7zV9pzfjZg6aFWaNkH+3/7DO8uRfVNlxcyDh3C04I7UMrxhgd48LzMiqspVSxq0u428J
X-Received: by 2002:a05:620a:28cd:b0:6cf:93b3:a78 with SMTP id l13-20020a05620a28cd00b006cf93b30a78mr9814651qkp.11.1664643344934;
        Sat, 01 Oct 2022 09:55:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664643344; cv=none;
        d=google.com; s=arc-20160816;
        b=xS3M4muoUea1kpBAhXkkCkQPVWdickoC4CwUIQIEgpRl/KpZjJihnBSfoCoga3V1ly
         5RYHZgfJ3n3pzeTFFnGW5pqFGH61afsQelV7RJTiw+5UXb7YKdkDRra6tYlgdsCDzPoS
         1xDxb9pRaAAJCfvLHQZs8ICZO8Ufvz85JZpnxiMetqAgDBSSBVM/8sqjvMCn2VxrjhyB
         LqOcuEF6UIWmaPwRNX1RlF/allW39ix7Kjkf7fGehnvIgpKuWH4/dok4XxgqYWyR1fR0
         kF5RGXx61hZ60jFbUU1+xjAaE/03PEvHabGvDHvcwdGXVn4Vdps+hDihlNaJ+H1TfwF5
         O24g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hVHPTtrjmM6MNnCdxtnW1ZJbSHSO1tW4oindFVrgmZU=;
        b=zLbRWJU+FO+QZxQW79ZxIgQP39RrSwrcVGrGG/EIR5IQv9v002VP7/5jslhNVYDVoi
         NeQbv/RMfvZ9s+Uf7AmKMQemefWrYmPo5c6AhLOd08G/8jDvnHKYeAGC2w+lqGcb6oAq
         bKHv39YIsNIAUS+vpdDXHWozzqnb7oqks+9RHW6S0hkByZr4VfY3RjGOrJsVc3v9U206
         jEwRg2PTjK8Liw/IthiiX4EKq1G73RmPKq8+cFaNHeHoziOup7W3DgYD5gna35uijhEK
         t1BpAi8MDs5C/GJ9pNh6nBN7qCz3JFlaPqlG1DXFsCj09PprGTVBK5ykOeIJrmSkLaN0
         8f8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=onJGwdnk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de20-20020a05620a371400b006ce3db0e403si3369003qkb.428.2022.10.01.09.55.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 09:55:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=onJGwdnk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oefmC-0003Ai-HZ
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 12:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefI9-0008LJ-Hq
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:41 -0400
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a]:34408)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefI7-0006KI-KK
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:41 -0400
Received: by mail-qv1-xf2a.google.com with SMTP id i9so1134697qvu.1
 for <qemu-arm@nongnu.org>; Sat, 01 Oct 2022 09:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=hVHPTtrjmM6MNnCdxtnW1ZJbSHSO1tW4oindFVrgmZU=;
 b=onJGwdnkg+b6fFSsOItnuuTHvQR8qpV76LpSBLr6ZnsZPNKs3LZSvijmu13cwzl1Rl
 JoQmy41pCEMDX76xZzwQQS6kZDeYnneVcQ3ffY4IiZ+rfhm+JpwfboDVHGgbitusCBzP
 IdipD78AWWDPruAyfAkNBJGC+Q43wnUWuqY2tjv5aSpWRATj1XEded6smZX03zriRd1E
 PMMS75V6c1nVdUoGg6rb/EtnhM7GNdGrHVq8anUCIX69jaF3m/1HjsIweBhkRHDlv+6o
 zQ9rpFrcp3oKGQLnk45aT6VUtne6OWV/e4yKRgMSIZPntoghTHtS60qqlGYTotgZq2v+
 +CmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hVHPTtrjmM6MNnCdxtnW1ZJbSHSO1tW4oindFVrgmZU=;
 b=QK3owR5viaZCOrBkLTvlGw7LBuOXPxTkJjjMRpkfcu3dWC+CUvpgoMa9y2WvVfAjHd
 inTM/WFxuyW7M3SGKBgZbOXwYejeDBfDn3kqASucif3ShsTBrAN2YvvF/V/I7e7BWocQ
 rBQ2fjzUoqa2Z9ScjuDFK3Kf93PM33R1ldQIfipjxTJRmrycb10WWnBM6s/kVQRW+UvU
 PmbTgbmyyluFVTd/kddYDUQvtJSlBEdWK7w2oCpoA8lNx6iKpZNVConBR71ThTgwNUu5
 t2JNZ+bhM++9YvihwNwjnigoqWlZ6o8KiulCdX4ARwqjfJMbDJZi7J3WTjegHgMGW2w/
 l8VQ==
X-Gm-Message-State: ACrzQf2X75Xzh14cC+FGGOFoG2e55DG1aHFTE/UnmaPG608w/BNMPVdL
 IukdBpSoebqefaGVWKMjO06VfA==
X-Received: by 2002:a05:6214:19c2:b0:4b1:7a38:49c1 with SMTP id
 j2-20020a05621419c200b004b17a3849c1mr3267819qvc.1.1664641479007; 
 Sat, 01 Oct 2022 09:24:39 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 31/42] target/arm: Add isar predicates for FEAT_HAFDBS
Date: Sat,  1 Oct 2022 09:23:07 -0700
Message-Id: <20221001162318.153420-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2a;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: EjFNIRub5Vm0

The MMFR1 field may indicate support for hardware update of
access flag alone, or access flag and dirty bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7108568685..e499a84850 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4100,6 +4100,16 @@ static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, VARANGE) != 0;
 }
 
+static inline bool isar_feature_aa64_hafs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) != 0;
+}
+
+static inline bool isar_feature_aa64_hdbs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) >= 2;
+}
+
 static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
-- 
2.34.1

