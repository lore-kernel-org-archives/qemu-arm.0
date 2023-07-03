Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2172673ejy;
        Mon, 3 Jul 2023 03:10:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFvnfHh0SlRP35RZdfqMIl6CiB3aa7bFZa9XtvdtdFm7FEOnsjkfLuoDJ/xCpFFfkRMKzgc
X-Received: by 2002:a05:620a:3955:b0:767:54fd:65b2 with SMTP id qs21-20020a05620a395500b0076754fd65b2mr7558997qkn.66.1688379033088;
        Mon, 03 Jul 2023 03:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688379033; cv=none;
        d=google.com; s=arc-20160816;
        b=b8oDpJv+QYGuphqqHZi9tKcLuq6ZWpZpBRWRdXWdomAHvjg1yTqYOISKAXZ9TNkzDZ
         oi2xte7It7CxFHGMq4/EMEPsgyTm9ZhOzJ+r9g4m4WyLbnm0AKCuUDp8+zu9G7zTwdjU
         L0mqUdrPJhGpvHmPDfCvG+/guD20Wyb4mLBIn3mh+3RgQv4FcA/3e7Oj9EBgBl0VtF6d
         3jFEkLmcSmvY6vIqBARaCdrbm9Nh4XlwrIkdRSZw0lIHe180HZKruOwTqKbIsYlpmX36
         7OuanM2zkNIYEV5KpdwBTIQpEj/QpaqYIWEdrta4x5NhpYfTHXyVupF9X2OTEejmLnZg
         0nzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LO6Chl8aQYLOaHq+kw102b8WCIYofNouZUqxF+V9shk=;
        fh=QgDoIuhvPgc2IEOs0IRGDFwvtZaiTfC8q6Rpekinx9Q=;
        b=ltpbwIZOhUUjz4sDmMNADxZAM9Wnjrf2e8u4K4fmsRklSfO3o3hlQVHeaqjK4CDY+H
         eGQtsMCSz2MhuaDyl/F3l7lw6pRKsjLZk+lpLSJoiji8cxBHhcOpT5b8goxal/7JzxS0
         fCQRkf8CqpH0Ylm4Ryt/zKOFhjIm0U5NJHjsrFWRWxpOAB9pwiCCvqgs73LgUjbJPXbI
         2mHZa87PbyEJyeg0yQ2rmfy1O8PPbS2KgVODfY3gMpSR1trupdmqBheD+yRbJzl3mXa+
         jhbAJ9iGxSvWe1aqvjLrku7HmXVQC0Vw3HaiOfZLet0sJ3a6sOD6SFrVKuP11nzhqB5E
         XDnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wfoj7yBv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2-20020a05620a444200b007672e218ce8si7467878qkp.264.2023.07.03.03.10.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 03:10:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Wfoj7yBv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qGGSk-0005OR-KD; Mon, 03 Jul 2023 06:07:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRp-0003Cl-8o
 for qemu-devel@nongnu.org; Mon, 03 Jul 2023 06:06:24 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRU-0005zw-6j
 for qemu-devel@nongnu.org; Mon, 03 Jul 2023 06:06:15 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3fbc54caad5so35868595e9.2
 for <qemu-devel@nongnu.org>; Mon, 03 Jul 2023 03:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378757; x=1690970757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LO6Chl8aQYLOaHq+kw102b8WCIYofNouZUqxF+V9shk=;
 b=Wfoj7yBvoE2rJiaUip7aBTpzIk5X8EPJzvFr5SdfrtuOrbdaeKRFsVVP3QF6HhXIyB
 Qu1xnx8xtXPVvKAF2KQ3Iy+iOkv/q6mP4EmBKk5mJfaf5mgdfGexmNYusfCnl6r/dCSR
 8JAp7gR6lxrfuJnwstFCnbe8F4Utnrj+O5M26Y/2Enh2r9V89BO8ThgockIqvf9Sfy02
 tp+sOJMcG5EwJHhaVU7lDKOWpymMwxrj/rD+iHHRW4OgiCWc6jCTRq9ZyI4fegHAH2sl
 1LF9mBIvD7TaN9MbuieG/oTH2PcjlaMKC0DL3usNsZ2p5Au93viQYW9FpAl/0kzaBEum
 p4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378757; x=1690970757;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LO6Chl8aQYLOaHq+kw102b8WCIYofNouZUqxF+V9shk=;
 b=MVzjKC1a/CsuEcxjKyP42uwliF/cLzDYR8ZWJRrpX1IZOczSGb/n3okyhvMF1vpF9Q
 ek5Dm4ur4VSh+DC7J8GDtNhliCL7OfNcUnRRXVQeElIMRe2DkaDRSe0EEGMgVlCzZ+80
 dIpmMi/teObOTBXbuvCpCK+1hiShmGS7tM8/uosZrKOLasD+cVjLFanv8EjQD/MRFFos
 x1l60hzWyrHupi74+O60gKUVmPZJvKxDwLJE818i5mIhBYfJf4SloXrRnhKM3DIwsd/M
 s/mjGYo5wfaLY/toKrBVLwz0U/yBpmNiBGhFwHf4EXKroGACEngerXfK/Hsk3yuFIWuF
 KNjA==
