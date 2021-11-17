Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp1089986lfk;
        Wed, 17 Nov 2021 10:09:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx66HC94KlOMPL7UJ7zni3M+WYyfBnWyOxyKbvyZ9nSLYkQKY8unO0pJDgsmJWb6K7QNxnO
X-Received: by 2002:ab0:2901:: with SMTP id v1mr26009962uap.68.1637172563842;
        Wed, 17 Nov 2021 10:09:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1637172563; cv=none;
        d=google.com; s=arc-20160816;
        b=u59+8qx6Vl4bI0rb0wnrBJbXBP8KpF+/vm5NozvSQoyFb9zu+3hbK6qxiGZ2M9IKug
         XHhUiu9swJXwvg8SlLRq4gduxzw4f2rP2Hpje9cN9BmcBauHJWIQ7JKDf1CcwwrjaIJl
         dRU+bnPXH2WRo93QstNPX4YwdnjDRKCtINv5MhlTAzf90+n+KssPymNrk63V21y1Nm5f
         gscfTgUfeJlDGQYgkFjhZLjwVvZAx3w+YRGYxV2Y7evsxtqxH3TTlEY94OvNusM1IUqs
         GL40T2j3vDw0aIUMMwvuH1RQOPbmab6C2bgkqHagxm2BFhTh1UcSEE3DesPG5D7L56YG
         uq8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:subject:organization:from:references
         :to:user-agent:mime-version:date:message-id:dkim-signature;
        bh=YbJ+LS1HSRNOeIco5WxypoebZCT55o/yHh6/ZBbxr3I=;
        b=W4kHG6OPBJUbmmp1Ad17pkBC6I5VikrsQKJVOm2iIq4tEZ4hRB86kxU8AnsgnerqJL
         xMhen6qk+qVNXM4NM/EF9QEc5s8BdsXL/alWQ3wSH26OGF0+wenR/z1XP3GS1aWMJKvV
         yCKWYht0g/5DwmcvF8vs6E2gNuWGJwSvBRIld/EfHsXjQLWUfIJddptDHIX2Otd9N/mZ
         MxhTqKnDfZYOJw+Nfeky/e1gucUibrsc/SNfhBama235aysDBWRKAVDvrr+/rdOZ6/zq
         hBVfqlxq9o5hdry66qiWlXP9D/y3PEtmP466uDQjrkn+hcNu7jPrvusZ3D5qo2QrzoAG
         r9dA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZPBrCjzU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11si1103005vsc.379.2021.11.17.10.09.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Nov 2021 10:09:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZPBrCjzU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mnPN5-0002hN-6Y
	for alex.bennee@linaro.org; Wed, 17 Nov 2021 13:09:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mnPMV-0002hF-9M
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 13:08:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mnPMT-0004wq-C6
 for qemu-arm@nongnu.org; Wed, 17 Nov 2021 13:08:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637172515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YbJ+LS1HSRNOeIco5WxypoebZCT55o/yHh6/ZBbxr3I=;
 b=ZPBrCjzUI5D9VeqG0ZZ2/zibt10ibZOlTwn2J9t61jSJsgKvuQOVV/dUkdbMulTfe1gA3Y
 TVk5lWUkPlIlA7Y8qGbAtV4XKG99pRzmYxAFttURU0lkB+PnFQGqJwUwltMDyc4UWNF0LS
 6aNWS2my1gSHqR2kqvXv9udZTwrUJho=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-qjBPgr5yPeeJNXy8Aq5_uA-1; Wed, 17 Nov 2021 13:08:31 -0500
X-MC-Unique: qjBPgr5yPeeJNXy8Aq5_uA-1
Received: by mail-wm1-f70.google.com with SMTP id
 201-20020a1c04d2000000b003335bf8075fso1448481wme.0
 for <qemu-arm@nongnu.org>; Wed, 17 Nov 2021 10:08:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=YbJ+LS1HSRNOeIco5WxypoebZCT55o/yHh6/ZBbxr3I=;
 b=7QeLB66NCBL3ZKd8eJAuf/WZbfwofhLeDAsXpycKXfjz7emOeDbk9IeolOGU7S1cHt
 tidatKrHmVoLBgj9cqNppHO2FMXUNxHDgbcip3aNwpcLJA0+NFHsDSqMlZdaXdMI82Ch
 9l1s0ph0VnXW6Fx07/qN63CN5NGj1Q+jwL+Ndd85Phie4xtNJG1W3XYRMRZL0SUDWZ4w
 nBI7k4npGkHhQ8ewtK8Xp92t/78I+13iKrrUBubgFiBjNVXiBzPtsUpcH3auUksn/EQl
 C13FRy/8OS5FvzG3WBjLDj3jZnuC+aL6B5Gg6G4UmR5cQd/icwn5JMUJ41Kvi1K0GHfa
 KFqg==
