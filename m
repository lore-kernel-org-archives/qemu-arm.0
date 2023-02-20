Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2198290ejb;
        Mon, 20 Feb 2023 03:52:32 -0800 (PST)
X-Google-Smtp-Source: AK7set9DcbOl+upDKWPXmQfm8eYo/uxPj4a6/XmJmqClmIP6ZmTKtb2ndyFsx/xVAVJlMDzoEtKV
X-Received: by 2002:a05:622a:1196:b0:3b8:6814:ea20 with SMTP id m22-20020a05622a119600b003b86814ea20mr1528830qtk.67.1676893952790;
        Mon, 20 Feb 2023 03:52:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676893952; cv=none;
        d=google.com; s=arc-20160816;
        b=uYRktQsOO3cNAU7Ogb9zcIgy5aboWFB83uBfcrBBIGp1Oy8CZzyg1X7uE1IT4SHJZx
         B7JDn9VOwXw6u7N/uonW/KPdkZmd9EJYk2G7Z3+SWVIh2U/dQRCzqSrREOw0M5GQRrKe
         7MZhbUETr+4U8BMh26TWPVv7W0+dVUo5VMXr0My+AABAfHalb5j4F5OYb6iv+9TtOI2u
         i6V+v57I14NNzVga9K1oIOr/MwqR2zPQSeDdEav5zYENBhsNZmEUb5W3w+5zy/XZVvhH
         ngs0OrlHAhWaQu68auOAHvw6i/SCr78FKcHIbOVC40XiiXVyOhIUKtBv12XFyIfhwcLC
         JpWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=AVEmTV8eUabu0JrtQ7tHPjA9qtxyI1a/sYkY8Q+FRBA=;
        b=iPus4LNajoQW0wrlXGL3/rfJ/0MbOi7SIak6aym/8hDZENCJWSBrOhd/pUdarovKT2
         1ADCnxFOkFlBvP93sLsW7Mj0kP9woDirtsfI85WTDGmUtEuvIlcXWraFWMHBJzh814S4
         xP0mhHsBVtEzzk6FY55Q0v84evE84ZAAXNpcPyV+Zx/Kbvr0q7K8AtIfufmAWrC3ctml
         op6/fLDiorm9n/9xREljDpCpwMuHWcNQne+XDg8QprKuh/YOyScUZZE3AUMbqJFpNobu
         owIJ/5inJROboSC8icMMRUlf7oWt6120PS5QBa3exdOGcJNGK9g8doWjNdZQo2x2wO3f
         AFmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X0heOi+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f27-20020a0caa9b000000b0056bf672dab3si9320585qvb.10.2023.02.20.03.52.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 03:52:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=X0heOi+2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU4hX-0001aC-B9; Mon, 20 Feb 2023 06:51:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hU-0001YU-80
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 06:51:20 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hS-00054k-B6
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 06:51:19 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 bg25-20020a05600c3c9900b003e21af96703so186554wmb.2
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 03:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AVEmTV8eUabu0JrtQ7tHPjA9qtxyI1a/sYkY8Q+FRBA=;
 b=X0heOi+2EtZVoeXlHG4E6fwJ8vjPphZeY72HFskoyaApaum4iMfO0dqpCDTQNrxNY9
 yzEnUwh+fICPH+xKy3aBdQbz0po3iKckNv3LQE5yFjExcA+l2ecnbDnyYznVNst+Ki68
 C7nFk+d/N4/xX6mNIoPuuZLGjQn6k21fnNs9shRMfrqMO4m+T6U6Kmqp+Wwr+nTB72+h
 rowZnLIWDpPNmkfMCuu5o+aYNF+G6migpeLwK1J5yGWQ4R+qIeECC45p+DuU/ShFxiCE
 M34qpSS4jzwesmlNIO0Cn0d+qJuvkcxtC9rB/7BL/KhnG+relLvFeuNSs6XmAGFj+cDn
 pITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AVEmTV8eUabu0JrtQ7tHPjA9qtxyI1a/sYkY8Q+FRBA=;
 b=x45iHrERSt7VJgdhOEmPP1mdHbfTagOJjBZClJqO9NrgO37xej0b+Yhteh/sP/o4sk
 xewvHqJ3fbnRqE7WqBvD7kja3BjwOYhBhCXhNBWWwvaTMmve0dIr+CZfrfayXEi0xA1e
 bqpDB//t6Z9CTIXTvNodNtq1/70X36HyEZuXuf61iUKLmD1Bs30DRP8MAyFn7b97hG+g
 22619XmpqPxspT9AzI3tBb2O/SLi/8h4F6ZTOILX9WuAPafBF/2lH1bdBdObdmFgJTcF
 Jf/wX+8mIhZnSElDuBxZTR6aGNS0AEggGa71XRLIKxdWiMn3Ww3t6kA78bg7DiAwKgGy
 VCwg==
X-Gm-Message-State: AO0yUKWnefHdBzlX4GZfv36chnVte9U+BV9klSRL1bKYH5+0/SfQ1X6V
 GVX98wpyBnY/mUDrmjAp+UCL7A==
X-Received: by 2002:a05:600c:1887:b0:3e2:918:ecd4 with SMTP id
 x7-20020a05600c188700b003e20918ecd4mr375109wmp.37.1676893876789; 
 Mon, 20 Feb 2023 03:51:16 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 1-20020a05600c274100b003dfe549da4fsm1388723wmw.18.2023.02.20.03.51.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 03:51:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/8] hw/arm: Cleanups around QOM style
Date: Mon, 20 Feb 2023 12:51:06 +0100
Message-Id: <20230220115114.25237-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YOa4ACFH2LO5

- Reduce "hw/qdev-properties.h" inclusions
- Open-code various QDev helpers used few times
- Use QOM cast macro when relevant

Philippe Mathieu-Daudé (8):
  hw/gpio/max7310: Simplify max7310_realize()
  hw/char/pl011: Un-inline pl011_create()
  hw/char/pl011: Open-code pl011_luminary_create()
  hw/char/xilinx_uartlite: Expose XILINX_UARTLITE QOM type
  hw/char/xilinx_uartlite: Open-code xilinx_uartlite_create()
  hw/char/cmsdk-apb-uart: Open-code cmsdk_apb_uart_create()
  hw/timer/cmsdk-apb-timer: Remove unused 'qdev-properties.h' header
  hw/intc/armv7m_nvic: Use QOM cast CPU() macro

 hw/arm/mps2.c                            | 41 ++++++++++++++++--------
 hw/arm/stellaris.c                       | 11 +++++--
 hw/char/pl011.c                          | 17 ++++++++++
 hw/char/xilinx_uartlite.c                |  4 +--
 hw/gpio/max7310.c                        |  5 ++-
 hw/intc/armv7m_nvic.c                    |  6 ++--
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  7 ++--
 include/hw/char/cmsdk-apb-uart.h         | 34 --------------------
 include/hw/char/pl011.h                  | 36 +--------------------
 include/hw/char/xilinx_uartlite.h        | 22 ++-----------
 include/hw/timer/cmsdk-apb-timer.h       |  1 -
 11 files changed, 67 insertions(+), 117 deletions(-)

-- 
2.38.1

