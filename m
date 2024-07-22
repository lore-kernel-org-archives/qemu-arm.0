Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2050372njc;
        Mon, 22 Jul 2024 10:31:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUpwb9b0Q2Ebpi3QmYcdv2JxkGPI3MRUIwRUr90W1N4gB+dBB2SosctevWcxAi782NGf738GPmuxyLEFBX9N50JUH/alMbS
X-Google-Smtp-Source: AGHT+IEOlYyGgaZuv2FNebmWz1Ga8hWilryY9/EFX0C3R78lwUbisE/+c57Aj0wohiZ7O3iXkwQH
X-Received: by 2002:a05:6122:3389:b0:4f5:19b2:5435 with SMTP id 71dfb90a1353d-4f519b25475mr3105869e0c.2.1721669473211;
        Mon, 22 Jul 2024 10:31:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721669473; cv=none;
        d=google.com; s=arc-20160816;
        b=ynzDaxyA6UmDciHzuUsIChqEWzIooVaMejCjxBs6fHoyd+/d5jXbmaPEQTQNFOdTCo
         CUUDS1h/fsa5idMWwYuBHMWMpG+IOHyOThV8jK+P0YSQTc9uY9M0lx++HzpK5tyfmiaH
         y6uJGoxxMTBXDK9KSZ8nzdI4Hr2uWjI23bQzioalLb8uOtIBEJ1Exe/cPHHQCKaWYKaH
         Ew0PwMJWQrwBN9rFxVIstd7MdnSa7sjYpnsVZOkJhFlRQ0ftzVzubQPYiI24YBHzwvwL
         11rAkd/x7AvQOUuNU6/+zuV/+rXLrwNzD2Zd+SpLoz3NRlecKH9CI5aEo/Njtq3PQytM
         bqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sbbsiddWGomdgmf8A4MCaSQ4lYafoX1GSRn6PujArso=;
        fh=spbD1uAOw2hCQBb83uSlqZAKTOl6wvNX+k1rxl9UBCg=;
        b=POmgPLAgL2f8w5217StjcORF5qs79GTsj5eOkYPYmcJSO8z3yPTluo3PuUaXTK3TDk
         s9CupNiS/761Btf7HbO50IczdqOYEpCd1BnA6gIFDpFXHnjiMXbUSan2X3MeopkFd0gq
         r9hNgjv+PNwFxcousj3FBGdD01fZm448+2+8h4DTnspANN0wsXlLLtbtM/KHFlRgNwey
         Zdppr4kUyVFn5ibwPoDhfCy4cnvWPwOuvEcghbYTkahxbKOWZGLA8dzIGrxksslyu3m+
         eef1uGX9nhEahyzt3lq7hOwL+6HDx3TSh/TKUlnHAwrqN/si4/wCVMkRSOvVgG8VZ+HJ
         AEOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vZSceE9/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-826e1b29784si1092116241.199.2024.07.22.10.31.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 10:31:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="vZSceE9/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVwrY-0000Cd-8j; Mon, 22 Jul 2024 13:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVwrX-00006u-2I
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 13:30:15 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sVwrP-0006O2-SJ
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 13:30:13 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-42793fc0a6dso32922475e9.0
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 10:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721669401; x=1722274201; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sbbsiddWGomdgmf8A4MCaSQ4lYafoX1GSRn6PujArso=;
 b=vZSceE9/t1u2xvvepcrN1jjLZBO/pHm59pnHfxW4rLa2AlQlL0PdboXwD46nYylDYZ
 jNNhCXzErrTc0Ax1EogVvJA6wooY5ic/rF/+h3nG9V2FCL2YabQM3Z2TSG/98OyV6y9E
 oXmz9tA61NQ8QH4ylP5TNTGhj6t8wOY1Xdx96ebQkJpWEv+YJqqGK6hTVpfBz+bm2iaX
 Vv40FHJvihCM3fpcSX3LqliFmDl9Qa8aYA09TSUvn4bKoCH5XIwNfRwKW/7T1Oxc4fsw
 BDnqn9jcvetYUUyzZknbjSZOXHcV4GXJymyqcgk3Yw1YjSF0hUR6W9+CC1WxqvbZ5X79
 Y6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721669401; x=1722274201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sbbsiddWGomdgmf8A4MCaSQ4lYafoX1GSRn6PujArso=;
 b=OtW7T1/Q731VIQMUdOyvpJsqpqhxnN58SVwX3uy5P7lmtLkMmF/3HVxAA7B4S/6KmP
 0adUiCUcXKXeVNNxG+ksTBlqzlbSLNjBZ0/EJjaaqcWontX78ebhvMGVLhnbEMkOcI3j
 tCgKqX75ipnc2Vd+UD1YTH9jkY9Ce1qrH5mdxAkF0Npe8uwsYUxucV08OrxQr/CsEjRh
 UCMUy74oUzth+7NHrfqLoSkxdpAszgtVqqcWgyTx6dNXjNxKtGZJ9yRvOx9BM+opevny
 8Jtcs26mFBYACM92laajeraYqFk1LecjRNlqWZAoPh0CdjvjQFWo0KQpJGOS0c4O7aAk
 ZcHw==
