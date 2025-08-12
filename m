Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6B9CA0EC4
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 17:28:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulsnc-0003sa-Mm; Tue, 12 Aug 2025 13:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulsnb-0003sM-BT
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 13:28:35 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulsnT-0003RS-Ur
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 13:28:35 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-45a0dc77a15so13177325e9.2
 for <qemu-arm@nongnu.org>; Tue, 12 Aug 2025 10:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755019705; x=1755624505; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XFVNnbRTiRKENsM+2C3XPaOJ9QN/hot7cxFumXFNznY=;
 b=wP4H7AWCz/8eFOIfO8ab33hK7rWHdXzEzcgJtjIo5QgYemRtDAKEH3KGIb+dEqbNFc
 NSYLeH5TfyxoBI2ZYCcgxkYXDEl6Ym7RlG723QZV1JxZbeA7ABOsfuPLPIdNWCZko+qc
 /17ZynL5dJqx8nO6awYywkQJen4ySPAc+qb14+pBIuZTT9Hod+AmeedDefkzoOmddae5
 YLEVmR77QSERdJLOSWNn3k0hMVBhsUJtMdd6CcYT6fRYPbEsBNZmaiHID30G2pDh5boT
 a2539LMN7P4IvooeMbM5/edCmeQk3ofWgpU5kMikvWEG40afUzpn/2rl0rc53z06A61U
 kDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755019705; x=1755624505;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XFVNnbRTiRKENsM+2C3XPaOJ9QN/hot7cxFumXFNznY=;
 b=bZ8lcDTEmNrQi1A3TVk/kWJuW+fB0QOxF3n9+EPumH7AKRHUgOASqOr2S5JgFXqR/N
 OZwD6io0bVQ6MxUuC/NLgSiFq3SSAe3REqnoF9iNPUhJWvAtOG7S/9MHiVb3T8PbzpS5
 sDezSMMJdCpaq9cJJURHLVPizFQudpFl2BxPgibSbVszgCKHTyIuhiA05Wz0Hh4Lm9CS
 vQv+aPxz/eBcLWiCTv4WY55oBwyzepL5W+zRpopp/7CTTlmooc3x01uURAnge/3mut3T
 KlyVYTlwg8nC4N/tk93oEzfDU+BUwXTGXTVryL//mcmYabBJqqAPN/ZF/jol7QOZWD+M
 /pnQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOsi+Kg+HJvIZfeQKW8+FCmpb8L34KnY1Nn0I2/aUgCPsJ+Q8JRNhmM6IUZqROcH00fbd7o+8qAg==@nongnu.org
X-Gm-Message-State: AOJu0YynGAWRKwxLTr3dYr/XCkaM3tl5yyc29X/TaipRF9TAvVEcNwcc
 wmOXG+e0Nk9+2UWf2U1/5CYc/0OQFzI4frHsTKTcG3lapvgwIiMD7EFpsHQfiXkmvlE=
X-Gm-Gg: ASbGncv4/yCZB1p/tV4LCCMrR6D4/pekA+0B5UjUibxRtgy9mYqbdedMYzI+BnM5Ox/
 MA3KS5jCmZj3yTiEVKdRW/oyqMwDkFHcYfOub8xG18gFRmrp4NiQIajlsFG3EqdXGOtbcwJWvvG
 tgN2KPbtndVY4ogHssYvm/ZwG0bJtndTc9tqPBTseF2cp8HR1Q5but+R87QcwJtnlO3F9WDH9Lt
 VxGadZGPUXoFuJf3LPkgJ52y7oo5D/Em+mqP4CvTvLRp+7rA2rCNUf7FMgI7HAW10g0/Ox+D8hX
 WOulSRIuE6WrL0pgsG0UFIY/Vn3rx8HCjkv9PUjf0sUh0Ug8frdo5lAe/WlmKDVMlumkkQJIjr1
 R5rXE42Bs3NyT9HE5n/+VNfVN/6Rwwz3wlqI/q6fQsowbNaux0CoCAMdXuxIO9Z2uKbmVAD8J
X-Google-Smtp-Source: AGHT+IHI5EUxCSAWZav2b9OslDPFbrZnQR5htR3M/42qqK2THZHZuDHrsCp7cbtbdmGtB2r63VUeXg==
X-Received: by 2002:a05:600c:310d:b0:456:475b:7af6 with SMTP id
 5b1f17b1804b1-45a16596597mr231935e9.7.1755019705430; 
 Tue, 12 Aug 2025 10:28:25 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e586eef8sm301292465e9.21.2025.08.12.10.28.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Aug 2025 10:28:24 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>, Cameron Esfahani <dirty@apple.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Mads Ynddal <mads@ynddal.dk>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH v2 00/10] target/arm: Introduce
 host_cpu_feature_supported() API
Date: Tue, 12 Aug 2025 19:28:12 +0200
Message-ID: <20250812172823.86329-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

Since v1:
- Addressed Richard's review comments removing 'can_emulate' arg

Hi,

Mohamed and myself are working on adding nested virtualization
support to HVF Aarch64. Mohamed approach leverages the latest
hardware features of the Apple M3+ Silicon chips [1], while mine
falls back to emulation [2] when features are not available, as
it happens with the M1 and M2 chipsets.

We want to support both methods long term, as they solve different
use cases. Therefore I'm looking for a common API for methods
added in both series.

In this series we propose the host_cpu_feature_supported() method
to check if a feature is supported by the host, allowing fall back
to TCG. KVM uses are converted, and an example -- while not really
usable without other patch applied -- is provided for HVF.

Does this look reasonable enough to pursue in that direction?

Thanks,

Phil.

[1] https://lore.kernel.org/qemu-devel/20250808070137.48716-1-mohamed@unpredictable.fr/
[2] https://lore.kernel.org/qemu-devel/20250620172751.94231-1-philmd@linaro.org/

Mohamed Mediouni (2):
  target/arm: Factor hvf_psci_get_target_el() out
  target/arm/hvf: Sync registers used at EL2

Philippe Mathieu-Daudé (8):
  accel/system: Introduce hwaccel_enabled() helper
  target/arm: Use generic hwaccel_enabled() to check 'host' cpu type
  target/arm: Restrict PMU to system mode
  target/arm: Introduce host_cpu_feature_supported()
  target/arm: Replace kvm_arm_pmu_supported by
    host_cpu_feature_supported
  target/arm: Replace kvm_arm_el2_supported by
    host_cpu_feature_supported
  target/arm/hvf: Consider EL2 acceleration for Silicon M3+ chipsets
  target/arm/hvf: Allow EL2/EL3 emulation on Silicon M1 / M2

 include/system/hw_accel.h | 13 ++++++++
 target/arm/internals.h    |  8 +++++
 target/arm/kvm_arm.h      | 24 --------------
 hw/arm/virt.c             |  8 +----
 target/arm/arm-qmp-cmds.c |  5 +--
 target/arm/cpu.c          | 16 +++++----
 target/arm/cpu64.c        | 11 ++++---
 target/arm/hvf/hvf.c      | 69 +++++++++++++++++++++++++++++++++++++--
 target/arm/kvm-stub.c     | 10 ------
 target/arm/kvm.c          | 33 ++++++++++++++-----
 10 files changed, 133 insertions(+), 64 deletions(-)

-- 
2.49.0


