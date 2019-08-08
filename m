Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7369856wrv;
        Wed, 7 Aug 2019 21:45:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy7DATsXX7pob15BAIrcHwMntubD+MGQ6UghaW9EAZ/lOwGo2C9vLGwEQf/Q/gsd8/IwGki
X-Received: by 2002:a05:6214:10c6:: with SMTP id r6mr11604267qvs.22.1565239539141;
        Wed, 07 Aug 2019 21:45:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565239539; cv=none;
        d=google.com; s=arc-20160816;
        b=Du2sBSN1V7T6PB3QzQgRWe0R1KbJ5nvy3/ADhh8jhbbwg7sv9svDFd27hPhukExXNR
         NblEoGJgSqkun17rjPmJSJhMT6+CjmbOEqT0elBMlOphVhzKhiF36ooF1YnfC+5qzd2S
         9JFPmRmNvU8tgzq9N0bE6yqTTYqh/hxO9xEz3ec0IqRerOpCB1nsrlY+UK0H1e7c1iH9
         eufor65WV2KoWwkoznKhvwu3t5cn+ouf1vElKt/6EWB8PTwROgghxIS7vc79ErJtFZkH
         8ODbt4YmYDwpTN5lE2iiaw8UIo/+fmbVzNv+CfOP3IetcOuuqkH/T3ymvy8qfNOY2NYi
         dIvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=E6yxnr+XaLfykr9binetZruI0I2aHRyZR2ZqXqM16+Q=;
        b=QncM0+q/PkuowQmP/s2dBOetWMJcKP5dzZxkaKpOXwcmFrHaCunbAZM2yEO2oxT6uJ
         tMDK1vifcUCswVDxT3R4OLenOhGqbQ0DNN+BIbwlfEEIZKiZotGZSnwDS0Khjej4qOi3
         QvvgiIxQ2B5TEPnfXFxnwfrStVJ+1MnIdvnt7qv+tFiKI/1sNVipqTaWeAU/HAnDZ2j2
         sfEzbABWsNi4E0tA6CHkYBZagP70mPU/CtzudxTJbsGrBWT8oSZxivwQ3aqo6pWa7+M/
         5iIJfPqKps+Qe+FOvPOHZST7StpzGs6IaMSk+DiRRC+O4GIAzdL3CKOe5apJLoPLQM74
         lkPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hUON9jRV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b9si54461651qvq.20.2019.08.07.21.45.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 21:45:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=hUON9jRV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvaJ0-0001om-LL
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 00:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52067)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvaIt-0001j7-PX
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 00:45:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <bmeng.cn@gmail.com>) id 1hvaIs-00058Y-TP
 for qemu-arm@nongnu.org; Thu, 08 Aug 2019 00:45:31 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:41238)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <bmeng.cn@gmail.com>)
 id 1hvaIq-00057B-O0; Thu, 08 Aug 2019 00:45:28 -0400
Received: by mail-pl1-x641.google.com with SMTP id m9so42825644pls.8;
 Wed, 07 Aug 2019 21:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=E6yxnr+XaLfykr9binetZruI0I2aHRyZR2ZqXqM16+Q=;
 b=hUON9jRVNF7N/A24B0IPUEFT28l8jnaBbCe5NxkH6Ul/h8+XxuLBlhXnjki8xVcquw
 zxrQ0yp0ywDQCwjutT7YOgpQSiOTbe/VFujGo5OdnbQMq1H3srkdDc8yRtRlk5IggUWm
 0AmESPv3m7T+duoVP2Rd1OF6dDV1Jp+387GHVgLqNTRWtSmNVAyuRDAUtbUpv+jiV9M5
 hgS3PIpvAj+jVSZdI850JvEGGWGSyd+VKATwjDKqQqdFXcQUq8DXNSJikHaN4841nC5K
 lSViqGmiahEDc6DQaZvewY1lquNwZ8pxQsbzkuMU3hlPlbdjrRwPWRJKH79Nmp9VpdtX
 GKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=E6yxnr+XaLfykr9binetZruI0I2aHRyZR2ZqXqM16+Q=;
 b=lbp8o+Gn5yGT6M+Oi4GBRkTfmWDtSdfZAaWI8svK1X9QBmgidAu2gPZFpBOpTtT1j8
 pmW1jPjB5TF7r6JPj21mCWW7obX7fcw2G5f6NSVCJJh/vIsmuraKbdG6btQAeQs8WSoN
 4S7MgP9N+EwqnyXjkVedsvEfbKp1I90yzzK4pURkgFCYn3zEBtv1VcXkRnzK8Tpa01aU
 W2FTO3hXIwXSLOZwiIsarH7fthpb4ocICHPHFIjfRA/wWSwYB5u7Q02SlXb2FXzQFPLY
 K0DerqHafc4ELZKEuo5eA/aAfJeOZTBfdRGm2zU+3VHqsK7bXsdG/ikz6wzsZal7kPzq
 JUkA==
