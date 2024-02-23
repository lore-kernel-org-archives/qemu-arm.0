Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp433909ejf;
        Fri, 23 Feb 2024 00:44:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW3N42053CJm4wZg4vGkNs+S55R4zT/YoyjGHSYSo+kDv3flDnmJVjDMYxqMssKlZZc8omf4MrggcAhtNx0q/IYB9pXCdJO
X-Google-Smtp-Source: AGHT+IGKrYlX1AfWXIQ6ICyADkl3OISPjtapI19iXynyTEL6MlmzIlCutMdZAoTSYuvpYobD5oMZ
X-Received: by 2002:a05:620a:2230:b0:787:a603:9dc5 with SMTP id n16-20020a05620a223000b00787a6039dc5mr1394994qkh.11.1708677857478;
        Fri, 23 Feb 2024 00:44:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708677857; cv=none;
        d=google.com; s=arc-20160816;
        b=NPtexDBBiFeNlqGAY7N97NNA3tV1f6Z+M2qscgKnwiPzJ4hJ016R36S3z+xPscDNBK
         XsRLzC3jouVIJOeP3zUS+SXl/1MKaoFG8nlG+LBSozYLvhS+bSnkh4O+DlxsDv3XXQ9l
         M4kqw6GnA1O0JQihSXk9BlsoLFPKWvABeRp7BBq9lSVQy+fHnJlanRcZ+vNqGjlGJ8PC
         DxjS6xF/HiFaq27UH5uEDgFDASBnWkF2Wyng33Yw0b6LcOv9ItBu7JeUQdd+X/cVokuO
         CqeCZ1WN2xwFFBZsyptJLCVgehzK8vCYS4z1S1z8eNv9ph4EwxoOzMolcVEOgOIr1piY
         t5tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=20t+t43I6rAUQJE0mG4UA9g2N/BS2iq+ZsDMIfqNq7s=;
        fh=sHfxWuxL10Um/OtTTHeE8w8S6jWQrkWHHuDkXWsOwTg=;
        b=sliZbwHz6ZXEKoZxL808QHVysBwk8/LmnK/C5xzJUogB7bqjVmhyoRzQBZUIEndquV
         oTYvNqacl7En+Yav2XQ7aRJa+I8gfi3ByAQOC6Fvjc0ucrcPsAJfdUppd/eSmkVJJBoK
         cKYDAcXm9J9HxaBzk4uEldI8JqlJfXPQP7Tta6Pq8yEdKN7Jk3+ZKOQMmlpESuKHGCVg
         etCXGSQSolHALGYyN79Z0St9twkznos+Pr3qyxNUNyqA94JUQhkWn9xcAYhkaNdBlPcd
         PCmKAGaY0YLHU66zRwQjmHd8XcgcOgyuxbDHcKeZ3urnvLWfys9e96vhfrEIYd1I0bUr
         YAbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Xeo0nutK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f14-20020a05620a15ae00b0078730d3edd3si14905574qkk.605.2024.02.23.00.44.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 00:44:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=Xeo0nutK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdR9z-0003lW-DT; Fri, 23 Feb 2024 03:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rdR9y-0003l7-1Q; Fri, 23 Feb 2024 03:43:58 -0500
Received: from mgamail.intel.com ([192.198.163.7])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rdR9w-0000BO-Cm; Fri, 23 Feb 2024 03:43:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708677836; x=1740213836;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F8skAR9lhlBSxUk/sclMG9tzN4DHjUmO6+uY1BPToZ0=;
 b=Xeo0nutKpIQ8BzicXiZOay9j4/u+95iBOF2KsgLtDEAlnV1czK3PwD3i
 oknKCjcUs3RlvOyj6x8TG7dGnosZ1YjylKIN2WkFgigP5w9idmbv0LEwY
 xrOlxK9gvpgb4yHBIpnIohYy171Ilgt1nsbvHrh2m11vibxDK7TUtKPso
 9KCqxxuZ+3UFYMPCzWVyoh8ofpDj72YZTLrxhOGgeGXeo0Rr1G2FuvzLf
 /BITIQJ61CYL0JiDwwwN7zODfpZm0XWELCni/1I426L1W8pYGFki1dj3d
 E5S1qR+DjwNzKKGkj9btrluZo4uVrK2QgSoku8MU0jcWIA//65dVLq2yK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="28413872"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="28413872"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 00:43:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5731852"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by fmviesa007.fm.intel.com with ESMTP; 23 Feb 2024 00:43:39 -0800
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
Subject: [PATCH v2 5/7] hw/pci-bridge/cxl_upstream: Fix missing ERRP_GUARD()
 in cxl_usp_realize()
Date: Fri, 23 Feb 2024 16:56:51 +0800
Message-Id: <20240223085653.1255438-6-zhao1.liu@linux.intel.com>
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
X-TUID: E25jds3BjyrB

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

But in cxl_usp_realize(), @errp is dereferenced without ERRP_GUARD():

cxl_doe_cdat_init(cxl_cstate, errp);
if (*errp) {
    goto err_cap;
}

Here we check *errp, because cxl_doe_cdat_init() returns void. And since
cxl_usp_realize() - as a PCIDeviceClass.realize() method - doesn't get
the NULL @errp parameter, it hasn't triggered the bug that dereferencing
the NULL @errp.

To follow the requirement of @errp, add missing ERRP_GUARD() in
cxl_usp_realize().

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

