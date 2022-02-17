Received: by 2002:ac2:446b:0:0:0:0:0 with SMTP id y11csp1496327lfl;
        Wed, 16 Feb 2022 18:15:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJya0oGhU09iQvUvs41Rj/EGcxiXrXWZSkR4zIQS4UO4c2ZNDJMDEpN9zsmis1GM47lk27kd
X-Received: by 2002:a81:cf02:0:b0:2d0:b68c:cf30 with SMTP id u2-20020a81cf02000000b002d0b68ccf30mr719077ywi.510.1645064144400;
        Wed, 16 Feb 2022 18:15:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645064144; cv=none;
        d=google.com; s=arc-20160816;
        b=eKiOD4CnYqNz6Uh1irgh60OVsqMAN6THivh6luNg1amcP+ewzEENQzxdLMNf7uM4tU
         1VtbuB7Bi3E+3QDAczrjtMbPXKg4tpMKk4froXg1dWhQK1ef320PRxWG5nPBkoeJNivZ
         rduwmsAqrH6yM4dPBLZemPFbGEEq71Ip7XnlRpkm32emCSieicL6u6NLobKr61xHdxCf
         NM7zNiaoRUdDPWN9ijeels5a7lu25T94+Cbh50o7Sqy/To2dNV9nMgYwJDZtQZXnx7Hw
         iIDAea8NQIW8ZvvBHV7KmEMmBEcqUYNwD+JVwImG2WT4BnPo8SWUoNmHC6VUCHAHgYPx
         S/cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=zula+PXSQblh46QPK9jKUrgI5KitJ7yQrx1SpAD10qg=;
        b=omTnw9kf9/j5tppzF1OUE8dyWS7pj4oOA3u0aQoGhOno2lJHGTNnFT417xR9UeE0yA
         g7/KYIAp0jJquTxgMYf5XE4iP9oRVTkCFjdOKpV4SOnrcRy0N5/4J8khuNGT8/wRn8Ft
         NmDVmBkm3LFIFvaeTsmDT0YZiCwljg3JfF8njxZwyszqbyW7fxS6iAdw/3PR1Nqq8EKY
         /8uSC86yun5rV7hFF0TLM9I9rxiLZQr4PsKCFkgzL1hRoHvZm/bzCgFbOceGRC646cRu
         zJSoxn1BkaoyZqj/UtE91H1V3SoLLQJ71sg8BPciTV/HWDfeiwtG5T0rQwpVd/MBb6fh
         Y4RA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RzqKq9Lm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q8si341947ybu.243.2022.02.16.18.15.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Feb 2022 18:15:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RzqKq9Lm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nKWKd-0000gD-QX
	for alex.bennee@linaro.org; Wed, 16 Feb 2022 21:15:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nKWJy-0000fn-UR
 for qemu-arm@nongnu.org; Wed, 16 Feb 2022 21:15:03 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nKWJv-0008G5-45
 for qemu-arm@nongnu.org; Wed, 16 Feb 2022 21:15:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645064098;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zula+PXSQblh46QPK9jKUrgI5KitJ7yQrx1SpAD10qg=;
 b=RzqKq9LmX60Mp0ws8VbuLKGcDcyQaAt4T9VR+4fNtb5uZ2SS9sL9FqwwFyhMoQ+qojyjnk
 9WfNvYbRQvaSx/391GL8dRM/6sE6OJWs/ACyL/2XYaAVmH4u3/56MJMrkq7hMES/KZ4M5h
 8jFKi1UlZVrZh7tzbtoc7KBvLSc2mbs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-o2wsiEbxOSOdtQmj3tNNww-1; Wed, 16 Feb 2022 21:14:57 -0500
X-MC-Unique: o2wsiEbxOSOdtQmj3tNNww-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 752FD1091DA0;
 Thu, 17 Feb 2022 02:14:55 +0000 (UTC)
