Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp2001006ejb;
        Wed, 21 Feb 2024 07:49:01 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXobc9azwHSNA4S8jyCVXlWQYMy2Htld+cExHbRwtKVZ/Bf9JWapHXfktJkKlDsXlB48/EdqGzwoCR3iCfYy5eaPkHP3O4N
X-Google-Smtp-Source: AGHT+IEKzxdgSp5FiMviDOvnleRfNY5j4Ndv2oPoQ/xktcGDAgGdM5c7dXGoyRcHeXgkEKo1tKsc
X-Received: by 2002:a05:620a:6213:b0:787:8102:d155 with SMTP id ou19-20020a05620a621300b007878102d155mr4309611qkn.66.1708530541667;
        Wed, 21 Feb 2024 07:49:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708530541; cv=none;
        d=google.com; s=arc-20160816;
        b=qS7pzIyEMEQdAw4ytwSzz5wv7szGJ6tzV0It31AqQjkmVxsOKZW40fHdrpGlBajmHO
         EdUekbKQsEJ1RXFHQS1F8edPy06UnT+LYvgtXrUp320EeLDf0uotEUgxojLpkIUH5PdU
         6wgZ+hXuojjc3wcMmvDql1umrnQs60EUijZQCapR5ewEZx7DFpYqavPaJuAccTYEuHi/
         2EVIdiOsAs8m8Ex7B4A8DM5rO1YQ75UsbHeInJaaV73nETu6AHi1Uohj1I4d06X+9ofK
         s3Gg9hAYdEJ9DdNnlsCBpciDh+umlBHH/+hU634H5di8jYb62CTc/jvd432LACfIZQd/
         B3FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=+1TSPqrmoenZSMCnIpSPwkWnJag3Brf8f5fdpRt8heY=;
        fh=7La06MPWnWIeY2syFASYiv5clJRkW0OVzImHIa97XCQ=;
        b=GZfCzNSSG2S4YQHnv8OS2rUHbYF9U4jKAVJ1KAJm5UZtXHG9NQ9Ad7gDNlnLpCe95B
         8tU5LJuxOZI4L0VEmOOaMmT1NUfDD9Fpr6vVao+itc+mnDL/mP7KlaxaJLGSlXWk/zDQ
         5m//CLwNvGtPmh53dl+SVXEUUlPKcMOogS32Wpz8DyZpai1SstpGG79+8Aa0kIpTVDW6
         yxDSDUBy5sH7NWlfZ7IakKvvSA4t0mFl6hcpLUw0r5LIQGTVvo0dcoZuTCDBQQFqnrMH
         zmlux2n91chC4Ite4qfvxZd/KSYYiLC2oO7ZHoDw4G16eSfxoRui0u9Bv/Uh+dPsydei
         taig==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q14-20020a05620a038e00b007877e194a54si3074508qkm.126.2024.02.21.07.49.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:49:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcobF-0003G9-09; Wed, 21 Feb 2024 10:33:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcoZF-0008PR-5I; Wed, 21 Feb 2024 10:31:29 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruanjinjie@huawei.com>)
 id 1rcmM0-0004sX-64; Wed, 21 Feb 2024 08:09:43 -0500
Received: from mail.maildlp.com (unknown [172.19.163.174])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4TfxQG4XgqzvVlL;
 Wed, 21 Feb 2024 21:07:34 +0800 (CST)
Received: from kwepemi500008.china.huawei.com (unknown [7.221.188.139])
 by mail.maildlp.com (Postfix) with ESMTPS id 26FE21404DB;
 Wed, 21 Feb 2024 21:09:37 +0800 (CST)
Received: from huawei.com (10.67.174.55) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 21 Feb
 2024 21:09:36 +0800
To: <peter.maydell@linaro.org>, <eduardo@habkost.net>,
 <marcel.apfelbaum@gmail.com>, <philmd@linaro.org>, <wangyanan55@huawei.com>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <ruanjinjie@huawei.com>
Subject: [RFC PATCH v2 18/22] hw/arm/virt: Add FEAT_GICv3_NMI feature support
 in virt GIC
Date: Wed, 21 Feb 2024 13:08:19 +0000
Message-ID: <20240221130823.677762-19-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221130823.677762-1-ruanjinjie@huawei.com>
References: <20240221130823.677762-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.174.55]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemi500008.china.huawei.com (7.221.188.139)
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=ruanjinjie@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jinjie Ruan <ruanjinjie@huawei.com>
From:  Jinjie Ruan via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: GQAOs9xhbO6C

Included support FEAT_GICv3_NMI feature as part of virt platform
GIC initialization.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 hw/arm/virt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index c442652d0f..0359dbd8bd 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -772,6 +772,8 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
         qdev_prop_set_array(vms->gic, "redist-region-count",
                             redist_region_count);
 
+        qdev_prop_set_bit(vms->gic, "has-nmi", true);
+
         if (!kvm_irqchip_in_kernel()) {
             if (vms->tcg_its) {
                 object_property_set_link(OBJECT(vms->gic), "sysmem",
-- 
2.34.1

