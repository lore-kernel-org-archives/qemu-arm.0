Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp337049wrx;
        Sat, 20 Apr 2019 03:31:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzt0MnwLTMCLl+u8NpCiKMUj9haaH1fq8uJ7BnO+eiBR+qHg4pSQdL3k59SW5FhlMz4quUI
X-Received: by 2002:a1c:4843:: with SMTP id v64mr5789716wma.141.1555756306421;
        Sat, 20 Apr 2019 03:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555756306; cv=none;
        d=google.com; s=arc-20160816;
        b=xxJNWLZQno5r+hl8iCplcRBw8K/nirGBjRCcCX1x6W05k8xcnBcb8G1cd1cuDrzPNZ
         ShC6beXNyt9e2ZUqzBCOjBjX2pPBQDeEAQI04Pj4O+xIt5+KMgPIQK01AylSPaq3OsBh
         gcjhhg8z6XLAky+zEpihEncJfXjQL43RvbrP9RRBGB2z1emCGtNjBCxkzuhmyVTsPjB8
         x+OWMF3OQeQjLX71i9VpgDI5DVzmkISWBNfUnVDUslsUR/OL1URBIVZqsiW7+/GYSbX9
         V866EwZidZp+Qe/zFpehyvu+NZ0RuCquk17KdByShXlGqj+QR8ofrtQILQO4PAPOjdpn
         6ZwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=UbMcmqbOd9VRLv70hQuWKZuCvQLNHN/aTnQnKReWt1E=;
        b=cv1X0UulVaKNcbmkKti6BL40dtbo7QPCXY6HQYDN0grQotVKDXrSwpzxjPlJne8H/5
         NrIj51zxnXj9KBcRdD4oMe7AMdSyz7VEYe3rUGt0FQogoU2UwS5SvQQZ9FT+nx1ReNsC
         rAEji3FUQjy9eyEVqKXG4mK8oEVDcj19SMKElBMZwg3tr32+LRCi6DF+Y8q8BCCgMNzM
         K2Ml3jZuOn76faf6hquL3o+InpChANlvkz5qDtr2ffmJbwTiWXqPF51+TXwyaPTAWPsq
         /ib+0jsqvq9Q+KJHI0gKpEYtLaGPnthPLUBeiC9ClP9lzG+jVXCM2wjcaDM50E4oe40m
         IXLg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j14si5384106wmj.156.2019.04.20.03.31.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 20 Apr 2019 03:31:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39693 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHnHd-0001Sq-H8
	for alex.bennee@linaro.org; Sat, 20 Apr 2019 06:31:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hHnHK-0001QH-Ug
	for qemu-arm@nongnu.org; Sat, 20 Apr 2019 06:31:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hHnHJ-0008Ti-U3
	for qemu-arm@nongnu.org; Sat, 20 Apr 2019 06:31:26 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53795)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hHnHJ-0008RD-Ns
	for qemu-arm@nongnu.org; Sat, 20 Apr 2019 06:31:25 -0400
Received: by mail-wm1-f67.google.com with SMTP id q16so8737842wmj.3
	for <qemu-arm@nongnu.org>; Sat, 20 Apr 2019 03:31:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UbMcmqbOd9VRLv70hQuWKZuCvQLNHN/aTnQnKReWt1E=;
	b=gTsjiwhN/MQSDlxne1ruG1oPAjSnfTF7JK50D9a4B5iyBHHTpSH9VCaatkDKoL9vKb
	QNAUjsBkKW/Dc9E7iYl13A5cSflP5oaC6dBzimjkL5yxRXCL522z7mUJj0fkbObevrFn
	poxCHSIqFPM3AN+Az2kEkPmN3LKU1awQqLIhsE7xXUfi4JRWkwTW67SHA4wXK1lwa/ny
	oHd7rcXuBg4rIyWZnoDRmt/aLq13zibWmci0ArrAklTW4AChJi5GN1JxO2dQP/tjGrHg
	G3kSQNpF8hFC+nfaCrO56+sNvh84FmwFgWyyZWC4LbmLG3ShWZtdAavfXWPjyI5p6ax3
	m3AA==
