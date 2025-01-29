Received: by 2002:a05:7022:6a3:b0:92:a90b:6588 with SMTP id y35csp3709130dly;
        Tue, 28 Jan 2025 23:20:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWSuFKeFzNVZ/eb0BhrRb+Pe2gTWrpBREwLnHauYMP331qo4UpWHCFL5MH6683gENTkt7l/J5V6BFaDBg==@linaro.org
X-Google-Smtp-Source: AGHT+IHKP/axJjbz2LlJ0ETIroqJhEHbkgUUSwjFNTCXw+2YgBqXvE/Y4Nt6hHkN6DLtVVOJCZgs
X-Received: by 2002:a05:620a:254c:b0:7ad:832a:4063 with SMTP id af79cd13be357-7bffccc77admr320278885a.7.1738135213132;
        Tue, 28 Jan 2025 23:20:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738135213; cv=none;
        d=google.com; s=arc-20240605;
        b=FCgqBoCJEvG+P5WuN45ZC3ugY0zOYneJgClcWC0OxK2/jI2m6YA6z7qPKKqIBBrQk/
         bHeVgTtZcPcjuL1JO7XHAEIXdxC61b8Irm8O6da3krj4X14QhxsAi0nrZwv/XzeRJe+i
         6CJKjgPmn5iunx4d8EiuDnbLFtrihiYEnz9CpfynMZUaoVeIN8PzuxLupA+TQ3A+MlMr
         NgCl+Jci13YuqICHHzWOGACnP4nPuGTJezcubemE36W8agMcm8y+DidOsLoTWkYZa0Bx
         HP0BoF2yKJgOfLfAkMoyGUIOOLeRVAa1a5OiddYpqDg2qI3g3Iu97++uDSFk5hjYzd5v
         Rpag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=4dNyEekdIEkglrF9k+RLdVTpQz3bzIefzFUxpYG0qR4=;
        fh=XEUWnmNUzgDVltOtMw+UmOaRtoK2L8C0I2oKK3mImI4=;
        b=jNsZi20OUZMLwwjA3eYP0lRMk8sks4t9bVkh+ZS8t4AfiKIO+gvPq+wjg6Wmepit2G
         ySQO9hg49Pn+s3rTkIm63I0jsQ8t3bAHexnIyNz7QaQ+h0k9SXtKY0U1EKQGg9NmNAmj
         kKMVv8fTGHjYWpy0N1YVOZlBZQ6hMWOpg3FTiTZgjprs8RzzrBN+QjIdHPGUo2xuTZjq
         2kiuweF3ltqxmezgbS/xg39SJ4kUxxixngZMDxfwzYF6qF5A7xHHkWX8i9Sojz0CoL15
         OdyrKEiFGxXQj4FrXQClFf86gt5xslObKVtUFZgn66QIjsl3Of7AgtNsveut4kkdvwAP
         GMjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DnM8RG+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9af12935si1426500285a.574.2025.01.28.23.20.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 23:20:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DnM8RG+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1td2Lq-00026I-J6; Wed, 29 Jan 2025 02:19:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1td2Lb-0001vJ-Rc
 for qemu-arm@nongnu.org; Wed, 29 Jan 2025 02:18:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1td2LX-0003ck-HZ
 for qemu-arm@nongnu.org; Wed, 29 Jan 2025 02:18:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738135126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4dNyEekdIEkglrF9k+RLdVTpQz3bzIefzFUxpYG0qR4=;
 b=DnM8RG+2n1vyoD1VftSaEQcBt69SU0C6SL93hm3zkJsNFQfIqz1Pg+p+kNCkDLeW6VrBWe
 g/+NuvgTixD4llMmtBPj8Mz4oZ0el/YlzQNH3E1kYOrWg/qSd1foEY7b1eWbFbgbJzoodf
 NbuU1a7QYqc+90kB0LsHsM/yEbO2yww=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-622-q-fV45_yPSiPs-U8mQUzig-1; Wed,
 29 Jan 2025 02:18:43 -0500
X-MC-Unique: q-fV45_yPSiPs-U8mQUzig-1
X-Mimecast-MFC-AGG-ID: q-fV45_yPSiPs-U8mQUzig
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 56D1419560A1; Wed, 29 Jan 2025 07:18:40 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.192.105])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CE18019560BC; Wed, 29 Jan 2025 07:18:35 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Troy Lee <troy_lee@aspeedtech.com>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Steven Lee <steven_lee@aspeedtech.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH 1/5] tests/functional: Introduce a new test routine for
 OpenBMC images
Date: Wed, 29 Jan 2025 08:18:16 +0100
Message-ID: <20250129071820.1258133-2-clg@redhat.com>
In-Reply-To: <20250129071820.1258133-1-clg@redhat.com>
References: <20250129071820.1258133-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.3,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: i0tb6e9uoEPO

The OpenBMC images currently used by QEMU to test the Aspeed machines
are rather old. To prepare an update to the latest builds, we need to
adjust the console patterns. Introduce a new routine to preserve the
current tests.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/aspeed.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/tests/functional/aspeed.py b/tests/functional/aspeed.py
index b52358bb8c61..51c821944842 100644
--- a/tests/functional/aspeed.py
+++ b/tests/functional/aspeed.py
@@ -23,6 +23,24 @@ def do_test_arm_aspeed(self, machine, image):
         self.wait_for_console_pattern("ftgmac100 1e660000.ethernet eth0: irq ")
         self.wait_for_console_pattern("systemd[1]: Set hostname to")
 
+    def do_test_arm_aspeed_openbmc(self, machine, image, uboot='2019.04',
+                                   cpu_id='0x0', soc='AST2500 rev A1'):
+        hostname = machine.removesuffix('-bmc')
+
+        self.set_machine(machine)
+        self.vm.set_console()
+        self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
+                         '-net', 'nic', '-snapshot')
+        self.vm.launch()
+
+        self.wait_for_console_pattern(f'U-Boot {uboot}')
+        self.wait_for_console_pattern('## Loading kernel from FIT Image')
+        self.wait_for_console_pattern('Starting kernel ...')
+        self.wait_for_console_pattern(f'Booting Linux on physical CPU {cpu_id}')
+        self.wait_for_console_pattern(f'ASPEED {soc}')
+        self.wait_for_console_pattern('/init as init process')
+        self.wait_for_console_pattern(f'systemd[1]: Hostname set to <{hostname}>.')
+
     def do_test_arm_aspeed_buildroot_start(self, image, cpu_id, pattern='Aspeed EVB'):
         self.require_netdev('user')
         self.vm.set_console()
-- 
2.48.1

