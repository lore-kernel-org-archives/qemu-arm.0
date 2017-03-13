Received: by 10.25.77.4 with SMTP id a4csp1274536lfb;
        Mon, 13 Mar 2017 11:04:14 -0700 (PDT)
X-Received: by 10.55.16.157 with SMTP id 29mr30929740qkq.247.1489428254480;
        Mon, 13 Mar 2017 11:04:14 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q31si993361qta.195.2017.03.13.11.04.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Mar 2017 11:04:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53656 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cnUKJ-0002sW-VD
	for alex.bennee@linaro.org; Mon, 13 Mar 2017 14:04:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42107)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cnUKC-0002s5-TR
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 14:04:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cnUKB-0000Vu-V0
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 14:04:04 -0400
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229]:33149)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cnUKB-0000V7-Me
	for qemu-arm@nongnu.org; Mon, 13 Mar 2017 14:04:03 -0400
Received: by mail-wr0-x229.google.com with SMTP id u48so109131801wrc.0
	for <qemu-arm@nongnu.org>; Mon, 13 Mar 2017 11:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=x6i+7wZyBXSgCkbaaFuzHXQ1e+8i/2j1us2aHl555aI=;
	b=gY/TYKFZHD24iALi8pUQHrJpLgLi2amjTyBiv11+rMzvYaYeuujRkPBpLh2cqcQish
	5lnn7XxVfqi1Acass4xX4RP9wjsKMoHqFU55lex+rTZykp2pzpXpfKlguYnBmuW9Bx8J
	LzZjSlCDEbRLDQbuZDpPPHoeolhd70eq2QdRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=x6i+7wZyBXSgCkbaaFuzHXQ1e+8i/2j1us2aHl555aI=;
	b=RU1qdOCjwjqO4sh3hOMJxmORPUWLaDOiszWXnix/M9qq98d0nvmwxTtYPkt727E7SO
	rWEM5GH0tnL5Gh2Iz+AswlqHZ9RI83+Wh7PI6CjOAHE26FTpyuUOOu9noEv8JF1HyUi7
	9mnXzKZmHVjjv4WrErY+g+4rZ6juGrYL4qIKUK8RzALNoRtgx/VW/jAsxZuKBU8qosWV
	i4Bbtsvf6q8hF9otE16fXH1/8xagT4tJC7ki6Skl7CFev0kzO32baW+pcEPufNa4fKzA
	SWqVXM2p/11xZ36xTDGPISJqZuZ/SzmsXzsMxZJTHntTU4DKSzNomzDfCZcA4QRDxkTQ
	iQkQ==
X-Gm-Message-State: AMke39mpK8zjEddkqP5Y2R8k9r3TjwY3WNht9iH4W1PhPPeJwcLtt5fiEtjTnAL9v1xYqMevfCJd+P6olgk0tSyL
X-Received: by 10.223.152.215 with SMTP id w81mr32538441wrb.151.1489428242276; 
	Mon, 13 Mar 2017 11:04:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Mon, 13 Mar 2017 11:03:41 -0700 (PDT)
In-Reply-To: <1488800894-22421-4-git-send-email-eric.auger@redhat.com>
References: <1488800894-22421-1-git-send-email-eric.auger@redhat.com>
	<1488800894-22421-4-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Mar 2017 19:03:41 +0100
Message-ID: <CAFEAcA97hCS-bbKDV+w2G3yRunUm=QpsA+8Bqp9YNaa_VtMP-w@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::229
Subject: Re: [Qemu-arm] [RFC v2 3/3] hw/intc/arm_gicv3_its: Allow
 save/restore
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, "Kumar, Vijaya" <Vijaya.Kumar@cavium.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m65CTi3fN95/

On 6 March 2017 at 12:48, Eric Auger <eric.auger@redhat.com> wrote:
> We change the restoration priority of both the GICv3 and ITS. The
> GICv3 must be restored before the ITS and the ITS needs to be restored
> before PCIe devices since it translates their MSI transactions.

> We typically observe the virtio-pci-net device sending MSI transactions
> very early (even before the first vcpu run) which looks weird. It
> appears that not servicing those transactions cause the virtio-pci-net
> to stall.

