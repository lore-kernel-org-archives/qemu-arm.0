Received: by 2002:a17:504:26c2:b0:1be9:327d:8ee3 with SMTP id j2csp447869nji;
        Wed, 28 Aug 2024 04:16:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXVX75hBmyQ3pmpskx7q+1wz9fQY7Y21ObEy5RIQr0IJKFd+aoIdMTItAa3HzZTPoHgPVh9kD/7Pc/6cw==@linaro.org
X-Google-Smtp-Source: AGHT+IFH4iSGMLSMhpNBTJNZxhcOtFdgLX8u+GV68MMdJZahgMzcSFoeAmaDSohIztN8ypeZrvfw
X-Received: by 2002:a05:690c:6a03:b0:615:22ff:b57d with SMTP id 00721157ae682-6d172053727mr18862477b3.42.1724843813725;
        Wed, 28 Aug 2024 04:16:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724843813; cv=none;
        d=google.com; s=arc-20160816;
        b=IZY2ND/zG5FNrH9I7zj4bgc/FlTVS2K1q5vw8Je5+b/TI9jTAbOhHymdRWCfDIeVDr
         DVSmQ4kQWFLHGIKV9Avzi6pLhi6ryDzjqD0k5mYfImeJVVWLP7tHnMjAkLMAtWRwu+Sv
         vm0sBJBdeIsJPEwdFZetM3KSpugXbzNTGPSj+7Rv/AGSNqBYOtJICIC3ctDe2P6wKa16
         DD2aIjRu8ExVlQ+mNef3ZEAZErZg7Rpw8Nq3NABWTDgHf99bd4sphNPpN1FMKmOYeVf/
         ks8RvXSCvAOkwDvibCDhgqQf/v+4MlwN9NVxi2GhDZIWTVqCykWPsLcaHb5H3us+1FP3
         MJdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=i0t4lRN9dU9Pe4EJ35gYd0AjbQzYP7iGGF1oS8/slwM=;
        fh=EBJJH4R4P+cYctxzT3H8oPG+VG5hu6LE/XNTDk1zDIw=;
        b=BcFBMQug4DyD5G93rZozBtt5P+hcbWJ4Yeh9r73Buxk16SZ105QpAI5tsZcr7rIlST
         gvlPgXL8SIrbZllb6bFQl8CQVP1/ceMuIkEdA7go5DBFBufHxkMXx43QzQsVUDCh93Wt
         LffzZhPnEaCHx87NEydf0871AZ01IPlmuII0fM3UBarObV3sYKamimIlN4FTtjpuF9cx
         EZPQOOQQnhsgh6aQN3/T/nfhs+D/zag3zSCBUKYTY1QkFvcpGOwCSIS6/wLcAxVxDn1Z
         BmegF1yNSlbadfTKSJv6Rd7SQVU2/SDHwx1pXa8lG+Eo5fG46tOHQvy4+ulrxttM7HCr
         s3lg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@apple.com header.s=20180706 header.b=YNyvpcyH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=REJECT dis=NONE) header.from=apple.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a67f40025fsi1621503785a.418.2024.08.28.04.16.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2024 04:16:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@apple.com header.s=20180706 header.b=YNyvpcyH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=REJECT dis=NONE) header.from=apple.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sjGes-0008Hw-1C; Wed, 28 Aug 2024 07:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danny_canter@apple.com>)
 id 1sjGep-0008Fr-BK
 for qemu-arm@nongnu.org; Wed, 28 Aug 2024 07:16:11 -0400
Received: from ma-mailsvcp-mx-lapp02.apple.com ([17.32.222.23])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danny_canter@apple.com>)
 id 1sjGem-0001xj-SZ
 for qemu-arm@nongnu.org; Wed, 28 Aug 2024 07:16:11 -0400
