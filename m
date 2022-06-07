Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2429952lfb;
        Tue, 7 Jun 2022 14:36:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy8yHGr/xHvtJyceEsGHQxfo4tMzdhDa2PSm0E7KGEzWRed/Nqf2DmZC9baQTCEy+SVaJ3U
X-Received: by 2002:a05:622a:1492:b0:2fb:cb55:8d07 with SMTP id t18-20020a05622a149200b002fbcb558d07mr24908681qtx.233.1654637771456;
        Tue, 07 Jun 2022 14:36:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654637771; cv=none;
        d=google.com; s=arc-20160816;
        b=HKt8BaZYA9P4QEA36kIMgWU8mn3QHsSS+TDmC2UZcQ50w8RgnLoGlev7LUY5Poum1E
         U4wKBDv9AtGWIOXQp4h0RPb/NUHv/CAR+IKBjqBlDb7+Vu9cfQfPkarxU831bKmv6Qj2
         jmrh9+ZO9tjybuIzsw4D2RJhCmBZmHp7TiPkcB4An7YxmBz+GKiQCZ0hhgqgwuDwqVkq
         2GTNrYmKEHebJlLvW4U+Ps6eMJy8hzF1T7SQsK7LxajeFj1phuCVf+BB0nW7Sh1fPTlP
         Qz5kQu0yYhYMJBR16OLQeHV0p3a3mmRk7prTRjm011wipBSfLDFSjHRupU98ArPEba2/
         ZPhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Khgw4zesO+K18d95Nf0OQk5x631DSo+q5LDKVsiqTz0=;
        b=OF61yBPVmFxqJeeIE7DedEK08gn1ix8t1QGiOQ6FTCyTbL2ZfJ+iNWfdtsHP7KIujQ
         XNyCFuE2W4qhmOpnY/oRgazigJgLzPSWNi6ba9afylHxDBkNGfuykcYwZlB8Fw2bMlWu
         nItojGD80OlB+qA+v6qnrGFKHBcjukxSfSBWK9aELYSMk8uLbif+/ZghhqsliVrQR9xp
         137e8i79Ycyu6lWRhO2jHlhcRlFNtYALlM08bueOU0EaWrBeYQR764GGOEemdwNfv3ii
         wp+Y4+WAVidu7PnMrr7k+EuDIsEZsewVkN0NGo1fN6nCvFH5Y9fDyS97pz4QL+JsxzFb
         AC0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N9gZLZL0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r17-20020a05622a035100b00304e3f11901si7209367qtw.384.2022.06.07.14.36.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:36:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N9gZLZL0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygry-0006XG-Rx
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwx-0007NQ-CK
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:15 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:38641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwo-0008Hb-Ti
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:15 -0400
Received: by mail-pg1-x52b.google.com with SMTP id 123so6595479pgb.5
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Khgw4zesO+K18d95Nf0OQk5x631DSo+q5LDKVsiqTz0=;
 b=N9gZLZL0XzwCu+XWXFvYMP66wJtfVAkHIA8iEBlADwAqwOsUqlWMc/E8i83Hi1uirJ
 wW8q9Mt4vHtZhyMZXTCXLJzAJKyordQwIIefMScAK1qusuP0Urk71IT7KNQKpJ5OjJNA
 9MAcV8TMI0cvoFuqQO59zUzmJr1y0KLqjZSIzWmrJBiFgoPfFLw73zKPalDCqW2MZXi5
 wjjkYRwvURAaoiLuq8+GTHC5In1ye4r6OI6mhoNSMqv8TG1dUyIAx4U7zIJc70FpB0up
 RLJJJPO21n1V82aCQ7RP5g8RBofeQVrsMW6EpcZ5iHTfSeHirJ0WopZYC6VrlbHWKPKx
 xnFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Khgw4zesO+K18d95Nf0OQk5x631DSo+q5LDKVsiqTz0=;
 b=sBGC3UsjUpErqtxiyNWHBISkDLupEEObYguZzuIc7/3ZzuMSp3FUyozlFQQGIGrbJp
 GRIx8YPJcyovzRacax9RGrYO18KnpYCuHZbGXTzlYp2dmIZHpfITcsXh63OhKw3aBl1M
 HZtkkEn9mFaP9++us7rI2EOqS4svyqMNR9NwLLfwEORnndAxnkDjpkamDv+aav0hcIHx
 2ImP0okIef3qgwIG99ai9ZNoOjXnbfPusjeYyMjqFfTTIEDmQgjrDIKQ4X7wk+rqDmBP
 rDp716vkf8f7g9W3ww1ZTbnxQicUkd0niYAgbkGHA65gkLl0Fasuqnnu8//I3wsLa5uY
 EXnA==
X-Gm-Message-State: AOAM533/bWG3dYKOQKZcQH3HIOk3caz0XgkVjEj4c8BC1GvqcgUWJJFy
 44INLY5iYLP+m0gBg+CEdvonmw==
X-Received: by 2002:a63:524a:0:b0:3fc:7f18:685d with SMTP id
 s10-20020a63524a000000b003fc7f18685dmr27469956pgl.387.1654634226114; 
 Tue, 07 Jun 2022 13:37:06 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 63/71] linux-user/aarch64: Do not allow duplicate or short
 sve records
Date: Tue,  7 Jun 2022 13:32:58 -0700
Message-Id: <20220607203306.657998-64-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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
X-TUID: IRvrTJ/OaegK

In parse_user_sigframe, the kernel rejects duplicate sve records,
or records that are smaller than the header.  We were silently
allowing these cases to pass, dropping the record.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 8b352abb97..8fbe98d72f 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -318,10 +318,13 @@ static int target_restore_sigframe(CPUARMState *env,
             break;
 
         case TARGET_SVE_MAGIC:
+            if (sve || size < sizeof(struct target_sve_context)) {
+                goto err;
+            }
             if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
                 vq = sve_vq(env);
                 sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
-                if (!sve && size == sve_size) {
+                if (size == sve_size) {
                     sve = (struct target_sve_context *)ctx;
                     break;
                 }
-- 
2.34.1

