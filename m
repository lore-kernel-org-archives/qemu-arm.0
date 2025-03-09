Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp606985njc;
        Sun, 9 Mar 2025 06:54:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX5lhBzXqopf4YFBBixZdPtfDSYMDFh8Ft691Sz4N7kSgt864mfhEpKbo6gm8rZ4HOqvYAGWrnrs1lN4w==@linaro.org
X-Google-Smtp-Source: AGHT+IHQGQsB5tAWmZGgBmoNIufrNryu6AHIdyd/CvTQcejhR7i2FjaR6Je7TZVV8d38FZlT++dt
X-Received: by 2002:a05:620a:2b94:b0:7c5:53ab:a722 with SMTP id af79cd13be357-7c553aba803mr37938585a.5.1741528461847;
        Sun, 09 Mar 2025 06:54:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528461; cv=none;
        d=google.com; s=arc-20240605;
        b=lxr9/3b2FyytER1hyfSEXqFji9tNu7dzJofbt15w7X5qnYhR0zgRPPDJ+6EdbI0FDz
         YDd6yB8NWeWOP5wTjQ1WFBDQUp7whBGVl8Xs20Z6zsG9urwKRK4hoTskXl4aAIw43mtu
         y6fSiMrf0APQaq8bEM/Y7axMPHNgCNpbH9m8bRaU28SQqUV9aWSPViF+AByAGxGlUj5v
         uo43t3heOYKZFnkO6rRUGl1LY5ECFrZeli8dYzTQeZ1G+fTU77Xa47kf0KHJRn1aTuyc
         AzEY0p9RiwsiwckEb+Kszir/VYd4pm90hDUmJj7GW9SDjjdo/IgEYi8SOWJQwaDeJtaI
         7wug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cER2Fz6VFtUgmzKXMRCSX9cKDP7hnc6EAWaTgvxfzR0=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=W2gLToGTZAxnDNRNvwIgnp/bsLw4HmT/H6nBUNAtsdwwCr9bco31aERpE7rQk6mUeI
         auI+ihvbKJfUEhuS2C71c1n9/+pm+8ocTJ758x/miXXm/Fv00Jo/sNB2i4XPtnno2AyB
         XYYs9nkoLGW7ACvmqnaHmEMABGhdq52h2KSL4TiIiEcpHc7jtldaNMpIEGFpKT+oVgRa
         8BcIbvG9s2/5H/edueF/tgw3/3jFe3xnmZVUPvY/frIhL5UzfBF4/lt4jbXdBzZBHaJC
         CClmfkWwygXb+Lbu3xDROtnz7TxlEMxv6wuPoK+pnzY+5atLXh7MflsDtjhTK3NztGtY
         dyXA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WUKoh0ep;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c548e0c8f3si184497885a.25.2025.03.09.06.54.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:54:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WUKoh0ep;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trH5x-00037V-Kr; Sun, 09 Mar 2025 09:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH5l-0002GY-TT
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:53:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH5k-0003xr-41
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:53:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cER2Fz6VFtUgmzKXMRCSX9cKDP7hnc6EAWaTgvxfzR0=;
 b=WUKoh0epzBOZ7WU6h8YuBH2lR9IswbPHCkJy9vk9Khy5mQ+59YAFy+a2NYR+6epgPMiAFI
 SV0s6adcnIrWhSajLSD3Z7JR5tXztcnd43No8YE8G6SYwD9xV11+yJOmiHo80IzvHyljtC
 ykKOIYwZ7U0/pqKNFV18wPcUGJoI0+c=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-171-vWJxfKtxN06gaPus-EyK9A-1; Sun,
 09 Mar 2025 09:53:16 -0400
X-MC-Unique: vWJxfKtxN06gaPus-EyK9A-1
X-Mimecast-MFC-AGG-ID: vWJxfKtxN06gaPus-EyK9A_1741528395
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 51590195608A; Sun,  9 Mar 2025 13:53:15 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7BC011956095; Sun,  9 Mar 2025 13:53:13 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 40/46] hw/arm/aspeed: Add Machine Support for AST2700 A1
Date: Sun,  9 Mar 2025 14:51:24 +0100
Message-ID: <20250309135130.545764-41-clg@redhat.com>
In-Reply-To: <20250309135130.545764-1-clg@redhat.com>
References: <20250309135130.545764-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: 7VJNRaRliYR/

From: Jamin Lin <jamin_lin@aspeedtech.com>

Introduce "aspeed_machine_ast2700a1_evb_class_init" to initialize the
AST2700 A1 EVB.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250307035945.3698802-24-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 18f7c450dadd..82f42582fa3c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1693,6 +1693,26 @@ static void aspeed_machine_ast2700a0_evb_class_init(ObjectClass *oc, void *data)
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
 }
+
+static void aspeed_machine_ast2700a1_evb_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    AspeedMachineClass *amc = ASPEED_MACHINE_CLASS(oc);
+
+    mc->desc = "Aspeed AST2700 A1 EVB (Cortex-A35)";
+    amc->soc_name  = "ast2700-a1";
+    amc->hw_strap1 = AST2700_EVB_HW_STRAP1;
+    amc->hw_strap2 = AST2700_EVB_HW_STRAP2;
+    amc->fmc_model = "w25q01jvq";
+    amc->spi_model = "w25q512jv";
+    amc->num_cs    = 2;
+    amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON;
+    amc->uart_default = ASPEED_DEV_UART12;
+    amc->i2c_init  = ast2700_evb_i2c_init;
+    mc->auto_create_sdcard = true;
+    mc->default_ram_size = 1 * GiB;
+    aspeed_machine_class_init_cpus_defaults(mc);
+}
 #endif
 
 static void aspeed_machine_qcom_dc_scm_v1_class_init(ObjectClass *oc,
@@ -1821,6 +1841,10 @@ static const TypeInfo aspeed_machine_types[] = {
         .name          = MACHINE_TYPE_NAME("ast2700a0-evb"),
         .parent        = TYPE_ASPEED_MACHINE,
         .class_init    = aspeed_machine_ast2700a0_evb_class_init,
+        }, {
+        .name          = MACHINE_TYPE_NAME("ast2700a1-evb"),
+        .parent        = TYPE_ASPEED_MACHINE,
+        .class_init    = aspeed_machine_ast2700a1_evb_class_init,
 #endif
     }, {
         .name          = TYPE_ASPEED_MACHINE,
-- 
2.48.1

