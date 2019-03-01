Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp462066wrx;
        Fri, 1 Mar 2019 02:30:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqxBn6qB2gXFpX48aJBtWgwCoDMYb37Fbxvvm//csbMkqIN67/FRsNjvry/sm8/8yheOTIwc
X-Received: by 2002:a81:ae28:: with SMTP id m40mr2812189ywh.31.1551436202848;
        Fri, 01 Mar 2019 02:30:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551436202; cv=none;
        d=google.com; s=arc-20160816;
        b=f+m7x2ANKG1o2zFoYAHe8PQ4+SMowcPQmM+Q8Jdj5xX8OnVDq8Ot/gpkwEMYo7oTXD
         wJ5gu1hbeBTXCYDuvHVyCpru/WoYmCwcUAs4q8UHVbp8FzBjFjmdqwo3DKRSGw9QS5jJ
         d2teHV3/nuh+bDu8dV4301t0GcJw2vAE2ycDIu4liMhTYuB3O7AvMnMj64qXpEx7QIy/
         dJOjtEo28FcgMNkkCpLDwJtCzPcyKvXdowL27BaKY23rWImch1eCk3PR5KK96H+Pvi/s
         NHZgvI7P1TN5NpivSNq8ggdFVdQmFLNiIqC+vDwAwMHTcTfsiqGAHJ61WH2DN7vegFqR
         hHkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=HCMAbUCjnv2aTvbItmXEGTeKAmK3u7zvzm8y3c1w3ok=;
        b=y+OwtnoAuIIvx2aPfo5dXMT3t0w4ytlir2Si69nEwW6NOy3UUFG/egCboJLHxb7Wsw
         jK8tYbYEUlLb1CY5DHqUyimPrA/WUC+/I8WOGR2K+o2z/X1eKarYdawagiX/KtDPM8TB
         f/zgYpUpPBs/EfoJfTlco8+qWK0ZnNHRTTJmcRrET/cArdnJanCerDy+vYRx7AheaA9g
         Gy25q+4BP0lSDiUpGRo9dI9VpWemYYl7wDZGOWlS3oR9ybaxdGnvZdBKjNZT0AGMz1pV
         kNhGAcngyFqes5bpUJCqYE95r5N+oU9ayuS8DsnPKuVq/cxXAblizhQXjvRFQE1bj6h/
         R9rA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t141si12773756ywe.21.2019.03.01.02.30.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 02:30:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzfQY-0000Zl-BL
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 05:30:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50015)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzfQP-0000ZB-11
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 05:29:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzfQN-0008Kg-Vh
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 05:29:52 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42052)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzfQN-0008K7-MN; Fri, 01 Mar 2019 05:29:51 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A660A3152E50;
	Fri,  1 Mar 2019 10:29:50 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 163905D704;
	Fri,  1 Mar 2019 10:29:43 +0000 (UTC)
Date: Fri, 1 Mar 2019 11:29:42 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20190301112942.3e024f02@redhat.com>
In-Reply-To: <b27b4a41-6967-9535-2a3f-467a5d54c491@redhat.com>
References: <20190228150324.25973-1-eric.auger@redhat.com>
	<20190228150324.25973-11-eric.auger@redhat.com>
	<20190228172938.1993ed57@redhat.com>
	<b27b4a41-6967-9535-2a3f-467a5d54c491@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 01 Mar 2019 10:29:50 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v10 10/10] hw/arm/virt: Bump the 255GB
 initial RAM limit
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, david@redhat.com,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	dgilbert@redhat.com, qemu-arm@nongnu.org, pbonzini@redhat.com,
	david@gibson.dropbear.id.au, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 63ndoi9Iv2Rr

On Fri, 1 Mar 2019 11:08:17 +0100
Auger Eric <eric.auger@redhat.com> wrote:

