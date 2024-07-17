Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp622099njk;
        Tue, 16 Jul 2024 23:32:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVetAPfN4fk1vaQJIg91X0Dw4T9bMzK55ajA3W1Omuzf2aaiHpyxvbHN6Rue/vyaFdzzSyvk3MOKvaFffZAK/VlVgfQrfAN
X-Google-Smtp-Source: AGHT+IGQeqKyxn6+ntvRzQr5VdJHLupqzJfk9Kv/4SK9qlSRM/FJDj3MsbKbYx9RSe4s72KyJRYn
X-Received: by 2002:a05:6102:809a:b0:48f:4bba:778c with SMTP id ada2fe7eead31-49159772e3dmr1129790137.8.1721197963874;
        Tue, 16 Jul 2024 23:32:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721197963; cv=none;
        d=google.com; s=arc-20160816;
        b=AIZW20gxQhiy8CGXGEOPQGlZmGRUeSLYN7MUcvCIN6Zp5p6vj7PdTsO8QzrrBYcFpu
         oDsW5VlndVazWLnQ4+1wx4qgNR5lPxu42hNGK+Ln/jERlAGIOU+gp7xgttlp1URhM8cl
         YGDq85+h3Pc6TinQImST+RVZqMzi5EEkIlNrqMBccsC1rtFlm8zGq79G47ply+0tT4w5
         xOWx3Xd2aetth1L/0eN5zS6zzi3qzwl4L/Ov6Injpo+fJ1xJR1yH6u6qkvSBT+PI0tXG
         yCXtHNkS1SAAZSoyVTfnLNl5kfYrfac5qpbJf/DDBpe8fTFd6kcJOEQQFfHrUTReWGuS
         spew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qOexB7WyGxqggp5qNy9755iGleCM0mUr9kIsaPy50JQ=;
        fh=pmKRfOPFN0ULs83IIygI07LSKzxt8irZuLBhP9+6oM8=;
        b=do/v0AciSsu0qryGOxhi4u6kBid8yGXPpP4EqnLFkbyuWa9h/dDhd0qWLdjJP0y6+c
         Kl8fNdOEzZCSzKWzct37TxFBzrS7cmZhM7SnzeOI/kkH3UzfX5XqmZTsNUYhhwS+9bIv
         yfHBggTDZakykEl5474ZpSpuaMewfcALvIg5FHchDRN1ZIY6df2cmgcKQGKJdwRWq+iU
         /qw76oPfXo/QWfRIHvl+jhr/f1PDYFfEz5DHZOW2M4WrTCUHohImNDQ3Gsviw+AKJkcz
         JlSryuvL5E/sJsq3gVKo9EmImQPjiRPIZWtgqiFJv40CDiKacVEMK0klinju7BVFq4NK
         A7zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ObwZB2SS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b761a1e261si91162616d6.403.2024.07.16.23.32.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jul 2024 23:32:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ObwZB2SS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sTyC3-0007W5-0K; Wed, 17 Jul 2024 02:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sTyC1-0007IQ-HM
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:31:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sTyBy-00031R-Q5
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 02:31:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721197869;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qOexB7WyGxqggp5qNy9755iGleCM0mUr9kIsaPy50JQ=;
 b=ObwZB2SSUm9dfrdfFxxU7IyrtNzPGN+13FBuowa30iUkMdLgcLXurleBbCcyKWpwIT0uwR
 bBCyauT+NitODq7yHyKRgX5xhshhlcLyp+yyg6w1VtTV2wIuNv5Y+hvhR1cla5L6E6BrOY
 geMg05gj+Sp0BRqdZkvacgTtCDaRWUM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-691-2jPDjp8pPEOkwvNFTvkI3A-1; Wed,
 17 Jul 2024 02:31:05 -0400
X-MC-Unique: 2jPDjp8pPEOkwvNFTvkI3A-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 285471955D45; Wed, 17 Jul 2024 06:31:04 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.88])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1F6141955F65; Wed, 17 Jul 2024 06:31:00 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH v2 6/8] aspeed: Add boot-from-eMMC HW strapping bit to
 rainier-bmc machine
Date: Wed, 17 Jul 2024 08:30:20 +0200
Message-ID: <20240717063022.549849-7-clg@redhat.com>
In-Reply-To: <20240717063022.549849-1-clg@redhat.com>
References: <20240717063022.549849-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: Q1bLEY3W1vaW

From: Cédric Le Goater <clg@kaod.org>

This value is taken from a running Rainier machine.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index bc4ca1754213..a8f5c14ae535 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -189,7 +189,7 @@ struct AspeedMachineState {
 #define TACOMA_BMC_HW_STRAP2  0x00000040
 
 /* Rainier hardware value: (QEMU prototype) */
-#define RAINIER_BMC_HW_STRAP1 0x00422016
+#define RAINIER_BMC_HW_STRAP1 (0x00422016 | SCU_AST2600_HW_STRAP_BOOT_SRC_EMMC)
 #define RAINIER_BMC_HW_STRAP2 0x80000848
 
 /* Fuji hardware value */
-- 
2.45.2

