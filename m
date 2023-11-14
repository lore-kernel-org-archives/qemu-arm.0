Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1939636ejc;
        Tue, 14 Nov 2023 02:30:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4Kvk0sIfi11JtekOCLACu+yEHX8g6yTZsPyT+jM+4gISDP6CqFRnWdhu2k4lZtztHIPtk
X-Received: by 2002:a0d:e605:0:b0:5a7:d938:c5e2 with SMTP id p5-20020a0de605000000b005a7d938c5e2mr7876610ywe.14.1699957831091;
        Tue, 14 Nov 2023 02:30:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699957831; cv=none;
        d=google.com; s=arc-20160816;
        b=DOStP2+QGlHo6C+rzZVtun79ZiXVq64vFXDapeEqsUYaXSc2C763U9P0imCojWg8Hb
         eE6rsfNeBkg+qdMXQfUhIg1QOjT2M//CDQ//3ePeTmr5zX0lT3SzdKuI33nF5YRmHjHu
         wv0kYr21LTcI+dSd2WdmG3zJDuYQfdynnbGk0n0fLcGqHejQnzj+ExwmpM9rTCtRpodx
         IDEMXCLDasPzlHbYDb0b2vESOPKfOUBughKXlpqAXRJSXITuUWLU1zTUccukVB7pme6V
         +5H2Zv/n1WQwzuRr5V1tUeAqO/L4Xghwrh45mRxjFpl2FXHBw6RfagMlq7DEGM+sFc8m
         7ptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=u0btM2WWaJKjKQYJvekiZA4WbW7emUtKHEM5PFu/p84=;
        fh=XXTqp7I/ZopGESMqPTGv21gDwtcYq9110wvl4OBJkjE=;
        b=w+ci6Mx9+qzMmiJ/mmcFYhcKlCZJWKwfuRBfPwB1fweB7l6lDHwnorasYC8EPiqGZT
         X5RZYfE8TDz+A3mDq+35h1trevh+noxdR8DeD2v8jmYpCcvrtWjYR7uHR/wDIYEyM+7W
         zKtkP1qf80tmLaeDq99grMFZvIEHkYvRqQpqC0HN/lh9rnkhXS0qaVgxf0P+QsQqyLvb
         cCEqmmVrUE3pllrEsV8qHoN1+/2Svx5Uo8+ScLpgwwWbVQS7mhp04GBsfhInTM4/e7+3
         OGg0bElK+rtsGrGGYDg3c7RMtWsnEXWwLOPHhDnD+mgtgqMhrNiteJbtuYpyYIDQ+PQB
         Tpuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=OEcQMlwg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ez8-20020ad45908000000b00677a19a7d62si6197083qvb.459.2023.11.14.02.30.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 02:30:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=OEcQMlwg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2qdI-0005GO-6B; Tue, 14 Nov 2023 05:27:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1r2qdG-00058p-Er; Tue, 14 Nov 2023 05:26:58 -0500
Received: from mgamail.intel.com ([134.134.136.65])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1r2qdE-0007jy-Te; Tue, 14 Nov 2023 05:26:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699957616; x=1731493616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cUCPSSkRfmQWPToOtzwU716BqrqKL3tmwbY3XxblW/U=;
 b=OEcQMlwg9lNYExsaqJPiDsMZTjUuZ+9SDt/H7ovBFqelwgA2c+vgMafu
 OZwUm9Jy5ozDPyt0tD1vDVES/O+a8wzzTQspX1o03U15BrF/pOlMFJFFH
 Wq/zxIlCZkNcj2vobOL76BjJozM+F24DjrpT/e20IhMImiGPAMz0Ytoe9
 Y1HU7W+efa/qu0IcMFRHo51OMwsFGMxUEgvwEqXJMAKsnsUcVQU2+mTeS
 IOIcwAQdrjR4uB6fC4qN+JD8zdms72TeDrPBMCqsya0y7r94cse4ymGCA
 5hHKdMWkbVFQnmGCW2TGiLdGe3gV6mni5k5ScSFoHEDoSQGamKDIFcng6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="394543712"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="394543712"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 02:26:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="888213207"
X-IronPort-AV: E=Sophos;i="6.03,301,1694761200"; d="scan'208";a="888213207"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 02:26:50 -0800
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
Subject: [PATCH v6 19/21] hw/arm: Activate IOMMUFD for virt machines
Date: Tue, 14 Nov 2023 18:09:53 +0800
Message-Id: <20231114100955.1961974-20-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231114100955.1961974-1-zhenzhong.duan@intel.com>
References: <20231114100955.1961974-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65;
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
X-TUID: h+IbIc8a/0lK

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

