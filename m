Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9339CCC6B38
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 18:17:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHPvK-00019M-Ei; Thu, 15 Oct 2026 14:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xHPvF-0000rR-4A
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 14:11:21 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1xHPvC-0001PB-FB
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 14:11:20 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-91b9e758c50so3630266d6.1
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 11:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792087877; x=1792692677; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NtyH1JrbjE6E6ExgzJYIuvOowriA6YLfrM9Heqe8B7Q=;
 b=bcuuuSncitbJl/kug2/GR6na8UCzCwOM6rxAHmDv4AMUukNr0kRDsGfJYOVoHKgRo4
 UhnI+qgWy1309OcY8LOByu0f6o1gvVZrRFHslTKbLdaa2li6M2/JfiRHB62qrTXg/1OI
 uJUBG91D/rxWcIsipc5M+anDiGGdTeva+VX73Xo8w9qMci7atXssfwKrKhUJTA0wOnE5
 C2ta0+oZyDUD2I/2FfnCVn0HIaMoJXC5tarq1oD5CIfErKT8aAODyg1uiKrFBkjIT+z9
 KO1JPaCeLRdbAlozxbno7j7TnqWNpZ6Kker1tRtcMsdLzpVEeywXZgMBac868WBLPZRJ
 gj+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792087877; x=1792692677;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NtyH1JrbjE6E6ExgzJYIuvOowriA6YLfrM9Heqe8B7Q=;
 b=mo6n786EHZ1GdZRvtIuII8YW9+KvqY1o9EOVp0m46r+ZAj9EVxNs7zezrQsq87Utfx
 JD2O561njzlXf8KBBlk4Tt3OMry8OxnfUkIlHNVQBceim790iIHVUf1rbwyKQ4SbRnTA
 fjumOPrOH8QLnmq0dCMZLPnlS55/4G8QOY9T2461Oy32zzmeBDGpjWU0sy86jYXn9k4O
 mUqCjjsbMRo2enqyvgxX6eC9vkASPwOxmuWftd2rYQaNJjK4N+l9iIE8R84eH52Z3sKA
 IYoFXGZoxxuOqymGn7FCdS+IyLFEoDjjA5dU9PlO2aEEGgba694DCtj6Y6iD6eOm+7Q0
 EXuw==
X-Forwarded-Encrypted: i=1;
 AKwUvBz+mQGlSSCq4Kxga3SJj6C/yMacAXJwtAJTP0ADgAu+ikQ6HDSFhbjX28BoyOma2BMLl5HVnlLFwA==@nongnu.org
X-Gm-Message-State: AFq9FYIbq3tKhKqYSfegnaRVMj/DrUKG3GK/RWMDXzE5PHY9T7msncxf
 GrKmCMdcATOzyDyJZ4uQ5i+tUrrdktxXe+/dapR9fQ5RMuyu3uNzxbQu
X-Gm-Gg: AYBFou3u2Q7hOqtpCRVpVAddUPn7Uo60hFWucG97I2jOE7yywfq/+UviyiXoCKKlmAw
 Kskx2iat5a1bwdk/7u5WEeH5eI43JwODrwLvxvRjx92u1WLodXRlPzrM2pbiPGcx9oFRJ5sncs1
 IbIlYLMiXHbSu+2H0VTsNEHrrDbgtZCzbq14hDE09RRxRkBweK0ytgzKVH4963ZudSLJSo3X9fS
 a9mSIdRQFj0s8DyijQ472W7npflfcp6Uv859Zo2p4XkmJ4EeZPBkLSsdb4o6TFl/a/eJTPyM4AX
 uBWAd1MW/K8F3LfkSbZ5Damct5NYPRDgyoTwZo/RTVMxlT3IZ3kZPuvQxtW7PGmPdw5fhMr7k6V
 oL8kXg8owDqUWAREcU3mzg3DZpEBB6meFwzVTaHrrIMCvYeGpZO8cBDBwYQBnwB97LBs9ybQ9w8
 SrU56dXMbK/qcCtGrzPeVZ/wWJ0OivnxxshktphaVw+a1JAOW6ceOrSHAa28f7p5GYQPLsmt62L
 p/WBBCFcWjteKoXLfMFOMEWCrVvyM4saEA1ISWhvcOO3KRPw8AsVaxxAA1jzV6xozLa+g==
X-Received: by 2002:a05:6214:628:b0:914:40f4:d4b9 with SMTP id
 6a1803df08f44-91bc91d3159mr15796716d6.12.1792087877520; 
 Thu, 15 Oct 2026 11:11:17 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:919:5388:4e10:5949])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91bcba45dffsm1816206d6.12.2026.10.15.11.11.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Oct 2026 11:11:17 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Marcelo Manzo <marcelomanzo@gmail.com>
Subject: [PATCH v2 5/5] tests/functional/aarch64: add raspi4b RNG200/thermal
 test
Date: Thu, 15 Oct 2026 14:11:11 -0400
Message-ID: <20261015181111.60491-6-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261015181111.60491-1-marcelomanzo@gmail.com>
References: <20261015181111.60491-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=marcelomanzo@gmail.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Extend test_arm_raspi4_initrd to exercise the RNG200 and thermal
sensor devices added in this series: confirm the RNG200 driver probes
it ("hwrng registered" in the kernel log), then once at a shell
confirm the thermal zone reports the expected fixed reading and that
/dev/hwrng actually yields data rather than just existing.

These checks go into the existing initrd boot test rather than a new
test, to avoid spending test time booting the same kernel again.

Verified locally against this series with the exact kernel/initrd
assets this file already pins.

Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
---
 tests/functional/aarch64/test_raspi4.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/functional/aarch64/test_raspi4.py b/tests/functional/aarch64/test_raspi4.py
index bacecbbe9c..c61014b5fa 100755
--- a/tests/functional/aarch64/test_raspi4.py
+++ b/tests/functional/aarch64/test_raspi4.py
@@ -80,6 +80,8 @@ def test_arm_raspi4_initrd(self):
         #                '-device', 'qemu-xhci,bus=pcie.1,id=xhci',
         #                '-device', 'usb-kbd,bus=xhci.0',
         self.vm.launch()
+        self.wait_for_console_pattern(
+            'iproc-rng200 fe104000.rng: hwrng registered')
         self.wait_for_console_pattern('Boot successful.')
 
         exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
@@ -103,6 +105,11 @@ def test_arm_raspi4_initrd(self):
                            'memory node above the 1 GiB peripheral hole '
                            'is probably not being added' % mem_total_kb)
 
+        exec_command_and_wait_for_pattern(
+            self, 'cat /sys/devices/virtual/thermal/thermal_zone0/temp',
+            '25310')
+        exec_command_and_wait_for_pattern(self, 'head -c 8 /dev/hwrng | xxd',
+                                                '00000000:')
         exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')
         # TODO: Raspberry Pi4 doesn't shut down properly with recent kernels
         # Wait for VM to shut down gracefully
-- 
2.55.0


