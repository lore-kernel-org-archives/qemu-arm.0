Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2172977ejy;
        Mon, 3 Jul 2023 03:11:10 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEIohaL4kFkIYrvVcvm96zEOP6/4ffIZL5QZWmaoXXsEILKVIoZM7Qfb1/CAJhA+y+1Ecyz
X-Received: by 2002:ad4:5c6f:0:b0:62f:e1e4:8085 with SMTP id i15-20020ad45c6f000000b0062fe1e48085mr11858744qvh.57.1688379069948;
        Mon, 03 Jul 2023 03:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688379069; cv=none;
        d=google.com; s=arc-20160816;
        b=OnFxzNFHUPiw0G43R+N8Y/SWpugaLK2nL7E2NG5iH78RRB9Ll9p8HmxaR2kOy3J8+9
         l+dxxiMQN8Be6/BI9M8XaWDna28S82rLofzJzJ/KaeV9h9Osue6v6NtzFTkuDlQ1lq23
         hORFhq/5FjRFmBgLf10nEDOTAWOmU/WMu94GpCGJjf43OhX25gbwKIEJl4P61Me32Bgc
         Mohx/5Ol3Qo3IXEmWLvMFBBzNhN63fnN0iB2oc+VDb9cve9QWeqii2huz5IbdnZHbldx
         FrYFEl6ufSrtLVBNnlgz3ziNsKhwad+nE9Eqq/jIuA1r0QaDGqAv9lb6k2F+30eLm+dv
         FkvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4pOjdTU6VTsEkj/YPCvRrXcIKg2xairdxfu8316FBss=;
        fh=DiqGMcF5+wJ0/Fe6a4a0YfMDHaiC5n3qovds/BNTPmI=;
        b=yTDkjbByKL/iZdURCXkvz0BG2ApAtH1BOLpnA3cZFW6Y4D31Wf/qMtKx+ctzdthHYN
         5dsxYGcI4OZKASunZ+8OjY8rdWsSSvjxcspQzFWca1aao+Q2tan1ewxjMxXSmODBHyL4
         iokJMMYpr0JceZ0n43LAFrivWffnPphoEsl4NRn87enODjr8HXAZwBD6nOmzqK3+oqen
         nvbTYh5ACQWav7KFiZawllnFEgwiXVO5e0VTbqNCfgQUg2RjoAyNhfIHFY8rTOzcssrr
         bW3tiwvLApeZZBBn8RR6gs/766NZu52O4GjCol9ZzQDj5KeqKZkcUWRvbSF+KHMfD3l+
         aLPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rI/m2BJO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020a05621420e100b006370654dafbsi120437qvk.443.2023.07.03.03.11.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 03:11:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="rI/m2BJO";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGGSD-0003jq-Qi; Mon, 03 Jul 2023 06:06:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRg-000386-T9
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:12 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRQ-0005yS-0X
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:12 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3142a9ff6d8so2413164f8f.3
 for <qemu-arm@nongnu.org>; Mon, 03 Jul 2023 03:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378754; x=1690970754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pOjdTU6VTsEkj/YPCvRrXcIKg2xairdxfu8316FBss=;
 b=rI/m2BJO7QZr34SY2mUpl0eW4eEQE5b4/CL+OIifeNDRskpqLmaZ7rcMwPvdL2oJEH
 1dDEI31s4astHoq7h0lej5E0Uc4Kjd76+nctHh5zio0v+yBKJCzUApvnT/t4HzNVCmqj
 p/fSyHjdPRiMEVx/ZeJ8byu9Kv5IfZvkfQwRH5bwaH0PPbUnzd79uaAqgpAVz1FJFr+3
 ngDIhN53WLXMZOTbITVUdYMtAC4NltnNPVmfjYnF2oD4CtN9H5nz6JF0BBE4c2jJaATU
 dGOFI+d4chfoYLduou/hj+tpota/dryegtsKf7pm4j8JgWaNDCmt1ewWgpOYx+hFLlNd
 kDfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378754; x=1690970754;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4pOjdTU6VTsEkj/YPCvRrXcIKg2xairdxfu8316FBss=;
 b=RJV8iddzrV0W2dV48YrZya4ADXjoUhs1EeVO88VRlWI8HnQoVUY6VIOPAXkcM/KnfM
 310CjaBcJ1bLNGfv8pMYmvdW9f8MRytlKi3umzpJhR2WSHdsUDXLZe1gUa0uQF/QwmxD
 bl/F+RG6eM+tKSPbRNiUMcyKe5oOeeUg7rxOINnJlT4t8EUXMxUCZ2Ed9XcZiX6eOrDK
 m2iEF6Gg74gP9Ggvt5OBCqH+FC9/Ydc1LXkNI03/GfUQtm0vooCIyc67OFGWxpkISKes
 2/FPilDMRgUJHy4ufL3of3W4uqDYtfQhrDWeZ06ePLBFtoziNcRscllBC4K7LE+j8avX
 hiMw==
X-Gm-Message-State: ABy/qLaW+OO4bo/y5sCfLgoySGXkaxMlE3eJ108L+Vz1DzHgFp3KP7yb
 A4dNws8ZI7fGsHwNaWeXtsRu5A==
X-Received: by 2002:adf:f20d:0:b0:313:f429:f6e9 with SMTP id
 p13-20020adff20d000000b00313f429f6e9mr7672124wro.60.1688378754667; 
 Mon, 03 Jul 2023 03:05:54 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 31/37] target/riscv: Use aesdec_IMC
Date: Mon,  3 Jul 2023 12:05:14 +0200
Message-Id: <20230703100520.68224-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x432.google.com
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
X-TUID: hdRb+oZvBcM2

This implements the AES64IM instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index e61f7fe1e5..505166ce5a 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -272,17 +272,12 @@ target_ulong HELPER(aes64ks1i)(target_ulong rs1, target_ulong rnum)
 
 target_ulong HELPER(aes64im)(target_ulong rs1)
 {
-    uint64_t RS1 = rs1;
-    uint32_t col_0 = RS1 & 0xFFFFFFFF;
-    uint32_t col_1 = RS1 >> 32;
-    target_ulong result;
+    AESState t;
 
-    col_0 = AES_INVMIXCOLUMN(col_0);
-    col_1 = AES_INVMIXCOLUMN(col_1);
-
-    result = ((uint64_t)col_1 << 32) | col_0;
-
-    return result;
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = 0;
+    aesdec_IMC(&t, &t, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(sm4ed)(target_ulong rs1, target_ulong rs2,
-- 
2.34.1

