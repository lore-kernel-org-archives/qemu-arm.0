Received: by 2002:a17:907:76b5:b0:9a1:fa4e:495e with SMTP id jw21csp496134ejc;
        Fri, 1 Sep 2023 02:43:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1lfZXs9WJBbpYT6toJbjkm7iAVqQt8yxcF9C2PCqpvkHugCjUpVI7XN6xpfivYOwXgCIZ
X-Received: by 2002:a0c:f5d0:0:b0:647:1a66:181a with SMTP id q16-20020a0cf5d0000000b006471a66181amr1749996qvm.50.1693561438619;
        Fri, 01 Sep 2023 02:43:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693561438; cv=none;
        d=google.com; s=arc-20160816;
        b=yhsx+8Xr8wWfkSCE69JlAO04O5eIJQis97G2jS8aMSGSyJhKgcbm7Ws86mOfbnlf1+
         XTTCU/Bruh+CR+4mBodQYOAMuN2HflNI09SGMtsXe0dSCY/FCO/s9n/pHVwgvoNphksG
         pwViCItjaRWAOf3UhVVqlKahG2XziBIwyVwoeYvwFobXZKkrxH11fIcd81by+x7Ocs4J
         ihvjxFTVNJbTzMkRPaRp8eHFW5V/RgBBryaBW3mXYgrpZ68TqEG8ayRIZx2HvsmyGwfm
         8KsaSFzFK/3NpSBZM/h3qTo29JjjMS1HvCsLfSmUjymn/TaC1oUtPDlY4HAbRHNbPoB7
         kABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=n4P0Q1mNdbjYiJ6dygEVn/oTsZ+TVlg3jRDsJMCJ7IE=;
        fh=1Jxhf+9Nb+8r7Uf3Z24eyiFG706BexBUOuvmFi7HxA0=;
        b=TRDjTsTEd1v/4CzW0gyZ0YiiCG8dpZvbImASk+ga3sT8uq9Kdx5XTYHW/CKVcYcgOe
         3EkVfAueZ+4Nr9ZKHJC2tdkkmrWeM60szO2RbeyHGjR940eCrtuJfl72h7o3VG+3mwkb
         jLBfu09Fl9r3PrabXKG18yRMymt9/AETGmlB+3DnTloeHwJEpJniXhRTE8P265yXKBfJ
         +mVb/ZNXs4lJ6VpkNvMsrOJQRL7rX8fVevWpHIIriVbiBTS9g1lFRYPVzMEB3lbQJlSs
         kv4uUXcYhHhRUxsEbn5iVtj3p7U+2hd5nYfm0ha+oqsSfDkqAJE89DFuakSbnFPpYwUX
         XNWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9-20020a0c9789000000b0064d1284fc4bsi2040112qvd.455.2023.09.01.02.43.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 Sep 2023 02:43:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qc0fr-0001WX-0m; Fri, 01 Sep 2023 05:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0fn-0001Qx-Uq; Fri, 01 Sep 2023 05:42:39 -0400
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]
 helo=gandalf.ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=SnXb=ER=kaod.org=clg@ozlabs.org>)
 id 1qc0fh-0002rf-47; Fri, 01 Sep 2023 05:42:38 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4RcY3V28qhz4x3G;
 Fri,  1 Sep 2023 19:42:30 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4RcY3S5SWWz4wxW;
 Fri,  1 Sep 2023 19:42:28 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Hang Yu <francis_yuu@stu.pku.edu.cn>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 04/26] hw/i2c/aspeed: Add support for buffer organization
Date: Fri,  1 Sep 2023 11:41:52 +0200
Message-ID: <20230901094214.296918-5-clg@kaod.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230901094214.296918-1-clg@kaod.org>
References: <20230901094214.296918-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2221:ea00::3;
 envelope-from=SRS0=SnXb=ER=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, FORGED_SPF_HELO=1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: 5wUBaQZxK8tc

From: Hang Yu <francis_yuu@stu.pku.edu.cn>

Added support for the buffer organization option in pool buffer control
register.when set to 1,The buffer is split into two parts: Lower 16 bytes
for Tx and higher 16 bytes for Rx.

Signed-off-by: Hang Yu <francis_yuu@stu.pku.edu.cn>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
[ clg: checkpatch fixes ]
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/i2c/aspeed_i2c.h | 1 +
 hw/i2c/aspeed_i2c.c         | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/include/hw/i2c/aspeed_i2c.h b/include/hw/i2c/aspeed_i2c.h
index 2e1e15aaf0f7..a064479e599c 100644
--- a/include/hw/i2c/aspeed_i2c.h
+++ b/include/hw/i2c/aspeed_i2c.h
@@ -143,6 +143,7 @@ REG32(I2CD_POOL_CTRL, 0x1C) /* Pool Buffer Control */
     SHARED_FIELD(RX_SIZE, 16, 5)
     SHARED_FIELD(TX_COUNT, 8, 5)
     FIELD(I2CD_POOL_CTRL, OFFSET, 2, 6) /* AST2400 */
+    SHARED_FIELD(BUF_ORGANIZATION, 0, 1) /* AST2600 */
 REG32(I2CD_BYTE_BUF, 0x20) /* Transmit/Receive Byte Buffer */
     SHARED_FIELD(RX_BUF, 8, 8)
     SHARED_FIELD(TX_BUF, 0, 8)
diff --git a/hw/i2c/aspeed_i2c.c b/hw/i2c/aspeed_i2c.c
index 44905d789998..7275d40749a9 100644
--- a/hw/i2c/aspeed_i2c.c
+++ b/hw/i2c/aspeed_i2c.c
@@ -297,6 +297,10 @@ static void aspeed_i2c_bus_recv(AspeedI2CBus *bus)
 
     if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_cmd, RX_BUFF_EN)) {
         uint8_t *pool_base = aic->bus_pool_base(bus);
+        if (SHARED_ARRAY_FIELD_EX32(bus->regs, reg_pool_ctrl,
+                                    BUF_ORGANIZATION)) {
+            pool_base += 16;
+        }
 
         for (i = 0; i < pool_rx_count; i++) {
             pool_base[i] = i2c_recv(bus->bus);
-- 
2.41.0

