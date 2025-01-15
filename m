Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp3170443dlj;
        Wed, 15 Jan 2025 09:10:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW7r3HN/zLR7HJrAx13VQs/Mcm9EWOvl4pX18lu9KUiRNCc6o5uER1d/EgbIi3wEXqmhzoDp4Ljg7Jtdg==@linaro.org
X-Google-Smtp-Source: AGHT+IGRFYDj+BDaS6MQX8h4MrHo13amnVtVNkWAC6P0XjMTlnCJs9zDd9uDTelPRmKpEoRsn57K
X-Received: by 2002:a05:622a:8cb:b0:46c:7252:927f with SMTP id d75a77b69052e-46c7252933dmr445662601cf.6.1736961056055;
        Wed, 15 Jan 2025 09:10:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736961056; cv=none;
        d=google.com; s=arc-20240605;
        b=WL4MI0OpUg3BMP4gjKt3bQLKiHYOaymm7Yg/ymsGhJNRSCzwMemJxhlGZEjKiBqrnx
         e+oFPAoqqg5l3L3ykMmCbFJwCBGMseX8UFyhf6U4gQlB/FfIX7R12+pfeY9bQv23ACvt
         QLE8dHpAkNSq44g5IPLyIz3L4gVNtbcVDXdlhvUSSYgateBIxTH9/I0r2n1t5zJBQtS+
         6vdP430InqMudvh4W5Ukci/QXOQowfT4gXKcE2/dqKZoZMEsFN5ZxNmMHoX7WPFPlElz
         TE+3ymdBcY9rZ/zZzkCXgfZOhyhqZJj383Zv77tmJmW5rWOu6Pc6SXz/jnrqaRIakPpq
         BLxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=EkO7QKHSSU9JZ7UVLVh7P3hTPCbkidV6rATGTGJe5AU=;
        fh=6UcHSyPsfx91X7gCRj9DoJyTqaSWQcGP4+4c1Um4tYc=;
        b=A/Ys5U0c+T247gHUFU7ibkWyYcyAt0hNJufMjFQOunoWC4xGFXDo1Le8sPbo7zYoFP
         hgLGvahPqiP3E/ljTMpGM12GIcAhyIypMmHF04ux4dmBsCIOlDsagOa7t1U03lb9XIED
         HPw6tuqrMSzgtq92w8mXcWMdT+C3DaaKwsKgQlYV7W6WcEP59V6bSmdBp4H96kbDvEk2
         DSRQSXDluNZeNoTFjzPw+XFlMxgrVBAeU1Hv3QGs/fNg52OWxXaHp0J3qujZbn+JuWJh
         xWAgvbnbppXfL+FXJPtTCPvYxX4sQF21zkgQ61FTx/fUcK3Gxd0n4+owQm0HDFKrmgUd
         BGlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fD28RMNh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-8623b1fe634si4114833241.30.2025.01.15.09.10.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 09:10:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fD28RMNh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY6uZ-0007NA-Ff; Wed, 15 Jan 2025 12:10:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6uX-0007LU-9y
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:10:33 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6uV-0006Xf-Bj
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:10:32 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-436637e8c8dso71989765e9.1
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 09:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736961030; x=1737565830; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EkO7QKHSSU9JZ7UVLVh7P3hTPCbkidV6rATGTGJe5AU=;
 b=fD28RMNhfEmp6c1uGGBQPLMyvqdk5IkfpWs5Cc2v/TuZAY4sDMcHcCy1HC/wALt/JQ
 vDv1odHdzQBfl+/iz8BDtgkkkCfeKDbYERMv+xjFqCNe22fmKgRkU8Hxk9Jh4/NzidpU
 z5HuZv6u4MxEP/6BfwjVxVMhKv9ZgfEfao98sVA3ZbJEkdxDqGg+b9/o5p8Cwr98rNh4
 /knH7yno7qpCKqRIZhQgnPpzbQiCNEAIoo59SNmv4VVhlP6Wru7K0jFCjz8Of6zr1I4H
 2Bn9bHCNCSpFeBO6BnlTUIhYpG0VJ4wP195bsE7lFU1PzQWpwLkf0qYR/Su7M/XwI6/U
 ldNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736961030; x=1737565830;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EkO7QKHSSU9JZ7UVLVh7P3hTPCbkidV6rATGTGJe5AU=;
 b=LtrB9s/T3jT55wpK9KZWkSfmuNOwzxZ6fBsYlMeDefGyZc31u7Huz+n2iW1VrcBu6h
 CY83on2RgdZ8AhHNXBzcSXoFUTf8m5eVGDj2yFlCsnkgQoRs9mVKvNhcZxKhA+8kC6R+
 MhjnMtr5HNTHgx42Jy25vnRyEGAPUXVFBZatRtpVIn0b09hyJrkN9lQXjquET1+JgiH1
 3+R3ZvPZXcUjqkLKTdKPyq4vLrsimKMME5laeNnK/EE1/sHXnr+NYDPMk0ZDOzi1E9od
 kt9RHSsvUIKNXwhv5DB8K1/ogrQl/YiZJMVVypQhyUJYrfb6VfpFnBGzjP2mPxptFwDf
 5AIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDuaSDolw9ykJX195vOsg5JrphOfQjsyWFiJq3kiP6E+xfToB5ICazxhJxZh7CJfMfmTZhwkUJ1w==@nongnu.org
