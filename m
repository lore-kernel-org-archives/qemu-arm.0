Received: by 10.25.77.4 with SMTP id a4csp840807lfb;
        Thu, 16 Mar 2017 08:28:53 -0700 (PDT)
X-Received: by 10.200.44.138 with SMTP id 10mr9553556qtw.12.1489678133291;
        Thu, 16 Mar 2017 08:28:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q15si4150384qtb.202.2017.03.16.08.28.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Mar 2017 08:28:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44306 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1coXKe-0003r6-Px
	for alex.bennee@linaro.org; Thu, 16 Mar 2017 11:28:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1coXKa-0003qz-To
	for qemu-arm@nongnu.org; Thu, 16 Mar 2017 11:28:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1coXKV-0003DB-W6
	for qemu-arm@nongnu.org; Thu, 16 Mar 2017 11:28:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50100)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1coXKV-0003Ct-ML; Thu, 16 Mar 2017 11:28:43 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9EFA8C057FA4;
	Thu, 16 Mar 2017 15:28:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9EFA8C057FA4
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9EFA8C057FA4
Received: from localhost.localdomain (ovpn-116-159.ams2.redhat.com
	[10.36.116.159])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FEAC17100;
	Thu, 16 Mar 2017 15:28:39 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1488800894-22421-1-git-send-email-eric.auger@redhat.com>
	<1488800894-22421-4-git-send-email-eric.auger@redhat.com>
	<CAFEAcA97hCS-bbKDV+w2G3yRunUm=QpsA+8Bqp9YNaa_VtMP-w@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <884feb25-e918-1cc6-10d5-ea37387bceb7@redhat.com>
Date: Thu, 16 Mar 2017 16:28:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA97hCS-bbKDV+w2G3yRunUm=QpsA+8Bqp9YNaa_VtMP-w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 16 Mar 2017 15:28:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
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
X-TUID: FKyRqX3eI9IA

Hi Peter,

On 13/03/2017 19:03, Peter Maydell wrote:
> On 6 March 2017 at 12:48, Eric Auger <eric.auger@redhat.com> wrote:
>> We change the restoration priority of both the GICv3 and ITS. The
>> GICv3 must be restored before the ITS and the ITS needs to be restored
>> before PCIe devices since it translates their MSI transactions.
> 
>> We typically observe the virtio-pci-net device sending MSI transactions
>> very early (even before the first vcpu run) which looks weird. It
>> appears that not servicing those transactions cause the virtio-pci-net
>> to stall.
> 
> This does seem rather weird and worth closer investigation.
> A stopped VM ought IMHO to be completely stopped, not still
> doing things...
Yes I will take time to investigate what does happen.

> 
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>
>> ---
>>
>> v1 -> v2:
>> - handle case where migrate_add_blocker fails
>> - add comments along with ITS and GICv3 migration priorities
>> ---
>>  hw/intc/arm_gicv3_common.c     |  1 +
>>  hw/intc/arm_gicv3_its_common.c |  3 ++-
>>  hw/intc/arm_gicv3_its_kvm.c    | 23 +++++++++++------------
>>  include/migration/vmstate.h    |  2 ++
>>  4 files changed, 16 insertions(+), 13 deletions(-)
>>
>> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
>> index c6493d6..4228b7c 100644
>> --- a/hw/intc/arm_gicv3_common.c
>> +++ b/hw/intc/arm_gicv3_common.c
>> @@ -145,6 +145,7 @@ static const VMStateDescription vmstate_gicv3 = {
>>      .minimum_version_id = 1,
>>      .pre_save = gicv3_pre_save,
>>      .post_load = gicv3_post_load,
>> +    .priority = MIG_PRI_GICV3,
>>      .fields = (VMStateField[]) {
>>          VMSTATE_UINT32(gicd_ctlr, GICv3State),
>>          VMSTATE_UINT32_ARRAY(gicd_statusr, GICv3State, 2),
>> diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
>> index 75b9f04..854709f 100644
>> --- a/hw/intc/arm_gicv3_its_common.c
>> +++ b/hw/intc/arm_gicv3_its_common.c
>> @@ -48,7 +48,8 @@ static const VMStateDescription vmstate_its = {
>>      .name = "arm_gicv3_its",
>>      .pre_save = gicv3_its_pre_save,
>>      .post_load = gicv3_its_post_load,
>> -    .unmigratable = true,
>> +    .unmigratable = false,
> 
> unmigratable = false is the default, so we can just delete the line.
OK thanks
> 
>> +    .priority = MIG_PRI_GICV3_ITS,
>>      .fields = (VMStateField[]) {
>>          VMSTATE_UINT32(ctlr, GICv3ITSState),
>>          VMSTATE_UINT64(cbaser, GICv3ITSState),
>> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
>> index 45e57d6..3bd2873 100644
>> --- a/hw/intc/arm_gicv3_its_kvm.c
>> +++ b/hw/intc/arm_gicv3_its_kvm.c
>> @@ -76,18 +76,6 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
>>      GICv3ITSState *s = ARM_GICV3_ITS_COMMON(dev);
>>      Error *local_err = NULL;
>>
>> -    /*
>> -     * Block migration of a KVM GICv3 ITS device: the API for saving and
>> -     * restoring the state in the kernel is not yet available
>> -     */
>> -    error_setg(&s->migration_blocker, "vITS migration is not implemented");
>> -    migrate_add_blocker(s->migration_blocker, &local_err);
>> -    if (local_err) {
>> -        error_propagate(errp, local_err);
>> -        error_free(s->migration_blocker);
>> -        return;
>> -    }
>> -
>>      s->dev_fd = kvm_create_device(kvm_state, KVM_DEV_TYPE_ARM_VGIC_ITS, false);
>>      if (s->dev_fd < 0) {
>>          error_setg_errno(errp, -s->dev_fd, "error creating in-kernel ITS");
>> @@ -104,6 +92,17 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
>>
>>      gicv3_its_init_mmio(s, NULL);
>>
>> +    if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
>> +        GITS_CTLR)) {
>> +        error_setg(&s->migration_blocker, "vITS migration is not implemented");
> 
> I think we should specifically say that it's the host kernel
> that doesn't support ITS migration (ie not QEMU that's missing
> support).
> 
> The GICv3 uses the message
>  "This operating system kernel does not support vGICv3 migration"
> which is slightly odd phrasing but I guess we should follow that.
Sure I will use that message.

Thank you for the review

Best Regards

Eric
> 
>> +        migrate_add_blocker(s->migration_blocker, &local_err);
>> +        if (local_err) {
>> +            error_propagate(errp, local_err);
>> +            error_free(s->migration_blocker);
>> +            return;
>> +        }
>> +    }
>> +
>>      kvm_msi_use_devid = true;
>>      kvm_gsi_direct_mapping = false;
>>      kvm_msi_via_irqfd_allowed = kvm_irqfds_enabled();
>> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
>> index f2dbf84..8dab9c7 100644
>> --- a/include/migration/vmstate.h
>> +++ b/include/migration/vmstate.h
>> @@ -198,6 +198,8 @@ enum VMStateFlags {
>>  typedef enum {
>>      MIG_PRI_DEFAULT = 0,
>>      MIG_PRI_IOMMU,              /* Must happen before PCI devices */
>> +    MIG_PRI_GICV3_ITS,          /* Must happen before PCI devices */
>> +    MIG_PRI_GICV3,              /* Must happen before the ITS */
>>      MIG_PRI_MAX,
>>  } MigrationPriority;
>>
>> --
>> 2.5.5
>>
> 
> thanks
> -- PMM
> 
