Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2172864ejb;
        Wed, 21 Feb 2024 13:17:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUTT+PfEebBd+KcMCxSBLNRuf5sZW1kdHCLYZKKel8hBqgiPZ1PTv2MrANLucRljemWalxQtD4gGn7wtd7rQ5+4EqBfPFZR
X-Google-Smtp-Source: AGHT+IE5URuFUbKDpL0cQ76zLBb/jalZDj642dsDBVmIYSuSNdGDH/sU96NGiHl+XMiTsSS/U1up
X-Received: by 2002:a05:620a:3956:b0:783:c945:f774 with SMTP id qs22-20020a05620a395600b00783c945f774mr24476144qkn.16.1708550228337;
        Wed, 21 Feb 2024 13:17:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708550228; cv=none;
        d=google.com; s=arc-20160816;
        b=jFQH7EsvfhPOd4uubJmHvG5RkZad0/M61QCsdL5HDnqUgsDgGAOMlOq7kC9z+10LH9
         rehJcl8MR2ouPHy2u4990Vsw46rvj6lW5NL/4vwEgLKn0y9r2qIj4WUY+D6Ihjv3T+q9
         QNDBw819pw9Mm/3VGFphG4BLc7i5u8L/JCoK25UWn+FdlPb3h3Fu42NiNs7v0Jcezq22
         eE2iqrvdJK7sinwhVbC7zQK+94swO+8rONDbB3UjVJm61JqdtGUdAtDY1L2zhkQU+BWx
         Dpj8qY+dZRu7P8PnUWBT4tUaP4T9xjS/GmBShUbLwyqMdhwrXjtD2kWIy7Q3kZAHI42p
         oSPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Z/W4KhZI17pYbgZl7WFC76po73LZjqrV640NPiHP0AU=;
        fh=FmsLcdt/LUQpgS6NV6HcHKbEVcRfHqlCHqgKBqY1uBE=;
        b=a0ZDcuHqb3l7K7IA2xTLu63a1UuOBW9I6KOp94d3sxnT4mw2C6NjAoepKNN0xK7k18
         /fzyle4LurapROhnhzkYRa9nQrfCBUOLTmMBBSLnomab8KVWoSrE11FB9/B9h6rWJxn1
         rs6sKIuwBWql7uAsPDDQN6nOvqVva64Fyotc1wHJXOEknjG6oxdPLMANAO9NN5Zhkkok
         cq0y9PKHstE6vD9KrvX9CM/kZpV0WpHEU3ZpRqeXvYWzCrp6hYIRHDwjajcMHXaDLd8o
         LXxzVDzl+lIGM9IMNmtjbWKBT5dSZKe1pSd7X3Bf3DYpzB1TOW7ZGs8iFBdkI4P5sdtJ
         X2Gw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ef3iS58P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14-20020a05620a260e00b007876fa19d8csi6626083qko.66.2024.02.21.13.17.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 13:17:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ef3iS58P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rctxR-0002E9-IL; Wed, 21 Feb 2024 16:16:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rctxH-00024R-Ta
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:16:43 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rctxF-0000kx-3q
 for qemu-arm@nongnu.org; Wed, 21 Feb 2024 16:16:39 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-41275971886so8626395e9.3
 for <qemu-arm@nongnu.org>; Wed, 21 Feb 2024 13:16:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708550195; x=1709154995; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z/W4KhZI17pYbgZl7WFC76po73LZjqrV640NPiHP0AU=;
 b=Ef3iS58PtEyhd3b9O1hyyK16GzW6rWGKTN/tSxAAR4+4dgcXED+ZjXkk0D6qRPKSZD
 6O6u+6wHsCmlTClXtfyBO2rweaBc7I+3a1HTy6IL58L3S7KKhxUTGmCOIPtsLwbsqmI0
 +iCjGm9g/hZdqyzLZ6fMTDCOw4eaTOorU+hKp0bgFebQ1hCoR1aKeo1GHkaBnHRU5y4y
 R6NEiROxHfm0imU04+gIxBtBUKAOABxip+c6sMwpG+mRqBAHQ6KMPwkXbQkui4fax/Gm
 pjbEqMjO4rbLTO03aPBvTRbTY1ZRllaichNHF2XEZfr+zU2l6wPwiTx/KKYdc6a4MdUi
 gNSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708550195; x=1709154995;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z/W4KhZI17pYbgZl7WFC76po73LZjqrV640NPiHP0AU=;
 b=WrX9mPoUm3DMSqsQ2+GZTcuii1DiSTPA02BRIyT0CSpsJyCDu6lJFwySGaoAKgnuUp
 E1ALlIi0US0zrtgLgBqs9ZBCv9jQ//Bsw9/KJbx7PXC31uy+iT+GVzHVJgA0Dx6cBNOY
 ES+SDCbs2/7vDzo4Nqub2LmHEgzp+rFGQGOVLHJdwHhhYog+KSjCuCY4JKeQP/HPKtpH
 jupZ51MFN5H3HLAWNXJIiNxwCmyTZG8VcKousGzoTnRwSkM/1q5OC8nYQGPZvsT5ZkNq
 SkktAqSuFalksewrovdy/ATuQc0jgPRMBTvNo/yo+gBZpoe729EScHwNNIEc5tRyrgeN
 LHAg==