X-Gm-Message-State: APjAAAUwB3Qyd/zZgGcAlyzOXQyt26mDvGpZn744VmoMrgl/J9Kugrjq
 aPJF1X7KOJ2gUczH2etgfdE=
X-Received: by 2002:a17:902:b949:: with SMTP id
 h9mr10738694pls.120.1565239527351; 
 Wed, 07 Aug 2019 21:45:27 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com.
 [147.11.224.80])
 by smtp.gmail.com with ESMTPSA id h26sm98458499pfq.64.2019.08.07.21.45.26
 (version=TLS1 cipher=AES128-SHA bits=128/128);
 Wed, 07 Aug 2019 21:45:26 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Garzarella <sgarzare@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Date: Wed,  7 Aug 2019 21:44:39 -0700
Message-Id: <1565239479-2130-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1565020374-23888-1-git-send-email-bmeng.cn@gmail.com>
References: <1565020374-23888-1-git-send-email-bmeng.cn@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: [Qemu-arm] [PATCH v2] hw: net: cadence_gem: Fix build errors in
 DB_PRINT()
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sIbHVjQqSNTd

When CADENCE_GEM_ERR_DEBUG is turned on, there are several
compilation errors in DB_PRINT(). Fix them.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

---

Changes in v2:
- use HWADDR_PRIx instead of TARGET_FMT_plx for consistency
- use 'z' modifier to print sizeof(..)

 hw/net/cadence_gem.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
index d412085..b6ff2c1 100644
--- a/hw/net/cadence_gem.c
+++ b/hw/net/cadence_gem.c
@@ -983,8 +983,9 @@ static ssize_t gem_receive(NetClientState *nc, const uint8_t *buf, size_t size)
             return -1;
         }
 
-        DB_PRINT("copy %d bytes to 0x%x\n", MIN(bytes_to_copy, rxbufsize),
-                rx_desc_get_buffer(s->rx_desc[q]));
+        DB_PRINT("copy %d bytes to 0x%" HWADDR_PRIx "\n",
+                 MIN(bytes_to_copy, rxbufsize),
+                 rx_desc_get_buffer(s, s->rx_desc[q]));
 
         /* Copy packet data to emulated DMA buffer */
         address_space_write(&s->dma_as, rx_desc_get_buffer(s, s->rx_desc[q]) +
@@ -1157,7 +1158,7 @@ static void gem_transmit(CadenceGEMState *s)
             if (tx_desc_get_length(desc) > sizeof(tx_packet) -
                                                (p - tx_packet)) {
                 DB_PRINT("TX descriptor @ 0x%x too large: size 0x%x space " \
-                         "0x%x\n", (unsigned)packet_desc_addr,
+                         "0x%zx\n", (unsigned)packet_desc_addr,
                          (unsigned)tx_desc_get_length(desc),
                          sizeof(tx_packet) - (p - tx_packet));
                 break;
-- 
2.7.4

