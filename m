Received: by 10.25.85.209 with SMTP id j200csp1154047lfb;
        Mon, 13 Jun 2016 04:46:19 -0700 (PDT)
X-Received: by 10.200.53.142 with SMTP id k14mr14450755qtb.63.1465818379716;
        Mon, 13 Jun 2016 04:46:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j14si14900498qke.268.2016.06.13.04.46.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 04:46:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@CAVIUMNETWORKS.onmicrosoft.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55634 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCQJv-0006Ht-2h
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 07:46:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>) id 1bCQGB-0002iT-6s
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 07:42:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>) id 1bCQG6-0005B2-VJ
	for qemu-arm@nongnu.org; Mon, 13 Jun 2016 07:42:26 -0400
Received: from mail-bn1on0089.outbound.protection.outlook.com
	([157.56.110.89]:37504
	helo=na01-bn1-obe.outbound.protection.outlook.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Vijaya.Kumar@cavium.com>)
	id 1bCQG6-0005As-ND; Mon, 13 Jun 2016 07:42:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=CAVIUMNETWORKS.onmicrosoft.com; s=selector1-cavium-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=FkYU9qFZGRLs6rBIGVdSkBbZl5X4zEnGKh/siELmB+Y=;
	b=GJPQ6RuB9vXuIIuvjGuIkh0ZQj+W42jdLwiPlHkomuQrnU3k2/ZtCVMNX7ZK5mj9XtG6MEik04rKPNP8gHJa9vADvDn7Ky5MqejRO772Z0psgawgisLSXTrXC+uLhvPqWitGyZB8iFXY6XLvpASlC6TZbuMoI/CY0Or90iK6Db0=
Authentication-Results: spf=none (sender IP is )
	smtp.mailfrom=Vijaya.Kumar@cavium.com; 
Received: from cavium-Vostro-2520.caveonetworks.com (111.93.218.67) by
	BY1PR0701MB1689.namprd07.prod.outlook.com (10.162.110.27) with
	Microsoft SMTP
	Server (TLS) id 15.1.511.8; Mon, 13 Jun 2016 09:09:44 +0000
From: <vijayak@caviumnetworks.com>
To: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <pbonzini@redhat.com>, 
	<quintela@redhat.com>
Date: Mon, 13 Jun 2016 14:38:35 +0530
Message-ID: <1465808915-4887-5-git-send-email-vijayak@caviumnetworks.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
References: <1465808915-4887-1-git-send-email-vijayak@caviumnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [111.93.218.67]
X-ClientProxiedBy: MAXPR01CA0015.INDPRD01.PROD.OUTLOOK.COM (10.164.147.22) To
	BY1PR0701MB1689.namprd07.prod.outlook.com (10.162.110.27)
X-MS-Office365-Filtering-Correlation-Id: bf7c0189-e02c-4cb2-ebe7-08d3936a776b
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	2:tDVo0s2WhH7uCU8eB7dilyp05Qs76SuWs6KD6JZShTLzsA2cjeH4p1Uic/KOCYdRVUZpqFOlYbhy1ENHBWBftwpCK0/wqOvw6CsQGMSBendSSawdoAjGvdQRYuEZdsz/uS0JL2C3K2bLYIr0HZvmJctRX8/lCC8jRLOgFRvprIR9vQr5+IMLOPiu6CkK/ZUY;
	3:IfyyozJ0ozc1KI8jFESgqA0X3v5UfG8hFkd58Qw968LxV3SKlSJms5XyR9NS5Cxh3Jz8qACj31KdiY7To9GAUrcnk8M/dLjU7c5x5wmXeVXcpf2nvGl8yo2pGfdVYg/T
