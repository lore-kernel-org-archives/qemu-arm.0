Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp382342njb;
        Wed, 3 Jul 2024 22:38:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX6yi52z0DxUaL4Nedjw4+5HsfRS/5p18DMzyv2mOs7cppdLT0n6YG+/89XVCKuz1A8uSJw3JMmt/sFdiaXEgskprpLqJfP
X-Google-Smtp-Source: AGHT+IG3PulrzbvvIx6Aq+8dauIAxE6hNTSLdYR13/LggwsQVHmy61iJTWMoiJJr7LFXbALjSUfk
X-Received: by 2002:a05:6102:22d6:b0:48f:a76a:7d with SMTP id ada2fe7eead31-48fee88d8b2mr592107137.18.1720071512905;
        Wed, 03 Jul 2024 22:38:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720071512; cv=none;
        d=google.com; s=arc-20160816;
        b=Yas1M1PxcYcygjtqlsYqNpXJN89HcALkfKEUrqyFZKqrOdAcB55Xsd8F1NLoMud7Sw
         VW26O4bCf8cYk5wmfmqZNlDAHGTSkAddtBFCGOUX3CQ1a1z9KzCWQFqwSj+w48DUgCb8
         6wO4vkFrDICmGOGfHy2CrTWfzZoJaG/AB6s/24kSR/GxKDDOBq2R+IgVPv94XDjygECy
         YUgfFDU755u70TPSlUJQtARWasRy85O/bhvlY72nxlgK/N17g+WTMJcNigVHML9bd8Qm
         RCgLTQ/Px8VONufmmRwK7MfxLZJpDHxLVYoyzdKmw6YzcrUDslRAZmX34TY09+qu+f8O
         2hPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=M9EkA4lsBVIe7nvwfiaVBV6Hg3nJetX6HwtMgX/C+DM=;
        fh=pmKRfOPFN0ULs83IIygI07LSKzxt8irZuLBhP9+6oM8=;
        b=hnYLtfVOlpn/rlSyX0gWxWI1aatljdHYEaxrP2Z4pD16b/tyLjHiCgLCZcsk1EwMj8
         74TiLIssMbCPfu7UOkLrP8JPITBH0nMTniVC/1FYcjsLZ43TD8gOyr8jva+8zDhq/fbg
         6Cd0KqObVIvvUaXOOrRT/x/QTgchF1at8T3qmkeQayKpclcUD/qSmAz7+bZL16Iou54l
         LIVXDbdGzb8IF55hOoBjT9s7rJTDMHFk6PbaT4VGJT+jKb7sRUCZ17aZpg+TaSudlTYp
         +F3+3u03vPyjb9RQAs7vGIjW4Rlwz/nU+6bQ2LqFQu6FlNV1scQ9Uc4jNmPBkhxjhPmT
         ZTig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ILm5p3MV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79ddb81ba55si372602485a.309.2024.07.03.22.38.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2024 22:38:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ILm5p3MV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPFA1-00026d-UO; Thu, 04 Jul 2024 01:37:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sPFA0-00025N-SC
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 01:37:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sPF9w-00027i-Aq
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 01:37:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720071451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M9EkA4lsBVIe7nvwfiaVBV6Hg3nJetX6HwtMgX/C+DM=;
 b=ILm5p3MVMOhvVHIeuBZ6ISs0BmgUdljYVXnOR+OYouElGKhehF7Tr6ZFaj0rS4J3UVPn32
 99d5ALL2uiDUvDM6SAwz+X3A10rZHajiV1A6JGFgxNWg8HjRwxIy/b2zKnZH4t2EDOkd2m
 UEODj+Y5eXpv7zKu1nuKBMbyrZH6zrc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-232-8u3gCQc9Me6ehF0uUx5gUw-1; Thu,
 04 Jul 2024 01:37:24 -0400
X-MC-Unique: 8u3gCQc9Me6ehF0uUx5gUw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6B629195609E; Thu,  4 Jul 2024 05:37:22 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.90])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 583D5195607C; Thu,  4 Jul 2024 05:37:19 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 6/8] aspeed: Add boot-from-eMMC HW strapping bit to
 rainier-bmc machine
Date: Thu,  4 Jul 2024 07:36:49 +0200
Message-ID: <20240704053651.1100732-7-clg@redhat.com>
In-Reply-To: <20240704053651.1100732-1-clg@redhat.com>
References: <20240704053651.1100732-1-clg@redhat.com>
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
X-TUID: gewri4bzLMB9

From: Cédric Le Goater <clg@kaod.org>

This value is taken from a running Rainier machine.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 hw/arm/aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 135f4eb72215..abd2412ad8b9 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -189,7 +189,7 @@ struct AspeedMachineState {
 #define TACOMA_BMC_HW_STRAP2  0x00000040
 
 /* Rainier hardware value: (QEMU prototype) */
-#define RAINIER_BMC_HW_STRAP1 0x00422016
+#define RAINIER_BMC_HW_STRAP1 (0x00422016 | AST2600_HW_STRAP_BOOT_SRC_EMMC)
 #define RAINIER_BMC_HW_STRAP2 0x80000848
 
 /* Fuji hardware value */
-- 
2.45.2

