Received: by 2002:a05:7022:510:b0:92:a90b:6588 with SMTP id 16csp3170647dlj;
        Wed, 15 Jan 2025 09:11:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVNH+iwcaQxmJrk+hCaFWGDeDJ7IgRYwLObsEesdrTBEmWYWvje56FEHJk2RAD/eDiLmIqI0fpccdZYmw==@linaro.org
X-Google-Smtp-Source: AGHT+IE2znjOOf/+cUtlcXwkdH1GoIntWQ5sczc9PixZiLgCXVVMRcWmWCHhuXA7LW6LGWK/Ql7o
X-Received: by 2002:a05:6214:3c9d:b0:6df:ba9b:35ba with SMTP id 6a1803df08f44-6e192ba8cd7mr60898436d6.12.1736961068471;
        Wed, 15 Jan 2025 09:11:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736961068; cv=none;
        d=google.com; s=arc-20240605;
        b=RaTYb41nh96EwZ9IP1ZVnshwWyeBJBWICZ5KsPoQy/UPHnUolH7eDCDXG6AOC5JsPf
         uTweY9MS1pisHyutCEHci8pr3XrGf7724Q1bdMHNmveGigx8t5yA9WqlBYI+WL4EEf0o
         HQ8I+Jz4YIXS0WSDbISQ/WiYx4RqX+IqB0UrAYvI4kIwm7cx32/m2TLM8mv8Fulh5KX2
         PoQbeJPB53yqHoCH+wQbU0bHOsSHwobGrQjhSiF8lA+FN5arfg+oZnMh2SP0dLehSKda
         qgbIatgbdS3roLe2v5NUXyMsXDVWn/Sn0ug3LQFMNkoVJPp4hkcZHpTYK7200nnw0fYR
         zXRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tO82mELrC9ge/485uM+xBiac5JrZdcxe00dmNBeeW5o=;
        fh=a5hvIRJfGyh95mWzsyCXaK9uU82Cw5IKqhg/Dd80g3E=;
        b=jH3QpxnfiFTudejydWbNl5T/+T7r+NICIi3BfFgP1cnBviuHW4WlUrX12Db45SheSt
         7Wv1+I6CLEBM8WeqERxTNprPfBkjpIpTHGbwqaHVLsyXYoJNmiydTZpjr6GdQkhQNEIC
         fxt2JKxTxyBs42lWqKAg+LxgDBAOY705ck2X5ZdcAG3CmrVRXQeuD7IcGJn3owUourZ0
         63I5Td9nf8Fhzl7PRAzowZ9DH7/UPH5b8SRp+KCXDLn1J3eqVkTv/XMc0nD4O/xkJtZv
         SiZxGxFKlsqdvP7RYdysHjKyCwHM2zOKjpY4Z3Wuu1qEjhcezop5L2+7W9/jjJvv6wn5
         VVGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KBxokSMa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6dfadf87bbcsi144545896d6.375.2025.01.15.09.11.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Jan 2025 09:11:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KBxokSMa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tY6uW-0007L5-IM; Wed, 15 Jan 2025 12:10:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6uL-0007DM-C6
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:10:22 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tY6uJ-0006Vk-L3
 for qemu-arm@nongnu.org; Wed, 15 Jan 2025 12:10:21 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4361dc6322fso49895515e9.3
 for <qemu-arm@nongnu.org>; Wed, 15 Jan 2025 09:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736961016; x=1737565816; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tO82mELrC9ge/485uM+xBiac5JrZdcxe00dmNBeeW5o=;
 b=KBxokSMaGDjGsnT6P1OT9RXr9xfywnz29iFe6xWnfNn3WxkV2DEjMd3rzauSDCLA+K
 /txwqlWg2MTgpVknnjcKfyZ+7GbBpwwX0KWrrNXhN7zMi/6TlkKAU3XBBKCX+iCRnGh/
 HYAmp6W0DujcHxUn+XUWWapMaGdQzU7Eleyb6Q+qTcV0Z8n3hrrelN3pMbycDM5j97mv
 /xO39nAr2zKN4Tx8HXBGL6ZDFMzP7qYom6UUKtOtV1V+O+sgkoO5gQ9Dy+fKwI4CBU5o
 y7w8uru5kFGAnM5a9gl2GY+dtlv2pTYo5xn+82kGu6eu9pyYnpuAWuFAWt2iOI6oW3BO
 U9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736961016; x=1737565816;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tO82mELrC9ge/485uM+xBiac5JrZdcxe00dmNBeeW5o=;
 b=cgDubdg52a+F8JK8zsiqF7Am3EyvfwGkI5xgozoize8dAeSZihgp76DOPJQqgEqETf
 CeK4I+Raar7XKHGBDjJXTAllPxqsl4DpKgMrdeGhbOJNSIwxtA3ivuQZb0bURb83Gb7K
 Xa/0+chvJgdHlyOWANhjfFehTF2L5eFilq4Q95sRwvQ9bWbhwUga44HwNZL7jE06sGMu
 8jgtSAG+B5PtkxfodZTsUTxjWaPiVYxXCMDamGqZIadZ9BDSOHUCAYYI9D9NI4F5jUqL
 Pk4zbwdg68XXivLq8iRLqJgX1gnjx0PDkjUKRcmvEXaIiWejbRVxNBHzSiUf0VbJmr6D
 /lfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWA09GxOKF7OA84nLkBmNkA8KSiIWznSSDTGs0dPFUigfwcL5KK/35/r6iNyWybWfhNwEZAuTI9Eg==@nongnu.org
