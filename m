Received: by 10.25.77.65 with SMTP id a62csp97875lfb;
        Thu, 26 Jan 2017 23:03:00 -0800 (PST)
X-Received: by 10.55.135.1 with SMTP id j1mr6939648qkd.107.1485500580794;
        Thu, 26 Jan 2017 23:03:00 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f90si2902176qkf.272.2017.01.26.23.03.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jan 2017 23:03:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43076 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cX0Yk-0000TX-4v
	for alex.bennee@linaro.org; Fri, 27 Jan 2017 02:02:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58540)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cX0Yg-0000TF-7m
	for qemu-arm@nongnu.org; Fri, 27 Jan 2017 02:02:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cX0Yf-0006eG-Ep
	for qemu-arm@nongnu.org; Fri, 27 Jan 2017 02:02:54 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:34209)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cX0Yf-0006by-BA; Fri, 27 Jan 2017 02:02:53 -0500
Received: by mail-oi0-x242.google.com with SMTP id w144so20042349oiw.1;
	Thu, 26 Jan 2017 23:02:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pI9Z94Zzhoj2pmxmadODnjxeg6iYJbXxXzhA2bFuTlg=;
	b=K4/p31bNWAyjYANoqRvb2Z8Qe9OmAloSg+dkYAkhU/EPH1F2rt7Z/kfb72K63xAQNN
	XtDMgxWOrHfQi9M5tFASrT8sW+NiABIgjms79FvW5Mv9/54XE/VHxgTk80XMfPYF2syW
	BuUowS2Upjk5xLlFYxRUsR2xfODbWYjj20Veryx2PZeU7AdER6WMv0ixCLaqjzEvnF3f
	ayesKjq8GwnG0J5V2QuqKzn0ZaVgY9THis1EmT28KcPgFXEurJd2bT98kcU5fZPNg7EJ
	fyDXPbUSZac88ZqL087I7azvAUaVdNi1LuvCN4wKWq4qb1wf8veSNPDu7TDToz8FM4f9
	X8MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pI9Z94Zzhoj2pmxmadODnjxeg6iYJbXxXzhA2bFuTlg=;
	b=Io18g4PHYvD2A1/03W5bfE+d8sDM9N14MOe7A/JXo2f1ipabodY+3pkqNXkR4GlJDj
	+fLrRImsKnHjWR+13PgYM9zMIBuV/ZQXMg1Mv84zTq1n8OuM0joAhZJbyDv4TqZ4g6wP
	aUIrWXLrOu0Maxf2KQXwkFLWw1uyXz/o6A5XspTU6DtAZhl6MPNROOj7eOdnKPrWkbW9
	MfbtIAxKKsfp+m2IejH2KTIQcHPyjbkpMQ1YY95bfcuF2taJOARarHMPvbeqheb+cdxm
	84i/UBjj3furBTTP9KoI3V2yKy+VrNrlCTEyxXsVHYkg7KSxnpjjruHCGOX8Zwuosncx
	eUGQ==
X-Gm-Message-State: AIkVDXIyxvZNHEGkCAzn7Z9GyqmGId6MXI0kf/vaK4bGmd6ukVd2QpzlnQfdNGhjy8OzxPuByixDPuH2pBS9XQ==
X-Received: by 10.202.72.2 with SMTP id v2mr3591626oia.56.1485500570754; Thu,
	26 Jan 2017 23:02:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.37.84 with HTTP; Thu, 26 Jan 2017 23:02:50 -0800 (PST)
In-Reply-To: <1485422381-29019-3-git-send-email-eric.auger@redhat.com>
References: <1485422381-29019-1-git-send-email-eric.auger@redhat.com>
	<1485422381-29019-3-git-send-email-eric.auger@redhat.com>
From: Vijay Kilari <vijay.kilari@gmail.com>
Date: Fri, 27 Jan 2017 12:32:50 +0530
Message-ID: <CALicx6uLp5SapC5PiDRB6OdaVWXVNYUCORAQ7EsPJ-KNNF5cTw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [RFC 2/4] hw/intc/arm_gicv3_kvm: Rename
 KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS
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
Cc: Peter Maydell <peter.maydell@linaro.org>, drjones@redhat.com,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, peterx@redhat.com,
	"Kumar, Vijaya" <Vijaya.Kumar@cavium.com>,
	qemu-arm <qemu-arm@nongnu.org>, shannon.zhao@linaro.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KL/smRYf89zP

Hi Eric,

On Thu, Jan 26, 2017 at 2:49 PM, Eric Auger <eric.auger@redhat.com> wrote:
> Rename KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS into KVM_DEV_ARM_VGIC_CPU_SYSREGS
> as exposed in the kernel user API and pulled by update-linux-headers.sh.

I will fix it in my next qemu patch series.
I have updated kernel to use KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS in
latest kernel patch
version v11. I so you can drop this patch.

>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> KVM_DEV_ARM_VGIC_CPU_SYSREGS may be fixed at kernel level instead
> ---
>  hw/intc/arm_gicv3_kvm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_kvm.c b/hw/intc/arm_gicv3_kvm.c
> index 267c2d6..d8ecbc3 100644
> --- a/hw/intc/arm_gicv3_kvm.c
> +++ b/hw/intc/arm_gicv3_kvm.c
> @@ -108,7 +108,7 @@ static inline void kvm_gicr_access(GICv3State *s, int offset, int cpu,
>  static inline void kvm_gicc_access(GICv3State *s, uint64_t reg, int cpu,
>                                     uint64_t *val, bool write)
>  {
> -    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_GRP_CPU_SYSREGS,
> +    kvm_device_access(s->dev_fd, KVM_DEV_ARM_VGIC_CPU_SYSREGS,
>                        KVM_VGIC_ATTR(reg, s->cpu[cpu].gicr_typer),
>                        val, write);
>  }
> --
> 2.5.5
>
