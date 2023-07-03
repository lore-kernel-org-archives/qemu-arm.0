Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2172088ejy;
        Mon, 3 Jul 2023 03:09:15 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4R6gIu8TRaw6vRa7BmSpNbDwXVxZdBfq48V+Dm4uIve/h/SCAmu53t+T4OgLdbv4MkwNzR
X-Received: by 2002:a05:622a:294:b0:3f5:3f0f:3744 with SMTP id z20-20020a05622a029400b003f53f0f3744mr13779108qtw.52.1688378955127;
        Mon, 03 Jul 2023 03:09:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688378955; cv=none;
        d=google.com; s=arc-20160816;
        b=B+zl1MHcpAZQt6mD1FnNHcPeUYX0qNi2/qIbMTpxQ16ttFAStmuKJ3y8M2FOiOOoib
         PXuKKdAiHx3WrF8m0KHli3mvj5UZSiT9Ac4WRO0LRzn6qaOHnS5ZIlK+PigIYuwCV1kQ
         XQtdiOh2Voy8v+9AjIk8nTflxjVha0Y44OyOyM3kXZ2HTTv/eR0p63S3+k4fwwUo5Ztx
         GG682RobZHauRqJTrDzMsHe3ukkeGdfxjXDbFBtkzd4j5Iqu57LVI5cJF5aEU0WWOYwx
         CuPlM8oa7ZTARXZ45Hnsp1PNxyBpysYDyskGBXvel//gXlPPiiq1MesMbpbL46/bBi2/
         5zjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QRqjQC8v/J/3z0IiE+GLS9BAOlnmnUcZezvum6TPI3k=;
        fh=DiqGMcF5+wJ0/Fe6a4a0YfMDHaiC5n3qovds/BNTPmI=;
        b=BFt2yr7xbLf6mbfM/+IggEsjADaPgYvEjf4bmzo7kU0WVKhbyLeTd6S3lnvq5NwPuB
         hvg73dUHA1WZ83GZDETRFHPTJlC82+nN+uZvlyXZ0E9j4J/6pSjaueR8wPii4O2ZtVg6
         JbP1Uq/sLxZ7RTzwH2I6Jl3qAa37fdE4uh+ARnKX8yHA5R+winWhSIfLffid3PgbE+Wx
         pY5bIj+lIyHnb6RpaXkfryNrjed91Ro4zv3+09P7W9XMy/YGDQyUaLLoNd7L56IVLZEH
         zR/GtYfYNwtispGxkNJsQKQZzrRQrunTOXC92yPtM/Hm+1quedW1ySuCeD7ZeJB8DVtv
         I/LA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CyHtq4Su;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g21-20020ac87d15000000b00403361f4563si6319262qtb.340.2023.07.03.03.09.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Jul 2023 03:09:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CyHtq4Su;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qGGSF-0003mH-52; Mon, 03 Jul 2023 06:06:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRg-000385-OV
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:12 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qGGRP-0005xu-5z
 for qemu-arm@nongnu.org; Mon, 03 Jul 2023 06:06:12 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fbc5d5746cso44951875e9.2
 for <qemu-arm@nongnu.org>; Mon, 03 Jul 2023 03:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688378753; x=1690970753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QRqjQC8v/J/3z0IiE+GLS9BAOlnmnUcZezvum6TPI3k=;
 b=CyHtq4SuWKPtI0enq0XMRv9MmHffCsVArxB+WqMcFwOePyiyBKr7+ngSf1TchOnl7X
 LAqaN0+c+/DRVoHb/6FWoHCUqhtI3erVZ1zldHnSwOtPJogJOPn5n/SvLV02nvYRQAup
 eqk3dr/aeKoIAZ24Fc17rnpqo4Fm7LdzbbPTVaVobK4ChNXqmfe8mv5z2PSZdQPGGnrs
 mnnOIodGxXKI0z4TkWpUBARUaAN+osWtHDhiVZblyUDzRyWWzZBzizm1q6leYKPtXV/4
 RuUv+bV0wvN93xyfNrL7D3vRlQg6UjO4dAQViMJA/6+vDLith9OlnljFy3HrvZOJ5d6c
 38Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688378753; x=1690970753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QRqjQC8v/J/3z0IiE+GLS9BAOlnmnUcZezvum6TPI3k=;
 b=gz9sg+P3+XEcCf6h7FQwXIXCB9iipMfw5HSf9SMundLWLk8AHAVht0MdPJ+u95p2p4
 Lt1iELYfrOAzWTOeEPbOTxpvwQjAsH+qY9A5YL+JKdgGKNziYV6vU52B8+EJSYl21RMP
 zoROKmbgMwn1EiM9OchNi+UYbV99+CWb9TaAyG5Iq6dqceYdKLQtsFxl67zsdOHE+d2T
 hWMDUNGI5QSi9SQGSauuxb53LkNiy5AvounOU4mXr3fDfZ2Z0FhYZm3sLVZvvpC0SncZ
 BFIeOJFUHsTeXgcXULiXWT09XJZ6zTXV46ZYqjgpdj3IgStBhFBTHCSriFdtAWSM9Oef
 yf7g==
X-Gm-Message-State: ABy/qLYWUUgeCMhbHIJHG1wgfyGWj8uINrM4FHrkp41j2eD/6kWZkYvg
 EFpHdzrZdkrTdp06UngEKHo+6Q==
X-Received: by 2002:a5d:54c1:0:b0:314:3b78:da77 with SMTP id
 x1-20020a5d54c1000000b003143b78da77mr430121wrv.29.1688378753715; 
 Mon, 03 Jul 2023 03:05:53 -0700 (PDT)
Received: from stoup.home (91.232.79.188.dynamic.jazztel.es. [188.79.232.91])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a05600001c500b00313f7b077fesm18446562wrx.59.2023.07.03.03.05.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 03:05:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com,
 eduardo@habkost.net, alistair.francis@wdc.com, danielhb413@gmail.com
Subject: [PATCH v4 30/37] target/riscv: Use aesdec_ISB_ISR_AK
Date: Mon,  3 Jul 2023 12:05:13 +0200
Message-Id: <20230703100520.68224-31-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230703100520.68224-1-richard.henderson@linaro.org>
References: <20230703100520.68224-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: bNmcrOh5D8cn

This implements the AES64DS instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index b072fed3e2..e61f7fe1e5 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -213,7 +213,12 @@ target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
 
 target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
 {
-    return aes64_operation(rs1, rs2, false, false);
+    AESState t;
+
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = rs2;
+    aesdec_ISB_ISR_AK(&t, &t, &aes_zero, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(aes64dsm)(target_ulong rs1, target_ulong rs2)
-- 
2.34.1