X-Microsoft-Antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:BY1PR0701MB1689;
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	25:wR46fEd3MBmsJwraHtu2Xpnzyqxicsd+nTOuH7v+TJGzFrm2tiBchWiOcg6RfdfuDO+FFFJFoWsuOCS0pCn47qexPBy95w7WUjgthZRBaIhI63zruI4o6wbBgzsgX2VUYqoijRZpBMWfOQjBvLmL963PizTgTCC4ASW3e3a0aoXq9nJPq8r7g24f7otAjZYHEB70P6GZUFucNWcLeSbzU4E7pO4/7URA4DOWSfxQnhbnSQncSoCkHGYeRoZp1KgXIx2p1QD+m7usAyvKO+y9ugMMyScaPTH1th3YjLwj7RkSsonlPuKkvCThBEXQAUP72qHYGo20S7IgJ8z6fJVfmnsCfo6YJtiZiy/VaekW5CQHkDSRYxxWIuUoMGEN9Sx/1DrgAwLQftrrCI8SOztiNeolHNY/BvFugmctHWx6xZcn0bIj1tU3RNue4HUOMn+73Jvt6Ne0/sj+rEnmb87KCzdQeY9uyT2QYgoxm3twvsCJZfhoZKVVJURG0fOU3CTneuc0fkKFvC/nHP0K9wvAd4byCAmIb4xSYx+vR9NJp4wJRVTdZHAV/WWhMticnmxQRlHMWtwlDogr/tiqKRyEaNwt/4Vc5eM4iPIbNDroFWJg1YoRn4/eMDO8e9cY7p8yGqRF6kaDQYv+dxmujqpQoXh06CB7TsZlVN1djumJNCRr4fIyJIwZsPJD9AEtdkwSVFB7Zpx5yqhNvDl/ls4ne7AToHSqtmQcQbuPp/rCbN+iRlwOSQbTelGPps8g10QJ
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	20:om7LRb+MFFG289YvlFi88U8C1zooHCLuZQH3sGsVrLEgTov2/G2bGEzi2c/4cKwWXy9C3VD6A2HVpGWKepVc4O/nIqgCFway/w+8d6fT+HWzSPg53J8BgZ1Cp5PYilBE6iKx3n782+lWumnRszZ0eB87T/ahEPBunMZZRpmJw+14ecJFNBOtEyhLMTt7jbjRuyGcxe8/z/td2RjLys0h/bqzzdXiDCapm0wvJS6qpBjYgcGCtMGtCoLZHxCWdQKGeF7YGgiPp67SI1Nk8qiVQHSURB2VILU7/0GXrf+5CWhwdgMieGN5TI+j6yTlEAD2NmaxDJE46ue3BBpc774z4x8e2vBDmaePzGmxYfTQzqe/8JdgKedQc8A65f82E8bjeMD2zfJJvPiY0jpc/q+FDctVMQHt5/UK2txmYotCo6e0IUUeH/cngCZ0RAajL9rVB07pcfXAKxK3nginIZK3aXXeVw/wfA8mVLZYPCSMlfp791Biu/rvY/gpWiB8FTW9pcbOldLC44C8Syj/WkOMnA6lzdxtKkzUokt7czvAzrhv3iDtihHt2YO1PkgZArfUfdK7ImW7E7dlJZ0LcZuMf4P9RXCP4OaVoAi5RVHeFzM=
X-Microsoft-Antispam-PRVS: <BY1PR0701MB1689996819E99321C71DA1A4F2530@BY1PR0701MB1689.namprd07.prod.outlook.com>
X-Exchange-Antispam-Report-Test: UriScan:(788757137089);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(5005006)(8121501046)(10201501046)(3002001);
	SRVR:BY1PR0701MB1689; BCL:0; PCL:0; RULEID:;
	SRVR:BY1PR0701MB1689; 
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	4:VtXB3qywlEvxPQHj6khFSFZ1TT2o2RHr0gtevuGkn6BjxmEE4TaL2bYE2avq+sH6R1YSxVnam89Z91RHTmbZ7qY5z8PZRZVR4H7p3wXaZr2dtcFi2jl6c75Dr0t+0lJP2fSg3ne8VSydujd3iijAMPe+uSiM9t57DnFA4+PJxjQw8re/UWJEeOB47cwJZ0IuQBenIKDoG8834l1QzD4ZTXiqfoXlKxTc9MBAB3/mX9zjV3VBaiG/G6AESKmDHkwnDyUPXmmCoywwVYg9HgRkNewq85AEJ2A4qF4TaWytYU+Ux/5GOvDyl/xG3WTUlNtnLr8/pL6C4TqprmxbZrJW0bBs0kscyWsr1m8kPR6uGMeGA9nm6UEybol3f9OBfVIORwz5Koinzs5unAUbzo7Q9btynqTCZx+aaFo2psufdL8=
X-Forefront-PRVS: 0972DEC1D9
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(7916002)(189002)(199003)(47776003)(66066001)(5008740100001)(33646002)(8676002)(4326007)(48376002)(81166006)(50466002)(106356001)(107886002)(81156014)(105586002)(5003940100001)(229853001)(5001770100001)(97736004)(189998001)(2950100001)(2906002)(101416001)(36756003)(5004730100002)(50986999)(50226002)(42186005)(68736007)(2876002)(53416004)(586003)(86152002)(6116002)(3846002)(69596002)(77096005)(5009440100003)(4001430100002)(19580405001)(2201001)(76176999)(19580395003)(92566002)(7099028)(2101003)(217873001)(4720700001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY1PR0701MB1689;
	H:cavium-Vostro-2520.caveonetworks.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
Received-SPF: None (protection.outlook.com: cavium.com does not designate
	permitted sender hosts)
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; BY1PR0701MB1689;
	23:l1CSgyHgHhI0vJ6d9MppBKuj5MaI4IEufIYCBrs?=
	=?us-ascii?Q?tOFFZhHJWhD6BUsNzWri3mw66AEsmrGFOligIRcTvIVF75h3GW19JEE8MnFK?=
	=?us-ascii?Q?inmAhQM91IAJzuhaFr+rBFZNEhe31DDGML2OTXyOLC8c3qm+ldLEscu/y1fl?=
	=?us-ascii?Q?VOSXNtT5J7zmiy/DQ8V+SN01d3b8ROLNRmVhay3Li6mnecqHOUYXPYTYxpqD?=
	=?us-ascii?Q?21LhMFqeg29h4A23meVXj6XJZd8GDJ24DxHeGBbcor9lNUwFgkVpPmdTh3kD?=
	=?us-ascii?Q?K1C+j4+ptRdJ51SdwzowHwklLaoeUMW+XvC7iVOShYcmL7HE8nzVvpYfq4g7?=
	=?us-ascii?Q?3Wdvv5C0LA8K/oR0vcCg1UAHX6NGudY6A6Gd/SbcKl67Q+Qadgd7SJdRuLqQ?=
	=?us-ascii?Q?BgVBlNL5/IOkFdNmf1ZzX3rvVPlBoCpULoej6Zlyw3MdwSBNpDIutNXiT0Jt?=
	=?us-ascii?Q?niGyeG6M5K4p/Napt7gi2tJS8oD/huot6qVeA2/YV9PWEvRIOP74ROETPOqs?=
	=?us-ascii?Q?y05IVZHMluYIxzE2FgPu8nmTI2bk8uq6aM7rIfkgeHYnAdKWd5ch/gRVfT78?=
	=?us-ascii?Q?tPOxxnNbdFu23A7fVhOTBa05JMsQXERMgaoj+2I83qDQ0jocXv0zsKmxjwYu?=
	=?us-ascii?Q?iEUOFCBKV7lWVBDNgdAHMeQgx7754OaJVwRLjfCE5Bl0Uqe5fSXO29OqZl0+?=
	=?us-ascii?Q?3UqsScfB3PoP7CZo5LXXH9RhJIjqJ06G8atFWoOsqccVwRvlocmOpUDEgENx?=
	=?us-ascii?Q?tCoqtIpcSMfIhIma1sCbFtIU5RfDMdJ3jmCoW9EEhDD9ZIeJKJKzS26MsMVf?=
	=?us-ascii?Q?WVaq0aK0N5cgr5ZmVdOQVdxHwpdzRM+IzGS5vC9rVmwUx8qDUYY3dmbwjhkj?=
	=?us-ascii?Q?SugEC7/aXwHlDrbHFeseizaa89rzDYepqNIpRVaBnVt9TXyodtsuCoahrkIE?=
	=?us-ascii?Q?anEHwJ7pFnc2DcCQeJSmhfvj6xgCyOwF9+kMarE1fhqD8OhQZsDNVt5zSUIZ?=
	=?us-ascii?Q?JVWeGHHA58qO3TGZmnlRuBHqW5oXYOAQlmFdSB+LqyHUrZUznG+buT9uJPT/?=
	=?us-ascii?Q?e1PY2cRxWfjhcebpcJNKNkzRdN9Qqwoujp4i14V2j8ZIVO7Sk1Vlq2egptoM?=
	=?us-ascii?Q?x87508tNT2B6G6EiK7tmZZvB4DX+ciSMlswsjTEqCYI10qJ5yNJE8kURddXy?=
	=?us-ascii?Q?TMpsrPO60ibwL3mzdkp1I1IqdSJtzAgEJO/C/lvRvdENEz/2v86O3Ug2caO2?=
	=?us-ascii?Q?Q7KSVMDHOdQhaI4dCRYMyZfBYoEmaUl3Lxq6iHSEw+c68ADlHE74U4dmFiRC?=
	=?us-ascii?Q?WmIT/V1908pD/JQCVr7JGsK0=3D?=
X-Microsoft-Exchange-Diagnostics: 1; BY1PR0701MB1689;
	5:b5JAvB81ZSvglkcFv6oiAAua0fKa3sVLSswwHqTTNPruv1CSTs0yeDlCLyeU4UXAZN5IcBmkfP3pn8lUASaCrDVFJ+vcWvMQnUpCQlcJVExgT+hkbi/czJaxm8W2vBrJVrtdtJq8BpMrxWuKMQBIyg==;
	24:2TUPjxo4GzVXjEy2KutprPrv2Wx3GS1tBaue6mp7mAKZ9bXiJnYo5/2GCgRtlBVYPPKmJlYxRrntvMQt8Rlvb8ftCgiIhIYaAfiXe/Rz9cg=;
	7:ja4HxjKlbdaTHboB3HIfRU4CTrkXB80uXQr93OcdhTriD3lTAwDPsXr6VLGAoADOWm8AD5XT4V+pWOi3DY9zidv1UXUJcQE4lWBRl+dwQNQzQGgtdcxDZpxzIHtOaGkKU4auhj6XVZW11OkDfGXluptlMgKwZL8ka20K92nFTfgiojai97AQpWEQFC/OX9Q3u+Iw432nwxnkE2KMhYGqxPnEQllL1xjc5MzBaZXE9j0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-OriginatorOrg: caviumnetworks.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2016 09:09:44.4728 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR0701MB1689
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8
X-Received-From: 157.56.110.89
Subject: [Qemu-arm] [RFC PATCH v1 4/4] target-arm: Compute page size based
 on ARM target cpu type
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
Cc: Prasun.Kapoor@caviumnetworks.com, Vijaya Kumar K <vijayak@cavium.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	qemu-devel@nongnu.org, vijay.kilari@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Gyvdhgk99qSo

From: Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>

Replace TARGET_PAGE_BITS with arm_target_page_size function
in order to fetch page size at run-time.

Introduced MachineClass callback to compute target page
size at the early boot before memory initialization.
This callback is currently implemented for ARM platforms.
Based on cpu_model, the page size is updated in
target_page_bits which is defined as TARGET_PAGE_BITS.

Signed-off-by: Vijaya Kumar K <vijayak@cavium.com>
---
 hw/arm/virt.c       |   48 ++++++++++++++++++++++++++++++++++++++++++++++++
 include/hw/boards.h |    1 +
 target-arm/cpu.h    |   12 +++++++-----
 vl.c                |    7 +++++++
 4 files changed, 63 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 73113cf..37aab33 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -90,6 +90,12 @@ typedef struct {
     int32_t gic_version;
 } VirtMachineState;
 
+/*
+ * Holds TARGET_AARCH_64_PAGE_BITS or TARGET_ARM_PAGE_BITS
+ * based on the the cpu type emulated at runtime.
+ */
+static uint32_t target_page_bits;
+
 #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
 #define VIRT_MACHINE(obj) \
     OBJECT_CHECK(VirtMachineState, (obj), TYPE_VIRT_MACHINE)
@@ -1099,6 +1105,47 @@ void virt_guest_info_machine_done(Notifier *notifier, void *data)
     virt_build_smbios(&guest_info_state->info);
 }
 
