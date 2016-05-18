Received: by 10.25.208.137 with SMTP id h131csp2482808lfg;
        Wed, 18 May 2016 08:32:11 -0700 (PDT)
X-Received: by 10.55.106.3 with SMTP id f3mr8726640qkc.177.1463585531078;
        Wed, 18 May 2016 08:32:11 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 61si7176102qgi.106.2016.05.18.08.32.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 18 May 2016 08:32:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45794 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b33SE-00039z-Eg
	for alex.bennee@linaro.org; Wed, 18 May 2016 11:32:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b33S6-00036W-IB
	for qemu-arm@nongnu.org; Wed, 18 May 2016 11:32:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b33Rw-0002Mk-Fq
	for qemu-arm@nongnu.org; Wed, 18 May 2016 11:32:01 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:34826)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1b33Rv-0002MB-8p
	for qemu-arm@nongnu.org; Wed, 18 May 2016 11:31:52 -0400
Received: by mail-vk0-x236.google.com with SMTP id f66so66023002vkh.2
	for <qemu-arm@nongnu.org>; Wed, 18 May 2016 08:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mfBFsowzVBSiJHLOKxa62UaKh8rv2IVKOMO3FYq3HEE=;
	b=VAbOtjxAEvJFmldI1Kj+riwfBo7LJMLg587I2HC07+jaN18Y1fex7jO48FUGg2KeJl
	IW61Ls8AoVS3x3HxIGowCsF6FiCD5iQpP3YOW++6v9SKHa/+X53U2AkLdEqR/vUp8HuF
	WBDKv6Lb4CrNu6pXkdHfzAv2TMoNMTaF381P0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mfBFsowzVBSiJHLOKxa62UaKh8rv2IVKOMO3FYq3HEE=;
	b=LNfhaY5Bd5t5tvn8zM4UdHrtCzMBJ3sp3s+6vYOXYBPMSchL8lGIwjRyEVTxxa8I6g
	bLWgwv5DcicWdryA3SNpAYVy/Xt7FUxiaKsUyKHb3Vm1+Njion1/rTTCYS4Q1qr4S/5F
	gnFNun2XQuFgVex5EksVuokxfENH18VZvg4xOX0UwVaMEblnIkma0SYPsn/7pwPbAoRp
	bhL03WVJwEjjVFxU+bTHTziaYUaHGALKEdFqp9aA0nqSjI1py4PIGsS02uojyJI1LMpR
	OFktM6Lna5Ntq89EqNjhBiPrPi42XT9wb5JWWUPq4MEMLP+gvqfwO4+YJyw5pa1IljT3
	KO1Q==
X-Gm-Message-State: AOPr4FV8oDgE0dM8P2Tdq2PLJ6cE/NdjztKGFkrt5v3OQ9Ux0L//5QPgz9XkZuoYv+npIu1oNT+PLSBGZ2DoOh81
X-Received: by 10.31.88.196 with SMTP id m187mr4443184vkb.37.1463585510516;
	Wed, 18 May 2016 08:31:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Wed, 18 May 2016 08:31:31 -0700 (PDT)
In-Reply-To: <146357953667.8807.5432652213311565530.stgit@bahia.huguette.org>
References: <146357953667.8807.5432652213311565530.stgit@bahia.huguette.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 18 May 2016 16:31:31 +0100
Message-ID: <CAFEAcA84cHCeEMNQfk_hj=Trbzm1_VFo8QERV95hRGqypok40Q@mail.gmail.com>
To: Greg Kurz <gkurz@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-arm] [PATCH v2] sysemu: support up to 1024 vCPUs
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kJMRA3q4gpDg

On 18 May 2016 at 14:52, Greg Kurz <gkurz@linux.vnet.ibm.com> wrote:
> Some PowerPC systems can already provide more than 255 hardware threads.
> Igor also posted a patch recently, to increase the the maxcpus limit to
> 288 for x86 targets.
>
> This patch bumps the limit to 1024:
> - 1024 is already the limit for PowerPC KVM in several distros
> - it has no visible overhead in top
> - the limit itself has no effect on hot paths
>
> We only do that for pseries at the moment and keep a 255 limit for the
> ARM Virtual Machine.
>
> Signed-off-by: Greg Kurz <gkurz@linux.vnet.ibm.com>
> ---
> v2: - updated changelog
>     - keep 255 limit in hw/arm/virt.c
> ---
>  hw/arm/virt.c           |    2 +-
>  include/sysemu/sysemu.h |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 56d35c7716e7..438e09c7a57d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1358,7 +1358,7 @@ static void virt_machine_class_init(ObjectClass *oc, void *data)
>       * it later in machvirt_init, where we have more information about the
>       * configuration of the particular instance.
>       */
> -    mc->max_cpus = MAX_CPUMASK_BITS;
> +    mc->max_cpus = 255;

This change makes the code disagree with the comment immediately
above it. As the comment says, we set max_cpus to the maximum
QEMU supports, and then dynamically check it later when we know
whether we have a GICv2 or GICv3 (which is what puts the limit
on number of CPUs for this board). So I think the change is
not needed.

>      mc->has_dynamic_sysbus = true;
>      mc->block_default_type = IF_VIRTIO;
>      mc->no_cdrom = 1;
> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
> index 38fb3cad35e1..89d742caa477 100644
> --- a/include/sysemu/sysemu.h
> +++ b/include/sysemu/sysemu.h
> @@ -185,7 +185,7 @@ extern int mem_prealloc;
>   *
>   * Note that cpu->get_arch_id() may be larger than MAX_CPUMASK_BITS.
>   */
> -#define MAX_CPUMASK_BITS 255
> +#define MAX_CPUMASK_BITS 1024
>
>  #define MAX_OPTION_ROMS 16
>  typedef struct QEMUOptionRom {

thanks
-- PMM
