Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6660914wrt;
        Mon, 3 Dec 2018 03:19:05 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U1q080BJQ1nHpM3aCZKOOhWBUaZq3B6wuqEtZmHcbRZ5V5V3Y9K9/ngBb4dgY7LsHW6Jr/
X-Received: by 2002:a0c:9418:: with SMTP id h24mr15542760qvh.216.1543835945313;
        Mon, 03 Dec 2018 03:19:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543835945; cv=none;
        d=google.com; s=arc-20160816;
        b=xcYbfttyoTGCbQiWoiFwdLLDfF4U2bKE/Srk4GCOEOF/gH9ZDX97NNht7tNkL1C540
         oS2bRgZXmLitW3ScLDwh7zP9mV7we92vfZCT/0zPlqRiWOS1sxKA+R2wbqiKZfziRmsm
         Zsd60w1/iTasPRy0/EvMh5HyafinlpsmSPxI6cn/Dgg/tYXEaGu7ZFJ6mLG6wn6Za6T0
         MkV14Eiu3+HgxdszzqVoXAESGPC0thjNIMKW8/nawy3m6831TDuefbTwFhpQsdPQ8gGO
         2/Yg0R+He06Df7pl8eU8JyoYpjwPJbYn2R+KkV/HMxoYQnjwD3bwqwdX6NCchgPU7Wpk
         tPsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=YyWYhuSsAV9rAk22xSvLOuGNkVr94iahmAoeKNym1P0=;
        b=JklKpbLCpv9mO5od+rJ3fm0TkWtB4gggBwasdxvCzVBnlbvFKK9fO8SceT34DSu65N
         DmOQKaKBzwCPrjGejmv+3givRvaVZxft3K18qjftNqwG8Jf60xh2oM7YGBnEi4qWAqZ8
         xIKXDRvut46pa6SScVl37W+ExzpsPtddO4qXnRcQeyqOO7i8wZFak3l1Td6nNiKYg1DG
         XB7j1/EADYmRdCp66dn4SYl4G5q2hezsxwy4QcaiVSsZ8pMtaKCzlWFCHuMh2NGeO0tR
         nHdGFeQcPD9ai3bcSTIx3AoBEmZOXGiB25p2gKAZvelMUzSbD4EllKHxoibZPAJqO5o0
         3rQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o14si6876845qtr.110.2018.12.03.03.19.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 03 Dec 2018 03:19:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48002 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gTmFk-0002vj-Qr
	for alex.bennee@linaro.org; Mon, 03 Dec 2018 06:19:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gTmFV-0002vV-Hi
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:18:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gTmFR-00033O-Jj
	for qemu-arm@nongnu.org; Mon, 03 Dec 2018 06:18:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45902)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gTmFR-000336-EU; Mon, 03 Dec 2018 06:18:45 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0F979356D5;
	Mon,  3 Dec 2018 11:18:44 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E5C15C3FD;
	Mon,  3 Dec 2018 11:18:39 +0000 (UTC)
Date: Mon, 3 Dec 2018 12:18:36 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Message-ID: <20181203111836.qqfzcfwazk2g6kvr@kamzik.brq.redhat.com>
References: <1543865209-50994-1-git-send-email-peng.hao2@zte.com.cn>
	<1543865209-50994-7-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1543865209-50994-7-git-send-email-peng.hao2@zte.com.cn>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Mon, 03 Dec 2018 11:18:44 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH V11 6/8] hw/arm/virt: add configure interface
 for pvpanic-mmio
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ILDQrXdevPTf

On Tue, Dec 04, 2018 at 03:26:47AM +0800, Peng Hao wrote:
> Add configure interface for pvpanic-mmio device in virt machine.
> 
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  hw/arm/virt.c         | 23 +++++++++++++++++++++++
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 24 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a4541fa..fdd3f20 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1655,6 +1655,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
>      vms->its = value;
>  }
>  
> +static bool virt_get_pvpanic(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return vms->pvpanic;
> +}
> +
> +static void virt_set_pvpanic(Object *obj, bool value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->pvpanic = value;
> +}
> +
>  static char *virt_get_gic_version(Object *obj, Error **errp)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
> @@ -1884,6 +1898,15 @@ static void virt_3_1_instance_init(Object *obj)
>                                      "Valid values are none and smmuv3",
>                                      NULL);
>  
> +    /* Default disallows pvpanic-mmio instantiation */
> +    vms->pvpanic = false;
> +    object_property_add_bool(obj, "pvpanic", virt_get_pvpanic,
> +                             virt_set_pvpanic, NULL);
> +    object_property_set_description(obj, "pvpanic",
> +                                    "Set on/off to enable/disable "
> +                                    "PVPANIC MMIO device",
> +                                    NULL);
> +
>      vms->memmap = a15memmap;
>      vms->irqmap = a15irqmap;
>  }
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 937c124..7d6d1c0 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -113,6 +113,7 @@ typedef struct {
>      bool highmem;
>      bool highmem_ecam;
>      bool its;
> +    bool pvpanic;

This hunk should be squashed into 4/8 and the respective hunks of 7/8
should be squashed into 4/8 and 5/8.

Thanks,
drew

>      bool virt;
>      int32_t gic_version;
>      VirtIOMMUType iommu;
> -- 
> 1.8.3.1
> 
