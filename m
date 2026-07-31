Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DE0C5516D
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Jul 2026 12:44:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wpmbD-0004EN-Dk; Fri, 31 Jul 2026 08:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmbB-0004DH-E0
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:44:25 -0400
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <eblot.ml@gmail.com>)
 id 1wpmbA-0001ry-0Z
 for qemu-arm@nongnu.org; Fri, 31 Jul 2026 08:44:25 -0400
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-47362928f65so939113f8f.2
 for <qemu-arm@nongnu.org>; Fri, 31 Jul 2026 05:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785501862; x=1786106662;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :content-type:mime-version:subject:date:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=5ltDudjYe8pxHl7XxlWpSMq7ZVdlJnNvkY4t3t1H/f4=;
 b=n4iA/Zf3NkTTspwrG4a2L/7nkRhl8QXa/tPPVEmzsSi1iPkPg/n0iJcuZ5L1Y9+54m
 LW4nkd1bbMc9rCumYB8Zrb/Ucs9R2mEudPfBtaWsMOrT0YMgdWN2UCJf338J+Ul2Dajr
 3MMyK/ckAfGiYMr3mxFPRTmLlK/fBvK2AK/qSEldfEvd/7l2bF/EXhzAok5BN17pTeTC
 t1xOzFSI1eNcH/EGd8E9iLE3VdDk+ehQ+4hLDmJvICJlUTLgDOe4V2Wvqxc5yUAfCt0b
 S9/yknJ/m7sSKq+1EkqQvon9vWj9Aq/krg7N9PPIRkPVpGG4OzrXcl9ebV+dAkKUxV0y
 0ghw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqPxHWSBlfoa7dXVA6GCNcUiS8hzibHJuM9vTaB9u4wsYtuNVkQvWPx0zon4izGcjOSQLCqoZXuGQ==@nongnu.org
X-Gm-Message-State: AOJu0Yygl2W4/XI6uW7wpWppbahRk53xKVnm1NPLZzM3T1dEe7lnrxZm
 bLvi62QqHhTRAGHaODEGVYLOD4L8xSXq2d/pgyWjBhAt1YEAhox0nq0i
X-Gm-Gg: AR+sD10OzvtZGzKHZoEs0ftq/zfbN3YQs35A/ai+xP3Eu6t6BeqS/bWra/rKhdHzfb1
 QITcwiDSDL5GMHGc6t/te+UJcPEkxW0e8+e3P7ml3271eoWE+/sbU+ZX/J7HmGvAbMYBkgKOlZr
 1XMDigqi26W4N8OHeb1KsGXKPttWy9ZLRkz0qMAt7SMhCdwEi1Av6TkTRVcf/em/20ffsF5In0J
 T0MhJm2q9+zNTYKouR7XphZCAqZxaS8vqvgHUfrIr8rc1iIkIjARxOWsSgGH4wZtnqR0IrpxH+h
 P/qbWqG6HnpIL3qFExssoha1IcLN/SZoJ9US3R55ol0JCTN4IWGb5Lb5Q8rS+UoLnj901Z6Bj5/
 BdUtvU/6NKPsgzXNU+tXTe30ip5tClmzKcPYC5a1kWOKghMIB0F8pRRXspKlx1WAy1qcXlaU9NK
 CrZe8YP35EKEXSz2iHB9n2s1C2/jH+4L816cMzp/8E0DkHhxth3FxFsTCBRtNasxW3eRCRW1jKx
 It5Q0RMGy1+elRdWuFcHkVNfugZKDn0Vu+4
X-Received: by 2002:a05:6000:4b02:b0:47f:86af:8fe7 with SMTP id
 ffacd0b85a97d-47fd2add55amr4786062f8f.22.1785501862411; 
 Fri, 31 Jul 2026 05:44:22 -0700 (PDT)
Received: from localhost (89-93-216-19.hfc.dyn.abo.bbox.fr. [89.93.216.19])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd456220esm4643136f8f.18.2026.07.31.05.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:44:21 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:45:19 +0200
Subject: [PATCH v2 20/25] tests/functional: aspeed: add hwmon sensor read
 helpers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sanmiguel-bmc-locator-v2-20-1266926ba769@free.fr>
References: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
In-Reply-To: <20260731-sanmiguel-bmc-locator-v2-0-1266926ba769@free.fr>
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>, 
 =?utf-8?q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>, Kane Chen <kane_chen@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <th.huth+qemu@posteo.eu>, 
 =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Emmanuel Blot <eblot@meta.com>, Emmanuel Blot <emmanuel.blot@free.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785494709; l=1618;
 i=emmanuel.blot@free.fr; s=20260602; h=from:subject:message-id;
 bh=OWHYGLs9Qe48IkzshR4rzRcrC9b6ZFXaLE+JZF/S+fM=;
 b=J5M9HbJ1gKhvbWdXj54EEgDwLw2aIicbtMhLVNudouK6B3C9meC6hSnQaSapht6DcOAv3aYKR
 O0C2qT9fGoWCYJ0kyCQ4vEq9qA9pai0f2DDx18FlQ/ToBnh+PvCPaM1
X-Developer-Key: i=emmanuel.blot@free.fr; a=ed25519;
 pk=0qFrZ21FAAN8OfVsSoVcCFTk/NMYOWzxJz4paSAVm0g=
Received-SPF: pass client-ip=209.85.221.42; envelope-from=eblot.ml@gmail.com;
 helo=mail-wr1-f42.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Emmanuel Blot <emmanuel.blot@free.fr>
From:  Emmanuel Blot via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Add read_hwmon()/wait_hwmon_value() to AspeedTest so board tests can
read a sysfs hwmon attribute over the console and poll it until it
reaches an expected value, instead of each test carrying its own copy.

Signed-off-by: Emmanuel Blot <emmanuel.blot@free.fr>
---
 tests/functional/aspeed.py | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/functional/aspeed.py b/tests/functional/aspeed.py
index 08af6b4839..84d40fc0e9 100644
--- a/tests/functional/aspeed.py
+++ b/tests/functional/aspeed.py
@@ -2,6 +2,9 @@
 #
 # SPDX-License-Identifier: GPL-2.0-or-later
 
+import re
+import time
+
 from qemu_test import exec_command_and_wait_for_pattern
 from qemu_test import LinuxKernelTest
 
@@ -29,6 +32,19 @@ def do_test_arm_aspeed_openbmc(self, machine, image, uboot='2019.04',
     def wait_for_boot_complete(self):
         self.wait_for_console_pattern('login:')
 
+    def read_hwmon(self, hwmon, attr):
+        return exec_command_and_wait_for_pattern(
+            self, f'cat {hwmon}/{attr}', self.PROMPT)
+
+    def wait_hwmon_value(self, hwmon, attr, expected):
+        pattern = re.compile(rb'(?m)^%d\r*$' % expected)
+        if pattern.search(self.read_hwmon(hwmon, attr)):
+            return
+        time.sleep(2)
+        out = self.read_hwmon(hwmon, attr)
+        if not pattern.search(out):
+            self.fail(f'{attr} did not reach {expected}: {out!r}')
+
     def do_test_arm_aspeed_buildroot_start(self, image, cpu_id, pattern='Aspeed EVB'):
         self.require_netdev('user')
         self.vm.set_console()

-- 
2.50.1


