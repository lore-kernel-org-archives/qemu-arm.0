Received: by 10.28.91.67 with SMTP id p64csp262886wmb;
        Wed, 21 Mar 2018 20:12:31 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvIumupF3lVrk6ELUYKkogb48sAKhLwElFwuKHW03lL4iLhrOOytSCfY7NhIxIfax+QyWUb
X-Received: by 10.55.114.5 with SMTP id n5mr32746056qkc.264.1521688351802;
        Wed, 21 Mar 2018 20:12:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521688351; cv=none;
        d=google.com; s=arc-20160816;
        b=b7qeaptA9Ju7xQEXEXrfciwbMLXAcfo3+rZoiQvpsQSaSwy8Ucf1F7ikS9xKfzMz1M
         6CXOatVBiGdfsUISXRt9CGOD+nRyunboxlj54kWdBBv7oKqjheda9shJU6LCjriMApli
         joyLBVvMa7b3rPmfEBtV9a0R8ot06TnkmJCmT+jQPNJhZQGwAl5rCEXSIGQApqVxnOEd
         9sRs66QFSkqEhjQPiKK+E+f9yLqdRJ4SbsmZmXBIoW69WxhaX/tDbSWw8bz/7MXKGSAq
         0fE8lLotJgqiQpCdwnlEuwzst1b1gMNFabXRXHt+VZGp4ktQ98BSJElO6KapUdlDpYWN
         4+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=DNrtQEjzAmIUXgQQeBR5KH8z6vQMMUsxjiE/pXq3te8=;
        b=bK6n4jHGifSA69SAj2rGRYfwG10GNq2iZqNtVSB8ybWpJBbrh64zETI9Ht9ohG7FVe
         9TxszNC6hWeGKMdqSTnzEzfgwK9DAGa45JeytAnL1RgiDcCGPGJCGKIuvxQL+WedEIV5
         fGC8pgKOL6iIywltNMJInx1JW6Tw8IHFCJmkfJbHQt52nozEfCU3P9M5JbEUe6bqclDU
         4Qng5C/eNWY76+baN0RcKcgTfhzTTXMw0LhvJZgMe36iaIxJmD0397ujL+ZHBckZG6pM
         g4IuLs+aIZP8po/4cASV1GdWefBjYYBTawWXQzNZmieFSMS1wttiPuEnbT8UFwiAEzab
         zIxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b4si5927537qtg.83.2018.03.21.20.12.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Mar 2018 20:12:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58563 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eyqeV-0008LZ-Ay
	for alex.bennee@linaro.org; Wed, 21 Mar 2018 23:12:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1eyqeN-0008KL-6S
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 23:12:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1eyqeH-0004Ad-Ti
	for qemu-arm@nongnu.org; Wed, 21 Mar 2018 23:12:23 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39966 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1eyqeH-0004AK-PL; Wed, 21 Mar 2018 23:12:17 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D535B402277B;
	Thu, 22 Mar 2018 03:12:16 +0000 (UTC)
Received: from weilaptop.redhat.com (ovpn-125-19.rdu2.redhat.com
	[10.10.125.19])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7EE5C215CDB7;
	Thu, 22 Mar 2018 03:12:16 +0000 (UTC)
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 21 Mar 2018 22:12:16 -0500
Message-Id: <20180322031216.14569-1-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 22 Mar 2018 03:12:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 22 Mar 2018 03:12:16 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'wei@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH 1/1] mach-virt: Set VM's SMBIOS system version to
 mc->desc
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tiwDGCqrqL6a

Instead of using "1.0" as the system version of SMBIOS, we should use
mc->desc for mach-virt machine type. With this patch, "dmidecode -t 1"
(e.g., "-M virt-2.12,accel=kvm") will show:

    Handle 0x0100, DMI type 1, 27 bytes
    System Information
            Manufacturer: QEMU
            Product Name: KVM Virtual Machine
            Version: QEMU 2.12 ARM Virtual Machine
            Serial Number: Not Specified
            ...

instead of:
    Handle 0x0100, DMI type 1, 27 bytes
    System Information
            Manufacturer: QEMU
            Product Name: KVM Virtual Machine
            Version: 1.0
            Serial Number: Not Specified
            ...

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2c07245047..da7228b297 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1132,6 +1132,7 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
 
 static void virt_build_smbios(VirtMachineState *vms)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(vms);
     uint8_t *smbios_tables, *smbios_anchor;
     size_t smbios_tables_len, smbios_anchor_len;
     const char *product = "QEMU Virtual Machine";
@@ -1145,7 +1146,7 @@ static void virt_build_smbios(VirtMachineState *vms)
     }
 
     smbios_set_defaults("QEMU", product,
-                        "1.0", false, true, SMBIOS_ENTRY_POINT_30);
+                        mc->desc, false, true, SMBIOS_ENTRY_POINT_30);
 
     smbios_get_tables(NULL, 0, &smbios_tables, &smbios_tables_len,
                       &smbios_anchor, &smbios_anchor_len);
-- 
2.14.3

