Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp344675lfp;
        Wed, 29 Sep 2021 05:39:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmpVXVdk2khv6PGWyR93YxaRa4N89jK6Y6cxX9X6pRhUsTK0It+rjT8ABU+OAYwTgNZqzZ
X-Received: by 2002:ab0:538a:: with SMTP id k10mr10275777uaa.14.1632919189559;
        Wed, 29 Sep 2021 05:39:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632919189; cv=none;
        d=google.com; s=arc-20160816;
        b=mEbnQ9Evt+95IUGUEOukCBZ9csvTmRfahOIkw/dbLxHHSsj2C/3Ndhu+X3QrUaQV6P
         TqD/DS0j0XKIZPv6Fm7+W5sr8RRJOAk5WXCIfNoihFS7uB7L98X/4Z86DQmU9esMGx/0
         mEZOPAohYPzjQd8IuHQOqk2QugSXeFpDi7F89j7//v50rslW5ZyCqV3QeOAWuGHV3WzR
         2nIXs2TJGNCa7Q8WZCcnu6sawKa9SjnEXRHK70VTjRX1h4e0GFR+MJ4cZv66c+X3WYV1
         4duP99QUabzBJ5JkuVEc7+TL8WZciyKeOhxfNnpBBfcmbC4g82rCuEzaY/Eot41TGqhT
         PGOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=5xWon0LpdMcSiScxgfTajZ97mtEj41xjp1U3RRgpBMw=;
        b=dIYBTOIIjY/brz7+dOb3ElJVK+lGq3bvkRY3aGrDzOT/FuwHlaUpkSK05a95fB1OHV
         kpxKM+6rgGF3UGG+ObI50J8AVjZEIwNgucJkwZ+dEDUx0Itp1Wrz5X1nZqJ0FiKWFIyt
         iUb8v6nXQgF99zOo7dY4aCMB+tW5vJdxw1MoMOhSbdSrHhMS2xWZSPaQF7nDxUPuqKYy
         9b9vsIHdSVtxJjk0eHNVch1uFldFu1w/KCQ0nJhC2EhPAl626X5/oHsEvuahlMRNJPJ8
         f9PGxP4jYXKd+VnjkmCsbFGrVXf6kELvSz/9biqro5RSrTJccmKkfKdQM9WWXHdBpnvz
         YQnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b1HfUYWS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ba13si1918739uab.64.2021.09.29.05.39.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Sep 2021 05:39:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=b1HfUYWS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVYsG-0003NM-Rz
	for alex.bennee@linaro.org; Wed, 29 Sep 2021 08:39:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVYru-0003MW-V8
 for qemu-arm@nongnu.org; Wed, 29 Sep 2021 08:39:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mVYrq-000083-KN
 for qemu-arm@nongnu.org; Wed, 29 Sep 2021 08:39:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632919160;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5xWon0LpdMcSiScxgfTajZ97mtEj41xjp1U3RRgpBMw=;
 b=b1HfUYWSbW0DvsJCe17zDid58VySKarfJjHHaMqPruYV3Npj6QWHjDV/1mcl2MF/MjAYua
 pNZlJxJQoN8E9Vmt3r5ifae6sL0ICYvNrdhkd8jMpv5xLBq0e7W8WAWQGaVzgWWWgxShpJ
 DYC0ZmpggTuvh33migIdXs8DRCETA58=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-0vJARfO1NpS0-MEn033XpA-1; Wed, 29 Sep 2021 08:39:19 -0400
X-MC-Unique: 0vJARfO1NpS0-MEn033XpA-1
Received: by mail-ed1-f72.google.com with SMTP id
 a7-20020a509e87000000b003da71d1b065so2287918edf.4
 for <qemu-arm@nongnu.org>; Wed, 29 Sep 2021 05:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5xWon0LpdMcSiScxgfTajZ97mtEj41xjp1U3RRgpBMw=;
 b=xk58I+gGyIYgkjzI50LccdSk12RwRZSTyJvPro26g5dJwWOU1l6kSjJ3W/IqqIIFas
 4MUXpn1Jbg/KEQ/YbpSjpLzDkt4iITqoBLriYixsVUufU8pSazLq8GtgnLT0+sQmFxYh
 mJyjuZtnzI024F8B7R5X5KGNzPttdKIi+3C2MTvzBE341RYe1pTHTI9Q6W5aFjQiLyN7
 hIxObGlDKJzYEI1aquHYdalT3KGLgZ28tn3Eej0FGgynwBcMGl1iItfoJGZtAiheHBiU
 O0bkHdtyffQJagGzkId2Pu55/rpDp1vB9Mz7FK7+keqP4I3WOpvf+crPCGOqPiOCxckD
 EqHg==
X-Gm-Message-State: AOAM532weK378y0ZM0WW+YC7c28qTGLH0oIkvZUn1mUcGMBbxA87MNLM
 VKBWmtIS7XgY4ghw65kdFvKYGKqdIP18HeY2i0iJmZyX7gqJs0lcHc1zenQoCXc2iTBJr427YVA
 2m756XkXzj4LF
X-Received: by 2002:a50:da8d:: with SMTP id q13mr15016727edj.198.1632919158248; 
 Wed, 29 Sep 2021 05:39:18 -0700 (PDT)