X-Gm-Message-State: AOJu0Ywi+iZI462GWIKRcqIrtwtHmybtJpGu0VvLSoaAeB/46FpwnWj2
 668Afg+HE9WFjWPQEJr5VGT2U0TAxcqTe7L2WsZ10WZBuIReQkdXQ0VoB//34C/YuqhGriLHB2V
 o
X-Received: by 2002:a05:600c:4f4f:b0:427:d8fd:458a with SMTP id
 5b1f17b1804b1-427ed001c92mr4015635e9.19.1721669400910; 
 Mon, 22 Jul 2024 10:30:00 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d68fa493sm138035665e9.10.2024.07.22.10.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 10:30:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH 3/4] target/arm: Avoid shifts by -1 in tszimm_shr() and
 tszimm_shl()
Date: Mon, 22 Jul 2024 18:29:56 +0100
Message-Id: <20240722172957.1041231-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240722172957.1041231-1-peter.maydell@linaro.org>
References: <20240722172957.1041231-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: WHYz01Wdcq/o

The function tszimm_esz() returns a shift amount, or possibly -1 in
certain cases that correspond to unallocated encodings in the
instruction set.  We catch these later in the trans_ functions
(generally with an "a-esz < 0" check), but before we do the
decodetree-generated code will also call tszimm_shr() or tszimm_sl(),
which will use the tszimm_esz() return value as a shift count without
checking that it is not negative, which is undefined behaviour.

Avoid the UB by checking the return value in tszimm_shr() and
tszimm_shl().

Cc: qemu-stable@nongnu.org
Resolves: Coverity CID 1547617, 1547694
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/tcg/translate-sve.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 798ab2bfb13..a72c2620960 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -50,13 +50,27 @@ static int tszimm_esz(DisasContext *s, int x)
 
 static int tszimm_shr(DisasContext *s, int x)
 {
-    return (16 << tszimm_esz(s, x)) - x;
+    /*
+     * We won't use the tszimm_shr() value if tszimm_esz() returns -1 (the
+     * trans function will check for esz < 0), so we can return any
+     * value we like from here in that case as long as we avoid UB.
+     */
+    int esz = tszimm_esz(s, x);
+    if (esz < 0) {
+        return esz;
+    }
+    return (16 << esz) - x;
 }
 
 /* See e.g. LSL (immediate, predicated).  */
 static int tszimm_shl(DisasContext *s, int x)
 {
-    return x - (8 << tszimm_esz(s, x));
+    /* As with tszimm_shr(), value will be unused if esz < 0 */
+    int esz = tszimm_esz(s, x);
+    if (esz < 0) {
+        return esz;
+    }
+    return x - (8 << esz);
 }
 
 /* The SH bit is in bit 8.  Extract the low 8 and shift.  */
-- 
2.34.1

