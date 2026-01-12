Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD2CC9EC63
	for <qemu-arm@archiver.kernel.org>; Mon, 12 Jan 2026 10:31:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vfFCV-0000gq-IE; Mon, 12 Jan 2026 05:31:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFC5-0000JJ-SH
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:30:53 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vfFC1-0001cE-St
 for qemu-arm@nongnu.org; Mon, 12 Jan 2026 05:30:40 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so68300555e9.2
 for <qemu-arm@nongnu.org>; Mon, 12 Jan 2026 02:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1768213836; x=1768818636; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7267+OhhCBR5I6AkRU6RfU6yngvUSAYC2qk6Sp2APtM=;
 b=x6zqhVfc9LueJ+IAO4AO7+LDIl7y2JNN9Ooahx2qTLUmquxFI/5f+VwVQhqFARCIzC
 kVSZ/EAP9vCloRRnV/zHGa7jG20AXFs3rU1cpqGxqHznqmvcWBZYWedJOjllx5EH1TQ4
 qGQJagfSnEl0P/SfHEXItHVJapNIDR9+Tm4Ycnhx4tJOtpKmY/H5JplkipIXWjmb93k1
 ZTLrgcToT1l1j8FEEgauq62PpOJSiDDe8bFNtuAO859VyjFD5tUfbxSG77MEWVltlyjX
 oU5mRZpmPDIFGr520dWgN3SCSwh30A0ZGT1hmOD/rUE5+gWGXxkXhMvO9HJSQaun7HFc
 2JAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768213836; x=1768818636;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7267+OhhCBR5I6AkRU6RfU6yngvUSAYC2qk6Sp2APtM=;
 b=j4I3a4JqPc8XhzsG4UdZD8N+p6HQpJH3g/0s8UPUbcyjDdL9ieG/QCcBLam73s05uC
 fjYfVb4RfJH22FYYMX/kVQG+b2KagZKOnECVyxp4VzYBq9YYflI2as3wQtNBp8Mlqd3J
 1wN8YWRaDi0sXBkY68GRQCYjZouiinLRhy69LxjzvXyNVFxcuv8cjMO1MSKaO7FvNxyX
 zEkunMnRp1wJTsIZGLSCUXwvwEzBSI0w3BfeNaA1kCAkd0Zz4ZcXPA/liupuid259lSq
 FtGbBLJwzKw82qB/cN9CusfI8pSrjNZJfdeFfBzE1m5BkrBMWarJ8Q+5Vdx3v0rP92hr
 dFWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDqVVpyQBqe8EFgUWh7X7D+VPeiPxHKrv/ARd9Pta/tNxc2uKNfoyHrbyGsssyVRrqrXPvpdlj+g==@nongnu.org
X-Gm-Message-State: AOJu0YwHLVx6+Ew0qexJzxU7k6i3WjCoK49q/LR1Q97Ty4KL4XFsItbB
 ghJaogws1K3EYWtRfaqrx3WTSZ1AJn4oSTlMDX8B5Dx4mo0bly3AqyCRwVftxSSOy2M=
X-Gm-Gg: AY/fxX60muLeHHMZP0TLLkjU6gRHkM7pCidx/ln3dMPfOnGlGme4LiDJrnLJJQM2ZQm
 ozHsheY0eLJO4n8PljZNbO9elx3abyC74NWDybWqJzLbmLC8OsquYZ+DriGMhUNa4R4Y7MaCOcj
 Oo45PQyzn7vbCLIE9UKEp+LdVEU3A8rNpJAvcx/0/DlqHRCIiSeRj067O0qr+MUledzXDj6gIIj
 DLpvqEKeeSHDJmyVKXNzqWYOo28W4wQDRrRgjp6HdUW58/MMZwyXx7NohA+ppra1p8Z/OVIbVH9
 H8cJdUY8BDE/qAKCot7kHuMS4B+XLHbnhibOSbep2nATRggDQ3gLa6GwzG2HR6xA81ubFEkvrwT
 wCQXFzx9nAsutKSXht0Wt3PARkJXtN2kTNzZin3nno8m9w+ecrrdkomxJCML8lvKL09ar3+8MGe
 +MWuc6XZTuz4USNnk9j57+iqAT+O6wYOZu5fOzUUneeYbEByEXOKZM1rrKQEG+
