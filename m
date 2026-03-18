Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B04C110706ED
	for <qemu-arm@archiver.kernel.org>; Wed, 18 Mar 2026 10:48:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w2oQk-0003ZW-LH; Wed, 18 Mar 2026 06:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w2oQZ-0003VP-1b
 for qemu-arm@nongnu.org; Wed, 18 Mar 2026 06:47:05 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ruslichenko.r@gmail.com>)
 id 1w2oQW-0003KB-J0
 for qemu-arm@nongnu.org; Wed, 18 Mar 2026 06:47:02 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-485410a0a8aso60551595e9.2
 for <qemu-arm@nongnu.org>; Wed, 18 Mar 2026 03:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773830818; x=1774435618; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DiDoTCkCQVwkJpi/q01bT4Bm5ASerWdl8Yyz8923uJY=;
 b=Jg2VU34+m1KsqH0HObKd02WYJGWaCd226pe2bT9yn6qbgoxKyHR24hI6D3+sxhdrUG
 7NTeei4x+/UNsSHO55YqCtQUZSjClplv2TPLaRy5Br5KZLEjb74FaYVnGJWZa1N7bEcr
 FNsnFIa20D4Fsc0L9H+z7AQRedgXSw/YCPIQxMlNklE7ulIeTrktwBolb766dQd0hLah
 nhG7J6rxB+NfONx7X/AurD6+Je/nd0gHcxYMh0rxISxLfvUST7iYmZVadH0GkuaBNj+j
 dalUCxtlzZZl1ccyAejxZn+EHj2E2OqyeuE+IakH1BSVolcDlifEeCAmPLwzImKpLTs4
 lqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773830818; x=1774435618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DiDoTCkCQVwkJpi/q01bT4Bm5ASerWdl8Yyz8923uJY=;
 b=dcQjqpXpJK2HMrZDB/yw+kENyZqhA8kAQO6TumBIyIg+1eJix4NJg5N9TCVl7xMVMy
 hoL9NoyVbF2rMfILy0Uwn+d0eIGoK85qCVDrcvWVqyVOI+2e+2Frs9c65P33W0XZKfXv
 lvdW6KYGclXDlOWveMPeK5bO0FgAW3whbQgcKCSHVDnMIxp4x5h7Kst/xE4lP6g7hTks
 SrFb/G049nCGLU9eQjkJA+IPqZ/pIf+v3bmKfxwqyezxc57ZGFsMyJGJASknY9zqHi4V
 qbxXZYDtMFqkN32sORthE3Mri9eaEVjPRoWGHVuGo0y2VgTtXZdT678ohO8xMiZ6MOH9
 VAzg==
X-Gm-Message-State: AOJu0Yx94z72y+tCk8Iro0HOCdreTdeicTfpSZ6L3oOasZV4rjGR+vzI
 2WS39it7vJlgY+HG8GkLulfUGav4tVOMADfRrFhhkgeQOBdKI4t4Y9nd
X-Gm-Gg: ATEYQzy8YkC2GlWNEaOxRltNzEnesF/T0FG0QWqgTv08l8FEWWqRCVsEcJXwPc1wZGU
 wOP467x/KGFbMA4JAkFFtyTYFQX7Hw5VWOqqnfaUJgII5DYS62RSHTIZsYusPfdtX6Eq05Neug0
 9zXgmRFOjCh12S+jOIskmVDG4y/+KflCFrdEqmkvGHBTzZ1AhwoF8E/KOtskUhfBbeoGbcmwdXj
 NV/hxWEuEaKnik/u4bKUd/724MIREqvjR9DcRQKzf36IfzWKBmmsecooLYiMVoKeYIpzUlqVBOl
 RcZUtvy2TAC8YB95HmfjVh2Cna7FezpwPlQuKdHwwynqbCX3fRIftFMhyxBB+rZs1cEl0lDURQf
 CR4JKDSj51pGyvrSM4pp1hV3ICEcbK0W0Mg1wKD/GupXfCOBazMxzp1+dQ7tby4BcWspOy9eAqz
 opl/QMWAmJmXTpLtuqpTjxEwMXzyXEc8DgACpEhE4ElIir0Valmz3BvaUfQKds895SnFAA2C3Uy
 oQp
X-Received: by 2002:a05:600c:1f10:b0:485:34b3:858a with SMTP id
 5b1f17b1804b1-486f4429d04mr42788795e9.11.1773830817871; 
 Wed, 18 Mar 2026 03:46:57 -0700 (PDT)
