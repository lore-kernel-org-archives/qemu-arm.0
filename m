Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2005711ejc;
        Sun, 8 Jan 2023 22:00:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuwnm5Yw6/UiF+T0kUO5IpJyJMjKBWyjX+1rouPPWDDF1JkWETa80ofUf3TZLEL3vv4IcmT
X-Received: by 2002:ac8:5142:0:b0:3a7:f2b0:c4b7 with SMTP id h2-20020ac85142000000b003a7f2b0c4b7mr86240499qtn.57.1673244001185;
        Sun, 08 Jan 2023 22:00:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673244001; cv=none;
        d=google.com; s=arc-20160816;
        b=SHU526ZfTcsWfyCR+PtVtKF5EgMxMfQqq1FudAwMALnIekcNDYzM0HtMC4/9+QQdRO
         BEZWjHJliopXJk9fV5Tlsj3eKxkPE2xuC3sKBLrWH1CXIL/nZEa2DEvewb5s6d6Wwts+
         TjvTQZJpjMSEQDROweMB9ji89nwlk1n/N46h+quI/MwwhZthT0S306KujjgBsdqDiUr+
         kPQuMD7PGUY8dtYNRj0hphD+h+yXpkiVQOzIUhJkwZqyWjoV8MEZt6blJ9E38QuyVzLQ
         TjFa5Dzz87id8NJdIGlOkiGSmvKTQmbJksAcrKldc0Cdy7YMrkmzzO0JMEcjJNmNCDvI
         UByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=A226SjWALClfAjF/coonvJW4GVbEELg9sbyExdpvlsw=;
        b=pK4V6zTid0vvWpWXRhU/utDcNN5U3pJ66osiTGVCtx2e5pOc6q1ido25HzAfGpzAuD
         UAjvhaNBPW7T2YiR833W160UJWhLvotRo8mL0RHCk7LqIQsLROTOXq7xM+aorUUjlfPN
         w+5GZOog+SUtsnrhjqE0wi1FhAdP0ODd8SVZdsGkfGUE/54aXvLDZse7aB/pclQ4K+3I
         iRtiRZiyth31udPkGYWeQWSLbdU/rL70AoEitqGnHA1bfonRI6b0AC4IN8fKKlYDkmMp
         233jr0z9T9zPNbU8B2sGiB0yHkkDkqJhiPewUoZ7emG9VHhUaUs+vHgQu0LlQWn1RE/q
         1Dig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ee16-20020a05620a801000b00705b5fa09fbsi1244078qkb.292.2023.01.08.22.00.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 08 Jan 2023 22:00:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pElCH-0008CY-KW; Mon, 09 Jan 2023 00:59:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pElCG-0008CB-MG; Mon, 09 Jan 2023 00:59:48 -0500
Received: from [125.119.240.50] (helo=liuqiang-OptiPlex-7060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cyruscyliu@gmail.com>)
 id 1pElCE-0002QM-RW; Mon, 09 Jan 2023 00:59:48 -0500
Received: from localhost (liuqiang-OptiPlex-7060 [local])
 by liuqiang-OptiPlex-7060 (OpenSMTPD) with ESMTPA id 76a145aa;
 Mon, 9 Jan 2023 05:59:37 +0000 (UTC)
From: Qiang Liu <cyruscyliu@gmail.com>
To: qemu-devel@nongnu.org
Cc: Qiang Liu <cyruscyliu@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:Xilinx ZynqMP and...)
Subject: [PATCH] hw/display/xlnx_dp: fix overflow in xlnx_dp_aux_push_tx_fifo()
Date: Mon,  9 Jan 2023 13:59:33 +0800
Message-Id: <20230109055933.749233-1-cyruscyliu@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 125.119.240.50 (failed)
Received-SPF: softfail client-ip=125.119.240.50;
 envelope-from=cyruscyliu@gmail.com; helo=liuqiang-OptiPlex-7060
X-Spam_score_int: 48
X-Spam_score: 4.8
X-Spam_bar: ++++
X-Spam_report: (4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FROM=0.001, FSL_HELO_NON_FQDN_1=0.001,
 HELO_NO_DOMAIN=0.001, NML_ADSP_CUSTOM_MED=0.9, RCVD_IN_PBL=3.335,
 RDNS_NONE=0.793, SPF_SOFTFAIL=0.665, SPOOFED_FREEMAIL=0.001,
 SPOOFED_FREEMAIL_NO_RDNS=0.001, SPOOF_GMAIL_MID=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
X-TUID: NeKMw7jFXGFb

This patch checks if the s->tx_fifo is full.

Fixes: 58ac482a66de ("introduce xlnx-dp")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1424
Reported-by: Qiang Liu <cyruscyliu@gmail.com>
Signed-off-by: Qiang Liu <cyruscyliu@gmail.com>
---
 hw/display/xlnx_dp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 972473d94f..617b394af2 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -854,7 +854,11 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, uint64_t value,
         break;
     case DP_AUX_WRITE_FIFO: {
         uint8_t c = value;
-        xlnx_dp_aux_push_tx_fifo(s, &c, 1);
+        if (fifo8_is_full(&s->tx_fifo)) {
+            qemu_log_mask(LOG_GUEST_ERROR, "xlnx_dp: TX fifo is full");
+        } else {
+            xlnx_dp_aux_push_tx_fifo(s, &c, 1);
+        }
         break;
     }
     case DP_AUX_CLOCK_DIVIDER:
-- 
2.25.1

