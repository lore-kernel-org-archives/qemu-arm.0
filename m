Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1789854ejb;
        Tue, 6 Feb 2024 05:29:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFgjtA4PUeni0m/PHi6o9DGuYjS8OF/mFv+k2wAeNiwdTjNY6VEB/3woQ4NJo0mVqDOsOLF
X-Received: by 2002:a05:6214:260a:b0:68c:a83c:ca22 with SMTP id gu10-20020a056214260a00b0068ca83cca22mr2996656qvb.50.1707226194534;
        Tue, 06 Feb 2024 05:29:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707226194; cv=none;
        d=google.com; s=arc-20160816;
        b=bu8QCTUQC9bie20aISoMZgYh6wiG1pdqFls90RfwyWxET/Hd+IrTJsUh5Y8WEd+BXJ
         SSTQhMFmQNur1rkTreOTK5CphtT67b8DuxjMJ6VWp7QHpK10p2ZYDZEnjnaF5fgSGs4c
         C766Vscf5NvtF3TbTqOvR2TXajeJUtdJK8SNT3t+gMbmQ38bJ3sRQOZJcBPlvhlkhCfr
         gVATiQlf36xIaxts9Rx1XbZTqHLacGlVXqgRCA/Pe8cCGo5ybAuoCbDKpf2ZFb/vuse0
         4IyKkcYM+Y/QX1KBToKKt0+Vw75eT62+rSv642i/fZemMer830DJSlbrwmTqNsYCP5Mo
         g3Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=fNE7QdrRujfmA6rkr1e587aBe1A8RQAGklHXsRx7cDA=;
        fh=t5u4Fj4OhtgbdL8OdzPnMrUVXoaK9zsip8Yhw8KtyvM=;
        b=0HIrlhSGo9JhMnzry7NJwuaS/8EtrLpNjje0Dzul2Xlm8z7H+HLKFsbJYVpkj43FAg
         F97qxn6GNL0rnmfr6joTbKH0wV+aJOanlR4kKKqFIg5K97/ODEhWy7O8FHPhCCLS/oBw
         tLzGSMU+qDIsrO4P0IZczwD+I0HVgSBogDvmWWyZh7RoYlWG+3y0HE/EgGI6lD7PjTHl
         SGGDTcgSBktjbDvqxJHfgDT429VTquJTwIfnZ4uwievYFlws5Mu2hNbAvm6pMFKbaXYM
         lrV1fePvxg5wmodTZZBY+7MMB3+mqH9ZN7WJOdyqvnGDAOc+PKpX1WuXLVktVWQJfQHr
         YGIw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YBhmf+9r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCUZBgBvLEYYEhBNADEHCurGIp/8LX1kUBroSbbg6KpzN6mvfKYbOLHcPxOV9ufMOjynm0btXwc1PcUjYDoMEHr+DKUNQgeT
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ct17-20020a056214179100b0068c5de04debsi2354719qvb.458.2024.02.06.05.29.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 05:29:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YBhmf+9r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXLWA-0000Ws-U0; Tue, 06 Feb 2024 08:29:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXLW6-0000O8-3Y
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 08:29:38 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXLW3-0008Cl-5R
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 08:29:37 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40ff0bb8052so2071575e9.0
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 05:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707226172; x=1707830972; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=fNE7QdrRujfmA6rkr1e587aBe1A8RQAGklHXsRx7cDA=;
 b=YBhmf+9ri3IwtOIFNqY6s6IQYth1pOSdu9Z30PjvQaI42ZQmSnfd5oDdzhD/RmKfty
 rCZwYcsLdSY57j0bTqMewXuXqc+iBi44UScZPjpg1UKUvZai6wLd18HA+oVek2yThQXY
 BDhu9x1/QZ0w4XoG/1W7OpdSxjvDU/D5A11l5vVV2f/4C8yZb367FMgQuC5IiifCgGMd
 KeL+R8VjSKHrYMl5udVhZRxsggIg3n4EDKndl2ANLCYQUQ8c7/Hq4wgMCRaYNHoEtqSS
 wMa2DG3k4LIkJB+72+xi0rcYfItbVnZ5TnmzzdQSXxVzAJk+uGlhJQnw06hcw1kOPh5D
 JjTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707226172; x=1707830972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fNE7QdrRujfmA6rkr1e587aBe1A8RQAGklHXsRx7cDA=;
 b=vo/m8/U+A61fEU/QnKzNXuLT1AWe4F9MchHS8FQYBtBLiH+Sg2bg1eLbooRCia04j4
 xYW7Q1hPzCg+jNuJ0JvPjqJbF9Auq27/n5BX2KLPFLuE6t7fkzXC+6g1RMVxRkXB4MkC
 MIELy+4iCKqmQona0SuAOYt3+sj1IGJ4/UUvW7LahNxSOAY0ywgBfErRrl2IhEQ1C4Nz
 AuL7tlRUl7WmS4riKd+eLrm7Yzy1IdUCfcsbSxY5N8GmiEiUOATxrRLX0MrdmguYqbPI
 XeQaCi9YXdo9YgewohirnKjr+GhsajJf9xuA9MUP1pK34erstIhXjOggKGpKKJ8jBrMZ
 oTLQ==
