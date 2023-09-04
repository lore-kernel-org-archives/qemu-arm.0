Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1446133ejb;
        Mon, 4 Sep 2023 09:17:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFUjcx9WT3E1kbwJeOJWOFOryt2/d95+fhKZ2N8Kmq0UDFxKQY08IXuOQPfl6kcg1oVY90
X-Received: by 2002:a67:f04f:0:b0:44d:506c:b9c5 with SMTP id q15-20020a67f04f000000b0044d506cb9c5mr9846742vsm.12.1693844232158;
        Mon, 04 Sep 2023 09:17:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693844232; cv=none;
        d=google.com; s=arc-20160816;
        b=j+SzX3swtqAEWjv+hcvxw5+nI+tnK8BOy3CtjeQpWHFJd58Gq9LC0BZ4zYAqwEHfRd
         IRtgTWauavUlQ5/2vnjJrxkjJqLtJMqcLN446D8bv9bFfWRBA96b5N1CIRistQW55JHz
         AJAnQGi8j10tjPvGqe4tE6ZBXHPARazZOEN5Ey4LYeX08twikSz3mFsjKkVSNk4/vMo4
         u1XWM3jn39ZXS0/xBFSFyjK8dw9/IlYhuuYuglcaHE3Nf5IYS6J4TP6bl611ZLj57Gqq
         ceTszhV+i5aLq81lNxBDVeSlPp/qoTJ6QqergbHj0mkKSq/nDtv+ssLQFCUw5esYblfA
         /r1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Xxe/gfQOqcpGIg7mgqqlKfLWKMuZRnXp4Q7SG5q4uJI=;
        fh=9YiTiOGNmleaUv1UpLaCouZ6Bol5UK2wIzrKmb3D32A=;
        b=MTSlAjuSX2vGxBKIGUKLaLzv9sJk4mVAud4SYMTozfbR0+o5pbrXDYZ51H/CMRtZaa
         4+q0kK0xRKQ2ZnHBkjyMHTKEQWe2H0rzvrRZDDXT0n1PD+T5UHr3X3/jfgckz9XJS8ef
         Z1fpq/8ClMRJOfqEvz2B3iDa8znKMfTdYO6nou1JSzPElaAxlybYJZYCiZsvW4mt/Ivy
         D/snQMV/3x8axvPaiU2+C4VZteYvGt5xB3QzVf52Mt811FQMw/Dl0KkVcQOoUvOj7haT
         4Wzj7A11FJihpZXH0B9Wn+7JDDKSddkHMsZdAFBpjOU6KFDRqH9dOgdxFcXsOkW3E/kC
         q2dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E4V1MaLh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u8-20020a0cb408000000b0064f9020d19dsi6355156qve.254.2023.09.04.09.17.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 09:17:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E4V1MaLh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdCDP-0004Xo-3N; Mon, 04 Sep 2023 12:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCDN-0004SD-7p
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:14:13 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qdCDK-0007i7-DC
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 12:14:12 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9a1de3417acso541022966b.0
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 09:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693844048; x=1694448848; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xxe/gfQOqcpGIg7mgqqlKfLWKMuZRnXp4Q7SG5q4uJI=;
 b=E4V1MaLhlicau1XVWJQjozb5oq1xn1JP8IVn78t3Ao+2LIhvNObyz3WO2FoDYCo9Vy
 QtOtjq2zqfJO524R1quleO1QKWAzSfS07Ui9qRbBqWHsCwRLrysiHYUgXcCeRR7ep42Y
 uLkhBBzjewaiH6IOGs0jzXoTNJURmlfBGeS/v6qzQllJi0Fh6WrK1H3znI3krCEuYc6W
 fLgrZKELwa1NPAy4d0AzCZ2uOo0k+pNkkHwy4B4HBOxx6h5pmfSyC2EfgYnbEzs32eqs
 mO3A74JziLRi+paZ9bDBTg0kBQMRNrNxi5SfnzEyDQjq3r/9td5Xa8U/uei7C6knYe+m
 KSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693844048; x=1694448848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xxe/gfQOqcpGIg7mgqqlKfLWKMuZRnXp4Q7SG5q4uJI=;
 b=LloNt8W95AyHCKenkpPYyu9BDpz0U4ZlthBvU9et1VvcmGIkUNGpsPNfD1asiJyDiL
 OqppvAB81fyDd/nDy1wRuRnW0twZiC2PETuclQvlI3smtRYMiWRr0EBjmvXIOjf9h584
 Uy1XnX1t/zJWj2t8u9vQ85rdOePOuSYFLd6jY99GzB7qAzzkdoiI4cCihrH9JDIwsNxI
 ZTQy2SLPPikGsBk+Q4ylvejQINnNuGZy622ReqFKy0ZNWa+5rRuzFB2hiVoIYlREOFU3
 7EYKFz0/ThFZw2XVfx4nDFLsOuShTEEOn6FG5HZy6YqZPyybBX6i3IsieKk0EgNu/WKT
 kZ4w==
