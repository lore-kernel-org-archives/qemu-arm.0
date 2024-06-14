Received: by 2002:a17:907:681:b0:a6f:694d:5ff8 with SMTP id wn1csp92652ejb;
        Fri, 14 Jun 2024 00:28:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXuH7fQNfLw7E2Llkrvqy/xQ0c9sKpoAXpDQ+1JaHl/UnH+bh+32aSnY1kU5u7mnHniKy/rAut6L+De/YgRqsCvQwQCS3uJ
X-Google-Smtp-Source: AGHT+IHbFGGE5RA/Xn0BPj2Mzqz5g0zLZb1goRpAP6O8bGGW/SuyI3bZnVvmxipNhcUlFZ0Wv47T
X-Received: by 2002:a05:6102:c04:b0:48c:43ae:ab42 with SMTP id ada2fe7eead31-48dae3b5c2fmr2455984137.25.1718350097464;
        Fri, 14 Jun 2024 00:28:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718350097; cv=none;
        d=google.com; s=arc-20160816;
        b=KzVmasHimlhHNeWNHwFTn6n1PK75U5sF4aLQYUNpM/94xvWo2plzKOHNdk02Hc2k8D
         XdpQazrQDct5wG6gI5ijw/s0TKT78QfiaSUbtoLB9o2ACZpLFRLhCPmPDMJc6ZCMQfrn
         D5xTic+zkbLVnLaxbZSVn3IYO1dub9KmPwu8cIF76oGZRVggXNm+PqGznKNfy9P1KMNu
         KJBV11UhAIamUEDAKsSYnWVOlGsRnC9jlIWasozYF6ATzJmm5pqQTbWgbF/226cdTg9S
         a7O42V5T+e0K7DtbjsmqL5WNb5d4NQno9AOjZ9jZcAcJtserQyrVy9T7ynN2m+elaM6Y
         vC3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=7J6U16qrXeLb/asNfTGBlt6h0s0DAuaM230HKBqvUWQ=;
        fh=AcWSTBBcQtYb7MKLFQz0jAErn8oNU1WklmI8CXNUViI=;
        b=M/kb69WsooA6TWjmcnC2DM85WO+n4GCa2p7JZKGN/UTp3WeP2uajl6W3u5lEwKSLup
         l1DOPv2lCPig4DjZz2h8bS8wYfsdSRpBr+zOI1DklMEol3f7DYOVecu8ZYkj+GNBKxZR
         URQ6fa7VTbR5Nahszcg2VVQQA9d9DS1EtXjHd6Z1CXVZsSSafzcjmlJ4uk4NkoBpLE2d
         GWItZnfLj5qaacpJHTfkti5tb1U8VzweyCtn7Ewyrdz0FyccVVntIKtr1R+zLkroj+K2
         2di0DKieK8FnkcWfhlOiDlXzhEk3o5JQP7Fo4wh+W5huJf09ADRdTnO9y/IwUG0IN65f
         DUCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MTiL7BnM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-798ab9f8788si115491885a.294.2024.06.14.00.28.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Jun 2024 00:28:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MTiL7BnM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sI1LZ-0003Dx-6g; Fri, 14 Jun 2024 03:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sI1LX-0003Db-Sb
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 03:27:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sI1LW-0000kh-Hk
 for qemu-arm@nongnu.org; Fri, 14 Jun 2024 03:27:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718350057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7J6U16qrXeLb/asNfTGBlt6h0s0DAuaM230HKBqvUWQ=;
 b=MTiL7BnMTA7i2dcmU6XXk7tW64HMN8H33L8w6zR+p2IDcsXfcvDpkogAw8/lsTVcK7wmRi
 H6vSsSfLrByxJ08ODS8mQHqbck81qywAeUx59Vlm5aDcR/UU2xbiGFozAsI/bRh2UJPfRy
 MPelAE8OvkBPG2mQCu32YebKaY6ARCs=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-135-cYX1J6iCP3eRQgpTECFXXg-1; Fri,
 14 Jun 2024 03:27:34 -0400
X-MC-Unique: cYX1J6iCP3eRQgpTECFXXg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0FFD219560B0; Fri, 14 Jun 2024 07:27:33 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.49])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id F103B3000219; Fri, 14 Jun 2024 07:27:30 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>, Troy Lee <troy_lee@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 04/19] aspeed/sdmc: remove redundant macros
Date: Fri, 14 Jun 2024 09:26:05 +0200
Message-ID: <20240614072620.1262053-5-clg@redhat.com>
In-Reply-To: <20240614072620.1262053-1-clg@redhat.com>
References: <20240614072620.1262053-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 11
X-Spam_score: 1.1
X-Spam_bar: +
X-Spam_report: (1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.145,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: fglK0tJc8dDK

From: Jamin Lin <jamin_lin@aspeedtech.com>

These macros are no longer used for ASPEED SOCs, so removes them.

Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 hw/misc/aspeed_sdmc.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/hw/misc/aspeed_sdmc.c b/hw/misc/aspeed_sdmc.c
index 64cd1a81dcd2..74279bbe8ee7 100644
--- a/hw/misc/aspeed_sdmc.c
+++ b/hw/misc/aspeed_sdmc.c
@@ -76,10 +76,6 @@
 #define     ASPEED_SDMC_VGA_32MB            0x2
 #define     ASPEED_SDMC_VGA_64MB            0x3
 #define ASPEED_SDMC_DRAM_SIZE(x)        (x & 0x3)
-#define     ASPEED_SDMC_DRAM_64MB           0x0
-#define     ASPEED_SDMC_DRAM_128MB          0x1
-#define     ASPEED_SDMC_DRAM_256MB          0x2
-#define     ASPEED_SDMC_DRAM_512MB          0x3
 
 #define ASPEED_SDMC_READONLY_MASK                       \
     (ASPEED_SDMC_RESERVED | ASPEED_SDMC_VGA_COMPAT |    \
@@ -100,17 +96,6 @@
 #define ASPEED_SDMC_CACHE_ENABLE        (1 << 10) /* differs from AST2400 */
 #define ASPEED_SDMC_DRAM_TYPE           (1 << 4)  /* differs from AST2400 */
 
-/* DRAM size definitions differs */
-#define     ASPEED_SDMC_AST2500_128MB       0x0
-#define     ASPEED_SDMC_AST2500_256MB       0x1
-#define     ASPEED_SDMC_AST2500_512MB       0x2
-#define     ASPEED_SDMC_AST2500_1024MB      0x3
-
-#define     ASPEED_SDMC_AST2600_256MB       0x0
-#define     ASPEED_SDMC_AST2600_512MB       0x1
-#define     ASPEED_SDMC_AST2600_1024MB      0x2
-#define     ASPEED_SDMC_AST2600_2048MB      0x3
-
 #define ASPEED_SDMC_AST2500_READONLY_MASK                               \
     (ASPEED_SDMC_HW_VERSION(0xf) | ASPEED_SDMC_CACHE_INITIAL_DONE |     \
      ASPEED_SDMC_AST2500_RESERVED | ASPEED_SDMC_VGA_COMPAT |            \
-- 
2.45.2

