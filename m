Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4913525lfb;
        Wed, 9 Dec 2020 04:47:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2/YtVut6dPzfk/0DU474q0VKXtwx6dPQjNHnRbf4kO13dAPx8FMR93r/m5Qdfl9oC7AW0
X-Received: by 2002:a25:abab:: with SMTP id v40mr3347751ybi.156.1607518031401;
        Wed, 09 Dec 2020 04:47:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607518031; cv=none;
        d=google.com; s=arc-20160816;
        b=Sw8kGjWoG1r5wQF3u8iLjPTjHhkPcGf//GHLr4lw5Ed76M94BcqY7pxF8NMMZ8no6k
         2+0vWNUSqbJQzlR3sP7EkX7pHlX57NbpCZI8f07qWY2plrM436fSJO8Z90GK9JA9BsUb
         skWSS+DNaOk4Dq3QYXeRp4puzDdNhQmi/g7o8JtvagHqsVrW/Q0fPM/p8KdSsWFgOExR
         OPtl3aGvrKMpbmBJVJiH5Bwo/aCOLrDN+boqyTCzc6hpF/yOsg4KP0NaWMBdp+S2hXpH
         qqCYy/PhcfKQ6zHlAhNMfhyoBBo5SFJ1XG0mnZKohIzJC+wkHd2ZW+UL3X3Su550AJLP
         //2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=LD8H6CUKIPGaBEoQu/VjYMXArMC4gfoh7GTu0kHur6I=;
        b=FqqrhXLhYQ7ovP7gsd9p+FbGxNf3q+rkWqMrJ9xQYtp311IsXv37Vo305G2ubT79Mk
         nJP/t9RG0VhTsaro5MpOuLi5d3vLPH+qK+sv6bz+3zZfx0tePbuGDQZfqVVfc9P+ACdn
         4C9BhPwIIHCwK83XSIZXa/2zsE1x9TiZPcXXCVdRebT6lx9MIwjzl4uwSv9SOX8WHSmm
         48ERWEuu8KxYx/pjl6/PAwMmwTSh/Bez2RzIB9bAbJs80Lij/6RKr2z4FVAt9skpZeKl
         vuCVlzLqura1DdtjzUQcnDhZ+FgsfsdxOWNPP0cJ1670ovVaYUBhRBZPVhb6Gv/qwkvI
         vREQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZmAQ6rSc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n124si1983873ybc.139.2020.12.09.04.47.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Dec 2020 04:47:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZmAQ6rSc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmysA-0002vC-Gn
	for alex.bennee@linaro.org; Wed, 09 Dec 2020 07:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmyrg-0002sy-Ea
 for qemu-arm@nongnu.org; Wed, 09 Dec 2020 07:46:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1kmyre-0002jS-UU
 for qemu-arm@nongnu.org; Wed, 09 Dec 2020 07:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607517998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LD8H6CUKIPGaBEoQu/VjYMXArMC4gfoh7GTu0kHur6I=;
 b=ZmAQ6rSc8/o55yfavLBI/khyF/LoeEP2ysscOkGlh19yXa6/a+sc0/6tBsODGeQ8tLjpcS
 wktBoVZvNFfMrIZXD56jBDk09m6S1VsFQNvyVbJCV+g/gsfVkTiskFI7ZraWo5M/oXczqH
 HuCQtU7mdOkNyRFKsqjWr524OZC32Y0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-Hzqg_MwOPv6TC4Votw4ZxQ-1; Wed, 09 Dec 2020 07:46:33 -0500
X-MC-Unique: Hzqg_MwOPv6TC4Votw4ZxQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DF11F1922057;
 Wed,  9 Dec 2020 12:46:09 +0000 (UTC)
Received: from gondolin (ovpn-113-135.ams2.redhat.com [10.36.113.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 74C827092B;
 Wed,  9 Dec 2020 12:45:39 +0000 (UTC)
Date: Wed, 9 Dec 2020 13:45:37 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Shenming Lu <lushenming@huawei.com>
Subject: Re: [RFC PATCH v2 2/3] vfio: Set the priority of the VFIO VM state
 change handler explicitly
Message-ID: <20201209134537.5c7ab401.cohuck@redhat.com>
In-Reply-To: <20201209080919.156-3-lushenming@huawei.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-3-lushenming@huawei.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, qemu-devel@nongnu.org, Marc Zyngier <maz@kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, yuzenghui@huawei.com,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BeVfr5PHChjl

On Wed, 9 Dec 2020 16:09:18 +0800
Shenming Lu <lushenming@huawei.com> wrote:

> In the VFIO VM state change handler, VFIO devices are transitioned
> in the _SAVING state, which should keep them from sending interrupts.
> Then we can save the pending states of all interrupts in the GIC VM
> state change handler (on ARM).
> 
> So we have to set the priority of the VFIO VM state change handler
> explicitly (like virtio devices) to ensure it is called before the
> GIC's in saving.

What this patch does is to make the priority of the vfio migration
state change handler depending on the position in the qdev tree. As all
state change handlers with no explicit priority are added at priority
0, this will make sure that this handler runs before (save) resp. after
(restore) nearly all other handlers, which will address your issue here
(and possibly similar ones).

So, this patch seems fine for now, but I'm wondering whether we need to
think more about priorities for handlers in general, and if there are
more hidden dependencies lurking in there.

> 
> Signed-off-by: Shenming Lu <lushenming@huawei.com>
> Reviewed-by: Kirti Wankhede <kwankhede@nvidia.com>
> ---
>  hw/vfio/migration.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 3b9de1353a..97ea82b100 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -862,7 +862,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>      register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
>                           vbasedev);
>  
> -    migration->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
> +    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
> +                                                           vfio_vmstate_change,
>                                                             vbasedev);
>      migration->migration_state.notify = vfio_migration_state_notifier;
>      add_migration_state_change_notifier(&migration->migration_state);

