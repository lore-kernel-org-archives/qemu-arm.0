Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp1883606ejq;
        Mon, 8 May 2023 00:59:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7yQGVzUL4lk1dv+t3Jkc1qwguITzz3LLal85ELIYOtOf8m81CUE/5qV1SVihk3BC+Xu+SW
X-Received: by 2002:a17:902:bf47:b0:1aa:ebaa:51ce with SMTP id u7-20020a170902bf4700b001aaebaa51cemr8249371pls.14.1683532754447;
        Mon, 08 May 2023 00:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683532754; cv=none;
        d=google.com; s=arc-20160816;
        b=IsjPP0tRoKpjNZFkwKjWxJ/wNvCKTqVX1rHrlQhYcwyFWQsW4/NrlP5FnhNVxQI7Zr
         EVru/d7PXzLviJd1LASzohp+9q7vcBjuFaXH6zRJy7CwiiiRvr/GFiB7xJTnvX1DOMRG
         97kT8AjoCm72Y4Xxmy+Xsg15zSphgJND0rm7hVYfIAQCyqtGYVORwhi4TfXtcoBClkZO
         gPNkLc0ztUQjkZXPoa3C2zX+BNRV5MYIUPzU+ag7evliIEx+M9PS0IenA4Dg8S7qM3CI
         I5UTGVYooEVnVMIumYZHEai000NgqfUn2+VOOvshxEeZkbKuOZHBPWQ489RDETY7sGTS
         Wrcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=1Gdw5XLjOqOc69/CtXRiXgV7ta/i1v3mH7c7mYR21/Y=;
        b=H3gmDtsoVy/jT7q+IfihofOzVfkV7BhbPukiu9xQGw2nvcKVes5JbxziABxMjKsPPR
         7J5v57eX4eJMcmxP+JGc5s3okaY95NGJgIC2TFLzI62z5RBG/tHUF7umFcsFPxvabOQ1
         z4yJ2L+NiPoMkosfwjYh7kTe74UroLoDQT5Qj7F5B07XIPCWnQIyDyAA6OtoaRn8dh6q
         DBT/O5JzSJntJeS55u0pkeOKTfjKoYPhX1CujvDnXPPQoYmucZE6vGDXdknERIcegYEC
         8SpSfFT6MVi12bJbVrIKU2V7ey8gTPWtUH3uLewa99SrOUzqdpdHU9Y+KyiKwkhC/dXR
         bmSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of srs0=5sq4=a5=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=5sq4=A5=kaod.org=clg@ozlabs.org"
Return-Path: <SRS0=5sq4=A5=kaod.org=clg@ozlabs.org>
Received: from gandalf.ozlabs.org (mail.ozlabs.org. [2404:9400:2221:ea00::3])
        by mx.google.com with ESMTPS id u9-20020a17090341c900b001a69fe5f560si7572018ple.444.2023.05.08.00.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 00:59:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of srs0=5sq4=a5=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) client-ip=2404:9400:2221:ea00::3;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of srs0=5sq4=a5=kaod.org=clg@ozlabs.org designates 2404:9400:2221:ea00::3 as permitted sender) smtp.mailfrom="SRS0=5sq4=A5=kaod.org=clg@ozlabs.org"
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4QFDFr3PNnz4x4B;
	Mon,  8 May 2023 17:59:12 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QFDFn29N1z4x48;
	Mon,  8 May 2023 17:59:09 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Steven Lee <steven_lee@aspeedtech.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH 01/12] aspeed/hace: Initialize g_autofree pointer
Date: Mon,  8 May 2023 09:58:48 +0200
Message-Id: <20230508075859.3326566-2-clg@kaod.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230508075859.3326566-1-clg@kaod.org>
References: <20230508075859.3326566-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 82UVCBbAVCrC

As mentioned in docs/devel/style.rst "Automatic memory deallocation":

* Variables declared with g_auto* MUST always be initialized,
  otherwise the cleanup function will use uninitialized stack memory

This avoids QEMU to coredump when running the "hash test" command
under Zephyr.

Cc: Steven Lee <steven_lee@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>
Fixes: c5475b3f9a ("hw: Model ASPEED's Hash and Crypto Engine")
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230421131547.2177449-1-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_hace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
index 12a761f1f5..b07506ec04 100644
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
2.40.0
