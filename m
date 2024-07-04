Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp382261njb;
        Wed, 3 Jul 2024 22:38:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXzqnKCfW8lE1huAiFp2NtRv7tPDgcBz8Kn3aUR3PjM7y6MLXDRTR9RWyJTex/OkRZ4Pk8d8TjqVN0lFCBuLaAVkqGgvxpK
X-Google-Smtp-Source: AGHT+IGRHr3hm9B2siiHxH6RF775TBQ0RDK1MJWnUm8gamFJKAMTzdH5SGVGOF6V4sLypgAdBSXS
X-Received: by 2002:a05:620a:4623:b0:79c:ad5:cd6d with SMTP id af79cd13be357-79eee19e9a0mr95280285a.1.1720071498894;
        Wed, 03 Jul 2024 22:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720071498; cv=none;
        d=google.com; s=arc-20160816;
        b=QeRLUT4sG8OC30088bkxMLtxmvlAuffqyl8R+qM/xb1tkPPEIMKHoFpr6oH4tDGjqf
         wXQmjXysehKbdPcoCumZKxQCDbMeaPkwDfJ21X5FS1fdRpovzRdWpfS/uJGVmDI0KY5O
         +/tE6aCflhzTYVzeNWADbAfqZS9IAcICSy9EeXsjG1Vn6zfksQKU5H4bYBloJeh+3qVA
         GzVB7fFBx/ysLPksjL6nlLfZdNFcNiZ6wINsWxQLQxowykXU/i2d5jwduBWGxW5uhaUU
         Kj6xxTxsebLJrwYsN+EKNha93mwVRzBHSzbSPLCRcCzr540JFv5OKy7J4Fy9am7PWhM6
         btyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4YCGx52Uc4ZhHfEFlPk6dFzYeHoVJnh2BMxzS1mjrVs=;
        fh=pmKRfOPFN0ULs83IIygI07LSKzxt8irZuLBhP9+6oM8=;
        b=1D2b1Wkr6dRoXT3ynnABzM/A3HIkI8kAaEuszVq2gGjwdnAVmwAkaICo5KYrKD/kky
         RsC/Pc0HYvXzhFUBlH5joYGLFgE4Sv6mUDVwrmakkAhwSp05xps9Xf5MsqpWTb8ZYbE/
         3vfeQOr1KzVOSAHqj+NYfEoQOs73zALuOrK7tmWlpwrgIVkCRB9UzxxcB+22Vyod9ulq
         PRfss+aeERu7fF2t0XpAGG22q1IDwDZYjb8vwkyvr7KHSRBkreHE9xLqmoYkDELWRS/1
         eiY4LnRCDzLRmmvyLvN6IxbVwYxNR77uog0+YzCzbOTVDey8MYk7mG009913m5i63uWc
         vM0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f2X5T+RC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b5d3ce417asi47911306d6.172.2024.07.03.22.38.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 22:38:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f2X5T+RC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPF9n-0001sN-Jn; Thu, 04 Jul 2024 01:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sPF9l-0001r7-UX
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 01:37:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sPF9k-00025L-Cy
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 01:37:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720071438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4YCGx52Uc4ZhHfEFlPk6dFzYeHoVJnh2BMxzS1mjrVs=;
 b=f2X5T+RCnbIZv03pxValOsZ7AHtLz4qLxFBVHP/J0yJCgzlO2nMLWiWKhfcWCi3/2e1Kg8
 wfU6MzBiBNe9q1X5oDpBd2zHQki2xdVjS61gxTOL5RMxGIcrU81/UBSziesn8AWR2/BVPj
 t/HDg19QdGDGFVLtpp2e6gl9wKhZ4K4=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-nF1nslsKNYyPUn2OTP0HzQ-1; Thu,
 04 Jul 2024 01:37:12 -0400
X-MC-Unique: nF1nslsKNYyPUn2OTP0HzQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E1BE11955BC7; Thu,  4 Jul 2024 05:37:10 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.90])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C26A91955F4B; Thu,  4 Jul 2024 05:37:07 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 3/8] aspeed/scu: Add boot-from-eMMC HW strapping bit for
 AST2600 SoC
Date: Thu,  4 Jul 2024 07:36:46 +0200
Message-ID: <20240704053651.1100732-4-clg@redhat.com>
In-Reply-To: <20240704053651.1100732-1-clg@redhat.com>
References: <20240704053651.1100732-1-clg@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: WWudB7UNlTm9

From: Cédric Le Goater <clg@kaod.org>

Bit SCU500[2] of the AST2600 controls the boot device of the SoC.

Future changes will configure this bit to boot from eMMC disk images
specially built for this purpose.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 include/hw/misc/aspeed_scu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index 58db28db45aa..c9f98c20ffd9 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -349,6 +349,10 @@ uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s);
 #define SCU_AST2600_H_PLL_BYPASS_EN                        (0x1 << 24)
 #define SCU_AST2600_H_PLL_OFF                              (0x1 << 23)
 
+/* STRAP1 SCU500 */
+#define AST2600_HW_STRAP_BOOT_SRC_EMMC            (0x1 << 2)
+#define AST2600_HW_STRAP_BOOT_SRC_SPI             (0x0 << 2)
+
 /*
  * SCU310   Clock Selection Register Set 4 (for Aspeed AST1030 SOC)
  *
-- 
2.45.2

