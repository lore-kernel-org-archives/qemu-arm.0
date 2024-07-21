Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1307771njc;
        Sun, 21 Jul 2024 01:16:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7EiWraJuYld7pt4y10Ym7Q2gJho+Xz6s2RiW0W7Q/L8p9cdP7pLwVBa5q9nj+lNBKz+rpMht/ncH1X1cXg8GPVm3yiqyb
X-Google-Smtp-Source: AGHT+IGLrkZJ96dHdUBa8zSoEVD65MmVTI5MdJF/SWbZCme6zsykXtlqBSKwx/zezbIYYdUzPIaj
X-Received: by 2002:a05:6214:e81:b0:6b5:a98:44b8 with SMTP id 6a1803df08f44-6b961084a4cmr53749326d6.29.1721549786238;
        Sun, 21 Jul 2024 01:16:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721549786; cv=none;
        d=google.com; s=arc-20160816;
        b=L+ZAsiAszMA4AF2UqRD8NNYa+irsbst81p7+x7toxJoNlpcyqRiA40oMntxnqq8wOB
         IGKtah0glOLB35jLlTWnxUGjfoWGH2OssTuevfs+xkHBFoPPP5T/S/bJZ9OCthO/EVGA
         lDftVPJ3Pqnnhk1YzK2pbkQS8aMIWqvKgSztf6R85Axq585599vvqxr4+AAglCwvMnWQ
         Gh+6TdqZJsgyiITxkFQjllHiPcdr6GBSGokMob+mxONaqyYo8l4g/xgX7djQ8VU4cZ3P
         LiQTCYaUV1m3wamnTxdQhhbH3BLGaTHQOYiSUvXNnQgi86Yrq/Vf7dMcdg0jl387dp0K
         z34Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=udAg7aoSsOCQyOYgTRax+Vjy2Ro/dmRw73+40ghuTPA=;
        fh=fA2BVDuqf2kB9eVhDCNl//LPCdv1kT5WlEk9E86oXvc=;
        b=u9wMPqvkCZNCnXQjiocN957jl2Ov5vMkVJoWAr6wLwQH5z/jfZq8eq7Ci6M5p7cntF
         cvtX4deAoxtF2bl28aHzmCfZLxJhpWpPhsLc6+QLhs12lkKVcCPpJ2AIWoIkNhVkI4dK
         8jwVbZd0Ya115XnrqYY0mO4V7Ckc07NGGk3bN5YvRAHPhHfdlM/eS1EIi+oBx7AQGHuR
         0nl4OuqGjICTNgFfdjEJvrMpUPQRslc0lUnVlg4lHo1tegFhSOKqlYuLZNwXgJHH2qAZ
         NLYBNSTNGg/GIsk1nggv+eZGQ36sn3KgyPqHTK0NHieinngEfctygHMS8rMGWbywrsYx
         rGcw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="D83O0G/l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7ac99a2e8si56371986d6.211.2024.07.21.01.16.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 Jul 2024 01:16:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="D83O0G/l";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVRiW-0001N9-C8; Sun, 21 Jul 2024 04:14:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRiI-0000sB-AG
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sVRiF-0001Ru-4M
 for qemu-arm@nongnu.org; Sun, 21 Jul 2024 04:14:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721549673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udAg7aoSsOCQyOYgTRax+Vjy2Ro/dmRw73+40ghuTPA=;
 b=D83O0G/ljQNt8XqYX/WcPhWCR3t4/RzIM871XhT04cV67ZiZztb9AvHf4bkLbkXSx87NIc
 RFhpnUhkUDslvcnV6xHvecuvijHFcKsiksAkPbtwTq19bdBFpjqiNLCnrPPL4kwIMIxY+j
 hi29935n6PCIYbNurFr6Tc7ZyGCbzVU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-96-UmOJ5cyaOdGUHOH0VtgqJw-1; Sun,
 21 Jul 2024 04:14:29 -0400
X-MC-Unique: UmOJ5cyaOdGUHOH0VtgqJw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D42901955F43; Sun, 21 Jul 2024 08:14:28 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.37])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 282321955D4F; Sun, 21 Jul 2024 08:14:26 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 10/15] tests/avocado/machine_aspeed.py: Add eMMC boot tests
Date: Sun, 21 Jul 2024 10:13:56 +0200
Message-ID: <20240721081401.425588-11-clg@redhat.com>
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
X-TUID: ln80Hmfsi680

The image was built using the process described in commit c8cb19876d3e
("hw/sd/sdcard: Support boot area in emmc image") with artefacts from
the latest successful build of the IBM P10 BMC platform available on:

  https://jenkins.openbmc.org/job/ci-openbmc/distro=ubuntu,label=docker-builder,target=p10bmc/lastSuccessfulBuild/

Signed-off-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/machine_aspeed.py | 39 +++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index f66ad38d3503..29e6b388a9fd 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -439,3 +439,42 @@ def test_aarch64_ast2700_evb_sdk_v09_02(self):
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
+        :avocado: tags=device:emmc
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

