Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2345944wrx;
        Thu, 25 Apr 2019 16:05:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwvS8iYCImOrVYlZlWR0E/OQVFxUc32FgTwjq5OvaFqJY7sQw8ZHO4s8iZBSiuj8j8zziUI
X-Received: by 2002:adf:e892:: with SMTP id d18mr14931066wrm.271.1556233516349;
        Thu, 25 Apr 2019 16:05:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556233516; cv=none;
        d=google.com; s=arc-20160816;
        b=tQWQ3+KMMRZZV9Pc0ktPKi+hboWI5RUYL+Kz7hJPVtIQitqB3+HvUONkD8PxcggMIY
         kuzRzRkf+9WKyIdt+rS7ANFuwonPoT/VTavDSH7GcBQO+APQR5ivj8xj+KOuGcIu56Oa
         Bnc39ubS7uiAyXS7deTN5+z0+0y5xYy8CDj1/IUzobi39vJ0TEUelyIB13Fspc9tQUXK
         HIh2eWL2Rv5IazOZXrfkCAdi7N7g4cNPFNeYbe48njNr6aQtBQ1nvGj0lH5TjwDRRjdz
         z/A8Pgv6DMGIP9vH0Xx3sY8PBt4c7AE6CKnCkQ6V0jiuxwqbxwzkchEGRFUwkSxdd+uZ
         92Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=IU5UJBuhFXGGDvEgWcZM9aYlS0j+byjsNMPbMY2GKOQ=;
        b=wEsxe0XM0evbxlYCv+XUa0sGd5CPLNZbaDiDMmHJnVJG8XYK39UbcuG/I/XV6pzbAS
         sIHQWqCzfNgRZFEZG35XJCCTijQHz4uRM2+eKDctDSyhWq78q2tSO2i2jej4SUk3u4LZ
         92EZAmRGa1QOWq7fQwFQHR69WN6chZ110TQ8TWLNcRdhIsU1JR1nzW2f5+8Z3qKECL7J
         bMxzS5nQrh3FLdPirFHNDgjESTdArZA+XnIfJh5LSNJj08b9nWLk+TZMBGUIvy36rpx2
         mdJM+L55c1YOCc9BAa/bsyBNqfm+ZELwwGAr9+mEtiEPHjRae6oztcrPDe09I3l3NFaN
         G/Bw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si16653430wrl.301.2019.04.25.16.05.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 16:05:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:36308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJnQZ-0001MK-BQ
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 19:05:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJnQK-0000sX-Ji
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 19:05:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJnDJ-0005SG-40
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 18:51:34 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35727)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJnDH-0005P9-0K
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 18:51:32 -0400
Received: by mail-wm1-f68.google.com with SMTP id y197so1533354wmd.0
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 15:51:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=IU5UJBuhFXGGDvEgWcZM9aYlS0j+byjsNMPbMY2GKOQ=;
	b=LnTNNCJv7KEkIELiaQmuT81UPzs4kbVr2hXK3E/ksvFSmZBqFhYB1kEhKXNvatBW2M
	ZL8GiElhDnNql+f8jVSV2+oyP6NBZcqe6thyeNC7NvU0yhO3cgTtAdvmHtY3+uDL0so3
	0KZ8FWyD4IJIaxE6Ip49Lxqw0ol2nA/S++tSmCHEdER4Kr04imIhm9Bp1kM9TCQwjF+g
	qB9YEc7fc7DiSi4u2ijhmhdmAQWoCztdOLAlDMQnijrXtY41NOOm1UXmcjhh23vSaLDi
	IcroI/642nwdPUf4hhFV+qBcZ54/i3SX5mZRRlVBBhJf12omvg5qy0n8ThoGtIua8tsg
	YliQ==
X-Gm-Message-State: APjAAAWSLd16HXSzKJ6m6IVBN07bzJlnmx5jyQt8EI4bfF7ejrqg2E1T
	IL4NIMSHk1kDAuWmJ8hhYHTEFA==
X-Received: by 2002:a1c:c012:: with SMTP id q18mr1469861wmf.140.1556232686276; 
	Thu, 25 Apr 2019 15:51:26 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122])
	by smtp.gmail.com with ESMTPSA id e3sm7503978wro.35.2019.04.25.15.51.21
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 15:51:25 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <2f02bf38-4bb0-9ca4-438a-b753d6ab5f49@redhat.com>
Date: Fri, 26 Apr 2019 00:51:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 00/29] Kconfig
 dependencies for ARM machines
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
Cc: Rob Herring <robh@kernel.org>, Jan Kiszka <jan.kiszka@web.de>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-block@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Philippe Mathieu-Daude <f4bug@amsat.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	Beniamino Galvani <b.galvani@gmail.com>, Andrew Jeffery <andrew@aj.id.au>,
	Cedric Le Goater <clg@kaod.org>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>, Gerd Hoffmann <kraxel@redhat.com>,
	Antony Pavlov <antonynpavlov@gmail.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	John Snow <jsnow@redhat.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0OoiYQPgyTul

