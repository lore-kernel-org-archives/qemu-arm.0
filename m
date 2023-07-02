Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp1829578ejy;
        Sun, 2 Jul 2023 08:57:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7fJU7XOXDht4bx/8Y//aL1gP6U7fkiXz7bsEPf/CrxmysvIfEly5n0wwWGj0RfAQ6G9uFE
X-Received: by 2002:a05:6214:e48:b0:623:8494:9945 with SMTP id o8-20020a0562140e4800b0062384949945mr14216687qvc.26.1688313474197;
        Sun, 02 Jul 2023 08:57:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688313474; cv=none;
        d=google.com; s=arc-20160816;
        b=peSWUCWBxdOR//6+Lmc3K0onlmUaPPc7uhOKYY1VqVNE+Tob1rijK9+TYPhjI3b+83
         aQonev7whAWfWV12Y3Ghv6iialQkXZbOTpLZ/mVhql00dAqO2VoF4ZPsBG5nnm5QxfNv
         8I4PfkMyfF4zD+xQufnFB/sk3LjBmzgbFZEAYcC7+gtp25rv9AKGrIDBIQU9O5/Td9/1
         TKdJjruFZRj2n2TxyWWgbC34gALFMbbRXluGTnoteb//93fDMnecNXyyA8FpdsKWTaYC
         gnnq/cixA9/QVkUKSYjg63cF17oMaPPhopD/TkO3KjiOJ68j36F8o1GQd7tyc9NP30c9
         /Y2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DEIqVctPEZTYbzcDe0Hbcq05xA1rg82RA8xn7gYRFBw=;
        fh=6pETNHevKwoing44h7EK2Ef6f1U7DoWxuVtZgM4xFIs=;
        b=P8rykyylMUFLcDbCiS0Oi2tXnQYQ7PSV/cNhXqUEB1X53nF6A7CGA88x59HRzCjVia
         bMOR3Yg1ooryrQJ4RTI1egJ4J1yZf9+8Lv3tg5E9vobmgjdeqSIXOFSsnezeW4mmd0M3
         zFWEZaIY9vC+ux6/Iaeg/77kq/Rl7PnDM7McBRiTikKrIxB9eTAJSFr7yzNbUPVfXHB4
         qsY/QkLKu0Dmvsq6A6eNOB/oOXRklrvpDsP+TH9zY3pk8SnmOdC1AzL1EDKCMQPeBoe6
         y/62U1JNb2Zj7FdFqEAMWz/+mEfln21dxipmyh9BcqFs9MQFEMSLYARVnjQ6BeTkBDvZ
         cnCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=QTxmpJw9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r16-20020a05620a299000b0076224ab1f65si11256231qkp.364.2023.07.02.08.57.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 Jul 2023 08:57:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=QTxmpJw9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qFzQn-00055M-OO; Sun, 02 Jul 2023 11:56:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qFzQF-00043A-Aa
 for qemu-devel@nongnu.org; Sun, 02 Jul 2023 11:55:35 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qFzQD-0000Gc-Hy
 for qemu-devel@nongnu.org; Sun, 02 Jul 2023 11:55:35 -0400
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-668711086f4so2209523b3a.1
 for <qemu-devel@nongnu.org>; Sun, 02 Jul 2023 08:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1688313328; x=1690905328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DEIqVctPEZTYbzcDe0Hbcq05xA1rg82RA8xn7gYRFBw=;
 b=QTxmpJw9M5cu3YaNlWJZaqkAzB8f1Oejcl1mWtsEMyniZr9egiGF5rgKaZMa0YNVEU
 Qx9I9HnwJo8s4oWo+PCFsPa05GRrrDZQmuH2BAf9nnR8mxf2zg0XDpH0xhWI+pabfKvS
 76lYDHzFw4z1Oo4UMLRsp0X+ynzEShVn5M9sMHqlgaQB7sY+hIacSwhf03NbxD//OI8J
 JDjQH1x3Rn1FDEqt5mYFoIVai/1JbtENMDFzy/TYGuAnjsSknKqTeZHpMVPdN4IzR3qY
 n2BvgiFKOY3gsoyg5DTI++CgIk3xBYooL+bHs/Q+JOKN7XLU8GczIoxy2nS5fv34zsuS
 XIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688313328; x=1690905328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DEIqVctPEZTYbzcDe0Hbcq05xA1rg82RA8xn7gYRFBw=;
 b=FsrmpUfKc3iT/Axc8AWb7oKKOcxF+W0Ghvdng5+amPZ/YuW13aUeDWsu8fGg3JsgUu
 pVSs4jatilKRDt8nOJ16/dqcQuZe9rO3vImLrtkfsHkrPyc7UM83+/e57xK4FAp3sA9p
 Wue1tm0LxcrUA8rcdFmual1AYTPHuz5jEajh2Nvq9Rfl2yiEx9MVIyjpo04J1SnJ5pZK
 MjG7QdmccwknRASDbPhl5pxjuhYaAOYAVQ06ttNXXos7ea52vKvItJEfMMOym22A2UJC
 o/A85haYk1F8xGIfJX8JxHCPl2yr3CH2N4trsHEPcFnKJ437QIYDw4mmQ089kkUSU6Ao
 zuGg==
X-Gm-Message-State: ABy/qLbK+bkRoFk3bev5AeyeOvy/pyLlrUYwrbpfazucEaQcdJq9Coqs
 Raa7vAg7di4BPBljCA3EDlQs0fHvxJbzYTAkkJBdWNgsP60F25VYed7QUXh7XIpj3bcTAQHBvzE
 0GHk0I0s/IlPbK+PwzN18KbcQOIjA3z3BB9R0HKZj98YpHqDLSv2r6DkuopkIb1dzJb+e+JB2vl
 HSGEI=
X-Received: by 2002:a05:6a00:2d0f:b0:682:93ce:4825 with SMTP id
 fa15-20020a056a002d0f00b0068293ce4825mr460345pfb.3.1688313327834; 
 Sun, 02 Jul 2023 08:55:27 -0700 (PDT)
Received: from duncan.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 y19-20020aa78553000000b0066f37665a63sm8231969pfn.73.2023.07.02.08.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 08:55:27 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Max Chou <max.chou@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v7 13/15] crypto: Create sm4_subword
Date: Sun,  2 Jul 2023 23:53:47 +0800
Message-Id: <20230702155354.2478495-14-max.chou@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230702155354.2478495-1-max.chou@sifive.com>
References: <20230702155354.2478495-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=max.chou@sifive.com; helo=mail-pf1-x430.google.com
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
X-TUID: 0i1qCltISHxD

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
2.34.1

