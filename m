Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E44CEACC9
	for <qemu-arm@archiver.kernel.org>; Fri, 14 Nov 2025 20:09:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vK05D-00016q-5K; Fri, 14 Nov 2025 15:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK021-0006YT-OF
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:04:32 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vK01z-0004ht-KV
 for qemu-arm@nongnu.org; Fri, 14 Nov 2025 15:04:29 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47790b080e4so5008025e9.3
 for <qemu-arm@nongnu.org>; Fri, 14 Nov 2025 12:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763150665; x=1763755465; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pXiZ10OJodTsvzbmca5AhlTxbQq2G43OiTHEwt1NF6s=;
 b=zeiKb0V7fAoWhw+eOhOVbt70wgu/s6YbzORN6Nfn7muO6O+Vwbhm3K0tWayxVTa0zE
 AMa/xajm9wr+T1OUys6HL/ynGZjl2RO04dn3OAYYYRGjJhlZToFLSNrvzhUFt+SX0TE2
 e5BOZcgSk5m02sS9wpk7cvdgKzvcYdRYrRkWnyPVEXZ/rQK3AMB4MOj/ytLlkr/6PQBd
 NdWOqi2aJNf3sTKWV4cOu2L03HcBjOogQ3dot2P1E4vdslQXnIsn5pX1enKzpdecidZY
 wj/QMr3aOKCLOJHmyFShK/eCRTPN+Wl2awCMesY993gzpLunqXd8tUUrGS8qwGdko7JF
 SRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763150665; x=1763755465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pXiZ10OJodTsvzbmca5AhlTxbQq2G43OiTHEwt1NF6s=;
 b=PJtTLBwfxADw4/CwzOmFUBwJ0/c0mddzE5X78h/YJexYoje9h816Puo3epExUO82CH
 WfFQbdXkazjuXGS69oEsS4OiY0aUA1cEmz8ZtraqRnfYGEMtPZvPQkNWEBAPE4Lpf9j/
 Wh2vq03YEj6ij1QeaGOHkGPWaNQ1MLusLEhLk/SJaqk4/zyx1iVtENFtRsbaoDmhuXMW
 qV+reZvSCri9JZ8HEJ5SkcU2T1fZmxtOFxicWqTQVNakgy8IKYDEdyPyV3KXK6iBv/Wn
 9mPzRnXnkIf5+GMuqczUBGmsewRiM5qLZkmirasFgC/7lVGAdwBkYhfYNwKtZhtgdNE4
 asYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZE3VUtfqY6vdTP+qVczHd8Rv+X9J5nxn/nHp841uJ39e7Fp5m3Fp9XYUjiuhRNf44MDhmBLCyYQ==@nongnu.org
X-Gm-Message-State: AOJu0Ywu464fGBbWmv/HEWeoEWW6PuZHvPbkgXxNZ0uzPaGnHGcsbhWj
 EMLsXvROWmcJtPsM/TJTKT4Ox5LRhNzmE9h4gSZVrEHxxU2Tbf3vaLoSRgaqtUjgJPk=
X-Gm-Gg: ASbGncuVASU7l3KqBV8ycWuBndMSAGTOq8NEJTeDybm8DVePviIF2SfSTboYNhkjjH/
 1IiZ7KLN5/GsbycbHS8KvArlnYTaDUNQNsy9emSu5gS8xWglMvSlL5gwv+Hro4hj6MD39vfIgHq
 r74w/LpukVjvnZBu2mYi+45cBapYmdRJ+x+Q6WyRFuVzCQ6Ppr1oTRKXlAfx0MRNTIUYOJr8TT3
 7J5atoaWzDegCsb2c6MCPpv7Ao82KOoV0hUptChv3hZ3TGwOzVIQWxeTG+yTeLWRC7eeBLRF/75
 nz4iVjiGcFxnH/BurcRi8uCAW+20X+urgT5RDfHgnlXwvsDc72i4yLKXTf9kj6/Fm+tTAXiBp26
 XY64CAmn6Sib5YGYCtJr0BtqW7PSQPYCJdq4byGNv1h2A3gWD6JZgm6VgcGpJVzMNCQJiWD65A2
 wFojF7opsxOP4mkAx4tAjCbFrEbcAzYQVU8clj8fCTWDyd/CRU0g==
X-Google-Smtp-Source: AGHT+IGUBIHzsq1P8/uWuOSpYFIyXySXSD46MQNmE8TE0vBNydQbGCrTh8qC68xDOh+23jpV0ghqPg==
X-Received: by 2002:a05:600c:4685:b0:45d:d353:a491 with SMTP id
 5b1f17b1804b1-4778fe59fe7mr44230515e9.1.1763150664924; 
 Fri, 14 Nov 2025 12:04:24 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477983657cdsm711425e9.5.2025.11.14.12.04.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 14 Nov 2025 12:04:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Collingbourne <pcc@google.com>, Cameron Esfahani <dirty@apple.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>
Subject: [PATCH v5 00/19] target/arm/hvf: Consolidate
Date: Fri, 14 Nov 2025 21:04:02 +0100
Message-ID: <20251114200422.4280-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

Missing review: #8

- Patches 1-11 fix migration on HVF
- Patches 12-14 remove a signal race with WFI
- Patches 15-18 correct guest timer frequency

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

Based-on: <20250829152909.1589668-14-pbonzini@redhat.com>

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
 accel/hvf/hvf-accel-ops.c     |  19 +---
 accel/hvf/hvf-all.c           | 186 ++++++++++------------------------
 target/arm/cpu.c              |  67 ++++++------
 target/arm/hvf/hvf.c          | 167 +++++++++++++++---------------
 target/i386/hvf/hvf.c         |  44 ++++----
 accel/hvf/trace-events        |   1 +
 9 files changed, 208 insertions(+), 304 deletions(-)

-- 
2.51.0