Hi Thomas,

On 4/18/19 8:00 PM, Thomas Huth wrote:
> This series reworks the default-configs/arm-softmmu.mak and
> default-configs/aarch64-softmmu.mak files to use the new Kconfig-style
> dependencies instead.
> 
> Some of the patches are slightly based on the work by Ákos Kovács:
> 
>  https://lists.nongnu.org/archive/html/qemu-devel/2013-08/msg03730.html
> 
> The other patches have been created by looking at the sources and finding
> out the dependencies the hard way via trial-and-error (i.e. by enabling
> only one machine at a time and checking whether it can be compiled and
> started).
> 
> v5:
>  - Rebased the series to the current master branch
>  - Added "hw/usb/hcd-ohci: Move PCI-related code into a separate file"
>    patch and got rid of unneeded dependencies to CONFIG_PCI in the
>    ARM machines that do not have a PCI bus
> 
> v4:
>  - Rebased the series to Paolo's latest kconfig tree
> 
> v3:
>  - Addressed review feedback from v2
>  - Included patches to clean up the PCI dependencies of AHCI and SDHCI
>    (so CONFIG_AHCI and CONFIG_SDHCI do not depend on CONFIG_PCI anymore)
>  - Added an additional patch for the new "musca" machines
> 
> v2: Adressed review-feedback from v1
>  - CONFIG_SDHCI and CONFIG_AHCI now select CONFIG_PCI
>  - Added switches for MICROBIT and EMCRAFT_SF2
> 
> Thomas Huth (29):
>   hw/pci/pci-stub: Add msi_enabled() and msi_notify() to the pci stubs
>   hw/ide/ahci: Add a Kconfig switch for the AHDI-ICH9 device
>   hw/usb/hcd-ohci: Move PCI-related code into a separate file
>   hw/arm: Express dependencies of the exynos machines with Kconfig
>   hw/arm: Express dependencies of the highbank machines with Kconfig
>   hw/arm: Express dependencies of integratorcp with Kconfig
>   hw/arm: Express dependencies of the fsl-imx31 machine with Kconfig
>   hw/arm: Express dependencies of musicpal with Kconfig
>   hw/arm: Express dependencies of the OMAP machines with Kconfig
>   hw/arm: Express dependencies of stellaris with Kconfig
>   hw/arm: Express dependencies of realview, versatile and vexpress with
>     Kconfig
>   hw/arm: Express dependencies of the PXA2xx machines with Kconfig
>   hw/arm: Express dependencies of xilinx-zynq with Kconfig
>   hw/arm: Express dependencies of collie with Kconfig
>   hw/arm: Express dependencies of the aspeed boards with Kconfig
>   hw/arm: Express dependencies of the virt machine with Kconfig
>   hw/arm: Express dependencies of netduino / stm32f2xx with Kconfig
>   hw/arm: Express dependencies of allwinner / cubieboard with Kconfig
>   hw/arm: Express dependencies of the MPS2 boards with Kconfig
>   hw/arm: Express dependencies of the raspi machines with Kconfig
>   hw/arm: Express dependencies of canon-a1100 with Kconfig
>   hw/arm: Express dependencies of sabrelite with Kconfig
>   hw/arm: Express dependencies of the MSF2 / EMCRAFT_SF2 machine with
>     Kconfig
>   hw/arm: Express dependencies for remaining IMX boards with Kconfig
>   hw/arm: Express dependencies of the microbit / nrf51 machine with
>     Kconfig
>   hw/arm: Express dependencies of the ZynqMP zcu102 machine with Kconfig
>   hw/arm: Express dependencies of the xlnx-versal-virt machine with
>     Kconfig
>   hw/arm: Express dependencies of the musca machines with Kconfig
>   hw/arm: Remove hard-enablement of the remaining PCI devices

I tested each machines of your series.
I replaced patch #3 "hw/usb/hcd-ohci: Move PCI-related code into a
separate file" by your more recent series "Fix ohci_die() and move PCI
code to separate file",
https://lists.gnu.org/archive/html/qemu-devel/2019-04/msg03344.html

So for all patches except 3/29:
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
(well, I also tested it, but expect you to use the splitted respin)

Regards,

Phil.
