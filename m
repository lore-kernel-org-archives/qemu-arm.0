Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B43FCCD1BC
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Oct 2025 11:50:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vBtmX-0005Iv-U0; Thu, 23 Oct 2025 07:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtmJ-00056J-7H
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:46:54 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vBtmG-0001zy-Lw
 for qemu-arm@nongnu.org; Thu, 23 Oct 2025 07:46:46 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4710683a644so5862515e9.0
 for <qemu-arm@nongnu.org>; Thu, 23 Oct 2025 04:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761220000; x=1761824800; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=n8zWC7M3fjy9UDSxVAHqTLwYpO6gTumUjKqknHxhhCQ=;
 b=TZeg8fq5X7MXdCWllXk3uateSW95vnj4TkIguW0zWyQd1ywIY+Lj+xcFm5sfmfmL0c
 +2IcYS9B6TftuJBRR7QnucOlfeylM8I6DnC/pcfLzSduve4u2e7EJR0SE2q5FdSrubZR
 V4WV9YOKK+LIi3dUHSOas/QBzDObVywzXMbcs8yB4CWP49a4250d6NRrO6xcoNHKb/V9
 /OP2u2ua00gKJaNn07QHXK9FErMvbp6tKwHJwjmjEUv4b2hh64Y7W8Z630G0j2vAgXBV
 6jHZu4q84ljp7o4Z7wnaJ3WQnKBuEsR5XtSl9YcmeWmUDTYkO/zZrvJYnxWyOWtYLvWe
 vajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761220000; x=1761824800;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n8zWC7M3fjy9UDSxVAHqTLwYpO6gTumUjKqknHxhhCQ=;
 b=FPHlaOk50Cy9lMr6TZKZE/684cOI9q3xiuZALj7Vj4WpRTzgCF7fwyC5oBI9Mx+U23
 CTOKBToTljfThUDOVP3tSw7P+g5PE4l4zyjQpfFsTTjhdGuGwrk9x+CQ9mCvrmRp4/8f
 ToCkJMQd8CLScThCN7eUhozWU58nvKXQe/y4lysDu+zuMWwX8sszkG0qctbvmp9mZZCN
 ETKodqVLqPzRZXAo7cE78+lcaTVYXDZXFXgd2j2us2LyHJ/RPWIUoMOlQPcjtz+UeB7I
 YMw5h4Eipqc97VNJhW/ISGQMk8EjJ6XTpH39jJccckMwlPojrfrMYW1Kzhnd20sD3y9C
 UzmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaJVo/LmrxuKNOpJYPcEPEBh1eeyGx5cnvtkVRU+ReU5d4N+vkseIustqdDHMnpp9fmDxa48411g==@nongnu.org
X-Gm-Message-State: AOJu0YzIM+PlgOurztvcHCe4gxmeTOoZAFU/Kst5xYxMKecXKLT5quiM
 mqkbQCSwWEnsbUQazVMQKzE4QYVKBK6E6mgNgypVt+6ToRKCs6ObcH+RIm349tBEl3U=
X-Gm-Gg: ASbGncviM+zb3vN3vWZI/0UqTUQ1T7/vDgcHjgzlb4RYW9XUrHnUCsyKx8Rls+TvsQJ
 OndnE8m01i18KRMIqjtplddKilywe0W9TpQdz6BaF4I/QL1oWrbj5ijhibjAl9jAxlfo7GKRclu
 Vs9tcvytvJFlGH0ods0wGf7jYCa/UWtYqBSsEkMCy9OGUn1Ve50Bz74eQPpEEFNYgr57+T+ymuz
 ZoMUpdeUp8OhTCQYbtoGXl1g/VBzM2U5m3+CCtjcdDZVAkDB1CbIusU9tWJwH4TnqTOmb7Mww2t
 VSRaYTB1QMUHWhoR4YKypkdsCqCTuX878g6+nEmyXAxrUmZOmxTJ6ZSSIJlCg8WYKBeuAJny7xD
 Hl5iHJHGAmzwTVQIy9eTrUTJOwHjFb4W1j1y5F/604rlYA6J9/xgAUlJDfMGpShwQlIgk03XEyR
 XcPGyQwG9FnzI8OVHEQUEu+mttoFdgRNtEOJ7vmW5AbQBAhLVj7g==
