Received: by 10.25.44.15 with SMTP id s15csp734816lfs;
        Wed, 26 Jul 2017 05:24:28 -0700 (PDT)
X-Received: by 10.237.48.65 with SMTP id 59mr1052670qte.10.1501071868210;
        Wed, 26 Jul 2017 05:24:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501071868; cv=none;
        d=google.com; s=arc-20160816;
        b=fXeCOWkWhVBwE1zRP1vA2jWkJWk5mEIC4x51rt63hw1N5T7APIkIgljza8a3yebFpz
         GRJLLVvqjMyJBxDH7N/NtXRzXAtVx74BmJ2WZlUHcYRd91gCvhZu0qJiZgHXBgwwWStB
         iXs9daXZ5aM4ejKpGGqEfB0jyIRC+D/e456dI/LAnjiZZfwD1UN4G8m61ph7yYLSEJAT
         w08rKWrdujTrJmm3rPfy81DvO2PTwo5C3opyt1qQVCmgVsoHSV7TxyZw97AIs0nbkP+l
         eHsvaJuU0IQbZcaq07MVVyQgFgjYhp6YYpi8bADH6kGY3krBRNa6GWiLS3WwxlLnSatL
         rnaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=N++3dbAmZRMuaS9KTC/NfvvfYAlG1r/9goBSaW7vOYA=;
        b=Y5qYMrif+Gt+NKcBY7UlgQcRBJPfpygSTjKDpvQzvx/0v+cs7JrgPu/iMEJgCAfJO3
         4AIAyBVyZXnzDSlo+1OrcqEWKdigG46BjZT4827FijFj7GPUrOHcbeRmWTohII3fN/Uf
         Htz1YcYD65kCw3b7rm3HTq7pbdbctjDuxlvnOi0tMr//SJg4gT1E4l35KZPrgEgSNNJL
         3ccQ8iZM5dOvvjdgjYgxGFzs+0J1HxUl4I61qHPQI/MhIT1x3Ol7E5lYiXsqYv+6SFlN
         udrLAbUfiNwTg11A4YV2kz3QejB+JG/W/SO5ONMvchCn2N0oNUHBCFk4POd64fLWtpaE
         vGNw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n206si8615528qkn.297.2017.07.26.05.24.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Jul 2017 05:24:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37958 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1daLMX-0007q4-FP
	for alex.bennee@linaro.org; Wed, 26 Jul 2017 08:24:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47020)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1daLLE-0006xX-Dr
	for qemu-arm@nongnu.org; Wed, 26 Jul 2017 08:23:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1daLLA-00042S-41
	for qemu-arm@nongnu.org; Wed, 26 Jul 2017 08:23:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55366)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1daLL9-000421-QM; Wed, 26 Jul 2017 08:23:00 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC9AE552EA;
	Wed, 26 Jul 2017 12:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BC9AE552EA
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-117-95.ams2.redhat.com
	[10.36.117.95])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 580C877644;
	Wed, 26 Jul 2017 12:22:52 +0000 (UTC)
To: Diana Craciun <diana.craciun@nxp.com>, qemu-devel@nongnu.org
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
	<1495537965-4187-2-git-send-email-diana.craciun@nxp.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <17ae81be-a86e-d0ab-de93-046846e0b7d2@redhat.com>
Date: Wed, 26 Jul 2017 14:22:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1495537965-4187-2-git-send-email-diana.craciun@nxp.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 26 Jul 2017 12:22:58 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 1/2] Increased the size of
 requester_id field from MemTxAttrs
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
Cc: mst@redhat.com, mike.caraman@nxp.com, qemu-arm@nongnu.org,
	marcel@redhat.com, bharat.bhushan@nxp.com,
	christoffer.dall@linaro.org, laurentiu.tudor@nxp.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ffDN0fJCrk7f

Hi Diana,
On 23/05/2017 13:12, Diana Craciun wrote:
> The PCI requester ID field is 16 bits. The requester_id field
> from MemTxAttrs is used for MSIs to specify the device ID for
> the platforms where this device ID is needed (e.g virt machine + GICv3
> ITS). However, if more entities that uses MSIs in the system are used,
> 16 bit is no longer enough to represent the device ID. Increased the size
> of this field to 24 bits in order to accomodate 256 entities.
> Also the name requester_id does no longer reflect the content, so
> the name was changed to stream_id.

I think both deviceid and streamid can be up to 32 bits in theory.

With respect to the renaming, stream_id really is ARM specific and
corresponds to the ID space before the SMMU while you mostly address
device id problematics here (ie. space id input to the interrupt
controller). Maybe a more generic terminology such as originator id
could be used or source id (I think this is Intel terminology though).

Maybe the changes in semantics of the field should be
associated/combined with its new computation found in next patch? see
comments in subsequent patch.

Thanks

Eric

