Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2418CD74960
	for <qemu-arm@archiver.kernel.org>; Fri, 19 Dec 2025 07:04:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWUXd-0003p7-W5; Fri, 19 Dec 2025 02:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3BvlEaQYKCF0TP6DIUBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--yubinz.bounces.google.com>)
 id 1vWUXc-0003nC-EW
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 02:04:44 -0500
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3BvlEaQYKCF0TP6DIUBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--yubinz.bounces.google.com>)
 id 1vWUXZ-0001RZ-Q3
 for qemu-arm@nongnu.org; Fri, 19 Dec 2025 02:04:44 -0500
Received: by mail-pg1-x549.google.com with SMTP id
 41be03b00d2f7-b5edecdf94eso2551692a12.2
 for <qemu-arm@nongnu.org>; Thu, 18 Dec 2025 23:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766127878; x=1766732678; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=hV3jbe8mjBdMa5P+CZKc7SpagVzj6+YjdC3ehvY3rvY=;
 b=Mrm/lwJ3i4dY1qLJlrEnrx/YWqavvTkgKAk+TyeI893mQFVeVtMufW56SWh8gXlhUm
 fbOJIsGAVVaAcbsBW7LIilUpuDcNgYgtLbBXlNpTwn1JYZZqBnRYfJHlTjxiccBjiP4L
 G9sHwtRMNo9cgpx37StFuW+qnChZRd+QojYUjDvlGqASbB8973JMtZSGe1m+gVbgqHib
 oEb4To9sEcb3GOe3+/b5r+CzfYAjromLlXhQka1wk9YOg1rWSoG1KZWfQyIxkGr5QgXH
 BjzRMiOEm8esklJLRoI8nZRN9d5/es9lnGV/AEtoFdMptxU7GeaeoPAA9HdJRBLNnOD1
 3LEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766127878; x=1766732678;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hV3jbe8mjBdMa5P+CZKc7SpagVzj6+YjdC3ehvY3rvY=;
 b=wPJl+CAZ6ddKagL5A/+Bu2Q7NGSfYvqUMzh8bie2Y6kY8zV2xLUP/fsnMbbpJmOeIz
 LuGqQV4fHCIUqO9SUiI57ZICteRWzgnLjNYo0yypDbxljQNMAlk0e5NA2CIRhqc7r8pp
 5dmRALccCGJLX9QrRtRawEsLD7tgovE037l9cqggPwdZZ4ZYlWp5HBLdbsJaLp1JZif3
 6yTsE7VUZlFhx+/ElzBdu+a125eVz8VVpwrLwA4ie33xSl8SjX4nIsJjPy7ZDmiQ9oA/
 YN50k+oOo3OtRwpQrf5LEHXoB45zTGUHc/m8DmAlnwkq6AiA2BZBclKSia7kFXnHaGXC
 2/vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9vGUlWKRRGES1W5vqnsdmEC5ZG37Ws8VzmasSmLWf2HDCqxDsI3WL3I0LmCuOkyTAM9UmigZDUg==@nongnu.org
X-Gm-Message-State: AOJu0YzzANnSDS9JxqY6yt3IlwaFckVhOqxkO1CUGpCkuoCYVTTWoOLZ
 R+udcRsKMYJFPpOKePnXrDoXIqzKCfnRwz/pFduXwRGrQxDFIV+BV1URWn4kB0ZFPTp2V+O+elR
 ak7QNBg==
