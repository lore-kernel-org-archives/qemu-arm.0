Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3565ejb;
        Tue, 6 Jun 2023 21:40:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ZqeOK01RcHSaQat0Blz48Youee/JoMYNUtdT2dV1U2JxMy9v8wHX+OgPDCf3D7ujvcFfG
X-Received: by 2002:a05:6358:e81a:b0:129:c0a0:7d71 with SMTP id gi26-20020a056358e81a00b00129c0a07d71mr462633rwb.9.1686112803309;
        Tue, 06 Jun 2023 21:40:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686112803; cv=none;
        d=google.com; s=arc-20160816;
        b=kLl+ARLASCuqZQeg1cdnvksEspMb4lSW1ybE8Xt3TCTx8uC3gapYJn0pBNqa7ZwQ+E
         zFsJDN88PSN4C5tl3Jc1wURIoFJivPD7L6doUNTjT58gn/GhAtQiOkyc7SKCBftIgA5R
         WvLZSaQmPrKg39R6A7ke6jIxbyyTtpFFLPnioT1PpmLv/qVmmExTZ0yG1LUc6ytAfUlv
         B+AhcRSMyaz+ysTJCW8OmGsvWMSS0IWaECu0THj0cTC4oouR+0pSILgNhxJf/7gsv/7b
         5R05DPKN8hqZPg9ZDtpso9E9k72W8zv+r+XNJaMQnq7Ls/6O2bsY77+tUXS3fXjaRmmS
         a5ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=0L58gY+8M52l/1Aexz152I08e22x9DnBUyGlz9ruyYM=;
        b=itY4MMtC3mNSnx4UOIc2uQmUP2bJFe3lRQTtbj6uA5I/65hS+cTh2KZQ+EHmZ4Diaa
         BFEKgAHwSsojV0o8SpoC2D873TbusaZobpB2dZ6bG57oTbWMK1UKCRXK8HcrNgGT0UBS
         p2eDW3jCpCgVjcO1XsNdcp341FDfBpk0CaaJB46lUrpmQKwS74r34mDgDsJb8hy8Xxl0
         bNAxX1TkM7pwcCGYGba/ORpuNe3BvDlC5817GiAfExNGMELs2L5+709v/F+aPMUh02Kh
         Fak/rCHjFSUyGtaOtkZmGtfFJb3xe/Yk8HsZcEVbzO0gLxbe3DsYGhtoQk6hnttBaxTC
         9NIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=5jay=b3=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=5JAy=B3=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=5JAy=B3=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org. [150.107.74.76])
        by mx.google.com with ESMTPS id i8-20020a639d08000000b0053b86623b3asi8265578pgd.577.2023.06.06.21.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 21:40:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=5jay=b3=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) client-ip=150.107.74.76;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=5jay=b3=kaod.org=clg@ozlabs.org designates 150.107.74.76 as permitted sender) smtp.mailfrom="SRS0=5JAy=B3=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4QbZQ92GLKz4x48;
	Wed,  7 Jun 2023 14:40:01 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QbZQ50Qgnz4x3y;
	Wed,  7 Jun 2023 14:39:56 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Steven Lee <steven_lee@aspeedtech.com>,
	qemu-stable@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PATCH v2 01/12] aspeed/hace: Initialize g_autofree pointer
Date: Wed,  7 Jun 2023 06:39:32 +0200
Message-Id: <20230607043943.1837186-2-clg@kaod.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607043943.1837186-1-clg@kaod.org>
References: <20230607043943.1837186-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7t27KljgcM4f

As mentioned in docs/devel/style.rst "Automatic memory deallocation":

* Variables declared with g_auto* MUST always be initialized,
  otherwise the cleanup function will use uninitialized stack memory

This avoids QEMU to coredump when running the "hash test" command
under Zephyr.

Cc: Steven Lee <steven_lee@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>
Cc: qemu-stable@nongnu.org
Fixes: c5475b3f9a ("hw: Model ASPEED's Hash and Crypto Engine")
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-Id: <20230421131547.2177449-1-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_hace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 12a761f1f55d..b07506ec04ef 100644
--- a/hw/misc/aspeed_hace.c
+++ b/hw/misc/aspeed_hace.c
@@ -189,7 +189,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
                               bool acc_mode)
 {
     struct iovec iov[ASPEED_HACE_MAX_SG];
-    g_autofree uint8_t *digest_buf;
+    g_autofree uint8_t *digest_buf = NULL;
     size_t digest_len = 0;
     int niov = 0;
     int i;
-- 
2.40.1
