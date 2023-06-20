Received: by 2002:a17:906:6dca:b0:989:33b4:be89 with SMTP id j10csp198767ejt;
        Tue, 20 Jun 2023 04:09:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5JHeJ8bN40XBwDu1O1uhubbwIsML+wZIUl+rpzITV0mwV8WBIWGLo4JkThPnBpcWi+LPjY
X-Received: by 2002:a05:6214:1d2e:b0:62f:ec76:f5b7 with SMTP id f14-20020a0562141d2e00b0062fec76f5b7mr15988338qvd.55.1687259369140;
        Tue, 20 Jun 2023 04:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687259369; cv=none;
        d=google.com; s=arc-20160816;
        b=nN9r6Rowiq3pPk7yXAng4X0xzb7s8diPSZxdpeNU8FO+TXtDR60hkMJugg+fZjGq68
         n3abJU0zwbHlj9I3iXaOHmzLTkloxO8QLha/ZAb04Wxa1AFlafnkFWHwEGc12Vb6Qy+9
         Kc6Q+yTUAPq1uD5oKL4qtJrw8aT6Ji3VG0n3NXgNFmjktXIKUQPXT2HqOM9xeTCKW6tO
         YCL+q3GrSg/bkZr4Mp87ipzAMj9du9TwXPOHdXuxVQQk5MrB9ZI+rNGdrWbYV6mWt2FK
         KA1zpSrS6ZaRoWBAEICG+ds/CudRo78zZ3YZqDIN6Nr7usP7LJw5V55WiuYLskIf3x3g
         UR9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fCbxuyj6w2doHmBool/Ak6eLq+V5O+przb+5Ur/gE60=;
        b=ffH079kS3Sa0gljTvD7/E46FQNxh+nvQJAtrqhjmp80U+AH9iNMctVTc0yOgsuXR/U
         gk+2eif9hMSz+8MpwXxY6aPkoWpAHrAn6UzvLVQq/vmsW+SXe2bXYh0h2Hg0RluwdSr1
         eu+B3tgJfe5mIECO9oUIE4QExF9oN2aofJwr3q1qZQyW/PkWcdxhrXL/oDP8Li+Y0qLS
         H3EeR0y9x+iMkfv3d73sptnYjvRXcKcBh+qsEOujMGVC5yEB0Qb/tYwIv62Su9EOt34T
         +jHd+EnqQ43K7tESAjxKm/m3lQ2gBDop8LoPtFFXBnO0hYJZL8A4l3uMswWeKKs2YDsc
         +xoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YYtZzg0e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d5-20020a05621421c500b006261c14ff15si711298qvh.251.2023.06.20.04.09.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Jun 2023 04:09:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YYtZzg0e;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBZDd-0005xV-5O; Tue, 20 Jun 2023 07:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDb-0005sU-5H
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:15 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qBZDX-0004Ce-78
 for qemu-arm@nongnu.org; Tue, 20 Jun 2023 07:08:14 -0400
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-98802908fedso415206866b.1
 for <qemu-arm@nongnu.org>; Tue, 20 Jun 2023 04:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687259290; x=1689851290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fCbxuyj6w2doHmBool/Ak6eLq+V5O+przb+5Ur/gE60=;
 b=YYtZzg0emy5SVG6ME1rhnRbp7rAQK/JhH2856Pq2KTOYfxIG0rrn1o9wL6breW5A7c
 zLTRSZjgfcXeitTTY4Ksk6dBpPnDKxwCOiZsVf9oiyn7M5XCSS7FgFyAn2iL9TZ2doNG
 FRxszCJ48A/TwgEyzbY2iB+Und4i/ZZGvJgOMSwEclW9KEoh1/SlsyIzeIvOp00pTk3C
 cbFfcmt36UFGr/7aowxAJhxa76qHZWcwb6NrkWRQRYS5WvWZAT7uFBludEAPPB7gnQQV
 lr8fNrbTiWNeke9i3DYWn/Wy4ZYYUExdloCJl25lA+V4xmnZ/TYJi8OgDZDFRHblQ+Ig
 FyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687259290; x=1689851290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fCbxuyj6w2doHmBool/Ak6eLq+V5O+przb+5Ur/gE60=;
 b=dWp0GYm80sIMuRL/Olhom3DiB26wIFGBlKCfiiEdKQ0ABWexQLPZPTPTrHZTpFpghS
 rD13bGz6QQrb8iwv4DervQVGNYGQsYI4A0zp5Uj2Cxtv9Z6n32iBREG75nMuiEsBuEBE
 5J9JBVm9tWeSoqO51cvAtHkVxbl7m/Jpp68t751rIsSpKKfGQ6+PqRGiYexDNHDAZOVI
 Vnd1F2gfXScvJUd03Y/S+L8/6wJ7MbUg49O4ONpCLbx5BIASbMVzbZoD+HKlMuEU+bLE
 n2All88l6XLqeetBxUxzfqOHFH4Xl/Hz5dig15pVoQ9YaDlplKTyGwGcbWt4HSJOZAMO
 H+KA==
X-Gm-Message-State: AC+VfDwLXrR2vEXeQQDTb6CBqk00NBp4RgrHF7onL+U6s7blVmK5eud3
 ZPjISfZoHeJtAt7ZEmx/3y8/oA==
X-Received: by 2002:a17:907:c0a:b0:96f:d345:d0f7 with SMTP id
 ga10-20020a1709070c0a00b0096fd345d0f7mr10714764ejc.62.1687259289828; 
 Tue, 20 Jun 2023 04:08:09 -0700 (PDT)
Received: from stoup.lan ([176.176.183.29]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170906711100b009884f015a44sm1170687ejj.49.2023.06.20.04.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:08:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 06/37] target/i386: Use aesenc_SB_SR_AK
Date: Tue, 20 Jun 2023 13:07:27 +0200
Message-Id: <20230620110758.787479-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230620110758.787479-1-richard.henderson@linaro.org>
References: <20230620110758.787479-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62e.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YfRB7ogAoJkR

This implements the AESENCLAST instruction.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/ops_sse.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index fb63af7afa..63fdecbe03 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -19,6 +19,7 @@
  */
 
 #include "crypto/aes.h"
+#include "crypto/aes-round.h"
 
 #if SHIFT == 0
 #define Reg MMXReg
@@ -2202,12 +2203,12 @@ void glue(helper_aesenc, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 
 void glue(helper_aesenclast, SUFFIX)(CPUX86State *env, Reg *d, Reg *v, Reg *s)
 {
-    int i;
-    Reg st = *v;
-    Reg rk = *s;
+    for (int i = 0; i < SHIFT; i++) {
+        AESState *ad = (AESState *)&d->ZMM_X(i);
+        AESState *st = (AESState *)&v->ZMM_X(i);
+        AESState *rk = (AESState *)&s->ZMM_X(i);
 
-    for (i = 0; i < 8 << SHIFT; i++) {
-        d->B(i) = rk.B(i) ^ (AES_sbox[st.B(AES_shifts[i & 15] + (i & ~15))]);
+        aesenc_SB_SR_AK(ad, st, rk, false);
     }
 }
 
-- 
2.34.1

