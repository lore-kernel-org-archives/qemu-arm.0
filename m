Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp257296njn;
        Fri, 10 Jan 2025 08:04:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV1ZiSapt+O9v+jySdODFbN6t4m6i+XmBxZSIYLXnuZocxBdKlXi52akLCVCeI+6gGiWT4a3w/Dw5fRSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH86DAJ0GMdQzo0gNTbX7txxN95UHy2SJeSf4UvNVr0vYu/Ng0fwfLjXC2ixcVlZDEbMxlf
X-Received: by 2002:a05:620a:2490:b0:7b1:19f4:c6e0 with SMTP id af79cd13be357-7bcd97bdeb6mr1727307285a.51.1736525089774;
        Fri, 10 Jan 2025 08:04:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736525089; cv=none;
        d=google.com; s=arc-20240605;
        b=W/Jwuo7ln5Z2CQFF7YpKfQTrxwXINWzuTsC6UFNF1oH0Xh2MdvvyFjimZBQWkV0X/9
         2HnWrLYeSP7DM/gTCObuYTNTfw3lYydxfa1n0J0YGp/P0y03/r9p5wGWf7Bvt69M9rhP
         b7jxUbf0PNE5nd8Jvs5vx722bBmIz5X0hrJ1Vl+YOl5WUD7cbyf8jKWhwsZe6Zhlz+50
         cxPYIpX5hGwVCOPUwKMLPfoxvT0SR3coJNyxs4KTiIifJ7aMEKdANjLRg6rD3rWvJl61
         Ioi3QRQGtEZCLjCc/PA1vNEOEVC+RX6PYYvr/3V1bkcHQSAYMvw1nE8+beopo+WYKPPm
         FXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DdLTUyiJZXg+Jy7eGhrfWWJqUYAsXZouUvxtiAwdX4U=;
        fh=dSlqYLaMwSJJ9eVCgUOrYwBOX2aCGOGxas6G52aWedQ=;
        b=dRish5/+v3s9s4w9S/DqeQ+b5tc0mn0dY9y5LDfk+hExnOXRn0ClPt0AT7FtagGWOJ
         iaAei/tIzGhlHlrlhTv6+4qqdXlIYgqjAB39vP4Z8KCKRdmiKFws5YL7lQJhaVPAeYP5
         HNzY0S+VaWYcVjeC0xedjM03262/f9meiVwuEmSEvJghKh3iu2u2sdcG7dk+0D3B4H7E
         fwnu4SAPuuRR3QY6GIEk5RPcX+WuGand8TF3fz3B+j1QCCt2mNZw1NyVyfk5m356fF53
         moSI+eYFCTf74CLdDiEEQ2Q7WA3Qbxj+A871F0D0SslMyXBK4ntmn4LHsWgojOXjkA0e
         APRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nOVySbNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce3506c69si462548485a.499.2025.01.10.08.04.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jan 2025 08:04:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nOVySbNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tWHTl-0007cR-4H; Fri, 10 Jan 2025 11:03:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tWHTC-0007Kk-D6
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 11:02:49 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tWHT6-0004Hq-S0
 for qemu-arm@nongnu.org; Fri, 10 Jan 2025 11:02:42 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4368a293339so25800705e9.3
 for <qemu-arm@nongnu.org>; Fri, 10 Jan 2025 08:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736524958; x=1737129758; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DdLTUyiJZXg+Jy7eGhrfWWJqUYAsXZouUvxtiAwdX4U=;
 b=nOVySbNnyTBgoPClvI3NoUgqfmIzyVf8l2JywQ5d7VQQHLKEIVLN3cIUiXloHqH59Y
 Y/QGHTaofs17yVSEEJF4uwC2U1oHRgQQa8SwwkNqdfNudsIaQxYzSKx+KuCeNtI66NKB
 D3wrpEfLQKaZMIWw4dAGVldL/8F+t+Cr4BgC06mkhDdy49ik5/wuoSxnC/9t/WWcZ0CG
 T1r6yKkDieh+fTai+BTtpVJaTbvEGlBy3jDjnvbJf69ulCcaJMxqvXA3t31Ndi293k+B
 tVXhB4jKSD2lEJvH8G/lAPVCwBdeVW+wgLw1ZSGFbPJ4PS9nzXU+sAF7h6reYLCKplwn
 4ftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736524958; x=1737129758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DdLTUyiJZXg+Jy7eGhrfWWJqUYAsXZouUvxtiAwdX4U=;
 b=sJx8HcYs1JFe1OG98xaDFnGTMPzg6usTRygL6TnRY6FS/XOwl9cAeMajWO51G8zct2
 +lhNYTQExI8fUfKrXYzDJDJAxE9yH+99JCu+ahaJQJaSHfkKSnUgIKD7Jkx8RJHK84d9
 AVp4DnTRCY7sFH9qBWgvkf6jp/GSr2V85YZAjsN3/yHQwVs/KNjUxGp2RQvZkOV+xZSv
 CJzDsElJQil/nKbfdPzOBxisi3XUetF4KpNK/6ajlkzywLXj3m6Epa/vZgxZoT2FbDHe
 /n/ASekeL1Qnzsd5KZKawBhGAn2h9k2T7g91fITeb8S94a/vZJ4KiVfhPoDXAzZsL4gp
 9ONw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC014JOOHWfUj6kDxPX1FuX08aEL6GbT4XQI+d6+adhF1cyaPjr6yQubZI9nSNwb7/VM7/xfQDng==@nongnu.org
