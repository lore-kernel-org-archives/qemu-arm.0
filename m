Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2173366ejy;
        Mon, 3 Jul 2023 03:12:02 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEPkqGly3y/y/hsEW64SqNLZApSUqYYYs3x/W7YdzUMEdvB+gGsUmSy0L8fyMP9jIxde+K0
X-Received: by 2002:a05:6214:c8b:b0:636:9291:c4fe with SMTP id r11-20020a0562140c8b00b006369291c4femr6368861qvr.43.1688379122676;
        Mon, 03 Jul 2023 03:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688379122; cv=none;
        d=google.com; s=arc-20160816;
        b=jsF8j/8qZjEWy2EoLzh1c+8OpNSdlMI8MNqNXHhOmKokX3tvpxawQg8S1I6tnZjuCa
         9Mu7IZWDTaT/Ee5dm4mMGhEu9qZX33taIQvSysUJwdVjtXksyMm9zR2KRQfFDdMRF0yv
         uWPcwFRG1ggBHfcGC7zt7DxjQQiOvElyV13RlApFW1cytkzgXZZ+110WcUwtso/Ilnk5
         48Kb4DveoM1E03c2sp9Qbn/9GjL4M/eYnKU1fn8sM2CXFGrH4KDTCP1+peuBTATxhbYQ
         Be3wH6qd0YOY1/i3WkuuIu4Y3AiwqqgQHF39zkE9fPGpPZbu93AMFBLaaPs9O+yed6te
         TBXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1lNVmzIrZ20vaRM4z3bBKO9neuQ8i1reH4ftvygdvPI=;
        fh=yGBgCIAdw0xhdK58ttTTG5yX3hLvrsJsvO63zqD4x2E=;
        b=yYBa3ZGlewujZXAevyBnI9jeWh1ybXWJGEn0BPb+KPgXgF9HVr4n7eRXNMC6j6SfgS
         5HUXpO8y28CqaXpwLH9EnqhFCguyovGrvHP9am1TxHHCEN2KQukBi53hobbsfS3dqhOY
         Q+VW+US2pkZcQ46m6SxHk/YTLOnEPLoygr0bT9lrl2eY2neXy9MbKgNqMukSoGXx8ltl
         s2FWR4UN94txKzHh0ytHrRTYcck9dl68ssfCJ0iQKm+er7fj14MU4ySrf25o2fFUl3In
         w6/BkRQXd57ULKLwVdwcEubhiz46oImH6IGB1L45smBRgKcbI/bFLbdBrRDFCOq+Tv+q
         1qng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oq2U6BJt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10-20020a05620a12ca00b0075cead353efsi5762735qkl.122.2023.07.03.03.12.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 03:12:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oq2U6BJt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGGRf-00036k-NH; Mon, 03 Jul 2023 06:06:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRY-0002vD-9H
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:04 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRH-0005lO-DC
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:03 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-313f61890fbso4703112f8f.3
 for <qemu-arm@nongnu.org>; Mon, 03 Jul 2023 03:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378730; x=1690970730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1lNVmzIrZ20vaRM4z3bBKO9neuQ8i1reH4ftvygdvPI=;
 b=Oq2U6BJtvZCWo/QGlpNyqGQkg4vJHq1IlhWRHI4sTjAp+jUkyM03l1u0bgm80DJDbk
 i76G67C32odZpKtUQZx6d8WbV8+D2zrsPekVKzfTMBwTf8uIc9oqfsTQKbfq+YAG7OP2
 iF2j95Sig0j0Jk4BDy62R1m78hwKVP6ZfRcI51M2pqjFnPNlxRj9D57geagCSxHQqAxL
 aJMSf8G9hs3Ey13eRXnFJCpWd0BJ5Pp10ganplvv0UJJfg1A8h68XSus21hycZmBoAsQ
 G77Jb+xX8NEJL7Jo1OjHY/8hh8Rb47CDRB4mWOeAqkgLQcPJw6uFG08jKnf4g1y3hOdX
 nTkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378730; x=1690970730;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1lNVmzIrZ20vaRM4z3bBKO9neuQ8i1reH4ftvygdvPI=;
 b=MDuGpR0pXdEGHOv6DT0Ctwi9UlKxi69dyIQ6Re1gT/ymMt712lNra+UxN1fo3qpvWq
 nRo9kJC5vcEQ2M9lWuJYBUqntuOmmnawporZUKjvbTkqUD89JJO/gF8aZ3GrxM0J3mFp
 MYyqYfqeX7ETP65UM0ku4sRXvgGyBXiBW3DMjBGWL3K0bX0kqVLrLIvEtsqD9fPIhDdq
 nKWZ3EJPQQ4jfz648C8sTnVHUXVNMp6fMqNrk2iSuknWfzVnK6nHMtNHK195UX9iCksl
 hTj6NqvjYk8V6VazyLmVJj9lEqck9XbEN15X3qcjzz6vgqGUkW0DM+lWcCX7s0mh2F9f
 lo5w==
X-Gm-Message-State: ABy/qLYDsTXFEKcenTTrZ0Rt2RBF18iFQD7NDma/+J4D5rC+oe86DDzR
 QwapFQ91HxBtW8s3YZXpxdBg5g==