X-Gm-Message-State: AOJu0YxTRIbPFSD724+ehR/JNJXRNOV5Dz3fDbag7oIDQ34p/7IdIMgi
 2s2YSBnQaqbT6LLZ3nhwTugs3w==
X-Received: by 2002:a17:907:7202:b0:9a2:25da:d71e with SMTP id
 dr2-20020a170907720200b009a225dad71emr14241419ejc.0.1693844048790; 
 Mon, 04 Sep 2023 09:14:08 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a170906951700b0099d0a8ccb5fsm6384460ejx.152.2023.09.04.09.14.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 04 Sep 2023 09:14:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 16/22] crypto/cipher-gnutls.c: Clean up local variable
 shadowing
Date: Mon,  4 Sep 2023 18:12:28 +0200
Message-ID: <20230904161235.84651-17-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904161235.84651-1-philmd@linaro.org>
References: <20230904161235.84651-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x629.google.com
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
X-TUID: IVgiR7ZvXiaR

Fix:

  In file included from crypto/cipher.c:140:
  crypto/cipher-gnutls.c.inc: In function ‘qcrypto_gnutls_cipher_encrypt’:
  crypto/cipher-gnutls.c.inc:116:17: warning: declaration of ‘err’ shadows a previous local [-Wshadow=compatible-local]
    116 |             int err = gnutls_cipher_init(&handle, ctx->galg, &gkey, NULL);
        |                 ^~~
  crypto/cipher-gnutls.c.inc:94:9: note: shadowed declaration is here
     94 |     int err;
        |         ^~~
       ---

  crypto/cipher-gnutls.c.inc: In function ‘qcrypto_gnutls_cipher_decrypt’:
  crypto/cipher-gnutls.c.inc:177:17: warning: declaration of ‘err’ shadows a previous local [-Wshadow=compatible-local]
    177 |             int err = gnutls_cipher_init(&handle, ctx->galg, &gkey, NULL);
        |                 ^~~
  crypto/cipher-gnutls.c.inc:154:9: note: shadowed declaration is here
    154 |     int err;
        |         ^~~

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 crypto/cipher-gnutls.c.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/crypto/cipher-gnutls.c.inc b/crypto/cipher-gnutls.c.inc
index 501e4e07a5..d3e231c13c 100644
--- a/crypto/cipher-gnutls.c.inc
+++ b/crypto/cipher-gnutls.c.inc
@@ -113,7 +113,7 @@ qcrypto_gnutls_cipher_encrypt(QCryptoCipher *cipher,
         while (len) {
             gnutls_cipher_hd_t handle;
             gnutls_datum_t gkey = { (unsigned char *)ctx->key, ctx->nkey };
-            int err = gnutls_cipher_init(&handle, ctx->galg, &gkey, NULL);
+            err = gnutls_cipher_init(&handle, ctx->galg, &gkey, NULL);
             if (err != 0) {
                 error_setg(errp, "Cannot initialize cipher: %s",
                            gnutls_strerror(err));
@@ -174,7 +174,7 @@ qcrypto_gnutls_cipher_decrypt(QCryptoCipher *cipher,
         while (len) {
             gnutls_cipher_hd_t handle;
             gnutls_datum_t gkey = { (unsigned char *)ctx->key, ctx->nkey };
-            int err = gnutls_cipher_init(&handle, ctx->galg, &gkey, NULL);
+            err = gnutls_cipher_init(&handle, ctx->galg, &gkey, NULL);
             if (err != 0) {
                 error_setg(errp, "Cannot initialize cipher: %s",
                            gnutls_strerror(err));
-- 
2.41.0

