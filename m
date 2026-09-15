Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DEA8C88E77
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 20:27:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6ZkN-0006gI-DN; Tue, 15 Sep 2026 16:27:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinja.p.jankovic@gmail.com>)
 id 1x6ZkL-0006g3-D5
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:27:17 -0400
Received: from mail-lf2-x10.google.com ([2a00:1450:4864:36::10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinja.p.jankovic@gmail.com>)
 id 1x6ZkJ-0004nf-Ia
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 16:27:17 -0400
Received: by mail-lf2-x10.google.com with SMTP id
 2adb3069b0e04-5b5e4f1651cso186191e87.0
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 13:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789504033; x=1790108833; darn=nongnu.org;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:sender:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fN3b5mCauh5j+9fpd8Ls87fXynxsmo08ZM13MUelkI0=;
 b=hsAMgtgzC6gRvwg2UMLm+gA8KYhNIVrqrjmFRYaBaXPsK2bF8MRMjiPacOoXI7hfVS
 a2IpRz7UtkPFlb/oOjR/PTEZ4in2Y9joPxQl81Nc8ej1DAKwT37d/OZlxG5v5pJu5d+2
 +p1JJ6/Lbuu+zx4yW7sDaXQ3GNpD7b6auUpjoNP8Q7CMY3Vx4HBqoMankOtylEQraSrH
 Lina5e7EbNumvtdKJdQrKMmFhEgyl90RClpFoeRQuDsSAcn56O+R7G8cWL1bfbJwLwpe
 NuuaOyoXGLNFb2dhjqiKMw4yqv8jVjMJeT02N1c3RRxwCbvBAUoeZUoVz6pb9M/vBQtE
 fySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789504033; x=1790108833;
 h=cc:to:content-transfer-encoding:content-type:mime-version
 :message-id:date:subject:from:sender:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=fN3b5mCauh5j+9fpd8Ls87fXynxsmo08ZM13MUelkI0=;
 b=uzDt4SpJ2tbgy6aYXAi55k2lW2DxBYZ7MUDXmTZ8ejCsnn8Y2wLZxqPTW07ZL/Andw
 7REcvSK+0PdrTvNfrGNiVegsOHxRCBfTUvmZvH+oSm4m7WUl9LKWXF9XuA0e2xxDaAOY
 FjnqiJaJ9isYJfXGAL4qu36WhAHk+XO2aBhmOp41exe/L0gR0KTlvw1BNfZ6HagpP4I+
 DY+JU3Gr8R76756yrhG113aLzijmUQCOb35ftE8PPULPVt2tVvEMVXMmqwzlcrrdpUsB
 Bjj/Q/6DqrdW8IGYtiY2u2tRKykCBpUZpWTVjOSVdDu4V1PwE9j1GOpGwrYuYKPwvzXq
 0rVw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwWy5GgBmWXhKg3Pb7OQ4nypwMgv44ZLoixyvbJkYGAH9aMjxqxHTf1u+pPsKSmKzn7ZvFf5q+VBA==@nongnu.org
X-Gm-Message-State: AFuF++kQNKq6eqHeq7RJ3eci7/IT7fNEmwJGk6L6xghSUwdMrwFGryI5
 PDrA59o+SxIqgSNQT9W5zsIlwWDypJ2TqJOLS9EoXNnau/muEj88bU+1
X-Gm-Gg: AYBFou1/zdPP/Jiqo77N4Xlnjr4RNkANPsP22g4pc21POEshYqrGFmgDsOAousgPXGc
 1QiBXqviNCe43gDGsow0J63NXvItuYUm++1JcDjjiLQOE86JDvhhWPt7NJBP1Llsvl4XYqbyCeq
 imxtcX7GgkQAXWmkMg0iBn5m1TKjhM68T8Syy8CDJDd33P4cVzCtAnf89Vd/MMhLIs5omCrF298
 6j7uJ26JmgFiNdt37opXTPn/uJwwk2ax+f1548r1e7TW0ul9sDIY2NqdUTjfrbTa8vQ02PFzoog
 E+EK926q38ssXO/jepOcyjd7nIKhBjvaCk5brPLoBOjgDZ9HtwFUbgvhjkkQ834AfTEAK9qoaF7
 Q+OCr0DE1e1EGfMzeFkhC6xnTkfquS3UpFWmiWTkuPoXfLOp9G+R68Yb7o1NpJXXMcW5pgmol7F
 1yPjX50hZN3AXVgP/bluJM8fkIkK3C3pGeTDBFj1P6eaxEkvEIm/dKwb6zW/mPIrDDtHMvdQ90G
 y89WvHYWfhWM8Xfsh6h7K8beav3isMehBrhvabqNJjggo1JRgyHA18of+0=
X-Received: by 2002:a05:6512:6c2:b0:5b7:a987:d03d with SMTP id
 2adb3069b0e04-5b8ae68dd4emr2153002e87.21.1789504032695; 
 Tue, 15 Sep 2026 13:27:12 -0700 (PDT)
Received: from [192.168.31.141] (213-65-111-204-no600.tbcn.telia.com.
 [213.65.111.204]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3a5daf0dbacsm1621391fa.4.2026.09.15.13.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2026 13:27:11 -0700 (PDT)
From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v4 0/3] Allwinner A10 GPIO support
Date: Tue, 15 Sep 2026 22:27:03 +0200
Message-Id: <20260915-allwinner-gpio-v4-0-b1ee1d09c9fd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XMSwqDMBSF4a2UjJuSFzHpqPsoHUS90Qu+SIptE
 ffeKJSKDs+B759IhIAQyfU0kQAjRuy7NNT5RIradRVQLNMmggnNDDfUNc0Luw4CrQbsqQZnFOd
 Z6a0iCQ0BPL7X4P2Rdo3x2YfP2h/58v5Sdp8aOWVUOK2M1qX3nN+q1mFzKfqWLKlRbLg4cpG4Z
 5AXOcskE7Dn8s8tlwcuE3fWee9UpnKZb/k8z1+cu5kLKgEAAA==
X-Change-ID: 20260818-allwinner-gpio-6ea84117df94
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>, 
 Jack wang <163wangjack@gmail.com>, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
X-Mailer: b4 0.14.3
Received-SPF: pass client-ip=2a00:1450:4864:36::10;
 envelope-from=strahinja.p.jankovic@gmail.com; helo=mail-lf2-x10.google.com
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

This patch series introduces GPIO support for Allwinner A10 and
Cubieboard.

The support is focused on input/output and interrupt functionality.
The qtest suite is also updated with tests for implemented
functionality.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
---
Changes in v4:
- removed unused allwinner_gpio_update_all_output_lines function that
  was flagged by clang
- Link to v3: https://lore.kernel.org/qemu-devel/20260913-allwinner-gpio-v3-0-a9affa474b3b@gmail.com

Changes in v3:
- replaced forward declarations of gpio_is_input and int_ctl_cfg with
  definitions
- updated use of extract32 for int_cfg_n to use full stride INT_CFG_IRQ_STRIDE
- replaced custom bit manipulation with deposit32
- updated output GPIO line handling to have same behavior when lines are
  configured as input as when they are assigned to special function
- removed update of outbound gpio lines in the reset function
- improved test organization with common add_test function, as suggested
- removed leftover comments
- minor style fixes
- Link to v2: https://lore.kernel.org/qemu-devel/20260829-allwinner-gpio-v2-0-f0ebcb07302e@gmail.com

Changes in v2:
- allwinner-gpio-test: Added test for interrupt triggered on both rising
  and falling edge
- Link to v1: https://lore.kernel.org/qemu-devel/20260819-allwinner-gpio-v1-0-2a64866dff11@gmail.com

---
Strahinja Jankovic (3):
      hw/gpio: Allwinner A10 GPIO emulation
      hw/arm: Add GPIO to Allwinner A10 model
      tests/qtest: Allwinner GPIO tests

 MAINTAINERS                           |   3 +
 docs/system/arm/cubieboard.rst        |   1 +
 hw/arm/Kconfig                        |   1 +
 hw/arm/allwinner-a10.c                |   8 +
 hw/gpio/Kconfig                       |   3 +
 hw/gpio/allwinner-gpio.c              | 441 ++++++++++++++++++++++++++++
 hw/gpio/meson.build                   |   1 +
 hw/gpio/trace-events                  |   6 +
 include/hw/arm/allwinner-a10.h        |   2 +
 include/hw/gpio/allwinner-gpio-regs.h | 227 +++++++++++++++
 include/hw/gpio/allwinner-gpio.h      |  41 +++
 tests/qtest/allwinner-gpio-test.c     | 535 ++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build               |   3 +-
 13 files changed, 1271 insertions(+), 1 deletion(-)
---
base-commit: 302c2f2df4d8b2eec81c38ee5d5b04e8e6e40d31
change-id: 20260818-allwinner-gpio-6ea84117df94

Best regards,
-- 
Strahinja Jankovic <strahinja.p.jankovic@gmail.com>


