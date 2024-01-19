Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp881265ejg;
        Fri, 19 Jan 2024 03:42:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmQN4sUl87/I+cCX8bags4ZJLhjpO1APVISVYeqM/9+e+X4cwp28zzEkWV89gYm1CFu2sH
X-Received: by 2002:a05:6214:20c6:b0:680:c2be:a178 with SMTP id 6-20020a05621420c600b00680c2bea178mr2695705qve.37.1705664563887;
        Fri, 19 Jan 2024 03:42:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705664563; cv=none;
        d=google.com; s=arc-20160816;
        b=SvcEDUElOUwULdrMgDYxPSxVzn4zzHe2zP8dayTKzDJQK5W/+PgXOHDf6ySonnkVP6
         Dp5gw42snkiJOqBQ5ii3h2jw3LMo0Mf59Z06o9MGGCQkuPRY3ZOsfkT7tFFL44L7qJ3F
         v/nFxqu8O7O9/0WQR+An6GsDzpIjFTpYVt6H/Vfa+bvb/EXNrVERskD/f2Bdi3kcvdO7
         n6Rogw5Cw8UlLORnxT3U1J210JMR2fchOweVr8W1PWHGbNySS1EDQzoSeqbRKI9+3iNc
         tmOVY29jbFm/2jUbMUZhbQQZLDVXq4Xoe/ytct5KW28Xm+yTQQaXOWyxDhpqU5ihu3og
         PF8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=dFDI//XvTpn1St0hBV0sdqL1iHcD9DD5+xWDU4qjjTU=;
        fh=AgN8TvM7pMmL5RKrQhAJxXwOmBywzcClhFxW1SQC+/4=;
        b=nGteXYKeEC8nGaZ25bU2u6EGdrPaeniHmJvyVi5r3b7nCFrsoKdjBCl3ik/NAl+P3R
         UG33aXYly2oAXVIj9p0r7qJsC1AjZN5+zESf/VXvRPiNX4Nj8VJN2EiyN3600pY2DLzm
         OJQxx66N8x3SNvg6QJcQzLgjzeUb1HQsf6449zMwCxVrP6zk97wRauTGN3PiRKtHSZUs
         3R0QdL4+wO5DLnqHd8oWC8GhzF9Ncq0sxLFX0ZaE/VONtliPYnTiaatVWPRIt+OgAV/r
         Os+DOwz5XLLq8K86Y2Hoz6wHdV/69gipdD37tEq3hyIsN7tzd6YSEe/jDeCHeMxy4O/K
         2DrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pdGn9JtO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u2-20020a0cb682000000b00680f74cf178si15719242qvd.126.2024.01.19.03.42.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jan 2024 03:42:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pdGn9JtO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQnBe-0006Xf-3M; Fri, 19 Jan 2024 06:37:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBc-0006F3-6q
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:37:24 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQnBY-00030i-S5
 for qemu-arm@nongnu.org; Fri, 19 Jan 2024 06:37:23 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e913e3f03so7593195e9.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jan 2024 03:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705664239; x=1706269039; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dFDI//XvTpn1St0hBV0sdqL1iHcD9DD5+xWDU4qjjTU=;
 b=pdGn9JtO76ViFOkGKsvfbXZ4CWo1qTx3bP39Kqzb9rUhmPkIPIgGISZl/OR85c3ZLB
 aw3A8+20jAS5p49HNSu7Y8f860kaNvQY//Xs8uG7+yPgOqu94HHPZFEw2KONo3fhG/QA
 ztyjOcX3oyODeAJfmdbmPLRwAmae/xVbbOd7VjeMqgJlkN2p52XimtI6u7meeu3KCIoB
 3lieDp8R2VeAuXJcVG8D+d/h0o5Ei6Cvwkmtlq3IvFWIox3CvivMXOQNAgBfy3q/m1Qe
 MSnGyXDHmwwm1yqsCKX/SxvAooIvccs80g2TBOWZjh/9OZVxrksr/xUgPAZhzHimYJ6R
 C1oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705664239; x=1706269039;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dFDI//XvTpn1St0hBV0sdqL1iHcD9DD5+xWDU4qjjTU=;
 b=cOfeBycLCKd67xLJNc9DXce9ig2PRLYSNgHe2ryhzEf9zRVEFpDgcxsWtosfbUZ8c+
 t7TsNbeEmf6uHMaSeLe51GJsjCnyk4p5pAaUZgcJDukRZIUmCvMDW2h/8uIGK6PMAp83
 DWWdnK70FUz0Oo0S4/YxBqlyjeXDSNSIPIfh9Zzh0Ikv5znurCt3bFuyuc9gZUOhevXI
 kPL/zmbfIGgsyNJXvSNape+9NC0YtVsEKadrpLRitvj9DcwsUmDkEZ+ZsKvCb04rV5Qu
 0EL/nho/wLjTtJSt6rVGCuXMg2jnBl1mEicUnvzXaOC/UE6J/IIlnsDEV3w8XN6VvkN/
 Z5qQ==
