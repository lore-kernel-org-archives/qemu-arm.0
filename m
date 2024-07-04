Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp382142njb;
        Wed, 3 Jul 2024 22:38:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXUO3k8PKJt2d3lmxmoq6RlPTW8pk1PLMcgyavHUPLHGujLez+PjK0xf3OfsOBNBdWPPg9BdgfeLe1h12uSLDCj9j91aacc
X-Google-Smtp-Source: AGHT+IFd5TdAFFut/FTFyfdwxFxUStGKnCvZg67RhBtokaAhVwCqPeg2fwCq/btXxAEniD7DZeWV
X-Received: by 2002:a05:620a:24d6:b0:79d:569a:6997 with SMTP id af79cd13be357-79eee29bf0amr86575485a.70.1720071479985;
        Wed, 03 Jul 2024 22:37:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720071479; cv=none;
        d=google.com; s=arc-20160816;
        b=uvskSreH0X+GRSwnz8aQySlEb/RS4VshYZ3nTC/0c7QFWntEGieckv/fpvzh5Rfe0d
         HY6xNWbf8UzBLMYtXLuopK1tZ+k0ldEdp97yM3AGnf/kxySEbO3wNzGGYfbkcCr/wxFW
         9Iwi0VY55JaxM/wFGcCZ0qXrgmzh0KZVSrBGOk2XTfYsQQEls8iXWGsmMvR1psVhzIFe
         uZxsiUrjhFDs+JZqOFEK5NjrRzEJzzlCEwvjsfYjXgf1KcmFs8KBtOd2HC2wjdpL0RNy
         1qqBykHtPpayeXZ27UU813DO24wC9EG2nBoa3Kc0st9PKZMOyQbIPubb84Eo4HghbHes
         NTMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=RwZa0iw1fC8RAnStKYB5gZEv3NCE4cROCsa+dH6KadY=;
        fh=pmKRfOPFN0ULs83IIygI07LSKzxt8irZuLBhP9+6oM8=;
        b=iKbkYDDTbmTa1Bj2gzgSVlQnCRHwbduv8EyFTb+qHoPQakKvRiFgHDSCkQTLeLE+af
         /d1WpRElppnYF4nm3B6y6ggvpKLoXLlpmJruMmT/4jVRyi78ionFR+hO8sbf2hAC2FFk
         IKKDrxUI1j9w4uv3yKUHxDN7eoGmWTuF6CvccdvfMbb2B2P3+XX6TpCgF9DWJYAmykPD
         ZkyqyPAmzIirpIDsnLOJ4nxs6HScfzAMfx1eVwhBY0G4VNz6/P65+yHofMwVCJJhd7FG
         2LhfU0Wyflf8SUim0fjsTlTIa3/tMxko50LEbTXB7wfm5PjO8IyHNUZnnpme7zKg51tW
         dwvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HJEFghvC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d692f0b2fsi1521554285a.273.2024.07.03.22.37.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 22:37:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HJEFghvC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPF9g-0001og-RK; Thu, 04 Jul 2024 01:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sPF9d-0001kx-Fc
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 01:37:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sPF9b-00024U-W6
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 01:37:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720071431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RwZa0iw1fC8RAnStKYB5gZEv3NCE4cROCsa+dH6KadY=;
 b=HJEFghvCwttcKt0b6cuDv6TNNHUaikqTG0fC/Kehkfl+fAGTrMA04yaiv4/b5g/OBjHA2b
 zUESGPPC3tHQCvp76E9u82SShhGCebf/ZrOLzmfF9WTy7RDUIFAdQ++3tlsfbghhO8E/ol
 iYcPibp0eu+xaJsjD4/rRIRmLN6rmFU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-531-vB51I3D-O0mrumKtubVSsA-1; Thu,
 04 Jul 2024 01:37:05 -0400
X-MC-Unique: vB51I3D-O0mrumKtubVSsA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 859501956080; Thu,  4 Jul 2024 05:37:03 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.90])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B54651955F4B; Thu,  4 Jul 2024 05:36:58 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 1/8] aspeed: Change type of eMMC device
Date: Thu,  4 Jul 2024 07:36:44 +0200
Message-ID: <20240704053651.1100732-2-clg@redhat.com>
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
X-TUID: TFCnLgEj2zMb

From: Cédric Le Goater <clg@kaod.org>

The QEMU device representing the eMMC device of machine is currently
created with type SD_CARD. Change the type to EMMC now that it is
available.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 53a4f665d0d0..105b990233fa 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -327,14 +327,14 @@ void aspeed_board_init_flashes(AspeedSMCState *s, const char *flashtype,
     }
 }
 
-static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo)
+static void sdhci_attach_drive(SDHCIState *sdhci, DriveInfo *dinfo, bool emmc)
 {
         DeviceState *card;
 
         if (!dinfo) {
             return;
         }
-        card = qdev_new(TYPE_SD_CARD);
+        card = qdev_new(emmc ? TYPE_EMMC : TYPE_SD_CARD);
         qdev_prop_set_drive_err(card, "drive", blk_by_legacy_dinfo(dinfo),
                                 &error_fatal);
         qdev_realize_and_unref(card,
@@ -436,12 +436,13 @@ static void aspeed_machine_init(MachineState *machine)
 
     for (i = 0; i < bmc->soc->sdhci.num_slots; i++) {
         sdhci_attach_drive(&bmc->soc->sdhci.slots[i],
-                           drive_get(IF_SD, 0, i));
+                           drive_get(IF_SD, 0, i), false);
     }
 
     if (bmc->soc->emmc.num_slots) {
         sdhci_attach_drive(&bmc->soc->emmc.slots[0],
-                           drive_get(IF_SD, 0, bmc->soc->sdhci.num_slots));
+                           drive_get(IF_SD, 0, bmc->soc->sdhci.num_slots),
+                           true);
     }
 
     if (!bmc->mmio_exec) {
-- 
2.45.2

