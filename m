Received: by 10.25.0.23 with SMTP id 23csp2591365lfa;
        Thu, 8 Jun 2017 06:52:59 -0700 (PDT)
X-Received: by 10.237.35.34 with SMTP id h31mr43104010qtc.148.1496929979806;
        Thu, 08 Jun 2017 06:52:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496929979; cv=none;
        d=google.com; s=arc-20160816;
        b=PTQa7bHups6ZxDz37e5mgFfWQCL56LXvKFLQ7iR5zZrsEVUbUzyVrqxxnDUQWNr5Ye
         MdYfmut7U59+CPvj+z89M7RQhwZFVsk4FZaJHBJMO+HSti6rER63k6rAjs0uzV82lUiz
         CvcL7TvTOEm4MGEEjgnfuu8hTxRh+ZEIdwOL0oJpZmxb/qLB34HEZDQilH8u+nPsghkt
         0Lo8vsqY5PNFPQ3muw/xggFxw6zHTL3qtjQQZkoOR2elzMlLkCvF0Hb7IZ4+qNtrGqeO
         akEwxAZAaNxjVCWJii8jmOSe4Oe5/hUnX6VYHY6yxGupsCahbqi9vuo5sdLYEn3p4H8T
         R1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-filter:dmarc-filter
         :arc-authentication-results;
        bh=RD8JF72NYzAEbnM1ZGm/fXRXjK3PwcLPL1LmMulpCa0=;
        b=DRku98CR++Fpl2D/encBUfRb5fe13gxdYlj/9FOheBiryZQpHcZBwZQhQPVqx+IlSi
         l0/QnMHQr6ONC8yQ95eX/LPn8F6uSIMk6B1lZ8jdQIGk5KGg+77h7jXYoLsGjbYdV41s
         l6jSEQdywjmEUXIA7ucx6Dwx63jWwiIlwLjUqMJ/2TnGV4iBgP+omPQYIUVo0wMFhA24
         GCKxk1CQwytVjvoYGCc2MmLVQiRfjHB2UgjBFAo7FytyS8I6ZRYredfaFccwAiMd74nR
         1GXmtUbkl0FjXAIfHrMrnbY3eI+B6lF0QrL5JTu6Ql/Wp+1o3oootcbuJ1VUWX/ANluR
         JyQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s12si2611796qkl.270.2017.06.08.06.52.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 08 Jun 2017 06:52:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49751 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dIxrt-0005xB-4p
	for alex.bennee@linaro.org; Thu, 08 Jun 2017 09:52:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIxrj-0005t5-Ao
	for qemu-arm@nongnu.org; Thu, 08 Jun 2017 09:52:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1dIxrg-0003e0-7j
	for qemu-arm@nongnu.org; Thu, 08 Jun 2017 09:52:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48202)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1dIxrf-0003d6-V6; Thu, 08 Jun 2017 09:52:44 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E3EFC7F746;
	Thu,  8 Jun 2017 13:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E3EFC7F746
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com E3EFC7F746
Received: from localhost.localdomain (ovpn-116-222.ams2.redhat.com
	[10.36.116.222])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B3028B2A6;
	Thu,  8 Jun 2017 13:52:36 +0000 (UTC)
To: Shannon Zhao <zhaoshenglong@huawei.com>, eric.auger.pro@gmail.com,
	peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <1492173995-14140-1-git-send-email-eric.auger@redhat.com>
	<1492173995-14140-5-git-send-email-eric.auger@redhat.com>
	<591EC943.2020603@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <86440520-d2ab-200e-a9ae-629731db1577@redhat.com>
Date: Thu, 8 Jun 2017 15:52:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <591EC943.2020603@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 08 Jun 2017 13:52:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v5 4/4] hw/intc/arm_gicv3_its:
 Allow save/restore
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
Cc: drjones@redhat.com, vijay.kilari@gmail.com, quintela@redhat.com,
	dgilbert@redhat.com, Vijaya.Kumar@cavium.com, christoffer.dall@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mi/SCu5hwc6n

Hi Shannon,
On 19/05/2017 12:30, Shannon Zhao wrote:
> 
> 
> On 2017/4/14 20:46, Eric Auger wrote:
>> We change the restoration priority of both the GICv3 and ITS. The
>> GICv3 must be restored before the ITS and the ITS needs to be restored
>> before PCIe devices since it translates their MSI transactions.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Juan Quintela <quintela@redhat.com>
>>
>> ---
>> v2 -> v3:
>> - reword migration blocker message
>> - remove unmigratable setting to false
>>
>> v1 -> v2:
>> - handle case where migrate_add_blocker fails
>> - add comments along with ITS and GICv3 migration priorities
>> ---
>>  hw/intc/arm_gicv3_common.c     |  1 +
>>  hw/intc/arm_gicv3_its_common.c |  2 +-
>>  hw/intc/arm_gicv3_its_kvm.c    | 24 ++++++++++++------------
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
>> index efab8c7..22ce4c4 100644
>> --- a/hw/intc/arm_gicv3_its_common.c
>> +++ b/hw/intc/arm_gicv3_its_common.c
>> @@ -48,7 +48,7 @@ static const VMStateDescription vmstate_its = {
>>      .name = "arm_gicv3_its",
>>      .pre_save = gicv3_its_pre_save,
>>      .post_load = gicv3_its_post_load,
>> -    .unmigratable = true,
>> +    .priority = MIG_PRI_GICV3_ITS,
>>      .fields = (VMStateField[]) {
>>          VMSTATE_UINT32(ctlr, GICv3ITSState),
>>          VMSTATE_UINT32(iidr, GICv3ITSState),
>> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
>> index 7c5502c..8401d2f 100644
>> --- a/hw/intc/arm_gicv3_its_kvm.c
>> +++ b/hw/intc/arm_gicv3_its_kvm.c
>> @@ -77,18 +77,6 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
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
>> @@ -105,6 +93,18 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
>>  
>>      gicv3_its_init_mmio(s, NULL);
>>  
>> +    if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
>> +        GITS_CTLR)) {
>> +        error_setg(&s->migration_blocker, "This operating system kernel "
>> +                   "does not support vGICv3 migration");
> s/vGICv3/vITS
Done

Thanks for reporting this!

Eric
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
>>
> 
> Thanks,
> 