> 
> Signed-off-by: Diana Craciun <diana.craciun@nxp.com>
> ---
>  hw/i386/amd_iommu.c                    | 2 +-
>  hw/i386/intel_iommu.c                  | 2 +-
>  hw/intc/arm_gicv3_its_common.c         | 2 +-
>  hw/intc/arm_gicv3_its_kvm.c            | 2 +-
>  hw/pci/msi.c                           | 2 +-
>  include/exec/memattrs.h                | 4 ++--
>  include/hw/intc/arm_gicv3_its_common.h | 2 +-
>  7 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
> index f86a40a..b61bdd5 100644
> --- a/hw/i386/amd_iommu.c
> +++ b/hw/i386/amd_iommu.c
> @@ -145,7 +145,7 @@ static void amdvi_generate_msi_interrupt(AMDVIState *s)
>  {
>      MSIMessage msg = {};
>      MemTxAttrs attrs = {
> -        .requester_id = pci_requester_id(&s->pci.dev)
> +        .stream_id = pci_requester_id(&s->pci.dev)
>      };
>  
>      if (msi_enabled(&s->pci.dev)) {
> diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> index 02f047c..9cdcc62 100644
> --- a/hw/i386/intel_iommu.c
> +++ b/hw/i386/intel_iommu.c
> @@ -2597,7 +2597,7 @@ static MemTxResult vtd_mem_ir_write(void *opaque, hwaddr addr,
>  
>      if (!attrs.unspecified) {
>          /* We have explicit Source ID */
> -        sid = attrs.requester_id;
> +        sid = attrs.stream_id;
>      }
>  
>      ret = vtd_interrupt_remap_msi(opaque, &from, &to, sid);
> diff --git a/hw/intc/arm_gicv3_its_common.c b/hw/intc/arm_gicv3_its_common.c
> index 9d67c5c..efdb1b3 100644
> --- a/hw/intc/arm_gicv3_its_common.c
> +++ b/hw/intc/arm_gicv3_its_common.c
> @@ -66,7 +66,7 @@ static MemTxResult gicv3_its_trans_write(void *opaque, hwaddr offset,
>      if (offset == 0x0040 && ((size == 2) || (size == 4))) {
>          GICv3ITSState *s = ARM_GICV3_ITS_COMMON(opaque);
>          GICv3ITSCommonClass *c = ARM_GICV3_ITS_COMMON_GET_CLASS(s);
> -        int ret = c->send_msi(s, le64_to_cpu(value), attrs.requester_id);
> +        int ret = c->send_msi(s, le64_to_cpu(value), attrs.stream_id);
>  
>          if (ret <= 0) {
>              qemu_log_mask(LOG_GUEST_ERROR,
> diff --git a/hw/intc/arm_gicv3_its_kvm.c b/hw/intc/arm_gicv3_its_kvm.c
> index bd4f3aa..9006907 100644
> --- a/hw/intc/arm_gicv3_its_kvm.c
> +++ b/hw/intc/arm_gicv3_its_kvm.c
> @@ -29,7 +29,7 @@
>  #define TYPE_KVM_ARM_ITS "arm-its-kvm"
>  #define KVM_ARM_ITS(obj) OBJECT_CHECK(GICv3ITSState, (obj), TYPE_KVM_ARM_ITS)
>  
> -static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint16_t devid)
> +static int kvm_its_send_msi(GICv3ITSState *s, uint32_t value, uint32_t devid)
>  {
>      struct kvm_msi msi;
>  
> diff --git a/hw/pci/msi.c b/hw/pci/msi.c
> index a87b227..7925851 100644
> --- a/hw/pci/msi.c
> +++ b/hw/pci/msi.c
> @@ -336,7 +336,7 @@ void msi_send_message(PCIDevice *dev, MSIMessage msg)
>  {
>      MemTxAttrs attrs = {};
>  
> -    attrs.requester_id = pci_requester_id(dev);
> +    attrs.stream_id = pci_requester_id(dev);
>      address_space_stl_le(&dev->bus_master_as, msg.address, msg.data,
>                           attrs, NULL);
>  }
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index e601061..b13e1b8 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -35,8 +35,8 @@ typedef struct MemTxAttrs {
>      unsigned int secure:1;
>      /* Memory access is usermode (unprivileged) */
>      unsigned int user:1;
> -    /* Requester ID (for MSI for example) */
> -    unsigned int requester_id:16;
> +    /* Stream ID (for MSI for example) */
> +    unsigned int stream_id:24;
>  } MemTxAttrs;
>  
>  /* Bus masters which don't specify any attributes will get this,
> diff --git a/include/hw/intc/arm_gicv3_its_common.h b/include/hw/intc/arm_gicv3_its_common.h
> index 1ba1894..6140fc6 100644
> --- a/include/hw/intc/arm_gicv3_its_common.h
> +++ b/include/hw/intc/arm_gicv3_its_common.h
> @@ -68,7 +68,7 @@ struct GICv3ITSCommonClass {
>      SysBusDeviceClass parent_class;
>      /*< public >*/
>  
> -    int (*send_msi)(GICv3ITSState *s, uint32_t data, uint16_t devid);
> +    int (*send_msi)(GICv3ITSState *s, uint32_t data, uint32_t devid);
>      void (*pre_save)(GICv3ITSState *s);
>      void (*post_load)(GICv3ITSState *s);
>  };
> 
