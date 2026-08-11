Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F072C5B572
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 14:37:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtna0-00005l-0l; Tue, 11 Aug 2026 10:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wtnZy-00004x-UU
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 10:35:46 -0400
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1wtnZx-0001oi-At
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 10:35:46 -0400
Received: by mail-qt1-x82b.google.com with SMTP id
 d75a77b69052e-5218927884fso29477731cf.3
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 07:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786458944; x=1787063744; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=qtwJ48c2jv1FFgaa3GcNc1BiQL2QiF7L65p40Cem4T0=;
 b=jCUPPo1PuVjifc5P8py4KEx+NyON8DhRqLFXi9mLb0Y66vOSSacHBZ7Z2LNaUKVD2K
 1SRRue4WS9UpLh+dq03RmC64++fbekkYnP9VB1zM3kK6EPMwRufv5z01uV76JOQO39ub
 9Awtl7oDsd4pDmZCI8U4HX4jVtU6e6Q3/16Eb2OFAi8bhgI6Ue2FEBKQjHpe0JMmDrPL
 unUM/20ukUZ+TuFf65XvoiGILyzwVUxQxkDKVtOg35arSSsdv8I5Q75nOL7kL7gJ5Rda
 YKGyMbPSvrS+blX8j/wV6bPPddXZkXolTnKyzP2v6z5/OGkEIs/CoajN/pnVyQ2903mJ
 e2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786458944; x=1787063744;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=qtwJ48c2jv1FFgaa3GcNc1BiQL2QiF7L65p40Cem4T0=;
 b=k2C0z7tq+q6A8JhZ5WSJd8WpqjfbWU296TTRNRyeB7vav5886YxJxzuda1BjHtgtN8
 Q4XVi0XH/niDM/rrQWQR2iGvsliBZWfE5meH3oB+UC0wpGlTBXsK6/iCo+U6OT7Ujbxe
 KIm0RlCAFBvlxyYeFrpdKZiQC3w7CpMHo5h9wjJKOZn1ucxwDckT4lJQHBnclklqLwVu
 NZAWXwoba8i4p77XKY0URfcA2dnM4HK9fYQ9Nm3M99Pq8VTMES4YWyzbUDPZxf8IJyKO
 0l6feTnjsRB6FNn7GWWpyj+tOCO1OA27JJAhES7X/TMgYvjGRndfEwHUCZCaelue2lBs
 Yz5A==
X-Forwarded-Encrypted: i=1;
 AHgh+RrN7DAuQsu5rxT5Ul7KRXY1JNqD8YJUvOSptZdwN/MgCt1ujQHZUjLIlYxcAKoc1ZJUK85qyp0fmg==@nongnu.org
X-Gm-Message-State: AOJu0Yx3DOTQuane1rH+rO5lZrG/Sxl5ruRPFHu61NI7LnqXFbK9eDt+
 wSrk3xZkDkJO4eg9XdOzOTYJvTwObPuKxAfZLXTZO/wJbJ64BA/4dprb
X-Gm-Gg: AR+sD11BSl+lAzff70HQoLN9v9n7GrG2IspKGtcYp74OS5QV42h80Emq8nnDJjLC5Ir
 AN1girye19aWHz9ISOqZNnCKPRAAe/ocal8VmLtW4iNxA6YwEwn6pJmgc5h/HL1yp6jwEVb8wgw
 X0lA9GjVzCGoZL7B0PQRZHPxJo8DyG94pasbousbnYxiW0WNkAR/YmwhSi/paNKp1gUj6MP1gZK
 D+wIEnifJkWFiYtYge+wi1GJShuhQTVSA6pJIzVNJ9z7ORV1AJzQ9DtA7d4BsfbGjZKwpWSapcZ
 d7ZkRn5nzjtHYumaivR2mODZulSqdfCGjyZYI/VFuvLxwq8comOUHbVNy9MVSd+8zlF2gzK7B8u
 v0jr5vWFw+i3CCGhnOq6eXN17iEWny6jnKTb31bA6DvTWeL5c4MNEGrE3Y1i7ZQiG4X7MINaIEd
 UUqKOlHFoBiH1uZSv4kyHCKgqcOhK7ybAxnR+mmR2Uu5t7/S1eAZvlZptujV1FRUBymaPDk/U/V
 TGnPnloiYqb6uYrS5I=
X-Received: by 2002:ac8:7f07:0:b0:51c:239:42da with SMTP id
 d75a77b69052e-52d584f6403mr33135831cf.15.1786458944155; 
 Tue, 11 Aug 2026 07:35:44 -0700 (PDT)
Received: from localhost.localdomain ([198.16.145.87])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90a6c3ec565sm376396d6.43.2026.08.11.07.35.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 11 Aug 2026 07:35:43 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@mailo.com>
Subject: [PATCH v3 2/2] tests/functional/aarch64: add raspi4b full-RAM
 regression test
Date: Tue, 11 Aug 2026 10:35:39 -0400
Message-ID: <20260811143539.7835-3-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260811143539.7835-1-marcelomanzo@gmail.com>
References: <20260811143539.7835-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82b;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qt1-x82b.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Guards against the bug fixed in the previous commit: boots raspi4b's
default 2 GiB configuration and checks that the guest actually sees
close to that (>1.9M kB), not the ~921 MiB the bug left it capped at.
Deliberately checks a threshold rather than the exact byte count of
either figure, since the precise number depends on how this specific
pinned kernel accounts for its own early reservations; the threshold
is comfortably between the two (943524 kB broken, 1905824 kB fixed,
confirmed by hand against this exact kernel/initrd).

Folded into the existing test_arm_raspi4_initrd test rather than a
new standalone boot, since it needs no machine state that test isn't
already setting up, and the functional-test suite is already slow
enough from how many separate guest boots it runs.

Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
---
 tests/functional/aarch64/test_raspi4.py | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/tests/functional/aarch64/test_raspi4.py b/tests/functional/aarch64/test_raspi4.py
index 35ba6c24f7..8506854d99 100755
--- a/tests/functional/aarch64/test_raspi4.py
+++ b/tests/functional/aarch64/test_raspi4.py
@@ -86,6 +86,23 @@ def test_arm_raspi4_initrd(self):
                                                 'BCM2835')
         exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
                                                 'cprman@7e101000')
+
+        # We used to get the RAM size wrong; guard against a regression
+        # (see git history for details).
+        mem_total_kb = None
+        cmd_output = exec_command_and_wait_for_pattern(
+            self, 'cat /proc/meminfo', 'MemAvailable')
+        for line in cmd_output.decode('ascii', errors='replace').splitlines():
+            if line.startswith('MemTotal:'):
+                mem_total_kb = int(line.split()[1])
+                break
+        self.assertIsNotNone(mem_total_kb, 'MemTotal line not found')
+        self.assertGreater(mem_total_kb, 1900000,
+                           'guest RAM (%d kB) is far below the ~1.9 GiB '
+                           'expected for a 2 GiB raspi4b -- the second '
+                           'memory node above the 1 GiB peripheral hole '
+                           'is probably not being added' % mem_total_kb)
+
         exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')
         # TODO: Raspberry Pi4 doesn't shut down properly with recent kernels
         # Wait for VM to shut down gracefully
-- 
2.47.1


