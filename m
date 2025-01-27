Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2319309njk;
        Mon, 27 Jan 2025 01:44:36 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUxoSX2oqL4V12cnvo5p0mvz0ZoFiDNf+DrLU7x52IMzi4Lgfzxpc3aRlB7RGLVOX30dGyR3o6KXTTHLQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEXUoO12ecJ7iGKnPHyQ8li1qMmkUBIXUHD/5KnNh+K1Kcbs3VK0gjr0V4ykbpnKuQPgywu
X-Received: by 2002:a05:620a:489a:b0:7b1:5763:4ba2 with SMTP id af79cd13be357-7be6327cfc8mr7160939285a.40.1737971076574;
        Mon, 27 Jan 2025 01:44:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737971076; cv=none;
        d=google.com; s=arc-20240605;
        b=WjiqQRhwDqQ/4dVCUYh6ar5OK8z5avYr/zv1yup9dzda7IEbX9XEM7MZUK0yk7hR4Y
         DGvt5iQ3wC+wb/pupg2LJ+pN0LM8jBgpxHDeqrwlReB1xLAAPEAXaQOiZ1RXHS/0sg/W
         uv49Y+rKWt+3NsmJVsXGyl7fuY+AnbfqIwox1w1L3XdOP3ulCpVpTJUI+C10G4OOF/QQ
         l3ZZPFB8tCpaypwyffAlufaBfN6bZkYPbrfcy5o2wxuQJH9gNsFOFPoIp+b9iyXo0SRH
         HZkh4Y9pJudxeFo92Ujsi98y3qEINLBwr+8jFnyjKWU82ZsSHWIYBljxh0mRB8FfM4OC
         dAAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=p6s+7NVk506ALVEPszFy+Eer+9rPYx0uwkZKzfm5JM8=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=S7Hf9wFoKBRzcVVXOZgelMXI7fXv/zeZwUjPJzBwfxwjX97fQ+EYwq2muhjrWRzQIq
         +/Ifw4f+uhETliaV2d5LMtIyer1526cE4EscoLWci70j0Z501rC4gZsc12pC6fVeuB6G
         2b0hZa1QUfmAw3NC2w/1NwReX+Wus2+iyAZTkxnfD5mMDEvk5eykz4dcNcfp8phBHfCb
         ziRxE2ZZw4uvFWS7eiN4SWEBZpeTT9yfkmxjikhIm8bA+xwpX744eYBhUQ1GCgFmeP6o
         wEb+gbB/cbL93jywyt7Y0kPOlwQER7wfqAslT7dzRldklYIfP0n3URXkacbNimZJ75JL
         hWWw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YXiy9FQG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af127cfsi917856385a.581.2025.01.27.01.44.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 01:44:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YXiy9FQG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcLfS-0007Z0-5S; Mon, 27 Jan 2025 04:44:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLeR-0006Ua-6J
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 04:43:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tcLeP-0005Tr-2q
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 04:43:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737971004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p6s+7NVk506ALVEPszFy+Eer+9rPYx0uwkZKzfm5JM8=;
 b=YXiy9FQGs3en7YIC5vLLLFRaRBhszcYsfXYxSIyNyNsHRoDsDyzyLAG7goAHJgARLrHuV4
 QUwXBMv/UdEsQHDharOb5YjDhJ8JKgkX/3tiCzt0WzjyCils5+3cfWjI1Pf/x1RfLNBwhR
 0ql/e54/70vwZ/Rw2KAYk1YlFKqfTt8=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562--jLFxTMnPry1QKNSZQ3BlQ-1; Mon,
 27 Jan 2025 04:43:20 -0500
X-MC-Unique: -jLFxTMnPry1QKNSZQ3BlQ-1
X-Mimecast-MFC-AGG-ID: -jLFxTMnPry1QKNSZQ3BlQ
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 88B3919560AB; Mon, 27 Jan 2025 09:43:18 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.63])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 06C6C18008C0; Mon, 27 Jan 2025 09:43:16 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 11/12] aspeed/wdt: Support software reset mode for AST2600
Date: Mon, 27 Jan 2025 10:42:38 +0100
Message-ID: <20250127094239.636526-12-clg@redhat.com>
In-Reply-To: <20250127094239.636526-1-clg@redhat.com>
References: <20250127094239.636526-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: tShRQr4aUFrb

From: Jamin Lin <jamin_lin@aspeedtech.com>

On the AST2400 and AST2500 platforms, the system can only be reset by enabling
the WDT (Watchdog Timer) and waiting for the WDT timeout. However, starting
from the AST2600 platform, the reset event can be triggered directly and
intentionally by software, without relying on the WDT timeout.

This mechanism, referred to as "software restart", is implemented in hardware.
When using the software restart mechanism, the WDT counter is not enabled.

To trigger a reset generation in software mode, write 0xAEEDF123 to register
0x24 and software mode reset only support SOC reset mode.

A new function, "aspeed_wdt_is_soc_reset_mode", is introduced to determine
whether the SoC reset mode is active.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250124030249.1706996-3-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/watchdog/wdt_aspeed.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/watchdog/wdt_aspeed.c b/hw/watchdog/wdt_aspeed.c
index 22e94e7b9c99..d94b83c10934 100644
--- a/hw/watchdog/wdt_aspeed.c
+++ b/hw/watchdog/wdt_aspeed.c
@@ -51,11 +51,20 @@
 #define WDT_TIMEOUT_CLEAR               (0x14 / 4)
 
 #define WDT_RESTART_MAGIC               0x4755
+#define WDT_SW_RESET_ENABLE             0xAEEDF123
 
 #define AST2600_SCU_RESET_CONTROL1      (0x40 / 4)
 #define SCU_RESET_CONTROL1              (0x04 / 4)
 #define    SCU_RESET_SDRAM              BIT(0)
 
+static bool aspeed_wdt_is_soc_reset_mode(const AspeedWDTState *s)
+{
+    uint32_t mode;
+
+    mode = extract32(s->regs[WDT_CTRL], 5, 2);
+    return (mode == WDT_CTRL_RESET_MODE_SOC);
+}
+
 static bool aspeed_wdt_is_enabled(const AspeedWDTState *s)
 {
     return s->regs[WDT_CTRL] & WDT_CTRL_ENABLE;
@@ -199,13 +208,18 @@ static void aspeed_wdt_write(void *opaque, hwaddr offset, uint64_t data,
     case WDT_TIMEOUT_STATUS:
     case WDT_TIMEOUT_CLEAR:
     case WDT_RESET_MASK2:
-    case WDT_SW_RESET_CTRL:
     case WDT_SW_RESET_MASK1:
     case WDT_SW_RESET_MASK2:
         qemu_log_mask(LOG_UNIMP,
                       "%s: uninmplemented write at offset 0x%" HWADDR_PRIx "\n",
                       __func__, offset);
         break;
+    case WDT_SW_RESET_CTRL:
+        if (aspeed_wdt_is_soc_reset_mode(s) &&
+            (data == WDT_SW_RESET_ENABLE)) {
+            watchdog_perform_action();
+        }
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
-- 
2.48.1

