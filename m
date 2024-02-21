Received: by 2002:a17:906:c8d8:b0:a3e:79c1:d636 with SMTP id gc24csp1997272ejb;
        Wed, 21 Feb 2024 07:41:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV145SafaTPD8fJve25EX2AzEGuUzKLmPVOdwHfqkt98u42+46N56aMTB2/yQarGHihcWs3HwjnLdmrAC8fvKmkaQNGombq
X-Google-Smtp-Source: AGHT+IFaUgkLNsJRiHRLBMcdw8lZsn8g/uci0lSynf3RgeFtYnR3I9H/bpfrmzSN4f1mpzNs+yjq
X-Received: by 2002:ad4:5f05:0:b0:68f:a71b:ec5a with SMTP id fo5-20020ad45f05000000b0068fa71bec5amr1961542qvb.37.1708530100597;
        Wed, 21 Feb 2024 07:41:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708530100; cv=none;
        d=google.com; s=arc-20160816;
        b=w55vowQRtk4Cgs+9dZaxdP+KMawC93JgymX0vg0BhQP96lpL2N8xNa9IJpEt6Igrhg
         cRcWyBodNb3OK/Nz+QCn0xjzSDTX7Pelk0KXorZ0FYhrX16PAqeENXc568vJIJ49YsCy
         haHR61PVlQkVPBq8CyYwcW7IegQeMq5rK1XYDEwj/On45B0QOW0xP2wd4gzd887gVbqY
         cim18egAwZkU1vKKzdeRPufpl9n5DjMmFeKllgaCg75L98d7tIcwIA5zGArQpbRQIAtg
         xDi+aTF7YPbI2olPFamteaDSzxN0dpttFNT2ygz1ME+t3lWCmgufxw4YgOxavcinqZCa
         MV2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=CWY3AODcPZ/mJR1gPRXK4lRP7kdKfdVRNBl62maq5HA=;
        fh=+pN+adOfj/Uj5T0Q5e2iLNDTjc6H0b5DJs2vk+l2vdY=;
        b=JC70aAnGOMvDE5lRiAQJdMOvNqcf2uexwBHl45RsFFaLJJFeJR3c7VJAv050m0bX6+
         1EjE8rkKK4sXd8O7p7BVQHwL7f7dvvNxYCOYkKQ3jsV+azBAYyq5Zm3B6Q1IzMm3o1Ok
         +KE/PBJjlLRUjg7RouMpE03ws9/RPL7abM4gRfwqlFq105GeBp4WUuo4Giz37CAFVghV
         XGHkVVdax5Ei8qLHGIksm69KR0yWDw1qnTRVP4glDFBQUeLYaT40PJODx0rTMkJz35Ni
         Byt5PJ105OPKqnpWM9mp6KSPRxUQYONm8wTjs78YoSEknpEkfDeF5FIahggyd6VzXlqj
         oinw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=kFbLR8zr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r14-20020a0562140c8e00b0068d14ecdfacsi11384358qvr.66.2024.02.21.07.41.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Feb 2024 07:41:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=kFbLR8zr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rcoai-0001XH-9L; Wed, 21 Feb 2024 10:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rcoU4-0000na-As; Wed, 21 Feb 2024 10:26:08 -0500
Received: from mgamail.intel.com ([192.198.163.15])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rciva-0003SO-LJ; Wed, 21 Feb 2024 04:30:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708507811; x=1740043811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9Bc0Ckt/w+D5ioixCAtTbsd0rswmbrxmghE0DuhNEmw=;
 b=kFbLR8zrVVXmHGHwV5+hTaFMQaaWx05EVkp8t1Csj8md1O8lOvY2/LVx
 5tWSS087VY3GZathzuDDWnGcSCnhaaXY3otU7VN10VZPR8gpN80XTf7Fs
 SZziDZOZMK0L5TVqBqH29PApE4NK22FePCaLWaeprhRC4+dCvO/OtMIOR
 IZFjZW97F9NvYIdJFVslyyuVgybAi5WVMn+l/CMj7TVbaOGDF/ljfoQGs
 l5GxqPYZNJGpH1CVVIiBgnMfQeafVEDPskAnGVwHRW9HbckYsTba4jyhl
 geXqTwOXfXg8M9XzP4Q83XHn9kPW8ODcsB3zMkKkN0MfkUQlAazq7Qs4m w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2795468"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2795468"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 01:30:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="9720087"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by orviesa003.jf.intel.com with ESMTP; 21 Feb 2024 01:29:57 -0800
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
Subject: [PATCH 4/6] hw/misc/xlnx-versal-trng: Fix missing ERRP_GUARD() in
 trng_prop_fault_event_set()
Date: Wed, 21 Feb 2024 17:43:15 +0800
Message-Id: <20240221094317.994454-5-zhao1.liu@linux.intel.com>
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
X-TUID: Q3fAOROzbj9Y

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

Currently, since trng_prop_fault_event_set() doesn't get the NULL errp
parameter as a "set" method of object property, it doesn't trigger the
dereference issue.

To follow the requirement of errp, add missing ERRP_GUARD() in
trng_prop_fault_event_set().

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
Suggested by credit:
 Markus: Referred his explanation about ERRP_GUARD().
---
 hw/misc/xlnx-versal-trng.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/misc/xlnx-versal-trng.c b/hw/misc/xlnx-versal-trng.c
index b8111b8b6626..3579348a9d17 100644
--- a/hw/misc/xlnx-versal-trng.c
+++ b/hw/misc/xlnx-versal-trng.c
@@ -33,6 +33,7 @@
 #include "qemu/error-report.h"
 #include "qemu/guest-random.h"
 #include "qemu/timer.h"
+#include "qapi/error.h"
 #include "qapi/visitor.h"
 #include "migration/vmstate.h"
 #include "hw/qdev-properties.h"
@@ -641,6 +642,7 @@ static void trng_prop_fault_event_set(Object *obj, Visitor *v,
                                       const char *name, void *opaque,
                                       Error **errp)
 {
+    ERRP_GUARD();
     Property *prop = opaque;
     uint32_t *events = object_field_prop_ptr(obj, prop);
 
-- 
2.34.1