X-Gm-Message-State: AOJu0YwNzsmvjPQgEM0MyPlMpxTB6Yp4Nf8NBf4G8+N972qSk4MU5PkQ
 VnSd1aUgkDmhJMyMeBp/l+DCyO56y+uF0mNomfrD1mr9pJNpIz6IhLJuiKdGSBxGy8d3rBNAv46
 GwCw=
X-Gm-Gg: ASbGncsBTOzNSuv8SNhUoaQX6LZJuqpKZil3T9KYn4dw2mGpBJ0XkVdpz1yit3LT6Ek
 T0PO+J7AHVjyJoR3sa3Ykh+aqtbOSG1cl53QpHwWORbhSmr+X2WiCmdwZgp6V1YmnGlRIEDE1WR
 yLqS8xg63qQo+HIt4I8plBjBjEFzXVXCD11GOQG18ko5YlMdsOuJoTmb2qpjZYmmX9WEj3Ns5O7
 hwKzlwZICdP8r3xrb+w++KSQIuNzC4UXEocElWk4/5ae/JpxCnqIyzPdnr+KVVGfz1FPVrC5krw
 HLQCAWfykYqLIyy/1SV9moU4m9JgD3ijWhtF
X-Received: by 2002:a7b:c315:0:b0:434:ffb2:f9df with SMTP id
 5b1f17b1804b1-436e26adf94mr292003035e9.17.1736961029857; 
 Wed, 15 Jan 2025 09:10:29 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4c1cf2sm18303571f8f.99.2025.01.15.09.10.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jan 2025 09:10:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 04/13] hw/arm/virt: Remove deprecated virt-2.7 machine
Date: Wed, 15 Jan 2025 18:10:00 +0100
Message-ID: <20250115171009.19302-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115171009.19302-1-philmd@linaro.org>
References: <20250115171009.19302-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: U6yaehh9mLzo

This machines has been supported for a period of more than 6 years.
According to our versioned machine support policy (see commit
ce80c4fa6ff "docs: document special exception for machine type
deprecation & removal") it can now be removed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/removed-features.rst |  6 +++---
 hw/arm/virt.c                   | 13 -------------
 2 files changed, 3 insertions(+), 16 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index 813988fad4a..435f081d805 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -1065,9 +1065,9 @@ for all machine types using the PXA2xx and OMAP2 SoCs. We are also
 dropping the ``cheetah`` OMAP1 board, because we don't have any
 test images for it and don't know of anybody who does.
 
-Arm ``virt-2.6`` (removed in 10.0)
-''''''''''''''''''''''''''''''''''
-This versioned machine has been supported for a period of more than 6 years.
+Arm ``virt-2.6`` and ``virt-2.7`` (removed in 10.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''
+These versioned machines have been supported for a period of more than 6 years.
 
 linux-user mode CPUs
 --------------------
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2a2a0bd9154..7747dae4dc7 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3573,16 +3573,3 @@ static void virt_machine_2_8_options(MachineClass *mc)
     vmc->claim_edge_triggered_timers = true;
 }
 DEFINE_VIRT_MACHINE(2, 8)
-
-static void virt_machine_2_7_options(MachineClass *mc)
-{
-    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
-
-    virt_machine_2_8_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_2_7, hw_compat_2_7_len);
-    /* ITS was introduced with 2.8 */
-    vmc->no_its = true;
-    /* Stick with 1K pages for migration compatibility */
-    mc->minimum_page_bits = 0;
-}
-DEFINE_VIRT_MACHINE(2, 7)
-- 
2.47.1

