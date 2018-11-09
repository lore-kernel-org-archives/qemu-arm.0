Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp753286wrw;
        Fri, 9 Nov 2018 06:31:48 -0800 (PST)
X-Google-Smtp-Source: AJdET5ckCLxSE4v5BkNH0VuEToyY4n95SRazjJoMna9kp7fQi31f//0hRC3ywVMIz0fEkHyuFaan
X-Received: by 2002:a37:455:: with SMTP id 82mr8502188qke.60.1541773908127;
        Fri, 09 Nov 2018 06:31:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541773908; cv=none;
        d=google.com; s=arc-20160816;
        b=hT836ZZwbZn2RASso+tcQFkdKMcuUgEq2WBoPtPsy2J8enjWwvGzzvlzcTSbyLjqsD
         TB1DcIY1wTdfxGfWO8vaAjYdiAwFcBulWxNPL7Metqyi+yf8AQh2gE3WGafR4LEFbnFJ
         snvDc//FvpCeYeYe7omyDa6aO2baGfJaSNt177F3E87B4ZWgLAn8h3BbKtWclKMeJ+u0
         HWR6WwLcE8tfe6mvJK7Lh02SadW4EAn07L+5P2l85hotgl0TZT3yQivNW4u8AFToXsvh
         7XksObbBtMx3dKsN6G2SQCgLO5RE/Zdt3z7iFrD90cMxJ+6ZogIAxNmCCYZJXWm56Kd5
         /e/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=JUkyU/LSdYcaHIoQvsrZ3Wo9Gl+oypqAwfkGNDs/I/g=;
        b=XT+fxhpypRG4BnABpMszkitDWaOOUooeRJTsXcR7ILECvqhMI5zZ+NHy87VETjn/jQ
         GVg1wYtXORLE0oNG/2pNHUi6No8IJvCNHqnAj6hSDmlrOJC0qqIq+xDQP6qFquInJ+SR
         T5664W5uUi2fV0ypqJARygOYo6Kc0MqWZQx4qIrx3LQixPr9deRrilXqHBGO/DpxDPZI
         gOqTjDdFHZeo9rm9SIgtf6JnS5A6gVKJHvg5Bv/RznOLg9fjoYUyorYzFbBTJq8ubm43
         7Vaw1kSakV8gvLaLf9iVlDD24bMg5KhE4A+V35ebVc+ausblEItz/KMzohbU7LszrWQS
         vkWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m185-v6si5443849qkb.188.2018.11.09.06.31.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Nov 2018 06:31:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34447 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gL7p5-0002iB-Hd
	for alex.bennee@linaro.org; Fri, 09 Nov 2018 09:31:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gL7ox-0002go-Ug
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 09:31:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gL7or-0006yx-Kr
	for qemu-arm@nongnu.org; Fri, 09 Nov 2018 09:31:38 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35834)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gL7or-0006pT-9H; Fri, 09 Nov 2018 09:31:33 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F4F4300171D;
	Fri,  9 Nov 2018 14:31:16 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E5FCF5C220;
	Fri,  9 Nov 2018 14:30:49 +0000 (UTC)
Date: Fri, 9 Nov 2018 15:30:48 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Samuel Ortiz <sameo@linux.intel.com>
Message-ID: <20181109153048.34fa61f2@redhat.com>
In-Reply-To: <20181105014047.26447-10-sameo@linux.intel.com>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-10-sameo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 09 Nov 2018 14:31:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 09/24] hw: i386: Move PCI host definitions
 to pci_host.h
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aKnNwz5FBybj

On Mon,  5 Nov 2018 02:40:32 +0100
Samuel Ortiz <sameo@linux.intel.com> wrote:

> The PCI hole properties are not pc or i386 specific. They belong to the
> PCI host header instead.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> ---
>  include/hw/i386/pc.h      | 5 -----
>  include/hw/pci/pci_host.h | 6 ++++++
>  2 files changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index fed136fcdd..bbbdb33ea3 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -182,11 +182,6 @@ void pc_acpi_init(const char *default_dsdt);
>  
>  void pc_guest_info_init(PCMachineState *pcms);
>  
> -#define PCI_HOST_PROP_PCI_HOLE_START   "pci-hole-start"
> -#define PCI_HOST_PROP_PCI_HOLE_END     "pci-hole-end"
> -#define PCI_HOST_PROP_PCI_HOLE64_START "pci-hole64-start"
> -#define PCI_HOST_PROP_PCI_HOLE64_END   "pci-hole64-end"
> -#define PCI_HOST_PROP_PCI_HOLE64_SIZE  "pci-hole64-size"
>  #define PCI_HOST_BELOW_4G_MEM_SIZE     "below-4g-mem-size"
>  #define PCI_HOST_ABOVE_4G_MEM_SIZE     "above-4g-mem-size"
>  
> diff --git a/include/hw/pci/pci_host.h b/include/hw/pci/pci_host.h
> index ba31595fc7..e343f4d9ca 100644
> --- a/include/hw/pci/pci_host.h
> +++ b/include/hw/pci/pci_host.h
> @@ -38,6 +38,12 @@
>  #define PCI_HOST_BRIDGE_GET_CLASS(obj) \
>       OBJECT_GET_CLASS(PCIHostBridgeClass, (obj), TYPE_PCI_HOST_BRIDGE)
>  
> +#define PCI_HOST_PROP_PCI_HOLE_START   "pci-hole-start"
> +#define PCI_HOST_PROP_PCI_HOLE_END     "pci-hole-end"
> +#define PCI_HOST_PROP_PCI_HOLE64_START "pci-hole64-start"
> +#define PCI_HOST_PROP_PCI_HOLE64_END   "pci-hole64-end"
> +#define PCI_HOST_PROP_PCI_HOLE64_SIZE  "pci-hole64-size"
these are pc/q53 machine specific properties and do not belong here


> +
>  struct PCIHostState {
>      SysBusDevice busdev;
>  

