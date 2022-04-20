Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp2880230lfk;
        Tue, 19 Apr 2022 22:20:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwz94IN9iB/wAqAdABn1RwtnJ78joa4I1XamwWjZTkc8E0oyGMoEdyPfD3mbTQwpIi3hbrF
X-Received: by 2002:a05:6214:2aab:b0:446:4053:7a2b with SMTP id js11-20020a0562142aab00b0044640537a2bmr14045185qvb.127.1650432008908;
        Tue, 19 Apr 2022 22:20:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650432008; cv=none;
        d=google.com; s=arc-20160816;
        b=JAOUlkshVfTo6n4daBMoUK0bLRWI5v2raRTtQnqjJInJmxU9f7SGwsX/BF+NM7Hnyo
         oC++EVaJl/ypVNcFeskSD56iqNqFk5iGnzXpJ1hMWwQyF69xDBFmX8MjRokYP4xpQoCn
         sxcraEchI3WQsBoxUCeHTUIBRUfdc8ZqAswpdc6ggT4aOcoVITXkqkVK1P5ct068yti+
         8sbqI/9eSuNPqgSunmLJih8Qv7y4+j7ZCbexE2zovKUQfxsnDdxk+jHd+acJhODdmzSA
         XB8hZWzOSpNC3vf/aVjRS0fZT85jrapnCCtFeVUtBM0uPDB45/VlyTu/2I8c+AMqRZx4
         lu8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:dkim-signature;
        bh=CthGyJ4nVrE5CyGzlplCI/zJfUHXmc+ejdNz08fkw5c=;
        b=AqZUq0Yzxr97YvgDL5r59Bnvyn+kQOxgf6N0mdJtldlWGoE+f02IQpzk8PsXz2bAPY
         i+k0enoBVtOyd8nPN/I2kUq0L6yCdQ/KMhYQzddO7fxl96y/GK80r/T6BehvD68cCI5v
         BoR2VKWBVsGObCx/8WpNmVhMSggdAHd6JDNGyigp/cMgRMOAI1xbWiYT7KS5wqtWY6T1
         sTPMgp8EWCvoVqQlO+fxB/YbGQN4jWFlPGRSBw/0LaIJyyW3xKPgdhnna9ZcCC6U1KEs
         /MZ4uXebOZawkXQEOBUS8Z0hgl4MAZfTs7TpnKJCljr9naFl5xCb35SvgpAsNFz7Gx1o
         qR9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=enE4nJxD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j20-20020a05620a411400b0069bf75b0310si270035qko.204.2022.04.19.22.20.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Apr 2022 22:20:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=enE4nJxD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nh2l6-00033i-Cd
	for alex.bennee@linaro.org; Wed, 20 Apr 2022 01:20:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nh2kt-00033U-Pd
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 01:19:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nh2kq-00085B-Bn
 for qemu-arm@nongnu.org; Wed, 20 Apr 2022 01:19:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650431991;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=CthGyJ4nVrE5CyGzlplCI/zJfUHXmc+ejdNz08fkw5c=;
 b=enE4nJxD8rouqay4ANpYVYLRkh95y/X3FPbKUvergGXZZN0sDMtVVl6ehzdlZRxEpci9lx
 PWs7WG2Ez8EotTDIIsfU98YD72kXuqaCyqVyOWiTAo6m4Euew+2Zq8/PKQbh6tNn91z9rm
 6BxVXVHvFmPYc7OD/4+CyHbc9CTIrAQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-gLSyFE_DPfiLs_shZj9pRg-1; Wed, 20 Apr 2022 01:19:48 -0400
X-MC-Unique: gLSyFE_DPfiLs_shZj9pRg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D814B101AA45;
 Wed, 20 Apr 2022 05:19:47 +0000 (UTC)
