Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp333548lfc;
        Wed, 3 Jun 2020 02:38:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwghPeL//AmVDbgepI1GYX1KZNl2GuWS+4gpFqmSviwrX0wokcTikxv7Gyet7h/KhvUpxx8
X-Received: by 2002:a25:bc81:: with SMTP id e1mr47111475ybk.311.1591177092318;
        Wed, 03 Jun 2020 02:38:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591177092; cv=none;
        d=google.com; s=arc-20160816;
        b=C8ahN94gcI9G08bvQ6MORm/cm/2YquWYLNS8M5PEH/OFInobMUJmXfeS+SXjXWtdG0
         w5RriGoSfFXBjP+vAiGn91C+EOeTtK4biMX8cLU1AODdJqIeNB8l/rqmKhpQ05bjgNa3
         yOfzbqEl6WRHpZyPJB9wXb6Sy2lYbZ/Q/9MjnN4aT6Zbt0hrHZ3/scH83/eAQBwnCYV2
         8LgjOrHd6inGa7hDzxclKpESo6LuSIynjA4Ombak5ZsprABj4d63CTYBvsgbYnh403bJ
         EPqA3U/6zKbhMIJegoNcq8xoEZ4UOaZBXr/HJkx2aI812hFkpGcL3Tymt3/QVxgwFAnq
         UePw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Bw0cU2/dYCtI4rEMGijgJJUH235fLxtwfm6Pb5ZuLS8=;
        b=m4iDtIJAN58fyL148498am1ES6Vxr7uI0y9qrEeS8/AnaaQwYPG4hUoLF50V7YM1UT
         qGUCBpuU5sbrvSFalpwQ/KuxcoCdWJhqCijzNxVpc0TF6q345IMayAdb3bTW6wxG6dMf
         /25Grpta50cP7QY8bT2aOHtyvmNMWl2oVjAmKEv/NnsL3Ut1kvawaE9nwy0c1gIUeCr0
         NdZNzutmES3JBn2FM806BhbTbdBQobd/+sXzuEADL6izDMGSzarDDVFpTD5hiP9G1g1/
         karLrL/5zMH4G3fGHp9PBGZozyoXA/dQNKUnXED1TThDevhpIyIBXYGeNc3RtFYRI+9i
         FnDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fgcrbjfn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10si1264719ybh.454.2020.06.03.02.38.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 02:38:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=fgcrbjfn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgPqd-0005Kz-O9
	for alex.bennee@linaro.org; Wed, 03 Jun 2020 05:38:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jgPqR-00052S-Iz
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 05:37:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:39448
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jgPqQ-0000GB-Q0
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 05:37:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591177077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Bw0cU2/dYCtI4rEMGijgJJUH235fLxtwfm6Pb5ZuLS8=;
 b=fgcrbjfndeQBBAsKajGEm7BD22RVMlCn/a0Z+CQkD/WRyy0PG2BAtKNMhfyhnGjLe4r35K
 OPciMzxiVFh980EeyZWzpuhga1VlQaEV1s/2UnbA/u4fTl+BkySrMO5cOJpV4v/+6ecpgL
 sHGuLRiLRieanqu/451gDT7GmIPxe9U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-30-CjLntQqDOJ-PrmIQisRKTA-1; Wed, 03 Jun 2020 05:37:54 -0400
X-MC-Unique: CjLntQqDOJ-PrmIQisRKTA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0695F461;
 Wed,  3 Jun 2020 09:37:53 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 474B4579A3;
 Wed,  3 Jun 2020 09:37:48 +0000 (UTC)
Date: Wed, 3 Jun 2020 11:37:45 +0200
From: Andrew Jones <drjones@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Subject: Re: [Question] Regarding PMU initialization within the QEMU for ARM
 VCPUs
Message-ID: <20200603093745.dwfb55ny34az7rez@kamzik.brq.redhat.com>
References: <b2e401cd17fe49d792d09b31bd726e35@huawei.com>
MIME-Version: 1.0
In-Reply-To: <b2e401cd17fe49d792d09b31bd726e35@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:04:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: owku3gqOowbq

On Mon, Jun 01, 2020 at 03:04:33PM +0000, Salil Mehta wrote:
> Hello,
> I could see below within function fdt_add_pmu_nodes() part of
> hw/arm/virt.c during virt machine initialization time:
> 
> Observation:
> In below function, support of PMU feature is being checked for
> each vcpu and if the PMU is found part of the features then PMU
> is initialized with in the host/KVM. But if there is even one
> vcpu which is found to not support the PMU then loop is exited
> and PMU is not initialized for the rest of the vcpus as well.
> 
> Questions:
> Q1. Not sure what is the logic of the premature exit and not
>     continuing with further checks and initialization of other
>     VCPU PMUs?

KVM requires all VCPUs to have a PMU if one does. If the ARM ARM
says it's possible to have PMUs for only some CPUs, then, for TCG,
the restriction could be relaxed. I expect it will take more than
just removing the check for things to work though.

> Q2. Does it even makes sense to have PMUs initialized for some
>     vcpus and not for others unless we have heterogeneous system? 

I don't know, but it doesn't sound like a configuration I'd like
to see.

> Q3. Also, there is a per virt machine knob of vcc->no_pmu.
>     This is something which user could specify at the init time
>     and perhaps only once but we don't use it for ARM. Perhaps
>     should have been used even before entering this function
>     to enable or disable the support as per user config?

It's purpose is to keep users from doing 'pmu=on' on 2.6 machine
types. On 2.7 and later machine types if you don't want a PMU
you should use 'pmu=off'.

> Q4. This function  fdt_* looks to be wrongly named. The info
>     being initialized here shall be used even when ACPI is
>     being used. Initialization part and FDT info looked
>     mixed up here if I am right?

Agreed. The function has the wrong name. mach-virt has many functions that
mix the initialization and fdt building together, but those functions are
named something like create_foo(). Patches welcome.

Thanks,
drew

