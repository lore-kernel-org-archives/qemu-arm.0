Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp2540417ejb;
        Tue, 24 Oct 2023 23:54:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZVQH/gt2sdMjaQ1DojVEOLH4wheGmVqbuFqHMVOejVI5hx9scAUK1fklK0CpUzTbMTO/u
X-Received: by 2002:a05:6214:404:b0:626:f3d:9e46 with SMTP id z4-20020a056214040400b006260f3d9e46mr16395366qvx.18.1698216875138;
        Tue, 24 Oct 2023 23:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698216875; cv=none;
        d=google.com; s=arc-20160816;
        b=mS0gAcqGGhXKFVJdK4LteulYxwxLFCZmwOklivTKiPqmtLG9Fc0sustLQ8gsaAlxVQ
         oliVhHgoqQoXdrGVPYBtc24HtKL0U/A0V7vQffzwhzeOfwS2pFbo4ypQfHCokR6eggea
         vSDgXjPD0OnmjeFatWoypVX8gYDJI2aD4RBkyJuULF+wvoqBdlfVkbEsK7qDvJo9ui5P
         d4xqtvT1evm09A9IO+p0ai4nFgmsvoifWQ6rYZBEpsOKctDCKVN5K0NA0gsqXmy9gfLn
         lgxdBEP2y9I8Ls0aeLoULxvm3s3cNeCaiJnChItLzPNswejv9PddQ/0FI+PGkYCDo6uE
         4CVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=p0NCUL+cpRhXf2m5J3/0i62r4P+oaEOwVGx0UuDtmlk=;
        fh=n9hkg/orx2gM+AV33ad3gQn9ZjOshYWW80eCE0h3VO8=;
        b=jiWC0GyHTHlw5FxY1X1+XvGxTo6KYY4kNlxX7z1washlBt0Ik2+qS5PIX7JBn5bMKr
         9VXwNTspibiFsP26zPrJGMVaNAoNA7p3N5j5Wp5oSW+BIn1Ne8kryI9OznFETbcnc2pt
         s/IwJiJ0VJ98frD1hvp98WoCBNKlK2uYgPLvfREbGNm72/hFsKDttH2nJVXBYMqtpOjL
         Q+i1ZxGaJMCXw4zGDTMSsjOM5+k9q76znKoW3q/UwOydvAXwbp/0R0NbVwoMtLmfMk1o
         4ydHca9xcmAkPRIqBFO7jR44St7ZinB+nd271N4jYlCBJNJn9Iu/6eDuX1Dcr0qjRDbT
         tJpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K4qZpJIk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ma12-20020a0562145b0c00b0063d00dc9c52si8577480qvb.471.2023.10.24.23.54.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Oct 2023 23:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K4qZpJIk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvXm3-0008OK-DJ; Wed, 25 Oct 2023 02:53:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXlt-0008GS-SG
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 02:53:43 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qvXls-0006vl-Cw
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 02:53:41 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4084de32db5so44892445e9.0
 for <qemu-arm@nongnu.org>; Tue, 24 Oct 2023 23:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698216819; x=1698821619; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p0NCUL+cpRhXf2m5J3/0i62r4P+oaEOwVGx0UuDtmlk=;
 b=K4qZpJIkre7sXUTA+wl7lGh+6C9etY8ekwFXKAypBKnOB25WTtJFXK4DO4MWEbNAPU
 UYpscmJgDstOGxxFNfRGoM6F6fzkiunWzFMHbRnao8X141g6eFsD35BUuKk5SA1mMbIV
 Zi4EOBrKOUuFH8Y9ENVz+hvCTGD8spr9ix6Vhxgruuyq4oCnA9E9dtrU/IUzjZiGsvNP
 /DAlTX/cEqZVfp8o75kDIHnYqfHuH72vpwDBXPPQFjQMTOZam/FAm2kP6KDBHVGyldoo
 dR4TIdOU4NjMELtrS73/2RFNqOyJoaQ9Fh1QyhAKt+iIXrjtDvSMd4wn1qT/ct8LTm29
 K9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698216819; x=1698821619;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p0NCUL+cpRhXf2m5J3/0i62r4P+oaEOwVGx0UuDtmlk=;
 b=ctw5ukx5vdPyJx8L8Cndre4s1TrReSJ7X2C2Ms1yzm07VgqwjYf+juZOANpnJeXT0E
 ygRUR94+rhL8GtA2GR/tq7eOaYY9/Uvt7gQW2zs6OKwz5tBY2UvtCOqDeyhYGXTAOy5A
 miIgpnB69LYxspOdHpziHvgyzabjpY2xeuq7Dbm+Z5qIYBtGXKcFfVEcrlKGtuH1mqvp
 6PqxH5lvPfU+bFQ6DWjnxP8qh4qjj54/za9MnUSDijyzOJUOHs7C7mc1Pj1rUjoaBB+7
 32BoP2Ut3J8STYK8S0xveR/NyUGUoHb8BxxGwgASxsN/AHbtFLVNiY5Busau0NNsp0N2
 e4FQ==
X-Gm-Message-State: AOJu0Yyg0xoggxqz6FPbEFSWCyRQjxKHDJ3HhNVldcYlj0kIF4pMq56S
 p7fguG/AusfMEzSIRciEJ72P2g==
X-Received: by 2002:a05:600c:4f86:b0:408:f9ce:56c5 with SMTP id
 n6-20020a05600c4f8600b00408f9ce56c5mr7535464wmq.24.1698216818884; 
 Tue, 24 Oct 2023 23:53:38 -0700 (PDT)
Received: from m1x-phil.lan (ghy59-h01-176-171-219-76.dsl.sta.abo.bbox.fr.
 [176.171.219.76]) by smtp.gmail.com with ESMTPSA id
 v19-20020a05600c471300b00405959bbf4fsm13936071wmo.19.2023.10.24.23.53.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 24 Oct 2023 23:53:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH 03/10] hw/arm/allwinner-r40: Remove 'hw/arm/boot.h' from header
Date: Wed, 25 Oct 2023 08:53:09 +0200
Message-ID: <20231025065316.56817-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231025065316.56817-1-philmd@linaro.org>
References: <20231025065316.56817-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: tAg91mB6YNyN

"hw/arm/boot.h" is only required on the source file.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/allwinner-r40.h | 1 -
 hw/arm/bananapi_m2u.c          | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/arm/allwinner-r40.h b/include/hw/arm/allwinner-r40.h
index 72710d3edc..6e1ac9d4c1 100644
--- a/include/hw/arm/allwinner-r40.h
+++ b/include/hw/arm/allwinner-r40.h
@@ -21,7 +21,6 @@
 #define HW_ARM_ALLWINNER_R40_H
 
 #include "qom/object.h"
-#include "hw/arm/boot.h"
 #include "hw/timer/allwinner-a10-pit.h"
 #include "hw/intc/arm_gic.h"
 #include "hw/sd/allwinner-sdhost.h"
diff --git a/hw/arm/bananapi_m2u.c b/hw/arm/bananapi_m2u.c
index 74121d8966..a7c7a9f96d 100644
--- a/hw/arm/bananapi_m2u.c
+++ b/hw/arm/bananapi_m2u.c
@@ -26,6 +26,7 @@
 #include "hw/i2c/i2c.h"
 #include "hw/qdev-properties.h"
 #include "hw/arm/allwinner-r40.h"
+#include "hw/arm/boot.h"
 
 static struct arm_boot_info bpim2u_binfo;
 
-- 
2.41.0

