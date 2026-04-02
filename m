Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC04DD6AAEC
	for <qemu-arm@archiver.kernel.org>; Thu,  2 Apr 2026 17:07:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8LUn-0001nU-PO; Thu, 02 Apr 2026 13:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w8LUI-0000qD-VK
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 13:05:48 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w8LUG-0001H7-Hm
 for qemu-arm@nongnu.org; Thu, 02 Apr 2026 13:05:46 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-486fb14227cso15019065e9.3
 for <qemu-arm@nongnu.org>; Thu, 02 Apr 2026 10:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775149543; x=1775754343; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qb+zd90ZS/Btq5gwYIJLAyNUgmi4p8lYTj1rYDPe6wE=;
 b=nB6twtv+KT9thGjJkTHgegdIj0wgPd3zMIdAsPgBZNfx4ezkcUOgv5wCo0SRF6EryW
 hnbgcAbx2q6kRnWF5/9i+q1fWO5fhDw7dLGec40wbZDc1VniZNIL+GLK6qMbLDK9T9bS
 aFAvxa0Ua2bvu1G+Vl8ZQ2YJ6FBGWRiWYT0rqaqz+J5MshIvlL3zHsz+kgvZL0lE0s7F
 bw/GTc60AXo9P9DcFoFgkibW8lE5jzTbwuEVj4TdHg9/zCL3oUr4CDU33gyI8YV2D8HN
 hDBnb2P03HA+8LO2PtTc6A5135IyHhuRar81v+yOhWGjgoCfbyYzfsRkk0G3vlsEqUc7
 H27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775149543; x=1775754343;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qb+zd90ZS/Btq5gwYIJLAyNUgmi4p8lYTj1rYDPe6wE=;
 b=fqgr5FoLpkFGHHKAnVFX4MP33loODSA3MKW/4X8QLPb6FntXx88hRbkWBp/SRF1Wuz
 tdGw9/f+ybtMiuhp6DWKL60TOHThKbfZm+WFehiLmCO30fDrlZsTLvPggPqlcj14lWP9
 A+n0z444K/V1mag45RLHmmZUUC2NMnnSmnzNbJ2aGyUhMLXDO6trWvubxAoyAvT6+IMw
 K0RTcs08M8R4u93cToUsa9kMzKL76brmBlt/BaJQIL211wLFhDkFvTN6oVkyqiqiU8Qk
 5KgChPa/nEEM1ry5r06HGpgSWPcvy9PmQ6tImlBpAFLbnTwNN5olJwLDC0PRcPRRgKkK
 4AMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0H5mtNby3eVwzPKuy0qg+CJyAW6TwrSgsEAoFhxVKC93Kv8PD7LcM1F37t0XFHpLZA/iQkW3vNg==@nongnu.org
X-Gm-Message-State: AOJu0Yy6DEn8d/s0S7mvUsF0eUH97UdtjRr+5VP404U6s/0wwjoNd5hG
 /sqzQxb1no3/Rqzx+fR3/izBGnQob5ff55gzzABfGOjzRCoXGOttcB8gSFUYqFOIsyo=
X-Gm-Gg: ATEYQzwkfBSxE6wvIP26yYAmCAEo9NtAvHWESSfaqqaqHhXFtdoknzKUZezKH/SXtTj
 D9cagrvz1zuNcrm/MowpbAt1qPa7gTCCoSNWQg5ZJ/HQWYSkgfj1h6OKLlVVM7D1dHrKcuyuENW
 6MWRTlaYJx1xlUtCVXCtT0K4W6spR1pXfVvrEsrFnchPztoiaCXw5AkYxcwEMk+Qnm6zFp7d19F
 QHPrqS9EI41GktdRaeFoM4Mgi0bu7Qt1WrZ9sZENCPX7XW5E7QAfZAkvOK3+u33nMRBuXaJaC4i
 sbeexkLQWYUzAfEuCdZxvGxZairGmYqLh8Z50hdnvsseYOwCJU4IndFSuwp98YjtF0sBZDnWv6/
 QCAwTmovUyMEVHeJfMdPgLMjvnBiCZrzZNNWik8QASSMlMxhz2OKe29WurMwl4Yu9AK6t8sQ4BO
 Y8IFujkpgQK7KcpJT+oVsuedZN95S3BN3KxkZ3YAGtDXDv//7J75bD+TL1bEcmhy+JvLe2wCTU
X-Received: by 2002:a05:600c:3508:b0:488:95d0:ee46 with SMTP id
 5b1f17b1804b1-48895d0ef40mr23033475e9.19.1775149543086; 
 Thu, 02 Apr 2026 10:05:43 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4888a63c963sm82675175e9.4.2026.04.02.10.05.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Apr 2026 10:05:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 qemu-s390x@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 qemu-riscv@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-11.1 v2 9/9] target/arm: Compile KVM as common object
Date: Thu,  2 Apr 2026 19:04:34 +0200
Message-ID: <20260402170434.94783-10-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402170434.94783-1-philmd@linaro.org>
References: <20260402170434.94783-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Neither of kvm.c nor hyp_gdbstub.c use target-specific code.
Move them from arm_system_ss[] to arm_common_system_ss[] to
compile them once. The arm_system_ss[] source set ends up
unused, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/meson.build | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/arm/meson.build b/target/arm/meson.build
index f14debc6a2f..1b5d346d474 100644
--- a/target/arm/meson.build
+++ b/target/arm/meson.build
@@ -1,7 +1,6 @@
 arm_ss = ss.source_set()
 arm_common_ss = ss.source_set()
 arm_common_system_ss = ss.source_set()
-arm_system_ss = ss.source_set()
 arm_user_ss = ss.source_set()
 
 arm_common_system_ss.add(files('gdbstub.c'))
@@ -19,7 +18,6 @@ arm_common_ss.add(files(
 arm_common_system_ss.add(files(
   'arm-qmp-cmds.c',
 ))
-arm_system_ss.add(when: 'CONFIG_KVM', if_true: files('hyp_gdbstub.c', 'kvm.c'))
 
 arm_user_ss.add(files('cpu.c'))
 arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files(
@@ -39,7 +37,12 @@ arm_user_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
 arm_common_system_ss.add(files('cpu.c'))
 arm_common_system_ss.add(when: 'TARGET_AARCH64', if_false: files(
   'cpu32-stubs.c'))
-arm_common_system_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
+arm_common_system_ss.add(when: 'CONFIG_KVM', if_true: files(
+  'kvm.c',
+  'hyp_gdbstub.c',
+), if_false: files(
+  'kvm-stub.c',
+))
 arm_common_system_ss.add(when: 'CONFIG_HVF', if_true: files('hyp_gdbstub.c'))
 arm_common_system_ss.add(when: 'CONFIG_ARM_COMPATIBLE_SEMIHOSTING',
 		                 if_true: files('common-semi-target.c'))
@@ -67,7 +70,6 @@ else
 endif
 
 target_arch += {'arm': arm_ss}
-target_system_arch += {'arm': arm_system_ss}
 target_user_arch += {'arm': arm_user_ss}
 target_common_arch += {'arm': arm_common_ss}
 target_common_system_arch += {'arm': arm_common_system_ss}
-- 
2.53.0


