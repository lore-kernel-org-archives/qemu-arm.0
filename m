Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp64689lfc;
        Fri, 15 Oct 2021 05:51:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxf8ngNTFL3RhaidCFGUh91R+Fe3hVNC8M2fcfWb53L3GeAm4b7NAGyhi9koa7mAR4Gnaz6
X-Received: by 2002:a67:e15b:: with SMTP id o27mr13434542vsl.22.1634302306412;
        Fri, 15 Oct 2021 05:51:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634302306; cv=none;
        d=google.com; s=arc-20160816;
        b=c4CdiR2h/+AEs3GgSaAZt2NxCB0HndIJBNxUpaODoWZbmG5IPBfjRqI/tSjzgr1lbn
         hx4t8VR5Q99xJ+vkLDxhFDNwj6fEvRybHmL5VqVzDVK54Nhj1AoUmIzoMeBPw7feSU7U
         lQ98Rrqp8nuFOb6e9oj6ABo8sq0HtNw8P8rRlbjIJkY0FUxqyvAp/WYw4+bMc2+SmEP9
         VhwmO3oU3vigW6lUZ2A5Wrj/eRgzSFQcEkqOVXQPEuatvWobHvVA/ahY6Qx5legFj15G
         UlZgMPkm4PIhrfsEhyCCDkuBDnw2tTyboOOjONpQZfGgis29+pjE0RBO8jACJhBK8G3e
         h0Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=0JJHpMoZ4+R/6vb2n7LPOIpvKupQDTcDUzlAXHSBF9w=;
        b=aO6iaq5lZeaxWstRLN/pqxpuMJE3t7RzJlxRJwsKzK5sUwmTTwoI73eHkHy2zc1YNu
         1vDc8ldQj0Uo7q3b46LJnMkzRyg615SgBZQ0wmw9xA4kc8D4KMJVbJTDHN9H8gyXGx7f
         S3OJd9eOipx52d7V5VFKIC2WMGvoeav7vJjN+8M/M10ksT5LDiUd3sYbl1XNV51qqkG3
         aSXh4ihiVw7owoZQLkcuAXiVwJQZAbmYvwu0cM3jqNAUgLkrtWisDWHNcWJDkiPDvoO1
         iHPSOimitWKwqLjoTYcfxDPHI8+7IEpKgPFPwb3BXLJXaGJp9gMvCsoxBn+RId7qeBob
         AI/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=filsfUsd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y24si5947339vsi.454.2021.10.15.05.51.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Oct 2021 05:51:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=filsfUsd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mbMgb-0003gq-Nw
	for alex.bennee@linaro.org; Fri, 15 Oct 2021 08:51:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mbMZ8-0004mp-63
 for qemu-arm@nongnu.org; Fri, 15 Oct 2021 08:44:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mbMZ3-0007by-S6
 for qemu-arm@nongnu.org; Fri, 15 Oct 2021 08:44:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634301837;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0JJHpMoZ4+R/6vb2n7LPOIpvKupQDTcDUzlAXHSBF9w=;
 b=filsfUsdGtoufXpyCfvnja5pC6DdLar+gT5+Nf08zKCQCFyMhJ5b1tMWOq13x3N3fHbHOB
 9izuL1z+M5/DZawSWFGrDC/1qOg3ihqkYFHKYYNGD5vfSICnpZ1iiUczxDJHDxSHugNGqB
 AEHBOCYLj5wfw/JxUELJuf8ET3lq8wk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-RWqnnLnjMVeXRF1r0CGw5A-1; Fri, 15 Oct 2021 08:43:54 -0400
X-MC-Unique: RWqnnLnjMVeXRF1r0CGw5A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1D22CC621;
 Fri, 15 Oct 2021 12:43:52 +0000 (UTC)
