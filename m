Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp291442lfk;
        Thu, 21 Apr 2022 04:51:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqwZAmiGPwCD/ytIPKTXjbgzMK9TiHik7RYxYQVIzDnPlwaVNcdlACkrUU9fCEb/iF8CJM
X-Received: by 2002:a05:6214:2aa2:b0:446:66a7:49b3 with SMTP id js2-20020a0562142aa200b0044666a749b3mr12234206qvb.7.1650541873809;
        Thu, 21 Apr 2022 04:51:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650541873; cv=none;
        d=google.com; s=arc-20160816;
        b=VNrkEdvMg/RJfK6iCCKS2gybLVle67tC4T+0d8Nx0moxzjaF1PCkyk35y1pfJl9CvH
         W4OriuEkdox85aP4Jp/PALdmFWykIjNJxe07eGImIxNbK+e/oeGlDOX6CRTCHhWTL8nh
         CyVi8zc3ASomDUzqCwemcdfLSDv11MxCgbcsKy65WJgC/T88sL0eUFELVK30vmpqAAPb
         ieLBQyd0X77W/zwtRA8n4r4EQr4AA5mMGfZts8pataMhiQWKbRqiHXGI4LqALS/9GVTe
         DXhvVUytIr/ILFx2FLqasEpZxyTiRFs8V/M2RzBN3LQca/qlEmb1WLghvGQJiwuSogga
         7kIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=riSbgcPNoL/JlkgJ2aBmnOnzLVrpTgY+pL12VGAWXVs=;
        b=FdCFjbKO4Fb/QyWkXb6iTRDZ3bUveVKxuMfjhb4+kbnY2Mr6h27DtGK8ePscsXAiFp
         IdYolJJKjkEE+2SDNlwVtadu2P6uI5L5cZWSdguefso6j/NYXfXu4qyfYwe8f1nVaI96
         JJJ2NqMEvR1zSIP6BcP7flXsSAyqbIWWflguzlxD/8WhWimLkMY93iUtYiDTjaWxasve
         VRBrKgksmWKtEP02mU6BdOyScRKUYYAJhI4bQW+K5FmE0RJNLC1oU+SB1VXXamICBU9M
         IPVahj/Fv2kGnHoi/L7vrrym3FEU3DbT9Z2PybJWoIfygy7GePuE0ni12LMGt8XTf4ds
         iz7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DEWjNAG3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f22-20020a05622a1a1600b002f1d64ac02dsi1449749qtb.281.2022.04.21.04.51.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 04:51:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=DEWjNAG3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhVL7-0007su-9h
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 07:51:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nhUzV-0001PJ-Sk
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 07:28:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1nhUzU-0005KN-8o
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 07:28:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650540531;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=riSbgcPNoL/JlkgJ2aBmnOnzLVrpTgY+pL12VGAWXVs=;
 b=DEWjNAG3j3T/3aRYDNwGoQLgVZvr8IpoISHC0WEGvI5h6DRd2iMFopnidXFAoVstqBEApu
 1iDozCO/xxlrINtsF8SlXPODM3P1LxOP7c3AzBkFcXQN6i/fZBcX8jufNd7UQm68RNdDYD
 SUo23exeAGk27G8/wK43NDBb6mLSYIg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-zscLhqrjMYOyIAWN1ZDHzA-1; Thu, 21 Apr 2022 07:28:48 -0400
X-MC-Unique: zscLhqrjMYOyIAWN1ZDHzA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDCB93C172CF;
 Thu, 21 Apr 2022 11:28:47 +0000 (UTC)
Received: from [10.72.13.230] (ovpn-13-230.pek2.redhat.com [10.72.13.230])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA2DF40D016A;
 Thu, 21 Apr 2022 11:28:39 +0000 (UTC)
Subject: Re: [PATCH v6 2/4] hw/arm/virt: Consider SMP configuration in CPU
 topology