Received: from [10.72.13.230] (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 05B04111C4A1;
 Wed, 20 Apr 2022 05:19:37 +0000 (UTC)
Subject: Re: [PATCH v5 4/4] hw/acpi/aml-build: Use existing CPU topology to
 build PPTT table
To: Igor Mammedov <imammedo@redhat.com>
References: <20220403145953.10522-1-gshan@redhat.com>
 <20220403145953.10522-5-gshan@redhat.com>
 <20220413155232.0a1f4d88@redhat.com>
 <dec9ab46-746d-9810-0784-2cddefab67ae@redhat.com>
 <20220419105432.11ad0f90@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <8f76fa31-7ec8-faf9-da7f-0f740722a8a1@redhat.com>
Date: Wed, 20 Apr 2022 13:19:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220419105432.11ad0f90@redhat.com>
Content-Type: multipart/mixed; boundary="------------02F123AEF0CFC056154580F9"
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Gavin Shan <gshan@redhat.com>
Cc: peter.maydell@linaro.org, drjones@redhat.com, richard.henderson@linaro.org,
 qemu-devel@nongnu.org, zhenyzha@redhat.com, wangyanan55@huawei.com,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RAFuFJ7ba/9k

This is a multi-part message in MIME format.
--------------02F123AEF0CFC056154580F9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Igor,

On 4/19/22 4:54 PM, Igor Mammedov wrote:
> On Thu, 14 Apr 2022 08:33:29 +0800
> Gavin Shan <gshan@redhat.com> wrote:
>> On 4/13/22 9:52 PM, Igor Mammedov wrote:
>>> On Sun,  3 Apr 2022 22:59:53 +0800
>>> Gavin Shan <gshan@redhat.com> wrote:
>>>    
>>>> When the PPTT table is built, the CPU topology is re-calculated, but
>>>> it's unecessary because the CPU topology has been populated in
>>>> virt_possible_cpu_arch_ids() on arm/virt machine.
>>>>
>>>> This reworks build_pptt() to avoid by reusing the existing one in
>>>> ms->possible_cpus. Currently, the only user of build_pptt() is
>>>> arm/virt machine.
>>>>
>>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>>> ---
>>>>    hw/acpi/aml-build.c | 100 +++++++++++++++++---------------------------
>>>>    1 file changed, 38 insertions(+), 62 deletions(-)
>>>>
>>>> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
>>>> index 4086879ebf..4b0f9df3e3 100644
>>>> --- a/hw/acpi/aml-build.c
>>>> +++ b/hw/acpi/aml-build.c
>>>> @@ -2002,86 +2002,62 @@ void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
>>>>                    const char *oem_id, const char *oem_table_id)
>>>>    {
>>>>        MachineClass *mc = MACHINE_GET_CLASS(ms);
>>>> -    GQueue *list = g_queue_new();
>>>> -    guint pptt_start = table_data->len;
>>>> -    guint parent_offset;
>>>> -    guint length, i;
>>>> -    int uid = 0;
>>>> -    int socket;
>>>> +    CPUArchIdList *cpus = ms->possible_cpus;
>>>> +    int64_t socket_id = -1, cluster_id = -1, core_id = -1;
>>>> +    uint32_t socket_offset, cluster_offset, core_offset;
>>>> +    uint32_t pptt_start = table_data->len;
>>>> +    int n;
>>>>        AcpiTable table = { .sig = "PPTT", .rev = 2,
>>>>                            .oem_id = oem_id, .oem_table_id = oem_table_id };
>>>>    
>>>>        acpi_table_begin(&table, table_data);
>>>>    
>>>> -    for (socket = 0; socket < ms->smp.sockets; socket++) {
>>>> -        g_queue_push_tail(list,
>>>> -            GUINT_TO_POINTER(table_data->len - pptt_start));
>>>> -        build_processor_hierarchy_node(
>>>> -            table_data,
>>>> -            /*
>>>> -             * Physical package - represents the boundary
>>>> -             * of a physical package
>>>> -             */
>>>> -            (1 << 0),
>>>> -            0, socket, NULL, 0);
>>>> -    }
>>>> +    for (n = 0; n < cpus->len; n++) {
>>>    
>>>> +        if (cpus->cpus[n].props.socket_id != socket_id) {
>>>> +            socket_id = cpus->cpus[n].props.socket_id;
>>>
>>> this relies on cpus->cpus[n].props.*_id being sorted form top to down levels
>>> I'd add here and for other container_id an assert() that checks for that
>>> specific ID goes in only one direction, to be able to detect when rule is broken.
>>>
>>> otherwise on may end up with duplicate containers silently.
>>>    
>>
>> Exactly. cpus->cpus[n].props.*_id is sorted as you said in virt_possible_cpu_arch_ids().
>> The only user of build_pptt() is arm/virt machine. So it's fine. However, I think I
>> may need add comments for this in v6.
>>
>>       /*
>>        * This works with the assumption that cpus[n].props.*_id has been
>>        * sorted from top to down levels in mc->possible_cpu_arch_ids().
>>        * Otherwise, the unexpected and duplicate containers will be created.
>>        */
>>
>> The implementation in v3 looks complicated, but comprehensive. The one
>> in this revision (v6) looks simple, but the we're losing flexibility :)
> 
> 
> comment is not enough, as it will break silently that's why I suggested
> sprinkling asserts() here.
> 

I don't think it breaks anything. Duplicated PPTT entries are allowed in
linux at least. The IDs in the duplicated PPTT entries should be same.
Otherwise, the exposed CPU topology is really broken.

I don't think it's harmful to add the check and assert, so I will introduce
a helper function like below in v7. Sadly that v6 was posted before I received
your confirm. Igor, could you please the changes, to be included into v7,
looks good to you? The complete patch is also attached :)

+static bool pptt_entry_exists(MachineState *ms, int n, bool check_socket_id,
+                              bool check_cluster_id, bool check_core_id)
+{
+    CPUArchId *cpus = ms->possible_cpus->cpus;
+    CpuInstanceProperties *t = &cpus[n].props;
+    CpuInstanceProperties *s;
+    bool match;
+    int i;
+
+    for (i = 0; i < n; i++) {
+        match = true;
+        s = &cpus[i].props;
+
+        if (check_socket_id && s->socket_id != t->socket_id) {
+            match = false;
+        }
+
+        if (match && check_cluster_id && s->cluster_id != t->cluster_id) {
+            match = false;
+        }
+
+        if (match && check_core_id && s->core_id != t->core_id) {
+            match = false;
+        }
+
+        if (match) {
+            return true;
+        }
+    }
+
+    return false;
+}

The following assert() will be applied in build_pptt():

assert(!pptt_entry_exists(ms, n, true, false, false));           /* socket  */
assert(!pptt_entry_exists(ms, n, true, true, false));            /* cluster */
assert(!pptt_entry_exists(ms, n, true,
            mc->smp_props.clusters_supported, true));             /* core    */

Thanks,
Gavin


--------------02F123AEF0CFC056154580F9
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-hw-acpi-aml-build-Use-existing-CPU-topology-to-build.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-hw-acpi-aml-build-Use-existing-CPU-topology-to-build.pa";
 filename*1="tch"

From cb26c277478a7415b8f51fd8f495bac7a2f42f0e Mon Sep 17 00:00:00 2001
From: Gavin Shan <gshan@redhat.com>
Date: Mon, 18 Apr 2022 09:47:27 +0800
Subject: [PATCH v7] hw/acpi/aml-build: Use existing CPU topology to build PPTT
 table
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When the PPTT table is built, the CPU topology is re-calculated, but
it's unecessary because the CPU topology has been populated in
virt_possible_cpu_arch_ids() on arm/virt machine.

This reworks build_pptt() to avoid by reusing the existing one in
ms->possible_cpus. Currently, the only user of build_pptt() is
arm/virt machine.

Signed-off-by: Gavin Shan <gshan@redhat.com>
---
 hw/acpi/aml-build.c | 143 +++++++++++++++++++++++++-------------------
 1 file changed, 81 insertions(+), 62 deletions(-)

diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
index 4086879ebf..4a9ecb84b0 100644
--- a/hw/acpi/aml-build.c
+++ b/hw/acpi/aml-build.c
@@ -1998,90 +1998,109 @@ static void build_processor_hierarchy_node(GArray *tbl, uint32_t flags,
  * ACPI spec, Revision 6.3
  * 5.2.29 Processor Properties Topology Table (PPTT)
  */
+static bool pptt_entry_exists(MachineState *ms, int n, bool check_socket_id,
+                              bool check_cluster_id, bool check_core_id)
+{
+    CPUArchId *cpus = ms->possible_cpus->cpus;
+    CpuInstanceProperties *t = &cpus[n].props;
+    CpuInstanceProperties *s;
+    bool match;
+    int i;
+
+    for (i = 0; i < n; i++) {
+        match = true;
+        s = &cpus[i].props;
+
+        if (check_socket_id && s->socket_id != t->socket_id) {
+            match = false;
+        }
+
+        if (match && check_cluster_id && s->cluster_id != t->cluster_id) {
+            match = false;
+        }
+
+        if (match && check_core_id && s->core_id != t->core_id) {
+            match = false;
+        }
+
+        if (match) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
 void build_pptt(GArray *table_data, BIOSLinker *linker, MachineState *ms,
                 const char *oem_id, const char *oem_table_id)
 {
     MachineClass *mc = MACHINE_GET_CLASS(ms);
-    GQueue *list = g_queue_new();
-    guint pptt_start = table_data->len;
-    guint parent_offset;
-    guint length, i;
-    int uid = 0;
-    int socket;
+    CPUArchIdList *cpus = ms->possible_cpus;
+    int64_t socket_id = -1, cluster_id = -1, core_id = -1;
+    uint32_t socket_offset = 0, cluster_offset = 0, core_offset = 0;
+    uint32_t pptt_start = table_data->len;
+    int n;
     AcpiTable table = { .sig = "PPTT", .rev = 2,
                         .oem_id = oem_id, .oem_table_id = oem_table_id };
 
     acpi_table_begin(&table, table_data);
 
-    for (socket = 0; socket < ms->smp.sockets; socket++) {
-        g_queue_push_tail(list,
-            GUINT_TO_POINTER(table_data->len - pptt_start));
-        build_processor_hierarchy_node(
-            table_data,
-            /*
-             * Physical package - represents the boundary
-             * of a physical package
-             */
-            (1 << 0),
-            0, socket, NULL, 0);
-    }
+    /*
+     * This works with the assumption that cpus[n].props.*_id has been
+     * sorted from top to down levels in mc->possible_cpu_arch_ids().
+     * Otherwise, the unexpected and duplicate containers will be
+     * created. The check is done by pptt_entry_exists().
+     */
+    for (n = 0; n < cpus->len; n++) {
+        if (cpus->cpus[n].props.socket_id != socket_id) {
+            assert(!pptt_entry_exists(ms, n, true, false, false));
+            socket_id = cpus->cpus[n].props.socket_id;
+            cluster_id = -1;
+            core_id = -1;
+            socket_offset = table_data->len - pptt_start;
+            build_processor_hierarchy_node(table_data,
+                (1 << 0), /* Physical package */
+                0, socket_id, NULL, 0);
+        }
 
-    if (mc->smp_props.clusters_supported) {
-        length = g_queue_get_length(list);
-        for (i = 0; i < length; i++) {
-            int cluster;
-
-            parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
-            for (cluster = 0; cluster < ms->smp.clusters; cluster++) {
-                g_queue_push_tail(list,
-                    GUINT_TO_POINTER(table_data->len - pptt_start));
-                build_processor_hierarchy_node(
-                    table_data,
-                    (0 << 0), /* not a physical package */
-                    parent_offset, cluster, NULL, 0);
+        if (mc->smp_props.clusters_supported) {
+            if (cpus->cpus[n].props.cluster_id != cluster_id) {
+                assert(!pptt_entry_exists(ms, n, true, true, false));
+                cluster_id = cpus->cpus[n].props.cluster_id;
+                core_id = -1;
+                cluster_offset = table_data->len - pptt_start;
+                build_processor_hierarchy_node(table_data,
+                    (0 << 0), /* Not a physical package */
+                    socket_offset, cluster_id, NULL, 0);
             }
+        } else {
+            cluster_offset = socket_offset;
         }
-    }
 
-    length = g_queue_get_length(list);
-    for (i = 0; i < length; i++) {
-        int core;
-
-        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
-        for (core = 0; core < ms->smp.cores; core++) {
-            if (ms->smp.threads > 1) {
-                g_queue_push_tail(list,
-                    GUINT_TO_POINTER(table_data->len - pptt_start));
-                build_processor_hierarchy_node(
-                    table_data,
+        if (ms->smp.threads == 1) {
+            build_processor_hierarchy_node(table_data,
+                (1 << 1) | /* ACPI Processor ID valid */
+                (1 << 3),  /* Node is a Leaf */
+                cluster_offset, n, NULL, 0);
+        } else {
+            if (cpus->cpus[n].props.core_id != core_id) {
+                assert(!pptt_entry_exists(ms, n, true,
+                           mc->smp_props.clusters_supported, true));
+                core_id = cpus->cpus[n].props.core_id;
+                core_offset = table_data->len - pptt_start;
+                build_processor_hierarchy_node(table_data,
                     (0 << 0), /* not a physical package */
-                    parent_offset, core, NULL, 0);
-            } else {
-                build_processor_hierarchy_node(
-                    table_data,
-                    (1 << 1) | /* ACPI Processor ID valid */
-                    (1 << 3),  /* Node is a Leaf */
-                    parent_offset, uid++, NULL, 0);
+                    cluster_offset, core_id, NULL, 0);
             }
-        }
-    }
-
-    length = g_queue_get_length(list);
-    for (i = 0; i < length; i++) {
-        int thread;
 
-        parent_offset = GPOINTER_TO_UINT(g_queue_pop_head(list));
-        for (thread = 0; thread < ms->smp.threads; thread++) {
-            build_processor_hierarchy_node(
-                table_data,
+            build_processor_hierarchy_node(table_data,
                 (1 << 1) | /* ACPI Processor ID valid */
                 (1 << 2) | /* Processor is a Thread */
                 (1 << 3),  /* Node is a Leaf */
-                parent_offset, uid++, NULL, 0);
+                core_offset, n, NULL, 0);
         }
     }
 
-    g_queue_free(list);
     acpi_table_end(linker, &table);
 }
 
-- 
2.23.0


--------------02F123AEF0CFC056154580F9--

