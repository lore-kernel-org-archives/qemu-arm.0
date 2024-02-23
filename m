Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp434087ejf;
        Fri, 23 Feb 2024 00:44:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVvK27RqWRcrLL8WjUJ3B8+TDH5p4/rDaA3kb3KowGFmnZioQXXaFKJRERL3E0vFR0/PCVVvGntNMtM5pG5UqTgzXAGz0L4
X-Google-Smtp-Source: AGHT+IEeU/JKD56168Np8l5+d32iPKWMd8nB7LH57HtGPOckR/SIxgwXGFrdXNC0hy7iDwdVyBOn
X-Received: by 2002:a05:620a:c86:b0:787:a901:ecb4 with SMTP id q6-20020a05620a0c8600b00787a901ecb4mr1203154qki.71.1708677887989;
        Fri, 23 Feb 2024 00:44:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708677887; cv=none;
        d=google.com; s=arc-20160816;
        b=1AVIUEub17C+5hgfvGSRgTFU0I8CHVhs2ddeMADXSYSufz/pPQqetrfAdM/CXhDj3Q
         buTkcuf/JeaB+Ka+sUzREqIERc+/qLt9v1fz/odpb2vHo1gLaJVHTIQuHGkd9dJUHgbR
         beoJZhzDO3+8FxSj4RQ/07Ds1BmUefsJoM7+gUtVcbAzZSanEpVMxo5vVYl9AqwDplLM
         6SFfuACtVcDV/uJFiH9s+wCkHuDu2dTPtVo9amGVcd9iqyK9phJM+XlPZWb0EnyIUbI5
         QuwpvGGI+18jhdjT/Y5rQhVsmuNuumrVHYglWYQ1D9Tl4VzEV+qhgubX/Q5+/XzYESA4
         JJXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kg/kv2RmI7GX32ESQ634+OAzn+IOCXfMSkNJ8wYPIE0=;
        fh=sHfxWuxL10Um/OtTTHeE8w8S6jWQrkWHHuDkXWsOwTg=;
        b=BMYAbaFGskqP2bxQSrJowi2smxvtWghX4ieA4E5CuXEs3pSPaJCIz9+0ZsqBG0QgBk
         6h55cpHWZ0dwQngSuNVNbfX0JMRCAljIjHKBfwc3KrDCo6a5JKQlTp15xeno0hUdsSVN
         zk1mGugB54ud+N0WKZO/I4TcRm5CBC5IO7GAKIl8bvRvEDwGZeJ4e6mrOgegdCtoRmuB
         /kCoYZTpSNsTDHr0PO7CQ4BC0uCOTdwWVbbCUZCiTFPi+nnddYjcjIlJhpf8qgu2SQF/
         b/q/dfYlB3Zh2KOL/opQVYlGLE1UPMu8iu0IKzZsNwdFHZA4T09c5dsQw9+qm2VRJhwd
         +F0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=JUCrwAi9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f24-20020a05620a12f800b00787466474c2si545286qkl.340.2024.02.23.00.44.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 00:44:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=JUCrwAi9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rdRA6-0003o5-22; Fri, 23 Feb 2024 03:44:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rdRA0-0003lb-RG; Fri, 23 Feb 2024 03:44:02 -0500
Received: from mgamail.intel.com ([192.198.163.7])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@linux.intel.com>)
 id 1rdR9z-0000BO-7B; Fri, 23 Feb 2024 03:44:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708677839; x=1740213839;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MdIfh/jYydArR3D22MnTaJm9imdQCnDqtGGlbaFl++w=;
 b=JUCrwAi9HXFCrFIz9r7w0S/eZ3/WNjN+rEZE1zrp/wNGnZuACQ3u3lu9
 vzUEZeQklvzHG8TFgFhXEPqHwvmxox3OAHanNxY1mEbzQQ/uJAnHQjUoR
 74KDJZsGygFQjX/LBYUnwXzF9aPAy+G4zMx2N/Pqs0qcKYaM2wlvX1cFu
 uTugGlgPv6dCErZZ1PncweFQeGdsxICjbXjEj0hF75hJRXGTYnL4jwsFU
 OlRzEn9Mk25fb2V5HlYbiEMa1QTo5RL82SPvy2BQ+b08bBRHheQJGsZ/F
 Q20iWGNVGy3hq7OUHl2g/V9mvjEwVMPsce5mkXitw+HHBmVdbLYuDvNlz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="28413916"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="28413916"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 00:43:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5731881"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.36])
 by fmviesa007.fm.intel.com with ESMTP; 23 Feb 2024 00:43:48 -0800
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
Subject: [PATCH v2 7/7] hw/intc: Check @errp to handle the error of
 IOAPICCommonClass.realize()
Date: Fri, 23 Feb 2024 16:56:53 +0800
Message-Id: <20240223085653.1255438-8-zhao1.liu@linux.intel.com>
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
X-TUID: y8dlfklyaAbo

From: Zhao Liu <zhao1.liu@intel.com>

IOAPICCommonClass implements its own private realize(), and this private
realize() allows error.

Since IOAPICCommonClass.realize() returns void, to check the error,
dereference @errp with ERRP_GUARD().

Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
---
v2:
 * Add the missing ERRP_GUARD(). (Markus)
 * Move this single patch into @errp fixing series. (Micheal)
---
 hw/intc/ioapic_common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/intc/ioapic_common.c b/hw/intc/ioapic_common.c
index cb9bf6214608..efbe6958c8d7 100644
--- a/hw/intc/ioapic_common.c
+++ b/hw/intc/ioapic_common.c
@@ -152,6 +152,7 @@ static int ioapic_dispatch_post_load(void *opaque, int version_id)
 
 static void ioapic_common_realize(DeviceState *dev, Error **errp)
 {
+    ERRP_GUARD();
     IOAPICCommonState *s = IOAPIC_COMMON(dev);
     IOAPICCommonClass *info;
 
@@ -162,6 +163,9 @@ static void ioapic_common_realize(DeviceState *dev, Error **errp)
 
     info = IOAPIC_COMMON_GET_CLASS(s);
     info->realize(dev, errp);
+    if (*errp) {
+        return;
+    }
 
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->io_memory);
     ioapic_no++;
-- 
2.34.1

