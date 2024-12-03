Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3825918njk;
        Tue, 3 Dec 2024 08:26:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWjEmG+KatXs0lhh3hWQj+jeU11p7FQ8Bl9/rJ/LHpj70T2GzLR0DtlZO2eDsrSo88Tk17SH3yS9tZm/g==@linaro.org
X-Google-Smtp-Source: AGHT+IFJf8hFQOMY05KX+w2FMAkxRQsJbGNkONS7VBKsHLceA9J6GXSScPoYxOl+U2OvdzytdNNF
X-Received: by 2002:a05:6122:2221:b0:514:f579:3b8b with SMTP id 71dfb90a1353d-515bf52f8c4mr5362799e0c.9.1733243189304;
        Tue, 03 Dec 2024 08:26:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733243189; cv=none;
        d=google.com; s=arc-20240605;
        b=ayzuvP5HjO8QsMw/OMaoGjCmGLNj5t5A9nNF6D/FJPaudSGVIwDgipdn9s4uvwut4V
         bNOgK3V72mVM+ms3l6NybFBEc1N7214ir4HNeD1GGQmPFrUAqsxj/f/aKsmiz0anvZAf
         9y6MPYw+D8UCeRuZtd9s0bt/2ahX4C1ReX8Y2npgcUBy9BaXZBb+rHBdaRomgvf7ywcc
         56atBmL35tjcDmKYPq9dIbULkVhlWJM5jg7uyciy2hLZhG5bhJ/pk1FYm9KcP0O6uIV1
         keCNddS9cOZx98L1kQXW2vb3YzRAiyNZ/ROVxmhq/FWkcvlprxefrMy58MG83/5W5m1X
         bBHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=f/p7JVm/AHJqj/WWdClhGWZ0lAMY+FX8xizp7D61SKE=;
        fh=CsmVR33KZH0/aIF0FLmpzzqNrmKEgsx6navZVp+wSOI=;
        b=S2OUO8UFlQlEecz8q/+2j8GrH3uo4TjDFA0ftXjzH5tIbBfRuiDz3FALjp/E8hCPlf
         0tAXi2vMEiSpmoPAcCJFHrJMIzIxYY0rLacM6GLRrmYdykonaQPcP5TBIJtDPb3nQE8K
         whfKzZGIQL+Zq35d9j1NBw1JYfbioSLe2jfVYvrVvw6U7tf7EG80tbpkyG2fMJiJlJuP
         6rMTy83LSp4qNrhPzag/QEEIfFaRfEo7y5VLIGOmeLIFDO0RNIePTMTzpYr0pF/BwUDc
         QYP4P1SLlncJhCoZ67pQQDzfSv/r9tQGmyk+Vsg7z8iAswEJcghx3pnkLdXpw6CzTWdA
         rgug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5156d1546absi4835770e0c.256.2024.12.03.08.26.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 08:26:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tIViu-0005mR-G9; Tue, 03 Dec 2024 11:26:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abelova@astralinux.ru>)
 id 1tIVin-0005kx-Cv; Tue, 03 Dec 2024 11:25:57 -0500
Received: from mail-gw02.astralinux.ru ([195.16.41.108])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <abelova@astralinux.ru>)
 id 1tIVik-0007qi-PE; Tue, 03 Dec 2024 11:25:56 -0500
Received: from gca-msk-a-srv-ksmg01.astralinux.ru (localhost [127.0.0.1])
 by mail-gw02.astralinux.ru (Postfix) with ESMTP id 158521FA08;
 Tue,  3 Dec 2024 19:25:44 +0300 (MSK)
Received: from new-mail.astralinux.ru (gca-yc-ruca-srv-mail03.astralinux.ru
 [10.177.185.108])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail-gw02.astralinux.ru (Postfix) with ESMTPS;
 Tue,  3 Dec 2024 19:25:41 +0300 (MSK)
Received: from localhost.localdomain (unknown [10.198.4.245])
 by new-mail.astralinux.ru (Postfix) with ESMTPA id 4Y2mGp2FhJz1gywd;
 Tue,  3 Dec 2024 19:25:36 +0300 (MSK)
From: Anastasia Belova <abelova@astralinux.ru>
To: Joel Stanley <joel@jms.id.au>,
	qemu-devel@nongnu.org
Cc: Anastasia Belova <abelova@astralinux.ru>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 sdl.qemu@linuxtesting.org
Subject: [PATCH] hw/timer/nrf51_timer: prevent integer overflow
Date: Tue,  3 Dec 2024 19:25:23 +0300
Message-ID: <20241203162525.75156-1-abelova@astralinux.ru>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-KSMG-AntiPhishing: NotDetected
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Envelope-From: abelova@astralinux.ru
X-KSMG-AntiSpam-Info: LuaCore: 44 0.3.44
 5149b91aab9eaefa5f6630aab0c7a7210c633ab6,
 {Tracking_from_domain_doesnt_match_to}, astralinux.ru:7.1.1;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; new-mail.astralinux.ru:7.1.1;
 127.0.0.199:7.1.2, FromAlignment: s
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiSpam-Lua-Profiles: 189586 [Dec 03 2024]
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.1.0.7854,
 bases: 2024/12/03 11:06:00 #26930054
X-KSMG-AntiVirus-Status: NotDetected, skipped
X-KSMG-LinksScanning: NotDetected
X-KSMG-Message-Action: skipped
X-KSMG-Rule-ID: 1
Received-SPF: pass client-ip=195.16.41.108; envelope-from=abelova@astralinux.ru;
 helo=mail-gw02.astralinux.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6WlapWJwpJs5

Both counter and tick are uint32_t and the result
of their addition may not fit this type. Add
explicit casting to uint64_t.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: c5a4829c08 ("hw/timer/nrf51_timer: Add nRF51 Timer peripheral")
Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
---
 hw/timer/nrf51_timer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/timer/nrf51_timer.c b/hw/timer/nrf51_timer.c
index 35b0e62d5b..b5ff235eb8 100644
--- a/hw/timer/nrf51_timer.c
+++ b/hw/timer/nrf51_timer.c
@@ -44,7 +44,7 @@ static uint32_t update_counter(NRF51TimerState *s, int64_t now)
 {
     uint32_t ticks = ns_to_ticks(s, now - s->update_counter_ns);
 
-    s->counter = (s->counter + ticks) % BIT(bitwidths[s->bitmode]);
+    s->counter = ((uint64_t)s->counter + ticks) % BIT(bitwidths[s->bitmode]);
     /*
      * Only advance the sync time to the timestamp of the last tick,
      * not all the way to 'now', so we don't lose time if we do
-- 
2.47.0

