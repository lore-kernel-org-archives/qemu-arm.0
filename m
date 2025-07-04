Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1064642dyc;
        Fri, 4 Jul 2025 01:39:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVS9ZZKx7/byT5MRQJTvU4WXpnyfDpWHSG6zWZF8EjKWb8UHU7/vh2H7PPlhWZ43hs38yeEJ1oFTdnl6w==@linaro.org
X-Google-Smtp-Source: AGHT+IFNSTx3VaAo0T7QHv/acwxu4cpXTwWw6ZAuYyQJSe0h9XlvkVFP30/Gk3HXHxlh5xMf3c0z
X-Received: by 2002:a05:620a:24c9:b0:7d5:db8a:22ea with SMTP id af79cd13be357-7d5dcd15b7dmr257448885a.13.1751618359698;
        Fri, 04 Jul 2025 01:39:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751618359; cv=none;
        d=google.com; s=arc-20240605;
        b=JljPebKQRTuL9rlRLjPLXiEWLbe0SqPaGlkcpJhfZajoEGS0gUr37pUGzawlM4xFR9
         BOAxECbYUq1z3qEdHPrImaW3AI59IWH8Enppase7QU3Q7lLhJHqFqLjvQQP6+moBY+3G
         potow8QIoGH2ooZYCnwUd6fcuTqVAtQQ0NAx7Dxc74jLOZHp78FhcAk+GqDS4tYiybZI
         Ou+L9Q/OqbLyPge4UXlWU4OIhzBQSD9HQlWWP4EUqzCj4VSHEe9h86jUHbWsZgOqhL7F
         nmhD3xDBm/TFDLs0kQ4WHt3va6J5ycYTNjQ5Z5brCnJiX6BS/rHgAjRYJxrvszV91BDl
         z6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QXruomqWdZLziuz7k6CkkiW+woMKkAE5tN+xn+zwqRc=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=kgjwKwhkzEfKjWVXcY7XKd5yNHCLjaSPgBVztoxTPKTEiGeWpSY888vGRHHCOgYP2U
         WHfo0DY2my+ln1RaQbXMOZMMgymgJcC1Dhxn2ZXtJA1QhxzWXlj2G25QL3LAm5NhYwqp
         U4zx9pYagmUIgrAN3H8g7IVbinPeOHlz2wDsMWZAW8yz6OQ4XKDq7IsU4+guI4tE64Zj
         vGIdem/LY+xuyN/IvucvCTzpVLwYxxbJnWdJqqPcbuT3JOcPyerPrMgOfTJxh/GWB0Dl
         I2zP8hTR1P/Zkx1sH6OesyG1OJ6Jl2dRE68aAy8wbYUwCxS3yxAs6ZTpbNu632POyrAP
         gjGA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z7mcz+LQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5e19db809si22838385a.612.2025.07.04.01.39.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 01:39:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z7mcz+LQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXbvY-0006aW-Jg; Fri, 04 Jul 2025 04:37:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uXbvV-0006YR-E3
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 04:37:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uXbvT-0004Mc-Ey
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 04:37:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751618262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QXruomqWdZLziuz7k6CkkiW+woMKkAE5tN+xn+zwqRc=;
 b=Z7mcz+LQKnY4I2JZI6p6ZngEGWAf7dtdRNcOBnw0zsv5yuT6brwsCkF03d+YJ8emYyMFeh
 T6rsJTS8mtQjBSordTjOVJ0VdEhwUiJLj0eGsJX/W8MF4uXB5vGkon1pfioMSg0pjTy+7A
 jmi2ygMgjwXkiDRINXDiXnI0tRjXpEA=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-258-lVLtBd4rOQqpB0_6A4mbDA-1; Fri,
 04 Jul 2025 04:37:39 -0400
X-MC-Unique: lVLtBd4rOQqpB0_6A4mbDA-1
X-Mimecast-MFC-AGG-ID: lVLtBd4rOQqpB0_6A4mbDA_1751618258
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9AC2E18011F9; Fri,  4 Jul 2025 08:37:33 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.43])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B07BC1803AFF; Fri,  4 Jul 2025 08:37:31 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 02/11] hw/misc/aspeed_scu: Support the Frequency Counter
 Control register for AST2700
Date: Fri,  4 Jul 2025 10:37:14 +0200
Message-ID: <20250704083723.1410455-3-clg@redhat.com>
In-Reply-To: <20250704083723.1410455-1-clg@redhat.com>
References: <20250704083723.1410455-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: GEWC1A5JZzTs

From: Jamin Lin <jamin_lin@aspeedtech.com>

According to the datasheet:
BIT[1] (SCU_FREQ_OSC_EN) enables the oscillator frequency measurement counter.
BIT[6] (SCU_FREQ_DONE) indicates the measurement is finished.
Firmware polls BIT[6] to determine when measurement is complete.
The flag can be cleared by writing BIT[1] to 0.

To simulate this hardware behavior in QEMU:
If BIT[1] is set to 1, BIT[6] is immediately set to 1 to avoid
firmware hanging during polling.
If BIT[1] is cleared to 0, BIT[6] is also cleared to 0 to match
hardware semantics.

The initial value of this register is initialized to 0x80, reflecting the
default value confirmed from an EVB register dump.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250618080006.846355-3-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/misc/aspeed_scu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index 4930e00fed14..11d073910882 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -176,6 +176,7 @@
 #define AST2700_SCUIO_UARTCLK_GEN       TO_REG(0x330)
 #define AST2700_SCUIO_HUARTCLK_GEN      TO_REG(0x334)
 #define AST2700_SCUIO_CLK_DUTY_MEAS_RST TO_REG(0x388)
+#define AST2700_SCUIO_FREQ_CNT_CTL      TO_REG(0x3A0)
 
 #define SCU_IO_REGION_SIZE 0x1000
 
@@ -1022,6 +1023,10 @@ static void aspeed_ast2700_scuio_write(void *opaque, hwaddr offset,
         s->regs[reg - 1] ^= data;
         updated = true;
         break;
+    case AST2700_SCUIO_FREQ_CNT_CTL:
+        s->regs[reg] = deposit32(s->regs[reg], 6, 1, !!(data & BIT(1)));
+        updated = true;
+        break;
     default:
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: Unhandled write at offset 0x%" HWADDR_PRIx "\n",
@@ -1066,6 +1071,7 @@ static const uint32_t ast2700_a0_resets_io[ASPEED_AST2700_SCU_NR_REGS] = {
     [AST2700_SCUIO_UARTCLK_GEN]         = 0x00014506,
     [AST2700_SCUIO_HUARTCLK_GEN]        = 0x000145c0,
     [AST2700_SCUIO_CLK_DUTY_MEAS_RST]   = 0x0c9100d2,
+    [AST2700_SCUIO_FREQ_CNT_CTL]        = 0x00000080,
 };
 
 static void aspeed_2700_scuio_class_init(ObjectClass *klass, const void *data)
-- 
2.50.0

