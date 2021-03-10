Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp829867lfg;
        Wed, 10 Mar 2021 12:02:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy2ff0D0rI6r2jDrP5ttvmi5T5cVjQ3bXGmQNsAhg+SBtAOQI7c99ecAzCQcfq7ogmJM19J
X-Received: by 2002:a67:61c7:: with SMTP id v190mr3362984vsb.47.1615406521006;
        Wed, 10 Mar 2021 12:02:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615406521; cv=none;
        d=google.com; s=arc-20160816;
        b=yOM3bfqkhmyFM8q0h8brVeLpuMaXpU6M96z3kdhmCDCaR0MpUrH+W2elJrLr4x00mu
         kvPRprgU3aQBUW8LfTJ5l23AQ/uyUgb+mj3EKh4pBOAXqfnd2jldfTVT8pVVqsXrVuJU
         xy2mrThzifURo7qt7HtqkM9xa9kCeLv+bazT5v2xVtkVX0WUjEpudwaoqPy9YX66/8g+
         gnOpVL9hV2GcuS/zbSxGpQRZNXTVpZ3PINgNQ4IoZejm5XHrR5oNuzwABIenEWMJGWbU
         7T8PB6Q1VaQqftAQ1LHcbz23P9V3E2Ml6P19FfwNNkhOWjrIgN1TKkwpYCwHIFzjhj85
         sQnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=I5OcZ2uMrlpXu4COyyiFNZKnn1GKPKft8+tPd6y0XpA=;
        b=MZstFjtBeid/u8Yn6q/ik8BDv3DNFqeFbIpoInL60OWrbaQOFBZtQpBIGaxUpCN7SF
         5Bo6k0UnNup9gEPF33PLU7pUDUQhLr1PPWxr7Kp+9uWevo6BdBUri7ikA+XcyaAS4Nq/
         NKHZYW76LpVTc6eq/F5i7IW4PLSC34pLQ0LcWHrrrcikyMnVYVMlzhMKyIF98DGq+0F1
         3OXH3dGL2GSOEDqU0KztZlkcbbYGVjYkJLWAAY+pCg/FqCL1yBjzgiMIUDgr7/ZjnII6
         HT+1vW6zIxDWr6ouriBQTLTMmMLpSRdH27E61vdKdZE/mU+CgYTfZqabHDt1b2R/GuDG
         F/Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="fPY/VpHa";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z23si177334uap.121.2021.03.10.12.02.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 12:02:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="fPY/VpHa";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lK51s-0000tA-46
	for alex.bennee@linaro.org; Wed, 10 Mar 2021 15:02:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lK4yi-0006Ru-Ry; Wed, 10 Mar 2021 14:58:44 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:39120)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1lK4ye-0001ff-3E; Wed, 10 Mar 2021 14:58:44 -0500
Received: by mail-ed1-x52a.google.com with SMTP id h10so29991082edl.6;
 Wed, 10 Mar 2021 11:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I5OcZ2uMrlpXu4COyyiFNZKnn1GKPKft8+tPd6y0XpA=;
 b=fPY/VpHa2oeO14dIukTicykjnVRtgkTKqsHORKYxwtzSMi4eKzuueh+weifMeeC3FZ
 bTDkKbf40Muf94GsGlC+j7MOevhsx90ntPzbvr4lkCXX5DWv2AHfLrWoVoiaj3efYYDz
 ifR3wn33CiQJR7C8LGpRv084CTuutz/gIU29hpKIYWvi+aKVBdYnzzTz7XWVne9F5Tzd
 vVn6jSnCDtP1faW5V9REFbwIvvwLaGkx3emYj9H7Apa9AyJdg3j/kXoP23cCKdgUcDd9
 5H/g3vD6YiI3wQGj+WKCQh05Ytiii9RnOl/dP6iNsDx8HNvVVIepw8wTmbCoewz2s37b
 w8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I5OcZ2uMrlpXu4COyyiFNZKnn1GKPKft8+tPd6y0XpA=;
 b=SYVP6Ky5wlVH0Xjg1pRYWfExbofK3mMqcyFOCSjLBe7+I4z5zERcmRicQp3MjKb8Hx
 lnsR4mzGWLTOGecCHj3m+cY1O5fVqw9JbXh29cAIOqPLHxcw5n1yX65Mk6WN+mE38PsK
 pjF/ElIS0AP7SrTcqwDSPRmgWg/y+TKWl1A3JuGyWlXZrCg4T0skj9QvYByHDsLKNqgd
 AP69O3opIF5O0yWfglh49bUbYDvbFD9VkAv5mA+CaTlwf130etMq/FbbxBySKosIN4hV
 wPtkKYye0nBaoQavOfhG7pcxCqgFujOBf+sLiMd1Ea5zFzFbg4PByZrW9fmJPMkm5y1E
 LCVA==
