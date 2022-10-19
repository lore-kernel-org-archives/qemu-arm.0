Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp356617ejn;
        Wed, 19 Oct 2022 06:55:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6fyh7d63K6GMWZGoRZUu1uoUOdMy5PIj3JZK44OJ01ACEhWrH4JkUXSvb1RbIC4YjXE/S4
X-Received: by 2002:a05:6214:2a83:b0:4b1:cdc6:821d with SMTP id jr3-20020a0562142a8300b004b1cdc6821dmr6598155qvb.36.1666187727674;
        Wed, 19 Oct 2022 06:55:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666187727; cv=none;
        d=google.com; s=arc-20160816;
        b=J1LgC93gQcBt6cBVeyrLrSD8tXxtoW4ODXzDac/EiWYezR2RNZRPy24Q6stxkY3u2e
         O6OOABedfyIbpiVkVVPyLKt4iPvr6sFno3kxeX9AbyBxJs3pWq9nukmHxFzbx5Eii2Vc
         IBlDk/EnIYLbD4NlYARk7dhsJl7J980miLI28BpNgwhN/duurOBxPeYrzgPqC486mLU7
         nj//jwCEx6GiOENM/vUhFsTrl3bQWUWbKTqGKs3ITMth3qkVG1b+tuebMn2yLegBXD9L
         ceyRYNEDqak/uYHE8sECwLUscqZ+HgML742DnCRjRQPHLZP+rcBHZBpFGz/Ng+vah39Y
         LeNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=NJoSbVTAQZD9MHdFzfSshQCBsbCQm+CaLlMav7eEXps=;
        b=udK519HTQvjnv10r8GPSB419NLHeqFlr50FZdi0+5UeQDbyZa7ItivAkYfKEAzOUch
         IZJsWTtB0yX6MApkcEKfxTvwdDPl6LKdNT+H6ZdHNJbEKaB788323qbYFwl8QkkCD84i
         btK04qnGUcSWvLK1RE3Tpjls7uR+5ddt4ChXaqVYU+PjYiS4/x0ym9Ro8Bq6rLKcOltK
         8na1zeHtPRvhfzwDSiGCnhYzznBMmHn2CZ4lYASudkkY0G7k/fEu8tl55XFtHG8e3XXQ
         otG4T3IvRSeLImj4h10h9STv69Y/rS4mOWs1Q2EIjxGBBXFQNUbfyz24OZefmb9Hl/c4
         /5rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YOuSXiJ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fb22-20020a05622a481600b0039cdad4d788si8448635qtb.777.2022.10.19.06.55.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Oct 2022 06:55:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YOuSXiJ7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ol9Xb-0000PS-5m
	for alex.bennee@linaro.org; Wed, 19 Oct 2022 09:55:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ol9X0-0000M6-73
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 09:54:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ol9Wy-0005Kw-Hc
 for qemu-arm@nongnu.org; Wed, 19 Oct 2022 09:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666187688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NJoSbVTAQZD9MHdFzfSshQCBsbCQm+CaLlMav7eEXps=;
 b=YOuSXiJ7MHVShKM0rV+JyzdcRKHp9piuQPqG3LSKDyV3hKaIhYAyiJ99hNcc07BU4dr5gR
 drXgQsVg3nrDjwmMK2Id7qshk52PpQO3PrqlZC++t5mxmc2KnHaTQl70DVGvMtCrsYzhVB
 q8MHVhEY3zIh5BpPs4ztf+8wwZHuB70=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-dtUB-jExNoe1QnSOBtsoGw-1; Wed, 19 Oct 2022 09:54:44 -0400
X-MC-Unique: dtUB-jExNoe1QnSOBtsoGw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE4E8185A792;
 Wed, 19 Oct 2022 13:54:43 +0000 (UTC)
Received: from localhost (unknown [10.39.194.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49A6A492B05;
 Wed, 19 Oct 2022 13:54:42 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, eric.auger@redhat.com,
 zhenyzha@redhat.com, richard.henderson@linaro.org,
 peter.maydell@linaro.org, shan.gavin@gmail.com
Subject: Re: [PATCH v5 5/6] hw/arm/virt: Improve high memory region address
 assignment
In-Reply-To: <20221011231832.149839-6-gshan@redhat.com>
Organization: Red Hat GmbH
References: <20221011231832.149839-1-gshan@redhat.com>
 <20221011231832.149839-6-gshan@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 19 Oct 2022 15:54:40 +0200
Message-ID: <87zgdrzzof.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4egquGqyF+IE

On Wed, Oct 12 2022, Gavin Shan <gshan@redhat.com> wrote:

> There are three high memory regions, which are VIRT_HIGH_REDIST2,
> VIRT_HIGH_PCIE_ECAM and VIRT_HIGH_PCIE_MMIO. Their base addresses
> are floating on highest RAM address. However, they can be disabled
> in several cases.
>
> (1) One specific high memory region is disabled by developer by
>     toggling vms->highmem_{redists, ecam, mmio}.
>
> (2) VIRT_HIGH_PCIE_ECAM region is disabled on machine, which is
>     'virt-2.12' or ealier than it.
>
> (3) VIRT_HIGH_PCIE_ECAM region is disabled when firmware is loaded
>     on 32-bits system.
>
> (4) One specific high memory region is disabled when it breaks the
>     PA space limit.
>
> The current implementation of virt_set_memmap() isn't comprehensive
> because the space for one specific high memory region is always
> reserved from the PA space for case (1), (2) and (3). In the code,
> 'base' and 'vms->highest_gpa' are always increased for those three
> cases. It's unnecessary since the assigned space of the disabled
> high memory region won't be used afterwards.
>
> This improves the address assignment for those three high memory
> region by skipping the address assignment for one specific high
> memory region if it has been disabled in case (1), (2) and (3).
> 'vms->high_compact' is false for now, meaning that we don't have
> any behavior changes until it becomes configurable through property
> 'compact-highmem' in next patch.
>
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Zhenyu Zhang <zhenyzha@redhat.com>
> ---
>  hw/arm/virt.c         | 23 +++++++++++++++--------
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 16 insertions(+), 8 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

