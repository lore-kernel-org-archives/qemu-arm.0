Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2080761wrq;
        Thu, 14 Jun 2018 07:07:16 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKICJG39ZWUOCgAh6jMGVr+/B2vojngQ0Fp+kjEEUYS374dvSIP9USg3iyRAEGYfMES/FOJw
X-Received: by 2002:a0c:f806:: with SMTP id r6-v6mr2448189qvn.214.1528985236700;
        Thu, 14 Jun 2018 07:07:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528985236; cv=none;
        d=google.com; s=arc-20160816;
        b=dBNMv0yg4jlsERabwpv24xxJ+OMXgQBICGkBUrGBgZ2mM40Y0hAV1qaH2Q4hetLdRF
         1Yvsoz+Xv9FwjTw7jS/GcQ26XnXbrA7HomeartuM8LtHTfZFYv3Gxn3nyF9JZ2jA9GfR
         IOsdbZwTUu+f/qYNnjet+PpY+Km7SRkOAJgYJsw35xJCY38ayOWZrv3eS+8I/JwQ7hEe
         /AKoUdSj19s4MuF9DiSynN17P13Ada3D4C83li8JwhZZ8IfxYGCsoxFEgFtRnjTc8HLV
         FEq9DBlqJwOwEI3vQ2hDBXX0CgUO7vVBZpjJtciJUh5bVS29hMDPiP6a33uG2KifcESf
         QI+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=lXJTzG4CUJp8mRTn7eGntGE/oeAAtA8SZ36Z+xrIkyA=;
        b=cKT9uE2PvHzsXJuZtboZGiS5jASdVY82zCZqlOyTQVjMM9nNmUZH6/xL5a/zm6WmT/
         +3AXC5O2mFKg2H78aOd+C9EdAQAOKmVrsQrEi3eQduAsySov6ah8mNTOp4MuYjx7jQZE
         zoArTJWo3Ttq5cUYA9kOPE9Lmx/0WtoHut0SYgk/k5HD7+BjpEwx3S8owoSplIRt0UjB
         0vH6JzIvNrAH/vjNKmZVtEpqNtyNJGRbp6qscqrKmUkuqXRjSJTXaWL/tOAqJSNsvl5l
         clM0dh3GWl3vtpkSDzIlJE0Kj7blv6VYRoLPfQOQoLiMSSo2ALzqxjg1cRCkqZAvHNqq
         V2Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p4-v6si2441614qtb.276.2018.06.14.07.07.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jun 2018 07:07:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40883 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTSuC-00042E-4S
	for alex.bennee@linaro.org; Thu, 14 Jun 2018 10:07:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fTStH-0003U3-W0
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 10:06:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fTStC-00027S-89
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 10:06:19 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51234 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1fTStC-00027K-1m; Thu, 14 Jun 2018 10:06:14 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B9F67D858;
	Thu, 14 Jun 2018 14:06:13 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE18A20244E2;
	Thu, 14 Jun 2018 14:06:11 +0000 (UTC)
Date: Thu, 14 Jun 2018 16:06:09 +0200
From: Andrew Jones <drjones@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20180614140609.tc6npczkt2fitgnu@kamzik.brq.redhat.com>
References: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
	<1528879723-24675-4-git-send-email-eric.auger@redhat.com>
	<20180614133215.khbod4vx4w6drh2x@kamzik.brq.redhat.com>
	<38a734ec-e813-03c9-d110-50dd327a60be@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38a734ec-e813-03c9-d110-50dd327a60be@redhat.com>
User-Agent: NeoMutt/20180512
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Thu, 14 Jun 2018 14:06:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Thu, 14 Jun 2018 14:06:13 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/9] hw/intc/arm_gicv3:
 Introduce redist-region-count array property
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
Cc: peter.maydell@linaro.org, ard.biesheuvel@linaro.org, marc.zyngier@arm.com,
	christoffer.dall@arm.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com, lersek@redhat.com,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pCenpJsTPhtZ

On Thu, Jun 14, 2018 at 03:55:56PM +0200, Auger Eric wrote:
> Hi Drew,
> 
> On 06/14/2018 03:32 PM, Andrew Jones wrote:
> > On Wed, Jun 13, 2018 at 10:48:37AM +0200, Eric Auger wrote:
> >> To prepare for multiple redistributor regions, we introduce
> >> an array of uint32_t properties that stores the redistributor
> >> count of each redistributor region.
> >>
> >> Non accelerated VGICv3 only supports a single redistributor region.
> >> The capacity of all redist regions is checked against the number of
> >> vcpus.
> >>
> >> Machvirt is updated to set those properties, ie. a single
> >> redistributor region with count set to the number of vcpus
> >> capped by 123.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>
> >> ---
> >> v2 -> v3:
> >> - add missing return in arm_gic_realize
> >> - in gicv3_init_irqs_and_mmio, compute/check rdist_capacity first
> >> - rdist region 0 size set to MIN(smp_cpus, redist0_capacity)
> >> - add GICV3_REDIST_SIZE
> >> ---
> >>  hw/arm/virt.c                      | 11 ++++++++++-
> >>  hw/intc/arm_gicv3.c                | 12 +++++++++++-
> >>  hw/intc/arm_gicv3_common.c         | 38 +++++++++++++++++++++++++++++++++-----
> >>  hw/intc/arm_gicv3_kvm.c            |  9 +++++++--
> >>  include/hw/intc/arm_gicv3_common.h |  8 ++++++--
> >>  5 files changed, 67 insertions(+), 11 deletions(-)
> >>
> >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> index f0a4fa0..2885d18 100644
> >> --- a/hw/arm/virt.c
> >> +++ b/hw/arm/virt.c
> >> @@ -522,6 +522,15 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
> >>      if (!kvm_irqchip_in_kernel()) {
> >>          qdev_prop_set_bit(gicdev, "has-security-extensions", vms->secure);
> >>      }
> >> +
> >> +    if (type == 3) {
> >> +        uint32_t redist0_capacity =
> >> +                    vms->memmap[VIRT_GIC_REDIST].size / GICV3_REDIST_SIZE;
> >> +        uint32_t redist0_count = MIN(smp_cpus, redist0_capacity);
> >> +
> >> +        qdev_prop_set_uint32(gicdev, "len-redist-region-count", 1);
> > 
> > I don't see where this property is defined or used.
> 
> This is due to the fact we have an array property. nb_redist_regions is
> the storage of this value. len-redist-region-count is the name of the
> field (size of the array) from the user point of view.
> 
> DEFINE_PROP_ARRAY("redist-region-count", GICv3State, nb_redist_regions,
>                       redist_region_count, qdev_prop_uint32, uint32_t),
> 
> see len-db-voltage property in hw/arm/vexpress.c and
> hw/misc/arm_sysctl.c for a similar usage.

Thanks. I see '#define PROP_ARRAY_LEN_PREFIX "len-"' now too. That's just
the kind of magic that makes us all <blank> QEMU. Fill in <blank> as you
wish. I know what I'd fill it in with...

drew
