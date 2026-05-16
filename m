Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D62CD4F3C
	for <qemu-arm@archiver.kernel.org>; Sat, 16 May 2026 17:17:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wOIcK-0002NA-9g; Sat, 16 May 2026 13:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIc5-0002Jd-Aq
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:15:48 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wOIc3-00080B-OV
 for qemu-arm@nongnu.org; Sat, 16 May 2026 13:15:45 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-444826c16ffso654738f8f.1
 for <qemu-arm@nongnu.org>; Sat, 16 May 2026 10:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1778951742; x=1779556542; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2gO7kH8C8rZvwRXohHJ8ISNs5J2Ughnu3Zfsenumg60=;
 b=zbt88k100yiCnI+NzJUC/mI6p4yOUFYRLtWktiTIj0yAzf1Uiv5t3ushIt4zU+t4gZ
 Rer9xU7aLPm9V46QYEaBIquceiiFoJ6pPCD3ihUwWquUwh8eUD7GQronObpt/fMjaVXk
 x396XkFnkrR/NlLiD37J+iL9bSqTOkRDWOYwrF0jJUuLyBfWVwyKFCHAgeMJEap/69j3
 sTns6ExaL8flu57w9XHVzhnD2m2xhgYhCnviZx45oG44SwfmSc6Yy1/F9kPRKFF+hgJE
 dH/xOwWy/5Pq0jvXXt0ICIUewjAWoghflkm/LZ5Iks2kg201Do6/2ZYYlZCBAtxGvR43
 b/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778951742; x=1779556542;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2gO7kH8C8rZvwRXohHJ8ISNs5J2Ughnu3Zfsenumg60=;
 b=HnmGxjTfouu83lc0xhRRulrt1t1Nizz5/Zi/9g0rvlKuTtVQCRZa1T6+C/kkn5Pm9C
 EYXgXwAWvFRBBGLFp+l7vOxDPXMgz3V0OlYnUVbgggDop0yx9z8Rv3SMy9fdtkQQSW25
 E6cWqrWCEaLhPQRnKsOeSL/HsJSCjU3ltLbguH2fUB6X3ajKLLmE72AlFuNUdIHZGyoo
 Je6D0zqGw2hCdJgQmVdXHfqDHC4w7NnYtd4tLp9UGLzijy/kc+VZBTTWOw2tg8qHTJEC
 cIjOy/dUgeh57MPEKvRdyj6rRrQD7825ZEZ6V1HlaVpRlsERgkw79ZesWKUcFKBVEcSm
 gnGw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/oKRuShpxnhHak3833wDr7RK6kAOktPXiJoaDc7ETst2HuedJMj8jbO20ScoNQnyhMmHrWbWhvng==@nongnu.org
X-Gm-Message-State: AOJu0YzhWdqZaKX2Ru2IUQtgHeZc35j41rmgg4/3mkzpJg6iyrPwekUD
 5bdNXtfnHKfHUGoRCLwQp8fZIixH0eJeKakiREOKnhOqfYAN1OYd3NiDk3S8Dfrq5IU=
X-Gm-Gg: Acq92OFaITLs/qPI9cwnw442nOP6DjoAwoLbLggJe92o1Lq4qL3rFK0vrqw497bjK3w
 phaTzOU/bNyfhttCAZq1M7Ztr9Ojb8alertTYbpk78IzzL4JULYL4JSRyA12ks89Ns8orPzB5fY
 dJE0XQUrNEadyRRbK7CbOYUhx0sS9cYaxrcl8Iz0tScv5relui8mfAnU4WNXqHO+nO+MtERYEEM
 JtO7ANKFgX5G9LD1Wc91W4cB6cQAAIn7+vmRRlNqvOyuxXcuFVLRABLwwq1r+Uuinrr5RGVRd0o
 QheJvW8/FUodLtVFX8vSyyoMl8V/ahwwA0NEpHIlK1puDBoJptgENkU6bBfmXCE3Vo5cRTa4hcX
 LaaCwGx/PXh5ChHZVzvE2ZX9cp7rC+4wYFt6J0sS7Z3ATxQpS0d4BQzWhI6fvvGmtYL09YTutJK
 ZIW8KST0rkgImD8u8Lus2n/YiXlK7b1RX1yhFZuFwIsHtSIN4UoKz3gJ25sA9xuloQC6vEM3jm
X-Received: by 2002:a05:6000:2893:b0:452:d67:5020 with SMTP id
 ffacd0b85a97d-45e5c362753mr11883251f8f.1.1778951741892; 
 Sat, 16 May 2026 10:15:41 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0a178adsm24942751f8f.18.2026.05.16.10.15.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 16 May 2026 10:15:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Joel Stanley <joel@jms.id.au>, Jamin Lin <jamin_lin@aspeedtech.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Kane Chen <kane_chen@aspeedtech.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Troy Lee <leetroy@gmail.com>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@suse.de>,
 Mohamed Mediouni <mohamed@unpredictable.fr>
Subject: [PATCH v7 02/21] hw/arm: Build ARM/HVF GICv3 stub once
Date: Sat, 16 May 2026 19:15:04 +0200
Message-ID: <20260516171524.19184-3-philmd@linaro.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260516171524.19184-1-philmd@linaro.org>
References: <20260516171524.19184-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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
Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
---
 hw/intc/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index d7db99ce354..fac2d228f9b 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -47,7 +47,7 @@ arm_common_ss.add(when: 'CONFIG_ARM_GICV3', if_true: files('arm_gicv3_cpuif.c'))
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


