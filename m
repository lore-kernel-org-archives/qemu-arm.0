Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp621635njk;
        Tue, 16 Jul 2024 23:31:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX8FeYI2So4SNFFtcZ90I7lFrJcUzH6KzTniacw9Ac/C/MXZVJywTQcTxh+sOk16FmnxorR4caB7/TXK0WcdUJu5nv9xrsz
X-Google-Smtp-Source: AGHT+IGObHO1aFCR0kJ3021Ii2oAA7lPMTrLjE+4IXznmyo5as3Beqs3BgAL1dJ3aZR+FuhZ9vIN
X-Received: by 2002:a05:620a:1998:b0:79e:f9aa:8746 with SMTP id af79cd13be357-7a187454af6mr80871885a.40.1721197881737;
        Tue, 16 Jul 2024 23:31:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721197881; cv=none;
        d=google.com; s=arc-20160816;
        b=eKUGtf/SSmUCkJ6t4tMq3hmvGa4/ifTs+Sf8kJ+MRS8pFxcTZX47H25bpQq0mC2QyG
         +Yc+vMyimmLZvXnvyG5HX2E9LQcRzxtJpUzrmMBZxEI//abJAgR3eIOqhQBhWsC3IH6B
         GOLIknMgaKzDeuJGP1M7i6eEaj6ZGL74T6yw5sGX/7nXW1FpBJ15lbbzp4u3P+F3Cull
         VyH37NZRHSakLeNTkeZIzwSko45+d5fp9lr7neG8I/Ylvr7XKruHEzbplahOS2Gp6d5g
         I5nsWmBR8PjRiBNQ3mMLBvunAUdZBce46XTJRCDce90fl8qxAMDPKqnxQAth3HsWExOV
         li5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=INwSMjTLEh4jgAFahlwen+M5AHhr/1WenMun+GLHgaY=;
        fh=pmKRfOPFN0ULs83IIygI07LSKzxt8irZuLBhP9+6oM8=;
        b=0rvLStzcqqhyqqttwpwWVSqFDc9V2O7re2cHrZCf06466ZJLwztI7AIMEn3I7a4FS6
         prCwdZC6mTgZTDzvg2pSLvvafHLmXqyuPpSmYHKDcjcTyY1wWTXjJ9o7NDpK3lEoH9eA
         crhgIKLpaH2XqigUF+RehxLDKbQGKinRZrK7W7v/jRpVpc64LNECPHkHHIs+FDgJ+G0t
         DElO4muTgk2tZJ9swY0E54JeRqVmGypBkwiRopygjEpRk9ZDsQHKRcGDEvD41zxYParV
         kOlU+ZKf9raW8uPA/gAav1mSy7SEyRYW/oPhiTt25SEUaX6LMMmqRd6gX8QtPdCbL2RG
         rK/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f0ShZvbC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a160c7da65si870128785a.563.2024.07.16.23.31.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 23:31:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f0ShZvbC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sTyBy-0006tb-RK; Wed, 17 Jul 2024 02:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sTyBw-0006hJ-CB
 for qemu-devel@nongnu.org; Wed, 17 Jul 2024 02:31:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sTyBu-0002z0-4j
 for qemu-devel@nongnu.org; Wed, 17 Jul 2024 02:31:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721197864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=INwSMjTLEh4jgAFahlwen+M5AHhr/1WenMun+GLHgaY=;
 b=f0ShZvbCZhFbISQPrhQoxlpWALsyCL1NfC5poeJW4PZmW22lxAedbNotKFNzh2pLCdtaoI
 9kflpqwXHQrp56APMIEKRekLLDeYUNzYaQtKojiWhmlzp26s62D72Mhz17llrUFtTq7+Jz
 UMmQ13+yHoq0sgzM1NB/niMw4iNUtrw=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-192-Ax-0UwrOMiOHSh-LXK9O5A-1; Wed,
 17 Jul 2024 02:30:54 -0400
X-MC-Unique: Ax-0UwrOMiOHSh-LXK9O5A-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 20AD21955F0D; Wed, 17 Jul 2024 06:30:53 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.88])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BB48A1955F6B; Wed, 17 Jul 2024 06:30:44 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 3/8] aspeed/scu: Add boot-from-eMMC HW strapping bit for
 AST2600 SoC
Date: Wed, 17 Jul 2024 08:30:17 +0200
Message-ID: <20240717063022.549849-4-clg@redhat.com>
In-Reply-To: <20240717063022.549849-1-clg@redhat.com>
References: <20240717063022.549849-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: 5LXzzdR4vTzP

From: Cédric Le Goater <clg@kaod.org>

Bit SCU500[2] of the AST2600 controls the boot device of the SoC.

Future changes will configure this bit to boot from eMMC disk images
specially built for this purpose.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 include/hw/misc/aspeed_scu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/hw/misc/aspeed_scu.h b/include/hw/misc/aspeed_scu.h
index 58db28db45aa..356be95e4585 100644
--- a/include/hw/misc/aspeed_scu.h
+++ b/include/hw/misc/aspeed_scu.h
@@ -349,6 +349,10 @@ uint32_t aspeed_scu_get_apb_freq(AspeedSCUState *s);
 #define SCU_AST2600_H_PLL_BYPASS_EN                        (0x1 << 24)
 #define SCU_AST2600_H_PLL_OFF                              (0x1 << 23)
 
+/* STRAP1 SCU500 */
+#define SCU_AST2600_HW_STRAP_BOOT_SRC_EMMC            (0x1 << 2)
+#define SCU_AST2600_HW_STRAP_BOOT_SRC_SPI             (0x0 << 2)
+
 /*
  * SCU310   Clock Selection Register Set 4 (for Aspeed AST1030 SOC)
  *
-- 
2.45.2

