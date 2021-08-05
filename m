Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp518035lff;
        Thu, 5 Aug 2021 00:31:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJypDlwQSw7AmKnx4lB9L4MjnZXZMR9gv+wL1ZpRVGkUT9stB2AVop8zPx0rtKsZ/Sqv4oT1
X-Received: by 2002:ad4:530b:: with SMTP id y11mr3815609qvr.36.1628148688308;
        Thu, 05 Aug 2021 00:31:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628148688; cv=none;
        d=google.com; s=arc-20160816;
        b=i3cp0tFa73te7bsowuXIIlVLI2pGvNbPFRRq7BedC0onDL/gHuIG8XZO618WxGAcOS
         svntJv5HBgUs4ToWwW7khFX7SfnzCVG8LGMvaEHw3pZreJREZ5FmmEGVcuu0/kWl8ZcU
         vDs+H1b06u9RLGQUgTCvi5jCr2dNtWSr9qHWSSi3apeAbXhbIJij4rLNynk0Y3a5xoV4
         +k7M6PbkmPmStkCb5TNXuJ2ZIQpK2G6iJUk5AieQDXUXLoYABTDBJxsZODYpoqBY8EwJ
         vITvCFsahltmk5zr317RBWRl/oVLUrX2ahYf2+9gG7GIhM0KTqTPOxKED88ZboHSg6/s
         DFiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :ironport-sdr;
        bh=CdSAhGn6HKVmxL7c3+LP2uE0x1jmS2CEEs40SKy86Cg=;
        b=cm7QOFjqvWs/W5wFcKP4qXQ2N1Mohe4NRoNgVmHLr3Tmd2wRWPH6DAsu+B9/V2M20h
         B9mIExjPDQx7BdD4rH/sgd5QnLushoMZj+XcFQzcp1Mfikca9Fo3yogZTERMiJfeTuMg
         9WjLYHXu0vn1UC9ODsCrQ8XB33udOVIiJOts7raz8SXQtNXLF6D7SE6gE8HUGHZSZ1BD
         /Trp1np/sOMndQGS6JmMftC4i7IbBBv72eDgpzz49igAPcgac+unsb3avFVEe47ZVwZX
         MoM5ZQ43ILPx66qlWF0RFyxAJ6w+Dj2a+ZkgMwOjTjPF2LJ+WbYj6+vhaS0T4qAd1fgj
         7oRw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f26si3407935qkm.239.2021.08.05.00.31.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Aug 2021 00:31:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=fujitsu.com
Received: from localhost ([::1]:47298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mBXqh-00030U-BG
	for alex.bennee@linaro.org; Thu, 05 Aug 2021 03:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mBXqF-0002nH-89; Thu, 05 Aug 2021 03:30:59 -0400
Received: from esa4.hc1455-7.c3s2.iphmx.com ([68.232.139.117]:21527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ishii.shuuichir@fujitsu.com>)
 id 1mBXqD-00048Q-8K; Thu, 05 Aug 2021 03:30:59 -0400
IronPort-SDR: VEchjHVpUwrjDwg6yU71jlMCzRh8bDNeFVCnbqYY5S3XReIkaHB9VLzxcGz9n33VmjJ7UK2D86
 ge5nRGdvV1/+Kst/uWJNZfDpRnaHDP+5st6fyfhrRDc/hPesS7KlYDcuN/Yjqpu35D8S760/su
 rtrlrDlue3wnHeoPv4ko9qg8C7aADHs7gZLUy7ibHQMw76pCl/1niIf0Woox+GlkAZrzU2hSlI
 pmOVtpLAHQM2LfM1SpXPAahyoUVg2LNa4Pw7iEdlMVZ60MRKB3qRS7LSBfTeqeD73mMtFbRYKI
 XPiKutoch6wviC4ZNz4AdRJK
X-IronPort-AV: E=McAfee;i="6200,9189,10066"; a="39050101"
X-IronPort-AV: E=Sophos;i="5.84,296,1620658800"; d="scan'208";a="39050101"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
 by esa4.hc1455-7.c3s2.iphmx.com with ESMTP; 05 Aug 2021 16:30:54 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com
 [192.168.87.61])
 by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id BEEA1E6806;
 Thu,  5 Aug 2021 16:30:53 +0900 (JST)
Received: from yto-om2.fujitsu.com (yto-om2.o.css.fujitsu.com [10.128.89.163])
 by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DCF1A166AE8;
 Thu,  5 Aug 2021 16:30:52 +0900 (JST)
Received: from localhost.localdomain (n3235113.np.ts.nmh.cs.fujitsu.co.jp
 [10.123.235.113])
 by yto-om2.fujitsu.com (Postfix) with ESMTP id A4613400C23B9;
 Thu,  5 Aug 2021 16:30:52 +0900 (JST)
From: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
To: peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] hw/arm/virt: target-arm: Add A64FX processor support
 to virt machine
Date: Thu,  5 Aug 2021 16:30:44 +0900
Message-Id: <20210805073045.916622-3-ishii.shuuichir@fujitsu.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210805073045.916622-1-ishii.shuuichir@fujitsu.com>
References: <20210805073045.916622-1-ishii.shuuichir@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
Received-SPF: pass client-ip=68.232.139.117;
 envelope-from=ishii.shuuichir@fujitsu.com; helo=esa4.hc1455-7.c3s2.iphmx.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: ishii.shuuichir@fujitsu.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q4qSCBYmWrLY

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
index 81eda46b0b..10286d3fd6 100644
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

