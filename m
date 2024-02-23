Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp433763ejf;
        Fri, 23 Feb 2024 00:43:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXa7fiYRfXXXzh32/hJky4mG1+cBIOB9zAT1TMaUn1P4A41ScNszPQxWEXBEtGjJ7OjTsGlhCkMV5ZCVDcxGYS8b7tMWiA3
X-Google-Smtp-Source: AGHT+IHBA5i5vXce6tdSGKdlbIufeIWfdBRWw6BGSNCPkzGrEMpy5D+J/ony4OSzfHTPUV7LJeS3
X-Received: by 2002:a05:622a:40e:b0:42d:dab2:c283 with SMTP id n14-20020a05622a040e00b0042ddab2c283mr1765864qtx.39.1708677831934;
        Fri, 23 Feb 2024 00:43:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708677831; cv=none;
        d=google.com; s=arc-20160816;
        b=qpgxXzB9yxGXASX3fmt67VeZf77dD8hE4hO4YOE28JNJoXfQ89XrSwTUGb1afbIdmR
         4bh3iPKxFs4CGLsH0P7oaUSt/rNJD0sOYmhqvxjTSPmgG7MtgihFsbxPl7sZliBEfkqe
         D4MkeT14rIAn+8ICVVzLNKWBfNUBTDiwPjqDPL/ygVv3XyL/st39oqPDdXowd35tDcJx
         1jfSKYvuAqD2uT2FrXP2MBET16cJKHkWPFP9VriP9b+A1kLmyAw1LExGSCsGILQNw+jD
         hhgZOXAVgrYOybjrDPEp2x+2oInosNflXUBViITfwe7xYddrsyXv3m/M2vMut/FRGRSx
         qUJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=1YNSjsjEdYRwkJtJvO7Pa+gTfATl+wQ1290TPC4JqB0=;
        fh=sHfxWuxL10Um/OtTTHeE8w8S6jWQrkWHHuDkXWsOwTg=;
        b=zC+J9B/A63t2DPpdBXSWs1dHlVCHnAwHbt2pW/7kMprCe7mFi1zbgXTcCCuGwPb5v6
         aDt5R1sDxJ23w6zrmteTa9acNjkeXQQ85PT7/c19l8OaiDwuSG9pfKhQwtUjgRXjN0Vx
         Pksp5Z97Fz9t3HwBGJZBCvBtYOl0Mr0GGKaGt7UYNATWqIeUpTpcXT6jjkKMOeJcfvDY
         bPY3izxZ2UWrJ/KIuBs5IbFNPq28zrnOUKt9+ptC1GzH5J5qy+/uSxrWJ/94k+YdM8N+
         W1AnCECRMishj6AuePvsCHFk4LHSZUAzQlF9TqsBmuEJKTZGu3P5oA2T3lXz3ZRLYJzS
         vljg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=SRjkvBZ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ju1-20020a05622aa04100b0042cfd3cd456si13952945qtb.332.2024.02.23.00.43.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 00:43:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=SRjkvBZ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdR9j-0003Lp-V0; Fri, 23 Feb 2024 03:43:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rdR9i-0003K6-K5; Fri, 23 Feb 2024 03:43:42 -0500
Received: from mgamail.intel.com ([192.198.163.7])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rdR9g-00006f-VD; Fri, 23 Feb 2024 03:43:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708677821; x=1740213821;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7QWx7fmzjgK24CK+pej4cEHInJmThr5dADvX24YS+7Q=;
 b=SRjkvBZ1KSXYHA/6xy45UcNOt96PUwxErF6URpeys7x8Ie4hKsCcsP+c
 ar40p/o9YQPPddQ/G6QIT1xgYUJsh2sAmewIOfEqE4rzLGPtIQBChu0e1
 jadgASs2gp5skH+iMh3FvzTZDs9lG2VWN5w6NE3y5gz7k72anzvikNtYw
 1e7Fx34tCxUhCA3pId6GoItqtZL5/Zj8u3efNbrRPmZxxXFACIRASpnMw
 /EDSur5NUu8bVp32lsUEf/Ft2T91J1hZ3KoDLpBefKOEurdQwuGnIzJHJ
 rOf4uKpiPVn37GzW0K0e/CLcFoF/H148nJZqGNP3iKj/0xymPEvvCDz84 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="28413855"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="28413855"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 00:43:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5731812"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by fmviesa007.fm.intel.com with ESMTP; 23 Feb 2024 00:43:35 -0800
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
Subject: [PATCH v2 4/7] hw/misc/xlnx-versal-trng: Check returned bool in
 trng_prop_fault_event_set()
Date: Fri, 23 Feb 2024 16:56:50 +0800
Message-Id: <20240223085653.1255438-5-zhao1.liu@linux.intel.com>
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
X-TUID: DU5OYhh9LnIg

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

But in trng_prop_fault_event_set, @errp is dereferenced without
ERRP_GUARD():

visit_type_uint32(v, name, events, errp);
if (*errp) {
    return;
}

Currently, since trng_prop_fault_event_set() doesn't get the NULL @errp
parameter as a "set" method of object property, it hasn't triggered the
bug that dereferencing the NULL @errp.

And since visit_type_uint32() returns bool, check the returned bool
directly instead of dereferencing @errp, then we needn't the add missing
ERRP_GUARD().

Suggested-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
Suggested by credit:
 Markus: Referred his explanation about ERRP_GUARD().
---
v2:
 * Add the @errp dereference code in commit message to make review
   easier. (Markus)
 * Check the returned bool instead of dereferencing @errp. (Markus)
---
 hw/misc/xlnx-versal-trng.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/misc/xlnx-versal-trng.c b/hw/misc/xlnx-versal-trng.c
index b8111b8b6626..6495188dc748 100644
--- a/hw/misc/xlnx-versal-trng.c
+++ b/hw/misc/xlnx-versal-trng.c
@@ -644,8 +644,7 @@ static void trng_prop_fault_event_set(Object *obj, Visitor *v,
     Property *prop = opaque;
     uint32_t *events = object_field_prop_ptr(obj, prop);
 
-    visit_type_uint32(v, name, events, errp);
-    if (*errp) {
+    if (!visit_type_uint32(v, name, events, errp)) {
         return;
     }
 
-- 
2.34.1

