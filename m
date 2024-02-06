Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1915712ejb;
        Tue, 6 Feb 2024 08:31:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaw39GoNc0T5sWWdRQYQX2cVx7IuQNuhfkR1n7EfrTGjCNE6moa1RYxYRfbGqvpBEN5tQQ
X-Received: by 2002:ae9:f809:0:b0:783:f696:3d78 with SMTP id x9-20020ae9f809000000b00783f6963d78mr2864426qkh.67.1707237084428;
        Tue, 06 Feb 2024 08:31:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707237084; cv=none;
        d=google.com; s=arc-20160816;
        b=fcdThcMe8GjBvD7OFKqzD0AFtwxun/WpoyckO4FxkEvV5drDBJxsJ09omoQitQKjDT
         bAl4uzRCQrAESU9W6ukBkb4JWrr4n+NCvxB5SYkDnlMUmTd9XcC7wHjIXLhkljutBvtX
         hKbg6qTQUsJCwanCZ1U2rh0yB/ILuf+B4bOs1qPOA2nKBXaOPE4haomNd+5D3bqCfN5t
         g0n6zukHlCKalKcqKOEym+4nmYU1BDAw0PzRc6rYdYeCpyP38Y5+XnN/9P6fIb3WGgRj
         0lKxCnk7o+VcRQUBLf/DDwhJFiPpZGRwx2OKtf7ZRfVHr4N9f498cIuXckO81YCqhq3M
         we/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=vXWEV1+hfBGKxYf3DFDRYVhG93i/x2bW7FCe3SU165k=;
        fh=JBrq/8Erxe22ZS16l1cufaDijeQEP6US9C84BJ7f6PY=;
        b=ch/x8/ylD4/pclL87cRus9243OyxdKHsL7uBRhqV+u5v9B1p38BlwZMpz6kmjnZn4f
         GMhsehqA3OxaizoyZ6p7ue2uOfLY1XvyHI88cgunVfY1fkXp1HYCRQv4QGcZEEmZVhFw
         tM7B+c5mqoMPwiMmLwplz87+XL0zjbXE4A1cPdCn+2KV6wLNZCaon9yqssH1Ihbf5RLC
         1/Xx5SX+yxpkTy3HF1UDQ2whMfmmlsZJk3r3HvE8fkEbvEdZn6MYc28lB13XEfeZR9pH
         Wjrikti5Pqi9zYuGhE1cJSR9A+9/v1JtinEconUwVpbjcPk1o4VRlpVl78scYQyrROQe
         /qgA==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jGNGAqVP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCWhLxaGtgiPc4mFIDf+WogZLSyl+I9dBauu3sjIgU/OSqPu8LPZcp14a7/D7lC7xdH5DROwDetsHV0Axl11b0yIEPLEzySh
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay7-20020a05620a178700b007858eb36fc8si1925285qkb.129.2024.02.06.08.31.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 08:31:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jGNGAqVP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXOLu-0003Hr-Mq; Tue, 06 Feb 2024 11:31:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXOLg-0003Cw-DJ
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 11:31:06 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXOLU-0002BG-59
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 11:31:03 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-33b130f605eso3805939f8f.1
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 08:30:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707237045; x=1707841845; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vXWEV1+hfBGKxYf3DFDRYVhG93i/x2bW7FCe3SU165k=;
 b=jGNGAqVPCH3gOW+FXw+PNt5E0V8hb1v/NulHTY1ZsWC+gDap2zmQKE4Z9q3NWZ+QVK
 ODJrpAAcOFyjFG799Jnyn8aF41/P26H++0ZzDilsz8FtufvOB7mhgesxS385MmfhUrZa
 1HMG6GWRHwLswWXV278OOCgNaDsHzH3/hS3ubCg3KUVg17TXnxXb64v1AdbNyYDdXtqI
 E5itm+FKPMX2OfLK0M20QTSq3PRvCZDSJfNbO8c3XmocxQoh2ePRPlamJLHlLuVujsup
 T+e0g0Ra7uJR/RsSZDALrq9w+QvGb+7OoSJbGpqyptozxbDQWhW7nRU1aLBU45wAmfyz
 0DOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707237045; x=1707841845;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vXWEV1+hfBGKxYf3DFDRYVhG93i/x2bW7FCe3SU165k=;
 b=bpUJvD2KtrvnmdJAZPWqo2WpX7fC+VEeLCTm7fTGO5vQUPyX9yclS+xqaYP2fleH4O
 fis+Wrwrv7fVsWRPPnyt+ZwgV1OTwZF5Gfg8n8lQ8KlNqjdAYSIgsVf8CHoMZPvvqPrH
 0BJmXrJqBZOzWs5VIBsHSUSxG6uF2OiaogTirdHkbUcSGNOY+rZriNdUc+M+TNNsrg0E
 5bC859cEG58RiqMcYDWv59jmoYAqeUagdXajTp40ChcffhVD89iYRbOrMxgYWXszVr3r
 OrMICXdSEbuFEns3SUKrYTZ0bZ4XnODnzZbsqU8HYRb9Gghhzc4izbOp8A7/uFfjwYqv
 dHMg==
X-Gm-Message-State: AOJu0YzGCVaa8/OK2wztogudZy3JyyJr31nOzExr+NKuO+liUMsaJJ4l
 dSv7/bbXMPl15NM4CElfVRrAuAn+pw+B3uhiE0DECkQwxr/S9Taj6Va+lg+tmqwTwDBiqFwT0dg
 G
X-Received: by 2002:a5d:574b:0:b0:33a:e808:31a4 with SMTP id
 q11-20020a5d574b000000b0033ae80831a4mr1530666wrw.55.1707237045138; 
 Tue, 06 Feb 2024 08:30:45 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXrDnJ7Q1LGq4WaVu5nPEtmTTwrMOb7FRuRRUSXRF689Eg9hcsH8Q9u1ol9VEy8ZSXCaJjGmLcUu6LKpWxZ8vDFQGO5yew=
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v17-20020adfa1d1000000b0033b4b1d180esm371325wrv.43.2024.02.06.08.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 08:30:44 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Nabih Estefan Diaz <nabihestefan@google.com>
Subject: [PATCH] tests/qtest/meson.build: Don't include qtests_npcm7xx in
 qtests_aarch64
Date: Tue,  6 Feb 2024 16:30:43 +0000
Message-Id: <20240206163043.315535-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 5qLlWEAqDOlY

We deliberately don't include qtests_npcm7xx in qtests_aarch64,
because we already get the coverage of those tests via qtests_arm,
and we don't want to use extra CI minutes testing them twice.

In commit 327b680877b79c4b we added it to qtests_aarch64; revert
that change.

Fixes: 327b680877b79c4b ("tests/qtest: Creating qtest for GMAC Module")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/meson.build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 39557d5ecbb..663338ae124 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -231,7 +231,6 @@ qtests_aarch64 = \
   (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
   (config_all_accel.has_key('CONFIG_TCG') and                                            \
    config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
-  (config_all_devices.has_key('CONFIG_NPCM7XX') ? qtests_npcm7xx : []) + \
   ['arm-cpu-features',
    'numa-test',
    'boot-serial-test',
-- 
2.34.1

