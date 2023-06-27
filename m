Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1556038ejx;
        Tue, 27 Jun 2023 10:30:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ62RlL9LlTqGKjALq3CbsqYT4rqVG2bNqEMSsTZzKz0Sd4TMVv1Zi4tDT739FgHlK0plBXF
X-Received: by 2002:a05:620a:4013:b0:765:3d01:558f with SMTP id h19-20020a05620a401300b007653d01558fmr20510001qko.30.1687887032465;
        Tue, 27 Jun 2023 10:30:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687887032; cv=none;
        d=google.com; s=arc-20160816;
        b=WkgALP1Zx5pajbd8dQmuSEIUJgUCGGOSPKHqWwmyNyRweZbhFr3yDMDuMvm5h9c6NW
         Gd7PZ0EZo4wpFk5XhPe1ChqNApzEXV5NbydTAg3fjQNCzwGJwtv92ccW8/68uB0oDj77
         yPbWD7WtOaylQJ6Tm3g/y5XfWzhAhPCjZjLmMsaypO3CGuBMbBirM+kjKKA0xtRzN7Aq
         kIwxe1wCmiNj3zqVU0jFpM5HTQDRCIJ0v3qe+Yqq+Oo+f5H/eC68KihcEb5JFNsACCbs
         GCV8LolpTGtjKMAjgs4gcrRMLSqUOuQO5EI5YaF/o44f6ZRkPBgTq/Hq9cWVlBWpaz0l
         RGcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b2i4C//+f+GUGaLVpvFtKlZSxEtNqEo8pMI1bJM7rlM=;
        fh=6pETNHevKwoing44h7EK2Ef6f1U7DoWxuVtZgM4xFIs=;
        b=lhLYF93TPbiuhOysSEkiy0ZgZ5dhYL0SAS3arbDqsqPf60Z+jvX3osoAHqHgOGn15/
         RuXcgEHg7dOFC58lQPb9yFCy23xxI/gszZ6hHLU/POiqzEQ/IdqQbg8ldxyj/7ZU4Wm+
         tJ9NeaXG0qq8Iapo9+Zk3kBUIPc6PazKJmEb5a9ie1cmW6laK4O2YXykhZn6pKAq17+H
         LUI40Tr8S92i3de7q7ssWtEzBaCOvJ8tz2hAOSRwniS3jmE+qz9J5Q9e2BqBSGUcK5fr
         Qk61ACP2TKjlSXr+a07uKEBoWV1J7tYZnyBIuBMGqIusHKIKEtTfko9YhjT5OuSkiyWN
         zJ+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=Dyteo4u3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id sw11-20020a05620a4bcb00b0075cce2d5099si2133814qkn.375.2023.06.27.10.30.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Jun 2023 10:30:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=Dyteo4u3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qECVu-0000Uu-7W; Tue, 27 Jun 2023 13:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qECVp-0000SL-F2
 for qemu-devel@nongnu.org; Tue, 27 Jun 2023 13:29:59 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qECVn-0000dd-DJ
 for qemu-devel@nongnu.org; Tue, 27 Jun 2023 13:29:57 -0400
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-553b2979fceso1695323a12.3
 for <qemu-devel@nongnu.org>; Tue, 27 Jun 2023 10:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687886994; x=1690478994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b2i4C//+f+GUGaLVpvFtKlZSxEtNqEo8pMI1bJM7rlM=;
 b=Dyteo4u3j8oPLV9emsNA2k2lAwFKTTEbtFbJJHf6sFKKOM3jo/pGnWTfx8yx6qHcAi
 /++5Xh33n8uEVLFgqgE3YjfaZdgo+kPrlQ6hNI3zsQUK1hy/oGBq/cYkg1Iwm38xPP2f
 SiBqZCSVHRsWSOh2jiVDsVzC3LUV2AryKUKjrukyg08beh/8xdM7v51KPhjx2OCItuQ9
 jW0dTO73hdvAcUy2P5fz3iA6w98vdGi0biD17wkOELVYM3Gz/4qWKbZPms0S41YEKSxz
 F5eFE0bZP3lRHtaVyX6RucN2c6xIMv2UwQ6BIarnGY3urJuxsAJ8/O0H3N0Jv2tQ/ITD
 kK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687886994; x=1690478994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b2i4C//+f+GUGaLVpvFtKlZSxEtNqEo8pMI1bJM7rlM=;
 b=dB5C8A/ZMFkYJEgye3CZblvNQAsWcAr9mww+abADF7H6gmpt0Y2zwiA6/LjXsL636G
 TCcAoEUfiHxm9bPRI7FYSvytETlOvhzh5CeX8Mm6Wr+9SYtpLKTD3540gCic5Xh+eGPT
 ehyGoM0+ICZKfNOq6RhqPkwRnw6az6heJkkJ7u/BIbwIYtNjL8hpg8deQGziOjJ3HYk3
 UGs/+XXwmQCr/KqmrLAul98K72vseQID3Ut0AWLB3faUHsI/HS4xkRAn3keHQRJcIg0h
 JeV8WRGctw9RVgTFw6fKN44wuJ+iGAe8fsHyZl27ar66Cziww32mP6FEQzCE/7jCjxo0
 IHxA==
X-Gm-Message-State: AC+VfDyBMBMgdwM2fc5/rRPTADtjufEv5eZWRR1wt3q8MnxCZLCuP3Ze
 3WlmTtKq4QQ6Y/DXLUl1EsDL0D6Wv2zucES/aMEFIh7Q3bZsCTFDBU9KKPGtKhvazF28Fqc8C/V
 diVPvUBUe923EQyJTE19LFQWKC7HgFMnBtG0TjAyUX/VSimL0RYPRxaJn8ivHkOyQ3J9DcpbqTA
 YL7qs=
X-Received: by 2002:a17:90b:4d8b:b0:262:f449:4492 with SMTP id
 oj11-20020a17090b4d8b00b00262f4494492mr4851093pjb.30.1687886993819; 
 Tue, 27 Jun 2023 10:29:53 -0700 (PDT)
Received: from MaxdeMBP.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 z19-20020a17090ad79300b002631f3d36a1sm1461443pju.36.2023.06.27.10.29.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 10:29:53 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Max Chou <max.chou@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v5 13/15] crypto: Create sm4_subword
Date: Wed, 28 Jun 2023 01:29:03 +0800
Message-Id: <20230627172921.65040-5-max.chou@sifive.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230627172921.65040-1-max.chou@sifive.com>
References: <20230627172921.65040-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x52a.google.com
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
X-TUID: 00qNdS0LVNmP

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
index 9bd3ebc62e..de8245d8a7 100644
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
index fdd70abbfd..7cadd61e12 100644
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
2.31.1

