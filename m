Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35384CD343F
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 19:49:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL4iB-0002wJ-KM; Thu, 07 May 2026 15:48:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wL4hZ-0002mW-Gb
 for qemu-arm@nongnu.org; Thu, 07 May 2026 15:48:09 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wL4hW-00068Y-PK
 for qemu-arm@nongnu.org; Thu, 07 May 2026 15:48:05 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso9618425e9.1
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 12:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778183253; x=1778788053; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TwQoznHfoi6X0cMFnSCdgFp2onTlRFNtNkmcJ9GY4w8=;
 b=M/hCKBEjjDEvqrp5nqZlsfv9ubd5TEQXKJTRdeE3PuIk3KhtR0T23Pz7+8GZ0rVOJt
 +Tv8SpJVW+Ri2obPvI5ZMF7F0sI7H2bXoTYMiZ5LDyWMfePRYY5Ly/fDQOmJONe0L2d7
 zqadIvTe8IyiTU7gwlIR8LungJg/7tEERQt/aKI5mMi/NcIuXqXnZM1euvpKy/1VD1cM
 w4I8Rz5MzigI+JSodEoK5+0eVfiK5LoSaO/Cs1MJcXogS7zW+hPJqKNFZmoFogOOvrgj
 WF1cYG6jORPKIzN0kRjc9LPT5PGY8qWfxGhO6kR5bFNsHXFL2+fposlPDhEX8pgGfstC
 SrYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778183253; x=1778788053;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TwQoznHfoi6X0cMFnSCdgFp2onTlRFNtNkmcJ9GY4w8=;
 b=ckO+usU0tQMIX+nIW+0iXRVeU49nAWNbZ8HgMRHC6f+zLtTuGHRwg3pBolihcczwR+
 lZ4o6UW9HfurF7SUMqpkOfF6Ot5SjHJo+PGHEk8iUMsHA1mCfzYwAfmGLFG7MGLCb49P
 3pAsRkfUnlluXH+xQAHKb3fMNfUMS6/45KBcRMRjY3hN5HSHVWifFj1LecKvpCOC2AFp
 U5mAg32EkDSn2pUYEE2KgkW+zoEUXn9vC8mWDw7Z73osmGbYA/cJ+uVIDmXzT3EMnBGI
 xJiLbzjJXsi234i4u9ZERV5s5mtJMeffkZ+P3vTAVzuAjfEHXDWeKD6Y9hJ4Ad/mKPv6
 4bXA==
X-Gm-Message-State: AOJu0YzKs6dtGgt9bE5AdLYVOjwPSywkm2WUisx2Dr/fKPfQKoN8AZB2
 J0lJ5uaamAhiNsM7YYnJQL2uQR8OvHxamu/qjt/iqvlyh4wuvJn4tezoG+9BrMsTEFk+svvUlMy
 mRD8h
X-Gm-Gg: AeBDieuYhdNfpKY/UVJLGz3S+C7NpiryHJT4+XjyInKND3L1Hx7cSiGZubIKIa1csRG
 N3P6hOs5ytR7Jt8ySBJm9LLqxuYrmKWf1kbQF3kpZ14M5u6S8ZmXwjXYbsIqavYN52v5hYr6UyM
 K08bxBiNZ0jqDRDWWwwxcO3CoXc5XLVMZ3PVIciFc8BPNLZjUHLf+oflwqYOMpSgzp1Td8oLuO2
 g+tYsR0qQUQ2F54HmuXf13cMSl39tMoHlCtD5hvVdx8uCFaJFCx99By754570JPpiL/qyMdUep7
 Lt1/YcY8X6ublJudzfkrnNUHCjPCZpOPx5v+Zx5lPCNLSyP1yKxIUQwVHW7SPE0zh/4us/rkOQX
 ZxOP29Rq5jKSdIj58ryja1n74BHSjG4bd4ft2/bltYsc172ICvmSupzXsAlTq3BTYAwxE58sqPz
 lHS1oY+BWYF/0HGmnmiVo9XCgACtNlV0IUxQ/LGjP9XHtguX0zV7Qtoy9VicaaolanWewimZ18/
 GXuUUmJSC9pIBwcqUMWgA2+1FybxOE=
X-Received: by 2002:a05:600c:a111:b0:471:700:f281 with SMTP id
 5b1f17b1804b1-48e51f46e24mr123393295e9.25.1778183252784; 
 Thu, 07 May 2026 12:47:32 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e65c145aasm958375e9.25.2026.05.07.12.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 12:47:31 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 2/6] tests/functional/test_virt_vbsa: Skip UEFI test if
 virtualization not supported
Date: Thu,  7 May 2026 20:47:24 +0100
Message-ID: <20260507194728.2034696-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507194728.2034696-1-peter.maydell@linaro.org>
References: <20260507194728.2034696-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
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

If you try to run the functional tests on an AArch64 host which doesn't
support nested virtualization in KVM, the UEFI test fails with:

   Output: qemu-system-aarch64: mach-virt: host kernel KVM does
   not support providing Virtualization extensions to the guest CPU

Catch the VMLaunchFailure exception and if it matches the error
messages the virt board puts out for virtualization not being
supported, skip the test.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/functional/aarch64/test_virt_vbsa.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/functional/aarch64/test_virt_vbsa.py b/tests/functional/aarch64/test_virt_vbsa.py
index 57bfe5d7af..04b5ff0f9e 100755
--- a/tests/functional/aarch64/test_virt_vbsa.py
+++ b/tests/functional/aarch64/test_virt_vbsa.py
@@ -17,6 +17,7 @@
 from qemu_test import get_qemu_img, skipIfMissingCommands
 from qemu_test import wait_for_console_pattern
 from qemu_test import exec_command_and_wait_for_pattern as ec_and_wait
+from qemu.machine.machine import VMLaunchFailure
 
 
 @skipIfMissingCommands("mformat", "mcopy", "mmd")
@@ -96,7 +97,14 @@ def test_aarch64_vbsa_uefi_tests(self):
                          f'file={img_path},format=raw,if=none,id=drive0')
         self.vm.add_args('-device', 'virtio-blk-pci,drive=drive0')
 
-        self.vm.launch()
+        try:
+            self.vm.launch()
+        except VMLaunchFailure as excp:
+            if "does not support providing Virtualization" in excp.output:
+                self.skipTest("accelerator has no virtualization support")
+            else:
+                self.log.info("unhandled launch failure: %s", excp.output)
+                raise excp
 
         # wait for EFI prompt
         self.wait_for_console_pattern('Shell>')
-- 
2.43.0


