Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2107671ejc;
        Mon, 9 Jan 2023 01:18:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsi5Si6ZiFdGwE9d5hy5A8Euyi68sko16erQ+YAjUqU4NDWeTo77HuHy3n49ifHUocDyz/M
X-Received: by 2002:a0c:fe42:0:b0:509:9799:16bb with SMTP id u2-20020a0cfe42000000b00509979916bbmr98405614qvs.27.1673255914242;
        Mon, 09 Jan 2023 01:18:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673255914; cv=none;
        d=google.com; s=arc-20160816;
        b=OUJ7Qpw9ipXgxvo8E1c1fAqRfzDnkUpItbbaQiXkW8LWj8aynuN8GKlr9jeoQTJghE
         4XL3jOET6J9gO1wjo1J7nt776WgwwEOQfdQQw7sdF8cQOVsUhEkA01WFtY0wNNFAvOLZ
         XBe6jcUPwLR+vZZfepaAvY+5NzqLB7me1NmbDAtMRNFcWMGCz0BmUhVH/Wr8nLXhrOiO
         DecZSMYBnSzoUySWcKmPPw34WnHha+zpNdn60SqirpUYNYlgcNj1LiEmLZ3HdVBqEiwm
         IhtWt1/SoKjUREsDoIOT7IWYs/dOOhWK4IX4jpeExwSxKOq9o9UB5cyxmoIzgxozIFkq
         H66Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=c2cB7vWK6nvcfVvDDHq7Sg6wZOh1lh47LPsFPMyP2dk=;
        b=E9KRSOWFmrcxzquAF4nibDA6rY6cnTJXOxPsJyDk249A6X56ExBuiK4pyu495StWNK
         wTt0qIVjftp0ravDQUPlMoTl/SbNW77q3zQDL6hMQqSabl+6l2EUumjpsVIi/D0tmoz5
         rQT0oWDqrmky6qFAPt8CNB/PdkcN6zMVvQkZUsC8bzyh1/Vcmxv1H9MJaQn/KltPJaC7
         op4ind1VQLJoLqLXZ+BS1Rxo4eTowLAftJnPbJjv//FW6iOUB9hMvDwLjt0r+fSCB7Dh
         Fjta3wXerwY0PnDDsVCZiS0qzvKQGs00clo2b/iszJUbYqnCdqaotnb/8AzqH9UCPcEa
         JZ1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KLm7kZ8G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15-20020a0562141c0f00b0052fe5539dcasi4289792qvc.203.2023.01.09.01.18.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 01:18:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KLm7kZ8G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEoI8-0000td-ML; Mon, 09 Jan 2023 04:18:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoI7-0000sP-HC
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 04:18:03 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoI5-0002e7-W2
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 04:18:03 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso8478178wms.5
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 01:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c2cB7vWK6nvcfVvDDHq7Sg6wZOh1lh47LPsFPMyP2dk=;
 b=KLm7kZ8G8vE7lZqRcJg9lazSk5ZG4LsYUGNHKLA8tg8KjCpzedTvZq2/KmgK3nFq+j
 9HouMnhOS/r9w5GE6eksHnOnCJbQTQ+HmC75fAVA3SYyCJqxO3Imy3z6pZb/IlI+4mkU
 QL3iRwQn/LVEfCBmMiTOMiERCYiua6jdSzwQvMj311jyD2KZS/e/x8n5pdJxNgcONvyJ
 5BhXwVKQ5Rp4U5ikZXa/jzBiVv1wpiETmTr4a8b52hyy8fbNd8hjP+jNSvJQ7Pzbnrrz
 Aebj3H/v0M5H9ojPKT2s5TrO8xZ51LqfhOyLiag4o3SvgOyqq0evnEXCMdkLolcwj5CD
 qATA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c2cB7vWK6nvcfVvDDHq7Sg6wZOh1lh47LPsFPMyP2dk=;
 b=lZXI7ZQpHY+SzTKKFEcdz0CrieuYaELLoXd4hCFm1RI2AGznFM3jWlGJctGn9Bbdui
 LHkgV1mNg/Jz2knz7EPKxK/qJ1pjzm8hRsEhLkPuYQY5hlZTjWjshRgwWgwv8OvY/aJh
 SrSTAtgjZIscdfK9ZHyC8va2e+mo73yfAyv9vM0bB0N2Po6WtY7BhzT7fpaLQRTaNzfi
 fb3X86gRAvLu6y1XhtZHlSsI8veD/u/o+WjjmyPHoKv9MM4KPdhxJxcbVwGhNJM+1dQ+
 YPpbmh0LhgOzXokZDh9EM8dywL9DAtLIQkRQMU7EqX12HV3evmFuUCNy17//UOjQE2Qc
 AM4Q==
X-Gm-Message-State: AFqh2krBkdFkJFL7NwrAzB8IaoazgynHzLZXqIuq01fnvC/RF/HfV6fb
 nBJQBdI0/sv3Fz4PoTR1zfIqYg==
X-Received: by 2002:a05:600c:798:b0:3d3:5737:3b0f with SMTP id
 z24-20020a05600c079800b003d357373b0fmr55841636wmo.36.1673255880593; 
 Mon, 09 Jan 2023 01:18:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bg23-20020a05600c3c9700b003d1de805de5sm11955431wmb.16.2023.01.09.01.17.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:18:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/5] hw/i2c/versatile_i2c: Drop useless casts from void * to
 pointer
Date: Mon,  9 Jan 2023 10:17:50 +0100
Message-Id: <20230109091754.79499-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109091754.79499-1-philmd@linaro.org>
References: <20230109091754.79499-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ShoFT+e6igL2

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i2c/versatile_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index 3a04ba3969..52a650f45e 100644
--- a/hw/i2c/versatile_i2c.c
+++ b/hw/i2c/versatile_i2c.c
@@ -45,7 +45,7 @@ REG32(CONTROL_CLR, 4)
 static uint64_t versatile_i2c_read(void *opaque, hwaddr offset,
                                    unsigned size)
 {
-    VersatileI2CState *s = (VersatileI2CState *)opaque;
+    VersatileI2CState *s = opaque;
 
     switch (offset) {
     case A_CONTROL_SET:
@@ -60,7 +60,7 @@ static uint64_t versatile_i2c_read(void *opaque, hwaddr offset,
 static void versatile_i2c_write(void *opaque, hwaddr offset,
                                 uint64_t value, unsigned size)
 {
-    VersatileI2CState *s = (VersatileI2CState *)opaque;
+    VersatileI2CState *s = opaque;
 
     switch (offset) {
     case A_CONTROL_SET:
-- 
2.38.1