X-Gm-Message-State: AOAM532xFauKvjaxn6RJx4VGWHn2ge570Xeb5YycDycmvZeieXSqTqsU
 Ej9g+dXs5WhSLeCTedeNEivneakVd6mXueMHtAEDUkg/5LXefQr+j9g7pRT17nSxVkrZ+NI6BMI
 3sdPzU7ZdUIdX
X-Received: by 2002:a5d:550f:: with SMTP id b15mr21384330wrv.212.1637172510005; 
 Wed, 17 Nov 2021 10:08:30 -0800 (PST)
X-Received: by 2002:a5d:550f:: with SMTP id b15mr21384285wrv.212.1637172509697; 
 Wed, 17 Nov 2021 10:08:29 -0800 (PST)
Received: from [192.168.3.132] (p5b0c6882.dip0.t-ipconnect.de. [91.12.104.130])
 by smtp.gmail.com with ESMTPSA id o3sm7300652wms.10.2021.11.17.10.08.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 10:08:29 -0800 (PST)
Message-ID: <8576e0e8-aa06-1c05-9849-806c2bce4141@redhat.com>
Date: Wed, 17 Nov 2021 19:08:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
References: <20211027052958.280741-1-gshan@redhat.com>
 <20211027174028.1f16fcfb@redhat.com>
 <fecb9351-ae78-8fcd-e377-623243ef80df@redhat.com>
 <20211101094431.71e1a50a@redhat.com>
 <47dc3a95-ed77-6c0e-d024-27cb22c338eb@redhat.com>
 <20211102073948.am3p3hcqqd3cfvru@gator.home>
 <b8ed4687-e30a-d70f-0816-bd8ba490ceb7@redhat.com>
 <20211110113304.2d713d4a@redhat.com>
 <5180ecee-62e2-cd6f-d595-c7c29eff6039@redhat.com>
 <20211112142751.4807ab50@redhat.com>
 <188faab7-1e57-2bc1-846f-9457433c2f9d@redhat.com>
 <20211117143015.00002e0a@Huawei.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v2] hw/arm/virt: Expose empty NUMA nodes through ACPI
In-Reply-To: <20211117143015.00002e0a@Huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Andrew Jones <drjones@redhat.com>,
 Gavin Shan <gshan@redhat.com>, ehabkost@redhat.com,
 richard.henderson@linaro.org, alison.schofield@intel.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, shan.gavin@gmail.com,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Au5uO6ppkaa8

On 17.11.21 15:30, Jonathan Cameron wrote:
> On Tue, 16 Nov 2021 12:11:29 +0100
> David Hildenbrand <david@redhat.com> wrote:
> 
>>>>
>>>> Examples include exposing HBM or PMEM to the VM. Just like on real HW,
>>>> this memory is exposed via cpu-less, special nodes. In contrast to real
>>>> HW, the memory is hotplugged later (I don't think HW supports hotplug
>>>> like that yet, but it might just be a matter of time).  
>>>
>>> I suppose some of that maybe covered by GENERIC_AFFINITY entries in SRAT
>>> some by MEMORY entries. Or nodes created dynamically like with normal
>>> hotplug memory.
>>>   
> 

Hi Jonathan,

> The naming of the define is unhelpful.  GENERIC_AFFINITY here corresponds
> to Generic Initiator Affinity.  So no good for memory. This is meant for
> representation of accelerators / network cards etc so you can get the NUMA
> characteristics for them accessing Memory in other nodes.
> 
> My understanding of 'traditional' memory hotplug is that typically the
> PA into which memory is hotplugged is known at boot time whether or not
> the memory is physically present.  As such, you present that in SRAT and rely
> on the EFI memory map / other information sources to know the memory isn't
> there.  When it is hotplugged later the address is looked up in SRAT to identify
> the NUMA node.

