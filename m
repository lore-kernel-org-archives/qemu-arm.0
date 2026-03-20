Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A411098784
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 13:16:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3Zi0-00062c-Ku; Fri, 20 Mar 2026 09:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3Zhv-0005yj-5i
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:16:08 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3Zhs-0000Mt-8R
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:16:06 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-b79f8f7ea43so310354366b.2
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 06:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774012562; x=1774617362; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TCn4yIRAW7auCouuSuI90vgrmDQjVUO1b3NvJqSyDqU=;
 b=WNN1UmQl3PL5PKcAMnmoG5cV6yQLwkq5FIpzdAZ54nOj35Ea3RSwfVbEJA3nWo21+X
 CDP7QoR9hvAfNHXf6nkYkAoMIq+T4KSy6pYioc4jK5guKQFEgH5AOnP0S4hdLs362ry0
 BgSzUgVvBkJYjvAz33avSV84z69u8o1LVDPEx63bxj8uzK8mCHvu/WRDl/NIGQTJncky
 QrKiinRnE4SyQJSyPOIWsfEBC4LdyYYLJidy+MpzbKRcrbULOchXJA6bWol4uFoZqlyd
 cVejnXcG008yStXpk1bDRlCOsn79WxHoViSWIZ8oTEEc+mLVonLlpruQrlkqbshGpz87
 WL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774012562; x=1774617362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TCn4yIRAW7auCouuSuI90vgrmDQjVUO1b3NvJqSyDqU=;
 b=I1dKyU2W4LEvdnMhuOcxV0lnyaicUoklNkdhaBEcmUmVRJkLs4+goQ8vbDRayU+98p
 yDrInS9D7w6WivovB7fXmLEw4SGl7lM0zI/hSMRF5NZX3PmwJnD/P8qAC7PmvandwUtZ
 dCz+APJxZDyWq+ivYnZfi49mvHSxMbHyU9ZRNDSunx16Eueeq4S4qqk6JbHIgvWM+pXz
 7ePYEcqpX1knKECRmnDisPnSLIHfFB4CoGoWsvX4xtpnXm6s8B/9dqEwMjQl+5kPmQRf
 EqSktINue64gDsDMHSMjLF1pSfl9oCerKE8N5hfSSPV5HoosnencdJXmOiDzFEynMsaQ
 2wNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCGkjsuDhlHbJRZCWoeohMx9Dm2eceiK5TkhyxyhM2lVY+SGMWtyoQB8qohqgM4+2E7xhTsuyajQ==@nongnu.org
X-Gm-Message-State: AOJu0YzRDf2EPRAJj0X5Jp1+AIad0TFqyJVcq4t7BGBHLvOFNyCiJPy8
 /j/r9V4F4DDcNVTKMhQZ5pHqwRna4VUeNRm4siw3zLbYDa+xrBbGcMf6byE17snN0Bo=
X-Gm-Gg: ATEYQzz0knSpBfX0WHsIp9U1kDXiEZ5yab5qOXONJFwwp6OT7Ve+7NeKMmhgUGQI9Oj
 MQF5wn8lxLZaUvimug2eHa/4241OtJh6WDRcS0W2Bp37FnE35/aiarrvn8W77AytHkNhX9d0RkB
 1crIa/7dtMEOzrMlL9c8v5TbJz9SygRl5MNCvurFchDENGOWB70tU5pZHwt1Ly5/gJugfV6xPYE
 j05LXV0+NJLOflYPN/NGOuwXp4yls/qsv4I2SbooT+rKnwciwUic/v70Gdd+r30eoqoRhXZsADW
 ZsoXL46dhRJdQOEBF0awiRhc9fy3jFCv6SosAaWLxAYRzuOoD6EM0QDXbWTQJeXW0lucZvTOFyB
 b7A/Wlc4hrxUSZC/dIsXFkgeqrsEZ8nuH4EKAdogTECsFuIiaTvtDFmRGS3cRFIHj3FYoQNiQ5h
 9+halPT+wVHajHMj8x7c46ZeI=
X-Received: by 2002:a17:906:2746:b0:b97:a128:926a with SMTP id
 a640c23a62f3a-b982f4ecb3cmr179153966b.44.1774012562475; 
 Fri, 20 Mar 2026 06:16:02 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b98335de1d6sm158565666b.30.2026.03.20.06.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:15:58 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BB9495F9CB;
 Fri, 20 Mar 2026 13:06:08 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 14/35] target/arm: migrate memory op syndromes to
 registerfields
Date: Fri, 20 Mar 2026 13:05:45 +0000
Message-ID: <20260320130607.2071996-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320130607.2071996-1-alex.bennee@linaro.org>
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 76f66b3beef..2e3121aec9c 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -743,14 +743,39 @@ static inline uint32_t syn_serror(uint32_t extra)
     return res;
 }
 
+/*
+ * ISS encoding for an exception from the Memory Copy and Memory Set
+ * instructions.
+ */
+FIELD(MOP_ISS, SIZEREG, 0, 5)
+FIELD(MOP_ISS, SRCREG, 5, 5)
+FIELD(MOP_ISS, DESTREG, 10, 5)
+FIELD(MOP_ISS, FORMATOPT, 16, 2)
+FIELD(MOP_ISS, OPT_A, 16, 1)
+FIELD(MOP_ISS, WRONG_OPT, 17, 1)
+FIELD(MOP_ISS, EPILOGUE, 18, 1)
+FIELD(MOP_ISS, OPTIONS, 19, 4)
+FIELD(MOP_ISS, IS_SETG, 23, 1)
+FIELD(MOP_ISS, MEMINST, 24, 1)
+
 static inline uint32_t syn_mop(bool is_set, bool is_setg, int options,
                                bool epilogue, bool wrong_option, bool option_a,
                                int destreg, int srcreg, int sizereg)
 {
-    return (EC_MOP << ARM_EL_EC_SHIFT) | ARM_EL_IL |
-        (is_set << 24) | (is_setg << 23) | (options << 19) |
-        (epilogue << 18) | (wrong_option << 17) | (option_a << 16) |
-        (destreg << 10) | (srcreg << 5) | sizereg;
+    uint32_t res = syn_set_ec(0, EC_MOP);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, MOP_ISS, MEMINST, is_set);
+    res = FIELD_DP32(res, MOP_ISS, IS_SETG, is_setg);
+    res = FIELD_DP32(res, MOP_ISS, OPTIONS, options);
+    res = FIELD_DP32(res, MOP_ISS, EPILOGUE, epilogue);
+    res = FIELD_DP32(res, MOP_ISS, WRONG_OPT, wrong_option);
+    res = FIELD_DP32(res, MOP_ISS, OPT_A, option_a);
+    res = FIELD_DP32(res, MOP_ISS, DESTREG, destreg);
+    res = FIELD_DP32(res, MOP_ISS, SRCREG, srcreg);
+    res = FIELD_DP32(res, MOP_ISS, SIZEREG, sizereg);
+
+    return res;
 }
 
 
-- 
2.47.3


