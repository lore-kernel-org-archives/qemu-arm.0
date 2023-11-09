Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp421607ejq;
        Thu, 9 Nov 2023 04:03:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjEtcKjOCnaK4XkcfCeXbBLFC2ApIXLnyeO4btwRFXMrpBd6axVGIh7eXKkRpewp8mjbwH
X-Received: by 2002:a05:622a:391:b0:41c:e161:c99a with SMTP id j17-20020a05622a039100b0041ce161c99amr4716721qtx.56.1699531386163;
        Thu, 09 Nov 2023 04:03:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699531386; cv=none;
        d=google.com; s=arc-20160816;
        b=dpMBER5PX3q8zlkDxRyWufCT6nHB4aKwfrCNS03qxGr1rcUvvHKEzmwLKU+kO9R++F
         n8iZRSfOint8GlXOUDh4izWeNK66ccJbKbgUwGYookn9et3QPFieRKKE/EEYNIKg51Ey
         ht5ziLdlSuzjKoIwMWAcWj9f+x2ttyEm1SfqE8ooeqUejItI+5rA/rZztPFh2hm87jtn
         gdDEX3tBMCNRy4M5NN9M+/p8iOtRDWlMZWYR96SSsxBCX1vaOuSvN7uirHMXya3cCOh9
         kyNS8BpNlfonpsrSl7Pf/iZwDgtzk7lmc+spHnc9Gids2C4PWZv1J7TBXY3SmhiR3T8r
         PZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u0btM2WWaJKjKQYJvekiZA4WbW7emUtKHEM5PFu/p84=;
        fh=XXTqp7I/ZopGESMqPTGv21gDwtcYq9110wvl4OBJkjE=;
        b=Tlrdg44f/7SXw8HArgMIjnSlmu3Bow2KCl/3pvyhMf84vOfpN5lkWeoC1+T06lNEe9
         viM9TWui/RUiw7cVZ017UJ4lnBC/P3d1Usp1O00HjPtZ8fdgYyQ2N1rdz4tflmAIwTxP
         CorPT4APW897Eg/UlgIi8RRRPWyWZmrq/xSPYoyydCeRgH0ZmVii6wsGv0NyzjSCsysV
         CJwG2vrA3FXr11ZW4nxAioeHJ3AbBbUc+KGQwQG+DVsh/xw1ggY+eJ5hRPfGagHkc/k+
         7+9Vk+CV3EzlAAKi3hRK6QPmuRpGPDhENjMJ8WmrwS2sLpyDT6b1HCh2DdmRwX1zwUJN
         fVQg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=GZWxwWI5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5-20020a05622a134500b0041e3fe0dec3si2882771qtk.738.2023.11.09.04.03.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Nov 2023 04:03:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=GZWxwWI5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r13k9-0003Hf-Up; Thu, 09 Nov 2023 07:02:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1r13jv-0002vh-Oh; Thu, 09 Nov 2023 07:02:29 -0500
Received: from mgamail.intel.com ([192.55.52.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1r13jt-0001ej-3G; Thu, 09 Nov 2023 07:02:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699531345; x=1731067345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cUCPSSkRfmQWPToOtzwU716BqrqKL3tmwbY3XxblW/U=;
 b=GZWxwWI5UguJfpIDw9UHsPJ2GVWCzNdgUZdS6B3fG+t4G5sG7kH+vzf1
 5THlDmkYRtST5O8nmvsf9E4L5/p0gBXEOwDVidmBZhcembNWnfobI1Qd2
 QvZhf3AsylUqPEtFfJF0h0aDu66l979+JrnQTBSsk+fPEdQcY3RL6Qfsh
 MO8xkr6lDhUeK60u+IW9Vz1Vfopgou4Q9mJDzTJutbC8rM4jtF8Ihkk6d
 EPiB58r340xe52rw7bjmOW3vee7Cs94jUcpik+cI2rChwWFw3Qsa7R7Hg
 /wV8rtj82CCy5NdUV6AMevyNEghgPikd+EUZpSMitCWdSDmJVZ+l5rNlg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="369305907"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="369305907"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 04:02:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11516232"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.147])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 04:02:03 -0800
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, clg@redhat.com, jgg@nvidia.com,
 nicolinc@nvidia.com, joao.m.martins@oracle.com, eric.auger@redhat.com,
 peterx@redhat.com, jasowang@redhat.com, kevin.tian@intel.com,
 yi.l.liu@intel.com, yi.y.sun@intel.com, chao.p.peng@intel.com,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH v5 18/20] hw/arm: Activate IOMMUFD for virt machines
Date: Thu,  9 Nov 2023 19:45:27 +0800
Message-Id: <20231109114529.1904193-19-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109114529.1904193-1-zhenzhong.duan@intel.com>
References: <20231109114529.1904193-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.136;
 envelope-from=zhenzhong.duan@intel.com; helo=mgamail.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: DTFmsfiF3ve5

From: Cédric Le Goater <clg@redhat.com>

Signed-off-by: Cédric Le Goater <clg@redhat.com>
Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 3ada335a24..660f49db49 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -8,6 +8,7 @@ config ARM_VIRT
     imply TPM_TIS_SYSBUS
     imply TPM_TIS_I2C
     imply NVDIMM
+    imply IOMMUFD
     select ARM_GIC
     select ACPI
     select ARM_SMMUV3
-- 
2.34.1

