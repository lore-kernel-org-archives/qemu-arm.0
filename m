Received: by 10.25.205.13 with SMTP id d13csp10406954lfg;
        Fri, 6 Jan 2017 09:20:03 -0800 (PST)
X-Received: by 10.237.53.162 with SMTP id c31mr2499802qte.55.1483723202943;
        Fri, 06 Jan 2017 09:20:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r190si38098238qkf.15.2017.01.06.09.20.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 06 Jan 2017 09:20:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54040 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cPYBM-0007x2-6U
	for alex.bennee@linaro.org; Fri, 06 Jan 2017 12:20:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPY5V-0002m2-Kl
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 12:13:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cPY5U-0007dq-OV
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 12:13:57 -0500
Received: from mail-ua0-x233.google.com ([2607:f8b0:400c:c08::233]:34591)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cPY5U-0007db-Ks
	for qemu-arm@nongnu.org; Fri, 06 Jan 2017 12:13:56 -0500
Received: by mail-ua0-x233.google.com with SMTP id 34so371783431uac.1
	for <qemu-arm@nongnu.org>; Fri, 06 Jan 2017 09:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fAN1yWWdQlvhVwfDLAJy11r/dRE+xdXpBoMNf5NXexM=;
	b=gEY/WU4jeDN4Z+gmtMWDRqugd1y7LIW1xuobrbhTzbBh5bsh3p3E1g4wZ/OoKMmoU9
	SukNwANZ656VuQxLOSsgxctSKejZS87UMk3BqFF6NWkh45mCr0EOoXcBVSzEik8e6rsQ
	Q8vEWWMDtssyemhQWw4KOgARM0CRMLjH3+73Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fAN1yWWdQlvhVwfDLAJy11r/dRE+xdXpBoMNf5NXexM=;
	b=o4P3QXHxsmx3rrVr1Y6A39sHmznlYIHw6uEfCIXNpSbZq0TrkegQ9nsHLiX+POksuA
	7itLx+XdqRWSmNqKzpdPRHOJn1UYjcnvYmPiQp0H77Xqhb9fkk9mgKB2cJqjwjIpujKV
	1WmFYY7juylKC8PmcxITWgNYgSfEL0ijdTtsVDVB7v2rQBPiYy5BkSr8VxfTCDSBb1B3
	mB7gMrcucfhyrnY/Dfst/bBiSdtecl/96sL490qIWEfgUNZsmXRQQU2zRi0MPAPPN+Zw
	PJJfS2TvsTSxP5rvPQ/hayQ4VUxpvJZcdKbSxFtBKjM1Kvgp1jAY6xiyud3GgJJTI19x
	eCTg==
X-Gm-Message-State: AIkVDXIIbBXlwRlYcNKqgaCnTeqTNRus1C4RXzNmXwTZKdrgUJOxvBiNmlVdPkve3W7CVayAA0pIspeVLUghlAT1
X-Received: by 10.176.2.14 with SMTP id 14mr53331735uas.8.1483722836129; Fri,
	06 Jan 2017 09:13:56 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.176.14 with HTTP; Fri, 6 Jan 2017 09:13:35 -0800 (PST)
In-Reply-To: <20170102200153.28864-17-drjones@redhat.com>
References: <20170102200153.28864-1-drjones@redhat.com>
	<20170102200153.28864-17-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2017 17:13:35 +0000
Message-ID: <CAFEAcA-Wen-TR4NwCgo-xYEka4wu+K9g5vr+ZA3440pkzanWrQ@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::233
Subject: Re: [Qemu-arm] [PATCH v2 16/16] hw/arm/virt-acpi-build: madt: add
 vgic maint irq
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JBOjTggGAhec

On 2 January 2017 at 20:01, Andrew Jones <drjones@redhat.com> wrote:
> When virtualization is enabled and we have a v3 gic, then we add
> the vgic maintenance interrupt to the DT. This patch is the ACPI
> equivalent.
>
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 7c00ee683f44..971ee4885c43 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -607,6 +607,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
>              gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
>          }
> +        if (vms->virt && vms->gic_version == 3) {
> +            gicc->vgic_interrupt = cpu_to_le32(PPI(ARCH_GICV3_MAINT_IRQ));
> +        }
>      }
>
>      if (vms->gic_version == 3) {

I'm going to squash this change into my "target-arm: Enable EL2 feature bit
on A53 and A57" patch, since it's a trivial diff and that's the patch
which has the "put this into the DTB" change in it.

thanks
-- PMM
