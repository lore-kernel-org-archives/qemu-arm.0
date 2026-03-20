Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99951098782
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 13:10:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3ZYY-0002wn-FN; Fri, 20 Mar 2026 09:06:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3ZYQ-0002ps-E7
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:06:18 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1w3ZYL-0005zT-UF
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 09:06:16 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-666ee394529so2620122a12.1
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 06:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774011972; x=1774616772; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DXWjpi/kmC9idV0TGQYzInBfDXcfnYke1TU+YIa7noI=;
 b=KvgD1v6rKVgRqnshcs5+xCIdDXxczlkIR8VJ5hscNs5WaGw8HSe4GrTnput9zed9z2
 7ECgj5gjG/oKdX+3KHF08CaqifN75O4SeWlT5GtodGFgVEMiSzLacYVD4dYzhm1Q3ldb
 ZE8Rby361iw6mEU374yyzVSZkNQ/UjFY27eNaPVtY65zukhAVydP8k3JAd9ZxaFmXLvG
 KKrPadQJpmpkpINVyTyKODFQ8zWedIM617FB7hNhwdoJP6fHrW1Jyb1AcsjlfOzcyLkv
 09iLZmrLldSNR4KFlL7wxzagcRzN0knrNfPvRtArviIw+ca8aNAWGoHckSiv2zSvFJbK
 GgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774011972; x=1774616772;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DXWjpi/kmC9idV0TGQYzInBfDXcfnYke1TU+YIa7noI=;
 b=DWeytkGUB1SL/YyLvU0tK8yPaP9ZN9Eh2wnHUqGS0O4IYzeZwpAHV4KVLZ3hCzMofn
 H26ceIjRJgNKi3J0uYCsrX2NF8Cbf8fDOmlrRynm4U2UulTcQk3WYiKgjf8QC3cC06C1
 CkYE3VUR9JQJqlJRfUp1lX0PenTcm9u2a1w3M01IMuG+/Ue95w98qHyCrrNOuKLkhVsQ
 f2JtodspIWNJlADW4/cXRkSwfxvtbtXnrKWo78qNyM7Bbi3UDvSgkmrTi7SjMqmZyac4
 +FS+qX+yUpzD1y64sN4RW+VbOWlTxvbBUZ2JOumGfRCUuupe5wYbhGaeM6u/ZiBngFep
 U8YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYef2Vid7f7b8n+hCpubL8FENd5+siMaUCGHEvk824VHgDIm3JhGzpPusBvMJeHgaRCyt55gNEDA==@nongnu.org
X-Gm-Message-State: AOJu0YxtmbKEOH/rAq1EdZ5JOwG8vFlGYUP7Eoi/2IPyp7bHL23huqHp
 zqskaqY5NBtw5TPkId6/X19KFmr9ALky2pQvZmpvcwJ57H5/OZZ1yWCRyG0DmhOs5gk=
X-Gm-Gg: ATEYQzyoCOJgbOMMJoErNWGA7+lr4hCCHo+fYX0F73G1/I8KzlaEDWtXx2Vt2xW5mOJ
 C52T4fhb1o2FjdYMyCYzDXVpnwRAnezIXK3yKbiFU0SOnSOtF+E/XAftGHmh41cgsc7b4aJ/COZ
 ZJzy4pb/y9VKR/esKkUuMSy9tS5R80m5kafCNSSnJfma27GZiq/wXRkn4BpsBBT0SBw+bpp5YsL
 B+LYP0zo1BZ1l0uhfor+HREUOe1/G1I4+0BhC+Ocv2hCDY9Ux03PgV+PSEf2rCox9uz+wSQ8RTG
 zPLkx9PZfOlvepAy5MRsHtZt3v70TijNSa1uYT8n4g0oeS/UabyXnnTwqmTY197HO/1pB9Ukj83
 mr5tyLjN0OxHxbjpCtHy+Ogjb3JOedUmYGniOFNOw64zkLc/H8AT7mAVpHdJwS1zIhXA7gB1jbO
 dZhWM2tbAjcOZa1EkcPBMIND4=
X-Received: by 2002:a17:906:bc45:b0:b94:21a8:f7d9 with SMTP id
 a640c23a62f3a-b982f301d42mr167747566b.36.1774011971831; 
 Fri, 20 Mar 2026 06:06:11 -0700 (PDT)
Received: from draig.lan ([185.124.0.237]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b9832f44034sm158324366b.4.2026.03.20.06.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2026 06:06:11 -0700 (PDT)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id F14075F93F;
 Fri, 20 Mar 2026 13:06:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Pedro Barbuda <pbarbuda@microsoft.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 06/35] target/arm: migrate PAC trap syndromes to
 registerfields
Date: Fri, 20 Mar 2026 13:05:37 +0000
Message-ID: <20260320130607.2071996-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260320130607.2071996-1-alex.bennee@linaro.org>
References: <20260320130607.2071996-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52a.google.com
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

syn_pactrap is fairly simple as the ISS is all RES0.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/arm/syndrome.h | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index abec0a4908e..19c7659fb4f 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -398,15 +398,32 @@ static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
     return res;
 }
 
+/*
+ * ISS encoding for a PAC Fail exceptions
+ */
+FIELD(PACFAIL_ISS, BnA, 0, 1) /* B key or A key */
+FIELD(PACFAIL_ISS, DnI, 1, 1) /* Data or Instruction */
+
 static inline uint32_t syn_pacfail(bool data, int keynumber)
 {
-    int error_code = (data << 1) | keynumber;
-    return (EC_PACFAIL << ARM_EL_EC_SHIFT) | ARM_EL_IL | error_code;
+    uint32_t res = syn_set_ec(0, EC_PACFAIL);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+
+    res = FIELD_DP32(res, PACFAIL_ISS, DnI, data);
+    res = FIELD_DP32(res, PACFAIL_ISS, BnA, keynumber);
+
+    return res;
 }
 
+/*
+ * ISS encoding for an exception from a trapped Pointer
+ * Authentication instruction is RES0
+ */
 static inline uint32_t syn_pactrap(void)
 {
-    return (EC_PACTRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL;
+    uint32_t res = syn_set_ec(0, EC_PACTRAP);
+    res = FIELD_DP32(res, SYNDROME, IL, 1);
+    return res;
 }
 
 static inline uint32_t syn_btitrap(int btype)
-- 
2.47.3