Received: from rn-mailsvcp-mta-lapp03.rno.apple.com
 (rn-mailsvcp-mta-lapp03.rno.apple.com [10.225.203.151])
 by ma-mailsvcp-mx-lapp02.apple.com
 (Oracle Communications Messaging Server 8.1.0.23.20230328 64bit (built Mar 28
 2023)) with ESMTPS id <0SIX00IYBDYSZN00@ma-mailsvcp-mx-lapp02.apple.com> for
 qemu-arm@nongnu.org; Wed, 28 Aug 2024 04:16:07 -0700 (PDT)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=apple.com; h=cc :
 content-transfer-encoding : date : from : in-reply-to : message-id :
 mime-version : references : subject : to; s=20180706;
 bh=i0t4lRN9dU9Pe4EJ35gYd0AjbQzYP7iGGF1oS8/slwM=;
 b=YNyvpcyH1jnsgoZd5ZZP0vwCNMy0USl3JIMB8Jd1GGYbrvDMGcFeoASuWkSi7p2hCKmz
 oMMLtEdkbRi0gbrvCymZBN/GUwaI/uZTQSdWBLawVnnyD54TqlnYl6H+TnYEWPtIBSd6
 dN3bEDZ6WRU3ca841tcIuZs8m7FgTOwfQ7wptDMaMnuRBQZ9T3pDy2wQgeYuB+efowJF
 LAp2xBtYAFFglCDLAZ5LH46xleu3KyiSXZSGAWq7c49SwiRPlQio91LYa+6Vtyo0WjjE
 IaF5mdu3lAwhNIWw1DxLE/2qXuJ8ifaY8Nrr614eP24hEHV8mQcdVdajlpchL+vC8cx4 fg==
Received: from mr55p01nt-mmpp02.apple.com
 (mr55p01nt-mmpp02.apple.com [10.170.185.213])
 by rn-mailsvcp-mta-lapp03.rno.apple.com
 (Oracle Communications Messaging Server 8.1.0.23.20230328 64bit (built Mar 28
 2023)) with ESMTPS id <0SIX00TIPDYSD2G0@rn-mailsvcp-mta-lapp03.rno.apple.com>; 
 Wed, 28 Aug 2024 04:16:05 -0700 (PDT)
Received: from process_milters-daemon.mr55p01nt-mmpp02.apple.com by
 mr55p01nt-mmpp02.apple.com
 (Oracle Communications Messaging Server 8.1.0.23.20230328 64bit (built Mar 28
 2023)) id <0SIX2GG00DAAEB00@mr55p01nt-mmpp02.apple.com>; Wed,
 28 Aug 2024 11:16:04 +0000 (GMT)
X-Va-A: 
X-Va-T-CD: 18a8a04ab20a1763aa377ff80017b310
X-Va-E-CD: c13b7f7cc12ce2f16c251fdd97a40a82
X-Va-R-CD: ee330e5ae513338cb9344cc6b765642c
X-Va-ID: 3238671a-3eff-4ed3-ab21-f585b80780f6
X-Va-CD: 0
X-V-A: 
X-V-T-CD: 18a8a04ab20a1763aa377ff80017b310
X-V-E-CD: c13b7f7cc12ce2f16c251fdd97a40a82
X-V-R-CD: ee330e5ae513338cb9344cc6b765642c
X-V-ID: 32a7c134-2d57-43e9-9b4b-a7b187681e39
X-V-CD: 0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-28_03,2024-08-27_01,2024-05-17_01
Received: from Mac.apple.com ([17.11.139.69]) by mr55p01nt-mmpp02.apple.com
 (Oracle Communications Messaging Server 8.1.0.23.20230328 64bit (built Mar 28
 2023)) with ESMTPSA id <0SIX2GJ1IDYJB800@mr55p01nt-mmpp02.apple.com>; Wed,
 28 Aug 2024 11:16:04 +0000 (GMT)
From: Danny Canter <danny_canter@apple.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: dirty@apple.com, rbolshakov@ddn.com, agraf@csgraf.de,
 peter.maydell@linaro.org, pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, mst@redhat.com, marcel.apfelbaum@gmail.com,
 philmd@linaro.org, wangyanan55@huawei.com, zhao1.liu@intel.com,
 danny_canter@apple.com
Subject: [PATCH v2 1/3] hw/boards: Add hvf_get_physical_address_range to
 MachineClass
Date: Wed, 28 Aug 2024 04:15:50 -0700
Message-id: <20240828111552.93482-2-danny_canter@apple.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-reply-to: <20240828111552.93482-1-danny_canter@apple.com>
References: <20240828111552.93482-1-danny_canter@apple.com>
MIME-version: 1.0
Content-transfer-encoding: 8bit
Received-SPF: pass client-ip=17.32.222.23; envelope-from=danny_canter@apple.com;
 helo=ma-mailsvcp-mx-lapp02.apple.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: R1QVKrWAV4L0

