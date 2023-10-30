Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp1806055ejc;
        Mon, 30 Oct 2023 04:49:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGF/kveEU4ADXzKcKCd5GDXg0i/8mn5O8zMfg/NWU5w2ebHHZjTBebzh07/PxUrx8hK7e1z
X-Received: by 2002:a05:6214:1d0a:b0:66f:ba8f:39a9 with SMTP id e10-20020a0562141d0a00b0066fba8f39a9mr15555188qvd.8.1698666567028;
        Mon, 30 Oct 2023 04:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698666567; cv=none;
        d=google.com; s=arc-20160816;
        b=TZDtrO2VImyeliw+npZuLJImZmawGVsK8oMM9c39ZA+KtE/Zv9fkgalNk8S3r/VqnT
         CrOsJAqg8ruevdO7Jjpe3UNGGT0RhE48eZ0fwRn1sEk6k2SRv1H+KXnLq5TlcDU5jQyi
         zTLmvRGAXW/IGkgm6C//xLqO2por7RYGB/JxKE/2njURc0Ln+0rW21cwggVT5QD0whQr
         JBwBz30KKOu0idkAX61jXwMgTkr7lRF218sAzG1SAGI71oiwJJRkI5cSry/mBZYCs6Vg
         ietZD6J6G9qntF7YjHRIXQqIzr8XSKEaKenuFcpE1jLLKi4s4e1zmeC8BRy57QWjTyY9
         U5pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=0Jktw0+JDR5gQmK7C4fHrffStDGgAZObhUeW0j1fx8s=;
        fh=yUeHCMY0O7AHgYs4WRBJtcSGK81/h+/8SdmYaglLfmk=;
        b=BOiKvhMsWONTffktsYGakyOlwxoeAF99pZepXJ5O4PH5ylVO4myWHCzklSvPHkVlwD
         qRVC/18yT9lQLWEcuEari4V3V+1aoRV8ihqgmyvGIISq1IwiC5ASyjci3rZwOGsNF2+4
         i7cnmuL+LGdej35BX90q6jshWDl+J1o1E/HNRFBNvChzVUmBrgKgcXBSakLGk6lHryTv
         7ix5KQrsMvDaZIQVyy2AwlD638XOd4XRLrQ5OKRVMAdXpvOb14N6Xe1LsSE82hZBFOUs
         7V6jhDqGg97jqpwGcl5DHfuOo5b5o+x01YuAnj/zOtW09QDlYqlRM2b7isad2SsP6WJ/
         EWFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ORe2oSYi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5-20020a056214224500b0066d2398e233si4105516qvc.13.2023.10.30.04.49.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Oct 2023 04:49:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ORe2oSYi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qxQkd-0007sB-Sb; Mon, 30 Oct 2023 07:48:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxQka-0007oY-4T
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 07:48:08 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qxQkX-0007HW-OE
 for qemu-devel@nongnu.org; Mon, 30 Oct 2023 07:48:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-32f70391608so1833608f8f.2
 for <qemu-devel@nongnu.org>; Mon, 30 Oct 2023 04:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698666484; x=1699271284; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0Jktw0+JDR5gQmK7C4fHrffStDGgAZObhUeW0j1fx8s=;
 b=ORe2oSYi8QQrMdB4FIl1tYfN3p67D5nTFHyVNsBrSHUFDBtw3qt1/gxb0MG39Mcoeu
 D4hZG4QSzqlR+d839VwClYpYXEg+0LY2VfXhQ6HkJ1snOifFYe5jrLQfqLsWQRiQQIg3
 laq3oft6kS/m31Hr615tGdLbv2QWRefUjaXOfQFbb1e6lq6YXUgXG/nU2KqA1Yl670NP
 iYGwpUbfMi9/Isp5VtF+IrnqCbXRi4sbeFXeP/E2IxUYnxRRztp6YIDJj/JmmMmuSt5u
 or0AnPbZzqxDmBArRqHCyBZh2ulAI8cQ8IOwqLc3sZDJHK6HS/39mILugryn6w0+T1li
 E/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698666484; x=1699271284;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0Jktw0+JDR5gQmK7C4fHrffStDGgAZObhUeW0j1fx8s=;
 b=hIcRWE0zFFhrZuEqAa9Uun2TpOhgex0leQyLibDr37+WZ4alTSnAYI5yt+pWLMUysm
 XYBFavxRuWAzOLU3gHpWkj+7+Tr+N+kbxrtrNJfx/FhhiOdlRilgF5Xiyuxscwt8AVCK
 0PM9rlugBC98QkkvAAH/OJQkQ6acYCm+vqsm7KqRurri1Id+mgVJFhZv1y46HWJBUEbZ
 7jPMCs1y+8H9E070iDljHlXJ9AQl3uCQs90GlFwIt+AriyiUI/46YvQ88Ia0qK5p1YK4
 BjJe3dGCRR9k4Yi0Auk/VpwBOlttvzdglgqYNBm+MjrCMQz7glB6vo/9YYp695IL8NPI
 b4FA==
X-Gm-Message-State: AOJu0Yw/TkfgSJoj79ifGXqvsfOQiAnbPx+gmD9ga/tnjNiy2RdlAbZq
 IhXDyadhhn3a/MeaABBcBEPgsQ==
X-Received: by 2002:a05:6000:1191:b0:32d:a977:50b0 with SMTP id
 g17-20020a056000119100b0032da97750b0mr7103740wrx.41.1698666483984; 
 Mon, 30 Oct 2023 04:48:03 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 az30-20020adfe19e000000b0032f7d7ec4adsm5262268wrb.92.2023.10.30.04.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 04:48:03 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH v2 0/6] arm/stellaris: convert gamepad input device to qdev
Date: Mon, 30 Oct 2023 11:47:56 +0000
Message-Id: <20231030114802.3671871-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DnJtzs/LMJIU

This patchseries converts the stellaris board's gamepad input device
to qdev. This isn't a very important bit of conversion (I was just
looking for a small tail-end-of-the-week task), but it does reduce by
one the number of users of a couple of legacy APIs: vmstate_register()
and qemu_add_kbd_event_handler().

All patches reviewed and tested; changes v1->v2 are minor only:
 * bump migration version number and mention migration break
   in commit message
 * drop unneeded private/public comment lines
 * make QemuInputHandler struct const

I've included Kevin's qdev_prop_set_array() patch here, and will
take this via target-arm.next if it doesn't get in via another
route first.

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
 include/hw/input/stellaris_gamepad.h |  36 ++++++++++
 include/hw/qdev-properties.h         |   3 +
 hw/arm/stellaris.c                   |  34 ++++++---
 hw/core/qdev-properties.c            |  21 ++++++
 hw/input/stellaris_gamepad.c         | 102 +++++++++++++++++++++++++++
 hw/input/stellaris_input.c           |  93 ------------------------
 hw/arm/Kconfig                       |   2 +-
 hw/input/Kconfig                     |   2 +-
 hw/input/meson.build                 |   2 +-
 10 files changed, 190 insertions(+), 123 deletions(-)
 delete mode 100644 include/hw/input/gamepad.h
 create mode 100644 include/hw/input/stellaris_gamepad.h
 create mode 100644 hw/input/stellaris_gamepad.c
 delete mode 100644 hw/input/stellaris_input.c

-- 
2.34.1

