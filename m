Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA74CA0ED1
	for <qemu-arm@archiver.kernel.org>; Mon, 11 Aug 2025 17:07:15 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ulVyr-0004oM-SP; Mon, 11 Aug 2025 13:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulVyp-0004nh-D3
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 13:06:39 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ulVyb-0001k1-1W
 for qemu-arm@nongnu.org; Mon, 11 Aug 2025 13:06:39 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b780bdda21so3817078f8f.3
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 10:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754931974; x=1755536774; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Gct7C1Y1ZRB4jTTLIlstS8WuVX5u4p3QrSuPcz6V+Qw=;
 b=YOa5qwM/uGwbX2q5PDlegXRA27MVRAlTUps8789volzzOqmH9W3zMxJ4uafZAEoxmF
 jnziou1L86vh9Ew8Gjire2yE6+lMYjdmF+/xaykqV0MhIixvhWOk9Q453XSa0h/DYA0Z
 /6lRmbIxVkGDpIxwweVA84DT4et8SCsPQNlhs230Z0en8ibxuuxUkpfTRgLnl+qXJJM6
 nGBTPBM1uaGKNf2rJLBoDPdJgidzAjCkv67TxwSBBbhbkt1CyNU8Leq+doEH4OUbItTs
 ZaAaJx6ORCsmqZOP6W0vjThMGtmnk+qtVQkcSMWN10Yk7IG/ozSX9mR0tB/sgYL34t5a
 WfOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754931974; x=1755536774;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Gct7C1Y1ZRB4jTTLIlstS8WuVX5u4p3QrSuPcz6V+Qw=;
 b=ezKqy3pO5aSCzLmDLMkslts3N3mQ8pQnPfqBvYChpUYYMQC7MoxCCdYBrbhooBAPx0
 //BtB5fSgdFMAm1blBLTVYrWx3eZFg/ioXf7bd6aomvSazBF1Dx2yL6BoPpYIVLSVmsF
 zOHesYPUVtOApcNXXtoHnXpSZ88J179CbRMSAhQ6EQT+kjyPcS8w/myZrut9qhcNCqbM
 xPaLTj1D8yOX1CWwNLH+nXGcB3rCXq5ZyWfvbx/2K5HvV9ihBamojR5DiQnMWUTxIwcN
 jOasE9HNIToT5+MjF/fM6OuFNO53AXC9Fy52Svy0Uv+vbcBNrycWDSCzwQ3CnE0MVvPS
 9Xfw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3kVOBNqEsGEOd98ZMOVOPk2O3PWAdIPDgeDvyDRq39BdyjnkFSfdD351uq9V2rb6fDIGNcm1eMw==@nongnu.org
X-Gm-Message-State: AOJu0YzNUjqBBn7s3/eOIyyFvx+IGvSYB3GrP0iElsgNIIfC/+mmHO5+
 NJIod9+Vg/Ar77hMLS2rATp3XNICCrGmL+Ub/22zrCJIhBEWnTDqgz5CxW2B4p9MBls=
X-Gm-Gg: ASbGncuIjxOshXJULNYWc8F0jh03Jilh49HgMbSt0lDwmpCCnqtPJzOdgF+AyhJpE1L
 nQxgh7dh8n3WlJs/zd40xuQ6soNY58m0sr0eWF39PQ7J5JbmsTMmR8h070/udcSU5LIfdasiu3U
 vGi5TPeW/u+EjkPcFCC5vtrfJFbngaH5cZaFuVBl6n5cN7TEdbDj31Yz9pLuD4eH5OuZmSh/6LA
 ALiV/hTvEmT1QhRTfGNESg1ccN0a7wP4ypezKvfIC9HNk+k9NuOD7ry+tR1luuLYahjoeuu9Ya2
 +o22tNOCLO9VqUaojyqHCt6eRwjnsWsmdfbu/XekfQtWHAiUZUSQ4AAqjw4/U8WAYOMy5qjZuAM
 xWauxBJhyFsQvILpIDGWb6ismaEmkwQpZAxMOfK8Jx0JLOuVlnFvd8LdD0ZpZ+B8x05tvpNQL
X-Google-Smtp-Source: AGHT+IFxSRfqcB19VeCggmPRFwXZs8vukwQy0+SZAp+RMLZ5Gi+wPHMHtoSwlNvUFKTkhMS9MhdHQA==
X-Received: by 2002:a05:6000:2013:b0:3b7:8473:312c with SMTP id
 ffacd0b85a97d-3b9009068b3mr11290961f8f.0.1754931974313; 
 Mon, 11 Aug 2025 10:06:14 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3ac574sm41205758f8f.5.2025.08.11.10.06.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 11 Aug 2025 10:06:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Miguel Luis <miguel.luis@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Haibo Xu <haibo.xu@linaro.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Mark Burton <mburton@qti.qualcomm.com>, Alexander Graf <agraf@csgraf.de>,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Mads Ynddal <mads@ynddal.dk>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 00/11] target/arm: Introduce host_cpu_feature_supported()
 API
Date: Mon, 11 Aug 2025 19:06:00 +0200
Message-ID: <20250811170611.37482-1-philmd@linaro.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Philippe Mathieu-Daudé (9):
  accel/system: Introduce hwaccel_enabled() helper
  target/arm: Use generic hwaccel_enabled() to check 'host' cpu type
  target/arm: Restrict PMU to system mode
  target/arm: Introduce arm_hw_accel_cpu_feature_supported()
  target/arm: Introduce host_cpu_feature_supported()
  target/arm: Replace kvm_arm_pmu_supported by
    host_cpu_feature_supported
  target/arm: Replace kvm_arm_el2_supported by
    host_cpu_feature_supported
  target/arm/hvf: Consider EL2 acceleration for Silicon M3+ chipsets
  target/arm/hvf: Allow EL2/EL3 emulation on Silicon M1 / M2

 include/system/hw_accel.h | 13 +++++++
 target/arm/cpu.h          | 23 +++++++++++++
 target/arm/kvm_arm.h      | 24 -------------
 hw/arm/virt.c             |  8 +----
 target/arm/arm-qmp-cmds.c |  5 +--
 target/arm/arm_hw_accel.c | 27 +++++++++++++++
 target/arm/cpu.c          | 14 ++++----
 target/arm/cpu64.c        | 11 +++---
 target/arm/hvf/hvf.c      | 71 +++++++++++++++++++++++++++++++++++++--
 target/arm/kvm-stub.c     | 10 ------
 target/arm/kvm.c          | 33 +++++++++++++-----
 target/arm/meson.build    |  2 +-
 12 files changed, 176 insertions(+), 65 deletions(-)
 create mode 100644 target/arm/arm_hw_accel.c

-- 
2.49.0