X-Gm-Message-State: AC+VfDzVMC6OCKYy/GWBhe2H5GW0i0kwTaKUwYYh9ezU+QuyhLoikT9r
 ssu+DfMU10ay5xtshcIm1gAGUbwOqNILYS4kCBICkA==
X-Received: by 2002:a05:600c:22da:b0:3fb:31b:d516 with SMTP id
 26-20020a05600c22da00b003fb031bd516mr7612148wmg.29.1688378757576; 
 Mon, 03 Jul 2023 03:05:57 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 34/37] crypto: Remove AES_shifts, AES_ishifts
Date: Mon,  3 Jul 2023 12:05:17 +0200
Message-Id: <20230703100520.68224-35-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hcQGR5E4zf1E

These arrays are no longer used, replaced by AES_SH_*, AES_ISH_*.

Acked-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/crypto/aes.h |  4 ----
 crypto/aes.c         | 14 --------------
 2 files changed, 18 deletions(-)

diff --git a/include/crypto/aes.h b/include/crypto/aes.h
index 24b073d569..aa8b54065d 100644
--- a/include/crypto/aes.h
+++ b/include/crypto/aes.h
@@ -30,10 +30,6 @@ void AES_decrypt(const unsigned char *in, unsigned char *out,
 extern const uint8_t AES_sbox[256];
 extern const uint8_t AES_isbox[256];
 
-/* AES ShiftRows and InvShiftRows */
-extern const uint8_t AES_shifts[16];
-extern const uint8_t AES_ishifts[16];
-
 /* AES MixColumns, for use with rot32. */
 extern const uint32_t AES_mc_rot[256];
 
diff --git a/crypto/aes.c b/crypto/aes.c
index c765f11c1e..00e16d3f92 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -114,23 +114,9 @@ const uint8_t AES_isbox[256] = {
 /* AES ShiftRows, for complete unrolling. */
 #define AES_SH(X)   (((X) * 5) & 15)
 
-const uint8_t AES_shifts[16] = {
-    AES_SH(0x0), AES_SH(0x1), AES_SH(0x2), AES_SH(0x3),
-    AES_SH(0x4), AES_SH(0x5), AES_SH(0x6), AES_SH(0x7),
-    AES_SH(0x8), AES_SH(0x9), AES_SH(0xA), AES_SH(0xB),
-    AES_SH(0xC), AES_SH(0xD), AES_SH(0xE), AES_SH(0xF),
-};
-
 /* AES InvShiftRows, for complete unrolling. */
 #define AES_ISH(X)  (((X) * 13) & 15)
 
-const uint8_t AES_ishifts[16] = {
-    AES_ISH(0x0), AES_ISH(0x1), AES_ISH(0x2), AES_ISH(0x3),
-    AES_ISH(0x4), AES_ISH(0x5), AES_ISH(0x6), AES_ISH(0x7),
-    AES_ISH(0x8), AES_ISH(0x9), AES_ISH(0xA), AES_ISH(0xB),
-    AES_ISH(0xC), AES_ISH(0xD), AES_ISH(0xE), AES_ISH(0xF),
-};
-
 /*
  * MixColumns lookup table, for use with rot32.
  */
-- 
2.34.1

