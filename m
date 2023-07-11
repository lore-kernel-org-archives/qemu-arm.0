Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp2041276eje;
        Tue, 11 Jul 2023 10:03:18 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFwKwLv3hl9N3g4MZUpRdpsM2Bpt29imwTSl7o3lZ0KndqrZnd08MCJysKWziO3hpMcAxNs
X-Received: by 2002:ac8:7d49:0:b0:403:b474:7b2c with SMTP id h9-20020ac87d49000000b00403b4747b2cmr5344382qtb.23.1689094998021;
        Tue, 11 Jul 2023 10:03:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689094997; cv=none;
        d=google.com; s=arc-20160816;
        b=Tj0IMzRWUVljtyDFIJq7o7tQHk5e2LhfFTOo/+VDoCTa6R82xbLeZlrgRg6Feifr7X
         lcQZ//zsetbYBGFP4NB6hHLNBpOP+Kz1qYvG0g5WAksr71SxMTho7JmpMM0kScy+yK7N
         s8n6SkKKtHsbofVDPE7kJxH6utIpHMU6naCtPxRiykGeQ+9CdvoHagyC4Dvw2+qeE3Wk
         Hn7YNrs4Bz4k04zWDEnkKlD7K9nK22T5pFiPXIGHWATVA//M6akNqlKm0Nqk6+cPeSaJ
         vzC+AFnLbRw1+DtGeuwzB/2g4Ti4684NHLcy14nQCDqBC1gRj9rSsUrAQeci43tHQAsP
         c0Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1oZkJQHplNAwH2l91ru6TjT43Lp7+mYRxhkqeBvjMeE=;
        fh=SBbgPDDOXmzM9hrsLCjiK7w/SncHURaPmx5au+cvDDM=;
        b=gT5FKxL/spcTjPqu2i7cYLc/qGsUV+fFrPKhKhwacRfrl4kvDqYw33hjWWkii3cLu+
         d2hKw41TKYVdl+tWvHzeddKKC8dn3AK+WW8tCx2980T9LcxYEi45C9CzNQO8La4gF62i
         b1UiY1+pySOOqRbeBRYeOLLO5HHLay4MuHdqyCpceb6F+fYtJcVyiNiXFro7a3Omheun
         6Nsxdl7mcqkRN4s67o88VzrUF7CBk0BryULj12Z58wwiwnbOKA1lhLvVd7LVx4euD90r
         vTrnNZ3NHMdzQl9264Pp+YRgA+2K46Nzutw4ckBawa5TaW22fxhTzFx9MU5a7tJdRD49
         AdPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=kEl1JFeM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t10-20020a05622a180a00b004034c415f93si1073710qtc.124.2023.07.11.10.03.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jul 2023 10:03:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=kEl1JFeM;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qJGl4-0004gz-P2; Tue, 11 Jul 2023 13:02:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qJGjw-0003yk-49
 for qemu-devel@nongnu.org; Tue, 11 Jul 2023 13:01:30 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qJGju-0001N3-MN
 for qemu-devel@nongnu.org; Tue, 11 Jul 2023 13:01:27 -0400
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-55be1ce1669so3037084a12.1
 for <qemu-devel@nongnu.org>; Tue, 11 Jul 2023 10:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1689094885; x=1691686885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1oZkJQHplNAwH2l91ru6TjT43Lp7+mYRxhkqeBvjMeE=;
 b=kEl1JFeMm7RGmr4ukiUPTXcW1KPBW+XprAjv4agfVO74rKbVlbUh3qKfgvT1FXvjoF
 4p3B+s4mPfhFHSe3m4yQeMR8sQjtul9yIAgpYfJuPqxk7lYhiwmivABRSLVoLPPrxQbc
 CmONXiKOGLsiAOOGE/5zuxApESMG4e+lilmPMg9QRH9wCnPfUhkJAXSv76rnPVD69Lxp
 ola4w3CRdWTQhQjWqIodupyraS904xE+F1gUuv5J15DX6UAfOQVUJHrmYjb5XQ2Vqrtr
 MHcKIvPDr5Uy6Umgipwzl6C9T0yA/SwmKOKpxCeK3oOd+PVUTp2MGLicG2iCVhLO6G2V
 4ePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689094885; x=1691686885;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1oZkJQHplNAwH2l91ru6TjT43Lp7+mYRxhkqeBvjMeE=;
 b=IXIuTTSZMp1wBy9+WbfMUFpdAQhuw97A5HIjDR3qAlVvM6ZOq7OQB2gfuI59hZGl7R
 ZPvEBbbl+NwqEzNspleeFBJRVUQS53Ot0Kj0yles+SlsP5gadiVQWjvGPXBf9hkC7PXE
 KJe0HdhIV7R4u5MqfZ2vGXGvWp7seBZjOEmMOuMWaED62X3vTQ54QG6DHoSNUgke6hkl
 ahfHyAILzpKw8rppY9AVhdZg023BO9sBbziJALZhRbLKcMpMXIb8oQkrKiEonnqxhTuX
 HYxHLKayjWBZy/I1fOp62MEguLN47xRPpMD04eALDdJxszyYhU5Z69a1Vwoir/jqbZe/
 rkKg==