X-Gm-Message-State: APjAAAW5MiTckXZt6hU6EUgcVKtBNb7MqAdg9JioO5t8CfeTshtP/U4b
	cK6DtZhIxEjyWpZ3F4T/hn4dAQ==
X-Received: by 2002:a05:600c:249:: with SMTP id
	9mr5566420wmj.149.1555756283318; 
	Sat, 20 Apr 2019 03:31:23 -0700 (PDT)
Received: from [10.100.97.143] ([213.174.99.147])
	by smtp.gmail.com with ESMTPSA id
	v17sm5694712wrv.30.2019.04.20.03.31.21
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 20 Apr 2019 03:31:22 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-3-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <9f1355f2-3508-3f0a-512b-8b97fbda9ae1@redhat.com>
Date: Sat, 20 Apr 2019 12:31:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-3-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 02/29]
 hw/ide/ahci: Add a Kconfig switch for the AHDI-ICH9 device
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
X-TUID: eN1fJDyi/edu

On 4/18/19 8:00 PM, Thomas Huth wrote:
> Some of our machines (like the ARM cubieboard) use CONFIG_AHCI for an AHCI
> sysbus device, but do not use CONFIG_PCI since they do not feature a PCI
> bus. With CONFIG_AHCI but without CONFIG_PCI, currently linking fails:
> 
>     ../hw/ide/ich.o: In function `pci_ich9_ahci_realize':
>     hw/ide/ich.c:124: undefined reference to `pci_allocate_irq'
>     hw/ide/ich.c:126: undefined reference to `pci_register_bar'
>     hw/ide/ich.c:128: undefined reference to `pci_register_bar'
>     hw/ide/ich.c:131: undefined reference to `pci_add_capability'
>     hw/ide/ich.c:147: undefined reference to `msi_init'
>     ../hw/ide/ich.o: In function `pci_ich9_uninit':
>     hw/ide/ich.c:158: undefined reference to `msi_uninit'
>     ../hw/ide/ich.o:(.data.rel+0x50): undefined reference to `vmstate_pci_device'
> 
> We must only compile ich.c if CONFIG_PCI is available, too, so introduce a
> new config switch for this device.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  hw/ide/Kconfig       | 6 +++++-
>  hw/ide/Makefile.objs | 2 +-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ide/Kconfig b/hw/ide/Kconfig
> index ab47b6a7a3..5d9106b1ac 100644
> --- a/hw/ide/Kconfig
> +++ b/hw/ide/Kconfig
> @@ -43,10 +43,14 @@ config MICRODRIVE
>      select IDE_QDEV
>  
>  config AHCI
> +    bool
> +    select IDE_QDEV
> +
> +config AHCI_ICH9
>      bool
>      default y if PCI_DEVICES
>      depends on PCI
> -    select IDE_QDEV
> +    select AHCI
>  
>  config IDE_SII3112
>      bool
> diff --git a/hw/ide/Makefile.objs b/hw/ide/Makefile.objs
> index a142add90e..faf04e0209 100644
> --- a/hw/ide/Makefile.objs
> +++ b/hw/ide/Makefile.objs
> @@ -9,6 +9,6 @@ common-obj-$(CONFIG_IDE_MMIO) += mmio.o
>  common-obj-$(CONFIG_IDE_VIA) += via.o
>  common-obj-$(CONFIG_MICRODRIVE) += microdrive.o
>  common-obj-$(CONFIG_AHCI) += ahci.o
> -common-obj-$(CONFIG_AHCI) += ich.o
> +common-obj-$(CONFIG_AHCI_ICH9) += ich.o
>  common-obj-$(CONFIG_ALLWINNER_A10) += ahci-allwinner.o
>  common-obj-$(CONFIG_IDE_SII3112) += sii3112.o
> 