X-Gm-Message-State: AOJu0YwaAR9WBA72XwpVCUT3TWZnn4CcJv4f+eFmYh/cKwoSt9PmYXs0
 bQT8/MGTQj7JxXqD2v30iiGa8UrYmJzm/klWXLJdBySj1PXi+6ZDfLqZXgseS+0=
X-Received: by 2002:a05:600c:45d3:b0:410:2d72:63b3 with SMTP id
 s19-20020a05600c45d300b004102d7263b3mr14072844wmo.23.1708550195659; 
 Wed, 21 Feb 2024 13:16:35 -0800 (PST)
Received: from m1x-phil.lan ([176.187.211.34])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a05600c281400b0041214ff06cesm19052761wmb.42.2024.02.21.13.16.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 21 Feb 2024 13:16:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 01/25] hw/input/pckbd: Open-code i8042_setup_a20_line() wrapper
Date: Wed, 21 Feb 2024 22:16:01 +0100
Message-ID: <20240221211626.48190-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240221211626.48190-1-philmd@linaro.org>
References: <20240221211626.48190-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 6u8M4ElakUbT

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Since the named GPIO lines are a "public" interface to the device,
we can directly call qdev_connect_gpio_out_named(), making it
consistent with how the other A20 input source (port92) is wired.

Suggested-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Message-Id: <20211218130437.1516929-6-f4bug@amsat.org>
---
 include/hw/input/i8042.h | 1 -
 hw/i386/pc.c             | 3 ++-
 hw/input/pckbd.c         | 5 -----
 3 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/hw/input/i8042.h b/include/hw/input/i8042.h
index 9fb3f8d787..e90f008b66 100644
--- a/include/hw/input/i8042.h
+++ b/include/hw/input/i8042.h
@@ -89,7 +89,6 @@ struct MMIOKBDState {
 
 
 void i8042_isa_mouse_fake_event(ISAKBDState *isa);
-void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out);
 
 static inline bool i8042_present(void)
 {
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 28194014f8..9cbc59665f 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1195,7 +1195,8 @@ static void pc_superio_init(ISABus *isa_bus, bool create_fdctrl,
     port92 = isa_create_simple(isa_bus, TYPE_PORT92);
 
     a20_line = qemu_allocate_irqs(handle_a20_line_change, first_cpu, 2);
-    i8042_setup_a20_line(i8042, a20_line[0]);
+    qdev_connect_gpio_out_named(DEVICE(i8042),
+                                I8042_A20_LINE, 0, a20_line[0]);
     qdev_connect_gpio_out_named(DEVICE(port92),
                                 PORT92_A20_LINE, 0, a20_line[1]);
     g_free(a20_line);
diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
index 90a4d9eb40..74f10b640f 100644
--- a/hw/input/pckbd.c
+++ b/hw/input/pckbd.c
@@ -777,11 +777,6 @@ void i8042_isa_mouse_fake_event(ISAKBDState *isa)
     ps2_mouse_fake_event(&s->ps2mouse);
 }
 
-void i8042_setup_a20_line(ISADevice *dev, qemu_irq a20_out)
-{
-    qdev_connect_gpio_out_named(DEVICE(dev), I8042_A20_LINE, 0, a20_out);
-}
-
 static const VMStateDescription vmstate_kbd_isa = {
     .name = "pckbd",
     .version_id = 3,
-- 
2.41.0

