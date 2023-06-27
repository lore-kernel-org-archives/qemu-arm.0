Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1563276ejx;
        Tue, 27 Jun 2023 10:48:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4zFyL+X6WLh2P+GAjnNIk55NLQ44zL0TrLE4Ux9Y4UJ3eJcpZjdVuSLqSWuNKsKddOLsvl
X-Received: by 2002:a05:620a:390b:b0:75d:5803:a20 with SMTP id qr11-20020a05620a390b00b0075d58030a20mr33133448qkn.68.1687888101997;
        Tue, 27 Jun 2023 10:48:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687888101; cv=none;
        d=google.com; s=arc-20160816;
        b=QrtW03W7vWoyDbIp/kCUFsIApUS1lYMlZUZsrhMcIMcfYNw75jsdUhUWeahyULNkob
         8RRPBqLx8JfZdvlxwgjRX4Uy4dDusz+jKjhuPYHDGzkhlU3XneHS7gUDOoWnK4zCrUK4
         6SHeTBh3wBAaOFgx4fPyKWIL8wpEOpnKD6hRHpavA8O9eQy42pXGN1kcacwqxaEnIdq2
         j4lYwLUydmN3bsPgVEv59gx2BJ5Lo0lCI4J3KzDDivkIJO7Mc+UTAYZdzdAFLLHhsC1k
         PVgMQUvCvvjcn8mIljX30R3XNxeKltt4HLBPxBn8Qcb0hPL4RZhmODVLTg8s2Aeum0tK
         WI8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b2i4C//+f+GUGaLVpvFtKlZSxEtNqEo8pMI1bJM7rlM=;
        fh=6pETNHevKwoing44h7EK2Ef6f1U7DoWxuVtZgM4xFIs=;
        b=FT8IWSTolEt+PE68PPimL8fWbhaAb+ZUeCXw5egtFFwktxstSyyskEriiz2UqhDzuQ
         Qi/3QwiCeOPlyBLwSAsKC1zGgzYS+pIYKWH+vpwaClCb1pRpMjitIt8yqu2GB3CPVOhN
         XGNl6UYkbm9naEwa8GBePTraB2vkD+PnR68G7UQYKZZ0qeEC7R0MNraZxfnfuTYovgdj
         bR7OC+6l/PHdi/zguLQxw5jvTP/iCzwDvESSLPdQ7AQnJY3W+ACj14m0Axxh5fy1ZWZK
         X1T1FJORVxtJy9I+u4AdLbzKuq2LVNNxopefN000aNGArfyAeFWXqX2JMLh+6qdwvCCb
         7+zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=LLyYLfLJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020a05620a28c400b00767157573d8si821976qkp.81.2023.06.27.10.48.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Jun 2023 10:48:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=LLyYLfLJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qECmU-0002Zy-5P; Tue, 27 Jun 2023 13:47:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qECmR-0002Or-Po
 for qemu-arm@nongnu.org; Tue, 27 Jun 2023 13:47:07 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.chou@sifive.com>)
 id 1qECmQ-00057M-4O
 for qemu-arm@nongnu.org; Tue, 27 Jun 2023 13:47:07 -0400
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-55b1238a013so407398a12.3
 for <qemu-arm@nongnu.org>; Tue, 27 Jun 2023 10:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1687888024; x=1690480024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b2i4C//+f+GUGaLVpvFtKlZSxEtNqEo8pMI1bJM7rlM=;
 b=LLyYLfLJGYgdidSaHgczV3dEKRkHsusJcz7Gvif6E6WlutYo9bwxwuWSJReSPkd3in
 uBTC3niyMOT8IAeVcGhmIAqj55VAOf/RgGT7JmglgLV9oyYIDTdi50vPTZUN22KUoKmF
 R7cZUg5dsoxXcPz4dkOxPO5hG3OVU9pgnuH71nhopSRuGTnIqbeoys8TpIPeTuOetpd7
 LND3Wtgrvy300tY9qOToeQ+TNscPXb8tSemfPj0/iBM3iYr3FayiUDmbJBbBYIDzGWYl
 YVJmk/dtbXykM60JPaPikuglpnkOD2GOkRux4Kq++iUKRGCvMlUVPBOruwKZUd7cg1zZ
 IJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687888024; x=1690480024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b2i4C//+f+GUGaLVpvFtKlZSxEtNqEo8pMI1bJM7rlM=;
 b=LVST+g8Iz+b0tz+sDzUyDEeMkr1yUaDGnrfy7l0lGUhL/LJGU131mvwSzBHe95rt/W
 FDPUKCakOMF/yu6iDlHlzXawAonCPoxsTsbPV8fC/LIDC/hA5q7Ke4OywQrhEwFymJG5
 Nkzgb29tHa5hvukXxHERQCeXw5u2Ic/GRrrsv/Ckl67tylwkcVDcN4/M1uAL4XfXSvRt
 jpd4rAPR0jtzQMvWU2ChDiL7OorrCxt07qlH0LJUBTQ5zLaAvQ7B+A01iCK+QWZqgPe2
 efp4DdDYrsvGv0MEWFC+pziRGeG3P0h9mbiluDdSvoyC9R2Nph9i9sF3rtvsfBH7+K5+
 aLyQ==
X-Gm-Message-State: AC+VfDz0YfcbyaxWNdjUEAD04jhH6UbyeW0Xr503SZXTVTASV3/xBfMF
 LwXu8/tzONBQbWMgEYEtDKS1Vw==
X-Received: by 2002:a05:6a20:430c:b0:11d:2b0c:7f32 with SMTP id
 h12-20020a056a20430c00b0011d2b0c7f32mr41607143pzk.13.1687888024602; 
 Tue, 27 Jun 2023 10:47:04 -0700 (PDT)
Received: from MaxdeMBP.localdomain (125-228-20-175.hinet-ip.hinet.net.
 [125.228.20.175]) by smtp.gmail.com with ESMTPSA id
 i9-20020aa78b49000000b00666e883757fsm5705144pfd.123.2023.06.27.10.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 10:47:04 -0700 (PDT)
From: Max Chou <max.chou@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: dbarboza@ventanamicro.com, Max Chou <max.chou@sifive.com>,
 Frank Chang <frank.chang@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Subject: [PATCH v6 13/15] crypto: Create sm4_subword
Date: Wed, 28 Jun 2023 01:45:47 +0800
Message-Id: <20230627174551.65498-14-max.chou@sifive.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20230627174551.65498-1-max.chou@sifive.com>
References: <20230627174551.65498-1-max.chou@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=max.chou@sifive.com; helo=mail-pg1-x536.google.com
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
X-TUID: bWL8QiaCU1Uc

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

