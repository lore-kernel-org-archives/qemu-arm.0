Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2306419njj;
        Mon, 5 May 2025 02:11:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwFOemOZJh/FfIzVfwD7PNd9aOA/b5dN9h3MnnznvEn8vK6RW+NiM/nHF2DvHJlpHbemXmiA3hzb1J/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEBFrq5uDwweXi92YSO7FV7eB7t6i3oMDcUG51HKfi/pPVXp0ZjsZZu+aQ0GEvRDCmCgBD7
X-Received: by 2002:a05:6000:420f:b0:3a0:7139:d178 with SMTP id ffacd0b85a97d-3a099aef9c0mr8534606f8f.51.1746436269425;
        Mon, 05 May 2025 02:11:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746436269; cv=none;
        d=google.com; s=arc-20240605;
        b=epOI86eTT0o59JdKVYED3BoAu9I1kOZPVb1F7W0epg2K0w08bcY8FMYsFdxEyskQnq
         lQ4rku7VjDL0Wn6kXU3ZuK5xcoc46/UEgciCrwjf0ri9/Bmd8daXY30aOtCkVqqvkVBH
         mGNwPYnb8D83w5M+Mog+A/7buCHZu8m1m4Hhs3BPj9ZkwUpmQjAIkZZOQsNnKgpsBDHG
         EaU6qmxP3k6A3lopYzJgMH7koOdGQRXv1GUZ3IkxJv8CME2FgRKlpnDGj7tzwpT+HQ6k
         eBgndaHvSTLm8aHlSEKcRRAkAK+K9rEt4FFlXmv6gWegv6vOCpr7Ou7UGpfxnE9fHa+R
         n++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=UQby9HdA+LJtastqMCA8AHgvyVtDCLBO7crDwNC05Gg=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=RIQJ90JkFwIYhBnIDTz5kpeuZ2zomEyZPIXKnZCGP803iguvp4xKD1/6qU/rMBEgaw
         Hegxd+kmsITcVBFhKTFp2o4QYk2WwvE6I10M+4SbSHvxYGRQToHt28GPj0Tx35nSTqaL
         B7F+PxSmwgjbqdApru9EAGMA1A9jmx5Wqw4gxsqgRc41VZrNbLpBmuQPR4Qiz1ekvZZw
         HYgx798y9TzRXiqhdHTou0GBH7GnUAjpH/eyHPNkqQZV+9tR4prMmcz51YZRLC7/Duso
         bW78ZDOEuPgsrxTDWGF+FRaYxfLzH8UhgxVSJPS8b6LgVH+cppBdsvbChB7hiuH7xwuQ
         rhNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="D/jkbEom";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a099afbd5esi4956134f8f.384.2025.05.05.02.11.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 02:11:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="D/jkbEom";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uBroY-0000l8-RC; Mon, 05 May 2025 05:08:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrn8-0007DZ-TD
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:07:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uBrn6-0006Hg-Fw
 for qemu-arm@nongnu.org; Mon, 05 May 2025 05:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1746436031;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UQby9HdA+LJtastqMCA8AHgvyVtDCLBO7crDwNC05Gg=;
 b=D/jkbEomM6EsL0Gib68lm5U26YfTLvlbuj965K7eP0/40oKpBARbhVUkeQYTfrPlZ/JcaD
 1XRHrJ/RS5HlZ6FIJDsmAvpE8R6SrJ73VVyamKojA10dirazinhi84+nItv61pqJGhdSNL
 t6Kk+GtW44avY58TX3HAfQReNSejmLo=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-116-56qlxUdKNMCrKc9zeFGDZw-1; Mon,
 05 May 2025 05:07:09 -0400
X-MC-Unique: 56qlxUdKNMCrKc9zeFGDZw-1
X-Mimecast-MFC-AGG-ID: 56qlxUdKNMCrKc9zeFGDZw_1746436028
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 43E091956048; Mon,  5 May 2025 09:07:08 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.38])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9F4FF30001A2; Mon,  5 May 2025 09:07:06 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 09/23] tests/functional/aspeed: extract boot and login sequence
 into helper function
Date: Mon,  5 May 2025 11:06:21 +0200
Message-ID: <20250505090635.778785-10-clg@redhat.com>
In-Reply-To: <20250505090635.778785-1-clg@redhat.com>
References: <20250505090635.778785-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.411,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: Fyog/6qHc/52

From: Jamin Lin <jamin_lin@aspeedtech.com>

Extracted repeated boot and login steps into a new helper function.
No change in functional behavior.

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250423072350.541742-10-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/test_aarch64_aspeed.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index b6e2be1f8292..1e1f3f9ecece 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -25,10 +25,15 @@ def do_test_aarch64_aspeed_sdk_start(self, image):
 
         self.vm.launch()
 
+    def verify_openbmc_boot_and_login(self, name):
         wait_for_console_pattern(self, 'U-Boot 2023.10')
         wait_for_console_pattern(self, '## Loading kernel from FIT Image')
         wait_for_console_pattern(self, 'Starting kernel ...')
 
+        wait_for_console_pattern(self, f'{name} login:')
+        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
+        exec_command_and_wait_for_pattern(self, '0penBmc', f'root@{name}:~#')
+
     ASSET_SDK_V906_AST2700 = Asset(
             'https://github.com/AspeedTech-BMC/openbmc/releases/download/v09.06/ast2700-a0-default-obmc.tar.gz',
             '7247b6f19dbfb700686f8d9f723ac23f3eb229226c0589cb9b06b80d1b61f3cb')
@@ -89,16 +94,12 @@ def start_ast2700_test(self, name):
         self.do_test_aarch64_aspeed_sdk_start(
             self.scratch_file(name, 'image-bmc'))
 
-        wait_for_console_pattern(self, f'{name} login:')
-
-        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
-        exec_command_and_wait_for_pattern(self, '0penBmc', f'root@{name}:~#')
-
     def test_aarch64_ast2700_evb_sdk_v09_06(self):
         self.set_machine('ast2700-evb')
 
         self.archive_extract(self.ASSET_SDK_V906_AST2700)
         self.start_ast2700_test('ast2700-a0-default')
+        self.verify_openbmc_boot_and_login('ast2700-a0-default')
         self.do_ast2700_i2c_test()
 
     def test_aarch64_ast2700a1_evb_sdk_v09_06(self):
@@ -106,6 +107,7 @@ def test_aarch64_ast2700a1_evb_sdk_v09_06(self):
 
         self.archive_extract(self.ASSET_SDK_V906_AST2700A1)
         self.start_ast2700_test('ast2700-default')
+        self.verify_openbmc_boot_and_login('ast2700-default')
         self.do_ast2700_i2c_test()
 
 if __name__ == '__main__':
-- 
2.49.0