X-Gm-Message-State: AOJu0YyDw/4WvEGjttf4Yg/bO7wbQylfGnItVkbLvzPyQ9x6Cicr/OIG
 2D4jsEqN1UBYNtQwwRPuBWynk/XaNqd+JbdyZmdcLAqbM1mFKkuCO8HN0enr2b8=
X-Gm-Gg: ASbGncsSfQa3LC4isDFQ4l7Szhx1HDs/vMWLZHEYT23Vivp2/a4my2VwqukxbWkpYyM
 NQpX/tibBrmaLOuJAOScuduK2R2VoHhRduUc4JTH+923t82uPHSOs4EasS0QkPN6YPo6SqupazW
 yoWQvPZdtbbXOoMm6TV7ZlcBZQSV888OWxvr8UfAtjSCp/hhwLS/a5ilyM27apWDZl6DUbK2ocY
 nVlMDY399Ti6FbV/+ZuXv42nkcc5JvlTIftSKsvhjiXc1aaemhkQwNdVAyEHOj6xHsqE5eEfCia
 xJ4THzoCV0kX/VcJHGdpjIeoRIS4DOQ=
X-Received: by 2002:a05:600c:3b88:b0:435:192:63fb with SMTP id
 5b1f17b1804b1-436e2686662mr101223575e9.3.1736524958131; 
 Fri, 10 Jan 2025 08:02:38 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2dc08bbsm89879665e9.12.2025.01.10.08.02.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Jan 2025 08:02:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 7/9] hw/arm/stellaris: Only create MPU when available
Date: Fri, 10 Jan 2025 17:02:02 +0100
Message-ID: <20250110160204.74997-8-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110160204.74997-1-philmd@linaro.org>
References: <20250110160204.74997-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8R285+HvjJ2d

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/stellaris.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 655bf85e89e..d87587225c2 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1128,6 +1128,9 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     qdev_prop_set_uint8(nvic, "num-prio-bits", NUM_PRIO_BITS);
     qdev_prop_set_string(nvic, "cpu-type", ms->cpu_type);
     qdev_prop_set_bit(nvic, "enable-bitband", true);
+    if (!DEV_CAP(1, MPU)) {
+        qdev_prop_set_uint32(nvic, "mpu-ns-regions", 0); /* Disable MPU */
+    }
     qdev_connect_clock_in(nvic, "cpuclk",
                           qdev_get_clock_out(ssys_dev, "SYSCLK"));
     /* This SoC does not connect the systick reference clock */
-- 
2.47.1

