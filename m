Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1307385njc;
        Sun, 21 Jul 2024 01:15:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJs0wtGsxl0W8vRnXnofOpN+ROazSpUKOdpDkrfSQnHmKBPlxxbvbqueW2o3MDQYe7WPzNJTm1wvN6en65eoeFrk9L1Zjk
X-Google-Smtp-Source: AGHT+IE8fAmlw1lVr9yK16piIooUZqoDGVVhaXCMwvBMHCEPXLo3caa4Ybwz6jJtC9pziABWT/8r
X-Received: by 2002:a05:620a:4048:b0:79d:76e5:be75 with SMTP id af79cd13be357-7a1a652f4a7mr380209485a.10.1721549720011;
        Sun, 21 Jul 2024 01:15:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721549720; cv=none;
        d=google.com; s=arc-20160816;
        b=ZGcebKjfLve8zqyOjNeuGLmRMPBzTiXOlfpHRzpgOG0HTPISZnRlp4HmCahxg7+vVg
         c5wU2vsPN9diyYV8UWAy/nPZ57E9rMeJ3zA+7gIfWuUTJ9oGzrkn14h8AfaawrEUbR1L
         ta8o4NX558ibOYtrpIpBo87mjsG+Ment8/jlxiKlGuz78ps72qRBVIVfPXOBKS/tSR24
         y/T1S4Qrj8jDR2xL018iYDHYxRWFbv8PcEKjZ7Qwjhl/FSqvKt1r15ZpQ5xwX696jtHN
         wtZ6Xb3pwGIYdSJvykTPBzEvAJuJ3j6gdMjd2tLMH7Wq5qU6029ZmueNSypgU6FcNC95
         cpUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=P22pVQ9dGSl8PCwVL4BzRFDUNPETI9xOUK+0Pf/DuSM=;
        fh=LlOmBw4GbUlDF52fQ9hCMPVPTJOoo92XRnaOjjrcWE0=;
        b=ff+8yiNuTYbPr+mz8l3ow3sOht+0Q/4CRGkvQaQJYlQ64okC40FA4QA98tU60Eq/cs
         YVvM1vqRADN1SDR49OI4bg8kICThBIGRlgftEpxS7TzE3BT32gz4tGskvmjFt4bwQjsT
         yA2iACbYdsIDXmiM0DGA7IzPtiXHLS2ZA26CvBuffwH0Tl8muo8H+DqphKRiZINOXquz
         TAV5o1tZyO4qxGMAT3xidcC+0f+TNF/1f5QvrCDvDQwBio1I0Fnd7JHYsOadipu0L4tx
         BiayyrODVsjxeLq7hqlV8gyW8DdEArXoSE7RO3QDqvSbwzMZPIyGYIE6jNBKWoQFY8jd
         wYCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ABHcuuJt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a19904adecsi533239985a.271.2024.07.21.01.15.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jul 2024 01:15:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ABHcuuJt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVRiU-0001Ev-94; Sun, 21 Jul 2024 04:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRiA-0000nf-5E
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRi8-0001Oz-48
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721549667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P22pVQ9dGSl8PCwVL4BzRFDUNPETI9xOUK+0Pf/DuSM=;
 b=ABHcuuJtADAtSrATvzJYxYigsBzfusM1Jmc2CHejJ3VaGTPEGYTj3bbeoeaFC9p/DwxNBF
 gB7WVThaCHMfCjcUGtANav2e6vkXHafHhvXi3BWTMtMC1yyFxx2V0b1Rr6Xq37EUPRTyl4
 6BRLslYb386UG2Y5O4wlC+4Wtbikxqo=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-271-eEu_MiwWNEGpUsxXCAiJqg-1; Sun,
 21 Jul 2024 04:14:23 -0400
X-MC-Unique: eEu_MiwWNEGpUsxXCAiJqg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 92AC41955D42; Sun, 21 Jul 2024 08:14:22 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.37])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id ADA7A1955D47; Sun, 21 Jul 2024 08:14:20 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 07/15] aspeed: Add boot-from-eMMC HW strapping bit to
 rainier-bmc machine
Date: Sun, 21 Jul 2024 10:13:53 +0200
Message-ID: <20240721081401.425588-8-clg@redhat.com>
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
X-TUID: umOYUwoFfuV5

From: Cédric Le Goater <clg@kaod.org>

This value is taken from a running Rainier machine.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Tested-by: Andrew Jeffery <andrew@codeconstruct.com.au>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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

