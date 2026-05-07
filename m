Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29646CD343F
	for <qemu-arm@archiver.kernel.org>; Thu,  7 May 2026 13:58:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKzFC-000320-0Z; Thu, 07 May 2026 09:58:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wKzF8-00031I-Sj
 for qemu-arm@nongnu.org; Thu, 07 May 2026 09:58:22 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wKzF6-0006xi-CG
 for qemu-arm@nongnu.org; Thu, 07 May 2026 09:58:22 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-44c4cc7c1cfso750375f8f.0
 for <qemu-arm@nongnu.org>; Thu, 07 May 2026 06:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778162298; x=1778767098; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OWYgSumz8mq3xVh86X0WxwAoKHbIXTWbtCvS0CrHxmE=;
 b=aLOrUU+wUvMfKU2juESJAVH3IcQVOc0mFP6PpQ/pqHjbAEMVp9nOrl0j6UONg50vSC
 WV0OQDMOSlw0tITqTCHleCp4X50bjjBEY34tv2MixtqdWoazT6iXcaug0/5gaDoC8fQn
 YfPm4fR0tOVBHZ8ZmNSJfhJQ6zRkUye3Z/9pb5A5VuMr1WZ39sByokYnkIhjbj/CtGT9
 BqQJw7KfaVD/LY4CRNHXTZ9nglyZBge93CGgH8fuqW8iPzvwrxdLaUMSaGfBv2eI2aCc
 n2WlZBBKOY6X4b0MQXX5MmAOrlin7WpVmnlELIuAVavmuuyQ6rJAx+D+HBpP3svbnH/C
 Lq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778162298; x=1778767098;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OWYgSumz8mq3xVh86X0WxwAoKHbIXTWbtCvS0CrHxmE=;
 b=DSQ/49HcFcIwwe9GjBORVHZSoVny00/TWiYRNMlGHD+lr36YXEAxVfNopAM2LFxFeL
 OPnYi/RCkqCKi6fouX0Szs8mpWE+nECrEl4K+iks/5TLlCoxk41KG/hCSPQNeCMJLPd7
 lSUG0aT6lErdF3fucd3NssHRFfgr4+451eQtuD9qNc84V8v8xknmcRDe5Br82+HmVHTY
 sLDSx0jTstkJPhZAgCCQ1bNxQFKAzZ+P28GtDgDsseF1tsOaO4MEHynWFlCrTYr423qN
 jYRUims1jJXLiBEzCNqJDYbXX7bc75Ilsz+2Fxe3YrWWifZRA/bS2OctiQh2xhPszWWl
 Jbfg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/i7qByh2UNhONBgg8sarFIyzB6N9LCSzz3WuV0iNrI7XFkh2GmuTr/sKmi2gtU8RilFvPDNPfHgw==@nongnu.org
X-Gm-Message-State: AOJu0YwatZaweTR8mEWPKT11YwUnwQIkVOcgJv36Y1t790Kf2wJtukWz
 xvymO0+LbpY0DzsLjhMXGO6/tLD1iE8pfqzlj6imbIDZluhudQ3TuQxqufcqJH6RJyQ=
X-Gm-Gg: AeBDieunXGTHQA9f453l/aSuhA44SPzXdgQUUi8ckVBqOcwoLCbU7h+LYqmPtd6HI9F
 Nk58cYGX0LfrIzsqsvQrmmKhJpG2g7GYQZ4QanFLV7B9aK8CwL4viw9Wq1ZjKj4MKCWTgXxDXL2
 yJCiBLeRDcm7mQkJDx2W6weYxIl02rmfDUhRjhnGQW0ymsqCF/R4ltxtCc2fUFqay8BtC8pfzBN
 szemL/GH89Ged0/YkcFbxmqZnV7hUi487KoG5JCyqlUyCvuBvnRGje7Xp0hC+snQ+bvN9SgcBmw
 DkLjtSybI2ToxjLgwsBsa76OuinPoDU1loE7oxofns540cBUBrVmaQpD86THm/RGgNgyIU/AXzo
 afceh9SOl+1E9GHlUBgkyzOW8zd5ChFoFKf77l6sW453NzXfVuNIIh5Rt3zJJaknDPGWsBo2UG2
 UUkEz9g3m43s1PVYCfKfHHn2GP4eBsOL8IEba3EOGVsv74M3sbcEO3CvyzNnVrtroLMSkd2L22N
 1+fs7GmUaPTrfogEFtaTQ==
X-Received: by 2002:a5d:64e7:0:b0:445:ed7f:ce84 with SMTP id
 ffacd0b85a97d-4515b524043mr13172085f8f.10.1778162298166; 
 Thu, 07 May 2026 06:58:18 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4505238e7c0sm18577599f8f.3.2026.05.07.06.58.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 07 May 2026 06:58:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] hw/arm: Build ARM/HVF GICv3 stub once
Date: Thu,  7 May 2026 15:58:16 +0200
Message-ID: <20260507135816.71171-1-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

Move arm_gicv3_hvf_stub.c, introduced in commit 48396ad6ce9
("hw/intc: arm_gicv3_hvf: save/restore Apple GIC state"), to
the global stub_ss[] source set which holds stub files being
built once for all binaries, instead of one time per system
binary. This prevents symbol clash when trying to build a
single QEMU system binary:

  clang: error: linker command failed with exit code 1 (use -v to see invocation)
  duplicate symbol '_vmstate_gicv3_hvf' in:
      libqemu-aarch64-softmmu.a.p/hw_intc_arm_gicv3_hvf_stub.c.o
      libqemu-arm-softmmu.a.p/hw_intc_arm_gicv3_hvf_stub.c.o
  ld: 1 duplicate symbols

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/intc/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index c6de2d9d00c..25a4144c83e 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -43,7 +43,7 @@ arm_common_ss.add(when: 'CONFIG_ARM_GICV3', if_true: files('arm_gicv3_cpuif.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC_KVM', if_true: files('arm_gic_kvm.c'))
 specific_ss.add(when: ['CONFIG_WHPX', 'TARGET_AARCH64'], if_true: files('arm_gicv3_whpx.c'))
 specific_ss.add(when: ['CONFIG_HVF', 'CONFIG_ARM_GICV3'], if_true: files('arm_gicv3_hvf.c'))
-specific_ss.add(when: ['CONFIG_HVF', 'CONFIG_ARM_GICV3'], if_false: files('arm_gicv3_hvf_stub.c'))
+stub_ss.add(files('arm_gicv3_hvf_stub.c'))
 specific_ss.add(when: ['CONFIG_ARM_GIC_KVM', 'TARGET_AARCH64'], if_true: files('arm_gicv3_kvm.c', 'arm_gicv3_its_kvm.c'))
 arm_common_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('armv7m_nvic.c'))
 specific_ss.add(when: 'CONFIG_GRLIB', if_true: files('grlib_irqmp.c'))
-- 
2.53.0


