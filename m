Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp495376ejc;
        Fri, 1 Sep 2023 02:42:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcrQJxs3+8qut27dAGAJ0vz2utEhHnBAmNjdrDOYDXHfXRfEM6JNtR6odeFThrOfaOoCnC
X-Received: by 2002:a17:902:e54c:b0:1bd:a22a:d406 with SMTP id n12-20020a170902e54c00b001bda22ad406mr2420155plf.21.1693561346804;
        Fri, 01 Sep 2023 02:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693561346; cv=none;
        d=google.com; s=arc-20160816;
        b=NwjFXQobLH/dFB9emOzJ5xCrzourb3o6dhU4jQi2ozB/AsMBNj1tbG3Qoov3xvjnOZ
         LEHZe/zuvawdVxAnN7pj5uNVNJFb4T9MbR/NiWExcMWq3Pn1dOVQ2s6zktBwxzCsgm1g
         SqBSQgSf03pOK7YWiq3UEdHIgzQ3ewgNx8AizZca9La6Mea5hkdFLa1nS4ow2CKp3knF
         EUjOaF0OegEridnxBcjwyPofO8TU04MpiaaNe4xdW8SZ08cD/yUUIjyxZZnEJDQXmD4X
         yjlTJVdb3VgOu+xAFcVzSwn/LFa0/54mm0NHNYUQJZxdzE/i17RTXfUZPY4z/gYFhng4
         qTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=PCBSawVSTAElFKVNchaPE4h+CVyhodQmWDQs9T4MSDw=;
        fh=zx2WzN4fa+h13VrTWaWF47GQYxTIpFi98HVeG5gD4pE=;
        b=WWNZMwbJZ1aKbVKhkM1CAVdQIUkcV+0iChsAoUymZ6QuyVEoIJHbrWoomNtQZTwNZo
         z92yZRK+us97xQrxuoVI1erLanpR3RlqEPOnq9BhqTbXDaxl/4Aimy+FRXcR+YeAJhLA
         M/uvNBMbA6e7q5OeHE8fPNKEZV7mTmISs78DwNR7GkvPAECBcHtqZuXH1GbXsGhkxxR0
         BV66gybuEb2OAIfrEESGQeFgBZBOTX4tGFJoxHc7HAS6hRTOHeEKMC5Qnvi1Ga/Xoq7i
         KLD++goe28BS5Z/3uW4MMkabCcLJJ9Q5MkKvdFWWBF21ov9rPzWzPwOQy3JwZyUUKjr/
         7gzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=snxb=er=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=SnXb=ER=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id v7-20020a170903238700b001bb1504b696si2476757plh.4.2023.09.01.02.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Sep 2023 02:42:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=snxb=er=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=snxb=er=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=SnXb=ER=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RcY3M4gZVz4x2b;
	Fri,  1 Sep 2023 19:42:23 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcY3K5sDGz4wxW;
	Fri,  1 Sep 2023 19:42:21 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 01/26] aspeed: Introduce helper for 32-bit hosts limitation
Date: Fri,  1 Sep 2023 11:41:49 +0200
Message-ID: <20230901094214.296918-2-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901094214.296918-1-clg@kaod.org>
References: <20230901094214.296918-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: lVAtqtPQkvvW

On 32-bit hosts, RAM has a 2047 MB limit. Use a macro to define the
default ram size of machines (AST2600 SoC) that can have 2 GB.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 263626abeae1..b922a2c491cc 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -47,6 +47,13 @@ struct AspeedMachineState {
     char *spi_model;
 };
 
+/* On 32-bit hosts, lower RAM to 1G because of the 2047 MB limit */
+#if HOST_LONG_BITS == 32
+#define ASPEED_RAM_SIZE(sz) MIN((sz), 1 * GiB)
+#else
+#define ASPEED_RAM_SIZE(sz) (sz)
+#endif
+
 /* Palmetto hardware value: 0x120CE416 */
 #define PALMETTO_BMC_HW_STRAP1 (                                        \
         SCU_AST2400_HW_STRAP_DRAM_SIZE(DRAM_SIZE_256MB) |               \
@@ -1423,12 +1430,7 @@ static void aspeed_machine_rainier_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
-/* On 32-bit hosts, lower RAM to 1G because of the 2047 MB limit */
-#if HOST_LONG_BITS == 32
-#define FUJI_BMC_RAM_SIZE (1 * GiB)
-#else
-#define FUJI_BMC_RAM_SIZE (2 * GiB)
-#endif
+#define FUJI_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
 
 static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
 {
@@ -1450,12 +1452,7 @@ static void aspeed_machine_fuji_class_init(ObjectClass *oc, void *data)
         aspeed_soc_num_cpus(amc->soc_name);
 };
 
-/* On 32-bit hosts, lower RAM to 1G because of the 2047 MB limit */
-#if HOST_LONG_BITS == 32
-#define BLETCHLEY_BMC_RAM_SIZE (1 * GiB)
-#else
-#define BLETCHLEY_BMC_RAM_SIZE (2 * GiB)
-#endif
+#define BLETCHLEY_BMC_RAM_SIZE ASPEED_RAM_SIZE(2 * GiB)
 
 static void aspeed_machine_bletchley_class_init(ObjectClass *oc, void *data)
 {
-- 
2.41.0
