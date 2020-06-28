Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2093139lfm;
        Sun, 28 Jun 2020 04:41:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7qv6uGVvRJzDAVXwq4+EQVlw8RC6BpPQ2TpL75gQ4uIqvUUXW/ay5JUK0Yi1QjKy7l3pp
X-Received: by 2002:a25:bc47:: with SMTP id d7mr19015184ybk.180.1593344511779;
        Sun, 28 Jun 2020 04:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593344511; cv=none;
        d=google.com; s=arc-20160816;
        b=NHx3ma99Bfi7DlKcyW0wXxdQc7w6hPKDO+CNkp+NN03POldTkfDQZIGGn6yDFWYUHi
         b4jm5CA+atBJy3A7tCuA8OljYDGACZW2Y4k8KZUO8VkQHpJmh5v1ND4OuHT5iIoELc+F
         2p6+I7jDUCd/F+U0R57oD44DkQLFWAaNp0jbdvYt6Q31f/79oIgJu/0VsxParONnwo/S
         geVCJXjMKhqhLMxe9M+5t5oSeIEPImmdpaVuDVkdgLA50yTWFnrWAGyJT5YJy16DM0XJ
         1c89HFat4PRXlcGmv5o7fifI8o2ILVlbW1K0POruGmvTg/TTEKl/A4gckDsvBxmse1Qj
         PisA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=qQ7KhWLM70SKr/8xeZkY9OAmuoyEXa2XjMmlR4yRXUc=;
        b=V6uzcP2GONoD8Ce8fgV/tQ/fOXdZFjIgYZjkO0DKbnAX4Vtuopm4O5hUx8hdjvy7ej
         MNUcmTWU6t/ase797HrJVnNYG6UySTHYrM6ceIR+hJwMMSi423R2FTfEkS9bZxi7DXE+
         WWqZZ/mOPEWX+Sh3a7VZJGQuwkrc426s5Jakx0b9ANv7qnlfUSudkEgQBgxL53mswHZ4
         H/MdAa/kLhilhkpdFKFvIyTmZlgFEb5sxWQ2XZYUof87wuOlUjSb2euRzQdJrwlJ9/3W
         iGiwcjrtRkkaMKVYXuRKy8EorNNXk1xC93tBHXyecATESv58rNUWVskqBwrljoEVcV/c
         ezjw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="d7yuzF/3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 125si23206511ybi.104.2020.06.28.04.41.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jun 2020 04:41:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="d7yuzF/3";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpVh1-0006jK-6k
	for alex.bennee@linaro.org; Sun, 28 Jun 2020 07:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <erik.lucas.smit@gmail.com>)
 id 1jpVgm-0006iz-Ua; Sun, 28 Jun 2020 07:41:37 -0400
Received: from mail-ed1-x543.google.com ([2a00:1450:4864:20::543]:41854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <erik.lucas.smit@gmail.com>)
 id 1jpVgl-00005E-9N; Sun, 28 Jun 2020 07:41:36 -0400
Received: by mail-ed1-x543.google.com with SMTP id e22so10359955edq.8;
 Sun, 28 Jun 2020 04:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qQ7KhWLM70SKr/8xeZkY9OAmuoyEXa2XjMmlR4yRXUc=;
 b=d7yuzF/3ZZHbqZTtfmHIW6Ja+pCwlXNVY8BFIfMkKc8D4p/k3lSYVxlmmVd97/IuVj
 kNwl0tuFHiq3U2DVxk9YKTm9spp2mdgtIvrHtt5b/tNxpUCRPXDePQzJQFPZmzrQ8ErY
 V1+ocZG43hEN9Mo1bmK+JgYNX0FAoMGvhYklVTZl2iu56n6PUR4edUeUkpM2J6wtW6O5
 ZpBwuC2pNqtbvbTsROIfP5g9js72E/A4fEk4YKHfJdh2xlkvTkW/wixN3Y1q8WqVOrxX
 opAogYPJqPm7PVIaEho5eUg2sywWdRespU6AQxLwAxSE7vIPpJ0XhBJoJpYfA0rp5J0b
 fAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qQ7KhWLM70SKr/8xeZkY9OAmuoyEXa2XjMmlR4yRXUc=;
 b=tKhgwJUSuidhWYxi2uk/Xji+xunG8FuW+up0kPskUDNhk7UVQjvi5LKACGkqVLaJ6P
 +MBlmZrr8f7IU6yOvrJZiQKiJ90P0Spi8cPLw8i/xsPWjr8N/umlrlB2TT0FRVzWfdzi
 KFWOjRk9DNZVyotFwxvYvQDy1D33Ovsm2PVF5u8s6Dbpl8LCJSOeIt/1MZ8vL0e2ailL
 bUrRQJ5HHCR17N/Lgb9MMzL/NF02eM2zDVohp/FttT9rNO7M8h8kYLemrwlDip4YZa5r
 QHxH+eab5XDuOBM+BjOhGaKN+msb/ia3BoKZTE8IyI+EY6ryZ2Pt0Eo+VwEL74tbMcLi
 zj7g==
