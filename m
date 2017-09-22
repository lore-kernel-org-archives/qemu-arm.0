Received: by 10.223.172.38 with SMTP id v35csp3145155wrc;
        Fri, 22 Sep 2017 06:51:33 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QA6hwRwZ4MK3ypra0jAkyPfZQPQpY6mDwAOqnGcQXnQnywspCN0Am4vRzmTV6wiEJUuki4m
X-Received: by 10.55.150.199 with SMTP id y190mr8390416qkd.180.1506088292959;
        Fri, 22 Sep 2017 06:51:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1506088292; cv=none;
        d=google.com; s=arc-20160816;
        b=T23OctfWHuXX9LwbS/OUYnx2+GfE3fBlrptTeaqRjan8cLIeuE9rQHz9UUqMpc6mk8
         o0jxTEsV+0AVh9ivtI5gX6Pb6T+NeulioByZy5n+iBtuCTwatLwHWG1g6lIXY88t3eRq
         mEXrLRsHvnwwBRO6FmYYRWiRUINgLMazmQlPXpujh5IeT4NSTHQx/myWz+8xzTqQvccb
         hnPbgaf/kQXPY0qksoMmIfPS1s2lCzjAjWgiIBKDHsncU6osrXc8syfdlX9LBVhBTsaN
         gyn/npBrJTbiGIQFn6C2QnYiskwWt9OPMprUf+yTClPGsOzJuN6p/P42PLTXjYTqN1Bv
         /OBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=l3XZ0l9ypOs5nRgGfu+EYOIreodQaX/NvV05fac877g=;
        b=rNyuGVfn5C8Psdp/WulbH7M9tymBsYIlaZqF1+sZKe0BQrAVX7DRYVWb5Y+8ll8Hmq
         xjRdSWQtG6CSkMGWahqrNEx1UZcVfeL4GXFbDWmr+dLBisDVtMmHFvUOwKudyNOd40Km
         xYcXWw2dNfGe/lS13w/XQ+aZjQz0kOdkIZz0Ev+ZagzNdYZpUEB+TTQ+YF8w1azPknQe
         CbdET2VXUP7HWVaAAOyajjy3RdL049V1Mlw3O/7uSFJ+KN0NP8m3pwNs6HmqcdVEIztf
         ohInHIkatX5nXVWiQ2UHv2FdfZIsYiN8b1F1W4G9bqHNUY8lytVNO6p3ZnHNjaD9d3hO
         Gh1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c83si3724007qkb.39.2017.09.22.06.51.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Sep 2017 06:51:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59033 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dvOMc-0003DM-3m
	for alex.bennee@linaro.org; Fri, 22 Sep 2017 09:51:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51379)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1dvOMT-0003DE-As
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 09:51:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1dvOMQ-0004ou-9l
	for qemu-arm@nongnu.org; Fri, 22 Sep 2017 09:51:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40782)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1dvOMQ-0004oY-3X; Fri, 22 Sep 2017 09:51:18 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BF22C01BC95;
	Fri, 22 Sep 2017 13:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 5BF22C01BC95
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=wei@redhat.com
Received: from weilaptop.redhat.com (ovpn-123-111.rdu2.redhat.com
	[10.10.123.111])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B4E9163F7A;
	Fri, 22 Sep 2017 13:51:15 +0000 (UTC)
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 22 Sep 2017 08:51:15 -0500
Message-Id: <1506088275-31734-1-git-send-email-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 22 Sep 2017 13:51:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 1/1] mach-virt: Set VM's SMBIOS system version to
 mc->name
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
X-TUID: iRdIyiCnXBba

Instead of using "1.0" as the system version of SMBIOS, we should use
mc->name for mach-virt machine type. This matches with x86 code and
prevents the smbios_table.machine_type test of Avocado from failing.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 9e18b41..8d0c6a9 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1189,6 +1189,7 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
 
 static void virt_build_smbios(VirtMachineState *vms)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(vms);
     uint8_t *smbios_tables, *smbios_anchor;
     size_t smbios_tables_len, smbios_anchor_len;
     const char *product = "QEMU Virtual Machine";
@@ -1202,7 +1203,7 @@ static void virt_build_smbios(VirtMachineState *vms)
     }
 
     smbios_set_defaults("QEMU", product,
-                        "1.0", false, true, SMBIOS_ENTRY_POINT_30);
+                        mc->name, false, true, SMBIOS_ENTRY_POINT_30);
 
     smbios_get_tables(NULL, 0, &smbios_tables, &smbios_tables_len,
                       &smbios_anchor, &smbios_anchor_len);
-- 
2.7.5

