Received: by 10.223.197.9 with SMTP id q9csp370960wrf;
        Wed, 11 Oct 2017 01:33:44 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QD4vYosJ2PWMelmEZG5l4T1ySIn2UFl3MnLUl5ZghxKUM/Fdf+j+c/eCjQ44uM/PVTmL0Cd
X-Received: by 10.200.28.70 with SMTP id j6mr22931950qtk.78.1507710824444;
        Wed, 11 Oct 2017 01:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507710824; cv=none;
        d=google.com; s=arc-20160816;
        b=mOQ3HmKlXQRt/Y25RGQvnISIlzMv0a4WoVwIMne62zQGXWJJtM4Svqjv9RlEPcSuL0
         YZIuMZd63BXCCjjZgZ9CNuTT2arZaPhVAmWHRkD7EMZEmMIr7pjNtUwABnfWhuuCw/2Z
         nN036EnNiiYdjFRuhO5i6BgsWmBZQE7RQJl69HIBrDrv5wdDYnWfnGsE645seamdn34n
         vcoyokDn8uqv+xaQxWcTb2M6p/HWM2JlBUnCc3Y6GlKzjQy2iNl7148jxc9VAJEmHLr7
         kD8fOMYvDdpI7z0ANQVS3M66dCUBAawPYHmCUOxuczrpx6aT5ITjtzkgd0otVGIWx+wm
         m3Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=NKcRbqKNooxjeYWkwquOAWhM/lcIDd/UOR92Jyv6wyE=;
        b=oc+gm1F/ZfVc75u+xb9O+eg59o15KDCGH3rf25kKFcYdtZZrPBo8Ah81jjBSnnztlC
         pz13kRKJfeLA817TuaQdBuwbmmhFNUeR1PlsOvguzr6cohJOeCs2rksXMv79NC/UwUHP
         4IJbm6fZRqwYDznesT3s3a7H5ZZPKfvqk7Dqvl/NuFCaLCX0eYGRxzDALgbCBBHKfIZi
         6xVKDYYichavVJfVTl/hOwYZR8Wt0V+TxTIg6g9yPCZoyhF6cQeTXAs2DB7Hnq4VUVXX
         TLvWbgsq76+OYb/z/jqeUJINWhML5v5VUrexS9CTuR+UcQHuQVh1W7u2u2je0rGd3QL5
         Ngcg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m8si4128147qkm.214.2017.10.11.01.33.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Oct 2017 01:33:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39127 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2CSU-0002Po-AD
	for alex.bennee@linaro.org; Wed, 11 Oct 2017 04:33:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1e2CSJ-0002PV-PC
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 04:33:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1e2CSG-0001vF-Ne
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 04:33:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40724)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1e2CSG-0001tA-Gk; Wed, 11 Oct 2017 04:33:28 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B4091E318;
	Wed, 11 Oct 2017 08:33:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4B4091E318
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx06.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=imammedo@redhat.com
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.34.112.60])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7628918C74;
	Wed, 11 Oct 2017 08:33:26 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 11 Oct 2017 10:33:25 +0200
Message-Id: <1507710805-221721-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 11 Oct 2017 08:33:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] arm: fix armv7m_init() declaration to match
 definition
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MyBEyEWNHInN

s/cpu_model/cpu_type/ that has been forgotten during
conversion (ba1ba5cc), while touching the line also
fixup alignment.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/arm/arm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
index a3f79d3..ce769bd 100644
--- a/include/hw/arm/arm.h
+++ b/include/hw/arm/arm.h
@@ -25,7 +25,7 @@ typedef enum {
 
 /* armv7m.c */
 DeviceState *armv7m_init(MemoryRegion *system_memory, int mem_size, int num_irq,
-                      const char *kernel_filename, const char *cpu_model);
+                         const char *kernel_filename, const char *cpu_type);
 /**
  * armv7m_load_kernel:
  * @cpu: CPU
-- 
2.7.4

