Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3740783lfb;
        Mon, 23 Nov 2020 08:31:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7r8J0U07Z+XNVkvZF4JJ/w+qJPSS2BZldPDKJ0yaBHP+gcp1Wkt3+VDNHXR0DCmUAv8Yw
X-Received: by 2002:a25:388:: with SMTP id 130mr382792ybd.416.1606149101892;
        Mon, 23 Nov 2020 08:31:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606149101; cv=none;
        d=google.com; s=arc-20160816;
        b=Bokr/weIGCgLRXBkK13oLr4CKRnS07l0UKrbzUD0yES1MDaNZK2wIQ2bF0X4ZBMSAC
         fBLpxuAqf6sHo0PkXOoGqr+iDXsjNc//MDkP2C0jt8dK8eP2lctFyXjtCzyHQXXOevzR
         rfDGVohmqvoc10CBndIMTHUATZ/VtDq/j23ulODWsxTlwUM6zFYJ17lwt76iBeu8ozEe
         4yBHd32dnuSvna0UpgxxYNMB6YmGy/VMA/EPuKNvNYHEYgOLoXQXO3F6aEHeUFsRUtYT
         xMPcf8f88oi+/uA8tq5UBpZJ40y/ckPg9Pvna0GXllSkxKylKnF6JKrmjKKdygc8KI8M
         zrBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=xNOwqIdxwIX+1fD/wHjrzhUN+oBJ52KhmkMlBQde7k4=;
        b=RkgWLlFSHJREyNVvGaCpOd0t9pQUaDaaEEcGn+czEjzHuJdtxL1lLrTHXjeV9W8kdg
         QMmChDOqfvzQjUHVD8uNtneP6t1r/FG1itpjy9bnHEbUle94koTfrfbuBa0zTzejjK6S
         bSUzoC9hdUJfXVQCF41rS5IMKfA9DNRmOTaLaiZmsKTAFBnEHwA9Z8LMfoAwxOUXYr2V
         6XfbmtyjAv2OgrggqIoNfxXvYerNirObVk/J9dvmaVXyNJIn1GS620SHMoe4ZnabZFv7
         EIz04/JYRAtRn/UzOn2jZSF0k5LAQjk6mE3KIkTe8abNd9l1D1jiA9G2uVsqA5DMY/ir
         /TsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=R7LkeES8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v20si13540853ybe.90.2020.11.23.08.31.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 08:31:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=R7LkeES8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khEkf-0004G0-8a
	for alex.bennee@linaro.org; Mon, 23 Nov 2020 11:31:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1khEkG-0004F1-GV
 for qemu-arm@nongnu.org; Mon, 23 Nov 2020 11:31:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1khEkE-0006FH-U6
 for qemu-arm@nongnu.org; Mon, 23 Nov 2020 11:31:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606149074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xNOwqIdxwIX+1fD/wHjrzhUN+oBJ52KhmkMlBQde7k4=;
 b=R7LkeES82/83y62MrMWyEa/iwVKJ8DPp02O1SuKEKvhP/oDQ8Zj9oobFUDg/7F58rfqyzy
 hDgocQszLOe0oKXK2Ltqidvew82eRnC+mycIqp4LDcvYm2vjydPljjv7yYBkBDDDnaSwsL
 l9YUJF2NCcqPr8EhggPDjFzkHm2DB3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-TfuIY5J4PLicNTzgxJ0tLQ-1; Mon, 23 Nov 2020 11:31:06 -0500
X-MC-Unique: TfuIY5J4PLicNTzgxJ0tLQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 874918042AE;
 Mon, 23 Nov 2020 16:31:04 +0000 (UTC)
Received: from gondolin (ovpn-113-104.ams2.redhat.com [10.36.113.104])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A4AF5C1BD;
 Mon, 23 Nov 2020 16:30:59 +0000 (UTC)
Date: Mon, 23 Nov 2020 17:30:56 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Shenming Lu <lushenming@huawei.com>
Subject: Re: [PATCH RFC] vfio: Set the priority of VFIO VM state change
 handler explicitly
Message-ID: <20201123173056.5b27ab5d.cohuck@redhat.com>
In-Reply-To: <20201117014050.1385-1-lushenming@huawei.com>
References: <20201117014050.1385-1-lushenming@huawei.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Neo Jia <cjia@nvidia.com>, Marc Zyngier <maz@kernel.org>,
 Kirti Wankhede <kwankhede@nvidia.com>, qemu-devel@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 yuzenghui@huawei.com, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bsyxXWMfqmPf

On Tue, 17 Nov 2020 09:40:50 +0800
Shenming Lu <lushenming@huawei.com> wrote:

> In VFIO VM state change handler, VFIO devices are transitioned in
> _SAVING state, which should keep them from sending interrupts. Then
> we can save the pending states of all interrupts in GIC VM state
> change handler (on ARM).
> 
> So we have to set the priority of VFIO VM state change handler
> explicitly (like virtio devices) to ensure it is called before GIC's
> in saving.

I'm wondering whether this is the case for other irq chips as well, and
the GIC is just the first one where it was noticed.

> 
> Signed-off-by: Shenming Lu <lushenming@huawei.com>
> ---
>  hw/vfio/migration.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 55261562d4..d0d30864ba 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -857,7 +857,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
>      register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
>                           vbasedev);
>  
> -    migration->vm_state = qemu_add_vm_change_state_handler(vfio_vmstate_change,
> +    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
> +                                                           vfio_vmstate_change,
>                                                             vbasedev);
>      migration->migration_state.notify = vfio_migration_state_notifier;
>      add_migration_state_change_notifier(&migration->migration_state);

I think this patch does what the patch description says, but I'm
wondering whether we might miss other interdependencies as well (which
would also be fixed by pushing the vm state handling of vfio devices to
that point in the sequence?)