This does seem rather weird and worth closer investigation.
A stopped VM ought IMHO to be completely stopped, not still
doing things...

> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v1 -> v2:
> - handle case where migrate_add_blocker fails
> - add comments along with ITS and GICv3 migration priorities
> ---
>  hw/intc/arm_gicv3_common.c     |  1 +
>  hw/intc/arm_gicv3_its_common.c |  3 ++-
>  hw/intc/arm_gicv3_its_kvm.c    | 23 +++++++++++------------
>  include/migration/vmstate.h    |  2 ++
>  4 files changed, 16 insertions(+), 13 deletions(-)
>
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index c6493d6..4228b7c 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -145,6 +145,7 @@ static const VMStateDescription vmstate_gicv3 = {
>      .minimum_version_id = 1,
>      .pre_save = gicv3_pre_save,
>      .post_load = gicv3_post_load,
> +    .priority = MIG_PRI_GICV3,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(gicd_ctlr, GICv3State),
>          VMSTATE_UINT32_ARRAY(gicd_statusr, GICv3State, 2),
> diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
> index 75b9f04..854709f 100644
> --- a/hw/intc/arm_gicv3_its_common.c
> +++ b/hw/intc/arm_gicv3_its_common.c
> @@ -48,7 +48,8 @@ static const VMStateDescription vmstate_its = {
>      .name = "arm_gicv3_its",
>      .pre_save = gicv3_its_pre_save,
>      .post_load = gicv3_its_post_load,
> -    .unmigratable = true,
> +    .unmigratable = false,

unmigratable = false is the default, so we can just delete the line.

> +    .priority = MIG_PRI_GICV3_ITS,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(ctlr, GICv3ITSState),
>          VMSTATE_UINT64(cbaser, GICv3ITSState),
> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> index 45e57d6..3bd2873 100644
> --- a/hw/intc/arm_gicv3_its_kvm.c
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -76,18 +76,6 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
>      GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
>      Error *local_err = NULL;
>
> -    /*
> -     * Block migration of a KVM GICv3 ITS device: the API for saving and
> -     * restoring the state in the kernel is not yet available
> -     */
> -    error_setg(&s->migration_blocker, "vITS migration is not implemented");
> -    migrate_add_blocker(s->migration_blocker, &local_err);
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        error_free(s->migration_blocker);
> -        return;
> -    }
> -
>      s->dev_fd = kvm_create_device(kvm_state, KVM_DEV_TYPE_ARM_VGIC_ITS, false);
>      if (s->dev_fd < 0) {
>          error_setg_errno(errp, -s->dev_fd, "error creating in-kernel ITS");
> @@ -104,6 +92,17 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
>
>      gicv3_its_init_mmio(s, NULL);
>
> +    if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
> +        GITS_CTLR)) {
> +        error_setg(&s->migration_blocker, "vITS migration is not implemented");

I think we should specifically say that it's the host kernel
that doesn't support ITS migration (ie not QEMU that's missing
support).

The GICv3 uses the message
 "This operating system kernel does not support vGICv3 migration"
which is slightly odd phrasing but I guess we should follow that.

> +        migrate_add_blocker(s->migration_blocker, &local_err);
> +        if (local_err) {
> +            error_propagate(errp, local_err);
> +            error_free(s->migration_blocker);
> +            return;
> +        }
> +    }
> +
>      kvm_msi_use_devid = true;
>      kvm_gsi_direct_mapping = false;
>      kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index f2dbf84..8dab9c7 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -198,6 +198,8 @@ enum VMStateFlags {
>  typedef enum {
>      MIG_PRI_DEFAULT = 0,
>      MIG_PRI_IOMMU,              /* Must happen before PCI devices */
> +    MIG_PRI_GICV3_ITS,          /* Must happen before PCI devices */
> +    MIG_PRI_GICV3,              /* Must happen before the ITS */
>      MIG_PRI_MAX,
>  } MigrationPriority;
>
> --
> 2.5.5
>

thanks
-- PMM
