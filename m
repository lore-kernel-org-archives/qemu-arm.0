Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp797543njk;
        Wed, 17 Jul 2024 06:07:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzMvV5UfqoV3D2qLFAfTTs2lISZxtCZYHm5WyVE0ZtXIgtm5PwoSfeT55QJip20H7PnjpQfmQVC7PsqaI7/FGNBStZXUDR
X-Google-Smtp-Source: AGHT+IFjBxYZq6ywjoPI0zbdGQLsa5urvCOuwIeffg1LjFw3zLYc+UiJYiFKJK9EBYn2CjeubhoB
X-Received: by 2002:ac8:7f55:0:b0:447:e890:b19b with SMTP id d75a77b69052e-44f86171b61mr19470341cf.8.1721221651543;
        Wed, 17 Jul 2024 06:07:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721221651; cv=none;
        d=google.com; s=arc-20160816;
        b=T4NmrcRhjM73AZ24AwY6zFBC02sqbSBFse5iTahhUpPgNl2PIPioFe03Yg/VXKaHAb
         aReDtBRJuCnd4aJTQbo8PBtfQmdoDelwCulboggQrDGH+ul0lCJiC2FLcvfyaKDqxzgZ
         N84xqUannGSDXVGyMP5lgEbsgc18e+Uyu2vqxwR11FyibNcHuk/vn9QBO8ymEXW9wUXy
         Tf0oyoZJQA1ygXYE3hk6LTXQlVNyGsd5gMjBjJC6dMTLY+6xH8ZmDQ3nS/SrOAGIyRHh
         PFCRG/QQRTIM4w4shJtgyCL9YtQyy/vuAD1hfrGfdqahSYpI+CwS/AB3QhtUztF7zSep
         XggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=TERL9QAhtUG4HHVq40sa/WStYUmDn+xGXj3STvTa4QY=;
        fh=0pYxd3iFRyo2OUA9a/JXFokuM4B7EZ6uGRPudQcN7MU=;
        b=tLHavFm4UNKu2NnC7psmJLCHmYVpQBiY7jewO2DqmKzqclKCLjl6i1+rAdPXRI6rOr
         0618YV8YrW1ZgJ5XpwrfhsXURZmUch1uSGgHQN+DgoBVqe1anTei8n7ouRoqwQpfqLGT
         QwgXh39GPx22YtWnkZg4wHGFhLgTvtGGJaOvZQLZZEMqqoRLBmPOcsrvOF2jhJrL/K93
         EbCfMqqjvN/chV8DtNfBlwFdjeoc0p6G8xymU64n6v05v86QkG6Spm2oeitm3XlgsGtQ
         uwzVOdQ0ecH1xMM5w1qx7q3NJn6nFP4SF6iQmIegvkAGJYS9l528gDF7AeUpG/q2KLmx
         Z41Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=En3zefRJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b79e83asi97352001cf.225.2024.07.17.06.07.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jul 2024 06:07:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=En3zefRJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sU4NP-0002xo-9G; Wed, 17 Jul 2024 09:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sU4NH-0002oQ-0q
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 09:07:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sU4NE-0002KA-Hb
 for qemu-arm@nongnu.org; Wed, 17 Jul 2024 09:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721221631;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TERL9QAhtUG4HHVq40sa/WStYUmDn+xGXj3STvTa4QY=;
 b=En3zefRJwZLuGboQXzX8AqX57zH1l/MXwJQu2T8ycDPDxNFK1iAgA09gXUFu1xqIp6+65W
 BZkkaeTglD7I+9Vlz+++DPnos+8eFlML4mN8bP57eSfdp0i+X2RSi5Wi+WZQAmAOhbD5ks
 RC+b7NR7AUhjZr3t0w8nWrJO8QPJZo8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-596-mH0LygHLMMaZdlWB8WeBhw-1; Wed,
 17 Jul 2024 09:07:08 -0400
X-MC-Unique: mH0LygHLMMaZdlWB8WeBhw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AB2A01955D4A; Wed, 17 Jul 2024 13:07:05 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.88])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C83C819560B2; Wed, 17 Jul 2024 13:06:59 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH] tests/avocado/machine_aspeed.py: Add eMMC boot tests
Date: Wed, 17 Jul 2024 15:06:57 +0200
Message-ID: <20240717130657.648701-1-clg@redhat.com>
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
X-TUID: lcTW6w1O9UwB

The image was built using the process described in commit c8cb19876d3e
("hw/sd/sdcard: Support boot area in emmc image") with artefacts from
the latest successful build of the IBM P10 BMC platform available on:

  https://jenkins.openbmc.org/job/ci-openbmc/distro=ubuntu,label=docker-builder,target=p10bmc/lastSuccessfulBuild/

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/avocado/machine_aspeed.py | 38 +++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index f66ad38d3503..1deb8472818f 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -439,3 +439,41 @@ def test_aarch64_ast2700_evb_sdk_v09_02(self):
         self.wait_for_console_pattern('nodistro.0 ast2700-default ttyS12')
         self.ssh_connect('root', '0penBmc', False)
 
+class AST2x00MachineMMC(QemuSystemTest):
+
+    timeout = 240
+
+    def wait_for_console_pattern(self, success_message, vm=None):
+        wait_for_console_pattern(self, success_message,
+                                 failure_message='Kernel panic - not syncing',
+                                 vm=vm)
+
+    def test_arm_aspeed_emmc_boot(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=machine:rainier-bmc
+        """
+
+        image_url = ('https://fileserver.linaro.org/s/B6pJTwWEkzSDi36/download/'
+                     'mmc-p10bmc-20240617.qcow2')
+        image_hash = ('d523fb478d2b84d5adc5658d08502bc64b1486955683814f89c6137518acd90b')
+        image_path = self.fetch_asset(image_url, asset_hash=image_hash,
+                                      algorithm='sha256')
+
+        self.require_netdev('user')
+
+        self.vm.set_console()
+        self.vm.add_args('-drive',
+                         'file=' + image_path + ',if=sd,id=sd2,index=2',
+                         '-net', 'nic', '-net', 'user')
+        self.vm.launch()
+
+        self.wait_for_console_pattern('U-Boot SPL 2019.04')
+        self.wait_for_console_pattern('Trying to boot from MMC1')
+        self.wait_for_console_pattern('U-Boot 2019.04')
+        self.wait_for_console_pattern('eMMC 2nd Boot')
+        self.wait_for_console_pattern('## Loading kernel from FIT Image')
+        self.wait_for_console_pattern('Starting kernel ...')
+        self.wait_for_console_pattern('Booting Linux on physical CPU 0xf00')
+        self.wait_for_console_pattern('mmcblk0: p1 p2 p3 p4 p5 p6 p7')
+        self.wait_for_console_pattern('IBM eBMC (OpenBMC for IBM Enterprise')
-- 
2.45.2

