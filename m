Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp3879943ejc;
        Tue, 17 Oct 2023 05:24:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHNn5NnSaluVjMN8TnbmHHVxUM/kcnBxgxf4E616KfGhoX7jMlP+6/DuEjet7bnnVsFx9fx
X-Received: by 2002:a67:ab43:0:b0:44d:5e09:e387 with SMTP id k3-20020a67ab43000000b0044d5e09e387mr2088637vsh.20.1697545489842;
        Tue, 17 Oct 2023 05:24:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697545489; cv=none;
        d=google.com; s=arc-20160816;
        b=mU5c2C98wltZoKplovJ4/kwdQ1IX6Us/XCPk/rcHAPCwg7iVoVKrEIxbILAZkQh6qU
         +mglxdKyqtrYEkTzCpPHKYJDF5hcPn0NEKOFoxs1N3zqoLH6DmD9Nyp0AuJvZ1Mdo+WD
         umo7w4Nl1ckVMmfSZx7pRgR3KzcicztG6m9vQNJbwgm/aWXJOCEB+ZBpA8HNrb446a3L
         GwZ53+UaaXBwHMd7kRt31pQLXJbT0P9lGtug+1LIWfMp2bwfMFOjPpkBjYnsYCUGVjbb
         5tehkNZXRGIfhDVmN9QHyJFDOx8n9B0HbqusAzirw7VY1OWP7CcK526KyYquBOu/BblB
         PkWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=+5GRvZ43zFqRMd/YwXd7fMRHjvYLnlP+6/mhUjg5NqI=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=t/701XZK0+hCsHTFJsI/P0EeiPzqcj6MwEFaQ3Clx7clwfWfQzIOrWOhAY5CZU5MM4
         VUm2Wo2l0HBy65OHhZlPjtPkoejznUIKLyQAOghDcD4ii9npQPrX+Qzm2pwnAcT1OV3D
         ybJ3299v4Rw4ue7OOcfkrd04o+tAOQsnXdO7Qh7mZj19gb0PHYuIqwrPZv1fi29uhYr4
         ntWCPBEFgDSuwZFoJeKYOfxAbePyZ5UA9ac2nrwaCw+ZwTfz3slrOAvxlX/2VaBKNqmG
         FsU+GOSko/bQHihMjHlJ2W1EpR9bVpmIvLWv8hx+QvM/ffdkAgu575MD7HWzhPa5Xvrp
         0ydA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SzZ7SQLn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h14-20020ac85e0e000000b00417ced9f09asi1013390qtx.735.2023.10.17.05.24.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Oct 2023 05:24:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SzZ7SQLn;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qsj6P-0006ZG-2i; Tue, 17 Oct 2023 08:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsj6M-0006X7-85
 for qemu-devel@nongnu.org; Tue, 17 Oct 2023 08:23:10 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qsj6I-0003u9-SS
 for qemu-devel@nongnu.org; Tue, 17 Oct 2023 08:23:09 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-3296b49c546so4524281f8f.3
 for <qemu-devel@nongnu.org>; Tue, 17 Oct 2023 05:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697545384; x=1698150184; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=+5GRvZ43zFqRMd/YwXd7fMRHjvYLnlP+6/mhUjg5NqI=;
 b=SzZ7SQLnkvJF8DxZIDkbc9l0QOMAZPaku4Am/UoNrM0Cfl/zTIKFKTiRpJQd9c/k5C
 orXP59qcz0mjxDEEmmAj85EYbW6w1FHm5GBFggS6yHVEt5f6XfY9RYswMCpSqIWleI38
 7f8DQ5kEDS9KFAecEEd9Qr8di7ZNYeMLuIkWofZsBa++OLaYRTvpgn6cU0s82uWEFau0
 Cnv5lfwM7tGFVw5xUdApOroSw8KEXadPHkUrm8+xfeooqcOg/V7hfXcOSnjjPssfW1ly
 3SfG/fPcYefcBx6nBwtEFEjgnf4PPw6WsN7Sx8jz0UKqQTjr3/Jvijx+AToRd8ymYyMW
 4xJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697545384; x=1698150184;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+5GRvZ43zFqRMd/YwXd7fMRHjvYLnlP+6/mhUjg5NqI=;
 b=ChcNsVxq235W7Nk/I9I5U5RLgowHY50JdxbwBP9spEgrh7Z1psY8RUW41tINpDtjZY
 nuvZslCUxOAxGDvCtLh41cbEXVRzOTZGATXp8xuilPliqUNIPxehbdoCwy+tlGZDtzo2
 AtAeBnu5X8VaAOS9k0dJz5zRf23CQNmDjMqHcbgSRNUdHc9uqi1tYcvWJbAshN1kl4ml
 UjnHtBwJ3+9l2cmrN7SoR65GPMFT+n588QsCtBdGBuBhatCQcJ/b5JEsMD4rNUfgafsd
 CJ51rkLMYLu5rjCIKvOW7tVh3NeJlSWrcK1hlD/0vBVoC49M9EJKo8Z9rRGlNCBEuJ64
 AvdA==
