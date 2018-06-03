Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2137205wre;
        Sat, 2 Jun 2018 17:09:22 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJ1qD7G3PSubxULJzdLpw6yRwlWeyJFODVsZJlinBbPUP1R3hPBNU7s0u+FfjyZkYA1t1Sb
X-Received: by 2002:ac8:40e:: with SMTP id v14-v6mr5967791qtg.32.1527984562101;
        Sat, 02 Jun 2018 17:09:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527984562; cv=none;
        d=google.com; s=arc-20160816;
        b=NFc+16CQJr4JRTFhj0qez9KZL2Q2vZj0ofRqeFs6bM8t4ttivD+jlCvYKnUr7ujy8R
         +tya8meKHB/TWb/WhAQYNMBwMJ8udyiVhM23Fm+d/AAY9Y7ivSuhuBytPeH/S9T5slA0
         sFZu5wZGu3FJMXQ1FaN2uu/pfrBl2lP5LNpODXR4g4+LAVERgaK3x3oGccKLeysdqYU9
         97chc8fjNSy0UjdX3d42lnGaoOP+UNrhMCZovJ1zKQ9sVNFx3bIW1DrsMuIkPY23iXhM
         CTvoXQh+OteK0KkWelGe7d7Iq5SGQPLzijqIMM26OHmAACyvZzzd4haLN+uktC5jIL6r
         WahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=8hDwejCWx11ArNCUrJgK57kvn6QwEkI8TsaoZIyD2nw=;
        b=mL1IYaFzoPl+ngGSAIIi+dZx9A1n7/YBehGZLeqL+cYUWoBwD9/+hYevUqKNFhWr4z
         /yg8y0LvWBJSKihAlpZz24z7I+7JBklca92kKLlCUewF6Ct1hPf7ifqbi03sSq5Ykcho
         RI9yjWJkAASKQjTjVU49cRJbT7oPcVRsfRgATDRr33JtbYm6bMgbUD5k8tVeQnlDDj+u
         BOSNbF4zYewvQD5WqmtCoYjxvx2ddTLhDxmAksQtbFTKEDHufjtXKkk469ZdhAnW/cq6
         pxl8Q6pyVLiDsBcSGETVUZ7p2xCdRezoO65Q0V6ZynJ4x/4exCodblX30Mo4XNFqi8am
         hL+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aemB3cWo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d13-v6si3946072qki.85.2018.06.02.17.09.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Jun 2018 17:09:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aemB3cWo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:33117 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPGaH-0004Aj-IV
	for alex.bennee@linaro.org; Sat, 02 Jun 2018 20:09:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZm-0003t3-Fj
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 20:08:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZl-0002wc-J6
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 20:08:50 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:42647)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPGZh-0002un-LA; Sat, 02 Jun 2018 20:08:45 -0400
Received: by mail-qt0-x241.google.com with SMTP id y31-v6so6606837qty.9;
	Sat, 02 Jun 2018 17:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8hDwejCWx11ArNCUrJgK57kvn6QwEkI8TsaoZIyD2nw=;
	b=aemB3cWoNlPmUfM3sJonXvBTSzU9wlr0R1uw1QwI7d6kyajGJdcoE9Fy7z9dvzvsVe
	nSWfM5Mf1/HZneGgsA0OQAlMp/6b3hHClcaIYwy0iVEmDe3C0s4yun3To2TB9adheYEG
	JfgYv0AM/pamv+IfYHEo3lrxarQYmeB22mh2XXqKIJxWVBei51f5du5HuzQdzrGbbBWi
	BNwci0JrKbzY2v1RPVtGI01oX93l5SKZ4IbGUA1IjEysYJRx7XNxxGcylhZ3rUM/922+
	6Hsk1p0xGYG4nzUOXDk3V7yG03AEqifc+5Ww1TFf7UQ6Mbuq7/iKC+MM5JNHzz+IialY
	Cb3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=8hDwejCWx11ArNCUrJgK57kvn6QwEkI8TsaoZIyD2nw=;
	b=oJDZjSU6ipHq0dPQhvlaj1lRXhaWwu6mQtMquSgHT4tvVDZ1Yrn3iEAAqv2Bluss0Y
	tZfvQxK5Hj883YKA5Y3dTU5awjLsSyLpGupOGNi6ZGUx7CboNBGg98UDcGunCQhLcX3p
	q9HZUXhRuU31lUaxUKzP24JBpk52vBk0kWcEBt0GbSJackApBZUmGEp9HA4mnDKaAoHQ
	VuleNAW47x1FTJ/OkcQPBQzNsxTpbDITRHRFmDTQWbvPGQgReu9VvS915PqegC3D7shg
	gG7S+mijmgCfihfIDxbpE8BwI8pbvb8E5UGykRp7aq88TOkfqBwVOPitQmR1/Jmd0A8M
	gxXg==
X-Gm-Message-State: APt69E0MoWwHo05nBLVndL0Gd4FoNhRx55NLy4OTqKrNesxsGF/Hoigb
	cYiktVE9ppTZELUdzVTJIXQ=
X-Received: by 2002:ac8:8d4:: with SMTP id
	y20-v6mr16417607qth.187.1527984525205; 
	Sat, 02 Jun 2018 17:08:45 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	17-v6sm10610894qkg.97.2018.06.02.17.08.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jun 2018 17:08:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Sat,  2 Jun 2018 21:08:22 -0300
Message-Id: <20180603000827.30872-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180603000827.30872-1-f4bug@amsat.org>
References: <20180603000827.30872-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-arm] [PATCH 3/8] sdcard: Add a 'spec_version' property
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JGrN91/n9O6T

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/sd/sd.h |  4 ++++
 hw/sd/sd.c         | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/hw/sd/sd.h b/include/hw/sd/sd.h
index 9bdb3c9285..49f22b0b89 100644
--- a/include/hw/sd/sd.h
+++ b/include/hw/sd/sd.h
@@ -54,6 +54,10 @@
 #define APP_CMD			(1 << 5)
 #define AKE_SEQ_ERROR		(1 << 3)
 
+enum SDPhySpecificationVersion {
+    SD_PHY_SPECv1_10_VERS     = 1,
+};
+
 typedef enum {
     SD_VOLTAGE_0_4V     = 400,  /* currently not supported */
     SD_VOLTAGE_1_8V     = 1800,
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 80e70dd93e..5ddd211114 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -91,6 +91,7 @@ struct SDState {
     uint8_t sd_status[64];
 
     /* Configurable properties */
+    uint8_t spec_version;
     BlockBackend *blk;
     bool spi;
 
@@ -2058,6 +2059,14 @@ static void sd_realize(DeviceState *dev, Error **errp)
 
     sd->proto_name = sd->spi ? "SPI" : "SD";
 
+    switch (sd->spec_version) {
+    case SD_PHY_SPECv1_10_VERS:
+        break;
+    default:
+        error_setg(errp, "Invalid SD card Spec version: %u", sd->spec_version);
+        return;
+    }
+
     if (sd->blk && blk_is_read_only(sd->blk)) {
         error_setg(errp, "Cannot use read-only drive as SD card");
         return;
@@ -2074,6 +2083,8 @@ static void sd_realize(DeviceState *dev, Error **errp)
 }
 
 static Property sd_properties[] = {
+    DEFINE_PROP_UINT8("spec_version", SDState,
+                      spec_version, SD_PHY_SPECv1_10_VERS),
     DEFINE_PROP_DRIVE("drive", SDState, blk),
     /* We do not model the chip select pin, so allow the board to select
      * whether card should be in SSI or MMC/SD mode.  It is also up to the
-- 
2.17.1

