Received: by 2002:a17:504:2a14:b0:1be9:327d:8ee3 with SMTP id p20csp1257402njl;
        Mon, 16 Sep 2024 11:59:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWreSNaupFh+pAJjiAiMj6fxUnB9BWZTMD8RA29hNRiEIVhug+Josb2ro/aO+mOuJrYxelTk5XobxMd3A==@linaro.org
X-Google-Smtp-Source: AGHT+IGipaUQ9OZgyFnepA3j8KknjD8g5lVlN43hFglux3xChSdqhOBD0JPTyxshVy+6kQFWMuVl
X-Received: by 2002:a05:6214:540f:b0:6c1:6a91:49b0 with SMTP id 6a1803df08f44-6c5736ebd39mr241495906d6.51.1726513183350;
        Mon, 16 Sep 2024 11:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726513183; cv=none;
        d=google.com; s=arc-20240605;
        b=KdlR+vaA7Ys/VnmLBcSl4XtkwiSWEK/vlQgWCEsBS77kYQuFA+MaqXRbdjGEMxcHJf
         YWYgJ3yh/S+sS15wKxsttu+sVCxmyeeaNzrDAFsEfAV6tMFuEyX1OYvbFPaJ3J0az4vh
         zdKRDPZKeuW/wKBfbX/F6PRgyTaWFJWd9JUZffSOuzw8NKBqXfIutgsHLLYapWT806Fm
         U/XydLiUxNe/JSMm+TTY2uDh+aoPVDjXpZc6DY2SxV2mXhzYwzaVCSpRo0TibwSdC25A
         YDA/h6DWrHrHymaIhUZn/bACfMHi6NGAFoSnU9gju1lwQF1P6lMJRyn+V41t67nwU5C5
         tLBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cJn2I3+FfBTydQ+zXEc7DSErx28NuAP2icLho4kLLm4=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=N9zBTjHAzA2AU3E7GDBVAGXM+64PkNVgZNeD8GOGZIPmZjKTRsLJK/+vHLhXbEDddL
         +VbO898omdLeZFLTOtPlw+IPOM8Ke1w73zlnYvRikMq5+W/3TXZQeEDuwt4lzbK9Jw0J
         i3N0nxpLMIVOFew1PPkIIFPJhVKeCJzt63uhQXKuxeWBHlAFrFz+v7pACdu/UZhQ9hvU
         zHigte7cePAKedbxdMmsprVqBX1TVSTQZXfdE+dypxuD6ivSdU2hmyBRgX+QyUo8FLnJ
         rz0Qc2wZ+7QJCfC47kk+USshrRGSMZee3gggiaD9rkbTHQxsoJjPwjyuSnjXqZqcRYgV
         v4/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GdXBfuEK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c58c632c06si63492916d6.157.2024.09.16.11.59.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2024 11:59:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GdXBfuEK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sqGwn-0003as-9p; Mon, 16 Sep 2024 14:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sqGwJ-0001ck-Q9
 for qemu-arm@nongnu.org; Mon, 16 Sep 2024 14:59:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sqGwD-0003Mx-EY
 for qemu-arm@nongnu.org; Mon, 16 Sep 2024 14:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726513143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cJn2I3+FfBTydQ+zXEc7DSErx28NuAP2icLho4kLLm4=;
 b=GdXBfuEKuR/RHN1+frrxsapo/1aNvi3a6DIaW1jt0iOWa6Q4T0sJZ6QoxwPAboi835OHC0
 HBlzNDtuKwSgABZjJg4AiH0cZRFP9DMjEwyTBUFTkLDWF7dfU1p/OlgIMMwnte9+Xuo/S/
 /xZOfATIza4Kj8utSHIqBJLlndUHlDA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-14-QRVwWPZkMe69AsqK5Myf6A-1; Mon,
 16 Sep 2024 14:57:38 -0400
X-MC-Unique: QRVwWPZkMe69AsqK5Myf6A-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AB95E195608A; Mon, 16 Sep 2024 18:57:37 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.44])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2497C195605A; Mon, 16 Sep 2024 18:57:35 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 11/12] aspeed: Add tmp105 in i2c bus 0 for AST2700
Date: Mon, 16 Sep 2024 20:57:07 +0200
Message-ID: <20240916185708.574546-12-clg@redhat.com>
In-Reply-To: <20240916185708.574546-1-clg@redhat.com>
References: <20240916185708.574546-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
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
X-TUID: oFQcHUKZyy/I

From: Jamin Lin <jamin_lin@aspeedtech.com>

ASPEED SDK add lm75 in i2c bus 0 for AST2700.
LM75 is compatible with TMP105 driver.

Introduce a new i2c init function and
add tmp105 device model in i2c bus 0.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/arm/aspeed.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index fd5603f7aa23..3d13b16768f7 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1650,6 +1650,15 @@ static void aspeed_minibmc_machine_ast1030_evb_class_init(ObjectClass *oc,
 }
 
 #ifdef TARGET_AARCH64
+static void ast2700_evb_i2c_init(AspeedMachineState *bmc)
+{
+    AspeedSoCState *soc = bmc->soc;
+
+    /* LM75 is compatible with TMP105 driver */
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 0),
+                            TYPE_TMP105, 0x4d);
+}
+
 static void aspeed_machine_ast2700_evb_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -1664,6 +1673,7 @@ static void aspeed_machine_ast2700_evb_class_init(ObjectClass *oc, void *data)
     amc->num_cs    = 2;
     amc->macs_mask = ASPEED_MAC0_ON | ASPEED_MAC1_ON | ASPEED_MAC2_ON;
     amc->uart_default = ASPEED_DEV_UART12;
+    amc->i2c_init  = ast2700_evb_i2c_init;
     mc->default_ram_size = 1 * GiB;
     aspeed_machine_class_init_cpus_defaults(mc);
 }
-- 
2.46.0

