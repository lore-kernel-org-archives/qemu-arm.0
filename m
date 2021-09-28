Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4716772lfp;
        Tue, 28 Sep 2021 03:10:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLFJYZp+/Sz6i2J3++Cpn6dUe1/YXgK1aO8Wp2Utrp9DLanQoTseLkKHCxBs8Oe/phvo9x
X-Received: by 2002:a5d:6d07:: with SMTP id e7mr5384878wrq.378.1632823854706;
        Tue, 28 Sep 2021 03:10:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632823854; cv=none;
        d=google.com; s=arc-20160816;
        b=VjBLo1GhdNrRwt0ZiU8TDxBxzn5P1PqgofD/P14GU6IKCfPB/TCFJgBFkmQuFQSVVf
         v6uMZZwsjNsE6pJ6w6quYRytIQGjj2+3NI0rIaVRu87oQXkdw7Z3ZoA4zaNY7HOb0wx7
         A0Iuc8uKRWia50nFF73wuKEjB2E4qc1OC0rsP+OYdimQRV0MKPRRJ0yOFoF8imOIcvau
         wkjerAEgZqZXtTqCvaCBndE954MhzpeM+2NUJvEICK1dCNJpUlc0VHCRNyyZ/wOtPY3h
         kJdo8dRlnIzIsBPdD+4QkYzJVXLi8KNJmem0LmWlwnNZN3cmVIUhmXVzjZXPR5uotjQP
         jNLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=YPf3X5zlBXnSrfngXer8J+XGpH0c4FgtpUEzTgT61Vw=;
        b=dFyH/REs3N2WWAwMXbldoeBVH31GB35cj8ynPV+JgGmfJ188dUHw0C6xgjlLA2dx/f
         kuhx0aauLKj9v0/v+2bNURLgbs3L570yeYGIDBS8mHtxJY8PveKkZnWiMRITGeXrU4el
         t5ZuxckIsnSpjJiPJh0P/ZQhp3kVnLcsOn8IOJSF+ma10HpfpfI8FwFDRJM7f3gEAxiW
         6hjsxM/laGBlnOqrZo8bOgDPLC2QVtFIkb//Da1KcVd4pBln5Q+MBDC5Xuy9N2nspstl
         UpQ/MzO0Z/k6zgFJGkTMNTNi71iR6rNvmAWgAWqYR+nPYw4Ay67B186Qf7eySR2Xd/e9
         4tRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="dQZ9X1Z/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si16156914wrb.308.2021.09.28.03.10.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 03:10:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="dQZ9X1Z/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVA4b-0004KK-Rj
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 06:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVA3l-0004Jh-7v
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:10:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mVA3j-0001Qg-B8
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 06:10:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632823798;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YPf3X5zlBXnSrfngXer8J+XGpH0c4FgtpUEzTgT61Vw=;
 b=dQZ9X1Z/XZcmSnDq5kGnm3YwV+wSK+YptA8nIcY7yY/oG8X8DkxW5dQ/NPyWESxIAau91C
 2gPwAAt54Nf0Rp21ceIkv404lqEAwegBL1lNW65f/uSfZIh29hICr+QmYti5qXZff6yYVR
 Y+9vSb4vTJJJ9RlldDNlQyUqI6Ave8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-GaCtiCXiMrKBFu08lM4Msw-1; Tue, 28 Sep 2021 06:09:45 -0400
X-MC-Unique: GaCtiCXiMrKBFu08lM4Msw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC7FA50755;
 Tue, 28 Sep 2021 10:09:43 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EE2C60CC6;
 Tue, 28 Sep 2021 10:09:39 +0000 (UTC)
Date: Tue, 28 Sep 2021 11:09:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v11 03/14] machine: Uniformly use maxcpus to calculate
 the omitted parameters
Message-ID: <YVLp4ZVnVD6/ET8l@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-4-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20210928035755.11684-4-wangyanan55@huawei.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +pnebSS4tm98

On Tue, Sep 28, 2021 at 11:57:44AM +0800, Yanan Wang wrote:
> We are currently using maxcpus to calculate the omitted sockets
> but using cpus to calculate the omitted cores/threads. This makes
> cmdlines like:
>   -smp cpus=8,maxcpus=16
>   -smp cpus=8,cores=4,maxcpus=16
>   -smp cpus=8,threads=2,maxcpus=16
> work fine but the ones like:
>   -smp cpus=8,sockets=2,maxcpus=16
>   -smp cpus=8,sockets=2,cores=4,maxcpus=16
>   -smp cpus=8,sockets=2,threads=2,maxcpus=16
> break the sanity check.
> 
> Since we require for a valid config that the product of "sockets * cores
> * threads" should equal to the maxcpus, we should uniformly use maxcpus
> to calculate their omitted values.
> 
> Also the if-branch of "cpus == 0 || sockets == 0" was split into two
> branches of "cpus == 0" and "sockets == 0" so that we can clearly read
> that we are parsing the configuration with a preference on cpus over
> sockets over cores over threads.
> 
> Note: change in this patch won't affect any existing working cmdlines
> but improves consistency and allows more incomplete configs to be valid.
> 
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> ---
>  hw/core/machine.c | 30 +++++++++++++++---------------
>  hw/i386/pc.c      | 30 +++++++++++++++---------------
>  2 files changed, 30 insertions(+), 30 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

