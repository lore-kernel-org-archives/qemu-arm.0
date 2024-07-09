Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3234100njb;
        Tue, 9 Jul 2024 04:54:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV2wPaAkEe+vs0O0QseRfpgWycdTv+aAyQ5sAjGkgnOW693Ad6cSZEYgw3b8Tt8OVVPrGs/LH7OI6mLiIbV+YsxqI6UGfgu
X-Google-Smtp-Source: AGHT+IGNtDHXegL/yMkW8LCsjR9wLzBvoiwdB8HMjv5j49/IksvYcu71frkwldmRsqczUoczTY53
X-Received: by 2002:a05:6102:442c:b0:48d:a5ff:2f5f with SMTP id ada2fe7eead31-4903215b140mr2668100137.12.1720526048503;
        Tue, 09 Jul 2024 04:54:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720526048; cv=none;
        d=google.com; s=arc-20160816;
        b=FXQC6URcDjHiFwsGtFh4ApGPouzrOr2xZyEadxLLw8h++OSFjb5Fiou+H2idz4e471
         BpnCygMgXUhfnmKsYe88A++e31N2iQ6FUEQnAeUA6idmnisuevIOESocbEXSm4XVbwBW
         JMa9kk7uHo0VN3lHnxal9PXdZgmyAdgNWr4APWM4yM1VREvFEfk2MJKD1+IP8YcAOco6
         bjstXVfzAlHCRgofjtPAl3Tm1sFFp875L6CAdlKHGxhaJIAsXn4rtygY/v/tb2pFfsb7
         /8JhwGtb1mpRPW5kksRWkdOLe/NC7MNGhM0XmhCbPMZInRrUAXPva5I8/2dSLfx8yxAY
         k4sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=9rK2cfUk1Df6PbcsigVO26V2MP7uFzr/x6Nl6VcUlZ0=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=Er+/sToAAZn/DCOC84s0njQjD7QkEWLX51qOUGVzqOHQ0pIullC2R3l5NaVWHRjcLk
         kmifNySF4xPeqOoqehTl2BNQS/5ZVPaCSNIzMFi4w2zxNSiEnX13EXBifFzN8hF7LgMF
         DAi3M7FbkgBEYOlqy5Vagwk3wzyrzzuXFk1P75zLqyqmRukjOekzPQbxozPx0aT6+O8q
         BT34iPHaqlfcIUuydDHZf7bkpi82UUwG0lTwZOMGkviVsUNf9hr8wyijHSUgIt2eZ/cL
         72fdVbUjeaw0tv76XWo1JKQRN+kXTr1CQzM8mbrsezLUpTHoZ/bGFnquFj0aAjTN/Fto
         ej4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AXDR2cM9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9b1f6fesi19961371cf.176.2024.07.09.04.54.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 04:54:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AXDR2cM9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sR9P3-0001oD-RE; Tue, 09 Jul 2024 07:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sR9P2-0001jq-QX
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 07:53:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sR9Ou-0006cP-Kb
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 07:53:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720525972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9rK2cfUk1Df6PbcsigVO26V2MP7uFzr/x6Nl6VcUlZ0=;
 b=AXDR2cM9BCPfCzbNdQAp79elIF0Xq3/xRw2oIVFCtdUbsGSEsu6qwg2lJZGTWtMbPao+40
 hvdGHxtjEyOe7kDKjrt/VHpvJi9PJ38JKYuG7+sNM7SKRClq4qymtrouISngkIPwRY5lQl
 4OcgA9udxxpIUKufx3yBaNAh29u+pzM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-48-LvP9r7BVMtCHLAEA6uVpzw-1; Tue,
 09 Jul 2024 07:52:48 -0400
X-MC-Unique: LvP9r7BVMtCHLAEA6uVpzw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8D90A196CE1D; Tue,  9 Jul 2024 11:52:47 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.193.243])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 23D593000183; Tue,  9 Jul 2024 11:52:45 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 7/8] machine_aspeed.py: update to test ASPEED OpenBMC SDK
 v09.02 for AST2700
Date: Tue,  9 Jul 2024 13:52:27 +0200
Message-ID: <20240709115228.798904-8-clg@redhat.com>
In-Reply-To: <20240709115228.798904-1-clg@redhat.com>
References: <20240709115228.798904-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
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
X-TUID: 5TP9ne1G1cre

From: Jamin Lin <jamin_lin@aspeedtech.com>

Update test case to test ASPEED OpenBMC SDK v09.02 for AST2700.

ASPEED fixed TX mask issue from linux/drivers/ftgmac100.c.
It is required to use ASPEED OpenBMC SDK since v09.02
for AST2700 QEMU network testing.

A test image is downloaded from the ASPEED Forked OpenBMC GitHub
release repository :
https://github.com/AspeedTech-BMC/openbmc/releases/

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 tests/avocado/machine_aspeed.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 3a20644fb2ad..13fe128fc9f0 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -387,15 +387,15 @@ def test_arm_ast2600_evb_sdk(self):
         year = time.strftime("%Y")
         self.ssh_command_output_contains('/sbin/hwclock -f /dev/rtc1', year);
 
-    def test_aarch64_ast2700_evb_sdk_v09_01(self):
+    def test_aarch64_ast2700_evb_sdk_v09_02(self):
         """
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:ast2700-evb
         """
 
         image_url = ('https://github.com/AspeedTech-BMC/openbmc/releases/'
-                     'download/v09.01/ast2700-default-obmc.tar.gz')
-        image_hash = 'b1cc0fd73c7650d34c9c8459a243f52a91e9e27144b8608b2645ab19461d1e07'
+                     'download/v09.02/ast2700-default-obmc.tar.gz')
+        image_hash = 'ac969c2602f4e6bdb69562ff466b89ae3fe1d86e1f6797bb7969d787f82116a7'
         image_path = self.fetch_asset(image_url, asset_hash=image_hash,
                                       algorithm='sha256')
         archive.extract(image_path, self.workdir)
-- 
2.45.2

