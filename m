Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp2878042lfb;
        Mon, 18 May 2020 02:52:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrlWIYekvUmpLaGFsiu9LKbkc10VjUfZmuondqWrpC/qiGaj0hiYQATgRfdJrhL4l1/D+v
X-Received: by 2002:a05:620a:1509:: with SMTP id i9mr12433885qkk.445.1589795548100;
        Mon, 18 May 2020 02:52:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589795548; cv=none;
        d=google.com; s=arc-20160816;
        b=hR6NKJx2n+iYxJ0ZR2acoHw4LQ7RiBGSkEzB/aG0z5iETHhU+KWH4WGTy6kQ1Dgy4D
         OLnZTI4IeOg3ljuDXgbz2BcfTrRhyfFLe/ps3JagfHbJV+syon4smft649+po58UUvYB
         A9uwQZbXq/9E4OE7SileA9udvTFSEgHkUNeOx5cmwOoudD38slPc/GQfd5CHjgHarAkx
         XDEqgEnOeoxSpy4ehuPObsEFXkVMbweB16tVHMHWWjeYl4M8wBTf0er2aTgeIRBUd4NE
         qjVjWIu5fFWhPnl7qOc5m9D7RAEhgW1IICMghPTY69GvsDGjSFwSl8yEpAR3RHXgGvyf
         o8jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=pY7ifqJ3Le7BSTemy3hxz4uP2Q82R0++sumXW6Rj3rA=;
        b=TQ3zWbxWF7TxjKVMG2T4lajIy+oRsYzufu3vppleEuwtmyceej53CEc6g1WO3gX3Dl
         2UekkhuaxVguksrVU0wDqpNEV1axXUE5DG5MQhM17tA1BMkzhYMGFhd6Ivcbo0IblvDp
         zC40/RRD/bDvT+DCBSVEpIhEXzfcKOX+/vSm71fXjm5KgxD8n8uGTCU+JJuHfn2mY1Ig
         gJNbE9vkBtDJtfFHtTckq9QlgFfDZMtMLIIjmRfxol6mC0WSPhSp71W68HxrP5nieMsH
         V7Nw9YFTmDIReeuyVKPT9jyUXqCSLmrOcpO9z55DtHCaMgCpUhsg33AwsVudRQoZ+rYB
         QeYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Q0FQv5iP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y32si5511115qtb.371.2020.05.18.02.52.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 02:52:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Q0FQv5iP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jacRf-00039B-Gb
	for alex.bennee@linaro.org; Mon, 18 May 2020 05:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jacRP-000344-S2; Mon, 18 May 2020 05:52:14 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jacRP-00017b-9S; Mon, 18 May 2020 05:52:11 -0400
Received: by mail-wr1-x442.google.com with SMTP id h17so11020862wrc.8;
 Mon, 18 May 2020 02:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pY7ifqJ3Le7BSTemy3hxz4uP2Q82R0++sumXW6Rj3rA=;
 b=Q0FQv5iPFzXNoTIkx3rArVMrJBp9YaU1FQT8Zp8Fd2LJXYuuSev4FQjM/DBm1afFST
 FavBwDCY1ZWC3tKSMNVYMH0fbWnXiRqEK6D7fGZukA5JViE1mkEA+Civ2/oBiEzbBjZI
 BRSY7iACTjQo9Fac964wsCXnlCIZX/J+xv4CUIXRPxtvdi8E2SYbNsLBk2gfSfivlKSC
 6BiwIt7yxcuRX01P+vR8T0nZaGAUEy2RD4Lt2x3RsgFJasovFALkrvsxuZ/DJCGNlaOi
 jTvDjb4v1H1bqWSKrLcjhBB0ag0h/b7bo5AofWCI4U6rWXAZjroBukw5L8Aydo7ZtG+n
 eR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pY7ifqJ3Le7BSTemy3hxz4uP2Q82R0++sumXW6Rj3rA=;
 b=aBYJr+0cGeytbdgoXL6CWC1FAXnRb0D0C67kzXoDIyWvTHwoaMlg39cVyQ7bdz7lUR
 Q2N7nIbFvkmBss/BeThdtFI1hd1Wp87CAwoOQ3ce+Rz4+VsNuwa5ETMpvDiBXivBtR6h
 dNfFIeVhwRwdNzUpx+P9xORNgS6i8PLrhKNd/GLN0UW222IFe6Y5lEX2m6UL4E2A4ViP
 Z04z4m1HS1WMeepObhWI1FEd0bt05GXy5i9LHHWZtmo3UjwopPMRNpn0NxGyMtMGM3q2
 dMP1v7ma5F4pMtCINoy54o9g/rzY5bltc+RJkwudx3utk6IdTJU4LUenXeIwWojre0cN
 HLYg==
X-Gm-Message-State: AOAM530O36As4prfKDuiKhxkpQ9sE+nFwGpUvaZCXVoKagYVDs8qcAw2
 tQLGwgD9GexE0Is9nV6xlnavzd98sC4=
X-Received: by 2002:adf:a118:: with SMTP id o24mr18278839wro.330.1589795529501; 
 Mon, 18 May 2020 02:52:09 -0700 (PDT)
Received: from x1w.redhat.com (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id r9sm5453542wra.52.2020.05.18.02.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 02:52:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] hw/char/xilinx_uartlite: Replace hw_error() by
 qemu_log_mask()
Date: Mon, 18 May 2020 11:52:02 +0200
Message-Id: <20200518095203.1013-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200518095203.1013-1-f4bug@amsat.org>
References: <20200518095203.1013-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EUGqW3YRHUgD

hw_error() calls exit(). This a bit overkill when we can log
the accesses as unimplemented or guest error.

When fuzzing the devices, we don't want the whole process to
exit. Replace some hw_error() calls by qemu_log_mask().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/char/xilinx_uartlite.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/char/xilinx_uartlite.c b/hw/char/xilinx_uartlite.c
index c6512285d7..ae4ccd00c7 100644
--- a/hw/char/xilinx_uartlite.c
+++ b/hw/char/xilinx_uartlite.c
@@ -23,7 +23,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/hw.h"
+#include "qemu/log.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
@@ -135,7 +135,8 @@ uart_write(void *opaque, hwaddr addr,
     switch (addr)
     {
         case R_STATUS:
-            hw_error("write to UART STATUS?\n");
+            qemu_log_mask(LOG_GUEST_ERROR, "%s: write to UART STATUS\n",
+                          __func__);
             break;
 
         case R_CTRL:
-- 
2.21.3