To: Andrew Jones <drjones@redhat.com>
References: <20220418020920.144263-1-gshan@redhat.com>
 <20220418020920.144263-3-gshan@redhat.com>
 <20220420103248.6e3575cd@redhat.com>
 <efb5dce0-af81-b8d7-fe7d-6a8268ab96f9@redhat.com>
 <20220420135032.43711096@redhat.com>
 <7f7ead25-a050-1e86-132a-a3e1e9b1e3b1@redhat.com>
 <20220421090224.l6i3qcu53seiz5yf@gator>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <891797b8-ee75-ba54-d450-7312b578e5a7@redhat.com>
Date: Thu, 21 Apr 2022 19:28:36 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20220421090224.l6i3qcu53seiz5yf@gator>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Cc: eduardo@habkost.net, peter.maydell@linaro.org, thuth@redhat.com,
 shan.gavin@gmail.com, pbonzini@redhat.com, mst@redhat.com, lvivier@redhat.com,
 armbru@redhat.com, richard.henderson@linaro.org, qemu-devel@nongnu.org,
 f4bug@amsat.org, wangyanan55@huawei.com, qemu-arm@nongnu.org,
 marcel.apfelbaum@gmail.com, Jonathan.Cameron@huawei.com, ani@anisinha.ca,
 Igor Mammedov <imammedo@redhat.com>, eblake@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BX3jvqBMkUUJ

Hi Drew,

On 4/21/22 5:02 PM, Andrew Jones wrote:
> On Wed, Apr 20, 2022 at 10:24:46PM +0800, Gavin Shan wrote:
> ...
>> With amend to the command lines, the following one is used and below error
>> is raised from the test. The error is mentioned in the commit log in
>> PATCH[v7 2/4].
>>
>>      -machine smp.cpus=2                                   \
>>      -numa node,nodeid=0,memdev=ram -numa node,nodeid=1    \
>>      -numa cpu,node-id=1,thread-id=0                       \
>>      -numa cpu,node-id=0,thread-id=1
>>
>>      qemu-system-aarch64: -numa cpu,node-id=0,thread-id=1: no match found
>>      (reported from hw/core/machine.c::machine_set_cpu_numa_node())
>>
>> After the changes to virt_possible_cpu_arch_ids() is applied, "thread-id=1"
>> isn't valid any more. The CPU topology becomes like below. Note that
>> mc->smp_props.prefer_sockets is true on arm/virt machine.
> 
> prefer_sockets is only true for mach-virt 6.1 and older. It's false for
> 6.2 and later.
> 

Yeah, @perfer_socket is false in last mach-virt-7.0 , which is used in
this test case. So we prefer CPU core over sockets, as explained in
hw/core/machine.c::machine_parse_smp_config(). The CPU topology
becomes like below instead, but 'thread-id=1' is still invalid.

       index    socket   cluster    core    thread
       --------------------------------------------
         0        0        0         0        0
         1        0        0         1        0

>>
>>      index    socket   cluster    core    thread
>>      --------------------------------------------
>>        0        0        0         0        0
>>        1        1        0         0        0
>>
>> With the amended command lines, the topology changes again so
>> that "thread-id=1" is valid:
>>
>>      index    socket   cluster    core    thread
>>      --------------------------------------------
>>        0        0        0         0        0
>>        1        0        0         0        1
>>
>> It should be ok to split the test/qtest/aarch64_numa_cpu() changes into
>> a separate patch and put it before this one. In that case, the specified
>> smp.{socket, cluster, core, threads} isn't used by arm/virt machine yet,
>> and 'thread-id=2' should be still valid. Lets do this if I need post v8.
>> Otherwise, I guess it's also fine to squash the test/qtest/aarch64_numa_cpu()
>> changes into PATCH[2/4], as we're doing.
>>
>>>
>>>>
>>>>
>>>>>>             "-numa node,nodeid=0,memdev=ram -numa node,nodeid=1 "
>>>>>>             "-numa cpu,node-id=1,thread-id=0 "
>>>>>>             "-numa cpu,node-id=0,thread-id=1");

Thanks,
Gavin