+static void machvirt_update_target_page_size(const char *cpu_model)
+{
+    char **cpustr;
+    ObjectClass *oc, *parent;
+    const char *parent_type;
+    /* Set to default page size */
+    uint32_t page_bits = TARGET_ARM_PAGE_BITS;
+
+    cpustr = g_strsplit(cpu_model, ",", 2);
+    if (!strcmp(cpustr[0], "host")) {
+#ifdef __aarch64__
+        page_bits = TARGET_AARCH64_PAGE_BITS;
+#else
+        page_bits = TARGET_ARM_PAGE_BITS;
+#endif
+        goto out;
+    }
+
+    oc = cpu_class_by_name(TYPE_ARM_CPU, cpustr[0]);
+    if (!oc) {
+        oc = cpu_class_by_name(TYPE_AARCH64_CPU, cpustr[0]);
+        if (!oc)
+           goto out;
+    }
+
+    parent = object_class_get_parent(oc);
+    if (!parent)
+       goto out;
+
+    parent_type = object_class_get_name(parent);
+    if (!strcmp(parent_type, TYPE_AARCH64_CPU))
+       page_bits = TARGET_AARCH64_PAGE_BITS;
+out:
+    target_page_bits = page_bits;
+}
+
+uint32_t arm_get_target_page_bits(void)
+{
+    return target_page_bits;
+}
+
 static void machvirt_init(MachineState *machine)
 {
     VirtMachineState *vms = VIRT_MACHINE(machine);
@@ -1376,6 +1423,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->block_default_type = IF_VIRTIO;
     mc->no_cdrom = 1;
     mc->pci_allow_0_address = true;
+    mc->update_target_page_size = machvirt_update_target_page_size;
 }
 
 static const TypeInfo virt_machine_info = {
diff --git a/include/hw/boards.h b/include/hw/boards.h
index d268bd0..1e8abb6 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -124,6 +124,7 @@ struct MachineClass {
                                            DeviceState *dev);
     unsigned (*cpu_index_to_socket_id)(unsigned cpu_index);
     CPUArchIdList *(*possible_cpu_arch_ids)(MachineState *machine);
+    void (*update_target_page_size)(const char *cpu_model);
 };
 
 /**
diff --git a/target-arm/cpu.h b/target-arm/cpu.h
index 17d8051..f593620 100644
--- a/target-arm/cpu.h
+++ b/target-arm/cpu.h
@@ -1743,14 +1743,16 @@ bool write_cpustate_to_list(ARMCPU *cpu);
 #define ARM_CPUID_TI915T      0x54029152
 #define ARM_CPUID_TI925T      0x54029252
 
-#if defined(CONFIG_USER_ONLY)
-#define TARGET_PAGE_BITS 12
-#else
+uint32_t arm_get_target_page_bits(void);
+/*
+ * Minimum page size for aarch64 is 4K
+ */
+#define TARGET_AARCH64_PAGE_BITS 12
 /* The ARM MMU allows 1k pages.  */
 /* ??? Linux doesn't actually use these, and they're deprecated in recent
    architecture revisions.  Maybe a configure option to disable them.  */
-#define TARGET_PAGE_BITS 10
-#endif
+#define TARGET_ARM_PAGE_BITS 10
+#define TARGET_PAGE_BITS arm_get_target_page_bits()
 
 #if defined(TARGET_AARCH64)
 #  define TARGET_PHYS_ADDR_SPACE_BITS 48
diff --git a/vl.c b/vl.c
index b6da265..a317cf1 100644
--- a/vl.c
+++ b/vl.c
@@ -4045,6 +4045,13 @@ int main(int argc, char **argv, char **envp)
     object_property_add_child(object_get_root(), "machine",
                               OBJECT(current_machine), &error_abort);
 
+    /*
+     * Compute target page size dynamically if arch supports
+     * multiple page sizes. Ex: ARM
+     */
+    if (machine_class->update_target_page_size)
+        machine_class->update_target_page_size(cpu_model);
+
     init_l1_page_table_param();
 
     cpu_exec_init_all();
-- 
1.7.9.5