This addition will be necessary for some HVF related work to follow.
For HVF on ARM there exists a set of APIs in macOS 13 to be able to
adjust the IPA size for a given VM. This is useful as by default HVF
uses 36 bits as the IPA size, so to support guests with > 64GB of RAM
we'll need to reach for this.

To have all the info necessary to carry this out however, we need some
plumbing to be able to grab the memory map and compute the highest GPA
prior to creating the VM. This is almost exactly like what kvm_type is
used for on ARM today, and is also what this will be used for. We will
compute the highest GPA and find what IPA size we'd need to satisfy this,
and if it's valid (macOS today caps at 40b) we'll set this to be the IPA
size in coming patches. This new method is only needed (today at least)
on ARM, and obviously only for HVF/macOS, so admittedly it is much less
generic than kvm_type today, but it seemed a somewhat sane way to get
the information we need from the memmap at VM creation time.

Signed-off-by: Danny Canter <danny_canter@apple.com>
---
 hw/arm/virt.c       | 9 ++++++++-
 hw/i386/x86.c       | 2 ++
 include/hw/boards.h | 5 +++++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 687fe0bb8b..62ee5f849b 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -2107,7 +2107,8 @@ static void machvirt_init(MachineState *machine)
 
     /*
      * In accelerated mode, the memory map is computed earlier in kvm_type()
-     * to create a VM with the right number of IPA bits.
+     * for Linux, or hvf_get_physical_address_range() for macOS to create a
+     * VM with the right number of IPA bits.
      */
     if (!vms->memmap) {
         Object *cpuobj;
@@ -3027,6 +3028,11 @@ static int virt_kvm_type(MachineState *ms, const char *type_str)
     return fixed_ipa ? 0 : requested_pa_size;
 }
 
+static int virt_hvf_get_physical_address_range(MachineState *ms)
+{
+    return 0;
+}
+
 static void virt_machine_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
@@ -3086,6 +3092,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
     mc->valid_cpu_types = valid_cpu_types;
     mc->get_default_cpu_node_id = virt_get_default_cpu_node_id;
     mc->kvm_type = virt_kvm_type;
+    mc->hvf_get_physical_address_range = virt_hvf_get_physical_address_range;
     assert(!mc->get_hotplug_handler);
     mc->get_hotplug_handler = virt_machine_get_hotplug_handler;
     hc->pre_plug = virt_machine_device_pre_plug_cb;
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 01fc5e6562..fa7a0f6b98 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -382,6 +382,8 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     mc->get_default_cpu_node_id = x86_get_default_cpu_node_id;
     mc->possible_cpu_arch_ids = x86_possible_cpu_arch_ids;
     mc->kvm_type = x86_kvm_type;
+    /* Not needed for x86 */
+    mc->hvf_get_physical_address_range = NULL;
     x86mc->save_tsc_khz = true;
     x86mc->fwcfg_dma_enabled = true;
     nc->nmi_monitor_handler = x86_nmi;
diff --git a/include/hw/boards.h b/include/hw/boards.h
index 48ff6d8b93..bfc7cc7f90 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -215,6 +215,10 @@ typedef struct {
  *    Return the type of KVM corresponding to the kvm-type string option or
  *    computed based on other criteria such as the host kernel capabilities.
  *    kvm-type may be NULL if it is not needed.
+ * @hvf_get_physical_address_range:
+ *    Returns the physical address range in bits to use for the HVF virtual
+ *    machine based on the current boards memory map. This may be NULL if it
+ *    is not needed.
  * @numa_mem_supported:
  *    true if '--numa node.mem' option is supported and false otherwise
  * @hotplug_allowed:
@@ -256,6 +260,7 @@ struct MachineClass {
     void (*reset)(MachineState *state, ShutdownCause reason);
     void (*wakeup)(MachineState *state);
     int (*kvm_type)(MachineState *machine, const char *arg);
+    int (*hvf_get_physical_address_range)(MachineState *machine);
 
     BlockInterfaceType block_default_type;
     int units_per_default_bus;
-- 
2.39.5 (Apple Git-154)

