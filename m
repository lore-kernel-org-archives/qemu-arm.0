Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp199898ejt;
        Tue, 20 Jun 2023 04:11:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5BJYYGfJNq/RFzzeNp1A58Id088BJdvLQ+MjZ+Jg81Aq9gm1HD0C8XNq03V3FtVEbikRDg
X-Received: by 2002:a05:620a:3a49:b0:75b:23a1:8314 with SMTP id sk9-20020a05620a3a4900b0075b23a18314mr10689105qkn.15.1687259500226;
        Tue, 20 Jun 2023 04:11:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687259500; cv=none;
        d=google.com; s=arc-20160816;
        b=G8ZTIHohm2waA1vZ1fSdl0KHRKUM6v59sbjBC5+xsIObgsKh0ohCQrLr9VJdxR4Spe
         YTkWp8m5hLgCGUWuZ1o7WbqIHap1z8BKl5RV158hT/USFOF/i7GMdUk6pDWR71IRXcfD
         durMOKyIJVsZaVcaYEEYAuCvqDxWprwvtBpd0DKwD8n7D/LAnA3nNYBRau5ZYco59TtJ
         LGKagB8UWy/fs7C9hoORW0fEPTrAFdHEhBqE8hqcQyb6JNLwZ5UJKzruKiU+l2f6NOxm
         OndHr94kgIdG8WWG4QH+xefv/WILDuvxvd/+s05ulZadjNj4h6izPNqf1nqkrGgeizZY
         kkJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Vdmp9g0LETEOImAoeAZ0vz3CHG5eCYIT92dyMVPeN7s=;
        b=FcTe5cxcBDuCUu8YUwukKme6EevyNTqB65wmhCwTYTYpYkRGFcsKeedPMdYA6queli
         a6XDeUuMbNHHOWgcfwo4uYP+DjeQw0k2YfDYvs7927/eSTXP/WSfhbj7VDAmkzGAfwXo
         oAfZHoWtTyzsj3X6h/Il5HCyStNNR8Ye8A7rf+krrlhtVksN9iIWdF0rRkDmdHBoS6Xu
         kbe1PSkz8iumdLVT/7fxm7uRUuwMwVe+Tmv75JN9Vu8OTgztotvq8nu0HogoY43WRaxY
         mi19/NguxLa4xs8WBKFvPS/VwAKr1H9H9r2UWtTrzPl9uH4PjzmRWXrod0vjYKotVlA7
         FQGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=POXZzDwb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m25-20020ae9e019000000b0075d1c82775csi725298qkk.175.2023.06.20.04.11.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 04:11:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=POXZzDwb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBZDm-0006BA-FM; Tue, 20 Jun 2023 07:08:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDi-00066I-Pa
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:23 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDg-0004Iy-3Y
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:22 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-98934f000a5so62408666b.2
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 04:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259298; x=1689851298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vdmp9g0LETEOImAoeAZ0vz3CHG5eCYIT92dyMVPeN7s=;
 b=POXZzDwbBxVX8W7rYgGEU1p3NOiohanZdbS6eqbZd95rSQ28b8KjIpQEXgLolavkIl
 U8v5G31gB6S1zxvNNAFb8WR8Elr9DLRUueBe2IVA1yOtFXRF4/38cSj4V26+4VAzcfbC
 QEcCF3hg2l/omEgBApSMvnXihuHqVeL+96Jj+fG8j4zmnqYuv25wmN/E292eFjatEcjm
 XlYOemqRvbJKA9FvbD9Wmxjh1TqD3u7NySWEU6h4G86J0twSu9IZK4lOZG2fS5Gg5jM6
 NBGvFPGxrz8HBRt/tIppt+cJgUAZR4bIQ/83p/VF0qGKUOzOOxzlLtL3DBXWgqEIWgmu
 sc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259298; x=1689851298;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vdmp9g0LETEOImAoeAZ0vz3CHG5eCYIT92dyMVPeN7s=;
 b=gtDtIQlgsYj+s+Q+fbrSMZZrX22wXA8cdb0ScQtLdNiX4RdQLY9tFHaFipF6AkATKn
 NaeK3rj/ShlhCkPKfeJkyPYNp25cmkbSaDQXrknFTrt7qvO1ygvRdFdTQwK9JNcgyfEp
 GpfA0eMo/uzfFsO55Ww7AUTqdkEoxU2GfSZACM1EzC4pkPel4NdVSa1VeyH+MRjj6f+p
 Cb6GtgIFNNVVyt4guY4oHOD30IJY9uoYkMdy6oiWKLtGBzZvEBK3PEdC7+FI7w8NSo7D
 EmniARnXPmiw1dHX8+wcGcRaElJm+bXtzskFrnUHfLa6TnB32FcLUyo12VxG9FycR/FQ
 6DCQ==
X-Gm-Message-State: AC+VfDzJhVnV4Okh7j5mZ8WkFkrY8tTU01XdCMRZNy/RV1+ief3GBGBx
 0r4hClMtMZqP5EaB2lg3KtIDKJpX2Y+44kFHnYPpvASh
X-Received: by 2002:a17:907:1609:b0:986:4789:1029 with SMTP id
 hb9-20020a170907160900b0098647891029mr11972896ejc.23.1687259298750; 
 Tue, 20 Jun 2023 04:08:18 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:18 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 12/37] target/i386: Use aesdec_ISB_ISR_AK
Date: Tue, 20 Jun 2023 13:07:33 +0200
Message-Id: <20230620110758.787479-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: vgTlAgNECBzz

This implements the AESDECLAST instruction.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 63fdecbe03..0a37bde595 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -2177,12 +2177,12 @@ void glue(helper_aesdec, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 
 void glue(helper_aesdeclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    int i;
-    Reg st = *v;
-    Reg rk = *s;
+    for (int i = 0; i < SHIFT; i++) {
+        AESState *ad = (AESState *)&d->ZMM_X(i);
+        AESState *st = (AESState *)&v->ZMM_X(i);
+        AESState *rk = (AESState *)&s->ZMM_X(i);
 
-    for (i = 0; i < 8 << SHIFT; i++) {
-        d->B(i) = rk.B(i) ^ (AES_isbox[st.B(AES_ishifts[i & 15] + (i & ~15))]);
+        aesdec_ISB_ISR_AK(ad, st, rk, false);
     }
 }
 
-- 
2.34.1

