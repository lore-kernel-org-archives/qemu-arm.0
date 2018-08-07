Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3916676wru;
        Tue, 7 Aug 2018 00:59:07 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcJyISVJ+ZIGzCGTFlYWrn9/8IrJmGxCfOEI6PqPMLPu2rvi2axVOTxej7LwDx71X6iMF2O
X-Received: by 2002:a37:6812:: with SMTP id d18-v6mr15989964qkc.215.1533628747621;
        Tue, 07 Aug 2018 00:59:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533628747; cv=none;
        d=google.com; s=arc-20160816;
        b=osrheEubHiFnuV5BPH8ywKkNgfJXhmfuvXd+l/6dnyK2bl2D5hnGluADkIT7QQCJQc
         zi0hbPNfArYJm1MIjBnhBNtH6ZeX3rlTqQpSiBxewOa7vWcNAlmx41lV9EEtHW121EJc
         NmB1z/vukW/FYwJvLGYpd6o+3gr4QmsXQ7chOkMLt/iStggujyftljPFUSZVSrHbqu9C
         7MIgFSbIEn5d1g4HTp1rZPbuUOztagQB6cql2nd0jhqRwc6YQaMNFv5EpE6++zBRKyWK
         Q3Kd6LjKRBmWZJ+xMFUdMZ2ARnv3Fb6zyFvB1jL8N4HrYMQrgXhAaCyqEAXQQjC5MMcv
         H41g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=EllvPOZEw1edECiX0N9er7aLKQoz9Nd8QHRRtVYO/4I=;
        b=T2vr+6nnr9ztHtod46G4R3tSwYAY8WkxfZZvpX9/CgemJlfcra/AVCLSXjs78jurm0
         M+HcZj3tZGMLTQOV6soVHQcDOg8POMXwIFTkPOo/OKuZf1fbIwBJDeoaeuw64k01Sdmp
         nbecGpJE5x07HfPdDpBiKFRruYb9tTkihqVE8dq7jo4aTutKYkV8tlqzyPxywoa87eGm
         VoCNABA07+OGaQ+ucco9ti+pnqdtBjllLf5qoncITF8mpw+PBwiZmZ1onDBuxpC+myor
         OGTkEqOZq5DUzXYgLVBRNNPNDpzMAThVDiNnHcTurEjKGAyyjKV3/DIXVMqa7cv5j9A9
         atbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PBgjlK9t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v13-v6si644576qvh.147.2018.08.07.00.59.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Aug 2018 00:59:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PBgjlK9t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37804 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmwtX-0002yR-3v
	for alex.bennee@linaro.org; Tue, 07 Aug 2018 03:59:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fmwt9-0002qu-Ek
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 03:58:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fmwt8-0005cK-MR
	for qemu-arm@nongnu.org; Tue, 07 Aug 2018 03:58:43 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:41901)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fmwt8-0005cC-Fg; Tue, 07 Aug 2018 03:58:42 -0400
Received: by mail-pg1-x541.google.com with SMTP id z8-v6so7449794pgu.8;
	Tue, 07 Aug 2018 00:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EllvPOZEw1edECiX0N9er7aLKQoz9Nd8QHRRtVYO/4I=;
	b=PBgjlK9tEXncFLetaov1pBs837YkSAhe6YcyF6pG/SDh07cuRtsu8tEdyn7HFYvvJJ
	FDCc+AHzHRS9/mm0JLn2eiD3wbTgTbZQ4bIUuQAHZbADnv4sBsgFajyPbq+0AArKCzIH
	5xXJYDbydHZljKfZfhXyNwoGdRL5w3RkqvaWNgLVtjde8WA86riBcFRkrFLXQ26XKXxe
	wuWRgG1PzW24jxtVO2gkl98eFJipUe7G2AILvo6zcejjfZkDSexjDrEtcN1oMjx10YvU
	4WRTsmEVy3Hh90NHHRuxrXNvYGZ7nSJTctmGsw5WWB04Bklsvspulan/7Ie9NnCGkiEp
	ImIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=EllvPOZEw1edECiX0N9er7aLKQoz9Nd8QHRRtVYO/4I=;
	b=tIWL/+9F81WtUfzg+zOpr0jwPgAhOnTJuhUWorB3XyImayGqRTOb9/EeAYjUAj54SZ
	+wZaPoFfN1ciTnkoJnfrAnYhumyh4c80qrG1R4qkHm4Y91nZUbKg4oBfFjxjWRFupK69
	IrAZ9sCmLttNwR+C18lcVEB4dYFVi9XBNJ1TaKpxGjHO1zOUf2lJgABDHKWvJ5+tt7VS
	Zn2d8iLmjjrZuAX7a6DZ0oSzsY0gyPDM+/7VGQb+QBuJ6kOXPdfnSCi29uNOBN4qgpj8
	7odZ6Cm8r6mEDQmcP+ZgmoCcH/WzMrfp9z5+RZ/p2CtL2lNK8p5M22+Z9uF2qvg5dl6Z
	rycg==
X-Gm-Message-State: AOUpUlGDfT3TILd4er5Re7lXFfUHABjSGfOEGaJUvZJ5kyEz60gNxvwh
	kz20yjGMU13SNGEEDf5DEF0Az9RM
X-Received: by 2002:a62:225d:: with SMTP id
	i90-v6mr20373221pfi.246.1533628721376; 
	Tue, 07 Aug 2018 00:58:41 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	d191-v6sm1459491pfg.172.2018.08.07.00.58.37
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 Aug 2018 00:58:40 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Tue, 07 Aug 2018 17:28:34 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Tue,  7 Aug 2018 17:27:55 +0930
Message-Id: <20180807075757.7242-6-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180807075757.7242-1-joel@jms.id.au>
References: <20180807075757.7242-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH 5/7] aspeed_sdmc: Handle ECC training
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A8IjCAYFD7OS

This is required to ensure u-boot SDRAM training completes.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/aspeed_sdmc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 522e01ef8c0d..89de3138aff0 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -27,6 +27,10 @@
 #define R_STATUS1         (0x60 / 4)
 #define   PHY_BUSY_STATE      BIT(0)
 
+#define R_ECC_TEST_CTRL   (0x70 / 4)
+#define   ECC_TEST_FINISHED   BIT(12)
+#define   ECC_TEST_FAIL       BIT(13)
+
 /*
  * Configuration register Ox4 (for Aspeed AST2400 SOC)
  *
@@ -148,6 +152,11 @@ static void aspeed_sdmc_write(void *opaque, hwaddr addr, uint64_t data,
             /* Will never return 'busy' */
             data &= ~PHY_BUSY_STATE;
             break;
+        case R_ECC_TEST_CTRL:
+            /* Always done, always happy */
+            data |= ECC_TEST_FINISHED;
+            data &= ~ECC_TEST_FAIL;
+            break;
         default:
             break;
         }
-- 
2.17.1

