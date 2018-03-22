Received: by 10.28.71.155 with SMTP id m27csp844737wmi;
        Thu, 22 Mar 2018 14:23:29 -0700 (PDT)
X-Google-Smtp-Source: AG47ELswVWS6HYDqxVtaj7+y+5kU6rM6/zZAxIVFkCRXhdxwtvWLO0TIUKloE/8bNqdrgcw8DUSb
X-Received: by 10.55.217.145 with SMTP id q17mr38451478qkl.302.1521753809615;
        Thu, 22 Mar 2018 14:23:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521753809; cv=none;
        d=google.com; s=arc-20160816;
        b=FgJtVJGxzuZ2p9TBvqP9DzMV0IQa8DnTzXvruyJqO87NQ5nkDteCs1FDq4dSw63tv4
         cmIQu29x/gGF3Bc9uVyykiP27laBahdveEv1/83ZICgDmDy4TsBbMm0Na2z837wTRhkr
         ntXGSGlIunG6MqBW4C27+m83VkYcgjF7wteYsozHOtyGnlmcW7xRv5ixjeIvWZnO3ClH
         1+6Jolxak9WnOcP0I0cZubPMi5ZXNFE9o1pheaTBSAdPbLhxTtBgfJzWxJEMMrNV/DS3
         wPX0nbszPV23fa6Z4gwLuJd4gUzRmKwixe8+CCACdgGW/txx25qxcs0kOdWY+g/oUiPV
         ibpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=X7/9qcoHlUSyvpfMnUaFOfLwfpDGGGAvZd1K40NaboQ=;
        b=bAnJdIebg3XNriIDEpfoeggpBF61ccHOLVaT+fYiN1bNZ28cW0hDeHzhBLlkpUAu1W
         cPv5ShrHXEQDQ4ja1YGWHO/XmO9wUahsyqcqXI6H9vH8o9i/OrafCza5K1hqGoSJvAIP
         ZN0HDpCRajMfOF2J1KeH3fYc++w/aVzFnAqiHlgDW/dyCvoEBGxSJ5+f3pBfiB2fw0/W
         KBWquBnLiPT/vt5vBbyopaYY2RfzUUy4Q/Hc6tmsmmknt9BmGGJq2eo78aa4Z/ImBrs0
         XB/GofwUMPu4a7ynDW82hPZiPrRlCqc5rLwFRZF35VQ+rRcA0kuX0cPtY9KP/0U46XNY
         CDtw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q26si257364qtl.157.2018.03.22.14.23.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 14:23:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34954 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez7gH-00015E-5D
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 17:23:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46327)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ez7gA-000152-NE
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 17:23:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wei@redhat.com>) id 1ez7g7-0005ys-Im
	for qemu-arm@nongnu.org; Thu, 22 Mar 2018 17:23:22 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:43168 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wei@redhat.com>)
	id 1ez7g7-0005yl-Eb; Thu, 22 Mar 2018 17:23:19 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 10E18406E96C;
	Thu, 22 Mar 2018 21:23:19 +0000 (UTC)
Received: from weilaptop.redhat.com (ovpn-122-140.rdu2.redhat.com
	[10.10.122.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A333520316C3;
	Thu, 22 Mar 2018 21:23:18 +0000 (UTC)
From: Wei Huang <wei@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 22 Mar 2018 16:23:18 -0500
Message-Id: <20180322212318.7182-1-wei@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Thu, 22 Mar 2018 21:23:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Thu, 22 Mar 2018 21:23:19 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'wei@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH V2 1/1] mach-virt: Set VM's SMBIOS system version
 to mc->name
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, qemu-arm@nongnu.org,
	berrange@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lTx36unI17Vd

Instead of using "1.0" as the system version of SMBIOS, we should use
mc->name for mach-virt machine type to be consistent other architectures.
With this patch, "dmidecode -t 1" (e.g., "-M virt-2.12,accel=kvm") will
show:

    Handle 0x0100, DMI type 1, 27 bytes
    System Information
            Manufacturer: QEMU
            Product Name: KVM Virtual Machine
            Version: virt-2.12
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

For backward compatibility, we allow older machine types to keep "1.0"
as the default system version.

Signed-off-by: Wei Huang <wei@redhat.com>
---
 hw/arm/virt.c         | 8 +++++++-
 include/hw/arm/virt.h | 1 +
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 2c07245047..94dcb125d3 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1132,6 +1132,8 @@ static void *machvirt_dtb(const struct arm_boot_info *binfo, int *fdt_size)
 
 static void virt_build_smbios(VirtMachineState *vms)
 {
+    MachineClass *mc = MACHINE_GET_CLASS(vms);
+    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
     uint8_t *smbios_tables, *smbios_anchor;
     size_t smbios_tables_len, smbios_anchor_len;
     const char *product = "QEMU Virtual Machine";
@@ -1145,7 +1147,8 @@ static void virt_build_smbios(VirtMachineState *vms)
     }
 
     smbios_set_defaults("QEMU", product,
-                        "1.0", false, true, SMBIOS_ENTRY_POINT_30);
+                        vmc->smbios_old_sys_ver ? "1.0" : mc->name, false,
+                        true, SMBIOS_ENTRY_POINT_30);
 
     smbios_get_tables(NULL, 0, &smbios_tables, &smbios_tables_len,
                       &smbios_anchor, &smbios_anchor_len);
@@ -1646,8 +1649,11 @@ static void virt_2_11_instance_init(Object *obj)
 
 static void virt_machine_2_11_options(MachineClass *mc)
 {
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
     virt_machine_2_12_options(mc);
     SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_11);
+    vmc->smbios_old_sys_ver = true;
 }
 DEFINE_VIRT_MACHINE(2, 11)
 
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 33b0ff3892..ba0c1a4faa 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -85,6 +85,7 @@ typedef struct {
     bool no_its;
     bool no_pmu;
     bool claim_edge_triggered_timers;
+    bool smbios_old_sys_ver;
 } VirtMachineClass;
 
 typedef struct {
-- 
2.14.3

