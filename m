Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp5018974lfc;
        Fri, 15 Oct 2021 03:51:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVqmF2Ewb35S2+ew1RsO51d3NEFWeAXrMcydvJC8/dTVJonzOrzCgc+zVhs6ttB+K+O6bt
X-Received: by 2002:a05:6602:2e01:: with SMTP id o1mr3059281iow.31.1634295103112;
        Fri, 15 Oct 2021 03:51:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634295103; cv=none;
        d=google.com; s=arc-20160816;
        b=FRnPBXf7ZWdhnnFREO5WUdQ5AH2fmsZJ0BGWyilBWATHDE2qkxsDtyg2StXerGEzgq
         ZL+Nwg7yRwBRwMZyO94MwjFaOXLfTLR179QhhHpHRkW1WhaWP6YUMi9f/wmb1N/Rt4ab
         PKUyHixda1RqxtZ6OA/guTOaNlaPSklwXfWtDiox1Ln+p1qT2M+4lYd3Vr5Nv3BQjPxK
         ZFgtIL3SvmbWTRqA4Ks6N4Rs41CxcKSWaJbK0WjfX5/v5LZV+A01++yHI/ieiPDMcrDm
         Ix1uRsE81W99fnY7CK4oQDvSg2R51ZRYKxBy9783TxPGpmmgjVL07YSBVJ9gfjvMUhSI
         yrNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=IP84RLEef8DaPhB4Fxzg9put8LCkXdkifQFkF3LQcf4=;
        b=XJJYXaT2Gem/XcWeO1l6f1YiU/CS3CBUfTKYkn23dXLicx03eKZhwqzDvh5/GVeqU4
         vnoEYVN2fat7yU0z3PB5osn8Ez5QfDbvzCdNCTEDsGxbGKysqrUOI3xWW7v3hRvRVD1F
         iYeib+GGhi2LU/X2ow5EjdxJhRUUgJ8UeASkTSe0YEoESxt92e8RAeJ7H6U4PpeNuV7r
         OfTpcmM2Ec43DUcN8x4DCYyR2LMl9ez70hLKWT5X4q4y3Sfk3UwKkeT7GjXaoJqGmErq
         TtyrZ9mYXQ6OCjPLH/hi6aSFgoTyZsJWsp1G9HUGltIu2NZQh1QU4fyr0EUSEVJq4+qZ
         0hrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HYyHFs+X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k14si6593387ili.36.2021.10.15.03.51.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Oct 2021 03:51:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HYyHFs+X;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mbKoQ-000164-Ce
	for alex.bennee@linaro.org; Fri, 15 Oct 2021 06:51:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mbKoG-00014w-0G
 for qemu-arm@nongnu.org; Fri, 15 Oct 2021 06:51:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1mbKoD-0002Vg-1U
 for qemu-arm@nongnu.org; Fri, 15 Oct 2021 06:51:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634295088;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IP84RLEef8DaPhB4Fxzg9put8LCkXdkifQFkF3LQcf4=;
 b=HYyHFs+Xy4P8z/ACPwI0+EllHJc7+3NM6JetqSXsqORnF6IvLAnxB5Z8HReTqlnNlFKcVF
 YLjk4L+7OybDIkNq5baNQ0xoVCtqoJ2D8K2BpKrgEcVbRFZRgjUkLxHYhpyUrtsS9QPYkD
 H86gfhqaqb0RvYA6S46z4G6R5aV6Z4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-n6G9Q83hNymPECsMRQOFIA-1; Fri, 15 Oct 2021 06:51:25 -0400
X-MC-Unique: n6G9Q83hNymPECsMRQOFIA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D621610A8E00;
 Fri, 15 Oct 2021 10:51:23 +0000 (UTC)
Received: from [10.64.54.38] (vpn2-54-38.bne.redhat.com [10.64.54.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CE9F2B060;
 Fri, 15 Oct 2021 10:51:17 +0000 (UTC)
Subject: Re: [PATCH v3 1/2] numa: Require distance map when empty node exists
To: Andrew Jones <drjones@redhat.com>
References: <20211013045805.192165-1-gshan@redhat.com>
 <20211013045805.192165-2-gshan@redhat.com>
 <20211013133011.62b8812d@redhat.com>
 <20211013113544.4xrfagduw4nlbvou@gator.home>
 <20211013135346.3a8f6c9a@redhat.com>
 <20211013121125.sdewyrxcipsi3o22@gator.home>
 <20211013122840.fi4ufle4czyzegtb@gator.home>
 <20211014171417.541c9bee@redhat.com> <20211014153609.pzndx7um3dfdgelo@gator>
 <2399ce27-0663-6780-5453-3ee773563352@redhat.com>
 <20211015083359.j5t2xt7cfdjqbzlm@gator>
From: Gavin Shan <gshan@redhat.com>
Message-ID: <f199b132-7db1-0f1d-dd52-49355d38db3a@redhat.com>
Date: Fri, 15 Oct 2021 21:51:07 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20211015083359.j5t2xt7cfdjqbzlm@gator>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=gshan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -9
X-Spam_score: -1.0
X-Spam_bar: -
X-Spam_report: (-1.0 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 shan.gavin@gmail.com, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CS+zIYHb7Z5p

Hi Drew,

On 10/15/21 7:33 PM, Andrew Jones wrote:
> On Fri, Oct 15, 2021 at 07:22:05PM +1100, Gavin Shan wrote:
>> It's possible that the empty NUMA nodes aren't referred by any CPUs,
>> as the following command line indicate. In this case, the empty NUMA
>> node IDs aren't existing in device-tree CPU nodes. So we still need
>> the distance-map.
> 
> Ah, indeed.
> 
>>
>> However, I would like to drop this (PATCH[01/02]) in v4. The memory
>> hotplug through device-tree on ARM64 isn't existing. We might have
>> alternative ways to present the empty NUMA nodes when it's supported,
>> or we needn't it for ever because ACPI is enough to support the
>> memory hotplug.
> 
> Agreed. Please update the commit message of 2/2 for v4 and also add
> a comment above the new code with the rationale for dropping those
> memory nodes.
> 

v4 was posted for review. Your r-b tag was dropped as the additional
comments are added. Please take a look on v4 and sorry for having
taken so much time from you :)

Thanks,
Gavin

