Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA04CCF9F8
	for <qemu-arm@archiver.kernel.org>; Sat,  1 Nov 2025 12:03:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFAJU-0000v9-2R; Sat, 01 Nov 2025 08:02:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vFAJK-0000tW-77
 for qemu-arm@nongnu.org; Sat, 01 Nov 2025 08:02:23 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1vFAJH-00051I-9p
 for qemu-arm@nongnu.org; Sat, 01 Nov 2025 08:02:21 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4770c34ca8eso25134335e9.0
 for <qemu-arm@nongnu.org>; Sat, 01 Nov 2025 05:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761998535; x=1762603335; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=khfVYY1UJRANfTe3uSdDUlTmZ2chbclm/a9R8cDFm5Y=;
 b=J4nGF3yumZ+t7PBZuZ9UsmvJO/meguY0FnYyS//FC6S7mtkaNgIas9TwMl9gCEYaex
 8D7GnkNl26XRL+c/RNQYqKLEW8RdGH5iWrbvqh1bQvFnfrO2VRip6mM3NaemlrvPIrdl
 oH1ZkPYsTZk07yx8GaOz3pdrocQIvTIA1Sr6VZTimNLRMrIW2W+40BDo0fLb3EUPnWRY
 /WMhcdXi+TrSyTLyTkFTLtyDekK6NsahjlvaI6XKE8EKeuK/h0Vb4hwEabORtJ9Xl+Iy
 ev8Pm1HD5zQnTNBb9u21JkQcQYBMEgQ+Jndv7t4mCJFnLdTUJTaEWsekZph0Dtc2DyjY
 e/DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761998535; x=1762603335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=khfVYY1UJRANfTe3uSdDUlTmZ2chbclm/a9R8cDFm5Y=;
 b=inYIpJ3cgWHum+MGub31t1k9Ou8uhT2GSz9GfZHo1dmm7TFKUTTOqqWb4WlwS3T5XF
 MmMs/AqrIYIZpWSjMR3S/hk6UFRkxrPV9BPLArkKaS0+B2JQFcpnWLDppYNtcNWUmIX0
 y6eTXitQO7nEwYEUD4neBWoamCGzJzVEEA4DvHHGCyvZfA/XxW8pPOB/MCorwYNjHrqc
 nVq5amoRQKz7N/q5zeDevoMF1kefzuboUvIIDBYsQJ7QrdIr0W7e8MHGlCwc7FjY7FM1
 r0/n5vhHt3BPV9JYSNiS0KqBQs8HJq+i5a7rI3C/VZTg6VhK8qBPWObZ3HhLMjLP3YWX
 qyCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDp7DS8bklNiaLYojDTZf6dnzaEUoKHfyxFqqXcOybM9XopxctZR72pdKenkoxqTyfL1t+sRtxng==@nongnu.org
X-Gm-Message-State: AOJu0YwOH50C2Q43jK1mjf8y1l9amwKH9wNvpFCRVzDjrUr8+4SAGiPj
 phKG6RlShem20hcHKhTFq8DC2e9njnXxzmU8Ss0st+4xnEDdS4CuJO+M
X-Gm-Gg: ASbGncs1tAnTd/G9rz3rwllbKNVO3k7+tvyRRSY3JgjE4VODdfhdZSYYlCKX7gJfMGx
 Ku5y9ro5h0ZFtlcHWp0ylU1gkJLhi0OSEkBPHa662MKXwwEEX7vrhXbcQisyn7Yqq7GBdFsFI3E
 hrHnbSo8fDOAUTotrxT11KzRIFDUNnynT4/F8kC1TipDs8IZfXiLzG16/tAwVWYAwl6KZmNM5ay
 EzGiTeVOjAaNseq29Ae2HcpCx6E0LjepwfGbxRN2mf4PaZ3K+7cPSm26DQuX74ETkUMtL4wvyUJ
 cKfuOt2aBP72LWVySYwDbaGHspettSLCV5j/otR1Rb4awUctYi5FxvsjfModJRukBGis3p7wizs
 o8nu/gml8SoESzDpxFbxAltb87S2nXZArURRIlf2r26dkXBKVve5TwtDVyY1B9E/u2xwddc+93L
 Hu3QVTaEe4FeinZEGfGREpG9vAs9EztpcI/v43QITgYg+VZjAmVHxyBg==
X-Google-Smtp-Source: AGHT+IGbfE+9R23E1GbgdTQciHz1+9Wfy8YL4qUH4+qCo4L8kmVaAp4pyxBfdhqvkVhUkvZOL7c5/A==
X-Received: by 2002:a05:600c:8b6b:b0:477:fcb:2267 with SMTP id
 5b1f17b1804b1-477307c1fc6mr76940705e9.8.1761998534564; 
 Sat, 01 Nov 2025 05:02:14 -0700 (PDT)
Received: from archlinux (pd95edc07.dip0.t-ipconnect.de. [217.94.220.7])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772ff83182sm40734215e9.4.2025.11.01.05.02.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Nov 2025 05:02:13 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 2/2] hw/arm/imx8mp-evk: Fix guest time in KVM mode
Date: Sat,  1 Nov 2025 13:01:30 +0100
Message-ID: <20251101120130.236721-3-shentey@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251101120130.236721-1-shentey@gmail.com>
References: <20251101120130.236721-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x333.google.com
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

The imx8mp DTB hardcodes the clock frequency of the system counter to 8MHz.
In KVM mode, the host CPU is used whose system counter runs at a different
frequency, resulting in the guest clock running slower or faster. Fix this
by not hardcoding the clock frequency which makes the Linux driver read
the real clock frequency from the register.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/arm/imx8mp-evk.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/imx8mp-evk.c b/hw/arm/imx8mp-evk.c
index 3ddcf1af5a..44e0601967 100644
--- a/hw/arm/imx8mp-evk.c
+++ b/hw/arm/imx8mp-evk.c
@@ -44,6 +44,15 @@ static void imx8mp_evk_modify_dtb(const struct arm_boot_info *info, void *fdt)
         fdt_nop_property(fdt, offset, "cpu-idle-states");
         offset = fdt_node_offset_by_compatible(fdt, offset, "arm,cortex-a53");
     }
+
+    if (kvm_enabled()) {
+        /* Use system counter frequency from host CPU to fix time in guest */
+        offset = fdt_node_offset_by_compatible(fdt, -1, "arm,armv8-timer");
+        while (offset >= 0) {
+            fdt_nop_property(fdt, offset, "clock-frequency");
+            offset = fdt_node_offset_by_compatible(fdt, offset, "arm,armv8-timer");
+        }
+    }
 }
 
 static void imx8mp_evk_init(MachineState *machine)
-- 
2.51.2