X-Google-Smtp-Source: AGHT+IF/+lztHfc+Q6qUY0F37omOsr3Wj3VDIbfYlHK1ZUd7unRNHNzQj48n38qJFDTVJzgJl8LH9LERhek=
X-Received: from dlbbt5.prod.google.com ([2002:a05:7022:985:b0:11b:d8a1:4048])
 (user=yubinz job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:985:b0:11b:a8e3:8468
 with SMTP id a92af1059eb24-121722fd206mr2276354c88.33.1766127878253; Thu, 18
 Dec 2025 23:04:38 -0800 (PST)
Date: Fri, 19 Dec 2025 07:04:13 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAO34RGkC/2XM3QqCMBjG8VuJHbd4t7npOuo+ooN9vNqgmriQQ
 rz3phCpHT4P/P4DSdgFTOS4G0iHfUghPvKQ+x1xV/NokAafN+HAJWMgqUktoqepaUOkzBfao3J
 olCKZtB3W4TXnzpe8ryE9Y/ee6z2b3m9IrUM9o0AtcAValEzV5tTE2Nzw4OKdTKWe/zQHvdE8a
 10qlLUsNTj+p8VCM9hokTXayoKrhfeS/eliqcuNLrLmlbW28s5YASs9juMH5J3HEWMBAAA=
X-Change-Id: 20251105-aspeed-sgpio-1d49de6cea66
X-Mailer: b4 0.14.2
Message-ID: <20251219-aspeed-sgpio-v5-0-fd5593178144@google.com>
Subject: [PATCH v5 0/6] hw/gpio/aspeed_sgpio: Add Aspeed Serial GPIO (SGPIO)
 controller model
From: Yubin Zou <yubinz@google.com>
To: qemu-devel@nongnu.org
Cc: "=?utf-8?q?C=C3=A9dric_Le_Goater?=" <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, Fabiano Rosas <farosas@suse.de>,
 Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Kane-Chen-AS <kane_chen@aspeedtech.com>, 
 Nabih Estefan <nabihestefan@google.com>, qemu-arm@nongnu.org, 
 Yubin Zou <yubinz@google.com>,
 "=?utf-8?q?C=C3=A9dric_Le_Goater?=" <clg@redhat.com>
Content-Type: text/plain; charset="utf-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::549;
 envelope-from=3BvlEaQYKCF0TP6DIUBJJBG9.7JHL9HP-5MHIJIBIP.JMB@flex--yubinz.bounces.google.com;
 helo=mail-pg1-x549.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=unavailable autolearn_force=no
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

This series introduces a model for the Aspeed Serial GPIO (SGPIO) controller,
commonly found on Aspeed SoCs such as the AST2700. The SGPIO peripheral
provides a large number of GPIO pins that can be controlled and monitored
serially.

Improvement to QEMU:
These patches enhance QEMU's hardware emulation capabilities for platforms
using Aspeed SoCs, particularly for BMC simulations. By modeling the SGPIO
controller, QEMU can more accurately represent the hardware, allowing for
better development and testing of firmware and software that relies on these
GPIOs for various functions like sensor monitoring, presence detect, and
system control signals.

Impact (Before/After):

Before:
QEMU lacked a model for the Aspeed SGPIO controller. Any guest software
attempting to interact with the SGPIO register space would find no device.
Firmware features depending on SGPIO pin states or interrupts could not be
tested in QEMU.

After:
QEMU emulates the Aspeed SGPIO controller on supported machines (e.g.,
ast2700-evb).
- Guest firmware can configure SGPIO pins, set output values, and read input
  values through the memory-mapped registers.
- External entities (like test scripts or other QEMU components) can interact
  with the pins via QOM properties (e.g., to simulate external signal changes).
  Path example: /machine/soc/sgpio[0]/sgpio0
- The model generates interrupts based on input pin transitions, according to
  the configured mode (level/edge), enabling testing of interrupt handlers.

Signed-off-by: Yubin Zou <yubinz@google.com>
---
Changes in v5:
- Fix logging, typo and indentation in 1/6.
- Fix typo and empty line in 3/6.
- Fix duplicate definition in 6/6.
- Link to v4: https://lore.kernel.org/qemu-devel/20251217-aspeed-sgpio-v4-0-28bbb8dcab30@google.com

Changes in v4:
- Fix indentation issue, replace SysBusDevice by SysBusDeviceClass,
  remove unused function in 1/6.
- Fix g_autofree usage in 2/6.
- Switch to use  %03d in unit test, remove unused headers in 6/6. 
- Link to v3: https://lore.kernel.org/qemu-devel/20251210-aspeed-sgpio-v3-0-eb8b0cf3dd51@google.com

Changes in v3:
- Fix commit message typo and address several review feedback in
  commit 2/6.
- Switch to use g_autofree and drop g_free.
- Use "%03d" instead of "%d".
- Link to v2: https://lore.kernel.org/qemu-devel/20251209-aspeed-sgpio-v2-0-976e5f5790c2@google.com

Changes in v2:
Split the v1 into smaller commits and reorder it for better review:
- Link to v1: https://lore.kernel.org/qemu-devel/20251106-aspeed-sgpio-v1-0-b026093716fa@google.com

---
Yubin Zou (6):
      hw/gpio/aspeed_sgpio: Add basic device model for Aspeed SGPIO
      hw/gpio/aspeed_sgpio: Add QOM property accessors for SGPIO pins
      hw/gpio/aspeed_sgpio: Implement SGPIO interrupt handling
      hw/arm/aspeed_soc: Update Aspeed SoC to support two SGPIO controllers
      hw/arm/aspeed_ast27x0: Wire SGPIO controller to AST2700 SoC
      test/qtest: Add Unit test for Aspeed SGPIO

 include/hw/arm/aspeed_soc.h      |   8 +-
 include/hw/gpio/aspeed_sgpio.h   |  68 ++++++++
 hw/arm/aspeed_ast10x0.c          |   6 +-
 hw/arm/aspeed_ast27x0.c          |  26 +++
 hw/gpio/aspeed_sgpio.c           | 346 +++++++++++++++++++++++++++++++++++++++
 tests/qtest/ast2700-sgpio-test.c | 165 +++++++++++++++++++
 hw/gpio/meson.build              |   1 +
 tests/qtest/meson.build          |   1 +
 8 files changed, 616 insertions(+), 5 deletions(-)
---
base-commit: 917ac07f9aef579b9538a81d45f45850aba42906
change-id: 20251105-aspeed-sgpio-1d49de6cea66

Best regards,
-- 
Yubin Zou <yubinz@google.com>