X-Gm-Message-State: AOJu0YxHxBtjbqhhoAVg40rtVEFKesI49khOr2dLqtvz7CikVco1WRib
 fw+XRolA5sFGred88IC6vlww9Fax/mCeTKG31Mv722u7QuAWqNNqjCyZRXjnf+tdyLkZTlnp7O1
 d
X-Received: by 2002:adf:f182:0:b0:33b:247c:d61a with SMTP id
 h2-20020adff182000000b0033b247cd61amr1469999wro.31.1707226172631; 
 Tue, 06 Feb 2024 05:29:32 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXkSzNCI/rGQCxZV82kKiAKiun6DbeFLEygQHxJDnbVDkkSzkBzuJvH+BT/AGKClLHxqR9udBSYcJIOvC+R2hC0amBBpUI=
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y7-20020a056000108700b0033b470a137esm1492932wrw.79.2024.02.06.05.29.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 05:29:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 00/13] hw/arm: Implement new machine mps3-an536 (Cortex-R52
 MPS3 AN536 FPGA image)
Date: Tue,  6 Feb 2024 13:29:18 +0000
Message-Id: <20240206132931.38376-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: spjj78R+gnq0

This patchset implements a new machine type, mps3-an536.  This is
similar to our existing mps2-* and mps3-* machine types in that it is
a model of an FPGA image for the Arm MPS3 development board.  It
differs from our current machine types in being based around an
R-profile CPU, the Cortex-R52, rather than an M-profile CPU.

This patchset implements the board support to a similar level as that
of our M-profile MPS machine types: most but not all devices are
supported.  Some minor missing features are documented in the docs
patch (and already in mps2.rst where they apply to all boards in this
family).  If there's demand (specifically from the Xen development
use case which is motivating this board model) we can look at adding
them.

I have tested with the "selftest" binary supplied with the FPGA
image, and also with a Linux kernel. (The kernel support for this
board is not upstream, but the patches can be found in this lakml thread
https://lore.kernel.org/all/20220630083641.21835-1-vladimir.murzin@arm.com/
or at the git branch
https://gitlab.arm.com/linux-arm/linux-vm/-/tree/staging/rclass-5.19 )
To get some of this guest code to boot I had to make some improvements
to our Cortex-R52 emulation; these are in the first four patches.

thanks
-- PMM

Peter Maydell (13):
  target/arm: Use new CBAR encoding for all v8 CPUs, not all aarch64
    CPUs
  target/arm: The Cortex-R52 has a read-only CBAR
  target/arm: Add Cortex-R52 IMPDEF sysregs
  target/arm: Allow access to SPSR_hyp from hyp mode
  hw/misc/mps2-scc: Fix condition for CFG3 register
  hw/misc/mps2-scc: Factor out which-board conditionals
  hw/misc/mps2-scc: Make changes needed for AN536 FPGA image
  hw/arm/mps3r: Initial skeleton for mps3-an536 board
  hw/arm/mps3r: Add CPUs, GIC, and per-CPU RAM
  hw/arm/mps3r: Add UARTs
  hw/arm/mps3r: Add GPIO, watchdog, dual-timer, I2C devices
  hw/arm/mps3r: Add remaining devices
  docs: Add documentation for the mps3-an536 board

 MAINTAINERS                             |   3 +-
 docs/system/arm/mps2.rst                |  37 +-
 configs/devices/arm-softmmu/default.mak |   1 +
 include/hw/misc/mps2-scc.h              |   1 +
 hw/arm/mps3r.c                          | 640 ++++++++++++++++++++++++
 hw/misc/mps2-scc.c                      | 138 ++++-
 target/arm/helper.c                     |   2 +-
 target/arm/tcg/cpu32.c                  | 109 ++++
 target/arm/tcg/op_helper.c              |  43 +-
 target/arm/tcg/translate.c              |  19 +-
 hw/arm/Kconfig                          |   5 +
 hw/arm/meson.build                      |   1 +
 12 files changed, 955 insertions(+), 44 deletions(-)
 create mode 100644 hw/arm/mps3r.c

-- 
2.34.1

