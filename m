Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp3507740lfm;
        Mon, 13 Jul 2020 10:59:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW+O9Ef50jW3tIATIzFsOJwoXbqCnJoh8ptW2IqBBzwA5G1XvAh3onHUmcsd7Gsh1qAkIL
X-Received: by 2002:a25:d1c6:: with SMTP id i189mr1795454ybg.497.1594663181648;
        Mon, 13 Jul 2020 10:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594663181; cv=none;
        d=google.com; s=arc-20160816;
        b=BbvdJbvXv4X66MNLgUhRpHcSGWMjMBBwk8R4k3OyHs498QcTk9qM0r72D0dFD2t68z
         Odupv73cQmhapDgxmqixemu1aaIZH7EYSpTEMyS9eaZy9onJqyIiocr7bRMPSe3ZTS7f
         8ps4tMAivfi8PsDrQYShaU4vNmmHEenGbk1LkHzkdgATpEvvK/xZqOI7+xT/7u2zWv0w
         07fq3AnNp4MOPYaGeMZsKvtGIjGtrKdopoUtfwYY5qiZ2yeCMk1oQqa6x5mstrzv3Ud2
         IFr++HCKGExvIvWCAkA2LXKKP5iX31VTW/+5QXq7qQ/v+jFaeup9ZwKfzfxNUOQhXXY9
         fRFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=WLE5QjsRSrJvisCuXokX+hOkSwZThvQnwc57RN/mAWs=;
        b=NAZQS/vmS6fAySbHfCvaRw/A5SiY6JwmWpuMTXS+k9Sd5l5hfUwsBEyLREuCkDvRP0
         nm/vtVMJJi+h8/uATzYD9HgUSSVWFN7TrZ4AHWnCiFgfN8f+yG5bAT+luaW5sAJfPwf7
         l+UrelXsTsE2NpZPL527Fo9x073QJMl5Ysx/vmHY9wvdvX7dmgW77bs18RvxoKYhtduy
         weAMHJD8oSckHjSk9vHcq2IbBQfBTc5IC8x3KtoEcbeHCviziQ0qXZVeYJhoTqhbg6RO
         j9y05u3qZ2RISPmfQioseUbf+80CVOF03VcXOWnYK7MNkYBMsau23K9Rf3z6wdqgO6ET
         BPUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lK+5vGuT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si9124589ybj.189.2020.07.13.10.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Jul 2020 10:59:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lK+5vGuT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jv2jt-00042h-1g
	for alex.bennee@linaro.org; Mon, 13 Jul 2020 13:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jv2iA-00028x-Lx
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 13:57:54 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:42092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jv2i9-000851-1N
 for qemu-devel@nongnu.org; Mon, 13 Jul 2020 13:57:54 -0400
Received: by mail-wr1-x42a.google.com with SMTP id o11so17583115wrv.9
 for <qemu-devel@nongnu.org>; Mon, 13 Jul 2020 10:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WLE5QjsRSrJvisCuXokX+hOkSwZThvQnwc57RN/mAWs=;
 b=lK+5vGuTqg809IJL94LWpINZKwFewVjTIbjgd3jhARq6kz9qNroCZkLuEMKaIvIcRJ
 L+unQYZ1ws5ahHLLbBYRI7EvJH6Eyl8RS6ojyQZD/6nPPF/YcuvKafuLnI7y0eQXncUe
 cq2YjxDeECGpAw8xViV6LCYrS9WNWTGdrCbg8qskyYmIRV28DcTevGsxOQXxt04avOTD
 Dviqy4dXkzTA+HYjm5lUWWD7UVp6C8VaaOAWmZhlbtXZLotq30LTKbpKvAjZsJNYtDN5
 Qz+JkkrFW05pa2zive5Rldgf+pYOn63kFdzIzGQa/BoFa5veaWr63m1uVpNDkvkzH1Zx
 VnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WLE5QjsRSrJvisCuXokX+hOkSwZThvQnwc57RN/mAWs=;
 b=Zna99uBcH2qd6kdTVfkqPBS0fVINfSPpZzvnxwhDTFpg42wrPQLvXse/QNt6GFFK2+
 59T8YaYOAAKW2BuhIimeyn9zMCbE7GHcDqwAiJB2Z/CkxZmCdQa7O9kWvuHk4IyyRwIB
 iMnPRZu4PWpirPDkT9zGWp2o4P5u9odwU8NJPkQi/EepCgJu1gAr/1cNB4UCFTnq+5ki
 DR8rLRB9l3llEy5tyHtt6rfapnIbSayK6zBJBMjAh7IQQdjcYgn5j/VkBTdhy8DP0HkJ
 12goxYCBBYRV3aCUMqJrzsSgeABoPtCyEf9t9dUhnIKGMGmhT/MnKAGFpouKw5irM54u
 ygQA==
X-Gm-Message-State: AOAM530iYadqF0WAj59/3mmOPPqEUEywLMT0AfhH4vj4aNsy2/j3NI6F
 JfFBZR1RdQQNk2D4OIm6vj3gNCU32ezRVw==
X-Received: by 2002:adf:e50a:: with SMTP id j10mr637018wrm.71.1594663071746;
 Mon, 13 Jul 2020 10:57:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j4sm25723721wrp.51.2020.07.13.10.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 10:57:51 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.1 3/4] docs/system: Briefly document gumstix boards
Date: Mon, 13 Jul 2020 18:57:45 +0100
Message-Id: <20200713175746.5936-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200713175746.5936-1-peter.maydell@linaro.org>
References: <20200713175746.5936-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: Vdrl59fPRs4+

Add skeletal documentation of the gumstix boards
('connex' and 'verdex').

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/gumstix.rst | 21 +++++++++++++++++++++
 docs/system/target-arm.rst  |  1 +
 MAINTAINERS                 |  1 +
 3 files changed, 23 insertions(+)
 create mode 100644 docs/system/arm/gumstix.rst

diff --git a/docs/system/arm/gumstix.rst b/docs/system/arm/gumstix.rst
new file mode 100644
index 00000000000..805e0f8d5df
--- /dev/null
+++ b/docs/system/arm/gumstix.rst
@@ -0,0 +1,21 @@
+Gumstix Connex and Verdex (``connex``, ``verdex``)
+==================================================
+
+These machines model the Gumstix Connex and Verdex boards.
+The Connex has a PXA255 CPU and the Verdex has a PXA270.
+
+Implemented devices:
+
+ * Flash
+ * SMC91C111 ethernet
+ * Interrupt controller
+ * DMA
+ * Timer
+ * GPIO
+ * MMC/SD card
+ * FIR
+ * LCDC
+ * SSP
+ * PC Card sockets
+ * I2C
+ * I2S
diff --git a/docs/system/target-arm.rst b/docs/system/target-arm.rst
index 376c18f0b17..163ab915592 100644
--- a/docs/system/target-arm.rst
+++ b/docs/system/target-arm.rst
@@ -84,6 +84,7 @@ undocumented; you can get a complete list by running
    arm/aspeed
    arm/digic
    arm/musicpal
+   arm/gumstix
    arm/nseries
    arm/orangepi
    arm/palm
diff --git a/MAINTAINERS b/MAINTAINERS
index 048b2d41729..286b076da89 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -650,6 +650,7 @@ R: Philippe Mathieu-Daudé <f4bug@amsat.org>
 L: qemu-arm@nongnu.org
 S: Odd Fixes
 F: hw/arm/gumstix.c
+F: docs/system/arm/gumstix.rst
 
 i.MX25 PDK
 M: Peter Maydell <peter.maydell@linaro.org>
-- 
2.20.1

