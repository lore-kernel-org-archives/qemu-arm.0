Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1992260ejb;
        Wed, 21 Feb 2024 07:32:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW/IuuJ+vMSb+jkufS/kyNkPzUvKeNPbfh5bVaCtBb8IbKt67lK0KDDR4Eal3hZPuMmBh1la6OzNvfHKUoIXHbktQuMg9gW
X-Google-Smtp-Source: AGHT+IEkeh0i0DKbXZYNZBJXv8YadaBcV3iM4YYbluYXVuvew4x0Ri36QeF9ntTHfQqyQiKG/+7j
X-Received: by 2002:a05:6808:a0b:b0:3c0:4477:deab with SMTP id n11-20020a0568080a0b00b003c04477deabmr17818406oij.51.1708529576662;
        Wed, 21 Feb 2024 07:32:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708529576; cv=none;
        d=google.com; s=arc-20160816;
        b=GG6kJySP5eOjzIq3M1goFB0vGBWQcsjwuO+vj9vkli2p2X0pMUy7V9imFH6rztoINI
         QODg0eLGaP+39LwqmToQlrJfwdJf7O2t2A/xzx6DaJyMb9pbxZQ8ph5SV5H26sojptZ5
         Po1gFM3PK2JUdTKfIq3O8b7p4GYDLFfLByN8Lnb18JXcxaC2RPhGJl9FZ4J34WfkVhuz
         5TXEvf5ExFH94IqUOVQ0bYPvaxQRLRs2ZZOHUrWKP6NYqp69RgwpDGWGtUAt+SZG5NjF
         ogNhHzXj9n89M7SoMyKR1r6D3z9G47MMexOhbV2phE/RBfpa/nyClC+ri5GGgWtDCBXB
         O6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/rmzIoSrQX3PR2DEPXc8LHuhLwUSrOsLN61UBd1N5Ds=;
        fh=+pN+adOfj/Uj5T0Q5e2iLNDTjc6H0b5DJs2vk+l2vdY=;
        b=WR04wRfEry8GSqFrt49XMm52Rps0Qy5H87fCyvYty9y2Zw+ztEfCguSqq3iv1yc47f
         WnOKKpmPo90YcC1z7SnHXtQCEWTh6dlzc/PfRRdae/TQtD5WfFqxtbaktzyp7qB6KcsP
         mvQpAzIbDnyDQTwitvgXRpyykTlahRrhBmhIvOY8lVANX/KCvGBjU2TCoXHLzwx6epUn
         oqzkdSOXCtRvPOaQeh3kIIO0eUyB+4pRpNhZeY//GToJsPF9djvngX6p/av69haSkOah
         Joi0Gq+e8mzNlAb2LlNuU3VBUI4iDIUh7CrLJznh3zXevR25/X953YjZh2R3KQYtXAdD
         kw0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=LTopbUVb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv8-20020a056214262800b0068f6580893dsi7812608qvb.134.2024.02.21.07.32.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:32:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=LTopbUVb;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcoZX-0002Dg-2q; Wed, 21 Feb 2024 10:31:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rcoOO-0001cd-7G; Wed, 21 Feb 2024 10:20:16 -0500
Received: from mgamail.intel.com ([192.198.163.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rcivF-0003Pu-TT; Wed, 21 Feb 2024 04:29:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708507790; x=1740043790;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jr5xLn+pxgEWB18t0POPDrO12COnWPAt/ERZ0Rl77N4=;
 b=LTopbUVbvyu/vGvN4ufYLCjJPCjQCeYjFQkamOIuVfZUM6yQ/Zfq/n4w
 O8TYba1g+sM42CJ0SdEYBq1f6JEZASQzVxKvfZWrnLYXWZhSor9hpfkoj
 w9HnOrqOOpxW7l3EuMwxxx6SB42xVBAzZBwdipvVj7vd7txrUMUyjI+YE
 yczH4qcDlAEkysEqSZDo/T8zQuQOVgaZ73qVh/iTsAvhb2OOhXllrDl1X
 bJOradR971NDtmKSyNSt45m1n8elwTLkDKDZ6MDG/cWG8x86Wr/nDM1be
 DWFifY91SR53soImv5kmp6Hvw39V83CXGcISntAexprp6iMt/Cw5aW7Q7 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2795440"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2795440"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 01:29:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="9720001"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orviesa003.jf.intel.com with ESMTP; 21 Feb 2024 01:29:44 -0800
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
Subject: [PATCH 1/6] hw/cxl/cxl-host: Fix missing ERRP_GUARD() in
 cxl_fixed_memory_window_config()
Date: Wed, 21 Feb 2024 17:43:12 +0800
Message-Id: <20240221094317.994454-2-zhao1.liu@linux.intel.com>
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
X-TUID: v8gUXXFEYg0P

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

Currently, since machine_set_cfmw() - the caller of
cxl_fixed_memory_window_config() - doesn't get the NULL errp parameter
as the "set" method of object property, cxl_fixed_memory_window_config()
doesn't trigger the dereference issue.

To follow the requirement of errp, add missing ERRP_GUARD() in
cxl_fixed_memory_window_config().

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
Suggested by credit:
 Markus: Referred his explanation about ERRP_GUARD().
---
 hw/cxl/cxl-host.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/cxl/cxl-host.c b/hw/cxl/cxl-host.c
index 2aa776c79c74..c5f5fcfd64d0 100644
--- a/hw/cxl/cxl-host.c
+++ b/hw/cxl/cxl-host.c
@@ -26,6 +26,7 @@ static void cxl_fixed_memory_window_config(CXLState *cxl_state,
                                            CXLFixedMemoryWindowOptions *object,
                                            Error **errp)
 {
+    ERRP_GUARD();
     g_autofree CXLFixedWindow *fw = g_malloc0(sizeof(*fw));
     strList *target;
     int i;
-- 
2.34.1