X-Gm-Message-State: AOJu0YxOtv6EEaZaw529mYSTfiPy4aTLwYUQXP36qv6hUhzCPPRnpWm4
 QqlY1iE0f9XsCiF8DUEDW6OTIQ==
X-Received: by 2002:adf:f4cf:0:b0:317:50b7:2ce3 with SMTP id
 h15-20020adff4cf000000b0031750b72ce3mr1975222wrp.51.1697545384207; 
 Tue, 17 Oct 2023 05:23:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 w17-20020a5d4b51000000b0032da4c98ab2sm1590905wrs.35.2023.10.17.05.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 05:23:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/6] arm/stellaris: convert gamepad input device to qdev
Date: Tue, 17 Oct 2023 13:22:56 +0100
Message-Id: <20231017122302.1692902-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VWGbhiv1jzXE

(I had this all ready to go before I went off on holiday two
weeks ago, except I forgot to actually *send* the emails...)

This patchseries converts the stellaris board's gamepad input device
to qdev. This isn't a very important bit of conversion (I was just
looking for a small tail-end-of-the-week task), but it does reduce by
one the number of users of a couple of legacy APIs: vmstate_register()
and qemu_add_kbd_event_handler().

I've included Kevin's qdev_prop_set_array() patch here, because I
wanted an array property and it doesn't seem sensible to write it the
old way and have another thing that needs converting. I'm assuming
that by the time this patchset gets reviewed and committed that
one will already be upstream.

thanks
-- PMM

Kevin Wolf (1):
  qdev: Add qdev_prop_set_array()

Peter Maydell (5):
  hw/input/stellaris_input: Rename to stellaris_gamepad
  hw/input/stellaris_gamepad: Rename structs to our usual convention
  hw/input/stellaris_gamepad: Remove StellarisGamepadButton struct
  hw/input/stellaris_input: Convert to qdev
  hw/input/stellaris_gamepad: Convert to qemu_input_handler_register()

 include/hw/input/gamepad.h           |  18 -----
 include/hw/input/stellaris_gamepad.h |  39 ++++++++++
 include/hw/qdev-properties.h         |   3 +
 hw/arm/stellaris.c                   |  34 ++++++---
 hw/core/qdev-properties.c            |  21 ++++++
 hw/input/stellaris_gamepad.c         | 102 +++++++++++++++++++++++++++
 hw/input/stellaris_input.c           |  93 ------------------------
 hw/arm/Kconfig                       |   2 +-
 hw/input/Kconfig                     |   2 +-
 hw/input/meson.build                 |   2 +-
 10 files changed, 193 insertions(+), 123 deletions(-)
 delete mode 100644 include/hw/input/gamepad.h
 create mode 100644 include/hw/input/stellaris_gamepad.h
 create mode 100644 hw/input/stellaris_gamepad.c
 delete mode 100644 hw/input/stellaris_input.c

-- 
2.34.1

