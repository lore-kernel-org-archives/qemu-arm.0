Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9088954lfc;
        Fri, 19 Feb 2021 07:04:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzF6xF1jKhuC9/HDKuIDyRJLOHrFbdXjMtGFabck2twhMXb0iORfPRzhqQ87QuvpwVWWNHo
X-Received: by 2002:ab0:6244:: with SMTP id p4mr7422717uao.128.1613747065188;
        Fri, 19 Feb 2021 07:04:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613747065; cv=none;
        d=google.com; s=arc-20160816;
        b=0TtGoKHdBtQIbwCvXex0NO7f2n5beiPc4So+pMqwmDY+ISZusNjia2xuM8C+JVENOC
         s4nBMLhGpQbjAnb/xm63oBYF/ZtTzuy3MqfCDafkOOmE/aAqWkuuS6cziOycEBGID+yh
         xUu2rPv5hODNuvsj8myvC9JVMSayFPOdMR3D2O3oWSVCjHQB3hKVfNknRPWGbw6t4alk
         NxjaJ9SAiiOKICkzK7VFCT+rV8o9d1A0gRJpqbuIJvTauriw8UPMdqWdshqiHqpBs8ee
         LE737O2bR8kRnzEcbarv6/VJUbbMjj+umbtIHaXAQH3tOkmbk5EIpBf84GqMIBuMOEH3
         Z0Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=LBypvgOw6fm7qnIXg35YZ3arVZ+jYOMAMlK4mBsw2Ys=;
        b=q15gENNcpSbG5VC70Sc0m4ltukkxdjfndmEAhupVqMSJck9CdG0sAsdoImAV2WDm+t
         soKa1HWLZjB/KAaJM4Taw94cJRsaquS14MEdP7fppTi6ajlOo1lP2RmaNouZ56fTCkAO
         t/svbMkpws5BrKULrZIl/z6bVpbeR1KX565kw20SPoHANgKErgli5Grk6HTj9Yv1AABj
         mCJbCNO2OcmZOeuNycenNgeF3AOYh7TUSQ3XF6memfkj38h/SFqV5kP2W8vny2KW02vT
         1CB8WQsjSTKACY0VIjElpyJYi8BydJyg3bP8Vb9fWVm1wDbGItPVEbKzGH82hB75kfO9
         Jkpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kxr/Sdly";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f41si2018772uae.125.2021.02.19.07.04.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 07:04:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="kxr/Sdly";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD7KS-0005ah-Cr
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 10:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73d-0002Sv-E8
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:01 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73E-0003Wc-8l
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:01 -0500
Received: by mail-wm1-x331.google.com with SMTP id x4so7881786wmi.3
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LBypvgOw6fm7qnIXg35YZ3arVZ+jYOMAMlK4mBsw2Ys=;
 b=kxr/SdlydYAojHtL4F9wtQKTtQsLQH589tOfhDQueOiCAhKw6TOVVGxvvjHtiOl/ul
 /GYQusT4i74aMfYzIcFBVOFfHtlBmlo4eHUByJPb7wZ66XA0cR3g22ZQcp1M9nE+dWWp
 dl1PndOKMYXOfYZB5fm6c5k6djsOox8lZhJAa4uICh7NhEjzEKU0frq6VfMB8ZKImapl
 L5d0HflBVjqO2rxTxE5k0g5BGCPYQa6K8BUtdt+AwOosaQagDisXq0sfNWZoXKAc47K3
 hqPSYiDwxc1lNX2FMrqU+F0Zl4mH1izrattVGZVi+XSFHXQFtCkKERVEh/qiZ9y+/Bil
 08CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LBypvgOw6fm7qnIXg35YZ3arVZ+jYOMAMlK4mBsw2Ys=;
 b=atU6GmWT16WPbytpqvJEgUPP/4yB0syALByAusFOhrrsYwxflpwNDSi22dhTOmuDrw
 +vz6P5wl8L8aWSWpAKdM1xl+IJlWWiUAainjTPcJrPNZMK63F29nJlg/ZlPxCWp4GWE2
 SxkGq4XicuNp/XlYm5btvB5acub0NYpHU2CMyu3WC2um9MtyblvT7UCSiWmXC/nyeRTe
 wY/VRYMwfQn9ME7N9OUZjRHq2wKNkogcvhF6UlSYVp+dbE1QvMgZaXYlLSAwsIcCeqYU
 YJBLvztu4Al0kH0KMDZOGFEy7IgFmMfu7LLhuWafZAVWZ8RO5haoaVZURD48aT6HfA63
 W5Mw==
X-Gm-Message-State: AOAM533TSdJde08szUUJE86meg+xHMmO/EJzD2+NsYNwK45f+2fej77u
 1IanR06YKBn3mQ5k352GjynuT9iwCLq32w==
X-Received: by 2002:a7b:ce95:: with SMTP id q21mr8497047wmj.178.1613745994743; 
 Fri, 19 Feb 2021 06:46:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:34 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 19/44] hw/arm/Kconfig: Move ARMSSE_CPUID and ARMSSE_MHU
 stanzas to hw/misc
Date: Fri, 19 Feb 2021 14:45:52 +0000
Message-Id: <20210219144617.4782-20-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oG3vqRN7U0CF

The ARMSSE_CPUID and ARMSSE_MHU Kconfig stanzas are for the devices
implmemented by hw/misc/cpuid.c and hw/misc/armsse-mhu.c.  Move them
to hw/misc/Kconfig where they belong.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/Kconfig  | 6 ------
 hw/misc/Kconfig | 6 ++++++
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index ed007267a91..0492b212840 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -521,9 +521,3 @@ config ARMSSE
     select UNIMP
     select SSE_COUNTER
     select SSE_TIMER
-
-config ARMSSE_CPUID
-    bool
-
-config ARMSSE_MHU
-    bool
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index 19c216f3efb..16b96e4dafb 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -2,6 +2,12 @@ config APPLESMC
     bool
     depends on ISA_BUS
 
+config ARMSSE_CPUID
+    bool
+
+config ARMSSE_MHU
+    bool
+
 config MAX111X
     bool
 
-- 
2.20.1

