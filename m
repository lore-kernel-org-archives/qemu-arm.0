Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3233997njb;
        Tue, 9 Jul 2024 04:53:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWu0LWL4H0ur4blPFYDfcnwOPmt85toRHMg1XlkekVovCHwe97dwD12jSVtCahNwAQEh5GBqWl1QWFPnmw56PrM9wW2KEhM
X-Google-Smtp-Source: AGHT+IFaB8xC9oBpn704rMKXj2WzgHq9NBNW+YC4FxfNdw0GVKPSwdn9xClDR5wXcrtnAy5qxP0g
X-Received: by 2002:a05:620a:4107:b0:79d:61e3:97f5 with SMTP id af79cd13be357-79f199f5d76mr268215485a.10.1720526037989;
        Tue, 09 Jul 2024 04:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720526037; cv=none;
        d=google.com; s=arc-20160816;
        b=ZMParNhHzZacgnSTXT1qIx1pygWSBfzgrjn//05cxu4Ux/Znbw+dwxwKElrRi4FNEy
         ihf57lseqj3v4sA08jktokSSn1Bc1aFidaqb0uC0ZmBZsRC1gimS35zgv+DYg3rv6hEw
         rO+qQt1GH1tvLDk4XnYppi48s3EJ1umnU5koMmDLD3b7W7kYrhY9GB5uvcJycRJCrfd3
         NJTuUCQ/t67WQCLwLTTPHB8j1JNVj4HRjpbpbgdjgxgK3AsqNYb43r0TY/aiVJ9M8xz2
         lop/98Jt9aahHK+2hNvcTmv0gt5kGXpyzcWwF+XECoHMsZ0qVO4MIUX6a9YK64gScWUv
         ZSDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=htareJq5mg5V+FkUb0aPkkmthCLoSl+rqVdv+LDxAbE=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=VTLeH9fF6BD2ZH8O0p8ECRuFJ0kA1s2ewJ03slUpoNT5/BK74C8ye+0C6YdbPX3UN3
         OucNr4I+Ip/qf2Em8WK/Yjt+7PjMq6xKYqUeCA1cjE4HG+n3I82rahfbLk6v4gA+3T1W
         WyBPoDp8udfdNxIUJKR8Li6VVs0xOeB6Qs7cGiEAPBiAS8KLYW2SQEegfe3tMr+k+Wux
         YQHQci9CjQe/LsFtr00h1UD2O+4WSbfZUNuIaMGVsMq75eeQbAZswqK3wTwQ1Z6+XNre
         vFenZW+AWnewZqVj2KJvCVS4MX9U5gnWncTXKrMZ/M6Wm9doXk1J+qmqMXPX3kfzkOa9
         p7Mw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="g/DXJtn5";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f190e78a9si212001885a.750.2024.07.09.04.53.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 04:53:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="g/DXJtn5";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sR9P6-00020T-VI; Tue, 09 Jul 2024 07:53:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sR9P3-0001oK-UP
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 07:53:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1sR9Ox-0006ds-N1
 for qemu-devel@nongnu.org; Tue, 09 Jul 2024 07:53:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720525974;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=htareJq5mg5V+FkUb0aPkkmthCLoSl+rqVdv+LDxAbE=;
 b=g/DXJtn5WXC4dOwdP+iqSW+ThBpE12wJpFKZjBs+UoCQQuvW45cXxCipjVBazdwDDyHg4+
 Eluf1SWXQavNPIJF+6JRwmzvG2MzOEin0tvIu+VwT6iNETDHlJMuBf48QszCD/sFnB9rE8
 AfR7zqiqE44QYYMfRMopQAidq85SuKM=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-618-p7zHYbKgO9WEjoRBxIJFuA-1; Tue,
 09 Jul 2024 07:52:51 -0400
X-MC-Unique: p7zHYbKgO9WEjoRBxIJFuA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8207A1955BC2; Tue,  9 Jul 2024 11:52:49 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.193.243])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C84903000184; Tue,  9 Jul 2024 11:52:47 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 8/8] machine_aspeed.py: update to test network for AST2700
Date: Tue,  9 Jul 2024 13:52:28 +0200
Message-ID: <20240709115228.798904-9-clg@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QWpFW2/fviXx

From: Jamin Lin <jamin_lin@aspeedtech.com>

Update test case to test network connection via SSH.

Test command:
```
cd build
pyvenv/bin/avocado run ../qemu/tests/avocado/machine_aspeed.py:AST2x00MachineSDK.test_aarch64_ast2700_evb_sdk_v09_02
```

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 tests/avocado/machine_aspeed.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 13fe128fc9f0..f66ad38d3503 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -313,14 +313,14 @@ def do_test_arm_aspeed_sdk_start(self, image):
 
     def do_test_aarch64_aspeed_sdk_start(self, image):
         self.vm.set_console()
-        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw')
+        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
+                         '-net', 'nic', '-net', 'user,hostfwd=:127.0.0.1:0-:22')
 
         self.vm.launch()
 
         self.wait_for_console_pattern('U-Boot 2023.10')
         self.wait_for_console_pattern('## Loading kernel from FIT Image')
         self.wait_for_console_pattern('Starting kernel ...')
-        self.wait_for_console_pattern("systemd[1]: Hostname set to")
 
     @skipUnless(os.getenv('QEMU_TEST_FLAKY_TESTS'), 'Test is unstable on GitLab')
 
@@ -436,4 +436,6 @@ def test_aarch64_ast2700_evb_sdk_v09_02(self):
 
         self.vm.add_args('-smp', str(num_cpu))
         self.do_test_aarch64_aspeed_sdk_start(image_dir + 'image-bmc')
+        self.wait_for_console_pattern('nodistro.0 ast2700-default ttyS12')
+        self.ssh_connect('root', '0penBmc', False)
 
-- 
2.45.2

