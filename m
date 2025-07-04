Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1064027dyc;
        Fri, 4 Jul 2025 01:37:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWPYeskRCloY8WExZLKqKzaY+1UsQPW/EI0OywjSv4LGN7ZltIp8OHrxZ3MQIYy11AYDZ0HZX+CyGkB4A==@linaro.org
X-Google-Smtp-Source: AGHT+IGeGlKuntL7PJKw+Ex/p0iF+sclZ02Fh0bXUH+AUo4a5TEoAGDaEr/Pu9/l+2pfl7zNu2fB
X-Received: by 2002:ac8:5813:0:b0:4a7:146b:d762 with SMTP id d75a77b69052e-4a9964cc981mr31677821cf.13.1751618273492;
        Fri, 04 Jul 2025 01:37:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751618273; cv=none;
        d=google.com; s=arc-20240605;
        b=CQ0mMQsVI2m7llQH94U0Tlw7y3xAGyuRdBpWEosG/ZpgmfAIO+maoxSEr6s2KN7Y1R
         9FCvsY7JXpa2St5s9XK0PRv1od9SZk/ND9yPgH/uFnHdxblPFZZlm8hu1StxGKHnOkiF
         gj0YMEGdFxdREiri+cx5yLfYiJidxLrqynFrbTIe6nKMA3zvzEdDMam8NN7uoisXghDe
         Z45Am+ePZViv8Ex1YTR6Y1sj7rnLlYuaOFAhMKsNXGIs/7/hiwSTjmMjUYpmIA8GpEWk
         PNHIJJEs0EL/SLE5T012z7wxzs63g7xvbOXUlfAvfN2IpAU0rAucirs9IL9CVRnr89+5
         Wyrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sWr81vkL5T7DDDCC7TyKIQDpax0Lrf+zBaTUE1REbDA=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=J/15aNLmfqCeZ+X5aWYcH0/SI4KXanVRKDw/wfwW6/v2k/OhHtqy+coV4HbxJ2aG3x
         gw/EcrnKm38HEw//rJxzxpwk1qg3ytJbZjfVlFTd88gvjmcQKko6bJxCDcUp5wg1FvTA
         e19hjZBX77AAR4tq1QCnIBerlBh4/yXJag2vlyO7hYPP4ffHXQel9MlXe0xg8W2ob53e
         sCu0kUaHJdxDgiLCiAbF6HqFfjdtAx1uLavKn0lX1CnxUx3mYBSm2Vik4Q+SFGS7igpZ
         3HKwgtdbLgrPgLwOMi51QIBgUvveZI1UASTal+knDpHJvcDndhXfwK8f5DkmunmmHNNv
         yvWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AXvvUXF9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a9a00da5f6si274931cf.558.2025.07.04.01.37.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 01:37:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AXvvUXF9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXbvW-0006Z1-4N; Fri, 04 Jul 2025 04:37:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uXbvT-0006XN-VR
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 04:37:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uXbvS-0004M0-03
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 04:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751618261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sWr81vkL5T7DDDCC7TyKIQDpax0Lrf+zBaTUE1REbDA=;
 b=AXvvUXF98xMyPCRAqIB3//VTMVYOaK5GYqB3/SBEB3emPKAE+v0iht4IsPolh28VwLhPIW
 n+UEyM/D4gw8GIePmMWbUHYJe7S+0rppFWBVFvPZAwLXer7M06uJaEhuQGSLknLlFIUYpO
 57AxXsjHYGAAGjxMM6bWbK+mwUFOdvw=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-332-vjlii2tUNz6fEWfFH0G-SQ-1; Fri,
 04 Jul 2025 04:37:38 -0400
X-MC-Unique: vjlii2tUNz6fEWfFH0G-SQ-1
X-Mimecast-MFC-AGG-ID: vjlii2tUNz6fEWfFH0G-SQ_1751618257
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4C14D1801207; Fri,  4 Jul 2025 08:37:31 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.43])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 95F58180045C; Fri,  4 Jul 2025 08:37:28 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 01/11] hw/misc/aspeed_sdmc: Skipping dram_init in u-boot for
 AST2700
Date: Fri,  4 Jul 2025 10:37:13 +0200
Message-ID: <20250704083723.1410455-2-clg@redhat.com>
In-Reply-To: <20250704083723.1410455-1-clg@redhat.com>
References: <20250704083723.1410455-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.237, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: cSSuWZSF5RLr

From: Jamin Lin <jamin_lin@aspeedtech.com>

On AST2700 SoC, QEMU now sets BIT6 in VGA0 SCRATCH register to indicate
that DDR training has completed, thus skipping the dram_init().

To align with the recent U-Boot changes, where the Main Control Register's
BIT16 is checked to skip the dram_init() process, this patch sets BIT16 in
the SDMC Main Control Register at reset time.

This allows both the main U-Boot stage to correctly detect and bypass DRAM
initialization when running under QEMU.

Reference:
- QEMU: https://github.com/qemu/qemu/commit/2d082fea485ee455a70ed3e963cdf9a70f34858a
- U-Boot: https://github.com/AspeedTech-BMC/u-boot/commit/94e5435504fb0d8888f5c1bfd3fa284cdd6aaf9b

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250618080006.846355-2-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 hw/misc/aspeed_sdmc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index f04d9930dd79..dff7cc362d32 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -570,6 +570,9 @@ static void aspeed_2700_sdmc_reset(DeviceState *dev)
     /* Set ram size bit and defaults values */
     s->regs[R_MAIN_CONF] = asc->compute_conf(s, 0);
 
+    /* Skipping dram init */
+    s->regs[R_MAIN_CONTROL] = BIT(16);
+
     if (s->unlocked) {
         s->regs[R_2700_PROT] = PROT_UNLOCKED;
     }
-- 
2.50.0