Received: from thinkpad-t470s.. (93-143-80-194.adsl.net.t-com.hr.
 [93.143.80.194]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-486f420de8asm56471095e9.3.2026.03.18.03.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 03:46:57 -0700 (PDT)
From: Ruslan Ruslichenko <ruslichenko.r@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, artem_mygaiev@epam.com, volodymyr_babchuk@epam.com,
 alex.bennee@linaro.org, peter.maydell@linaro.org,
 pierrick.bouvier@linaro.org, philmd@linaro.org, Ruslan_Ruslichenko@epam.com
Subject: [RFC PATCH 0/9] plugins: Introduce Fault Injection framework and API
 extensions
Date: Wed, 18 Mar 2026 11:46:31 +0100
Message-ID: <20260318104640.239752-1-ruslichenko.r@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=ruslichenko.r@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Ruslan Ruslichenko <Ruslan_Ruslichenko@epam.com>

This patch series is submitted as an RFC to gather early feedback on a Fault Injection (FI) framework built on top of the QEMU TCG plugin subsystem.

Motivation

Testing guest operating systems, hypervisors (like Xen), and low-level drivers against unexpected hardware failures can be difficult.
This series provides an interface to inject faults dynamically without altering QEMU's core emulation source code for every test case.

Architecture & Key Features

The series introduces the core API extensions and implements a fault injection plugin (contrib/plugins/fault_injection.c) targeting AArch64.
The plugin can be controlled statically via XML configurations on boot, or dynamically at runtime via a UNIX socket (enabling integration with automated testing frameworks via Python or GDB).

New Plugin API Capabilities:

MMIO Interception: Allows plugins to hook into memory_region_dispatch_read/write to modify hardware register reads or drop writes.
Asynchronous Timers: Exposes QEMU_CLOCK_VIRTUAL to plugins, allowing callbacks to be scheduled based on guest virtual time.
TB Cache Flushing: Exposes qemu_plugin_flush_tb_cache() so plugins can force re-translation when applying dynamic PC-based hooks.
Interrupt & Exception Injection: Exposes APIs to raise/pulse hardware IRQs on the primary INTC and inject CPU exceptions (e.g., SErrors).
Custom Device Faults: Introduces a registry where device models (e.g., SMMUv3) can expose specific fault handlers (like CMDQ errors) to be triggered externally by plugins.

Patch Summary
Patch 1 (target/arm): Adds support for asynchronous CPU exception injection.
Patch 2-3 (plugins/api): Exposes virtual clock timers and TB cache flushing to the public plugin API.
Patch 4 (plugins): Introduces the core fault injection subsystem, IRQ/Exception routing, and the Custom Fault registry.
Patch 5 (system/memory): Adds the MMIO override hooks into the memory dispatch path.
Patch 6 (hw/intc): Registers the ARM GIC (v2/v3) with the plugin subsystem to enable direct hardware IRQ injection.
Patch 7 (hw/arm): Registers the SMMUv3 with the custom fault registry to demonstrate how device models can expose specific errors (like CMDQ faults) to plugins.
Patch 8 (contrib/plugins): Implements the actual fault_injection plugin using the new APIs.
Patch 9 (docs): Adds documentation and usage examples for the plugin.

Request for Comments & Feedback

Any suggestions on improvements, potential edge cases, or issues with the current design are highly welcome.

Ruslan Ruslichenko (9):
  target/arm: Add API for dynamic exception injection
  plugins/api: Expose virtual clock timers to plugins
  plugins: Expose Transaction Block cache flush API to plugins
  plugins: Introduce fault injection API and core subsystem
  system/memory: Add plugin callbacks to intercept MMIO accesses
  hw/intc/arm_gic: Register primary GIC for plugin IRQ injection
  hw/arm/smmuv3: Add plugin fault handler for CMDQ errors
  contrib/plugins: Add fault injection plugin
  docs: Add description of fault-injection plugin and subsystem

 contrib/plugins/fault_injection.c | 772 ++++++++++++++++++++++++++++++
 contrib/plugins/meson.build       |   1 +
 docs/fault-injection.txt          | 111 +++++
 hw/arm/smmuv3.c                   |  54 +++
 hw/intc/arm_gic.c                 |  28 ++
 hw/intc/arm_gicv3.c               |  28 ++
 include/plugins/qemu-plugin.h     |  28 ++
 include/qemu/plugin.h             |  39 ++
 plugins/api.c                     |  62 +++
 plugins/core.c                    |  11 +
 plugins/fault.c                   | 116 +++++
 plugins/meson.build               |   1 +
 plugins/plugin.h                  |   2 +
 system/memory.c                   |   8 +
 target/arm/cpu.h                  |   4 +
 target/arm/helper.c               |  55 +++
 16 files changed, 1320 insertions(+)
 create mode 100644 contrib/plugins/fault_injection.c
 create mode 100644 docs/fault-injection.txt
 create mode 100644 plugins/fault.c

-- 
2.43.0


