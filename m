Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3506772lfm;
        Mon, 13 Jul 2020 10:58:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMDdzRg2Kf/LzGi/LSt+aDiIwWge+JlIACitv2wY7Nyd4tIctJARAuIHEErO2TulhFWZeW
X-Received: by 2002:a25:4143:: with SMTP id o64mr2032013yba.226.1594663082710;
        Mon, 13 Jul 2020 10:58:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594663082; cv=none;
        d=google.com; s=arc-20160816;
        b=InkIpYcrBqcay3ycqK8iwrYdpU2HQjRB20j74objEuxFPtPu2wxJU1kme+lqENJSAW
         r47OZ+2sBn2NFyPuXBeVedAzImacT5u3L8XDpJhcIhTgAJwwSCX9UTt7ZuWLZAuL3Wea
         ssTHpBH0JM4G0mvkhdo4ZjSCs+ToEhgzsTIO9yBnTMQNEH7+2f4WIl3PZPp9inSnhIdI
         rZTUdVJYrqIUn3QughqgmWI/am9mbsSo0O3/OdRX1fImpMtsmVSHmEFphR4FRMN92B8Z
         Gh+k08tXN7ZyStrd0hkX1ijNL/1NUu7ItR2M8kgazMvJ3UXsRLSOIo5+8E02QfRdsIjw
         1xTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AkELVoYEVE6BfnfMYte+uiKJiz/kf50c60t3vfodgLM=;
        b=sMk9oIybP1mBj8efabiJkVKfwLD45SrfAIbHzeJh/pFHjT1CrKxV+C2Ln9vPwdVh3L
         WYxm3P8fPqOIlDZVslJGWoJxH8TcjpRi/Vf6V/KCq5c90dtC9sqiUgrbL+EmsZ+qV74G
         uyfUA/WK9/t6dj1Xv9leyv23Eke5th3nv7N2+rKH61tkhs+P0djhTf6J9ghTfLyOrNIX
         WgFeTYsoj8BTOnl8PFyhpU+q08Un1mAWK0iJdiqM/TLZwD1kXPxzQSEn573rvZAQR7QL
         kiIHiwl1XvNe9hMJOQtfYRbhi9UvNgdakdkQuPGMgW/NDDqNrRDSbhJlyLvV0YfVmixS
         I/ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eHSAPKlj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k13si3266718ybj.3.2020.07.13.10.58.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 10:58:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eHSAPKlj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jv2iI-00029X-3R
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 13:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jv2i9-000276-P1
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 13:57:53 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jv2i8-00084r-BF
 for qemu-arm@nongnu.org; Mon, 13 Jul 2020 13:57:53 -0400
Received: by mail-wr1-x432.google.com with SMTP id f7so17564636wrw.1
 for <qemu-arm@nongnu.org>; Mon, 13 Jul 2020 10:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AkELVoYEVE6BfnfMYte+uiKJiz/kf50c60t3vfodgLM=;
 b=eHSAPKljbrx+AVNzlmor6md8M1C+d02d8wJzmj021KZuSRM2WNbtTLJ17UsVKHkDXM
 AaYeNXTQynLd/w3V0VfVOWw2IZcdwRvGuKDCel6KRXxjS2KAsgVwtSsX5EvQQCzTT8pz
 nlmpcWo3+z4krRkyBokqEmW4sob/E+ukGZ/vsSApbQGGySiP8p6qox0uwaBCuBiVf69t
 6wLfH9hqAsIwrZ77BB4e1JMXzxp5WenZFKaf2h9+2Z8f5+nxv9Gtk8BMGw+/kT44rrCr
 rnfb7rj8yBYE0RtSGaIkmcfjN6FJ+GsojUcT768O10NGEgHDecfo9pTYr2Nq9bh0Hvz4
 79eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AkELVoYEVE6BfnfMYte+uiKJiz/kf50c60t3vfodgLM=;
 b=NRfoNjufwhuOfBRgrxqVJhPoct0kqb0X+TqJGT1PjOjEkPwdm9Du8i0kSa1lGuVzY4
 fOoennn7fHDSdnre/GVzgDwWf5ovdEFKcNr7MJTZsxtV5KspKh9QCvzEED7c2abOPOa1
 PdoMZhfF0Mvv1JyAdVeqRGbwc6IiJTwWLxKxblEiz09XaRukY5TT2IasBSmFmH1ti73D
 2Dy6mvOoqX4CHLw7t2Ib5V0bPLzgLEK+j8TLmw3k/GsG/sdooalXa9HOmpQr7rJb65w6
 NPhPTokqXjyEj2dZ7QvE762lvtQPf/B95VFUe/i+2H96dCfunPb9vfv4UVoEovdmi6ts
 MvLQ==
X-Gm-Message-State: AOAM531eMiOn7VqdLuvSAYyjwjFxc/i4LuT4XKPsfQJXRj2p+iTsezz2
 R0ep02t0nijPeyMtZ7OjVKU17258nvYfqg==
X-Received: by 2002:a5d:4591:: with SMTP id p17mr581117wrq.343.1594663070726; 
 Mon, 13 Jul 2020 10:57:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j4sm25723721wrp.51.2020.07.13.10.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 10:57:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1 2/4] docs/system: Briefly document collie board
Date: Mon, 13 Jul 2020 18:57:44 +0100
Message-Id: <20200713175746.5936-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200713175746.5936-1-peter.maydell@linaro.org>
References: <20200713175746.5936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gj/l2ngu4n1K

Add skeletal documentation of the collie board.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/collie.rst | 16 ++++++++++++++++
 docs/system/target-arm.rst |  1 +
 MAINTAINERS                |  1 +
 3 files changed, 18 insertions(+)
 create mode 100644 docs/system/arm/collie.rst

diff --git a/docs/system/arm/collie.rst b/docs/system/arm/collie.rst
new file mode 100644
index 00000000000..9f8dbcad25d
--- /dev/null
+++ b/docs/system/arm/collie.rst
@@ -0,0 +1,16 @@
+Sharp Zaurus SL-5500 (``collie``)
+=================================
+
+This machine is a model of the Sharp Zaurus SL-5500, which is
+based on the StrongARM SA1110.
+
+Implemented devices:
+
+ * Flash
+ * Interrupt controller
+ * Timer
+ * RTC
+ * GPIO
+ * Peripheral Pin Controller (PPC)
+ * UARTs
+ * Synchronous Serial Ports (SSP)
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 8fa51a22817..376c18f0b17 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -88,6 +88,7 @@ undocumented; you can get a complete list by running
    arm/orangepi
    arm/palm
    arm/xscale
+   arm/collie
    arm/sx1
    arm/stellaris
 
diff --git a/MAINTAINERS b/MAINTAINERS
index 0f578040b99..048b2d41729 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -845,6 +845,7 @@ L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/collie.c
 F: hw/arm/strongarm*
+F: docs/system/arm/collie.rst
 
 Stellaris
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.20.1