X-Google-Smtp-Source: AGHT+IEO88rv+iPQWE+EMhOoBXvbqlCroVCaTfDpn8JJM82nfaleCZ8gmQmLsgcz42i0B25qOsQDuA==
X-Received: by 2002:a05:600c:190e:b0:475:dd7f:f6cd with SMTP id
 5b1f17b1804b1-47d84b3f21fmr209681565e9.35.1768213836159; 
 Mon, 12 Jan 2026 02:30:36 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432dd78f5a8sm18004224f8f.27.2026.01.12.02.30.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 12 Jan 2026 02:30:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Joelle van Dyne <j@getutm.app>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Nguyen Dinh Phi <phind.uet@gmail.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Peter Collingbourne <pcc@google.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v6 00/19] target/arm/hvf: Consolidate
Date: Mon, 12 Jan 2026 11:30:14 +0100
Message-ID: <20260112103034.65310-1-philmd@linaro.org>
X-Mailer: git-send-email 2.52.0
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

Series fully reviewed.

- Patches 1-11 fix migration on HVF
- Patches 12-14 remove a signal race with WFI
- Patches 15-18 correct guest timer frequency

Since v5:
- Rebased on top of 3bee93b9abf ("Fix i386 HVF compilation failures")

Since v4:
- Rename gva -> gpa in hvf_set_phys_mem (Akihiko)
- Dropped missing VTimer synchronization patches for 10.2

Since v3:
- Call qemu_real_host_page_mask/size once (rth)

Since v2:
- Improve host page size/mask uses (rth)
- Remove cpu_test_interrupt in hvf_wfi (rth)

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

Philippe Mathieu-Daudé (10):
  target/i386/hvf: Use host page alignment in ept_emulation_fault()
  accel/hvf: Enforce host alignment in hv_vm_protect()
  accel/hvf: Skip WFI if CPU has work to do
  accel/hvf: Implement WFI without using pselect()
  accel/hvf: Have PSCI CPU_SUSPEND halt the vCPU
  accel: Introduce AccelOpsClass::cpu_target_realize() hook
  accel/hvf: Add hvf_arch_cpu_realize() stubs
  target/arm: Create GTimers *after* features finalized / accel realized
  target/arm/hvf: Really set Generic Timer counter frequency
  target/arm: Only allow disabling NEON when using TCG

Richard Henderson (9):
  accel/hvf: Create hvf_protect_clean_range, hvf_unprotect_dirty_range
  target/i386/hvf: Use hvf_unprotect_dirty_range
  target/i386/hvf: Use address_space_translate in ept_emulation_fault
  accel/hvf: Simplify hvf_log_*
  accel/hvf: Move hvf_log_sync to hvf_log_clear
  accel/hvf: Simplify hvf_set_phys_mem
  accel/hvf: Drop hvf_slot and hvf_find_overlap_slot
  accel/hvf: Remove mac_slots
  target/arm/hvf: Implement dirty page tracking

 include/accel/accel-cpu-ops.h |   1 +
 include/system/hvf_int.h      |  22 +---
 accel/accel-common.c          |   5 +
 accel/hvf/hvf-accel-ops.c     |  18 +---
 accel/hvf/hvf-all.c           | 186 ++++++++++------------------------
 target/arm/cpu.c              |  67 ++++++------
 target/arm/hvf/hvf.c          | 167 +++++++++++++++---------------
 target/i386/hvf/hvf.c         |  44 ++++----
 accel/hvf/trace-events        |   1 +
 9 files changed, 208 insertions(+), 303 deletions(-)

-- 
2.52.0


