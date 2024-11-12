Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7134484njc;
        Mon, 11 Nov 2024 22:30:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU7rcK11VFUvzts79fZZjQF4FoD0rF51txpd1vnpdDvpdZcQqevuMeiyeM649jyln6M/rkdABpJBpns0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFdQbOXyFcox8l321SwWELdD/0wLvVRM2EAdk2l2HXzbOtgIBtegfIdegN89a/+z6dQ5wDH
X-Received: by 2002:a05:620a:24cb:b0:7ab:32a8:d61f with SMTP id af79cd13be357-7b33192f5demr2598341285a.26.1731393000426;
        Mon, 11 Nov 2024 22:30:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731393000; cv=none;
        d=google.com; s=arc-20240605;
        b=cInOoumFRhgspUw88Jx61vpDxm1Oottj4JBsm6JZLIWI763+NQoPNX0HuBoikC1Kkv
         E2UdAglmHdbt67COSnG2XQJMfFB1vrMgOZtKF2sDzo67PoYNaF94zJ3z68U1Kk77S8IY
         k3qUVtsu4RS4+mBrXvgVmL7r3EUR2NhdoqzQ+jgstA0NW59S3+9tGGchNqiAuZSak1lV
         LlMWYumqFBovSHmXzCMNavzzjD4xL8M8aANBLK82vn/Fbm+daxUJK/u3diEaTsB3S0I7
         7SMgTuAeIx86JWvXcTVfY7G0mFL2xUBw4b7r/hx0Afsj2ZfNGmhdZVx8xb95YUXiXsT5
         JYYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=MQxDgg+pj2eNUN1t9f4UF8jIfFSJe4LA4s8kBjckYoc=;
        fh=36XeOeSnsB5LbZUpSpyTPSVUP6DQSW+xMm0rZH0YiK4=;
        b=JqBma2tWJEJIjOTm+aHXX0GKbeoyRAbE7/aAgDiPmsG1AouTPOYJLjIkG16pa7oYS8
         lj6ydI6WH1pfhWQnNe4MgOkd0mlLbuoXqtPEKE48DuNWO+4NYy4wppkNqyjS+MdGGNf6
         BBo2xyeuIEXK8Jg28b/4ZwuCPMCgQbbP24x+ft7+hoWDKWRKnAPnkdJb1a+9aSiynmNp
         ltiIsXmnqNl0+KuwX56/Vj4nezwefdlz7BLS6Bva2LYOrIQHO40Bn9dn8EEo0zaQgOJ9
         8Hil92rK4r3aS33YF43ZFTlQslMQQxNL9XwqU6wkuyCoW8C/7qGeAJvWegIpBX4/Tsq9
         4jvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fK0CabmW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff6ce465si138130091cf.728.2024.11.11.22.30.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Nov 2024 22:30:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fK0CabmW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tAkON-0005yU-4R; Tue, 12 Nov 2024 01:28:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tAkOK-0005xA-5I
 for qemu-devel@nongnu.org; Tue, 12 Nov 2024 01:28:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1tAkOI-00020t-S2
 for qemu-devel@nongnu.org; Tue, 12 Nov 2024 01:28:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731392922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MQxDgg+pj2eNUN1t9f4UF8jIfFSJe4LA4s8kBjckYoc=;
 b=fK0CabmW2jPidWsvsC0dL8GxYv66Nu9mySCwpcQ4XMb++gH1dnzaOcVvY7Eq9qxinawD+F
 x1KOuOSBjA/hsZ0N2awcREDaHiWOJaqWEbsJmQNWdp1IMV+j9+CTTAxvk5ObEGPFn8FCQ4
 f/OZ6Py0hKbjZ9FsrCPXCgAeBXgeXQA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-194-bTS4PZpyNxu5pJ28mSXaxg-1; Tue,
 12 Nov 2024 01:28:37 -0500
X-MC-Unique: bTS4PZpyNxu5pJ28mSXaxg-1
X-Mimecast-MFC-AGG-ID: bTS4PZpyNxu5pJ28mSXaxg
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7410F19541A1; Tue, 12 Nov 2024 06:28:35 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.39.193.48])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 028A519560A3; Tue, 12 Nov 2024 06:28:31 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PATCH v1 4/4] tests/functional: Remove sleep workarounds from Aspeed
 tests
Date: Tue, 12 Nov 2024 07:28:06 +0100
Message-ID: <20241112062806.838717-5-clg@redhat.com>
In-Reply-To: <20241112062806.838717-1-clg@redhat.com>
References: <20241112062806.838717-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.122,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 8ilvCa/L77UC

These were introduced in the avocado tests to workaround read issues
when interacting with console. They are no longer necessary.

Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/test_arm_aspeed.py | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/tests/functional/test_arm_aspeed.py b/tests/functional/test_arm_aspeed.py
index bdd5771a794e..07a8905e2365 100755
--- a/tests/functional/test_arm_aspeed.py
+++ b/tests/functional/test_arm_aspeed.py
@@ -136,10 +136,8 @@ def do_test_arm_aspeed_buildroot_start(self, image, cpu_id, pattern='Aspeed EVB'
         self.wait_for_console_pattern('lease of 10.0.2.15')
         # the line before login:
         self.wait_for_console_pattern(pattern)
-        time.sleep(0.1)
-        exec_command(self, 'root')
-        time.sleep(0.1)
-        exec_command(self, "passw0rd")
+        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
+        exec_command_and_wait_for_pattern(self, 'passw0rd', '#')
 
     def do_test_arm_aspeed_buildroot_poweroff(self):
         exec_command_and_wait_for_pattern(self, 'poweroff',
@@ -210,7 +208,6 @@ def test_arm_ast2600_evb_buildroot(self):
              'echo slave-24c02 0x1064 > /sys/bus/i2c/devices/i2c-3/new_device',
              'i2c i2c-3: new_device: Instantiated device slave-24c02 at 0x64');
         exec_command(self, 'i2cset -y 3 0x42 0x64 0x00 0xaa i');
-        time.sleep(0.1)
         exec_command_and_wait_for_pattern(self,
              'hexdump /sys/bus/i2c/devices/3-1064/slave-eeprom',
              '0000000 ffaa ffff ffff ffff ffff ffff ffff ffff');
-- 
2.47.0

