Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1989027ejb;
        Wed, 21 Feb 2024 07:27:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXRsAlEvfP8SAaaehVjytVh9ecb2hD3GtHJ3cgYJabs08pakFP62zTAdQt/giMMpbjNoOigCJFMsKwSRdQ0EP0vI32ih+ES
X-Google-Smtp-Source: AGHT+IF01S556UHLAFlsdHr/MpS6ap5OUxTSbtCyGOwYT5FQvbohqQLUfBqf0sMmzrrjsGyZRf5m
X-Received: by 2002:a0c:f28e:0:b0:68f:359a:896e with SMTP id k14-20020a0cf28e000000b0068f359a896emr16620519qvl.12.1708529266103;
        Wed, 21 Feb 2024 07:27:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708529266; cv=none;
        d=google.com; s=arc-20160816;
        b=pVsKTGc2Ao7hH4ZaJqLm/j/a4ryDpAiQkS+8Gq4AIVk7iDtsaMw+ecxFnxVHWYWfA8
         J+94piUXDZEQT/tFU5923qxmY/ll3tafywmIFydOTTgjfij6n2kQnW+6KTfQTEUdvAIP
         5oLV6q0U5KBJLAK3pE2QM0+FvL8/VjANU69D3Pt1JoAUjq5BCLIgwbbrmpE5yRtrOa79
         OaCsWd8ot2F1H07Q/jgM/6cfvKJkZPGL5Clmrrnw9OPbSaNiq6F45NMw3L6gPaU0MbAT
         eWBBVz1EB4R2ayZeeLEYBs6WxERTrsCdr9iM6blbA4MMlPT08nyDbLTJTgi2OPs9oPW0
         hndg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0KrzykK9rIYlGOb6kgXRZw47rsL7xJgfl4m1kluFJCw=;
        fh=+pN+adOfj/Uj5T0Q5e2iLNDTjc6H0b5DJs2vk+l2vdY=;
        b=jCK+ElNizJ20wwavU+lB63psixNxK1obHFVRxDmM9oKj3zpT8bqQcb1uWZmpIwgi+2
         9Mg4+exu8+EjJBpLMY6Q3UrleMKz/BWqAPzm44dWp6mVrYnfPLs8tWd6+I0IEBCSZZCF
         QaM2kLzHGWxCWtO/l+Ti5EPC5vpmZ12IXPqXFS9m52BDayn1w2MCPTAwei+wi7kmDJEM
         3g6D2dijG9xj9NhlTlSyTNnk84RtWNJSz/bxKTTkqiW+A38aF2Ib8Bad0BlvEVpeCeBN
         fmondIPvoJ5wg76RSI77FApote93jnB4VhQh2/Y62XLTP4L1Iv06SpH8nz56XjqxJjbv
         YrBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=EOBCpg12;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q6-20020a05621419e600b0068f0da24fd3si10869053qvc.180.2024.02.21.07.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:27:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=EOBCpg12;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcoRf-0002a7-37; Wed, 21 Feb 2024 10:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rcoMB-00010D-NE; Wed, 21 Feb 2024 10:18:03 -0500
Received: from mgamail.intel.com ([192.198.163.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rcivO-0003QN-AA; Wed, 21 Feb 2024 04:30:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708507798; x=1740043798;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VNYif1DuF2iQQ25QqXbq+p9RIEwtI/6uC3Ysh65wYQs=;
 b=EOBCpg12uNPPsNAtFP43gQkOBNl4aCRUwutfLrwIMn2vIm4MmCauKmo1
 j2qw/issduOBJPwu4qdH3v3xbbmyR0qHwrspP9hiJTdafENwOFnLGKhuG
 YhfRhB/9ubvEF6HMKQQVD0Ve1212xT6wkZZ8Hm2OlnFMfphAeDRH0vyll
 6S41ZIJsRE3sAjlddKDFdhVbMr7bbb3IzeneYbXEgbUXbHYnJsJrQWHvz
 aNABPF0oYKeT1v0p+kGAn+P+YZ7/MlzBJwYGuwquKcqEkOsoZ02/gCF0J
 U/UklO+wufoXj4SkiBkhSIJATocgWsSdTT0BI4EeW0DqNpVG0U4dhHG8L Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2795460"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2795460"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 01:29:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="9720061"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orviesa003.jf.intel.com with ESMTP; 21 Feb 2024 01:29:52 -0800
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>,
 Fan Ni <fan.ni@samsung.com>, Laurent Vivier <laurent@vivier.eu>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH 3/6] hw/mem/cxl_type3: Fix missing ERRP_GUARD() in
 ct3_realize()
Date: Wed, 21 Feb 2024 17:43:14 +0800
Message-Id: <20240221094317.994454-4-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221094317.994454-1-zhao1.liu@linux.intel.com>
References: <20240221094317.994454-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.198.163.15;
 envelope-from=zhao1.liu@linux.intel.com; helo=mgamail.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: h54NBM6BuIXa

From: Zhao Liu <zhao1.liu@intel.com>

As the comment in qapi/error, dereferencing @errp requires
ERRP_GUARD():

* = Why, when and how to use ERRP_GUARD() =
*
* Without ERRP_GUARD(), use of the @errp parameter is restricted:
* - It must not be dereferenced, because it may be null.
* - It should not be passed to error_prepend() or
*   error_append_hint(), because that doesn't work with &error_fatal.
* ERRP_GUARD() lifts these restrictions.
*
* To use ERRP_GUARD(), add it right at the beginning of the function.
* @errp can then be used without worrying about the argument being
* NULL or &error_fatal.
*
* Using it when it's not needed is safe, but please avoid cluttering
* the source with useless code.

Currently, since ct3_realize() - as a PCIDeviceClass.realize() method -
doesn't get the NULL errp parameter, it doesn't trigger the dereference
issue.

To follow the requirement of errp, add missing ERRP_GUARD() in
ct3_realize().

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
Suggested by credit:
 Markus: Referred his explanation about ERRP_GUARD().
---
 hw/mem/cxl_type3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index e8801805b90f..a3b0761f843b 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -645,6 +645,7 @@ static DOEProtocol doe_cdat_prot[] = {
 
 static void ct3_realize(PCIDevice *pci_dev, Error **errp)
 {
+    ERRP_GUARD();
     CXLType3Dev *ct3d = CXL_TYPE3(pci_dev);
     CXLComponentState *cxl_cstate = &ct3d->cxl_cstate;
     ComponentRegisters *regs = &cxl_cstate->crb;
-- 
2.34.1