X-Received: by 2002:adf:e4cd:0:b0:314:367f:15f3 with SMTP id
 v13-20020adfe4cd000000b00314367f15f3mr3271427wrm.9.1688378730536; 
 Mon, 03 Jul 2023 03:05:30 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v4 08/37] crypto: Add aesdec_IMC
Date: Mon,  3 Jul 2023 12:04:51 +0200
Message-Id: <20230703100520.68224-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x433.google.com
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
X-TUID: ilCGND5Jy3QJ

Add a primitive for InvMixColumns.

Acked-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/crypto/aes-round.h |  2 +
 include/crypto/aes-round.h                   | 18 ++++++
 crypto/aes.c                                 | 59 ++++++++++++++++++++
 3 files changed, 79 insertions(+)

diff --git a/host/include/generic/host/crypto/aes-round.h b/host/include/generic/host/crypto/aes-round.h
index 1b82afc629..335ec3f11e 100644
--- a/host/include/generic/host/crypto/aes-round.h
+++ b/host/include/generic/host/crypto/aes-round.h
@@ -15,6 +15,8 @@ void aesenc_SB_SR_AK_accel(AESState *, const AESState *,
                            const AESState *, bool)
     QEMU_ERROR("unsupported accel");
 
+void aesdec_IMC_accel(AESState *, const AESState *, bool)
+    QEMU_ERROR("unsupported accel");
 void aesdec_ISB_ISR_AK_accel(AESState *, const AESState *,
                              const AESState *, bool)
     QEMU_ERROR("unsupported accel");
diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
index 7d2be40a67..7be2cc0d8e 100644
--- a/include/crypto/aes-round.h
+++ b/include/crypto/aes-round.h
@@ -59,6 +59,24 @@ static inline void aesenc_SB_SR_AK(AESState *r, const AESState *st,
     }
 }
 
+/*
+ * Perform InvMixColumns.
+ */
+
+void aesdec_IMC_gen(AESState *ret, const AESState *st);
+void aesdec_IMC_genrev(AESState *ret, const AESState *st);
+
+static inline void aesdec_IMC(AESState *r, const AESState *st, bool be)
+{
+    if (HAVE_AES_ACCEL) {
+        aesdec_IMC_accel(r, st, be);
+    } else if (HOST_BIG_ENDIAN == be) {
+        aesdec_IMC_gen(r, st);
+    } else {
+        aesdec_IMC_genrev(r, st);
+    }
+}
+
 /*
  * Perform InvSubBytes + InvShiftRows + AddRoundKey.
  */
diff --git a/crypto/aes.c b/crypto/aes.c
index ec300cda0c..6c05d731f4 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1322,6 +1322,65 @@ void aesenc_SB_SR_AK_genrev(AESState *r, const AESState *s, const AESState *k)
     aesenc_SB_SR_AK_swap(r, s, k, true);
 }
 
+/*
+ * Perform InvMixColumns.
+ */
+static inline void
+aesdec_IMC_swap(AESState *r, const AESState *st, bool swap)
+{
+    int swap_b = swap * 0xf;
+    int swap_w = swap * 0x3;
+    bool be = HOST_BIG_ENDIAN ^ swap;
+    uint32_t t;
+
+    /* Note that AES_imc is encoded for big-endian. */
+    t = (AES_imc[st->b[swap_b ^ 0x0]][0] ^
+         AES_imc[st->b[swap_b ^ 0x1]][1] ^
+         AES_imc[st->b[swap_b ^ 0x2]][2] ^
+         AES_imc[st->b[swap_b ^ 0x3]][3]);
+    if (!be) {
+        t = bswap32(t);
+    }
+    r->w[swap_w ^ 0] = t;
+
+    t = (AES_imc[st->b[swap_b ^ 0x4]][0] ^
+         AES_imc[st->b[swap_b ^ 0x5]][1] ^
+         AES_imc[st->b[swap_b ^ 0x6]][2] ^
+         AES_imc[st->b[swap_b ^ 0x7]][3]);
+    if (!be) {
+        t = bswap32(t);
+    }
+    r->w[swap_w ^ 1] = t;
+
+    t = (AES_imc[st->b[swap_b ^ 0x8]][0] ^
+         AES_imc[st->b[swap_b ^ 0x9]][1] ^
+         AES_imc[st->b[swap_b ^ 0xA]][2] ^
+         AES_imc[st->b[swap_b ^ 0xB]][3]);
+    if (!be) {
+        t = bswap32(t);
+    }
+    r->w[swap_w ^ 2] = t;
+
+    t = (AES_imc[st->b[swap_b ^ 0xC]][0] ^
+         AES_imc[st->b[swap_b ^ 0xD]][1] ^
+         AES_imc[st->b[swap_b ^ 0xE]][2] ^
+         AES_imc[st->b[swap_b ^ 0xF]][3]);
+    if (!be) {
+        t = bswap32(t);
+    }
+    r->w[swap_w ^ 3] = t;
+}
+
+void aesdec_IMC_gen(AESState *r, const AESState *st)
+{
+    aesdec_IMC_swap(r, st, false);
+}
+
+void aesdec_IMC_genrev(AESState *r, const AESState *st)
+{
+    aesdec_IMC_swap(r, st, true);
+}
+
 /*
  * Perform InvSubBytes + InvShiftRows + AddRoundKey.
  */
-- 
2.34.1

