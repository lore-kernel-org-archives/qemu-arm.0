Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FD3BC79F9E
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Sep 2026 13:16:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x3ZB3-0004E2-Uj; Mon, 07 Sep 2026 09:14:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1x3ZAz-0004BV-IC
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 09:14:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1x3ZAx-0006SG-6U
 for qemu-arm@nongnu.org; Mon, 07 Sep 2026 09:14:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788786858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=40LyvCDlaHAQHcMLKYj1Q0OPDSPjXdpYRkudFHr+oJg=;
 b=CTi8gE3BJJ7vi2hSFI6DF10sIU2XcMAdxpQm2oOSVUY0W2WC7ySxkLT9rhFFZYjf8Uc8vA
 XRfTI9Gsdt2xbXk65h8ufEKDlZkeQMVuan7WXtvWTmWQ4mJHSQEUnd9VozMgBzWGjlQZ0F
 Pd0MGJQ65e02UgVFEPBBON1lexz2OO4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-626-asm5YBFWOtyy4sATIx_WoQ-1; Mon,
 07 Sep 2026 09:14:14 -0400
X-MC-Unique: asm5YBFWOtyy4sATIx_WoQ-1
X-Mimecast-MFC-AGG-ID: asm5YBFWOtyy4sATIx_WoQ_1788786852
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 956371801204; Mon,  7 Sep 2026 13:14:12 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 8DDDF427; Mon,  7 Sep 2026 13:14:11 +0000 (UTC)
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Mon, 07 Sep 2026 17:13:56 +0400
Subject: [PATCH v3 2/9] tests/functional: add skipTestIfNoHMP() helper
MIME-Version: 1.0
Message-Id: <20260907-nohmp-v3-2-c11e7d0d3d7d@redhat.com>
References: <20260907-nohmp-v3-0-c11e7d0d3d7d@redhat.com>
In-Reply-To: <20260907-nohmp-v3-0-c11e7d0d3d7d@redhat.com>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, "Denis V. Lunev" <den@openvz.org>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org, 
 Halil Pasic <pasic@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Eric Farman <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Glenn Miles <milesg@linux.ibm.com>, qemu-ppc@nongnu.org, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1108;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=DKQeIhpML80zf1OYVo6I9MFIu0Q4mYbkgHIMXRWzZK0=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqnriXvXuNuE2r07k76snHZGQN5739WyicgZ8C0
 wdG0Md/1N+JAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCap64lwAKCRDa6OEJdZac
 5X2vEACYh79+Ck3EpGOncVLJJCNpn4W7hckd1cEQJMYFOXAfjeBr4LPDeTNCnTX6bMtOP3tLdzA
 YigY+EFA+go3RSkQud1+XIPVFRXeZL0hPIc0wL6E5RwBi3CQH8drP///c7AENivtGlroFujMz0r
 Df6iBczceFMArxcIAPlo3H4l0FiDJnTr9/KNaLCdIFOHgT1rZ7suPUthwZVxoR+rx4K/wKikshZ
 iPVIcFAz5Bn92AK6yU/uV9v1BM+z7zo7ysFVr68G7ONk4qv6gJ1WVpuM3mvt61ZP5aj/tU3Ygnu
 fH2O+u49GG7MLWagHa0+9EHV4W/KA242joS9njKTH3XlLVcn4Q7yj/b5bUmuYYbiMgp7C6CMvgt
 JrzfK/5cyUotlidMSSRDLAVyVC9DPqHyOX83idaYZpkozBBebXcMzf5TiHrsLAiywzCdPUkpMAS
 /wiwg7uGOm8Q/ZC8IsFHTxoQjYg+QDkfkmFOSJiO5H6hX+H2S3AO2WAF7EUuYE8lAsVWxBE72FL
 qth3xKuROTvoUlDPt+ump+n8ndjqSNKY3QZrCiNgf1w/k6fm8xB3A/9rX+Raq1TGgcEQl5jYA5V
 vJ9wVRiq3gIJZbBvxfB4ozjUj8i9S+T1Nc1w1JLtpXir6ArrSo/jG0/F///ZzJRTT6sGjXVcVT7
 YU5wILWfIQMjm6g==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: lzNJYOJsmLQs5q3LT1fTpi7Ecf921Z8CZfE1MAZbD38_1788786852
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Reviewed-by: Thomas Huth <th.huth+qemu@posteo.eu>
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/functional/qemu_test/testcase.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/functional/qemu_test/testcase.py b/tests/functional/qemu_test/testcase.py
index 69d3d06cc0e3..bf2dc1dc101c 100644
--- a/tests/functional/qemu_test/testcase.py
+++ b/tests/functional/qemu_test/testcase.py
@@ -369,6 +369,12 @@ def require_accelerator(self, accelerator):
             self.skipTest("%s accelerator does not seem to be "
                           "available" % accelerator)
 
+    def skipTestIfNoHMP(self):
+        commands = self.vm.cmd('query-commands')
+        if not any(cmd['name'] == 'human-monitor-command'
+                   for cmd in commands):
+            self.skipTest('HMP support is not available')
+
     def require_netdev(self, netdevname):
         helptxt = run([self.qemu_bin, '-M', 'none', '-netdev', 'help'],
                       capture_output=True, check=True, encoding='utf8').stdout

-- 
2.55.0.543.g5ebe2ebe4ea8


