Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp890882ejt;
        Thu, 15 Jun 2023 10:35:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5gWhy/GWyQnLGOP8KfWpNiPmdLEAdGCiIy1k+8/I8h0h7d07HOFPzVSxwP22wPOyuuOaKx
X-Received: by 2002:a05:6a20:6a10:b0:10a:dd79:65bd with SMTP id p16-20020a056a206a1000b0010add7965bdmr6995932pzk.27.1686850546124;
        Thu, 15 Jun 2023 10:35:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686850546; cv=none;
        d=google.com; s=arc-20160816;
        b=Jr2qevDNISOcCM12sn3K2BAs9BGDuAeXY0UB9lMEd0zTQycTzUCvwMZPlypCsgudEQ
         9DDOc7DJt6VEp2Xjz2zX6xTm+TkQVXD0FjFy6a/96efyZ49TS/wcuIhgvJrzvw6rHM6N
         iUXSX0d5AxnFMS0GCk5bEqSlrRGLIpK9grBpiCv+dix6UmuQbUHO6HqkJGyez89HODX1
         5p4PEyJHjp2Uj9SuKiKahn2sP1te7dbKRB/OjWDMpvXIA524/5QYRUhzVlF7JV9cNmYY
         lQvNkPLnnBBlbsGK9TFElgNF0x0IztzpnpRE9GVULlW8zVkFDG3XnQmXPlXlxB9jRy+v
         bY2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=5NZQZYSrkWL01PTGVhgoTKAK9RCWNtqSzPiUaqiOjCU=;
        b=zg5H4Kq+VhrrYwjgpUY2oYxY/DghJp2T91GvE719W8ikMyoNK63HvoqvtaIsxIgH3F
         Vo+brpKXWC3JyZVzJT+KrQjW3nlwyRaRyFhqkbZTCdidhsjDBBf/04OFH/vFp9HW/OyF
         5vc+bcSPti6viwIbuNLrY5NYuRpR24WscOpZHz+A7AOqWp0LGh4/cQA0oRacvdZZ1s2L
         rf63dtUrORRFtYPEGzTVSSA+EN5Sq5QXIcq4iJ9GMzMOx61b/ydoqnz/7WbeqmefvcGr
         a6DG3hOZr+mkB6p0yHkUZkzphkBGCZ+pUu0dzyziuhi7hsNrXJ1LlIFlocgtUR9NZw74
         Uxvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=xcjj=cd=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=xCJj=CD=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=xCJj=CD=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id n127-20020a632785000000b0053592294fc0si11343441pgn.256.2023.06.15.10.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jun 2023 10:35:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=xcjj=cd=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=xcjj=cd=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=xCJj=CD=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4QhqFX1TqSz4x0K;
	Fri, 16 Jun 2023 03:35:44 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QhqFQ0pTXz4x08;
	Fri, 16 Jun 2023 03:35:37 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Joel Stanley <joel@jms.id.au>,
	qemu-stable@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>
Subject: [PULL 2/6] aspeed/hace: Initialize g_autofree pointer
Date: Thu, 15 Jun 2023 19:35:21 +0200
Message-Id: <20230615173525.428831-3-clg@kaod.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230615173525.428831-1-clg@kaod.org>
References: <20230615173525.428831-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: XtyHOyuzdEug

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
Reviewed-by: Joel Stanley <joel@jms.id.au>
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