> Hi Igor,
> 
> On 2/28/19 5:29 PM, Igor Mammedov wrote:
> > On Thu, 28 Feb 2019 16:03:24 +0100
> > Eric Auger <eric.auger@redhat.com> wrote:
> >   
> >> Now we have the extended memory map (high IO regions beyond the
> >> scalable RAM) and dynamic IPA range support at KVM/ARM level
> >> we can bump the legacy 255GB initial RAM limit. The actual maximum
> >> RAM size now depends on the physical CPU and host kernel, in
> >> accelerated mode. In TCG mode, it depends on the VCPU
> >> AA64MMFR0.PARANGE.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>
> >> ---
> >> v7 -> v8:
> >> - TCG PAMAX check moved in a separate patch
> >>
> >> v6 -> v7
> >> - handle TCG case
> >> - set_memmap modifications moved to previous patches
> >> ---
> >>  hw/arm/virt.c | 21 +--------------------
> >>  1 file changed, 1 insertion(+), 20 deletions(-)
> >>
> >> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> >> index a3da75a5ae..a45f0fcf79 100644
> >> --- a/hw/arm/virt.c
> >> +++ b/hw/arm/virt.c
> >> @@ -95,21 +95,8 @@
> >>  
> >>  #define PLATFORM_BUS_NUM_IRQS 64
> >>  
> >> -/* RAM limit in GB. Since VIRT_MEM starts at the 1GB mark, this means
> >> - * RAM can go up to the 256GB mark, leaving 256GB of the physical
> >> - * address space unallocated and free for future use between 256G and 512G.
> >> - * If we need to provide more RAM to VMs in the future then we need to:
> >> - *  * allocate a second bank of RAM starting at 2TB and working up
> >> - *  * fix the DT and ACPI table generation code in QEMU to correctly
> >> - *    report two split lumps of RAM to the guest
> >> - *  * fix KVM in the host kernel to allow guests with >40 bit address spaces
> >> - * (We don't want to fill all the way up to 512GB with RAM because
> >> - * we might want it for non-RAM purposes later. Conversely it seems
> >> - * reasonable to assume that anybody configuring a VM with a quarter
> >> - * of a terabyte of RAM will be doing it on a host with more than a
> >> - * terabyte of physical address space.)
> >> - */
> >>  #define RAMBASE GiB
> >> +/* Legacy RAM limit in GB (< version 4.0) */
> >>  #define LEGACY_RAMLIMIT_GB 255
> >>  #define LEGACY_RAMLIMIT_BYTES (LEGACY_RAMLIMIT_GB * GiB)  
> > do we need to keep these couple around?
> > 
> > it's used only in
> >  [VIRT_MEM] = { RAMBASE, LEGACY_RAMLIMIT_BYTES },
> > and doesn't have any effect whatsoever.
> > I'd set initial  VIRT_MEM.size to 0 and drop LEGACY_RAMLIMIT_*
> > maybe add comment above entry that size is defined by ram_size  
> 
> in virt_set_memmap I was checking if (high_io_base < 256 GiB) then
> high_io_base = 256GiB. Maybe this 256GiB value comes out of the blue and
> I should also replace it with vms->memmap[VIRT_MEM].base +
> LEGACY_RAMLIMIT_BYTES.
I'd go for it + comment on top of it.

> We maintain some kind of compatibility with the old memmap so I prefer
> to keep this info somewhere.
> 
> I added a comment though:
> /* Actual RAM size depends on initial RAM and device memory options */
> 
> Thanks
> 
> Eric
> 
> 
> >   
> >>  
> >> @@ -1515,12 +1502,6 @@ static void machvirt_init(MachineState *machine)
> >>  
> >>      vms->smp_cpus = smp_cpus;
> >>  
> >> -    if (machine->ram_size > vms->memmap[VIRT_MEM].size) {
> >> -        error_report("mach-virt: cannot model more than %dGB RAM",
> >> -                     LEGACY_RAMLIMIT_GB);
> >> -        exit(1);
> >> -    }
> >> -
> >>      if (vms->virt && kvm_enabled()) {
> >>          error_report("mach-virt: KVM does not support providing "
> >>                       "Virtualization extensions to the guest CPU");  
> >   

