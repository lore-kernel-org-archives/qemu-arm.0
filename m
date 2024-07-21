Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1307762njc;
        Sun, 21 Jul 2024 01:16:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWxJxaFAFj7iE0s/ptytwF4hwonyPA5xJt4qUC2w1czEAIZ5G2ZPBUwx1rD++adTdBVo0bthgJ5n6yWcYqm59nGL26QkYKd
X-Google-Smtp-Source: AGHT+IEsOU3KWSwrIzDY/jmRg7d/NPVziN78Y+YB5vo87mU/mRR8FDmfxl3w89OyEFDZV4+v9vqa
X-Received: by 2002:a05:6214:492:b0:6b5:6a1:f89a with SMTP id 6a1803df08f44-6b96106e04bmr48028576d6.2.1721549785586;
        Sun, 21 Jul 2024 01:16:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721549785; cv=none;
        d=google.com; s=arc-20160816;
        b=UF0k3CXC51d/NtDkVe/ZkUHj8tdDCzaSKJDl61TFbV8leFn9sCGE6imdQ9ju62oG3W
         HglloDaVkJr8fWNKi1MYTY2XeMAA1IStQ4/HJyEYW7JcuZGFbfNWX9LliyHhZZWYPONe
         z7zQDisLYjnv83tSURZPVGWehVt/pA40rxLvkZoEBanPphz2ohBX3ei/pbiK6FfBY/3f
         B2j46iEX6qyvEA85yqf9hN8cQEzscbhSDJVO1jeZcOzWRd9zDHfKh3TnemoyOMb9wb0L
         h8PYN1vj/vthsLswO/WZvrHHm3oRMGabwx3uQE6DdI3IDp1wns1RWoaUHVIpcMmDfIzv
         dkcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Uor5WvEZ67SeAvZ4lUWJ+fLutkmIqAXpvxCnI1QP5r4=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=aD58r42ePJhK5Nc+EQysqe8XD5ZATUYJ/m7rJWVz7L86xzo2TQoyJyb6aI/iRzzqTy
         zl4IbRoJZPJUAX2VvqBd5/0jabw3PcEftAjfhq0ssl25IKkx62PGNJi0t1T1zKHCMiHE
         No0n/NaFmO0d7LxX4LWSndNXGx1mkJ2p+AVoZksijyoUHaQryeFlHB+5Z0CB+Z1+2gsP
         wS5UeIRi74FzkkZUvlJA82hthG3A4KGeuhPnsFsNMjzYCPhzrDeF8BWRwCpmm4V7u8VY
         oHKtwY53dP1O3hoaIbssQwjL5L4rZ9K1wY8XOb9As49z01Crk+vuFXisbmK+NBUqgJHQ
         AeVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LuAi2tVI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7acaf102dsi53449266d6.448.2024.07.21.01.16.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jul 2024 01:16:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LuAi2tVI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVRiY-0001Vr-AU; Sun, 21 Jul 2024 04:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRiV-0001JE-Bd
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRiT-0001ZI-Ma
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721549689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Uor5WvEZ67SeAvZ4lUWJ+fLutkmIqAXpvxCnI1QP5r4=;
 b=LuAi2tVI8V2E+H1Ww2mPJtxJ9ijPfxZvAWe1qelxPd2AUN58Wt+7ev3DW02USOsefsWF4l
 qx/5Nc1USlHaxkFgHKVrm50BGkuZ8MZv7XdduhbZMN2RJfGCRjVjpFenRWoU2nEeWc1rDv
 LVRK5++3g+yV2KaUJcP9mec/ffexCPc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-97-m10z_3ilODiJp8QgKUDtVw-1; Sun,
 21 Jul 2024 04:14:45 -0400
X-MC-Unique: m10z_3ilODiJp8QgKUDtVw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0002719560AD; Sun, 21 Jul 2024 08:14:44 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.37])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F23741955D47; Sun, 21 Jul 2024 08:14:42 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 15/15] aspeed: fix coding style
Date: Sun, 21 Jul 2024 10:14:01 +0200
Message-ID: <20240721081401.425588-16-clg@redhat.com>
In-Reply-To: <20240721081401.425588-1-clg@redhat.com>
References: <20240721081401.425588-1-clg@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 7uB2XB/5+iDk

From: Jamin Lin <jamin_lin@aspeedtech.com>

Fix coding style issues from checkpatch.pl

Test command:
./scripts/checkpatch.pl --no-tree -f hw/arm/aspeed.c

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 5cdef873a5fc..fd5603f7aa23 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -266,7 +266,8 @@ static void write_boot_rom(BlockBackend *blk, hwaddr addr, size_t rom_size,
     g_autofree void *storage = NULL;
     int64_t size;
 
-    /* The block backend size should have already been 'validated' by
+    /*
+     * The block backend size should have already been 'validated' by
      * the creation of the m25p80 object.
      */
     size = blk_getlength(blk);
@@ -476,8 +477,10 @@ static void palmetto_bmc_i2c_init(AspeedMachineState *bmc)
     DeviceState *dev;
     uint8_t *eeprom_buf = g_malloc0(32 * 1024);
 
-    /* The palmetto platform expects a ds3231 RTC but a ds1338 is
-     * enough to provide basic RTC features. Alarms will be missing */
+    /*
+     * The palmetto platform expects a ds3231 RTC but a ds1338 is
+     * enough to provide basic RTC features. Alarms will be missing
+     */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 0), "ds1338", 0x68);
 
     smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 0), 0x50,
@@ -568,8 +571,10 @@ static void romulus_bmc_i2c_init(AspeedMachineState *bmc)
 {
     AspeedSoCState *soc = bmc->soc;
 
-    /* The romulus board expects Epson RX8900 I2C RTC but a ds1338 is
-     * good enough */
+    /*
+     * The romulus board expects Epson RX8900 I2C RTC but a ds1338 is
+     * good enough
+     */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
 }
 
@@ -677,8 +682,10 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 9), TYPE_TMP105,
                      0x4a);
 
-    /* The witherspoon board expects Epson RX8900 I2C RTC but a ds1338 is
-     * good enough */
+    /*
+     * The witherspoon board expects Epson RX8900 I2C RTC but a ds1338 is
+     * good enough
+     */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 11), "ds1338", 0x32);
 
     smbus_eeprom_init_one(aspeed_i2c_get_bus(&soc->i2c, 11), 0x51,
-- 
2.45.2

