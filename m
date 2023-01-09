Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2107676ejc;
        Mon, 9 Jan 2023 01:18:35 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtR56WyA7G10v9yx2d148TBOIi33QoRmEFsPTXHXe1AefhmS/NDWpfGZE+vuplnqSnG2Dbl
X-Received: by 2002:a0c:9124:0:b0:531:b490:d387 with SMTP id q33-20020a0c9124000000b00531b490d387mr44049340qvq.48.1673255915536;
        Mon, 09 Jan 2023 01:18:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673255915; cv=none;
        d=google.com; s=arc-20160816;
        b=wBX1wKJHr6p9PDQ3mtlpvwh9ta91DrgiQ8VkMsLG9l+AuJGTgyMzDn4KedIjU7XXkP
         5JsvPLKv37yy4D6p655uueakQj1pjfOTC0S/hRgxDZDEKSjKcnXIGaXBkYInUBZZl5Fl
         4Ik56BSa82vW6vOeI3W1ZJu7d9dnVr8w+AQLT3qySeUOfCFkP+SFgkxMdzpmjsydGSiY
         hP81jbumKPjEQfaust/fYrDYd4HiZS4RWcM8n+1Dvi9fnZtvuEa7nAIkDfSihjPKA+YX
         99ObZzj6SeyYoPyP6abg8dk8lEDJzIXXGI7cti0nw/BX4SLmXJouem1UZ/+cssHsb+vj
         OGzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=2QbiPkSepNTipu9Sy6f9nk00cA9LLT9J23YFFYJq0ZY=;
        b=xKQCW9GRdKkGpRcbCD5XjYzTMCy/h0cvXDHhiViBPHUOl0aLDR2zfb+nEjBAILlj9y
         4XHgftmdhWlm6KIDSq0EP3ONSq5B/heo7qxJaX3n2/1CiFHgz6iEE1e4JHTrj7Sd+E4a
         c/I2jA0sFjvBm5d33tX7/8j2/d/X8iVzdQehbb1pjVZktQnPTQA2NlilNKOzuZbh+fEj
         0ej8qpFfNgZNXI4qgRyqLJfMheEvEePoGSlpXwfjFyi8z3Np2H9c+gUGuC3Csh5kP62J
         wd0dFpIXaeHzaIpTaae2zgI68UIVyUPjXW1lqHmsQRs+9XA6ykGeq1PPIoUrMH/FTeJc
         yJSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X4TIAu7P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi36-20020a05620a31a400b006fcb936f878si4323769qkb.109.2023.01.09.01.18.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 01:18:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X4TIAu7P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEoI5-0000rb-CJ; Mon, 09 Jan 2023 04:18:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoI3-0000qh-CY
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 04:17:59 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoI1-0002Z9-NS
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 04:17:59 -0500
Received: by mail-wm1-x32d.google.com with SMTP id o15so5756215wmr.4
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 01:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2QbiPkSepNTipu9Sy6f9nk00cA9LLT9J23YFFYJq0ZY=;
 b=X4TIAu7PuTihi+UQYeyf91GRDtqtPHUGxdgLU6l88g43G+1G5Ct1lBgz/eylVHUspM
 cSZmO2WDb7/sAeCe8yccpKAQjZnLI+aKYKUnti6GpjTTTBQw8TzBMe4cQVObuqenWSYh
 d2RMy52h3RXDKe2STO+GauatZCp7r4wenELUUZRJdlSWQKv0peXXZVKZfzA+0CVAs9e0
 1f0G8zMK4DrFdCJUFrJNShSrXgfmjUDD7lV6JBsNp44EfIuZkw3IVwMrHb3PmuInaEs7
 P35Xf3MfQiP6UdkPuJyTLZaCDxntDSsivtCpE6gcjNrt5h7w4imDlX6s0Wflx/T3wb/d
 Qurw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2QbiPkSepNTipu9Sy6f9nk00cA9LLT9J23YFFYJq0ZY=;
 b=PEKTX0MF5XmOzYA6x4D+k0ga0p1xP/lpiq/PYNpdvwqwzhVLX2RXjjoErZsOKYouQs
 CdBws1xegv+MnMzAj2O0uIPAUocMy0dW/o9hD7I7hbdWGLBFh8Ylmu8Fe/ScaI45JStf
 dTwG6WbyKsX4hNmIiN2cCmM3Oa5/4UvlrurubegHTb4g2qhiHF+d/2FZfKVhr/cqkoGl
 jf047ch03IYcAlJ2HUPXyys5WV9usAw2GZrTo9AlDxTiLprz8vBe4SJfm3l/OJPjTquh
 I8L0yZE97WJBiXARv46jOzjddJtydlCeowJ+UYrcJZ+SzzFrxoDW5IE+FcPKPUEr9H1H
 kAWA==
X-Gm-Message-State: AFqh2krpYvaZt8i7+f7gd3CJar5OFpT4cu2e2GBt1FRN+tZaDEfgKwpu
 yopwp8DL5Fmh7+bsvyvcH2xZ6w==
X-Received: by 2002:a05:600c:3506:b0:3cf:803b:d7cc with SMTP id
 h6-20020a05600c350600b003cf803bd7ccmr48772705wmq.33.1673255876012; 
 Mon, 09 Jan 2023 01:17:56 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n7-20020a05600c4f8700b003c6bd12ac27sm12072388wmq.37.2023.01.09.01.17.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:17:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/5] hw/i2c: Rename TYPE_VERSATILE_I2C -> TYPE_ARM_SBCON_I2C
Date: Mon,  9 Jan 2023 10:17:49 +0100
Message-Id: <20230109091754.79499-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FoVK5jqwlfOC

Lot of churn for what started as a QOM cleanup. We have:

  typedef ArmSbconI2CState VersatileI2CState; // [*]
  DECLARE_INSTANCE_CHECKER(VersatileI2CState, VERSATILE_I2C,
                           TYPE_VERSATILE_I2C)

  typedef struct ArmSbconI2CState ArmSbconI2CState;
  DECLARE_INSTANCE_CHECKER(ArmSbconI2CState, ARM_SBCON_I2C,
                           TYPE_ARM_SBCON_I2C)

In a later QOM rework series, [*] produces definitions clash.
The simplest fix is to avoid having different types defining
the same QOM model.

This model started named TYPE_VERSATILE_I2C then we figured
the official ARM name (did it came later?), and renamed as
TYPE_ARM_SBCON_I2C. Finish the conversion, remove VERSATILE_I2C
name and only refer to this model as ARM_SBCON_I2C.

Philippe Mathieu-Daudé (5):
  hw/i2c/versatile_i2c: Drop useless casts from void * to pointer
  hw/i2c/versatile_i2c: Replace VersatileI2CState -> ArmSbconI2CState
  hw/i2c/versatile_i2c: Replace TYPE_VERSATILE_I2C -> TYPE_ARM_SBCON_I2C
  hw/i2c/versatile_i2c: Use ARM_SBCON_I2C() macro
  hw/i2c/versatile_i2c: Rename versatile_i2c -> arm_sbcon_i2c

 hw/arm/Kconfig                              |  4 +--
 hw/arm/realview.c                           |  2 +-
 hw/arm/versatilepb.c                        |  2 +-
 hw/arm/vexpress.c                           |  2 +-
 hw/i2c/Kconfig                              |  2 +-
 hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} | 39 +++++++++------------
 hw/i2c/meson.build                          |  2 +-
 include/hw/i2c/arm_sbcon_i2c.h              |  6 ++--
 8 files changed, 26 insertions(+), 33 deletions(-)
 rename hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} (70%)

-- 
2.38.1

