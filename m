Received: by 2002:a17:505:840b:b0:1be9:327d:8ee3 with SMTP id lq11csp603330njc;
        Tue, 21 Jan 2025 23:10:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWNqnaDF+ukazWR63Bb2byEwknUkl3+h4ASk++3T3aqUk3ViKWILKVRdNMOeFmAS4KKIlatu+mfPu32/w==@linaro.org
X-Google-Smtp-Source: AGHT+IHkOJPE1lnFNabwPvDqo4VLF2FhceRmxK9sM83zx1vwG186gcu+rz8InXWsPdLmA9VlQpIi
X-Received: by 2002:ac8:5755:0:b0:467:54b3:2704 with SMTP id d75a77b69052e-46e12a55e3bmr298947311cf.16.1737529858211;
        Tue, 21 Jan 2025 23:10:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737529858; cv=none;
        d=google.com; s=arc-20240605;
        b=kDlY70879FeaS/QbYPMfzJM1qQtSPjQ786sDdlMOMzNDc0NsEA/0AE0tfcIFr8+kbo
         pRWJgjJVARRZyaHFdQwktNzAh5pTWGiB9s3RcHRseq1odXQotJ/twWhRHwkNn9XCxRHU
         kfkYaMdng8hJChy+XM1bgnuY4Ylhep8+wlwtF92kl7X2FF+7XPZDxX6rDMCA7wSPxr/L
         sYcRHWos/4ibJ/n8UeLugMkFlkgKEj2iR2JsL6MqR1r36dsFsiIgDOpbVAnVu/owxO+X
         mtYvL4DsI7EDG1+ZfXVmFzHsktSNnZPDNufjH0AcSqrE96yW19d0XnyBtYlfsae2Z7Rz
         l06Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GyUuEd+mQAYgtLNlBd/uEG9AWCHY4JYbVKG1xXpW/Ho=;
        fh=NnDqFizpsp7p/y6sMy4IZ04qavXX3BaX/9FQKyuMmuw=;
        b=MTHm9OAzjRIX+b2Z0GnACYszj3uJK+aIcyKekhqjTN+XEa9Ak7D/6VDa9eSuAgZEfW
         Q4sttawQRd7si1RS/HfI+MCBH9en8UEaTTpKrEVCKquTc2x51JGgOQ4chfaDV7FiqMSg
         G0WQHt4HQNrWJ5DY0L6okYIFR+ZSSUpEI80hugc/zaZvJwilNyhTnRihWTQgsT1T1AcN
         evkYCSg6su4qB1fBkz1yqFAl4r98q/btGMv/zb+cvOl2y/x+UYzBAMMsRkcYzEia+zxa
         /PQzk1XNhAMyO3AW8RCbT7z/xlZjGD2gZhAHjhRNJGsrc4CDSirszlx8xO32BA/JYzjh
         yDPg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aeoCTizQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e10488275si135000821cf.498.2025.01.21.23.10.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Jan 2025 23:10:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aeoCTizQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1taUrq-00056C-56; Wed, 22 Jan 2025 02:09:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1taUro-00053L-Jb
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 02:09:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1taUrm-0008Np-Qq
 for qemu-arm@nongnu.org; Wed, 22 Jan 2025 02:09:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737529774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GyUuEd+mQAYgtLNlBd/uEG9AWCHY4JYbVKG1xXpW/Ho=;
 b=aeoCTizQZOJBDk0yJH8PDS8Fr7Cn2A92n1yFxzlq56bemN7DJilQPYW8TrrVtFT7xTA37m
 QtYdgcK/FmwlvT1rANuN6qrKOwK/BtCthmGU7HQGsrZEwIIE2cCAV0IKOANGglTsQIPeOx
 qbUtXnx6oo+xlxniPiuCJAf8y8ICQo4=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-473-IYAD60OuPCu8XAv-ADK7nQ-1; Wed,
 22 Jan 2025 02:09:31 -0500
X-MC-Unique: IYAD60OuPCu8XAv-ADK7nQ-1
X-Mimecast-MFC-AGG-ID: IYAD60OuPCu8XAv-ADK7nQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id ED35C19560A3; Wed, 22 Jan 2025 07:09:23 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.154])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F0C0F3003E7F; Wed, 22 Jan 2025 07:09:20 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/9] hw/sd/sdhci: Introduce a new Write Protected pin inverted
 property
Date: Wed, 22 Jan 2025 08:09:02 +0100
Message-ID: <20250122070909.1138598-3-clg@redhat.com>
In-Reply-To: <20250122070909.1138598-1-clg@redhat.com>
References: <20250122070909.1138598-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
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
X-TUID: GWB/Tkra8noF

From: Jamin Lin <jamin_lin@aspeedtech.com>

The Write Protect pin of SDHCI model is default active low to match the SDHCI
spec. So, write enable the bit 19 should be 1 and write protected the bit 19
should be 0 at the Present State Register (0x24). However, some boards are
design Write Protected pin active high. In other words, write enable the bit 19
should be 0 and write protected the bit 19 should be 1 at the
Present State Register (0x24). To support it, introduces a new "wp-inverted"
property and set it false by default.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Acked-by: Cédric Le Goater <clg@redhat.com>
Acked-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Link: https://lore.kernel.org/r/20241114094839.4128404-3-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/sd/sdhci.h | 5 +++++
 hw/sd/sdhci.c         | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 6cd2822f1d13..38c08e285980 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -100,6 +100,11 @@ struct SDHCIState {
     uint8_t sd_spec_version;
     uint8_t uhs_mode;
     uint8_t vendor;        /* For vendor specific functionality */
+    /*
+     * Write Protect pin default active low for detecting SD card
+     * to be protected. Set wp_inverted to invert the signal.
+     */
+    bool wp_inverted;
 };
 typedef struct SDHCIState SDHCIState;
 
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 318587ff57ca..99dd4a4e9528 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -274,6 +274,10 @@ static void sdhci_set_readonly(DeviceState *dev, bool level)
 {
     SDHCIState *s = (SDHCIState *)dev;
 
+    if (s->wp_inverted) {
+        level = !level;
+    }
+
     if (level) {
         s->prnsts &= ~SDHC_WRITE_PROTECT;
     } else {
@@ -1555,6 +1559,8 @@ static const Property sdhci_sysbus_properties[] = {
                      false),
     DEFINE_PROP_LINK("dma", SDHCIState,
                      dma_mr, TYPE_MEMORY_REGION, MemoryRegion *),
+    DEFINE_PROP_BOOL("wp-inverted", SDHCIState,
+                     wp_inverted, false),
 };
 
 static void sdhci_sysbus_init(Object *obj)
-- 
2.48.1

