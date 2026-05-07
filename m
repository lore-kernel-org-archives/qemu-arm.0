Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A1DDCD3442
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 19:49:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wL4iG-00030v-Eq; Thu, 07 May 2026 15:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wL4hV-0002mA-4D
 for qemu-arm@nongnu.org; Thu, 07 May 2026 15:48:09 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wL4hL-0006A2-BT
 for qemu-arm@nongnu.org; Thu, 07 May 2026 15:47:54 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488b8bc6bc9so8016665e9.3
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 12:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778183256; x=1778788056; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+9M59IsSQ4jRNfkdEPtwMPinyMjNpa0S+EfEckZHfMA=;
 b=yvM0SD1DbPS/fhF2nhZ6FIAwvjoPl50cetpo7E/7kxYNzJ/URcrDsAQ3kYGkLDMRU9
 wl5OQ5pcVSFh7R6f2x4DRDfQRUoI2Dde8CTZQtY++NIdbM70hrOxKCYfHcLeRZNfzuPb
 Z5SIcfYFgBo4v792vg2UyEgfS8h8cZZVd5U7FneUMLJGR+ds8/l80sq+ng16DqjFWuEK
 YxM5K5q2Spdzlc4YArt06xH1wwgBmPJdBsEo0HN04PHjV1AI90Thlz753gcuXjX9RZUX
 N7OoRHbTGhyGrWXzfOYHbSKXPJApJcvncMb6JrYGXELzyMhokX3i0VL9iz3i/JsZe12M
 sRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778183256; x=1778788056;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+9M59IsSQ4jRNfkdEPtwMPinyMjNpa0S+EfEckZHfMA=;
 b=DVvKc6iE7Q2osIY7ZPGl110t6ImComThUDrdiuJlc6ZxzjtYp5FhT9vWqXn0yeTKlq
 HbumJqbD4l7mvOvFYkXY7bfpskaUuzL6q+PFGMhWU3SDe3I4upw6C67fclz1Vzo2Jy5f
 iK7Z7fzR9uqXSsacmPBA726PA4+Z8H3bo5AKxvkfvdKuwptjkwDAMst0p/J9xuY96RWd
 UXeEuh7pMv1+dcSPnRDG3fALVPTpP6whHj2GvSrXB+WGvu7gbaduI5HfA+ANsFoAmJ4l
 fXnHEjAaa+pdFmuve1zB6MQh8LwAb085yCf12TGFRCzTFnSd/zt2HMstQGCa21kEP1xY
 VRVg==
X-Gm-Message-State: AOJu0YzEXbYX/3w4OD81cHw3ML/O95lqIDiQ6Y70xx4PD/UKEqqMTNgs
 6enAFyK2ehsR7+13z3hlxr9uVuM8go/Je8M4llNccFxOhTy+A4Py3ifpwUwJ+JMDAaZC2cM0kQD
 BmdfE
X-Gm-Gg: AeBDiess7euzI3SHlpHbXt8MIefYBQBwBfxtX+vUr04addr3Xxufc49EUhPpnc4rLeE
 75VW1hLqebGcBFCYYLZ07gKddPqmU7n05OEeNEbX1Qnf5dyv+3ikQi92abky6RvOTn2rJjkTCjk
 Mf0UCiBhIHiSumXTYyNp4KqAIxQQOPU1B+gq8gc2nGQigv01RUdAaHTJjarGMkSb0t4W5cfahVU
 ftmYWhRvUdMnf6otnU5Mmywfl+teY03d737X3HCs32ptaQfEW66QSVnLj4RzSPlP2Ps1DT2rihT
 /iGbp6crewovOL0A6RSUFMJ8kZKi4ko5ZFYSDaWDGvgxG1v+eBxumvDOQl5n35OHzlxuKm+CATt
 oqsBE0BV4U1UKLix/6Gq1TBDYNhvc/BYozR6REWLAFMLGS8XVy1zfS1wzj8vmVzP+XNmJrT/1Uv
 Z6Y8kHIreum7str/mIa1gV+MqgZm9XoNM/EIzyHnhHARmHyqDcAWbqqxLKa4TXendsuCNIKq+qx
 CPrgat+MmEU8T90tQ+ZIWXhiTDriso=
X-Received: by 2002:a05:600c:3548:b0:48a:7aad:4425 with SMTP id
 5b1f17b1804b1-48e51e097fcmr148799915e9.3.1778183255813; 
 Thu, 07 May 2026 12:47:35 -0700 (PDT)
Received: from lanath.. (wildly.archaic.org.uk. [81.2.115.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48e65c145aasm958375e9.25.2026.05.07.12.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 12:47:35 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
Subject: [PATCH 4/6] tests/functional/test_kvm.py: Skip if virtualization not
 supported
Date: Thu,  7 May 2026 20:47:26 +0100
Message-ID: <20260507194728.2034696-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260507194728.2034696-1-peter.maydell@linaro.org>
References: <20260507194728.2034696-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

The test_kvm test runs the virt board with virtualization=on,
which will fail if run with an accelerator that doesn't
support nested virtualization. Catch the VMLaunchFailure
exception and skip the test if startup failed because
the accelerator can't support virtualization.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/functional/aarch64/test_kvm.py | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/functional/aarch64/test_kvm.py b/tests/functional/aarch64/test_kvm.py
index fed18aba60..c977e8c6d2 100755
--- a/tests/functional/aarch64/test_kvm.py
+++ b/tests/functional/aarch64/test_kvm.py
@@ -14,6 +14,7 @@
 from qemu_test import Asset
 from qemu_test import exec_command_and_wait_for_pattern as ec_and_wait
 from qemu_test.linuxkernel import LinuxKernelTest
+from qemu.machine.machine import VMLaunchFailure
 
 
 class Aarch64VirtKVMTests(LinuxKernelTest):
@@ -44,7 +45,14 @@ def _launch_guest(self, kvm_mode="nvhe"):
                          '-append', kernel_command_line)
         self.vm.add_args("-smp", "2", "-m", "320")
 
-        self.vm.launch()
+        try:
+            self.vm.launch()
+        except VMLaunchFailure as excp:
+            if "does not support providing Virtualization" in excp.output:
+                self.skipTest("accelerator has no virtualization support")
+            else:
+                self.log.info("unhandled launch failure: %s", excp.output)
+                raise excp
 
         self.wait_for_console_pattern('buildroot login:')
         ec_and_wait(self, 'root', '#')
-- 
2.43.0


