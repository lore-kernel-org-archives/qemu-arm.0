Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp433925ejf;
        Fri, 23 Feb 2024 00:44:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU+Kh/oNC0RTGuIRxH57gPobLrrEtdsXjKufDScrbBxfLwRAnSdte+NKEBTkhH1i4kTdsIeEKqJlolCxPdTmYJ2LG4eSck4
X-Google-Smtp-Source: AGHT+IGnDdwbyg+1dMo/NAUQkfZaCt49qgGi08DI3Jz16HfSNuUwDE6mwwR1J0tbvmJPKgaG3yPV
X-Received: by 2002:a05:620a:1b8a:b0:787:6eb3:2e0b with SMTP id dv10-20020a05620a1b8a00b007876eb32e0bmr1433287qkb.24.1708677858992;
        Fri, 23 Feb 2024 00:44:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708677858; cv=none;
        d=google.com; s=arc-20160816;
        b=TsTbfJ/KcnQuoi3KnCfhj9SZSHv5896AOLuOqlTmPbymcVXd5ne7j0dbkc2ElRZ03H
         9aqE+rBWKPw59yb1xsGN3wImsDsWf8vu+Q9a0RfwtvSOzQfClDiGbupkRdeoJOoj+fu+
         JXdPnCY0I1mPchXcyB+vvrIjel8Kkd/O9FFKirCum5Oyw9gnc47INg7fH16uaYn3GjkX
         Sks4c/clnzRo71AljDxtQ5Qj/Dx8XXOWzWqDPe3wISumazPVFOE1bCKDo/AclDSWJ+rn
         upRuWh5XpDLu986GgS8js5QlaCmezy6sFGOc/FCc6xZsImxYTV/r5U+nnADAsoJcO0Y5
         xcNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=DHPbDScDPzmqLn0cS+YpPqZcBWTMH2Y8bLxnqZhyuDk=;
        fh=sHfxWuxL10Um/OtTTHeE8w8S6jWQrkWHHuDkXWsOwTg=;
        b=WZwKhFI/2FvkWP0dXGZCQVpVd+0ZwS8pIcTLkjQv/yfH2CvSsfqSoG+7/Dh7LsECKY
         hFvI0AVuezlcwcop3Dex8RrrQ4ckG7zuakvOeMqcWwophIbYN/qBwj27a+Ix5Qgd4Wsh
         lutsAVm98s5Cni0pmazTLcltq/hcTzhXTQqPxmWsCvq1mI5WupArWKk/LpHSxzSvJecY
         Zm4QiO0gCcjUpaoLOj1K+eBWm9D35uTpauA0j3M0Gc+ni8pAgbCZMYXBpfHdLrWuSGj5
         3J+ZPc08XV60ziCMa93EszMYlEp4WRqr3yenRxsRKVtpqkruDZweqcMUM+Qepkv37Jz3
         Lvqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=JbMHDuvK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17-20020a05620a209100b00787a7ba5611si2141842qka.92.2024.02.23.00.44.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 00:44:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=JbMHDuvK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdR9g-0003J3-K8; Fri, 23 Feb 2024 03:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rdR9e-0003Ih-L9; Fri, 23 Feb 2024 03:43:38 -0500
Received: from mgamail.intel.com ([192.198.163.7])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rdR9d-00006f-5o; Fri, 23 Feb 2024 03:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708677817; x=1740213817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MHvQ5woW3Z+EugV6VPlTEN8ySg00SOJs4AJTsCdkA7k=;
 b=JbMHDuvKL5q/vzofxjrkEIXocgCaZ8MTEUV5+gOKmrzMxERI3uKiEpaf
 AY3utzys4KgVJGwp1WxfCRIn4Z7Ej6Geus60R2icGq+1iJ0rbfXK1yvLC
 zQTHOpZEcwV7En1dM+lmWmNg2e+7wF+6NPFYdpehM3VEQ0NORCdty2KJ8
 siucRRRFfg3ueAothVT2OgS+TIiM3q2xyXJeVP5r5yifqj2ckfP1fYWSd
 4YYSkqV/NAmBw6nc2SkZjlpcuIH5nXVd66NeL7BcP1itoos/wdf4ThTVz
 +i3UNINKDNNH9eUxHhGYpK52ELsarOWg0TAMYPSMc3h/dWdcEGACP79jr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="28413839"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="28413839"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 00:43:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5731795"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by fmviesa007.fm.intel.com with ESMTP; 23 Feb 2024 00:43:31 -0800
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
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Zhao Liu <zhao1.liu@intel.com>
Subject: [PATCH v2 3/7] hw/mem/cxl_type3: Fix missing ERRP_GUARD() in
 ct3_realize()
Date: Fri, 23 Feb 2024 16:56:49 +0800
Message-Id: <20240223085653.1255438-4-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240223085653.1255438-1-zhao1.liu@linux.intel.com>
References: <20240223085653.1255438-1-zhao1.liu@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=192.198.163.7;
 envelope-from=zhao1.liu@linux.intel.com; helo=mgamail.intel.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.002,
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
X-TUID: IUojKkos/8BM

From: Zhao Liu <zhao1.liu@intel.com>

As the comment in qapi/error, dereferencing @errp requires
ERRP_GUARD():

* = Why, when and how to use ERRP_GUARD() =
*
* Without ERRP_GUARD(), use of the @errp parameter is restricted:
* - It must not be dereferenced, because it may be null.
...
* ERRP_GUARD() lifts these restrictions.
*
* To use ERRP_GUARD(), add it right at the beginning of the function.
* @errp can then be used without worrying about the argument being
* NULL or &error_fatal.
*
* Using it when it's not needed is safe, but please avoid cluttering
* the source with useless code.

But in ct3_realize(), @errp is dereferenced without ERRP_GUARD():

cxl_doe_cdat_init(cxl_cstate, errp);
if (*errp) {
    goto err_free_special_ops;
}

Here we check *errp, because cxl_doe_cdat_init() returns void. And
ct3_realize() - as a PCIDeviceClass.realize() method - doesn't get the
NULL @errp parameter, it hasn't triggered the bug that dereferencing
the NULL @errp.

To follow the requirement of @errp, add missing ERRP_GUARD() in
ct3_realize().

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
Suggested by credit:
 Markus: Referred his explanation about ERRP_GUARD().
---
v2:
 * Add the @errp dereference code in commit message to make review
   easier. (Markus)
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