X-Gm-Message-State: AOJu0YwWDyN+3U/9A/OY5U2rOoREfPgaOuInon6iI3MKdo0zdI+W/Z0W
 v3r3EPkGTT/2/hHny9QNhe7a86aLd0FaSQbwP8ROhpvqcNgxkaZNavv7sl8f60g=
X-Received: by 2002:a7b:c311:0:b0:40e:4252:e26 with SMTP id
 k17-20020a7bc311000000b0040e42520e26mr1417146wmj.69.1705664239333; 
 Fri, 19 Jan 2024 03:37:19 -0800 (PST)
Received: from localhost.localdomain (91-163-26-170.subs.proxad.net.
 [91.163.26.170]) by smtp.gmail.com with ESMTPSA id
 c11-20020a05600c0a4b00b0040d53588d94sm32738791wmq.46.2024.01.19.03.37.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 19 Jan 2024 03:37:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, qemu-block@nongnu.org,
 qemu-arm@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: [PULL 29/36] hw/scsi/esp-pci: use correct address register for PCI
 DMA transfers
Date: Fri, 19 Jan 2024 12:34:58 +0100
Message-ID: <20240119113507.31951-30-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240119113507.31951-1-philmd@linaro.org>
References: <20240119113507.31951-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: FeUualpJJs48

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

The current code in esp_pci_dma_memory_rw() sets the DMA address to the value
of the DMA_SPA (Starting Physical Address) register which is incorrect: this
means that for each callback from the SCSI layer the DMA address is set back
to the starting address.

In the case where only a single SCSI callback occurs (currently for transfer
lengths < 128kB) this works fine, however for larger transfers the DMA address
wraps back to the initial starting address, corrupting the buffer holding the
data transferred to the guest.

Fix esp_pci_dma_memory_rw() to use the DMA_WAC (Working Address Counter) for
the DMA address which is correctly incremented across multiple SCSI layer
transfers.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Tested-by: Guenter Roeck <linux@roeck-us.net>
Message-ID: <20240112131529.515642-2-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/scsi/esp-pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/esp-pci.c b/hw/scsi/esp-pci.c
index 93b3429e0f..7117725371 100644
--- a/hw/scsi/esp-pci.c
+++ b/hw/scsi/esp-pci.c
@@ -275,7 +275,7 @@ static void esp_pci_dma_memory_rw(PCIESPState *pci, uint8_t *buf, int len,
         qemu_log_mask(LOG_UNIMP, "am53c974: MDL transfer not implemented\n");
     }
 
-    addr = pci->dma_regs[DMA_SPA];
+    addr = pci->dma_regs[DMA_WAC];
     if (pci->dma_regs[DMA_WBC] < len) {
         len = pci->dma_regs[DMA_WBC];
     }
-- 
2.41.0

