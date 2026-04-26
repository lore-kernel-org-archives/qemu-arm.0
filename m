Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6016FF8863
	for <qemu-arm@archiver.kernel.org>; Sun, 26 Apr 2026 13:56:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wGzof-0006Gk-Bn; Sun, 26 Apr 2026 09:46:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznd-0005dg-Jc
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:38 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wGznc-0001Mc-6K
 for qemu-arm@nongnu.org; Sun, 26 Apr 2026 09:45:29 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2a871daa98fso61194465ad.1
 for <qemu-arm@nongnu.org>; Sun, 26 Apr 2026 06:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777211126; x=1777815926; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aGWxvB5DOoCsVkn5ow4oJonJhUS77zZ22UYKKqluXkw=;
 b=lvaTl+rLp3jlNARzx/cMl2dUovAXsyYxMx0M0zBLxHTH4hdUKzP34Z72Vu0AzwTt1q
 nJ+pAyrA3YtDZ4Pl3otL1E/yuXnDO2elzgG3OjTLAXbnr7jxNPHA7NrYjph8XsWtrEoc
 DD3rLwFxqcWtAPunolVD6pIHBUnzDSxJQ3aLe3ED1yLDt5xNGOjP5y640fllWFn8PIhe
 /59BH0QZzQiJb24BI/uAjWE9fT4sxl1P1boAWzjj/BIIWmyInSV1xHn7LCyv8WJjXxx8
 mYHMgcV/BiVd4x3cG2MBZdJ/PIVeeoHyQhwsHUsJsYxgPxym6l3svZbLM6kdB7uevk5h
 vJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777211126; x=1777815926;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aGWxvB5DOoCsVkn5ow4oJonJhUS77zZ22UYKKqluXkw=;
 b=GxH6E/9VfaOIhpB0+//COjGMdh3Y5slSH5/8MG5izibHTV+WrpC1B8AJQY6t2owXQg
 Omgxu+OoszTFUxdc8QuWpw0u+m68IAFKbJwACzZExT6KE4oW1VGt+a4c/AeBeMKDCdZw
 Fdx73L3OtVbbF9vTwsFXnKoXmMv1TUpPZxfeijJNnv/5PgNup4yI/+ylYp2sB4ZPuROR
 qccAfj1Q0w8QNjpt/S2C+ahaYhVc1PztdM81wRq7hEsCeF+5OlYgYBdhTcJUAxPlWarl
 uHIjhcjFInSJoIHKXBzLC2ZpFDnI1rv4NtqFO+biwBLmbn/MyE+3ymN5Pbn2lyfirZJa
 hU5w==
X-Gm-Message-State: AOJu0YyEkVseO1M0bkhxE6ZjVyX/tjP9FAecgVllyWqe9NWAKrtzGO3S
 zzBD62KdrKMxPXfRElXfaGi8fWkJU4a6Uybfh7DDusJr8DQSbZZEDVd5PrLgIK+jPde4DesuyD+
 Bu0VFWRQ=
X-Gm-Gg: AeBDiesBK2NcqHRVWVzX4dxDPcxQe30pyjOqzLbRcQ1tue1lbOixg3SdCodpuvxRVMG
 rofuhWKP/DXhA71nYevimyxwYY6oiEStRJRAGY7gqjbJ99d+uYA741Dm2PAC023T3jXqz0myl9/
 TuDgpPffdMJ5ef4X+4qJ28DbsBZ5DzePnTkSHAqS9pSomdosp15aHoFhG5svTfBpo9pq97/aUdQ
 +DLZj1IGC1D7sxYwR95VfxsyceLckf1w574spFDGgQVcnI1goMfbAoCdvK5WTDkC1/q8CF5l8Zw
 qiK3SBiEl/Hh/NnPNtEOpRVrC76WcrL5WyDhzcH6aQFL17Jffzgav/7LOXSuLkOTkOR2yZh5a7Q
 sLarkt81qXQ+awKgYh17hMmF/Tv2fHolMaj6AkvWm/3iUeBbqd/rawD3XUJ8G8IEXZua9hVLvqH
 4dQjDdW8UtGTNGKi27lpON/H+8uFx4hKphRaXLvSV/
X-Received: by 2002:a17:902:f08d:b0:2b2:4ded:954e with SMTP id
 d9443c01a7336-2b5f9f2f6ebmr270942755ad.24.1777211126497; 
 Sun, 26 Apr 2026 06:45:26 -0700 (PDT)
Received: from stoup.. ([180.233.125.15]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5faa34ea7sm280544085ad.34.2026.04.26.06.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 06:45:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	qemu-s390x@nongnu.org
Subject: [PATCH 50/84] fpu: Inline float8_e5m2_pack_raw into single caller
Date: Sun, 26 Apr 2026 23:39:27 +1000
Message-ID: <20260426134002.865628-51-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260426134002.865628-1-richard.henderson@linaro.org>
References: <20260426134002.865628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 fpu/softfloat.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index 18f2ca900f..5269e5f977 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -673,11 +673,6 @@ static uint64_t pack_raw64(const FloatParts64 *p, const FloatFmt *fmt)
     return ret;
 }
 
-static float8_e5m2 QEMU_FLATTEN float8_e5m2_pack_raw(const FloatParts64 *p)
-{
-    return pack_raw64(p, &float8_e5m2_params);
-}
-
 static float16 QEMU_FLATTEN float16_pack_raw(const FloatParts64 *p)
 {
     return make_float16(pack_raw64(p, &float16_params));
@@ -1477,7 +1472,7 @@ static float8_e5m2 float8_e5m2_round_pack_canonical(FloatParts64 *p,
                                                     bool saturate)
 {
     parts64_uncanon(p, s, &float8_e5m2_params, saturate);
-    return float8_e5m2_pack_raw(p);
+    return pack_raw64(p, &float8_e5m2_params);
 }
 
 static float16 float16a_round_pack_canonical(FloatParts64 *p,
-- 
2.43.0


