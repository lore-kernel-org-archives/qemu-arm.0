Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1064604dyc;
        Fri, 4 Jul 2025 01:39:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWUSBJxeke8XFZ4bQHbYT71SACyGp99Va5BQyH1Xc03n4OwIYTHWUUqve1iU+GwCWrdTwvr+sULWY9a8w==@linaro.org
X-Google-Smtp-Source: AGHT+IGmO5l0B6slyuRkWyq+SKv4v7m9H7SwDCl4mvLo1hzpR8wDbVxAutisO5kCfr/opJQoWyP2
X-Received: by 2002:a05:620a:2988:b0:7d2:fc7:9572 with SMTP id af79cd13be357-7d5ddcaec7amr214912585a.57.1751618354501;
        Fri, 04 Jul 2025 01:39:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751618354; cv=none;
        d=google.com; s=arc-20240605;
        b=Il4x2p4mc2t3vBvmMoA7NGYk7wv//mHkOLTj6uPgnSKVQ+qBPFJMliI0/Ijc88kfHB
         iUVc75lFq2qKW978o2kXBh1q8XJbuZUbnJe22idr5YsQ+F90wrxG4trA/M39ksbXyf2B
         IIeBTHJUzBcUs25qhaNdEiMvi1Va18m4ZrOY2nIjOKvxAJtOKbq2Wi8djTr7AuEKqBPx
         TuLEc9I5Nu8SVEaL3rCf14C9rlwE5zWWU7Z9dJXOPAo7e4Uud2BXT7oqIxSigf7a7IqD
         OymsxovfAjDzQ/KFjramidnpjtc6rTeH8Ks1ZN7tG4qcJ/cm7YJeowtHWnYENsEatVK2
         Eijw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=d/VrHbWi3qt+IqVCDnvLAyU6uKWggJeSDh/Nh9fbyWo=;
        fh=WCd+HP7/FsmbEbWw+7riHzfL7o3+UcMPBMMrs6IKlUM=;
        b=eJRQOKMdCqV4kkuH60dLpovqErqxuLY7vVJIDbZVXIO68EFlzDRpfrkCcfYvTqbq0L
         QiSUrj533sRdrAKQP1sDcIzqQBDUUGDlTOTDFieY8lJ2ocLWS0XxY2lNzcuJBdh6UyDt
         AZmTQCX+Pukkb68q/nzv8x5KYpARJ4iD8Y0NseAuTvx401b32mlUTA/B92VRLCJMbWx0
         w7nSKHAQqrI6pLhkc8qk9KVeEDjUxu1V5xRpDvYJ4+JlxOp/liEWAEPxR9TrWqYDl3ON
         +KcrmokanNRyFekJCFDY/fNcgGgx9QsesjsqtYwknuqxsWxAX6nhLp2rr+z98MLKNDMq
         TXAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XIB+81ea;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbdea493si158301685a.146.2025.07.04.01.39.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 01:39:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XIB+81ea;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXbvo-0006g4-65; Fri, 04 Jul 2025 04:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uXbvl-0006eY-Rm
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 04:38:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uXbvj-0004TO-Sp
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 04:38:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751618279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d/VrHbWi3qt+IqVCDnvLAyU6uKWggJeSDh/Nh9fbyWo=;
 b=XIB+81eaTk85ZyOidWbHmM2FGKZVdUgk0hBn7mdPa70iUPyJ5hArwR0rCEpQTOZhf+C8AL
 AFfGA3E1PLcv24WWyG4MIH+EFxhD36yvHe1J/JoCpll6IYXr3qwpxGB2LlYfTmwqUU8jtm
 nuELErgsCriwzcMbDoR5HMhwU1gfZps=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-672-gs_n5eJkO2C2jWi5TzvSjQ-1; Fri,
 04 Jul 2025 04:37:55 -0400
X-MC-Unique: gs_n5eJkO2C2jWi5TzvSjQ-1
X-Mimecast-MFC-AGG-ID: gs_n5eJkO2C2jWi5TzvSjQ_1751618275
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8BC841808984; Fri,  4 Jul 2025 08:37:49 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.43])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C39A01806D3E; Fri,  4 Jul 2025 08:37:47 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Ed Tanous <etanous@nvidia.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 08/11] hw/arm/aspeed: Add second SPI chip to Aspeed model
Date: Fri,  4 Jul 2025 10:37:20 +0200
Message-ID: <20250704083723.1410455-9-clg@redhat.com>
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
X-TUID: V3qDtPTK0RKp

From: Ed Tanous <etanous@nvidia.com>

Aspeed2600 has two spi lanes;  Add a new struct that can mount the
second SPI.

Signed-off-by: Ed Tanous <etanous@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250703144249.3348879-2-etanous@nvidia.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/arm/aspeed.h | 2 ++
 hw/arm/aspeed.c         | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/hw/arm/aspeed.h b/include/hw/arm/aspeed.h
index 973277bea655..6c364556565a 100644
--- a/include/hw/arm/aspeed.h
+++ b/include/hw/arm/aspeed.h
@@ -35,7 +35,9 @@ struct AspeedMachineClass {
     uint32_t hw_strap2;
     const char *fmc_model;
     const char *spi_model;
+    const char *spi2_model;
     uint32_t num_cs;
+    uint32_t num_cs2;
     uint32_t macs_mask;
     void (*i2c_init)(AspeedMachineState *bmc);
     uint32_t uart_default;
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 94897505f8e3..8d7757e11f1c 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -465,6 +465,8 @@ static void aspeed_machine_init(MachineState *machine)
         aspeed_board_init_flashes(&bmc->soc->spi[0],
                               bmc->spi_model ? bmc->spi_model : amc->spi_model,
                               1, amc->num_cs);
+        aspeed_board_init_flashes(&bmc->soc->spi[1],
+                                  amc->spi2_model, 1, amc->num_cs2);
     }
 
     if (machine->kernel_filename && sc->num_cpus > 1) {
-- 
2.50.0

