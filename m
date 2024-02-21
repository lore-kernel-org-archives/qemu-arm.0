Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1985704ejb;
        Wed, 21 Feb 2024 07:21:55 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVsuTiArg0XY+PvS40ULdvLL8zGTBooIoYTu9ARhqDGVnbRBzm0J/hHXMLO8HWRzhoDxeAZcuX3IuOTX0oF8wtCC3ME4VMt
X-Google-Smtp-Source: AGHT+IEzX9LcSuwe9FZ23qfzpu+to4PmQIFPk/5iF51Eca9em0TU3coueJamDDymkXW8TvTKsdom
X-Received: by 2002:ae9:f311:0:b0:787:24a7:78ff with SMTP id p17-20020ae9f311000000b0078724a778ffmr19898576qkg.11.1708528915383;
        Wed, 21 Feb 2024 07:21:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708528915; cv=none;
        d=google.com; s=arc-20160816;
        b=d2dhPhIcBaBa1T0gu7jxkqfQYVFGME0VjkTXtU/xOCNEhyGFdOWoI5eZ+1/e/rWqsW
         msYcPGglBsbFwc49eNLYhnBPmd041strMVwa426n/RiEgYFtw4V6oX5BJQgdh1sGR/Nh
         yUJCingeZV4CvKG48/c7NzsbSAEMdNhCBdBXzOmqdsx0kTqEWfBPAgvbe9BYY6bss1ND
         GzJI+taCltUcEPr+lOrvOj3mMOdk+vci7XsTgln4zDgJvg6fPBYn/pT+TrVvgXU771u4
         Jxr0UQY7AOLGVLBygGHfqe+57xCIT5XrJxoDv42XIoMq75nmO5ddjAOh3d1RlA0e0Lw3
         18cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DCGAgsSgyIyU7jOfmdUwEVmKd4IeUjaf5it2yyHq5yU=;
        fh=+pN+adOfj/Uj5T0Q5e2iLNDTjc6H0b5DJs2vk+l2vdY=;
        b=GtpPUDz5f29G+dqsO+0rNI+A+sk+XtI+64AgoPP2yO3BOFoQ2VurSIqa2yMutiJfpx
         sPNT9l0WHjjdyYybcP2ulb0Vh24PUr3jXkAV0bghpox3tJoSByVFYJB2zZ5qYjdDkkLz
         3oawkRbeAtOvS4N9v4dajtUuTpf/O6p6VrYeKyJph++yW0JJHjhsQtrNlMvP4W1nrnJp
         ciQzTZzQD55we3RoNis7MuR5Y1Re5/otExZ1a1IX9agp2m95PDXSD6OWq7+HV3KH1gjn
         Q1XV4SZ3QxBIBTDKOiBIB+4s+TQLGhyKD3JDm0pIZuR8/DmvCHPX+VkR1RkWUrF+B8rT
         PfTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Yfay+RoJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3-20020a05620a108300b00785be029f54si10895750qkk.326.2024.02.21.07.21.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:21:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Yfay+RoJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rcoOr-0003x8-T9; Wed, 21 Feb 2024 10:20:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rcoL4-0000wC-Jq; Wed, 21 Feb 2024 10:16:52 -0500
Received: from mgamail.intel.com ([192.198.163.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rcivZ-0003dX-FC; Wed, 21 Feb 2024 04:30:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708507810; x=1740043810;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2YsbLPL6v1xok/8Kc8flnuoxreDppreVjYDnHHeyris=;
 b=Yfay+RoJn4xf7Uqghcitv/0NrPGwqS3pe2gclIHoiu8BbKU4ssOcL6Ar
 mT2IOokXv3BKM1pMpoge/yL6v15mR5no8XVVvDPQyyWmcZFAobDIXE4yv
 g3q5K3YHam8P10XxoEZpbYdymTlQpD1QY3sSABDKiwwHbs0rTovXC48vl
 RRn4BeiBwHmsJpFLqagkrnQ3sv6377q3Bj4gRHmmZZkkNOCAKtMupmAVF
 NI1FVJS0iFyJYV/osjOtvTxSn0zZACrRMBv5i7KiC2UGe7xe4GnWVQjF7
 BjxKJx+beTRTbjaENkd1WW2fNogI06QUAxk9x50GDVdsJlglZgavwHkFw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2795502"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2795502"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 01:30:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="9720155"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orviesa003.jf.intel.com with ESMTP; 21 Feb 2024 01:30:01 -0800
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
Subject: [PATCH 5/6] hw/pci-bridge/cxl_upstream: Fix missing ERRP_GUARD() in
 cxl_usp_realize()
Date: Wed, 21 Feb 2024 17:43:16 +0800
Message-Id: <20240221094317.994454-6-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221094317.994454-1-zhao1.liu@linux.intel.com>
References: <20240221094317.994454-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.198.163.15;
 envelope-from=zhao1.liu@linux.intel.com; helo=mgamail.intel.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-TUID: TnBFI+NjbLBS

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

Currently, since cxl_usp_realize() - as a PCIDeviceClass.realize()
method - doesn't get the NULL errp parameter, it doesn't trigger the
dereference issue.

To follow the requirement of errp, add missing ERRP_GUARD() in
cxl_usp_realize()().

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
Suggested by credit:
 Markus: Referred his explanation about ERRP_GUARD().
---
 hw/pci-bridge/cxl_upstream.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/pci-bridge/cxl_upstream.c b/hw/pci-bridge/cxl_upstream.c
index e87eb4017713..03d123cca0ef 100644
--- a/hw/pci-bridge/cxl_upstream.c
+++ b/hw/pci-bridge/cxl_upstream.c
@@ -289,6 +289,7 @@ static void free_default_cdat_table(CDATSubHeader **cdat_table, int num,
 
 static void cxl_usp_realize(PCIDevice *d, Error **errp)
 {
+    ERRP_GUARD();
     PCIEPort *p = PCIE_PORT(d);
     CXLUpstreamPort *usp = CXL_USP(d);
     CXLComponentState *cxl_cstate = &usp->cxl_cstate;
-- 
2.34.1