X-Gm-Message-State: AOAM533AXTHQ6QVuunan2TxKrr9Pi240H96Q0KW4XOh6UyKOGswD4qk+
 ZtJJuTFqbqqT0t/6mtD+Gdg=
X-Received: by 2002:a05:6402:22a5:: with SMTP id
 cx5mr12972971edb.246.1593344492859; 
 Sun, 28 Jun 2020 04:41:32 -0700 (PDT)
Received: from Tank.localdomain (82-73-161-131.cable.dynamic.v4.ziggo.nl.
 [82.73.161.131])
 by smtp.gmail.com with ESMTPSA id s1sm19253904edy.1.2020.06.28.04.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 04:41:32 -0700 (PDT)
From: erik-smit <erik.lucas.smit@gmail.com>
To: erik.lucas.smit@gmail.com
Subject: [PATCH] ftgmac100: fix dblac write test
Date: Sun, 28 Jun 2020 13:40:58 +0200
Message-Id: <20200628114057.6666-1-erik.lucas.smit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::543;
 envelope-from=erik.lucas.smit@gmail.com; helo=mail-ed1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pYuexs5ot3dz

The test of the write of the dblac register was testing the old value
instead of the new value. This would accept the write of an invalid value
but subsequently refuse any following valid writes.

Signed-off-by: erik-smit <erik.lucas.smit@gmail.com>
---
 hw/net/ftgmac100.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 043ba61b86..9db0d27ea6 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -810,16 +810,16 @@ static void ftgmac100_write(void *opaque, hwaddr addr,
         s->phydata = value & 0xffff;
         break;
     case FTGMAC100_DBLAC: /* DMA Burst Length and Arbitration Control */
-        if (FTGMAC100_DBLAC_TXDES_SIZE(s->dblac) < sizeof(FTGMAC100Desc)) {
+        if (FTGMAC100_DBLAC_TXDES_SIZE(value) < sizeof(FTGMAC100Desc)) {
             qemu_log_mask(LOG_GUEST_ERROR,
-                          "%s: transmit descriptor too small : %d bytes\n",
-                          __func__, FTGMAC100_DBLAC_TXDES_SIZE(s->dblac));
+                          "%s: transmit descriptor too small : %ld bytes\n",
+                          __func__, FTGMAC100_DBLAC_TXDES_SIZE(value));
             break;
         }
-        if (FTGMAC100_DBLAC_RXDES_SIZE(s->dblac) < sizeof(FTGMAC100Desc)) {
+        if (FTGMAC100_DBLAC_RXDES_SIZE(value) < sizeof(FTGMAC100Desc)) {
             qemu_log_mask(LOG_GUEST_ERROR,
-                          "%s: receive descriptor too small : %d bytes\n",
-                          __func__, FTGMAC100_DBLAC_RXDES_SIZE(s->dblac));
+                          "%s: receive descriptor too small : %ld bytes\n",
+                          __func__, FTGMAC100_DBLAC_RXDES_SIZE(value));
             break;
         }
         s->dblac = value;
-- 
2.25.1

