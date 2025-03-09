Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp606967njc;
        Sun, 9 Mar 2025 06:54:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV5ffVR4ydSaJLHktIYmL7hgRaQLkg5VJFOIDC6nVnyc1iU5MlqsTd8QKRGCjrfRHexGCXM73OEd/nc9w==@linaro.org
X-Google-Smtp-Source: AGHT+IFXHHlYBnWQ2wM1kReVBROrAqMdLtFyxUXsmzcAxNX9FefGRJ94WQ+D4+Ks8o2I51TX6tY3
X-Received: by 2002:a05:622a:2b0c:b0:476:671e:debc with SMTP id d75a77b69052e-476671ee8c8mr84616531cf.5.1741528459540;
        Sun, 09 Mar 2025 06:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741528459; cv=none;
        d=google.com; s=arc-20240605;
        b=Lo1u17vIDWIwc7vflxe+UeY9cuwLFSUK7ffMCgisB7NKRLTEMt9zzsqXLSo+O4BAUl
         /xIBYhIf4UBysfBKEoQrrqO3ZyvisSdBFhe60XfEbiDOqV8vt58QdFTIuvdqbuGLtlD/
         JXTqb1k1q0NOCQE2mWNS3REY7EPWBdZBXc4dG3E4R8k/FdHTsMCMYuFFkqBNO3R/CdYT
         2L+0JaS7UmREDRFmN9hB/ZzgwZb3vqxEkA4qmFKbCTkY36RupwZY7VQVim+o6hputcR1
         Tw8/ZhZfV2oZ19fMA9lTnxxblkHQAV46a4xIwoMRGhmcbWmekgewl0B9vvPRUEHNpMV/
         1bzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=b8X7bOh4aHrDvPhY8tiNa0eg/JWB6wkepynH6ur0Q+A=;
        fh=i/PI/VfZf54YsTwJ9sJhiHcO+8PSmdTrt3qYCjPMyJY=;
        b=VRRPiUYk0u6kHIdLn7UBD2Zz6iMtnORT90cezNjqXbm/Lt4pnIsvAZ++Lav3KzUq28
         gZuvVtmIlzkao8I2a2K3qU7iVBtKfFsiutwPpp6dS0vSbiHtW6v9Nu+SprAJCdoFUv/m
         yaslh5esu26lBvlSXt2uxW7hAAmUnNXTx3SgE7OP81KSynjcZdOR6vpjiY2TPKELwuut
         pkiiQpPenS7beMJLMHQMzMLISMkNSb+AK+idG3TDp5xdsCF+vEv7sna0RgsMENfyF3L9
         JMZb1LHtDoEmlRk45v2Unysur2Ibx4JCMuka2N/9NIJCtjdItRet8pOmF6vVyIJr1ArI
         04CA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ICKF/x57";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4768834642csi3405281cf.6.2025.03.09.06.54.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 06:54:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ICKF/x57";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trH6U-0004rq-15; Sun, 09 Mar 2025 09:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH5s-0002mq-7o
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:53:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1trH5q-0003zk-H1
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 09:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741528406;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=b8X7bOh4aHrDvPhY8tiNa0eg/JWB6wkepynH6ur0Q+A=;
 b=ICKF/x57UShi6M8679OUNIzMffCz46TzoHE9w3nB+RfeBMUD8pHVtTU2DbLbzk8ZDm45hB
 v4SPmbd5SpYaX9T8bSztDdU+edAPEGiBMzfvnVuf5+0sJpeDb73x7gPb7VTzmYc6w7I9Ss
 oIL272BQmF62ke1UhKrqDebcS0qANyI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-52-y1H9BG9EM_-jK6Xkt3GImQ-1; Sun,
 09 Mar 2025 09:53:22 -0400
X-MC-Unique: y1H9BG9EM_-jK6Xkt3GImQ-1
X-Mimecast-MFC-AGG-ID: y1H9BG9EM_-jK6Xkt3GImQ_1741528401
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 97FC4180035C; Sun,  9 Mar 2025 13:53:21 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.44.32.17])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 070F91956094; Sun,  9 Mar 2025 13:53:19 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 43/46] tests/functional/aspeed: Update temperature hwmon path
Date: Sun,  9 Mar 2025 14:51:27 +0100
Message-ID: <20250309135130.545764-44-clg@redhat.com>
In-Reply-To: <20250309135130.545764-1-clg@redhat.com>
References: <20250309135130.545764-1-clg@redhat.com>
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
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-TUID: h2yQCTHDG3cS

From: Jamin Lin <jamin_lin@aspeedtech.com>

Modified the temperature hwmon path to use a wildcard to handle different SDK
versions: "cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input".

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250307035945.3698802-27-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/functional/test_aarch64_aspeed.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/functional/test_aarch64_aspeed.py b/tests/functional/test_aarch64_aspeed.py
index e1ad7fd4708c..07b0c7c1fd27 100755
--- a/tests/functional/test_aarch64_aspeed.py
+++ b/tests/functional/test_aarch64_aspeed.py
@@ -83,11 +83,11 @@ def start_ast2700_test(self, name):
             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-1/device/new_device ',
             'i2c i2c-1: new_device: Instantiated device lm75 at 0x4d');
         exec_command_and_wait_for_pattern(self,
-            'cat /sys/class/hwmon/hwmon20/temp1_input', '0')
+            'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', '0')
         self.vm.cmd('qom-set', path='/machine/peripheral/tmp-test',
                     property='temperature', value=18000)
         exec_command_and_wait_for_pattern(self,
-            'cat /sys/class/hwmon/hwmon20/temp1_input', '18000')
+            'cat /sys/bus/i2c/devices/1-004d/hwmon/hwmon*/temp1_input', '18000')
 
     def test_aarch64_ast2700_evb_sdk_v09_03(self):
         self.set_machine('ast2700-evb')
-- 
2.48.1

