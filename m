Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp2440925njm;
        Wed, 3 Jul 2024 01:18:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX49FWxS9LSdPtGpcHW8gNmWRzPgw3jPEtKoVDaHBHYQy0Piq/DQOhUwU9SKyi1E1xZUvruH7CsXQ82VLQ0aiCRIa4N90gZ
X-Google-Smtp-Source: AGHT+IGeeJVhHSFJS2putv6Pgk61RVyWvikdYJOePhV6SpgVIjA+KaBu5CtyH3X8bsY+C7EH8lfx
X-Received: by 2002:a05:622a:88:b0:444:ff0b:ada7 with SMTP id d75a77b69052e-44662e5a352mr134373881cf.49.1719994714390;
        Wed, 03 Jul 2024 01:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719994714; cv=none;
        d=google.com; s=arc-20160816;
        b=ilOgC1MyfiG0bPqvRbJnoKRu/8HSDhyFSxYaQZ/YyeG/H513YxGi2x5B88UyTez02U
         GWdcaIo7a6/5g6yfAZhzmwSx29ifXuDx9r6MFRQCSOe/vmGMkX38MA0MII9BJoEoQAU8
         qhK8Taw67iUifJ5dmHCt94VLkU8d1FWgX/cRfxW+fSnXn7Ghy8sBa9dz46FjgYBE59LU
         dNe9lRB1ibHSVqq3wIxAaLmKEbYXO7gd//WycDVar9Tl6gRDHvuHr3TfENvL2oegAd19
         B2wnpzxagqksHvmn7KvS17eosmefFdRrZN7G36D9NP6bUVgMQcY7Nwt45koqUVuunBav
         pOIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=t+oWEIIbtrDWkPJ8pJmkqIF1ll4jxwFCMxYrpoxD5/w=;
        fh=Vva0SnTfFpZ62XWQNW5X4TL2jFj5cBikmg9Gp1PrOrY=;
        b=tZk5vEbflp04nXpqyYPsDG6if7Mb/Y+zIEqn0anki0Ykxe4t7Tkr/GmpfD225B1Dqb
         356ytEM3D9WykpUiQ4a3uQPnRX9JokIdyCA1JhFvdw5iTeUir48Q/DDfOfWdRbg8GF54
         iJWxxeqvP5aOFW/g3+gejrTrQ+OESb46g1LBI4Qwh/8fl3Ix9PCtwzM/SGHYdrgpxHmp
         7lzsy4HzID9tIYUsUldjMbcoGl2EVbxoK7Buj0ZKSgGora7VAlYReiXVEzSUOrSUG8n0
         9KIsZuWcryM7171EsZJVTyTHfqTH7zYnlDXdOg+STgoX6cGWveunefj2RM5rMGhlUVvY
         UvVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-446514c1b1esi117635131cf.554.2024.07.03.01.18.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 01:18:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOvAq-0003Lo-C6; Wed, 03 Jul 2024 04:17:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sOvAp-0003LG-DW; Wed, 03 Jul 2024 04:17:07 -0400
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamin_lin@aspeedtech.com>)
 id 1sOvAo-00014r-0X; Wed, 03 Jul 2024 04:17:07 -0400
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.1258.12; Wed, 3 Jul
 2024 16:16:25 +0800
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX02.aspeed.com
 (192.168.0.25) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 3 Jul
 2024 16:16:25 +0800
Received: from localhost.localdomain (192.168.10.10) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1258.12 via Frontend
 Transport; Wed, 3 Jul 2024 16:16:25 +0800
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Peter Maydell
 <peter.maydell@linaro.org>, Steven Lee <steven_lee@aspeedtech.com>, Troy Lee
 <leetroy@gmail.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, "Joel
 Stanley" <joel@jms.id.au>, Alistair Francis <alistair@alistair23.me>, "Kevin
 Wolf" <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, "Wainer dos
 Santos Moschetta" <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, "open list:All patches CC
 here" <qemu-devel@nongnu.org>, "open list:Block layer core"
 <qemu-block@nongnu.org>
CC: <jamin_lin@aspeedtech.com>, <troy_lee@aspeedtech.com>,
 <yunlin.tang@aspeedtech.com>
Subject: [PATCH v2 1/5] hw/net:ftgmac100: update memory region size to 0x200
Date: Wed, 3 Jul 2024 16:16:19 +0800
Message-ID: <20240703081623.2740862-2-jamin_lin@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240703081623.2740862-1-jamin_lin@aspeedtech.com>
References: <20240703081623.2740862-1-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: Fail (TWMBX02.aspeed.com: domain of jamin_lin@aspeedtech.com
 does not designate 192.168.10.10 as permitted sender)
 receiver=TWMBX02.aspeed.com; client-ip=192.168.10.10;
 helo=localhost.localdomain;
Received-SPF: pass client-ip=211.20.114.72;
 envelope-from=jamin_lin@aspeedtech.com; helo=TWMBX01.aspeed.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_FAIL=0.001,
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
Reply-to:  Jamin Lin <jamin_lin@aspeedtech.com>
From:  Jamin Lin via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 9vEaaLaFMiIm

According to the datasheet of ASPEED SOCs,
one MAC controller owns 128KB of register space for AST2500.

However, one MAC controller only owns 64KB of register space for AST2600
and AST2700.

It set the memory region size 128KB and it occupied another
controllers Address Spaces.

Currently, the ftgmac100 model use 0x100 register space.
To support DMA 64 bits dram address and new future mode(ftgmac100_high) which
have "Normal Priority Transmit Ring Base Address Register High(0x17C)",
"High Priority Transmit Ring Base Address Register High(0x184)" and
"Receive Ring Base Address Register High(0x18C)" to save the high part physical
address of descriptor manager.

Update memory region size to 0x200.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
---
 hw/net/ftgmac100.c         | 2 +-
 include/hw/net/ftgmac100.h | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/net/ftgmac100.c b/hw/net/ftgmac100.c
index 25e4c0cd5b..4e88430b2f 100644
--- a/hw/net/ftgmac100.c
+++ b/hw/net/ftgmac100.c
@@ -1108,7 +1108,7 @@ static void ftgmac100_realize(DeviceState *dev, Error **errp)
     }
 
     memory_region_init_io(&s->iomem, OBJECT(dev), &ftgmac100_ops, s,
-                          TYPE_FTGMAC100, 0x2000);
+                          TYPE_FTGMAC100, FTGMAC100_NR_REGS);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
     qemu_macaddr_default_if_unset(&s->conf.macaddr);
diff --git a/include/hw/net/ftgmac100.h b/include/hw/net/ftgmac100.h
index 765d1538a4..5a970676da 100644
--- a/include/hw/net/ftgmac100.h
+++ b/include/hw/net/ftgmac100.h
@@ -14,6 +14,8 @@
 #define TYPE_FTGMAC100 "ftgmac100"
 OBJECT_DECLARE_SIMPLE_TYPE(FTGMAC100State, FTGMAC100)
 
+#define FTGMAC100_NR_REGS   0x200
+
 #include "hw/sysbus.h"
 #include "net/net.h"
 
-- 
2.34.1