in virtualized environments we use the SRAT only to indicate the hotpluggable
region (-> indicate maximum possible PFN to the guest OS), the actual present
memory+PXM assignment is not done via SRAT. We differ quite a lot here from
actual hardware I think.

> 
> That model is less useful for more flexible entities like virtio-mem or
> indeed physical hardware such as CXL type 3 memory devices which typically
> need their own nodes.
> 
> For the CXL type 3 option, currently proposal is to use the CXL table entries
> representing Physical Address space regions to work out how many NUMA nodes
> are needed and just create extra ones at boot.
> https://lore.kernel.org/linux-cxl/163553711933.2509508.2203471175679990.stgit@dwillia2-desk3.amr.corp.intel.com
> 
> It's a heuristic as we might need more nodes to represent things well kernel
> side, but it's better than nothing and less effort that true dynamic node creation.
> If you chase through the earlier versions of Alison's patch you will find some
> discussion of that.
> 
> I wonder if virtio-mem should just grow a CDAT instance via a DOE?
> 
> That would make all this stuff discoverable via PCI config space rather than ACPI
> CDAT is at:
> https://uefi.org/sites/default/files/resources/Coherent%20Device%20Attribute%20Table_1.01.pdf
> but the table access protocol over PCI DOE is currently in the CXL 2.0 spec
> (nothing stops others using it though AFAIK).
> 
> However, then we'd actually need either dynamic node creation in the OS, or
> some sort of reserved pool of extra nodes.  Long term it may be the most
> flexible option.


I think for virtio-mem it's actually a bit simpler:

a) The user defined on the QEMU cmdline an empty node
b) The user assigned a virtio-mem device to a node, either when 
   coldplugging or hotplugging the device.

So we don't actually "hotplug" a new node, the (possible) node is already known
to QEMU right when starting up. It's just a matter of exposing that fact to the
guest OS -- similar to how we expose the maximum possible PFN to the guest OS.
It's seems to boild down to an ACPI limitation.

Conceptually, virtio-mem on an empty node in QEMU is not that different from
hot/coldplugging a CPU to an empty node or hot/coldplugging a DIMM/NVDIMM to
an empty node. But I guess it all just doesn't work with QEMU as of now.


In current x86-64 code, we define the "hotpluggable region" in hw/i386/acpi-build.c via

	build_srat_memory(table_data, machine->device_memory->base,
			  hotpluggable_address_space_size, nb_numa_nodes - 1,
			  MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);

So we tell the guest OS "this range is hotpluggable" and "it contains to
this node unless the device says something different". From both values we
can -- when under QEMU -- conclude the maximum possible PFN and the maximum
possible node. But the latter is not what Linux does: it simply maps the last
numa node (indicated in the memory entry) to a PXM
(-> drivers/acpi/numa/srat.c:acpi_numa_memory_affinity_init()).


I do wonder if we could simply expose the same hotpluggable range via multiple nodes:

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a3ad6abd33..6c0ab442ea 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2084,6 +2084,22 @@ build_srat(GArray *table_data, BIOSLinker *linker, MachineState *machine)
      * providing _PXM method if necessary.
      */
     if (hotpluggable_address_space_size) {
+        /*
+         * For the guest to "know" about possible nodes, we'll indicate the
+         * same hotpluggable region to all empty nodes.
+         */
+        for (i = 0; i < nb_numa_nodes - 1; i++) {
+            if (machine->numa_state->nodes[i].node_mem > 0) {
+                continue;
+            }
+            build_srat_memory(table_data, machine->device_memory->base,
+                              hotpluggable_address_space_size, i,
+                              MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);
+        }
+        /*
+         * Historically, we always indicated all hotpluggable memory to the
+         * last node -- if it was empty or not.
+         */
         build_srat_memory(table_data, machine->device_memory->base,
                           hotpluggable_address_space_size, nb_numa_nodes - 1,
                           MEM_AFFINITY_HOTPLUGGABLE | MEM_AFFINITY_ENABLED);


Of course, this won't make CPU hotplug to empty nodes happy if we don't have
mempory hotplug enabled for a VM. I did not check in detail if that is valid
according to ACPI -- Linux might eat it (did not try yet, though).


-- 
Thanks,

David / dhildenb

