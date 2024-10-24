Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp126303njx;
        Wed, 23 Oct 2024 23:38:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXps6y36IPwOg2NgAMxNhqZqQ8FXJqms2N7Dd691b/TeQltc4NZXh3ihqWbUE1d2bBxy876Yi+gnK8jpA==@linaro.org
X-Google-Smtp-Source: AGHT+IG9lR3cJf7d8mMbN6IaD+cd7N71cnXSRPwm8liUVWoerA9huEIiACw9udKilwhIZ0on8p//
X-Received: by 2002:a05:6214:5d89:b0:6cb:fbdf:8496 with SMTP id 6a1803df08f44-6ce341a95demr47534376d6.24.1729751908885;
        Wed, 23 Oct 2024 23:38:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729751908; cv=none;
        d=google.com; s=arc-20240605;
        b=hb9aFU7ZX5rOYtP6kAYjJ7x1ITclBcgW+f2Rth0W5q/wv1BGZJl/VNYkmXEIfy2xw0
         ch0pxUVNGULthNp0RuJ8r/9to3HNcfKZn7CzLMWIe+oru4LAs7f1MD/VWSX0WyBw7Ksx
         ZZoBipSi8YlcNev9aWAj8GBch+TVoF0+6xUAIAtmLZpPStiANnHgWQPJSvknoHi72dki
         eKDnSkK2lniTBLEodAKPn5bydAGsPVWgLhwjX4aWhQGRIRKENfv8q7EBFE2MhkRcLQbi
         72+N6JrDABHNbAyHFKfuAPQHs3+d0Vifls7HpaD2boFIO9SdW93ADXpyKw+69Na+7FWh
         s3yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vSWlToqPCAWVXccB0955bor5gnfBy3VynEI6kLZqWCM=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=BA0a8+DaskCNlffAj1jtmr1zxPhYft8Nzmy31TMx3hgT1LvNs8bDxTw0ETXPwHG9zB
         z2l8Ox+4PG5DArQ+xG1U90wq1vWulQyOhnFFLCcAosghlwfL5oD0XXXP4gqF6/+BSRAO
         rZ2Zxwcjw+yJkoBQ4BsLMB+eRCWc20p1K40tCgAeYEOx6m1m7l1DiMDOPdTFj8bSJ3g/
         336gGW9p38EDcgyv1JebBNkks7FD96tpTZ2XwZ+jWFSHfdgFsBEZL+15lHIlgkbwo2+F
         XFhy3Q2WAbuURnah8fX2rDMcAd7PriJ9w6slW5xRVcm311/NflZYXXzm/tw0OSmbCrsU
         FKYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K1pJvZwo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ce009cea92si109138776d6.366.2024.10.23.23.38.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2024 23:38:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K1pJvZwo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t3rRq-0002Lg-7f; Thu, 24 Oct 2024 02:35:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t3rRn-0002Kl-WC
 for qemu-arm@nongnu.org; Thu, 24 Oct 2024 02:35:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1t3rRm-0003Sh-Eb
 for qemu-arm@nongnu.org; Thu, 24 Oct 2024 02:35:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729751749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSWlToqPCAWVXccB0955bor5gnfBy3VynEI6kLZqWCM=;
 b=K1pJvZwoQeh+uq62KWDJFPnoNaLNbu/ELN66ahps4ViHkfDp7UYAcNaSDt6pfDtS9oiVcR
 tpQVXSCe2tsa4MuQ58YQ0m6FnfPYy2l0EoF3ahL80hfmZYiOx9sUBN90xNvHa4N1OjeUY+
 mWEY2p4d1CkT586cbT7SXtvKpd0L1eg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-468-8qlckcPVMhKNfpPOs-UDmw-1; Thu,
 24 Oct 2024 02:35:45 -0400
