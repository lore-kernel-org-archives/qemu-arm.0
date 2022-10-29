Received: by 2002:a17:906:4687:b0:7ad:c089:ed49 with SMTP id a7csp142809ejr;
        Sat, 29 Oct 2022 15:49:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6+dARnteRHDKT3Isu4To3sQCy1ITAZ8wFGDPn+ZjYcJNFUsE3dKPO74zqUyTt7yz1B6JMd
X-Received: by 2002:a05:622a:252:b0:3a5:73a:1aa3 with SMTP id c18-20020a05622a025200b003a5073a1aa3mr5206627qtx.482.1667083795772;
        Sat, 29 Oct 2022 15:49:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667083795; cv=none;
        d=google.com; s=arc-20160816;
        b=ji9l759Xf50Vl7TGdsSapVPlL8O4UBc9P5lACPyXadKLFx+Fk9WvPj2gVgYAbtJ84k
         cFUvDqmKvP90qsYwMHcNerEvm6x8g0DbiC2Ng/13Cn4FXm+Zna2CYb++1fdTTRwXUSbV
         PmMGSx8e8KMsiXosWAkXOGmZPeddi4J9dz/txU6fy6399W36jeXrzusFanODo9LGYq6o
         zbCQQ/xM0rrg0HBcycyQm9wNTZjh5pJZUpDk+/vx2KMjvFI2GmJgluLUJHlquVI/7HIc
         pwGXj54Y64vZzOInd7R1spEjQD6FYgRKP+M+qkjFnXVhe+F7YcPBvKdC7XBqEujjNiTU
         coiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=1V8pPjHvD5aPA+jJA3sEzkdJ5CgZuM4B6kYb3gEX/VI=;
        b=AH8vptAr37v+0ZyTK5/zg2PTI8LCx5bGkWaGTJmOuPJfBCaeJ1yFOsQ48qbroDeq4Q
         PEZzrXEpNCFSAIKcIr0DSXq1fWp5sUIJZoT3/iopHq8a2lw7YGb5YdDQzWDdfjd6rBWE
         710KgSXyVM/FGxNoIkDQh1FH9h74ZcjNXF2cdxm02EXmMNza5EHoPb9W1j0pIu5rR5ZC
         Km2QtXq43phiJnd+AbWjgF+HBfmXNCtZABEZpJBzrH+QkOrTfA8so9+ltL0X6aF2WjuS
         /6ZYIs3qXNbndIQVh16UhZNsova+KdpLDjr0nZebhIlkGgU3hT8x+rurdysHOAotGOce
         CUEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TsoR+3ll;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q3-20020a37f703000000b006ccf9251337si1365942qkj.534.2022.10.29.15.49.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 29 Oct 2022 15:49:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TsoR+3ll;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooudz-0003ug-TC; Sat, 29 Oct 2022 18:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ooudy-0003sQ-F8
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 18:49:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1ooudw-0003fI-HE
 for qemu-devel@nongnu.org; Sat, 29 Oct 2022 18:49:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667083771;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1V8pPjHvD5aPA+jJA3sEzkdJ5CgZuM4B6kYb3gEX/VI=;
 b=TsoR+3llK5/bxXcKykk83VfDSoTuYqjexSrb0k/Xb1BZxZqfY3Qysv+bMJwddjIriNKC4m
 JQxdJ/ymc3aC9271xoCskuFb6P9U3HPE1Pxttl3xqKoIdLy/ny3x1p1qcOQZKU32/gOdyN
 Pz8U2yki46V//1yoLxBfiFkZ58v32pA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-602-dWleIZwXPOa6ja5EQKLlkg-1; Sat, 29 Oct 2022 18:49:28 -0400
X-MC-Unique: dWleIZwXPOa6ja5EQKLlkg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1967585A583;
 Sat, 29 Oct 2022 22:49:28 +0000 (UTC)
Received: from [10.64.54.151] (vpn2-54-151.bne.redhat.com [10.64.54.151])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CA3D4B3FC8;
 Sat, 29 Oct 2022 22:49:24 +0000 (UTC)
Subject: Re: [PATCH v6 0/7] hw/arm/virt: Improve address assignment for high
 memory regions
To: Marc Zyngier <maz@kernel.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, eric.auger@redhat.com,
 cohuck@redhat.com, zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
References: <20221024035416.34068-1-gshan@redhat.com>
 <fcf82677-dd16-82db-c502-a8baf35192f3@redhat.com>
 <874jvmhnqo.wl-maz@kernel.org>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <c59205a6-9ae0-41e1-0182-378f6b033cb4@redhat.com>
Date: Sun, 30 Oct 2022 06:49:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <874jvmhnqo.wl-maz@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.516,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Gavin Shan <gshan@redhat.com>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RPOis/rItjiA

Hi Marc,

On 10/29/22 7:29 PM, Marc Zyngier wrote:
> On Wed, 26 Oct 2022 01:29:56 +0100,
> Gavin Shan <gshan@redhat.com> wrote:
>> On 10/24/22 11:54 AM, Gavin Shan wrote:
>>> There are three high memory regions, which are VIRT_HIGH_REDIST2,
>>> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
>>> are floating on highest RAM address. However, they can be disabled
>>> in several cases.
>>>
>>> (1) One specific high memory region is disabled by developer by
>>>       toggling vms->highmem_{redists, ecam, mmio}.
>>>
>>> (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>>>       'virt-2.12' or ealier than it.
>>>
>>> (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>>>       on 32-bits system.
>>>
>>> (4) One specific high memory region is disabled when it breaks the
>>>       PA space limit.
>>>
>>> The current implementation of virt_set_memmap() isn't comprehensive
>>> because the space for one specific high memory region is always
>>> reserved from the PA space for case (1), (2) and (3). In the code,
>>> 'base' and 'vms->highest_gpa' are always increased for those three
>>> cases. It's unnecessary since the assigned space of the disabled
>>> high memory region won't be used afterwards.
>>>
>>> The series intends to improve the address assignment for these
>>> high memory regions and introduces new properties for user to
>>> selectively disable those 3 high memory regions.
>>>
>>> PATCH[1-4] preparatory work for the improvment
>>> PATCH[5]   improve high memory region address assignment
>>> PATCH[6]   adds 'compact-highmem' to enable or disable the optimization
>>> PATCH[7]   adds properties so that high memory regions can be disabled
>>>
>>> v5: https://lists.nongnu.org/archive/html/qemu-arm/2022-10/msg00280.html
>>> v4: https://lists.nongnu.org/archive/html/qemu-arm/2022-10/msg00067.html
>>> v3: https://lists.nongnu.org/archive/html/qemu-arm/2022-09/msg00258.html
>>> v2: https://lore.kernel.org/all/20220815062958.100366-1-gshan@redhat.com/T/
>>> v1: https://lists.nongnu.org/archive/html/qemu-arm/2022-08/msg00013.html
>>>
>>
>> Could you help to take a look when getting a chance? I think Connie and
>> Eric are close to complete the reviews, but v7 is still needed to address
>> extra comments from them. I hope to make v7 mergeable if possible :)
> 
> With the comments from Connie and Eric addressed, this looks good to
> me:
> 
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> 
> Thanks for having gone the extra mile on this one.
> 

Thank you for your feedback and reviews. I've posted v7 with your r-b
after resolving comments from Connie/Eric.

https://lists.nongnu.org/archive/html/qemu-arm/2022-10/msg00693.html (v7)

Thanks,
Gavin

