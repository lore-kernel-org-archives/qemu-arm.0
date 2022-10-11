Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp2885192ocg;
        Mon, 10 Oct 2022 20:24:33 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6vhBjr/3luYSHruxsWf8EisR6FVOyliT6iRWOrDc/jpX7iOcQ5HCWobC95re4ctPrVFeua
X-Received: by 2002:a05:620a:4249:b0:6cf:c984:65bc with SMTP id w9-20020a05620a424900b006cfc98465bcmr15417025qko.116.1665458673032;
        Mon, 10 Oct 2022 20:24:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665458673; cv=none;
        d=google.com; s=arc-20160816;
        b=xqPVg8A/fJAfhAAJbcHcS01QW3iQ9EtWdk1IS24SFe1bbk98wVhYPLgYrJUOasfYsq
         2EKbU/vwH989vW4ojwRFp8BJPOEMG/5QobA9jtrEP3XhsEqWj2B4RRWQwl5+Q5eIY7lD
         Sr/mcZRJyu+efiiZLGBHE76w+YuoFJJHXgdCPWivtvNJYkOacku5CAdeyRUqd8p+zels
         xhSHq1B4WEO1DjcevJZ1MyZpUDdhEt0IHOHWZgQFTreS+jjJkxgh7rDHbFv7S5rb8oh/
         Q3T+isPRjbgow70MT7ZnFwH7ziFoiu7N6xFASeXsQiIOHsATepD9ZBxJWTkIeupIFyz2
         SVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Z0R2KmhXeUORlGWyUT5i12Xi4lPWlzT7EyIDQTN1DvA=;
        b=0p3ROVNrYa/fnv/ZQu1qUTQ2APH7AuT3vu8uAtIjO1k8lOE0DYr2BiwJTNVJ97sZcr
         7479DAZ4GsiaxLGyAaF3ski0dqJjLl9W56wC3U+BYeHxeGq8cwmcPeqhkSOtru3fnnCJ
         nQxKA2a0Ncr8sz5wvyoKJKuk60rzyG2bP6Aa0pg0pA+wtcTEaJdrcnsCp64PJmGxtelY
         B7Jo8svcxZxnvjqJGojGBNXa7UwmGtd4r5YednKoS5YAfeTjbNfnXJff0YJkXf8skMQb
         rfv9Yjm4jJoVM4yOb8N6kmJpeQPni8fIM9zkLARz+jR2mmYjO3f4y69C7hp7XP0UrIAE
         Knrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KcMqU/Xc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j3-20020a05620a410300b006e03a7bd338si6762420qko.550.2022.10.10.20.24.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 Oct 2022 20:24:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="KcMqU/Xc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oi5se-00024y-KJ
	for alex.bennee@linaro.org; Mon, 10 Oct 2022 23:24:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5ny-0002TW-4R
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:42 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:45880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oi5nw-00034V-M8
 for qemu-arm@nongnu.org; Mon, 10 Oct 2022 23:19:41 -0400
Received: by mail-pg1-x531.google.com with SMTP id r18so11729597pgr.12
 for <qemu-arm@nongnu.org>; Mon, 10 Oct 2022 20:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z0R2KmhXeUORlGWyUT5i12Xi4lPWlzT7EyIDQTN1DvA=;
 b=KcMqU/Xcr2CHBCE2paYhzoNSizm9vQdhkyX/ZfGPOHF59yAEZ+nVT0N1g0rEFTGNOq
 BG8iaobKYuU/ByRbLfdF1fZq9Guq9ZujszQTg/ZgSNrBGcUn7eOD6+WfiRuZ/saQQ3jS
 3HI804XfwoQtmiiDKsO7uwhPLjMb6mKm29i67MWqj7wpsIJbh87FqhC5k8J1o8ZhuLJ6
 S6gAHN44Q+j/nqpIk4aBGieNfHaImM8YBgVTPrUgkK9gKvUcHOR37Vv6YxhHOZY2BsbR
 MpC+1OE7VxYFPW/QMQ9SR915CCaPqvlEejKpdjg+ngAv6DlNU+U1DCXvBD5ksgCBIKAM
 ThMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z0R2KmhXeUORlGWyUT5i12Xi4lPWlzT7EyIDQTN1DvA=;
 b=PQu2YVbTal1HPwCLHBM9Z7HsjrSGlZoI4goWTN/g3I0yJHnB5q5RpLZeaZ4gVTITmO
 zctm7POizfd76mKqJ/G3NlEfWZa1E+HyYpKaXS0uwW2e5U5cEqewyyl8XoDaNpMZ1hQl
 Qp8xI2qBYb2RZuHrsFYFWSAfGi0blac6RS0c9A24ox90UZi9HGPp4wjUl1LCBd7QelD3
 YY2viwCogA9m+/rN9pGR9+IvFn90cnLp0KP9DwtHDkGKNUhut88kf8enKLEQN+UNjdyH
 y0yS38yA+f5wIbHMA/r7N4d4GF2yOBI1VuZlyTGY7EZ+ZvXCi/tRQyiTMheHjvtwgpzu
 JSxA==
X-Gm-Message-State: ACrzQf0GAjSvj/f+uXRqB+1PQsn+CeTYQgZg7Y4gacpP5HvkhzLyxyxR
 mohIPPxiB3lwHZufSHwBvw/yiA==
X-Received: by 2002:a05:6a02:303:b0:458:1e4b:1e89 with SMTP id
 bn3-20020a056a02030300b004581e4b1e89mr18543551pgb.123.1665458379381; 
 Mon, 10 Oct 2022 20:19:39 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:5aa4:aba1:1c91:a9b7])
 by smtp.gmail.com with ESMTPSA id
 o74-20020a62cd4d000000b0055f209690c0sm7663567pfg.50.2022.10.10.20.19.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 20:19:37 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 14/24] target/arm: Add isar predicates for FEAT_HAFDBS
Date: Mon, 10 Oct 2022 20:19:01 -0700
Message-Id: <20221011031911.2408754-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221011031911.2408754-1-richard.henderson@linaro.org>
References: <20221011031911.2408754-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
X-TUID: 72pRU+m+hPps

The MMFR1 field may indicate support for hardware update of
access flag alone, or access flag and dirty bit.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index e9e77b7563..cde4e86db2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4139,6 +4139,16 @@ static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
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