X-Google-Smtp-Source: AGHT+IEw4NMm61VPNAV+kzWTv3krjxFOWjAccrYMj7dp9f8ITll3XXmmznaitlSmXIPyA9rzG51e4A==
X-Received: by 2002:a05:600c:6992:b0:471:5c0:94fc with SMTP id
 5b1f17b1804b1-475c3fa355cmr49183665e9.6.1761220000522; 
 Thu, 23 Oct 2025 04:46:40 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898eb549sm3500909f8f.41.2025.10.23.04.46.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Oct 2025 04:46:40 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Mads Ynddal <mads@ynddal.dk>, qemu-arm@nongnu.org,
 Peter Collingbourne <pcc@google.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>
Subject: [PATCH v2 00/58] target/arm/hvf: Consolidate
Date: Thu, 23 Oct 2025 13:45:37 +0200
Message-ID: <20251023114638.5667-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

FYI I couldn't address all comments from previous iterations,
so plan to revisit and self-review some patches, improving
commit descriptions. Still good enough for review / testing IMO.

Since v1:
- Addressed Mads & Richard comments
- Fixed migration by reworking memory listeners
  (unfortunately the current broken code has been
   used as base for WHPX)
- Sync CNTV_CTL/CVAL_EL0
- Remove WFI racy signal implementation
- Simplify PSCI Suspend (I expect the same can be
  done for the other hvf_psci_cpu_off() calls).
- Emulate more missing registers (PMU & Monitor Dbg)

From v1:
- Fix a pair of memory leak
- Check a pair of return values
- Mention calls which must be run on vCPU thread
- Force MIDR
- Use hv_vcpu_config_create/hv_vcpu_config_get_feature_reg
  when not running on vCPU thread
