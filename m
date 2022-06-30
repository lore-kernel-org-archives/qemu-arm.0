Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp253457lft;
        Thu, 30 Jun 2022 04:25:54 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1scZJb9FRh78W3jh2ZinldfQMDrB6ZwGDJ5yKhjH1u9Mr1uBS1qyMtlXpve/GwjlqT9kRSt
X-Received: by 2002:a05:6214:1d2e:b0:470:686a:f5e5 with SMTP id f14-20020a0562141d2e00b00470686af5e5mr10871219qvd.24.1656588354643;
        Thu, 30 Jun 2022 04:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656588354; cv=none;
        d=google.com; s=arc-20160816;
        b=t4rHuwLZaaPC2iwPFPlcRL7ZCUvVEXHuvWRhyU5u/02aiFYwysJBU7j/bzRP6au7x9
         +pi9+Oqc/Zms8CzWqYLKC7Oj0lvlyKEROpH7fIDuHx+FXwh1YT0Kl6lyAtlv8oWBG+Rw
         SDo8qsOaE+f71haPCGZxYqnrNxvXuga3yGgOqN1Q5rWL04vgy9rNrDEBefkHcMFdCEFf
         zYB5rKOqMLEuguGdcSP2fAgGIcM9Vp3cmRXO6K1GaCoKDDqJhNTqptDs79ZFCF51CXZf
         LCU+tceu0wbBid0rWXVVXkt+prSAQBsPQrZtiJlIqHQNZWnnP/VI3o7bRxg3gZlg9/nD
         UagA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=Gvr49MLenMCDMz+2cS9AxaxbFebEHx7LN00h2MZjTHc=;
        b=ovppyduqqVjd0IAr/rYZAbEovRIeKpe0YDjySeANkjXUYs5q6Fga9dGeDgWDrNwzWG
         cyrynaQmRO5eMnv6R+1DU0jdeAQreos4yY5GkMAsT+RjkleaWnsrulaHxvj2Z2yOjboD
         Wt2el6T9aWjzP2UdNbmL7sNluGXzA0oUscwyFgnT/USYktcsz9LX5WLWTQ3gglB3HuE6
         2ryn42L9bJJy9Bj/bkF5fiVJMbuMimDaKq82iuptuucmHoWEZB8AMfkxbFmFCWLuGecm
         Dsmm3pzHN6v8c8zOUoP5vagyjyMcSUJt0KFaJtYtykh0FJZ1s/4Dm9XLriXqzHpaTJAs
         dYIA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eq3-20020ad45963000000b0046b8e864d2bsi10922904qvb.106.2022.06.30.04.25.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jun 2022 04:25:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6sJ0-0000Si-02
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 07:25:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHh-00074P-Nv; Thu, 30 Jun 2022 07:24:33 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:60855)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org>)
 id 1o6sHg-0001yZ-4M; Thu, 30 Jun 2022 07:24:33 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4LYbZj539fz4xYY;
 Thu, 30 Jun 2022 21:24:29 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LYbZg4q3dz4xD5;
 Thu, 30 Jun 2022 21:24:27 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>
Subject: [PULL 04/27] aspeed/scu: Add trace events for read ops
Date: Thu, 30 Jun 2022 13:23:48 +0200
Message-Id: <20220630112411.1474431-5-clg@kaod.org>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220630112411.1474431-1-clg@kaod.org>
References: <20220630112411.1474431-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=N4Bw=XF=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L0g9GH/5AliN

Reviewed-by: Peter Delevoryas <pdel@fb.com>
Message-Id: <20220628154740.1117349-2-clg@kaod.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_scu.c | 2 ++
 hw/misc/trace-events | 1 +
 2 files changed, 3 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 19b03471fc4e..83353649064a 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -270,6 +270,7 @@ static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
         break;
     }
 
+    trace_aspeed_scu_read(offset, size, s->regs[reg]);
     return s->regs[reg];
 }
 
@@ -637,6 +638,7 @@ static uint64_t aspeed_ast2600_scu_read(void *opaque, hwaddr offset,
         break;
     }
 
+    trace_aspeed_scu_read(offset, size, s->regs[reg]);
     return s->regs[reg];
 }
 
diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index c5e37b01547f..f776f24fb5d1 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -69,6 +69,7 @@ slavio_led_mem_readw(uint32_t ret) "Read diagnostic LED 0x%04x"
 
 # aspeed_scu.c
 aspeed_scu_write(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
+aspeed_scu_read(uint64_t offset, unsigned size, uint32_t data) "To 0x%" PRIx64 " of size %u: 0x%" PRIx32
 
 # mps2-scc.c
 mps2_scc_read(uint64_t offset, uint64_t data, unsigned size) "MPS2 SCC read: offset 0x%" PRIx64 " data 0x%" PRIx64 " size %u"
-- 
2.35.3

