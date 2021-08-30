Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3873870lfb;
        Mon, 30 Aug 2021 01:30:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDFM70nA9PJOwTATs/EmWxWpvUoN/O2ZHjstmjBSaicjorW+SXkOFNp3lw7BmS64iCyviH
X-Received: by 2002:a25:5689:: with SMTP id k131mr22681578ybb.36.1630312245774;
        Mon, 30 Aug 2021 01:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630312245; cv=none;
        d=google.com; s=arc-20160816;
        b=EdZ8O5XVsQmy5TQkpluWdxW1I1IlrIr4i0abc7z1be0y/hjENkcxNHI2w7/yoxRbvX
         3mI6OXf9M84gzvPXZ7eYlRV6c0AzbxlT3unq5m2YOCd5XZWxYjPF/otwqsDPgBxpEKiB
         UbweJJ5EEFgAzsWB0o1082fcGjilh9l+1yvling8djP45/RCUe+ipC1yTKisUjyqc5Na
         iehbfbPb9Ib/UQVz4+mGr3T2Z/zumlQifuxvKeyD0wCBVmZFUtbFsBnab+dmLUk4L9M2
         Zh1/yvAKWhVVJ8JGmEQdxcHjiVwRGD3H2nFiRegUsFyikf9MBIgDs5p+iok6E2JPjPBz
         R6eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :ironport-sdr;
        bh=+gWELxzWBd04gnjMf9J2znwJgnFyg+bUHzRbmhl+8ss=;
        b=H4r2rfBeERt6TpyBDgIQTVOSM0IkYQktSO2acezvl6ok+IK+MMYxEedXiOIXbkaTQN
         5Te8V05WNN504mD8dU7Bdqp2k6UUK0BJ+lZfFMXrPWcJeiTu1vyw7nIC1dR4aNIpq2Ab
         CeskCdCvLORk5PRuXA56/uETPH/bjhJoqk7PDu9Re4v4DZWPVLHuNeInVEfQRWOf3w7S
         /9uKSkDxNvB5IwRvdrMuBFUa7MgYW3shuTFOBOzYPhMlHkQpuklWqujnrTukq8la3RRt
         2ncjaqXBeF5Riv85r3480dlJsSdzCXahQkrHe8GkCi1w/VXrIUJq/AfuP1pDq18aGzJd
         viGw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7si12918809ybc.95.2021.08.30.01.30.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Aug 2021 01:30:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Received: from localhost ([::1]:35372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mKcgn-0001xf-1M
	for alex.bennee@linaro.org; Mon, 30 Aug 2021 04:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKcef-0005jA-Lj; Mon, 30 Aug 2021 04:28:33 -0400
Received: from esa8.hc1455-7.c3s2.iphmx.com ([139.138.61.253]:46844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mKced-0000sm-VV; Mon, 30 Aug 2021 04:28:33 -0400
IronPort-SDR: QkU9eZXq4F8Uty1t7g7M/Fq6w6zxCUSZV+wQDZK+aaklBSH9fQoxlCxyXoDmap+ZZuaYuMRilw
 qOXojqBj+piyp9Al+tsrff/+UR90qOnKt1vKq+pAytU6Dv47cS5pv+D4dDPS+bzwbu4OurYuX9
 KRwIheKuNbPzHk/DMzFrgO2sAectJn4YV0ROfeQjCT+tFpOksAhTs8imzPsY3xsWAsQo0J37t3
 Moc/BlBz4AnQuG9G0eTmEzkzRNedJvakNfCNylWkC9/vIH47p7fT1qW7G835FAkJh1psJauJGN
 kfeJ2wMkBmxF4mWbVIvCxcgl
X-IronPort-AV: E=McAfee;i="6200,9189,10091"; a="30216397"
X-IronPort-AV: E=Sophos;i="5.84,362,1620658800"; d="scan'208";a="30216397"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
 by esa8.hc1455-7.c3s2.iphmx.com with ESMTP; 30 Aug 2021 17:28:28 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com
 [192.168.83.65])
 by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 91D606DAAA;
 Mon, 30 Aug 2021 17:28:27 +0900 (JST)
Received: from yto-om2.fujitsu.com (yto-om2.o.css.fujitsu.com [10.128.89.163])
 by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D1DEDC5545;
 Mon, 30 Aug 2021 17:28:26 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by yto-om2.fujitsu.com (Postfix) with ESMTP id A8B444006D7E3;
 Mon, 30 Aug 2021 17:28:26 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	drjones@redhat.com,
	qemu-arm@nongnu.org
Subject: [PATCH v5 2/3] hw/arm/virt: target-arm: Add A64FX processor support
 to virt machine
Date: Mon, 30 Aug 2021 17:28:19 +0900
Message-Id: <20210830082820.2690275-3-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210830082820.2690275-1-ishii.shuuichir@fujitsu.com>
References: <20210830082820.2690275-1-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Received-SPF: neutral client-ip=139.138.61.253;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa8.hc1455-7.c3s2.iphmx.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_NEUTRAL=0.779 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, ishii.shuuichir@fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J7yr83Nc7gWq

Add -cpu a64fx to use A64FX processor when -machine virt option is specified.
In addition, add a64fx to the Supported guest CPU types in the virt.rst document.

Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
---
 docs/system/arm/virt.rst | 1 +
 hw/arm/virt.c            | 1 +
 2 files changed, 2 insertions(+)

diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
index 59acf0eeaf..850787495b 100644
--- a/docs/system/arm/virt.rst
+++ b/docs/system/arm/virt.rst
@@ -55,6 +55,7 @@ Supported guest CPU types:
 - ``cortex-a53`` (64-bit)
 - ``cortex-a57`` (64-bit)
 - ``cortex-a72`` (64-bit)
+- ``a64fx`` (64-bit)
 - ``host`` (with KVM only)
 - ``max`` (same as ``host`` for KVM; best possible emulation with TCG)
 
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 86c8a4ca3d..3fa4295a78 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -200,6 +200,7 @@ static const char *valid_cpus[] = {
     ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
+    ARM_CPU_TYPE_NAME("a64fx"),
     ARM_CPU_TYPE_NAME("host"),
     ARM_CPU_TYPE_NAME("max"),
 };
-- 
2.27.0