X-Gm-Message-State: AOAM530LzijmmvjwCq9CkawVGtAMBx8dMoUTyKRhtHYnjSN+x5nWP1Yg
 eRU2ygJ6HKq/PvqITbLatYLwxlAvEmYFdA==
X-Received: by 2002:a05:6402:10c8:: with SMTP id
 p8mr5092352edu.144.1615406318563; 
 Wed, 10 Mar 2021 11:58:38 -0800 (PST)
Received: from tuf.home (2a02-a456-6be8-1-d8ed-76d3-94d3-2909.fixed6.kpn.net.
 [2a02:a456:6be8:1:d8ed:76d3:94d3:2909])
 by smtp.gmail.com with ESMTPSA id h13sm133570edz.71.2021.03.10.11.58.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Mar 2021 11:58:38 -0800 (PST)
From: Niek Linnenbank <nieklinnenbank@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/5] tests/acceptance: drop ARMBIAN_ARTIFACTS_CACHED
 condition for orangepi-pc, cubieboard tests
Date: Wed, 10 Mar 2021 20:58:20 +0100
Message-Id: <20210310195820.21950-6-nieklinnenbank@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210310195820.21950-1-nieklinnenbank@gmail.com>
References: <20210310195820.21950-1-nieklinnenbank@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, thuth@redhat.com, berrange@redhat.com,
 wrampazz@redhat.com, f4bug@amsat.org, b.galvani@gmail.com,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Pavel.Dovgaluk@ispras.ru, crosa@redhat.com,
 Willian Rampazzo <willianr@redhat.com>, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AkaD6D6tyH7R

Previously the ARMBIAN_ARTIFACTS_CACHED pre-condition was added to allow running
tests that have already existing armbian.com artifacts stored in the local avocado cache,
but do not have working URLs to download a fresh copy.

At this time of writing the URLs for artifacts on the armbian.com server are updated and working.
Any future broken URLs will result in a skipped acceptance test, for example:

 (1/5) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_arm_orangepi:
  CANCEL: Missing asset https://apt.armbian.com/pool/main/l/linux-4.20.7-sunxi/linux-image-dev-sunxi_5.75_armhf.deb (0.53 s)

This commits removes the ARMBIAN_ARTIFACTS_CACHED pre-condition such that
the acceptance tests for the orangepi-pc and cubieboard machines can run.

Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 12 ------------
 tests/acceptance/replay_kernel.py      |  2 --
 2 files changed, 14 deletions(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 04a8b23352..1ca32ecf25 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -507,8 +507,6 @@ def test_arm_exynos4210_initrd(self):
         self.wait_for_console_pattern('Boot successful.')
         # TODO user command, for now the uart is stuck
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_cubieboard_initrd(self):
         """
         :avocado: tags=arch:arm
@@ -549,8 +547,6 @@ def test_arm_cubieboard_initrd(self):
                                                 'system-control@1c00000')
         # cubieboard's reboot is not functioning; omit reboot test.
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_cubieboard_sata(self):
         """
         :avocado: tags=arch:arm
@@ -678,8 +674,6 @@ def test_arm_quanta_gsj_initrd(self):
         self.wait_for_console_pattern(
                 'Give root password for system maintenance')
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_orangepi(self):
         """
         :avocado: tags=arch:arm
@@ -705,8 +699,6 @@ def test_arm_orangepi(self):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_orangepi_initrd(self):
         """
         :avocado: tags=arch:arm
@@ -749,8 +741,6 @@ def test_arm_orangepi_initrd(self):
         # Wait for VM to shut down gracefully
         self.vm.wait()
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_orangepi_sd(self):
         """
         :avocado: tags=arch:arm
@@ -802,8 +792,6 @@ def test_arm_orangepi_sd(self):
         # Wait for VM to shut down gracefully
         self.vm.wait()
 
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
     def test_arm_orangepi_bionic_20_08(self):
         """
diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 8c68caae31..71facdaa75 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -177,8 +177,6 @@ def test_arm_virt(self):
         self.run_rr(kernel_path, kernel_command_line, console_pattern, shift=1)
 
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
-    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
-                'Test artifacts fetched from unreliable apt.armbian.com')
     def test_arm_cubieboard_initrd(self):
         """
         :avocado: tags=arch:arm
-- 
2.25.1