Received: from [10.64.54.38] (vpn2-54-38.bne.redhat.com [10.64.54.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 797D260C05;
 Fri, 15 Oct 2021 12:43:49 +0000 (UTC)
Subject: Re: [PATCH v4] hw/arm/virt: Don't create device-tree node for empty
 NUMA node
To: Andrew Jones <drjones@redhat.com>
References: <20211015104909.16722-1-gshan@redhat.com>
 <20211015122226.g42zu7hsbc2fey27@gator>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <246933b4-86d7-c7d5-54f5-a65b8002f273@redhat.com>
Date: Fri, 15 Oct 2021 23:43:46 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20211015122226.g42zu7hsbc2fey27@gator>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: robh@kernel.org, qemu-riscv@nongnu.org, ehabkost@redhat.com,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7RcsoenMs+Bn

On 10/15/21 11:22 PM, Andrew Jones wrote:
> On Fri, Oct 15, 2021 at 06:49:09PM +0800, Gavin Shan wrote:
>> The empty NUMA node, where no memory resides, are allowed. For
>> example, the following command line specifies two empty NUMA nodes.
>> With this, QEMU fails to boot because of the conflicting device-tree
>> node names, as the following error message indicates.
>>
>>    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>>    -accel kvm -machine virt,gic-version=host               \
>>    -cpu host -smp 4,sockets=2,cores=2,threads=1            \
>>    -m 1024M,slots=16,maxmem=64G                            \
>>    -object memory-backend-ram,id=mem0,size=512M            \
>>    -object memory-backend-ram,id=mem1,size=512M            \
>>    -numa node,nodeid=0,cpus=0-1,memdev=mem0                \
>>    -numa node,nodeid=1,cpus=2-3,memdev=mem1                \
>>    -numa node,nodeid=2                                     \
>>    -numa node,nodeid=3
>>      :
>>    qemu-system-aarch64: FDT: Failed to create subnode /memory@80000000: FDT_ERR_EXISTS
>>
>> As specified by linux device-tree binding document, the device-tree
>> nodes for these empty NUMA nodes shouldn't be generated. However,
>> the corresponding NUMA node IDs should be included in the distance
>> map. As the memory hotplug through device-tree on ARM64 isn't existing
>> so far, it's pointless to expose the empty NUMA nodes through device-tree.
> 
> Instead of "it's pointless to expose the empty NUMA nodes through
> device-tree", how about
> 
>   it's not necessary to require the user to provide a distance map.
>   Furthermore, the default distance map Linux generates may even be
>   sufficient.
> 

Yes, much better.

>> So this simply skips populating the device-tree nodes for these empty
>> NUMA nodes to avoid the error, so that QEMU can be started successfully.
>>
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>> v4: Drop patch to enforce distance-map as memory hotplug through
>>      device-tree is never supported on ARM64. It's pointless to
>>      expose these empty NUMA nodes. Besides, comments added to
>>      explain the code changes included in this patch as Drew
>>      suggested.
>> ---
>>   hw/arm/boot.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index 57efb61ee4..e05c1c149c 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>> @@ -599,10 +599,24 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>>       }
>>       g_strfreev(node_path);
>>   
>> +    /*
>> +     * According to Linux NUMA binding document, the device tree nodes
>> +     * for the empty NUMA nodes shouldn't be generated, but their NUMA
>> +     * node IDs should be included in the distance map instead. However,
>> +     * it's pointless to expose the empty NUMA nodes as memory hotplug
>> +     * through device tree is never supported. We simply skip generating
>> +     * their device tree nodes to avoid the unexpected device tree
>> +     * generating failure due to the duplicated names of these empty
>> +     * NUMA nodes.
>> +     */
> 
>      /*
>       * We drop all the memory nodes which correspond to empty NUMA nodes from
>       * the device tree, because the Linux NUMA binding document states they
>       * should not be generated.  Linux will get the NUMA node IDs of the empty
>       * NUMA nodes from the distance map if they are needed.  This means QEMU
>       * users may be obliged to provide command lines which configure distance
>       * maps when the empty NUMA node IDs are needed and Linux's default
>       * distance map isn't sufficient.
>       */
> 

Thanks, Drew. Copy-and-posted to v5 :)

> 
> 
>>       if (ms->numa_state != NULL && ms->numa_state->num_nodes > 0) {
>>           mem_base = binfo->loader_start;
>>           for (i = 0; i < ms->numa_state->num_nodes; i++) {
>>               mem_len = ms->numa_state->nodes[i].node_mem;
>> +            if (!mem_len) {
>> +                continue;
>> +            }
>> +
>>               rc = fdt_add_memory_node(fdt, acells, mem_base,
>>                                        scells, mem_len, i);
>>               if (rc < 0) {

Thanks,
Gavin