- Factor hvf_handle_vmexit() / hvf_handle_exception(() out
- Call hv_vcpu_run() in loop
- Guard hv_vcpu_run() between cpu_exec_start/end()
- Restrict ARM specific in AccelCPUState

Based-on: <20250829152909.1589668-14-pbonzini@redhat.com>

Mohamed Mediouni (2):
  target/arm/hvf: Hardcode Apple MIDR
  target/arm/hvf: switch hvf_arm_get_host_cpu_features to not create a
    vCPU

Philippe Mathieu-Daudé (47):
  target/arm/hvf: Release memory allocated by hv_vcpu_config_create()
  target/arm/hvf: Trace vCPU KICK events
  target/arm/hvf: Check hv_vcpus_exit() returned value
  target/arm/hvf: Check hv_vcpu_set_vtimer_mask() returned value
  accel/hvf: Rename hvf_vcpu_exec() -> hvf_arch_vcpu_exec()
  accel/hvf: Rename hvf_put|get_registers -> hvf_arch_put|get_registers
  target/arm/hvf: Mention flush_cpu_state() must run on vCPU thread
  accel/hvf: Mention hvf_arch_init_vcpu() must run on vCPU thread
  target/arm/hvf: Mention hvf_sync_vtimer() must run on vCPU thread
  target/arm/hvf: Mention hvf_arch_set_traps() must run on vCPU thread
  accel/hvf: Mention hvf_arch_update_guest_debug() must run on vCPU
  target/arm/hvf: Mention hvf_inject_interrupts() must run on vCPU
    thread
  accel/hvf: Implement hvf_arch_vcpu_destroy()
  target/arm/hvf: Simplify hvf_arm_get_host_cpu_features()
  target/arm/hvf: Factor hvf_handle_exception() out
  target/i386/hvf: Factor hvf_handle_vmexit() out
  target/arm/hvf: Factor hvf_handle_vmexit() out
  target/arm/hvf: Keep calling hv_vcpu_run() in loop
  cpus: Trace cpu_exec_start() and cpu_exec_end() calls
  accel/hvf: Guard hv_vcpu_run() between cpu_exec_start/end() calls
  target/arm: Call aarch64_add_pauth_properties() once in host_initfn()
  accel/hvf: Restrict ARM specific fields of AccelCPUState
  target/arm: Rename init_cpreg_list() -> arm_init_cpreg_list()
  target/arm: Better describe PMU depends on TCG or HVF
  target/arm/hvf: Rename 'vgic' -> 'emu_reginfo' in trace events
  target/arm/hvf: Emulate PMU registers
  target/arm/hvf: Emulate Monitor Debug registers
  target/arm: Re-use arm_is_psci_call() in HVF
  target/arm: Share ARM_PSCI_CALL trace event between TCG and HVF
  target/arm/hvf/hvf: Document $pc adjustment in HVF & SMC
  accel/hvf: Trace prefetch abort
  accel/hvf: Enforce host alignment when calling hv_vm_protect()
  accel/hvf: Have WFI returns if !cpu_has_work
  accel/hvf: Implement WFI without using pselect()
  accel/hvf: Have PSCI CPU_SUSPEND halt the vCPU
  accel/hvf: Introduce hvf_arch_cpu_synchronize_[pre/post]exec() hooks
  target/i386/hvf: Flush vCPU registers once before vcpu_exec() loop
  target/arm/hvf: Flush vCPU registers once before vcpu_exec() loop
  accel/hvf: Sync CNTV_CTL_EL0 & CNTV_CVAL_EL0
  accel/hvf: Model PhysTimer register
  accel: Introduce AccelOpsClass::cpu_target_realize() hook
  accel/hvf: Add hvf_arch_cpu_realize() stubs
  target/arm: Create GTimers *after* features finalized / accel realized
  target/arm/hvf: Really set Generic Timer counter frequency
  accel/hvf: Do not abort in hvf_arm_get_*_ipa_bit_size()
  hw/arm/virt: Warn when HVF doesn't report IPA bit length
  target/arm: Only allow disabling NEON when using TCG

Richard Henderson (9):
  accel/hvf: Create hvf_protect_clean_range, hvf_unprotect_dirty_range
  target/i386/hvf: Use hvf_unprotect_page
  target/i386/hvf: Use address_space_translate in ept_emulation_fault
  accel/hvf: Simplify hvf_log_*
  accel/hvf: Move hvf_log_sync to hvf_log_clear
  accel/hvf: Simplify hvf_set_phys_mem
  accel/hvf: Drop hvf_slot and hvf_find_overlap_slot
  accel/hvf: Remove mac_slots
  target/arm/hvf: Implement dirty page tracking

 include/accel/accel-cpu-ops.h |   1 +
 include/system/hvf_int.h      |  49 ++--
 target/arm/hvf_arm.h          |  11 +
 target/arm/internals.h        |   2 +-
 accel/accel-common.c          |   5 +
 accel/hvf/hvf-accel-ops.c     |  28 +-
 accel/hvf/hvf-all.c           | 184 ++++--------
 cpu-common.c                  |   3 +
 hw/arm/virt.c                 |   8 +-
 target/arm/cpu.c              |  71 ++---
 target/arm/cpu64.c            |   8 +-
 target/arm/helper.c           |   2 +-
 target/arm/hvf/hvf.c          | 494 +++++++++++++++++++------------
 target/arm/machine.c          |  10 +-
 target/arm/tcg/psci.c         |   3 +
 target/i386/hvf/hvf.c         | 534 ++++++++++++++++++----------------
 target/i386/hvf/x86hvf.c      |   4 +-
 accel/hvf/trace-events        |   1 +
 target/arm/hvf/trace-events   |   6 +-
 target/arm/trace-events       |   3 +
 trace-events                  |   2 +
 21 files changed, 759 insertions(+), 670 deletions(-)

-- 
2.51.0