X-Gm-Message-State: AOJu0Yy2/ANroPDRfn71dM5LLPFAeKScaRSlP5LhWeoVUEicyUAiZ8KB
 PNtWTlaDDGUGUwAGqcdhdaZYZAIQskk+eapgvRU/9YZC0Y+8Rg0j0+JjReKiY84=
X-Gm-Gg: ASbGncuE6lg/pLDeIlQwGWOQj/PcHEjz1wJpGaKm4Sh0Z48qixJpIz21Ll5213YeIeQ
 FwqBMt1RHwk1tK0C3A2wQ3TfIm+0bCGPerRmwiUnakBbfE9DKuO0zPtVS3GWB2y6aa3s18iGSQw
 xlSf5XOJeq8ovFe4VwnCKNLQ/NsiDZcRjApaheUlAB6zKSBzc0981zw/vsTFacDRz2sE8Oac9zJ
 Qq9hjME7tV+g3nQ1kQG6Fq6D9w7itWIsaluqOpt2KOLGbH4FUkUvs/We2ZY6YLU5LxShlthbMu3
 RyuX2MLmgo3aCTho6b/2tNZykK/rD9iVcjwn
X-Received: by 2002:a05:600c:3ca0:b0:42a:a6d2:3270 with SMTP id
 5b1f17b1804b1-436e26f01aamr233136665e9.21.1736961015906; 
 Wed, 15 Jan 2025 09:10:15 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c74c475csm30575235e9.20.2025.01.15.09.10.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Jan 2025 09:10:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 01/13] hw/arm/virt: Remove deprecated virt-2.6 machine
Date: Wed, 15 Jan 2025 18:09:57 +0100
Message-ID: <20250115171009.19302-2-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115171009.19302-1-philmd@linaro.org>
References: <20250115171009.19302-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: 1Va4kbrkZM5a

This machines has been supported for a period of more than 6 years.
According to our versioned machine support policy (see commit
ce80c4fa6ff "docs: document special exception for machine type
deprecation & removal") it can now be removed.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/about/removed-features.rst |  4 ++++
 hw/arm/virt.c                   | 12 ------------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/docs/about/removed-features.rst b/docs/about/removed-features.rst
index c6616ce05e5..813988fad4a 100644
--- a/docs/about/removed-features.rst
+++ b/docs/about/removed-features.rst
@@ -1065,6 +1065,10 @@ for all machine types using the PXA2xx and OMAP2 SoCs. We are also
 dropping the ``cheetah`` OMAP1 board, because we don't have any
 test images for it and don't know of anybody who does.
 
+Arm ``virt-2.6`` (removed in 10.0)
+''''''''''''''''''''''''''''''''''
+This versioned machine has been supported for a period of more than 6 years.
+
 linux-user mode CPUs
 --------------------
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 99e0a68b6c5..3bb8a9c7bd6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -3606,15 +3606,3 @@ static void virt_machine_2_7_options(MachineClass *mc)
     mc->minimum_page_bits = 0;
 }
 DEFINE_VIRT_MACHINE(2, 7)
-
-static void virt_machine_2_6_options(MachineClass *mc)
-{
-    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
-
-    virt_machine_2_7_options(mc);
-    compat_props_add(mc->compat_props, hw_compat_2_6, hw_compat_2_6_len);
-    vmc->disallow_affinity_adjustment = true;
-    /* Disable PMU for 2.6 as PMU support was first introduced in 2.7 */
-    vmc->no_pmu = true;
-}
-DEFINE_VIRT_MACHINE(2, 6)
-- 
2.47.1

