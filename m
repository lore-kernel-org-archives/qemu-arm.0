Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp1723680lfd;
        Tue, 26 Jan 2021 13:36:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHbZYJPxL/NKUXib/TYtbl62RLjjt26Rcdh5GJZedFfZwckjKhkgisPYZk/sTb9GWn65+Z
X-Received: by 2002:a25:e013:: with SMTP id x19mr11310513ybg.122.1611697010708;
        Tue, 26 Jan 2021 13:36:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611697010; cv=none;
        d=google.com; s=arc-20160816;
        b=VIy/GBbeUiNZZeGU0QllPLRUAfX1CwTxMHCYv6mvdiKkgkAo7ymJr5ABvAscUFtZw1
         JPXARrptuXsyibQGn4scWkpWaZoMh5RC5OgsouOCPtB+G7hu6yAIsTioUnQg3lpuo/2Q
         MTUcWBQZRxJSVaysPcxRGhklE74WeoE5hqVpyZNMjpAGIfPoSvs7UezTM2t2VAWlbGmS
         cy3NcAKBqjdED2NxsIZGvZZgVnZOrXkJY/HSNdq8p4qlEdN8RDadi7fXSnlz1LCkQHxp
         H3aE3X8jWnXzesx919Ee5cdE1HNCeMIgHYhxrxD+yDicZi0dWRZJrQcZEUNFl2V1bpyp
         823Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=xwKZdxfl2BD5jdE0BuNGoIuKx58HeI7MN7LvxdIxtzA=;
        b=XGJUC2frldaQypoihNCTqtY4mJJIaiFp4ZUb/sT78HD7/hb+7poa8yNGsXH8PKRqN3
         CLCYWFvpOGGf1skuiPpCMPUkTfhRYQBtsHdIQMtdZ2Ic7/UQ4f06UhyLJt2Z0ekLS70P
         tt3lxX3AxuETdUXhQP0OfShdh3tbsk/3Z5Ok0d+76CkaTDoDPgksPZUVVFVAAW5Ppgk3
         eBUyx6MMNdR+/qTUzUCtkVj+q3C72474h42fU9ftop/PwgN7QBb3DkyASHbnxE2Q4+gm
         kFsAMdG6PUoY69LxaWf2F9aaiq7jExh++ECJEy82hkFgEUZ9iam6a3DEVjKe9Q4uIsg4
         Yzug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D19xl7g9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2si19268499ybb.357.2021.01.26.13.36.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Jan 2021 13:36:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=D19xl7g9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l4W14-0007IK-37
	for alex.bennee@linaro.org; Tue, 26 Jan 2021 16:36:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l4W0v-0007GQ-3N
 for qemu-arm@nongnu.org; Tue, 26 Jan 2021 16:36:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1l4W0s-0003pm-Mo
 for qemu-arm@nongnu.org; Tue, 26 Jan 2021 16:36:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611696998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xwKZdxfl2BD5jdE0BuNGoIuKx58HeI7MN7LvxdIxtzA=;
 b=D19xl7g9D0F00cNex6uROqztbxa/TkUhbwtbqQ8nEfuDOohm2DS45jtUMwW+ikV3tQ0MlW
 24CI7YSe+mrFbpVCAUX5TZqQZ0gZ3yIItu6l8dovvohEkgn11vb61GJs/+zSxHWO2shMy/
 Py6f64rOiYMhSWPwwm+YyNYRmWTYtyA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-9b3An5ctM26dwFxBUgMtIw-1; Tue, 26 Jan 2021 16:36:36 -0500
X-MC-Unique: 9b3An5ctM26dwFxBUgMtIw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 805CEA0C04;
 Tue, 26 Jan 2021 21:36:34 +0000 (UTC)
Received: from omen.home.shazbot.org (ovpn-112-255.phx2.redhat.com
 [10.3.112.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CED655D9DE;
 Tue, 26 Jan 2021 21:36:27 +0000 (UTC)
Date: Tue, 26 Jan 2021 14:36:05 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Shenming Lu <lushenming@huawei.com>
Subject: Re: [RFC PATCH v2 2/3] vfio: Set the priority of the VFIO VM state
 change handler explicitly
Message-ID: <20210126143605.4f9d5b25@omen.home.shazbot.org>
In-Reply-To: <20201209080919.156-3-lushenming@huawei.com>
References: <20201209080919.156-1-lushenming@huawei.com>
 <20201209080919.156-3-lushenming@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Neo Jia <cjia@nvidia.com>,
 mst@redhat.com, Marc Zyngier <maz@kernel.org>,
 Cornelia Huck <cohuck@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HbBgaQvuNldK

On Wed, 9 Dec 2020 16:09:18 +0800
Shenming Lu <lushenming@huawei.com> wrote:

> In the VFIO VM state change handler, VFIO devices are transitioned
> in the _SAVING state, which should keep them from sending interrupts.

Is this comment accurate?  It's my expectation that _SAVING has no
bearing on a device generating interrupts.  Interrupt generation must
be allowed to continue so long as the device is _RUNNING.  Thanks,

Alex

> Then we can save the pending states of all interrupts in the GIC VM
> state change handler (on ARM).
> 
> So we have to set the priority of the VFIO VM state change handler
> explicitly (like virtio devices) to ensure it is called before the
> GIC's in saving.
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

