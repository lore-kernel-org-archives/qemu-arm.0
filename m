Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2036672wro;
        Sun, 4 Nov 2018 17:52:57 -0800 (PST)
X-Google-Smtp-Source: AJdET5eWHuKGCvu16bloL3Nc4sphc7g7b93SwJa/Ral1S0E7/GT7Gx/YfBaddNhwib09Zbwf7hFS
X-Received: by 2002:a37:7983:: with SMTP id u125-v6mr17731018qkc.219.1541382777046;
        Sun, 04 Nov 2018 17:52:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541382777; cv=none;
        d=google.com; s=arc-20160816;
        b=dCdCxoSlOrUUKJxUyFzht9ZJH1xsTfC4RELEbimSG+bjlG7iTB18orlyd/LRjH2CPd
         qg8btSpPdJnY9OaBLFoQp1N7Qn31a4qXcCdj+4SaDz3RZA/aDRnCDrkCLwnK/KTv/uVc
         QRF0XUT1wL0Adee2tcSBeJ4NaNGGXeEc629liOWDw9zCPvhNnIz2ewrLPl/T/Q/YjnnG
         BSkforLSEuv36HSGq8MxNJlPbIJTi1ZMA7UqTbD4wmMMpK7qaEofQl2nupPRncfZVAkw
         n6ZniA/oMXHXJkR7nSv8Sku2ATTqrw9FTYp0wg3FKZJ8N1SlEet4l+d8OWk6gvfz/jy7
         epng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=Nb93qOcCQdza3c1yNyCRc9rD0eQiPQkdwF/vJZNQ4ug=;
        b=TPQjq/iUxK/ZPZRxaYOqLjzM2ofKhNex58VklvpR3Z5Cjvmjtb5/YGPqDOo9GL2WXk
         +2KWZvqXknsPNPg+Fxa4wW1iwiOxxhrVQtA7CAFUwEyHPO9fo/Pz3viHnaxxeckKdmLj
         ekovubCCh7NJKWXGYfXfZCYDsOxYiIvTqXBNGD0RqYdIxeRkZOtqPJjhiZvgXOzJEJOo
         EGHOEQrh1L5nKUYEeC5gNzPgZGURPrlInaEEG9B03RTCv21tztM9BRaB48FqhRD1ntv/
         nHcxb+VpneXRf5le/heNRCqhWpY9t4CqRVIobU/HDD8ua84n1Bexcp34FXVDO7vt+vCd
         w5TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o2si3572734qkg.259.2018.11.04.17.52.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 04 Nov 2018 17:52:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:60908 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJU4W-0001Eq-GK
	for alex.bennee@linaro.org; Sun, 04 Nov 2018 20:52:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47192)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTv2-00086n-69
	for qemu-arm@nongnu.org; Sun, 04 Nov 2018 20:43:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJTv1-0003Ex-6C
	for qemu-arm@nongnu.org; Sun, 04 Nov 2018 20:43:08 -0500
Received: from mga18.intel.com ([134.134.136.126]:7994)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJTv0-0003BH-RD; Sun, 04 Nov 2018 20:43:07 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Nov 2018 17:43:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,466,1534834800"; d="scan'208";a="277074463"
Received: from emurphy1-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.252.26.250])
	by fmsmga005.fm.intel.com with ESMTP; 04 Nov 2018 17:42:59 -0800
From: Samuel Ortiz <sameo@linux.intel.com>
To: qemu-devel@nongnu.org
Date: Mon,  5 Nov 2018 02:40:39 +0100
Message-Id: <20181105014047.26447-17-sameo@linux.intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181105014047.26447-1-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.126
Subject: [Qemu-arm] [PATCH v5 16/24] hw: acpi: Fix memory hotplug AML
 generation error
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zcO+qdivaYOO

From: Yang Zhong <yang.zhong@intel.com>

When using the generated memory hotplug AML, the iasl
compiler would give the following error:

dsdt.dsl 266: Return (MOST (_UID, Arg0, Arg1, Arg2))
Error 6080 - Called method returns no value ^

Signed-off-by: Yang Zhong <yang.zhong@intel.com>
---
 hw/acpi/memory_hotplug.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
index db2c4df961..893fc2bd27 100644
--- a/hw/acpi/memory_hotplug.c
+++ b/hw/acpi/memory_hotplug.c
@@ -686,15 +686,15 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
 
             method = aml_method("_OST", 3, AML_NOTSERIALIZED);
             s = MEMORY_SLOT_OST_METHOD;
-            aml_append(method, aml_return(aml_call4(
-                s, aml_name("_UID"), aml_arg(0), aml_arg(1), aml_arg(2)
-            )));
+            aml_append(method,
+                       aml_call4(s, aml_name("_UID"), aml_arg(0),
+                                 aml_arg(1), aml_arg(2)));
             aml_append(dev, method);
 
             method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
             s = MEMORY_SLOT_EJECT_METHOD;
-            aml_append(method, aml_return(aml_call2(
-                       s, aml_name("_UID"), aml_arg(0))));
+            aml_append(method,
+                       aml_call2(s, aml_name("_UID"), aml_arg(0)));
             aml_append(dev, method);
 
             aml_append(dev_container, dev);
-- 
2.19.1

