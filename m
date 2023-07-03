Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2172004ejy;
        Mon, 3 Jul 2023 03:09:06 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7LgD6RUN4ZAuTF2lmaFN3kXWtOmfAbIOr+g7iycFLK3d9FcS2y+g6NqZHU9n5jHanfZtKi
X-Received: by 2002:a05:622a:48d:b0:400:797e:d694 with SMTP id p13-20020a05622a048d00b00400797ed694mr14735978qtx.11.1688378945801;
        Mon, 03 Jul 2023 03:09:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688378945; cv=none;
        d=google.com; s=arc-20160816;
        b=DwYFXfr2kqwavYHTlJ92xabMwKrpJ303hK1gSFCQnFI7/2PMDIQGwGMN+ErjAOS86C
         J6+maIv3vTzkMLQVXfiLFZq23v8xXVq0m+yRPj8sY3SdnmLLIKLzj5wT/nxX0JW3XGof
         /dZ2MeGN5tNODbhNau4Ao5NJyOpVt7gZev4rkofswHruv1JKZ330VJ35doO11SOQzEIE
         tWQy+OkTd4KBJ12xLyBA03HYTvSxg+OB8U+Gu30ZFEdp3p3CVEcBzJaBRtsNvPXNO89K
         g0Bvad2ca44aY1tsAucKz8Q5Zfyp7UCO86z4CiFhE4XqYtkzjZ2HY+8kwz1oxlx4HvgI
         Dfew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=D0I8unuNO+OjgsLA/5Ao4N4ndudI6wjx6PBNe+Du5WM=;
        fh=DiqGMcF5+wJ0/Fe6a4a0YfMDHaiC5n3qovds/BNTPmI=;
        b=yTt1IgMLnfE3Wh4H/ncG1ptXto9NQBkPMCoGe2h2us1l2p9gcpewJoXTtb2xt70NGu
         In4OTZqCndl2xyqAc3GzVQ6JxfW4u74Jv5ffTMJ8wdKDiOSf++Pin8I3KmB9QTPWa3L1
         orsKulIiGEfDuAZzK7PR92ntSzod+NdgZVhV0+KHCXrAIE/tarcjh4/9N0oMCy+hbRaO
         f8/5SvsqhZEBoahSIGl6gayDGt42ysN8L7GezjyWcf8plLdcAPvupReL+b4iybftmqex
         Auu0fK9SLLpJjYF8U/8+NW6qdEXS4soL3aRvP/15WSEYfONclQp5uZ6orrlPkPNqW2Gp
         SDxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sSkSvHAz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2-20020ac85982000000b0040350a1d664si2926466qte.105.2023.07.03.03.09.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 03:09:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sSkSvHAz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qGGSG-0003np-3w; Mon, 03 Jul 2023 06:06:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRh-00038s-Cx
 for qemu-devel@nongnu.org; Mon, 03 Jul 2023 06:06:13 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRQ-0005z1-VO
 for qemu-devel@nongnu.org; Mon, 03 Jul 2023 06:06:13 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fbc59de0e2so39707455e9.3
 for <qemu-devel@nongnu.org>; Mon, 03 Jul 2023 03:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378755; x=1690970755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D0I8unuNO+OjgsLA/5Ao4N4ndudI6wjx6PBNe+Du5WM=;
 b=sSkSvHAzE6szy2s/YZKLXOrmV/DNOM/hfJliwDO20+aCK5yfPlQuvJIK4Ny/+DSezF
 lGthRG6DVgO6RJDs1l6J6D/txgyszoFL7D/IRwPP9GZiNg9vb2+/B5vLNbG0ci2Rqk/u
 CoSAlCGp8IwCzYiMp6CI6CsNm9wBojnqcFq0rPtrs1AstbZYBp/8ZK/W+g+7J9weBxUz
 UZ6wM4yre1SkNLH+gJVD/jlEKHqS3iLWQKEyEXbe4PhtIAVuQ4gcHLb2AhsA7Zuu4fcB
 gUX1A2XvacoPC5FHFKQnpS2+chQysOE2lofnOAzOzkQ8D6nBnxmKgNzzkZX/rCeUCWAQ
 BtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378755; x=1690970755;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=D0I8unuNO+OjgsLA/5Ao4N4ndudI6wjx6PBNe+Du5WM=;
 b=c53fKrD1dPgh1iHqm071WV4noin9+lAEmBzvfTpuYENsE71kpWlCQIQf8ukQQ7of9E
 j28+FjRxxzV5q2JEthkduBM7OZEVLCzt0OQGJHZnybgqctmkDyuc4me8hMsv4KFJ7o1W
 SiWMUkE5hWQHgkdMAB/pS2X/M4kqzFikVKvXQPtAZquVRzBXbPyzdFNgCf9nvAoHYKm0
 Aag9YvwsIqhnRRMBUh0BZu5Dm6fMaGnV8liWW+IFvXqMmQ20cGLJyBky41PkvO2gEgXp
 hpZfOztfRU7RiA/zuRKCDqDIbIRSLat/HB7yiTxlwdt0uIJUjuVRpzjZAKpIKEcNDf3H
 JXEA==
X-Gm-Message-State: ABy/qLbqAyglBo5M1ykhqQGVA4CfXD5WJaXjJy8mfjNoglpTowp4YPYb
 ZNvnVZdiwD0Lq666t91PLMT7MvRVdVt9d1hJmUBcOQ==
X-Received: by 2002:a1c:7207:0:b0:3fb:d1db:545c with SMTP id
 n7-20020a1c7207000000b003fbd1db545cmr4893277wmc.21.1688378755590; 
 Mon, 03 Jul 2023 03:05:55 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 32/37] target/riscv: Use aesenc_SB_SR_MC_AK
Date: Mon,  3 Jul 2023 12:05:15 +0200
Message-Id: <20230703100520.68224-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: X8s2DKMu5t2B

This implements the AES64ESM instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index 505166ce5a..c036fe8632 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -198,7 +198,12 @@ static inline target_ulong aes64_operation(target_ulong rs1, target_ulong rs2,
 
 target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
 {
-    return aes64_operation(rs1, rs2, true, true);
+    AESState t;
+
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = rs2;
+    aesenc_SB_SR_MC_AK(&t, &t, &aes_zero, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
-- 
2.34.1

