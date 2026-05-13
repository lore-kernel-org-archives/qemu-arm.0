Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B116DCD4F39
	for <qemu-arm@archiver.kernel.org>; Wed, 13 May 2026 10:59:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wN7J2-0006WY-Mo; Wed, 13 May 2026 06:59:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wN7Fd-0003Ay-Qk
 for qemu-arm@nongnu.org; Wed, 13 May 2026 06:55:45 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <corvin.koehne@gmail.com>)
 id 1wN7FY-0001S1-SL
 for qemu-arm@nongnu.org; Wed, 13 May 2026 06:55:40 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4891e86fabeso75840475e9.1
 for <qemu-arm@nongnu.org>; Wed, 13 May 2026 03:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778669735; x=1779274535; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pF8Avu0vc4X7fk20J7cLa1Br/gq+YuCxe6Pf3cPpIE=;
 b=a65f97hWhfCcXBMkRE9jRRLZeP3EvCiH8HYB7ImclGdxDS7ubwPVR+Ar27ogm/eC49
 e10G2x1/x6eswmkfqU1E3HJdnEM9ojIj1cGUoFWkdKwremsio85p0TpFpZLzAF6+u5A2
 oiPbzMIEBCN828+zsqGCSyDE8aLwoJrEmSKdaifMgEzsaMXgfhU/SPbNAVhjKz8IFIRv
 tD48GFibDd+lqY+je5JvnL2kkF1VGw0TAEmCb/4jgOrdYGZQrBHOVIjf2N4hnuNRHrxM
 DB0zeDMMhhY2IIyYoXa+lGFADLZIRnQ9pe2vzqhclcS90KBDrfBw2ECOv5MVjo6nj41f
 GCLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778669735; x=1779274535;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4pF8Avu0vc4X7fk20J7cLa1Br/gq+YuCxe6Pf3cPpIE=;
 b=NlUVvGjD2Z0UJWLUhCVhjkUaB+coHaI7oIi0a0WT8bB0e1iEJsUYWj7hI8esfK9klx
 cXyxiiPPfiNS6gfCuSY+vQ5/WKI8ADgcMh2LRhBmBRoR/Px9sbPDDG/zEmgLh693dsh5
 q/Hug6po5YWwrduK89U7GWJEJBF8ci53fbbqyHGzk+NJTXhXbIU5turXLfTKy6YJGm9i
 r82PK73+DdEOGSQucy1l0gDXs5IuJ/dVP9CPipehi+gvQll999kIMC40XbDdhiHwkVma
 8n++CDy+xJfUcn3JO/EcRd115IzhIXNLTS9vyozQ5sjRNHmoZT2Hv+wDOy6aT6kmei/p
 k54Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ9qsUIc5DnlCi1i814m5AafDK+CzA05lc9B1d1SvJffYsyDUZ0OciOB3TGVP7ZTva1Mpp3xK2gOsw==@nongnu.org
X-Gm-Message-State: AOJu0Yyvxnrll0DuzIpcluSHLYUcFdi4wrVVH1kY/d2uqNsegK91VwXt
 g6sAUIIJY+kZLndR2PFj6FgStDa3XTACk/UAYfx8E2SYI7eeVVnYE4HMEwMQj2eS
X-Gm-Gg: Acq92OEejp19+ht+AlSuAbnfPL0UgNwISRZLm39ziBaSbGPhHjs2bwX6QWdyWxuFZGF
 963kPR6YrLTWvl6Ry3k+g9bAJmV5uLRmd6gouH+lLHstFUTWtnkTsJfeb4HHhan19HdU3yWtdcr
 y6hfCp+LnL3uCi48N7iF53WaZ58Zvddvi6oj4LWbmWrPTSU3QXrav++qyphwnL9iP9lbkmS0FDA
 24zESSgf74CLORWANGXY17qyp8gvH4UAHo0NMFRGD1IeCMXzI4v0aXLS4sgPD2zc5polk6razRR
 XdaajnLlf+LiaGJnHcqDuHmQgrMtqe+R6BM8AFczqDEwl4cWBw0J3yucC3aPGJ+cQeRmGNI+2mJ
 QH1VurImH8WcBqVdbuYCf5380lzWPpgZE5GrkK2d5OTLJTz6FT+h2KxaHlNNTQJo1GjNUEZUUX0
 70IE0z1TnJHRb0q4wcSq7m665J44bOXqjEZV9shHh/vZ9S
X-Received: by 2002:a05:600c:458a:b0:48d:35e:82cb with SMTP id
 5b1f17b1804b1-48fcea00b19mr26649975e9.28.1778669734664; 
 Wed, 13 May 2026 03:55:34 -0700 (PDT)
Received: from PC-DA2D10.beckhoff.com ([195.226.174.196])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e8f410d9fsm56062295e9.6.2026.05.13.03.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 03:55:34 -0700 (PDT)
From: =?UTF-8?q?Corvin=20K=C3=B6hne?= <corvin.koehne@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Corvin=20K=C3=B6hne?= <c.koehne@beckhoff.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 =?UTF-8?q?Yannick=20Vo=C3=9Fen?= <y.vossen@beckhoff.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 YannickV <Y.Vossen@beckhoff.com>
Subject: [PATCH v6 11/15] hw/block/m25p80: Add HAS_SR_TB flag for is25lp016d
Date: Wed, 13 May 2026 12:55:13 +0200
Message-ID: <20260513105517.146706-12-corvin.koehne@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260513105517.146706-1-corvin.koehne@gmail.com>
References: <20260513105517.146706-1-corvin.koehne@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=corvin.koehne@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

From: YannickV <Y.Vossen@beckhoff.com>

The is25lp016d has 4 Block Write Protect Bits. BP3 specifies
whether the upper or lower range should be protected. Therefore,
we add the HAS_SR_TB flag to the is25lp016d flags.

Signed-off-by: YannickV <Y.Vossen@beckhoff.com>
---
 hw/block/m25p80.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index b8a2543c0b..4a4cda6602 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -217,7 +217,8 @@ static const FlashPartInfo known_devices[] = {
     /* ISSI */
     { INFO("is25lq040b",  0x9d4013,      0,  64 << 10,   8, ER_4K) },
     { INFO("is25lp080d",  0x9d6014,      0,  64 << 10,  16, ER_4K) },
-    { INFO("is25lp016d",  0x9d6015,      0,  64 << 10,  32, ER_4K) },
+    { INFO("is25lp016d",  0x9d6015,      0,  64 << 10,  32,
+           ER_4K | HAS_SR_TB) },
     { INFO("is25lp032",   0x9d6016,      0,  64 << 10,  64, ER_4K) },
     { INFO("is25lp064",   0x9d6017,      0,  64 << 10, 128, ER_4K) },
     { INFO("is25lp128",   0x9d6018,      0,  64 << 10, 256, ER_4K) },
-- 
2.47.3


