Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20364D4A607
	for <qemu-arm@archiver.kernel.org>; Fri, 16 Jan 2026 07:13:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vgdsz-0001o3-N3; Fri, 16 Jan 2026 02:04:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vgdsy-0001nm-BJ
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 02:04:44 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vgdsw-0007TI-Gf
 for qemu-arm@nongnu.org; Fri, 16 Jan 2026 02:04:43 -0500
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-42fb03c3cf2so1190921f8f.1
 for <qemu-arm@nongnu.org>; Thu, 15 Jan 2026 23:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768547080; x=1769151880; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/R5BZ9//1J+auLQWp/EEFSreqN+iaaYrBNvk9LIr+3g=;
 b=R7RFDtbap552HQh7cLfQTrihdMEvE1LTIhKHabucwRTDts+FNRWjjdpuWchtqgnMg0
 tsM/PcREJcAsijNgFRqecAlauZWFqTDl7JpRyfFV9dkc2v73KVg9OaPRcKnixq7+4vd8
 bPlw4bjkDhbbbXr78a1NdqEu8uNiu9O7IdO3GRMiY0PkrPJMLKDIOt6fiKFtmpuFzZGK
 MvqbnBat3mVPkMDy+YWiOtJkcwHrQKlYMGYe9Bj9aR2e4gptIOgdk9IhEHkXVSG/lZ/2
 DzNvoDidUJb14tB2T3amC+j21e8Nw6SXmMJ19+3KUzhpPIrd3x77dpNSCINtMKrEZ9HQ
 BKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768547080; x=1769151880;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/R5BZ9//1J+auLQWp/EEFSreqN+iaaYrBNvk9LIr+3g=;
 b=O6i5ov3E3ekMplJHufHWY2+ULM4oBVTqQMyMJ37joa+ljMmJ6rODYlrx+oLTm21/xE
 YK/X6sKMfpCB+Ne7P7b/njAqiaSGkRNgCK/Nir6FAmkFbfHcPahXArrP9W9GuIMzmW73
 3ZDkIPrA8QJK9+2woGRsAkQT58zqx7+DGAXU0d5t2vAfWvvWrFUejoYp79brHcx32QCC
 1C7g6jgYvZvF0XVoB3iZPDAPoaOt4DeMIpNVc1ug0DVy0R+FZbt//4YivE4zGw3alD3s
 Ry6Enx4jwGSXmgdD0liJUN1Sx7ii/WDKagaixMTp+dCPO+YGVfU5LI77C20YnExi0boU
 NGRQ==
X-Gm-Message-State: AOJu0Yzoxyco9Ra/ukFhx4BpiD79SFmanghse6h/ggsM9NH+xO4DPvlU
 5vRPdIQBd+4AZbFGs+Q7tQRapLZh/om2MEA1XoTjYUD5kXOImiydxkUX9q5vFZQspw4=
X-Gm-Gg: AY/fxX6iFGBwpJqtr9nDZL9rB20LsSQ8Wj/OCmcGh2KK/O2MCM4wC/tdhiFez5eFF4B
 pR1UrRU8CGjBf0TKjUvgmMg0McVocTxV9Ubxl49qZAyAXTnP+HLRSg5pQ3ydhXtBsWjqp+3KYHg
 Fb4w/owlhYmnKQJzbl8DPzZPQlNPjFXvUs+IUwZfU6d1D71NxDnLYpPyubPyHFUW+sZ3i+J+OtK
 qQXFPh9Zo0T8SV3cn2X06KaCVHL/1PxrZhRZiUzPetdzebJHQsveu1XzeJQS7XpppMRk1iSm6Cn
 NU9D5IL3EmKY6T+80y4I99U0qBiIy8S2EKKkDAkdwbP+j2P/1MWNH7g8AYSnSw57RbSlhPtIDmt
 Rok5B3ITDJf9W/haV5984EsfLzVW2KXuwazE2Q9rnd4eG9B4Vy3Y8tfg9K33Da95e7XOSv7l4ye
 if1WvqoS1V0Pv4TlgSN+FG9iP5MSo7iBrkLRS6HH2gWTPXf2ImYxik7sMr+Xp4
X-Received: by 2002:a5d:5f46:0:b0:430:f463:b6ae with SMTP id
 ffacd0b85a97d-4356a060e19mr2267377f8f.53.1768547080329; 
 Thu, 15 Jan 2026 23:04:40 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43569921da2sm3422032f8f.1.2026.01.15.23.04.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Jan 2026 23:04:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] tests/functional: Check for nested virtualization to run KVM
 tests
Date: Fri, 16 Jan 2026 08:04:38 +0100
Message-ID: <20260116070438.31869-1-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Apple Silicon, nested virtualization starts to be usable
with M3 models and later. Check for the CPU model to avoid
failure on pre-M3:

  qemu-system-aarch64: unable to find CPU model 'cortex-a72'

Now tests are correctly skipped, i.e. on M1:

  ok 1 test_kvm.Aarch64VirtKVMTests.test_aarch64_nvhe_selftest # SKIP Nested Virtualization not available on Apple M1 Pro
  ok 2 test_kvm.Aarch64VirtKVMTests.test_aarch64_vhe_selftest # SKIP Nested Virtualization not available on Apple M1 Pro

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/functional/aarch64/test_kvm.py | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/tests/functional/aarch64/test_kvm.py b/tests/functional/aarch64/test_kvm.py
index 7545f5ed554..b26c849ec67 100755
--- a/tests/functional/aarch64/test_kvm.py
+++ b/tests/functional/aarch64/test_kvm.py
@@ -29,8 +29,31 @@ class Aarch64VirtKVMTests(LinuxKernelTest):
     # base of tests
     KUT_BASE = "/usr/share/kvm-unit-tests/"
 
+    def require_nested_virtualization(self):
+        """
+        Requires the accelerator to support nested virtualization for the test
+        to continue
+
+        If the check fails, the test is canceled.
+        """
+        import platform, re, subprocess
+
+        if platform.system() != 'Darwin':
+            return
+        r = subprocess.run(['sysctl', '-n', 'machdep.cpu.brand_string'],
+                           text=True, capture_output=True)
+        if r.returncode != 0:
+            return
+        m = re.match(r"Apple M(\d+)( .*)?", r.stdout)
+        if m:
+            if int(m.group(1)) < 3:
+                self.skipTest("Nested Virtualization not available"
+                              " on %s" % r.stdout.strip())
+
     def _launch_guest(self, kvm_mode="nvhe"):
 
+        self.require_nested_virtualization()
+
         self.set_machine('virt')
         kernel_path = self.ASSET_KVM_TEST_KERNEL.fetch()
 
-- 
2.52.0