X-Gm-Message-State: ABy/qLangsmSKwAGeGQJBsuryP1cW3UeN/N+ADb7MrwgQR70M0xCXm6P
 CwXhBjC5YX+kgFmkvnrptDrXr+6bv4rfRVtpyO0BTpscp2h/RwxUxOKeC9CyYFA99c36Uq7f5oz
 6dcPxJkLWWurGvPYN2Kq/ay3akIj4RhpJ/i1ZZHJlsU2ne7Kh4levpI2IqKPEkEsu7kJW89gifY
 5foFQ=
X-Received: by 2002:a17:90a:6fe1:b0:265:8184:5903 with SMTP id
 e88-20020a17090a6fe100b0026581845903mr10043581pjk.40.1689094884969; 
 Tue, 11 Jul 2023 10:01:24 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 gw10-20020a17090b0a4a00b00262fc84b931sm8381793pjb.44.2023.07.11.10.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 10:01:24 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, alistair23@gmail.com,
 Max Chou <max.chou@sifive.com>, Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v8 13/15] crypto: Create sm4_subword
Date: Wed, 12 Jul 2023 00:59:12 +0800
Message-Id: <20230711165917.2629866-14-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230711165917.2629866-1-max.chou@sifive.com>
References: <20230711165917.2629866-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x52d.google.com
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
X-TUID: pvbJPcVumdrb

Allows sharing of sm4_subword between different targets.

Signed-off-by: Max Chou <max.chou@sifive.com>
Reviewed-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Max Chou <max.chou@sifive.com>
---
 include/crypto/sm4.h           |  8 ++++++++
 target/arm/tcg/crypto_helper.c | 10 ++--------
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/crypto/sm4.h b/include/crypto/sm4.h
index 9bd3ebc62e8..de8245d8a71 100644
--- a/include/crypto/sm4.h
+++ b/include/crypto/sm4.h
@@ -3,4 +3,12 @@
 
 extern const uint8_t sm4_sbox[256];
 
+static inline uint32_t sm4_subword(uint32_t word)
+{
+    return sm4_sbox[word & 0xff] |
+           sm4_sbox[(word >> 8) & 0xff] << 8 |
+           sm4_sbox[(word >> 16) & 0xff] << 16 |
+           sm4_sbox[(word >> 24) & 0xff] << 24;
+}
+
 #endif
diff --git a/target/arm/tcg/crypto_helper.c b/target/arm/tcg/crypto_helper.c
index fdd70abbfd6..7cadd61e124 100644
--- a/target/arm/tcg/crypto_helper.c
+++ b/target/arm/tcg/crypto_helper.c
@@ -614,10 +614,7 @@ static void do_crypto_sm4e(uint64_t *rd, uint64_t *rn, uint64_t *rm)
             CR_ST_WORD(d, (i + 3) % 4) ^
             CR_ST_WORD(n, i);
 
-        t = sm4_sbox[t & 0xff] |
-            sm4_sbox[(t >> 8) & 0xff] << 8 |
-            sm4_sbox[(t >> 16) & 0xff] << 16 |
-            sm4_sbox[(t >> 24) & 0xff] << 24;
+        t = sm4_subword(t);
 
         CR_ST_WORD(d, i) ^= t ^ rol32(t, 2) ^ rol32(t, 10) ^ rol32(t, 18) ^
                             rol32(t, 24);
@@ -651,10 +648,7 @@ static void do_crypto_sm4ekey(uint64_t *rd, uint64_t *rn, uint64_t *rm)
             CR_ST_WORD(d, (i + 3) % 4) ^
             CR_ST_WORD(m, i);
 
-        t = sm4_sbox[t & 0xff] |
-            sm4_sbox[(t >> 8) & 0xff] << 8 |
-            sm4_sbox[(t >> 16) & 0xff] << 16 |
-            sm4_sbox[(t >> 24) & 0xff] << 24;
+        t = sm4_subword(t);
 
         CR_ST_WORD(d, i) ^= t ^ rol32(t, 13) ^ rol32(t, 23);
     }
-- 
2.34.1

