Received: by 2002:ac2:4c90:0:0:0:0:0 with SMTP id d16csp859776lfl;
        Thu, 20 Jan 2022 12:18:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpV6pBINED2yghI4kBERyEMkseMDXRzP7IkoGCFSmKxWoH7ud/nLlHImuGH9I4G9G4bSzn
X-Received: by 2002:a5b:3c1:: with SMTP id t1mr1164311ybp.486.1642709883031;
        Thu, 20 Jan 2022 12:18:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642709883; cv=none;
        d=google.com; s=arc-20160816;
        b=zbKBO3wwBgfBUBr0yNQYd+fuxcjPa/qV8vlZEAs1kmHKJYfo6uSLVnfa3PKv8UU8v3
         8oO5SVLd3Ms7O35Nb+Z8WSOURqJrorf7YxD92on8q9hpiDestJ8MvwvoTby0zMSDiRE6
         ITP0dUCHxDArjwvtKNDQbebukIEL/ddIVNQOmA/zv2JfA70gH3w8WizlwhN7HJeyDTl8
         DlmuYhb0U24lZyc6kFf3g74NVb996M3ptmE9N7W6Kef9aucTB2hE+bUnOxpp2iyZPIuU
         QVEpyn1nyMC4QhBwtmOF/HqOinufYhDOjmTJrBvyiCLW4/rtyJ5wdsH/hMxvFLaxE4N5
         SwvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=dUP+xAeqwqhgnTkt7Pfw/iOMWfGPZPxV5IL8xzgDVz0=;
        b=s28Lx5OwYq+GuXVZolqeu4YDhiovRA0CrmWxt+B/GRUnIQ2czgkheZFRk/KesYt4OU
         Qi6NtGr1PLZ8rC4sMQIw2in1Q81HFTNvwlx7eQ/LsF+LRlMlpdLpraRxyeQrXMPtMcF2
         a0FnBSNrg7I3fxchlN797r3fiinsqLKjUu/c03CvNl+urQU9j302iAO4LEaTUGV0k34R
         ceZBLGLQ9U1Q671itbKqInExvoBSeBQKH3jH3v5SBuJEe39yux2mw6xMIwMycpsVEMWk
         OS97Ap6t/zFApe2pcrts+d0K/mpbSc/tGmJSnRJQEUkBCtWpO83WKnDqJKzd8vEE7XOl
         F7FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G/QDk7j6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 84si392319ywk.286.2022.01.20.12.18.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jan 2022 12:18:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G/QDk7j6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nAdsg-0002d1-Ft
	for alex.bennee@linaro.org; Thu, 20 Jan 2022 15:18:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAZBF-0007ph-6R
 for qemu-arm@nongnu.org; Thu, 20 Jan 2022 10:16:53 -0500
Received: from [2a00:1450:4864:20::32d] (port=44807
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nAZBD-0003T6-LD
 for qemu-arm@nongnu.org; Thu, 20 Jan 2022 10:16:52 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so14480096wms.3
 for <qemu-arm@nongnu.org>; Thu, 20 Jan 2022 07:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dUP+xAeqwqhgnTkt7Pfw/iOMWfGPZPxV5IL8xzgDVz0=;
 b=G/QDk7j6SK0aygeX0/NWPq6ZS48SZn2xdwx4jOzKKBc5NCaDU5qkiEhjzdcm3veGOb
 X3cvNdDs8VuonPloXgUK6qPgIusJzBmW9XPPG7hSIMd+pydwSxGjtRreLN20Jqs3Q+7Z
 opLv1Xl5FZH0LjdTiN9+qdAZzR0DViiL3PDi5OaisoBig/GEN3Bl09XtxUizCrC7QNiC
 OLXiZWia/upq+B4iHHouApDPeAkJjOkQ9DZNmFn+hREaFN/usCtY+Qi/UqmSWStb9QmE
 MWR6Xt/BPdoZbmziC2tS+F4DKT0MdvqP2bRHzGakxzNQedVAJL/GHskqd82QwROrwLIG
 KHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dUP+xAeqwqhgnTkt7Pfw/iOMWfGPZPxV5IL8xzgDVz0=;
 b=nsQWxBPMnyTpfmyuEdCv4XZWQJQ1xCC7L6BVXcq5jaK46gILLz0Wn09owSQXj5m0yS
 ZWMQtNe5sASbZmv0yoHHxH/kknDYtPNNPIet01i3zIGuPGOr2xqT/EoE7z30zHmEZQD/
 uueOZB5yVlzNjYGnrlkOm0DZMPgUoZBpeI8eQCeBa1EkvtkZNBcQ137fm+fyjFB/ap5h
 2F62KzQ9RpjKaMcL4TRhNZn8m4+KvYqEuKEV66pGLKYQRCOH11dxdQVREs2/edtN1U90
 TX+orN0nCNbW5dWlyJ9lLnnUwxGi6GYKjdR45KWRK6CeRtX9bPsW82onsQkcA7bsJvXh
 +L7Q==
X-Gm-Message-State: AOAM530L3ptkve6vNk9eRKYHsvtyrVgTDbEnqVlTeZA5T7h+yT99m215
 +H9H5cEswp7pVzwO+Yr3eIwCgj7+pUD8Hw==
X-Received: by 2002:a05:600c:291:: with SMTP id
 17mr9291417wmk.123.1642691810003; 
 Thu, 20 Jan 2022 07:16:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id w6sm1972079wmi.15.2022.01.20.07.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 07:16:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH] hw/char/exynos4210_uart: Fix crash on trying to load VM state
Date: Thu, 20 Jan 2022 15:16:48 +0000
Message-Id: <20220120151648.433736-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7/VlyOWgpVD6

The exynos4210_uart_post_load() function assumes that it is passed
the Exynos4210UartState, but it has been attached to the
VMStateDescription for the Exynos4210UartFIFO type.  The result is a
SIGSEGV when attempting to load VM state for any machine type
including this device.

Fix the bug by attaching the post-load function to the VMSD for the
Exynos4210UartState.  This is the logical place for it, because the
actions it does relate to the entire UART state, not just the FIFO.

Thanks to the bug reporter @TrungNguyen1909 for the clear bug
description and the suggested fix.

Fixes: c9d3396d80fe7ece9b
   ("hw/char/exynos4210_uart: Implement post_load function")
Buglink: https://gitlab.com/qemu-project/qemu/-/issues/638
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/char/exynos4210_uart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/char/exynos4210_uart.c b/hw/char/exynos4210_uart.c
index 80d401a3795..addcd59b028 100644
--- a/hw/char/exynos4210_uart.c
+++ b/hw/char/exynos4210_uart.c
@@ -628,7 +628,6 @@ static const VMStateDescription vmstate_exynos4210_uart_fifo = {
     .name = "exynos4210.uart.fifo",
     .version_id = 1,
     .minimum_version_id = 1,
-    .post_load = exynos4210_uart_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINT32(sp, Exynos4210UartFIFO),
         VMSTATE_UINT32(rp, Exynos4210UartFIFO),
@@ -641,6 +640,7 @@ static const VMStateDescription vmstate_exynos4210_uart = {
     .name = "exynos4210.uart",
     .version_id = 1,
     .minimum_version_id = 1,
+    .post_load = exynos4210_uart_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_STRUCT(rx, Exynos4210UartState, 1,
                        vmstate_exynos4210_uart_fifo, Exynos4210UartFIFO),
-- 
2.25.1

