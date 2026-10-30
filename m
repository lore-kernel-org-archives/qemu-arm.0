Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030B7606A31A
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=vecf6rY9
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMjMj-0001QH-8Q; Fri, 30 Oct 2026 05:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMjMg-0001Pc-7z
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 05:57:38 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMjMe-0003D1-9o
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 05:57:37 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a20bde60a0so3577665e9.3
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 02:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793354253; x=1793959053; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=VfaJ4F1gIGp2Zh2Ykw383pEaDYAt1luMqXttPDnnVxo=;
 b=vecf6rY91ubjif6BP1mJYYzsHkKd4NdnL5LM+FKylCYXLeG6lxl35BlirJem4dWTMn
 0nZO5Spi0VwZSmR7vSHMrd1zalb0/1T+VjofgjaA4rw2ygzsDMzF1Dx2XXBKX2FNPj+a
 BQkc//p7mdkw3db8udioLlUwUjTGCPG3dNLbXxLPB4/U4PN/tbWYUANuy/2Yr7Y4ZARb
 A7FCk1aMVD6Pi2l2Fjo9XAUf3E7G0HtkiAuEinreurO6/DvanQ7N2s661GJMrM5vSHEu
 jsgbr+aHJ8AHmPZ1xaTiaQI+uZOk2snAmY9ht5brUaIenNPKrUh9Hq6ky19bK/EgpMFl
 U0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793354253; x=1793959053;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=VfaJ4F1gIGp2Zh2Ykw383pEaDYAt1luMqXttPDnnVxo=;
 b=JqdJVUX5iDf1GlKZFFv2sQiYPcqVllJsamcy42gG8eICNJvcfEOxdoyfbLxlcvKRaD
 ycdvnJ3wUoTps4otdA6MOa3VAMtlIdjILMxZN1OldQp8ZAq9hca6dW1Dq3Ss5l4DIHRA
 KnqID2jDyfxcVbPyeSSSAB5NLFjLPH1hDR14W60nuSFci4bdPRxmPriP+SwpduoES24h
 DW/gj0LsNQNu05gys/nFmu1+xIcL04QXvBVgJZdZAF6M1JD0GN9KpHqrFWNj7WHiVtdz
 7aKl2w9Pn+/JyKVPxT9xbOLuYunywWksbPzWZPjCQKMOiQofUgOexDA1QMrR+uL9NrD3
 9QuA==
X-Gm-Message-State: AFq9FYJUoZHL2JZDJZUnmXRdg8o1+keAD7LT+HYr2fE4OHbnbI+1YUP9
 GT+AdzUDOFZI2sBcjfO90By0tihRDFj5rBGEWYy6NRVIZz5ZvVAci4xrv+GsYGHA+U+W1yr92Xc
 qTMLLhJk=
X-Gm-Gg: AYBFou2qL2GGRIuvXrnY+ytIiHv7652ce9DU4WKtw7nSCu6WXpBqPnlmUeLZ+9U7zwC
 2a8sTiQ4pEhf9MlMduMFGU84lUSgZwp1jJkpi9iQlxUmTjSNZP8Gd05dWKaR5Z3hUpio0BJbhjm
 mx0/VZE63xAai5Y0VzW3cubulXuCrK33rqUYjQWje6jRA03cf3P/O9Tdl/03oZe3WDwyfKMyThU
 VnVEgEy4awHZx1rD+jaX1lNy1JOWg0oOMwBl2i4/on+Wsamq3J6Lbd2rZx8IqCTPWodxBzdCrRD
 1Cc6iZjLlxaxnQufRtyQWsEV+/IhPUtrbRi5qrSv3m674F0n2HO6mzJgk2Ykq66DTppqMVoxrBt
 b8O02AxqCGX34oDRp8EQSe1wRriHnfPVW0DkZHxWOWeW8Xqd4wRkh+5xjuiW/9JaV10+vQti4ku
 yBXswZdXR+4GScGEDIGPtWiVLhOeRY1fUFoekYolXUybVKZrXvnfBND2yEnNDUaft/0WASAcHd1
 XUB+q6xnC7/QUtenMQbxKzCiSDOgYpBXZNN/v2ibnFjYCcSMgJvujzSqfQy2Cn0WBoVOSdTSX+T
 Dv6DZxSjRZk84l1+oP9XE2LbHF+/8h1H5tDQH4BUZnrvFPZj+HMyp5unVHNNia0XUw6TPrYhxGN
 pqTl3DCLBEwmbwjLcY+6Yn8KzVTl9T9ydl37z0W9Ct71NUEYR6r6gAtc=
X-Received: by 2002:a05:600c:8183:b0:4a1:fc0a:8b75 with SMTP id
 5b1f17b1804b1-4ac183d1507mr28928855e9.24.1793354252936; 
 Fri, 30 Oct 2026 02:57:32 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4aa81a896ecsm132444005e9.9.2026.10.30.02.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 02:57:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Bin Meng <bin.meng@processmission.com>
Subject: [PATCH] hw/arm: Deprecate Nuvoton quanta-gsj board model
Date: Fri, 30 Oct 2026 09:57:31 +0000
Message-ID: <20261030095731.581512-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The latest OpenBMC release as of June 2026 no longer supports the
quanta-gsj board model (as noted in docs/system/arm/nuvoton.rst);
support was removed by OpenBMC back in 2023:
https://github.com/openbmc/openbmc/commit/ab5062cf6f562ad0c844570ba1ea0089961848ca

If OpenBMC don't care about this model any more, it's unlikely to
have many users.  Deprecate it, with the intention of deletion after
the usual two-release period.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I don't insist on deprecating this if the Nuvoton maintainers
think it's still useful. But this is a "hello, are you paying
attention" call, since you didn't respond when I asked in
code review on a different patchset :-)
---
 docs/about/deprecated.rst | 10 ++++++++++
 hw/arm/npcm7xx_boards.c   |  1 +
 2 files changed, 11 insertions(+)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index dab47b6ca38..c579342b312 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -287,6 +287,16 @@ The machine never got fully implemented and can only show the firmware prompt.
 Given the incomplete state and slow progress on improvements, it might get
 removed again without replacement.
 
+``quanta-gsj`` Arm machine (since 11.2)
+'''''''''''''''''''''''''''''''''''''''
+
+The ``quanta-gsj`` machine models a system with a Nuvoton SoC
+intended for use as a baseband management controller in a server.
+Support for this machine type was dropped from the OpenBMC project
+in 2023. If OpenBMC no longer care about this hardware, the QEMU
+model is unlikely to have many users, so we are deprecating it.
+Users should consider one of the other Nuvoton-based board models.
+
 
 Backend options
 ---------------
diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 9c526a26839..ec4b530986b 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -496,6 +496,7 @@ static void gsj_machine_class_init(ObjectClass *oc, const void *data)
     mc->init = quanta_gsj_init;
     mc->auto_create_sdcard = true;
     mc->default_ram_size = 512 * MiB;
+    mc->deprecation_reason = "No longer supported by OpenBMC";
 };
 
 static void gbs_bmc_machine_class_init(ObjectClass *oc, const void *data)
-- 
2.43.0