Received: from [10.72.13.24] (ovpn-13-24.pek2.redhat.com [10.72.13.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95C8845D9A;
 Thu, 17 Feb 2022 02:14:47 +0000 (UTC)
Subject: Re: [PATCH] hw/arm/virt: Fix CPU's default NUMA node ID
To: Igor Mammedov <imammedo@redhat.com>
References: <20220126052410.36380-1-gshan@redhat.com>
 <20220126101447.5d4f01f9@redhat.com>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <aa22b9ba-6b5a-a728-870d-e5efbea67c5d@redhat.com>
Date: Thu, 17 Feb 2022 10:14:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220126101447.5d4f01f9@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.083,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 qemu-devel@nongnu.org, "wangyanan \(Y\)" <wangyanan55@huawei.com>,
 qemu-arm@nongnu.org, shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0OA7Ai/x8haX

On 1/26/22 5:14 PM, Igor Mammedov wrote:
> On Wed, 26 Jan 2022 13:24:10 +0800
> Gavin Shan <gshan@redhat.com> wrote:
> 
>> The default CPU-to-NUMA association is given by mc->get_default_cpu_node_id()
>> when it isn't provided explicitly. However, the CPU topology isn't fully
>> considered in the default association and it causes CPU topology broken
>> warnings on booting Linux guest.
>>
>> For example, the following warning messages are observed when the Linux guest
>> is booted with the following command lines.
>>
>>    /home/gavin/sandbox/qemu.main/build/qemu-system-aarch64 \
>>    -accel kvm -machine virt,gic-version=host               \
>>    -cpu host                                               \
>>    -smp 6,sockets=2,cores=3,threads=1                      \
>>    -m 1024M,slots=16,maxmem=64G                            \
>>    -object memory-backend-ram,id=mem0,size=128M            \
>>    -object memory-backend-ram,id=mem1,size=128M            \
>>    -object memory-backend-ram,id=mem2,size=128M            \
>>    -object memory-backend-ram,id=mem3,size=128M            \
>>    -object memory-backend-ram,id=mem4,size=128M            \
>>    -object memory-backend-ram,id=mem4,size=384M            \
>>    -numa node,nodeid=0,memdev=mem0                         \
>>    -numa node,nodeid=1,memdev=mem1                         \
>>    -numa node,nodeid=2,memdev=mem2                         \
>>    -numa node,nodeid=3,memdev=mem3                         \
>>    -numa node,nodeid=4,memdev=mem4                         \
>>    -numa node,nodeid=5,memdev=mem5
>>           :
>>    alternatives: patching kernel code
>>    BUG: arch topology borken
>>    the CLS domain not a subset of the MC domain
>>    <the above error log repeats>
>>    BUG: arch topology borken
>>    the DIE domain not a subset of the NODE domain
>>
>> With current implementation of mc->get_default_cpu_node_id(), CPU#0 to CPU#5
>> are associated with NODE#0 to NODE#5 separately. That's incorrect because
>> CPU#0/1/2 should be associated with same NUMA node because they're seated
>> in same socket.
>>
>> This fixes the issue by considering the socket when default CPU-to-NUMA
>> is given. With this applied, no more CPU topology broken warnings are seen
>> from the Linux guest. The 6 CPUs are associated with NODE#0/1, but there are
>> no CPUs associated with NODE#2/3/4/5.
> 
>>>From migration point of view it looks fine to me, and doesn't need a compat knob
> since NUMA data (on virt-arm) only used to construct ACPI tables (and we don't
> version those unless something is broken by it).
> 
> 
>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   hw/arm/virt.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 141350bf21..b4a95522d3 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -2499,7 +2499,7 @@ virt_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
>>   
>>   static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
>>   {
>> -    return idx % ms->numa_state->num_nodes;
>> +    return idx / (ms->smp.dies * ms->smp.clusters * ms->smp.cores * ms->smp.threads);
> 
> I'd like for ARM folks to confirm whether above is correct
> (i.e. socket is NUMA node boundary and also if above topo vars
> could have odd values. Don't look at horribly complicated x86
> as example, but it showed that vendors could stash pretty much
> anything there, so we should consider it here as well and maybe
> forbid that in smp virt-arm parser)
> 

After doing some investigation, I don't think the socket is NUMA node boundary.
Unfortunately, I didn't find it's documented like this in any documents after
checking device-tree specification, Linux CPU topology and NUMA binding documents.

However, there are two options here according to Linux (guest) kernel code:
(A) socket is NUMA node boundary  (B) CPU die is NUMA node boundary. They are
equivalent as CPU die isn't supported on arm/virt machine. Besides, the topology
of one-to-one association between socket and NUMA node sounds natural and simplified.
So I think (A) is the best way to go.

Another thing I want to explain here is how the changes affect the memory
allocation in Linux guest. Taking the command lines included in the commit
log as an example, the first two NUMA nodes are bound to CPUs while the other
4 NUMA nodes are regarded as remote NUMA nodes to CPUs. The remote NUMA node
won't accommodate the memory allocation until the memory in the near (local)
NUMA node becomes exhausted. However, it's uncertain how the memory is hosted
if memory binding isn't applied.

Besides, I think the code should be improved like below to avoid overflow on
ms->numa_state->num_nodes.

  static int64_t virt_get_default_cpu_node_id(const MachineState *ms, int idx)
  {
-    return idx % ms->numa_state->num_nodes;
+    int node_idx;
+
+    node_idx = idx / (ms->smp.dies * ms->smp.clusters * ms->smp.cores * ms->smp.threads);
+    return node_idx % ms->numa_state->num_nodes;
  }


>>   }
>>   
>>   static const CPUArchIdList *virt_possible_cpu_arch_ids(MachineState *ms)
> 

Thanks,
Gavin

