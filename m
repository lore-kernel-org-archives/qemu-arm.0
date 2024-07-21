Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1307330njc;
        Sun, 21 Jul 2024 01:15:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUbJi+Q2T3PW8Vi+Kicn1cy9gUtBihxcbiy0QaZ2n4C7GW3MdXYPk4ZVNZB6JdjpaTdwzkBjBwu93UvX2g2XVfCr7TM6zyj
X-Google-Smtp-Source: AGHT+IEiiikBvq0NbMjgI5joPmVuo6xNOEs0cf5rsKd0MWrPuI8TyOuKjLyToyVeliWisJ8YVKYO
X-Received: by 2002:a05:622a:210:b0:446:54f5:3181 with SMTP id d75a77b69052e-44f96afa4aemr160740601cf.24.1721549710384;
        Sun, 21 Jul 2024 01:15:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721549710; cv=none;
        d=google.com; s=arc-20160816;
        b=h2ZyP0j6FUflChGHospmJtVcMfOaPbaN+QqevfGU9ivXnKPPjXSQciVIkwE9dwugiA
         hJeJcuJD7hOaVg1tqHXo+W1nJnKFr85CGHa5ajXtXQ3TpIH5894VgrwtsrlFmrdDlWNy
         TSgIBNZnks2y6lmvtJEuWwtAMYPHFnOoA5bn7/T6BP6fFuZcX3IHVBqEzrwieMD0+wzd
         et9tnFDBX2NsLYOCInfaAfIYOEYq8o3FKYIgIKxXZojRa620XGkweNCPGRqTPZVqGtIj
         9s74vTvN5c3cNC2rX0MH9PduFkCsg6l7Ot1TvhmWjtEaF4yU4aI/yRtjHxhSasn6aynp
         W1wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=zhWu2Yd5rJYdn0tTPfoY5PzEMJvKCm7HzreJ6dHu86c=;
        fh=U+pgw5zWyh0txsIPXqXWEgRrZmNUKJnt6wlGx5WXIlQ=;
        b=G76RrhFcnkRJde+X/hykLvwzKJxrUdadCJP3pBkpMLEWrc/vvTxJAQVm0n6ALtSt98
         ykQ+D49BesZnDzNrGSE18WD6xEL7e5PBWViPvy7oyfg6lNPj4zRJfFkFYkwFpkP85nfg
         Z3J2HXIgBnK+UWwTX2wrDaA6ll+MhgQscgn1fMaIgTgcqtl05TxK+j2ERpHkzSXY75cN
         q60khS65ARVec358AfHuCcTtURORfjMhNjTMPyROL7azRmfViVfWrrK5/JxzeUDPbnZS
         LhuZA5zZZxsCVhJk7jZK/V7BYmpONF0J9wBC2f+Q5bQ1DLGdPT8Tw4i9AXX7ps8UwPfJ
         WV7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ExRE6qZ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9ccf859fsi49187161cf.124.2024.07.21.01.15.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jul 2024 01:15:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ExRE6qZ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVRiQ-00011G-Fj; Sun, 21 Jul 2024 04:14:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRi3-0000js-7T
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRi1-0001O8-SR
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721549661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zhWu2Yd5rJYdn0tTPfoY5PzEMJvKCm7HzreJ6dHu86c=;
 b=ExRE6qZ6MOfrKKO0Z1hxifeYeDXB0J3p2aGvnABtMSt5T1XTV8E+eFOJ2hbEQLEx+bJQX6
 3DUG9A76seDbUDPDSImqrgwQkl4QQTDYpE465udW/ExecXa2g5Lb73yC9VjelI1waaiqYm
 g8C3C5h9oisVGR7GDApgP+/9m/54Y9c=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-98-JUkoZiZ2PT2J-NOvUlTIrQ-1; Sun,
 21 Jul 2024 04:14:17 -0400
X-MC-Unique: JUkoZiZ2PT2J-NOvUlTIrQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id A842F1956080; Sun, 21 Jul 2024 08:14:15 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.37])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1A69B1955D47; Sun, 21 Jul 2024 08:14:12 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 04/15] aspeed/scu: Add boot-from-eMMC HW strapping bit for
 AST2600 SoC
Date: Sun, 21 Jul 2024 10:13:50 +0200
Message-ID: <20240721081401.425588-5-clg@redhat.com>
In-Reply-To: <20240721081401.425588-1-clg@redhat.com>
References: <20240721081401.425588-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: 4Rm4k2BXKcCq

From: Cédric Le Goater <clg@kaod.org>

Bit SCU500[2] of the AST2600 controls the boot device of the SoC.

Future changes will configure this bit to boot from eMMC disk images
specially built for this purpose.

Signed-off-by: Joel Stanley <joel@jms.id.au>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