X-Received: by 2002:a50:da8d:: with SMTP id q13mr15016685edj.198.1632919157912; 
 Wed, 29 Sep 2021 05:39:17 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id b5sm1483420edu.13.2021.09.29.05.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 05:39:17 -0700 (PDT)
Message-ID: <83769e14-f85b-26bd-705c-498557b26f57@redhat.com>
Date: Wed, 29 Sep 2021 14:39:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v12 00/16] machine: smp parsing fixes and improvement
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20210929025816.21076-1-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.03, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wv8Igu1w+jhM

On 29/09/21 04:58, Yanan Wang wrote:
> Hi,
> 
> This is a new version (v12) with minor update suggested by Daniel
> and Philippe. Two new commits (#1 and #16) are added. Thanks!

Queued, thanks!

Paolo

> Summary of v12:
> 1) Specifying a CPU topology parameter as zero was implicitly allowed
> but undocumented before, while now it's explicitly deprecated.
> 
> 2) Refactor/fixes of the smp parsers.
> 
> 3) For consistency, maxcpus is now uniformly used to calculate the
> omitted topology members.
> 
> 4) Improve the error reporting of the parsers.
> 
> 5) It's also suggested that we should start to prefer cores over sockets
> over threads on the newer machine types, which will make the computed
> virtual topology more reflective of the real hardware. Related discussion
> can be found in [1].
> [1] https://lore.kernel.org/qemu-devel/YNIgInK00yNNI4Dy@redhat.com/
> 
> 6) In order to reduce code duplication and ease the code maintenance,
> smp_parse() is converted into a generic enough parser for all arches,
> so that the arch-specific ones (e.g. pc_smp_parse) can be removed.
> It's also convenient to introduce more topology members to the generic
> parser in the future. Related discussions can be found in [2] and [3].
> [2] https://lore.kernel.org/qemu-devel/20210630115602.txmvmfe2jrzu7o67@gator.home/
> [3] https://lore.kernel.org/qemu-devel/YPFN83pKBt7F97kW@redhat.com/
> 
> Changelogs:
> 
> v11->v12:
> - add an extra commit 16/16 to make smp_parse() return a boolean (Philippe)
> - split the machine.json Doc fix out into a separate patch 01/16 (Daniel)
> - add R-bs for the series from Daniel and Philippe, thanks!
> - v11: https://lore.kernel.org/qemu-devel/20210928035755.11684-1-wangyanan55@huawei.com/
> 
> v10->v11:
> - only update patch 11/14
>    use GString APIs to build the cpu topology hierarchy string (Daniel)
>    refine the comments of smp_parse()
> - v10: https://lore.kernel.org/qemu-devel/20210926084541.17352-1-wangyanan55@huawei.com/
> 
> v9->v10:
> - rebased on latest upstream commit 11a1199846.
>    there is no change of the patches in v10, except minor update
>    in 08/14 to resolve merge conflict with master.
> - To make this series more acceptable, drop the last two patches
>    about SMP unit test, since the scalability of the test is not
>    optimally designed after rethinking of it. So I will resend the
>    test related patches separately after refining them.
> - v9: https://lore.kernel.org/qemu-devel/20210910073025.16480-1-wangyanan55@huawei.com/
> 
> Yanan Wang (16):
>    qapi/machine: Fix an incorrect comment of SMPConfiguration
>    machine: Deprecate "parameter=0" SMP configurations
>    machine: Minor refactor/fix for the smp parsers
>    machine: Uniformly use maxcpus to calculate the omitted parameters
>    machine: Set the value of cpus to match maxcpus if it's omitted
>    machine: Improve the error reporting of smp parsing
>    qtest/numa-test: Use detailed -smp CLIs in pc_dynamic_cpu_cfg
>    qtest/numa-test: Use detailed -smp CLIs in test_def_cpu_split
>    machine: Prefer cores over sockets in smp parsing since 6.2
>    machine: Use ms instead of global current_machine in sanity-check
>    machine: Tweak the order of topology members in struct CpuTopology
>    machine: Make smp_parse generic enough for all arches
>    machine: Remove smp_parse callback from MachineClass
>    machine: Move smp_prefer_sockets to struct SMPCompatProps
>    machine: Put all sanity-check in the generic SMP parser
>    machine: Make smp_parse return a boolean
> 
>   docs/about/deprecated.rst  |  15 +++
>   hw/arm/virt.c              |   1 +
>   hw/core/machine.c          | 206 ++++++++++++++++++++++++++-----------
>   hw/i386/pc.c               |  63 +-----------
>   hw/i386/pc_piix.c          |   1 +
>   hw/i386/pc_q35.c           |   1 +
>   hw/ppc/spapr.c             |   1 +
>   hw/s390x/s390-virtio-ccw.c |   1 +
>   include/hw/boards.h        |  23 +++--
>   qapi/machine.json          |   2 +-
>   qemu-options.hx            |  24 +++--
>   tests/qtest/numa-test.c    |   6 +-
>   12 files changed, 201 insertions(+), 143 deletions(-)
> 
> --
> 2.19.1
> 
> 

