Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1544593ejb;
        Fri, 2 Jun 2023 19:35:51 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5RLB3M5IGAGlMUX5B4RwRw8wVdmniwXRxSSYAqtg8QA2Zns+EK6wQQcODnOUdX+fPYW2tv
X-Received: by 2002:a37:ef14:0:b0:75b:23a1:365c with SMTP id j20-20020a37ef14000000b0075b23a1365cmr12800710qkk.29.1685759751005;
        Fri, 02 Jun 2023 19:35:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685759750; cv=none;
        d=google.com; s=arc-20160816;
        b=H0uRJiHt6B2+Iv+0qPJtiIYtK0vxl8JLSH4CtXKzwGjt2AMOa+MuSR9O+EILvF8Jm+
         oKaFiJkGvfGwKqllLnFLyqZaovZHEAgWjD1rYHP2k0yfHdNiUxQvTUBXvHSy3fAC8Dn7
         inzz6J2nEW6VTZw1ZjOAz4cJat2CIHzKQXNa4uOu7jTN6yilUwD5A9dP//eFVBiUhuFl
         5z48XIF/2jmr6XAm+wdY8fvu5MDyqkic9MwvFjxRJuXssFBULPTCcJ0DChu/vixoE4zK
         0AWfx0zrV8eReoiNswSBHwTHAjfnOuBzLYJeHMv3J6vnSvHp2KXsuDnOwVhfACSaV317
         nN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0wKOO1FAtFF3YwGmhqnt2BeIDIxwiIxGWe3l6hDjdbg=;
        b=CCBdGnQD5Ok2rxgMF33S0m6seuYie2b51UNez0+Dj/vZPvV6o2UIGaQkY7NZCZ2wkd
         D9RGexSrxFKeSGNQH4NEa2WYBp6ZQ7BptybxeeAk0QlYXqdHTI9wF0lHFTSAbXnGjpOO
         85sNtlIutgygalxh6jw7E8rA78FH5s7zuaW3+A36p9oORoCsdsS8u8lhyPzIFfgCYJXE
         G8fmVJqnBb/uhjEvnwG3r63XDzl8CC/H9B4sV5YV8LuES8hQYfgQB84WdQ5eN1bMPf4e
         +KNV/6AoFUVe20jypBZThtxnbcxKwEI8+ztQf108BVPYFlsfBC0vdEXbhaXtlUQhpiQ/
         JnKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mjTK71ob;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3-20020a05620a12e300b0075cc6641524si1615983qkl.491.2023.06.02.19.35.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 19:35:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mjTK71ob;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5H7A-0001Jb-T3; Fri, 02 Jun 2023 22:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6Y-0000YQ-5H
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:34:58 -0400
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6J-0004hS-4s
 for qemu-arm@nongnu.org; Fri, 02 Jun 2023 22:34:55 -0400
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-55554ab909cso1963453eaf.2
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 19:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759682; x=1688351682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0wKOO1FAtFF3YwGmhqnt2BeIDIxwiIxGWe3l6hDjdbg=;
 b=mjTK71ob7GjP/xwxSRkvrfZUzZqHy7PRFKcB/FaG5z5FLHKDDZG9E/zB8SMxmVwcnY
 ncISwBJ2F6ygndSjQ0VhNC/uP2OZTVGSAaTL2vUztKq/4tNMcdhhbGF7QoggekS0DjnM
 t4Oo87AgFMv5nWSunz60uP33XmHRTO/6WwsJRj309HbBq06JOLVvwYdiBfTW3XfQhz1g
 SkSUaOQg4EoeVmwtq8iUgoh38fUuTwVhrjb+DcXw94pspGCKOhfxF+IKHfJTYGhDuvhq
 xNqZy5ZJLX0SLVCpELybSvJH5hlTxXU/9jMAqLDPa4Frzm3Et5o2zmPnuxk4QXBtkMsv
 u2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759682; x=1688351682;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0wKOO1FAtFF3YwGmhqnt2BeIDIxwiIxGWe3l6hDjdbg=;
 b=WdOsyxvcw/Mo32a6GHpU0xMKzpwaCDzUf5T2dAQrFVAr94970AIWG67UdEH0nFgLyN
 yatmWmOzTNro10WO8ZbUmrVZUhOiQHzNt0/25+ItFev2ACr9yZ6nWtru8nMPb+AYfVUG
 bZbYd51FI4g7N/kzkArUSPFLXLsUxQ/X3tKx6DK9q3iWTyLShdl4oXElIL6SBJ+NV6XC
 CgqG+gR+vB5ZWsctmvTIrFWANONlzuNkh9vLuYJglaZtfBx0qWSB84o7rzLPRVCtwRIh
 NoKw16ONh2wQ8m+Kl8OHndUs/LuWR0vjEJUPPlQIJElF8atYrTs5YxqmkKja5yoSTP6u
 PPUQ==
X-Gm-Message-State: AC+VfDyQXmcgS61DlBiUYJdaet76b4SLHvD123djxjhEI3TevGhtgfGO
 pmyagoKwaOpXXSp+JRzmJv12kQ==
X-Received: by 2002:a05:6358:7208:b0:125:83c8:72f6 with SMTP id
 h8-20020a056358720800b0012583c872f6mr15393663rwa.0.1685759682440; 
 Fri, 02 Jun 2023 19:34:42 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 17/35] crypto: Add aesdec_IMC
Date: Fri,  2 Jun 2023 19:34:08 -0700
Message-Id: <20230603023426.1064431-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2f.google.com
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
X-TUID: dIJ06ojJ5B9d

Add a primitive for InvMixColumns.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 host/include/generic/host/aes-round.h |  3 ++
 include/crypto/aes-round.h            | 18 +++++++++
 crypto/aes.c                          | 57 +++++++++++++++++++++++++++
 3 files changed, 78 insertions(+)

diff --git a/host/include/generic/host/aes-round.h b/host/include/generic/host/aes-round.h
index 7c48db24b6..1e9b97d274 100644
--- a/host/include/generic/host/aes-round.h
+++ b/host/include/generic/host/aes-round.h
@@ -15,6 +15,9 @@ void aesenc_MC_accel(AESState *, const AESState *, bool)
 void aesenc_SB_SR_accel(AESState *, const AESState *, bool)
     QEMU_ERROR("unsupported accel");
 
+void aesdec_IMC_accel(AESState *, const AESState *, bool)
+    QEMU_ERROR("unsupported accel");
+
 void aesdec_ISB_ISR_accel(AESState *, const AESState *, bool)
     QEMU_ERROR("unsupported accel");
 
diff --git a/include/crypto/aes-round.h b/include/crypto/aes-round.h
index f25e9572a3..2d962ede0b 100644
--- a/include/crypto/aes-round.h
+++ b/include/crypto/aes-round.h
@@ -74,4 +74,22 @@ static inline void aesdec_ISB_ISR(AESState *r, const AESState *st, bool be)
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
 #endif /* CRYPTO_AES_ROUND_H */
diff --git a/crypto/aes.c b/crypto/aes.c
index c7123eddd5..4e654e5404 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -1402,6 +1402,63 @@ void aesdec_ISB_ISR_genrev(AESState *r, const AESState *st)
     aesdec_ISB_ISR_swap(r, st, true);
 }
 
+/* Perform InvMixColumns. */
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
 /**
  * Expand the cipher key into the encryption key schedule.
  */
-- 
2.34.1

