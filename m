Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721EED1D461
	for <qemu-arm@archiver.kernel.org>; Thu,  8 Jan 2026 14:36:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vdr67-0007A0-Jd; Thu, 08 Jan 2026 09:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5t-00071L-TO
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:36 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vdr5q-0000h8-74
 for qemu-arm@nongnu.org; Thu, 08 Jan 2026 09:34:32 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-430fbb6012bso2406994f8f.1
 for <qemu-arm@nongnu.org>; Thu, 08 Jan 2026 06:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767882869; x=1768487669; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ksGvb6tIIoBcL19IyLaGN8z74U9Al+XLv7vvohNmR5E=;
 b=jP8iKv3th8Ojq91UcBlmWn5SJwEbvAktG1okFdHG7u8ImnyvHIDSOIuolDIZ0430rc
 k4uG/cpCwizDxcrzG+aga2NNc5oZEU9g7t+p5rVP+sfL8XIXiP48MHQener4TXo6i9pR
 bwrVSv+zdsnFBOqRxo05eTsurTlx5jqDpMHlcR5GtA5KUkhd+Oy2fiYTFFI491YA3tnC
 zKSNviIp7Qhs42z0BUzeOuuNgdUeZ7KE/JGHHIrdRf77V/6qZe9pClom8kZ0Wq4xFJ9i
 lgLpibx+jW+ZdrELtqdRQNuXOC/ALxMkW5b0PvG5d3CqAsr9u9RaUGoMBZ3ax4n4Ebe2
 yFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767882869; x=1768487669;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ksGvb6tIIoBcL19IyLaGN8z74U9Al+XLv7vvohNmR5E=;
 b=bilkowMOW9Am7EPxf/3iFAGhV3uGwDfYais9jvD/k1qBInC3l6RPA6XnNtnsLvg5sI
 HAv15/TVUMVs+DZh6TnPWrgoRuUfYSkkYvLBxOIFWTSbmmX2mVsS2F9Y71403o7z6Fxx
 XYTETXcSknJhhjj0BmENfn6WQwy36wMMC1XYsYdgPp+FLlOszt+4D9l/syLDK3rDfjlY
 rk1T/+1O1Pt9BqykXxTyo0e5/HtNh0EkdBp0V74gRLEncQNyKbDEiKqtxv+WoZfLy7En
 ydsfRFwfSS1Iwp08RTj1h96vvB0MO601mLva0qQe78W+AVpaEbOzcBKiqeW+QiQKF7uI
 LNbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUEAxuq2ZcDIOZra3xfgATKQVibFGTGo/A6dqfjUBRvk6YLlXTJRatTzoRh8ogHwozKdaDYF4xuQ==@nongnu.org
X-Gm-Message-State: AOJu0YzGuv/DGStHIq0JzXkhZQUabQiRfytzTRPWPt4r+1RyBgNanzNE
 MvU9sjHiaRWHa+n8RXYDa0AcVvv7LKBPbZLbqTrgWSYU55KQYeZQFjGh2FEJCv4UcRU=
X-Gm-Gg: AY/fxX5wa6E03ZwyAkZ9DBfsxSO9MeaFayFmZXEzV0kECzBnobrI/yLd2Sl+wwVV7Tb
 Q/CmqIRPaQ3R3Qogk8DJsKykw5uOeCDQTV++3qJqpAwwIwf73CRMZrH5Q85ZhwHLOzsyBmIYIeh
 YmZKlXoI6FCNWtu1y9YcLkTfJdn3v2YieH7GTn+JimHhAlRYA+IzfYe16KeFKnhZKQYJJunjLxb
 V7jJfPxCEwWx4SnHQiYiKxeNzEJAdiw+nR7X1BCSTjZObXN9wgnalY8QLMgg07xFNIuo6C3hOUv
 ayNTt5R6dQpVs0AE3Ip0nSrsi4tD4oThL8P4h5HJq7Oj0lNbj7WD6Wpez0ol+TNOCtT+Yt+KbBx
 uPsI3GKLytxX8UlIYxu19JayzgxdkoOMA23au7vbH2fFJK1cLepHeUG2DT5+PHMD+cH9O++BGR+
 6ejf5Tiph2zr8=
X-Google-Smtp-Source: AGHT+IFVmLmMizmNB2LIXR8Xv3q2Sppf9Sh1lb/5R/XMq5lNlyeZkdJf+M6Qph5BQgNY23BgFi5Zzg==
X-Received: by 2002:a05:6000:3104:b0:432:7068:17d with SMTP id
 ffacd0b85a97d-432c3775aa7mr8314435f8f.20.1767882868653; 
 Thu, 08 Jan 2026 06:34:28 -0800 (PST)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd5edd51sm16659017f8f.29.2026.01.08.06.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 06:34:27 -0800 (PST)
Received: from draig.lan (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 74F565F94A;
 Thu, 08 Jan 2026 14:34:24 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Bastian Koppelmann <kbastian@rumtueddeln.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, Yoshinori Sato <yoshinori.sato@nifty.com>,
 Yanan Wang <wangyanan55@huawei.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Thomas Huth <huth@tuxfamily.org>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC PATCH 07/12] target/m68k: drop cpu_reset on realizefn
Date: Thu,  8 Jan 2026 14:34:18 +0000
Message-ID: <20260108143423.1378674-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260108143423.1378674-1-alex.bennee@linaro.org>
References: <20260108143423.1378674-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Now all the m68k machines have cpu reset handlers we can drop this
extra case here.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 target/m68k/cpu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index f1b673119d6..a540a754969 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -392,7 +392,6 @@ static void m68k_cpu_realizefn(DeviceState *dev, Error **errp)
 
     m68k_cpu_init_gdb(cpu);
 
-    cpu_reset(cs);
     qemu_init_vcpu(cs);
 
     mcc->parent_realize(dev, errp);
-- 
2.47.3


