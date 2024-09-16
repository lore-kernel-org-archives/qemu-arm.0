Received: by 2002:a17:504:2a14:b0:1be9:327d:8ee3 with SMTP id p20csp1257451njl;
        Mon, 16 Sep 2024 11:59:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGI3o2zQVyxMYwPlCNhrHzySXMDyUPm/3gT0Wz88P55lJkI2c/nLeCQtAoaz4BWD8yHmpKp2g1vG82Yw==@linaro.org
X-Google-Smtp-Source: AGHT+IH+Tb83I+AuWepcqhIELcVkLJf1VGXy56QNmhVg2iweJyDGfQ+8hBIEl1gjAVvcc+mGBSYS
X-Received: by 2002:a05:6214:2f0b:b0:6c4:79df:a2da with SMTP id 6a1803df08f44-6c57347c448mr270945606d6.0.1726513189524;
        Mon, 16 Sep 2024 11:59:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726513189; cv=none;
        d=google.com; s=arc-20240605;
        b=GHmkcwt7S/MTQQw2eiT1RytG1GBMh+2iEyjK5fm2q8oy0rjCAs0JeB/PeAq4mIl6Gl
         QLFnJaMHkhF+r6VncOaUUpMzKR4Jiq9Am8rO0Fyx8knVgQdN/aXQz9gKP6RAt5ZdFJV5
         luIDu18Lm2niFGN0fXCnnvcHCjkHzbK0wCqdpJJL8JKA3UTQRYHI1IJ3CLYTaMryno7m
         mfEStXO0EXjy6o2QFsWls/sEQWEf08Wd7VAmNspyxlqDULn/JRKFzVqrxVnJ7Crb9GQ5
         S37CnpPT0Gh4Umi3aGVnyVJ74Fy1ajUCGzSBSg6UFyunaTALakH4xiLhceprAOGDBGsx
         j7/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ZdgNHdc4oHol3NihA+ZldTHGbdqlWMx0PeUz42Mt514=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=CQSGdCnsDt+0rPsb51XV0ury5bQN6YWho7vy7HjqpzBXbM76zP/sTbSzEFMnlghukQ
         7+8mnQZM5yTFhrElJrbGNJN204x9ZaTZjZhEDSRC42J0eC+cZ0FHWbGu5/A150P60E/s
         MKkzYvdqdVYnSMQIwcihuEZ3kt5nuIutjm76bo9mxlRtulfPa7NmB+WcYSAUaWboBEdW
         /FjNRmij8yXg5JQfwM7JRyIOc2/hbgPxVBO4N82hq1y52LRq9RP3Ga5YY8wmFMmJIyvs
         DUp82sXKQ6d/lj+eV7mDA65aq3M/F2oO3n70BnaeFu2+JZvgXKyk2hcEixHLUbFcvM9F
         3OXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jIx977IO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c58c7e76f9si62928786d6.491.2024.09.16.11.59.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Sep 2024 11:59:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jIx977IO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sqGwn-0003a5-8E; Mon, 16 Sep 2024 14:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sqGwJ-0001cg-P0
 for qemu-arm@nongnu.org; Mon, 16 Sep 2024 14:59:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sqGwC-0003Mt-BM
 for qemu-arm@nongnu.org; Mon, 16 Sep 2024 14:59:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726513143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZdgNHdc4oHol3NihA+ZldTHGbdqlWMx0PeUz42Mt514=;
 b=jIx977IOk61Qqo8q/ErtVVvPGBqusiKALBHgsN/hDpd9pB761v8t1ed1ln2oaFVJLVpgXx
 wg0VeIbJ9zhhjIuaNdb+Ruju59+20oKaEkmx/HVeaHLE9F7aV2TEVau8pBuaDTrT8/7UVk
 Ox8Pb5es+npmMgrhQgpD89fp+MxRVP4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-590-Uz6AMSt4MnaTbPl0sNZURg-1; Mon,
 16 Sep 2024 14:57:40 -0400
X-MC-Unique: Uz6AMSt4MnaTbPl0sNZURg-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 96C2919560B8; Mon, 16 Sep 2024 18:57:39 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.44])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 04FF6195605A; Mon, 16 Sep 2024 18:57:37 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 12/12] machine_aspeed.py: Update to test I2C for AST2700
Date: Mon, 16 Sep 2024 20:57:08 +0200
Message-ID: <20240916185708.574546-13-clg@redhat.com>
In-Reply-To: <20240916185708.574546-1-clg@redhat.com>
References: <20240916185708.574546-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
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
X-TUID: D+9HmncYBu9W

From: Jamin Lin <jamin_lin@aspeedtech.com>

Update test case to test lm75 temperature sensor.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 tests/avocado/machine_aspeed.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index c0b01e8f1fae..4e144bde9131 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -433,9 +433,25 @@ def test_aarch64_ast2700_evb_sdk_v09_02(self):
                              f'loader,addr=0x430000000,cpu-num={i}')
 
         self.vm.add_args('-smp', str(num_cpu))
+        self.vm.add_args('-device',
+                         'tmp105,bus=aspeed.i2c.bus.1,address=0x4d,id=tmp-test')
         self.do_test_aarch64_aspeed_sdk_start(image_dir + 'image-bmc')
         self.wait_for_console_pattern('nodistro.0 ast2700-default ttyS12')
+
         self.ssh_connect('root', '0penBmc', False)
+        self.ssh_command('dmesg -c > /dev/null')
+
+        self.ssh_command_output_contains(
+            'echo lm75 0x4d > /sys/class/i2c-dev/i2c-1/device/new_device '
+            '&& dmesg -c',
+            'i2c i2c-1: new_device: Instantiated device lm75 at 0x4d');
+
+        self.ssh_command_output_contains(
+            'cat /sys/class/hwmon/hwmon20/temp1_input', '0')
+        self.vm.cmd('qom-set', path='/machine/peripheral/tmp-test',
+                    property='temperature', value=18000)
+        self.ssh_command_output_contains(
+            'cat /sys/class/hwmon/hwmon20/temp1_input', '18000')
 
 class AST2x00MachineMMC(QemuSystemTest):
 
-- 
2.46.0

