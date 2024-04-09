Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1911968ejh;
        Tue, 9 Apr 2024 06:39:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVe8jPeaIKwy7EMzIdEkUv1S19a3M2VMEjmG5CMSqL9TThKBuENA+xhEHxAyRtxmnoalg3ggOgL/VZA3t3bQJ2grW+A3fRt
X-Google-Smtp-Source: AGHT+IFOOEfuq/eeh4mqo0difWO5iy0mFh4HGxlZmfddH9SO5UjJdSTJZqIjpVIisZ20bH7Gmf6L
X-Received: by 2002:a05:6870:d201:b0:22e:f43b:a3c8 with SMTP id g1-20020a056870d20100b0022ef43ba3c8mr9991005oac.0.1712669974982;
        Tue, 09 Apr 2024 06:39:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712669974; cv=none;
        d=google.com; s=arc-20160816;
        b=T/qMD21i3QRXrJT5UMrzfqrE2tPGM2a4xippNqng7NrIePO3Z7SaH2KJlUhJL/ZMMj
         Mgg2SuN0DNTygwPBmQ0jzYlTbYfxTFQ/WdePhbrgmbNTBGN6JCSz87gr8PalYyAsXMGi
         dgvP66fU+BNjNh6PAHq/uszOsiCZi1wJoXq/W/UVugDSxUwUP4qyABMQ8SCDrC0Qm7Sd
         /ga1U2XZ+BDxCKuimABu/beCu+kX/93Bif8d3NOkbo+HmJ1OwWVx/1M4IMvyIyCbY8WP
         EdE0CMRkyDF3VAiuYKiMuY+Wi2KRVHJsUy6slPRdt8iaIt9NCQXZ33unz+kiEunTQJ1q
         ZoPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7TiWem1ZhFBanlvNYVKtTUilTqsESzuwGclOakf5YZY=;
        fh=4DEPZZqsbEL5gJidA7n2TpsxKkQ6n5yiGIMQI12+bQ8=;
        b=cTGqevIpoBQW1PCTUjwJvUjRmVfQVpF+gtp1PVjyX63j16ytsHdonqcChHS9Snb8Mf
         CHTG7OKevhVGgYmfZfW3jhQuy8cx5mFb5PZFZeHq59F19ftz1tKrngQWGNXzxbi/wuVe
         xVeOvPyMk0EpJSkEc/Dq28Dkq6Uy3L8KUdi7z1pJHze5iqnsQMFjqawdWA4qHaNH6/1U
         A1g3NEYybtOXk62y/j1l8sj8FMMk2tl/Zn50Jea/EgLJ1ytOsshq7lNcgROlMNZ3+I7U
         HafwdCJ/wERBvryQhNHlz3X6R+RNYtXfalq+YwRYeV4ApEBEWXQO9HLGnZiBkwcIWikT
         tHnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nAkfqxAW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h4-20020a37c444000000b0078d6bc995a2si1970340qkm.645.2024.04.09.06.39.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Apr 2024 06:39:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nAkfqxAW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ruBhB-0007BV-Qm; Tue, 09 Apr 2024 09:39:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruBgO-00069Q-2S
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 09:38:40 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ruBgL-0008F4-HN
 for qemu-arm@nongnu.org; Tue, 09 Apr 2024 09:38:38 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4166d58a71eso14532895e9.1
 for <qemu-arm@nongnu.org>; Tue, 09 Apr 2024 06:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712669916; x=1713274716; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7TiWem1ZhFBanlvNYVKtTUilTqsESzuwGclOakf5YZY=;
 b=nAkfqxAW/T5g4qa2Bse3sU0USrdEIaSGp1zsofwDjAoO18sSR/JDwM2qwGRpFENxc8
 Qpuw8DSYRbV/Zw+/vXB77nWZp50XgMtFyzLYBlS2le/PRuGUo6kZvgWEdb9CfIuzXSaL
 NbJ9QQAf7j/QTyCnqe1oEH6BqBcsAjJqvqyNXGk2DXl4zw6+ClkIxgNHdbV4R0UULCen
 2icsg0I1Zcvt198RnDVfh8p61bLQGahRt9H+z2Uzps5nJRBN1nXbwzM09KtUEJTBryS+
 aToh6CxCCEMSHcYBonA6iBJ7kynbtxi5OoZU2X7eqphJD87JH3al1z2HxyZ73eTAgxzX
 l2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712669916; x=1713274716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7TiWem1ZhFBanlvNYVKtTUilTqsESzuwGclOakf5YZY=;
 b=HhxPZkHIOyHL6r5S3wcFK1h1pXUAFgB/Xww1scDvZQ+XHV8W/Smx2nBp9he7TR0Jao
 9940dMEEi9Co0gPN2ynpOEPdSvlLaUG4iSpl2n1zYY9sL3f/iSHMaK7XHve0iKhOD5S0
 D/2v7bJHnXd8xYtDKZWfDDDWqXmEOXZF1ZD+iQi+0aLdyKoNO8nWVUDL62uCmrLb5PKp
 pN9KsMgD8tE0JktjMkWACCGwNmL2Af5IiVlmBaOoNJWZg3sf6BetPo6jwG8XvkqNYzVe
 uTv1uXr3gWVN8D5OyBZnfz5JN+I1esnzj4H4ysncNaxnrJVGzy0Z2p5KnCifETEdSmMx
 mouA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdQMKi9RGaJBnPAPDouOWa7AFNwDkdnRN/VwBVz3qJ182wNXE7el4S+pg/sHPPh4sBaouDoJBcZuLyYMJ5hZ19fwYl
X-Gm-Message-State: AOJu0Yy7ZnafxPw/bAJnximL3KZVEy0flPLwDt7PAoQ2Et5ptXozbPG3
 Kv8qYZBMXcqzVqqtwPJI/ES4RTeYIPC9UncCg5TeHl+0nhGk9Yt2XQRx4bPtLLU=
X-Received: by 2002:a05:600c:154d:b0:416:902e:51ac with SMTP id
 f13-20020a05600c154d00b00416902e51acmr3520404wmg.39.1712669916012; 
 Tue, 09 Apr 2024 06:38:36 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.160.134])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a5d668d000000b0034354a99d43sm11483355wru.43.2024.04.09.06.38.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 09 Apr 2024 06:38:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Chuhong Yuan <hslester96@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.1 v2 06/11] hw/net/lan9118: Use TX_DATA_FIFO_BYTES
 definition
Date: Tue,  9 Apr 2024 15:37:55 +0200
Message-ID: <20240409133801.23503-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240409133801.23503-1-philmd@linaro.org>
References: <20240409133801.23503-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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
X-TUID: ThTx99mWcn97

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/lan9118.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/lan9118.c b/hw/net/lan9118.c
index 00409927fe..ba92681e2e 100644
--- a/hw/net/lan9118.c
+++ b/hw/net/lan9118.c
@@ -456,7 +456,7 @@ static void lan9118_reset(DeviceState *d)
     s->txp->cmd_b = 0xffffffffu;
     s->txp->len = 0;
     s->txp->fifo_used = 0;
-    s->tx_fifo_size = 4608;
+    s->tx_fifo_size = TX_DATA_FIFO_BYTES;
     s->tx_status_fifo_used = 0;
     s->rx_status_fifo_size = 704;
     s->rx_fifo_size = 2640;
-- 
2.41.0

