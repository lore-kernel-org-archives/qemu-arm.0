Received: by 10.25.0.6 with SMTP id 6csp227600lfa;
        Fri, 19 May 2017 03:40:30 -0700 (PDT)
X-Received: by 10.237.55.98 with SMTP id i89mr8065601qtb.162.1495190430829;
        Fri, 19 May 2017 03:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495190430; cv=none;
        d=google.com; s=arc-20160816;
        b=ARQYH7AwB52XXU4pv8+AsL8pMSVK9VYgkiSgQ5qorU8sq6Wn8JglY3zjGNMbhrq09r
         vTeWIiY00ec0rM7hwp0J6S45Ox8vb3RuAAHui1ER4OTUC2y+i7+UQcqizD7igmuIcHBe
         uF2wBe4rS3L30u3C8Fc9jOuWfBsjoXfOZHNxAbDaoSukmtpPu5Thi8jXRS5wCeCt9ZRd
         LwjNo8QDu02FWZVyJfCTVaUlBmeO61T5zoh4z6e08LkDpKQf9BlXj3sI8RC4B49ylaAq
         dSWtDehTkDKP30i/fTGotQ98c8WOkcsWhAWow5/BtvJBi3oh4/S7atLV/D7Wk9NjmGYp
         9Cjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=bhDQuWT8wYSsU6jowJ5o6rhbhksjdCR/id1b8LHVwJY=;
        b=Ggu7Wh6vjNp7Yo2KDTlHtHDs7Tiqk4szdGhA1qJjnXoQ7m9MstHB8XfESx4njxI8i1
         sgVcnTAHUTs1CDAQMYX9opUPPWMeIkUD8AppYUVgl4Nb0Bd5XY3zWqLZpBUX3e2CYtWG
         rz2SmxY4iXEBLWtcTwLY2KL4zON3ANPJ63sPRgUuBJRAF6X4Jz3Bvwz7nFe11DUgrW6j
         3n34hfof1N+8FO3GRDqhubFwng2MAIlq9VVa8k2msZn+N97JARmBkTFDg7ybpe1p6V83
         IT00PGN5e0EHVOtSWfozyiWN1M1lpDbf0qB1WrFwSdfLGe1ykept5jTUtPr9+PzkoMPl
         TJ1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d46si8261966qtc.150.2017.05.19.03.40.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 May 2017 03:40:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:57718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dBfKg-0007K6-7A
	for alex.bennee@linaro.org; Fri, 19 May 2017 06:40:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34962)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1dBfI1-00055d-UO
	for qemu-arm@nongnu.org; Fri, 19 May 2017 06:37:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1dBfHy-0000uU-N9
	for qemu-arm@nongnu.org; Fri, 19 May 2017 06:37:45 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:3997)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1dBfHx-0000lF-Rt; Fri, 19 May 2017 06:37:42 -0400
Received: from 172.30.72.57 (EHLO DGGEML401-HUB.china.huawei.com)
	([172.30.72.57])
	by dggrg01-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id AOW40094; Fri, 19 May 2017 18:34:11 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEML401-HUB.china.huawei.com
	(10.3.17.32) with Microsoft SMTP Server id 14.3.301.0; Fri, 19 May 2017
	18:34:06 +0800
Message-ID: <591EC943.2020603@huawei.com>
Date: Fri, 19 May 2017 18:30:27 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Eric Auger <eric.auger@redhat.com>, <eric.auger.pro@gmail.com>,
	<peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <1492173995-14140-1-git-send-email-eric.auger@redhat.com>
	<1492173995-14140-5-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1492173995-14140-5-git-send-email-eric.auger@redhat.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020205.591ECA25.0083, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: a3aea6cdb9e45c4eb68d02c041e0545d
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.187
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
X-TUID: PwKrQedkv0LB



On 2017/4/14 20:46, Eric Auger wrote:
> We change the restoration priority of both the GICv3 and ITS. The
> GICv3 must be restored before the ITS and the ITS needs to be restored
> before PCIe devices since it translates their MSI transactions.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> ---
> v2 -> v3:
> - reword migration blocker message
> - remove unmigratable setting to false
> 
> v1 -> v2:
> - handle case where migrate_add_blocker fails
> - add comments along with ITS and GICv3 migration priorities
> ---
>  hw/intc/arm_gicv3_common.c     |  1 +
>  hw/intc/arm_gicv3_its_common.c |  2 +-
>  hw/intc/arm_gicv3_its_kvm.c    | 24 ++++++++++++------------
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
> index efab8c7..22ce4c4 100644
> --- a/hw/intc/arm_gicv3_its_common.c
> +++ b/hw/intc/arm_gicv3_its_common.c
> @@ -48,7 +48,7 @@ static const VMStateDescription vmstate_its = {
>      .name = "arm_gicv3_its",
>      .pre_save = gicv3_its_pre_save,
>      .post_load = gicv3_its_post_load,
> -    .unmigratable = true,
> +    .priority = MIG_PRI_GICV3_ITS,
>      .fields = (VMStateField[]) {
>          VMSTATE_UINT32(ctlr, GICv3ITSState),
>          VMSTATE_UINT32(iidr, GICv3ITSState),
> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> index 7c5502c..8401d2f 100644
> --- a/hw/intc/arm_gicv3_its_kvm.c
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -77,18 +77,6 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
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
> @@ -105,6 +93,18 @@ static void kvm_arm_its_realize(DeviceState *dev, Error **errp)
>  
>      gicv3_its_init_mmio(s, NULL);
>  
> +    if (!kvm_device_check_attr(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_ITS_REGS,
> +        GITS_CTLR)) {
> +        error_setg(&s->migration_blocker, "This operating system kernel "
> +                   "does not support vGICv3 migration");
s/vGICv3/vITS
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
> 

Thanks,
-- 
Shannon