X-MC-Unique: 8qlckcPVMhKNfpPOs-UDmw-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B11EC1956088; Thu, 24 Oct 2024 06:35:44 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.9])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3E33B1956056; Thu, 24 Oct 2024 06:35:43 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 12/17] hw/block:m25p80: Fix coding style
Date: Thu, 24 Oct 2024 08:35:02 +0200
Message-ID: <20241024063507.1585765-13-clg@redhat.com>
In-Reply-To: <20241024063507.1585765-1-clg@redhat.com>
References: <20241024063507.1585765-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.263,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: ZmLGqh5EvcqI

From: Jamin Lin <jamin_lin@aspeedtech.com>

Fix coding style issues from checkpatch.pl

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/block/m25p80.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index f7123f9e6878..3f55b8f38561 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -61,7 +61,8 @@ typedef struct FlashPartInfo {
      */
     uint8_t id[SPI_NOR_MAX_ID_LEN];
     uint8_t id_len;
-    /* there is confusion between manufacturers as to what a sector is. In this
+    /*
+     * there is confusion between manufacturers as to what a sector is. In this
      * device model, a "sector" is the size that is erased by the ERASE_SECTOR
      * command (opcode 0xd8).
      */
@@ -168,7 +169,7 @@ typedef struct FlashPartInfo {
 /*
  * Spansion read mode command length in bytes,
  * the mode is currently not supported.
-*/
+ */
 
 #define SPANSION_CONTINUOUS_READ_MODE_CMD_LEN 1
 #define WINBOND_CONTINUOUS_READ_MODE_CMD_LEN 1
@@ -189,7 +190,8 @@ static const FlashPartInfo known_devices[] = {
 
     { INFO("at45db081d",  0x1f2500,      0,  64 << 10,  16, ER_4K) },
 
-    /* Atmel EEPROMS - it is assumed, that don't care bit in command
+    /*
+     * Atmel EEPROMS - it is assumed, that don't care bit in command
      * is set to 0. Block protection is not supported.
      */
     { INFO("at25128a-nonjedec", 0x0,     0,         1, 131072, EEPROM) },
@@ -275,10 +277,13 @@ static const FlashPartInfo known_devices[] = {
     { INFO_STACKED("n25q00a",   0x20bb21, 0x1000, 64 << 10, 2048, ER_4K, 4) },
     { INFO_STACKED("mt25ql01g", 0x20ba21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
     { INFO_STACKED("mt25qu01g", 0x20bb21, 0x1040, 64 << 10, 2048, ER_4K, 2) },
-    { INFO_STACKED("mt25ql02g", 0x20ba22, 0x1040, 64 << 10, 4096, ER_4K | ER_32K, 2) },
-    { INFO_STACKED("mt25qu02g", 0x20bb22, 0x1040, 64 << 10, 4096, ER_4K | ER_32K, 2) },
+    { INFO_STACKED("mt25ql02g", 0x20ba22, 0x1040, 64 << 10, 4096,
+                   ER_4K | ER_32K, 2) },
+    { INFO_STACKED("mt25qu02g", 0x20bb22, 0x1040, 64 << 10, 4096,
+                   ER_4K | ER_32K, 2) },
 
-    /* Spansion -- single (large) sector size only, at least
+    /*
+     * Spansion -- single (large) sector size only, at least
      * for the chips listed here (without boot sectors).
      */
     { INFO("s25sl032p",   0x010215, 0x4d00,  64 << 10,  64, ER_4K) },
@@ -549,7 +554,8 @@ static void blk_sync_complete(void *opaque, int ret)
     qemu_iovec_destroy(iov);
     g_free(iov);
 
-    /* do nothing. Masters do not directly interact with the backing store,
+    /*
+     * do nothing. Masters do not directly interact with the backing store,
      * only the working copy so no mutexing required.
      */
 }
@@ -1843,7 +1849,7 @@ static void m25p80_register_types(void)
 
     type_register_static(&m25p80_info);
     for (i = 0; i < ARRAY_SIZE(known_devices); ++i) {
-        TypeInfo ti = {
+        const TypeInfo ti = {
             .name       = known_devices[i].part_name,
             .parent     = TYPE_M25P80,
             .class_init = m25p80_class_init,
-- 
2.47.0

