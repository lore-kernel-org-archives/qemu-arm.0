Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1836369wrx;
        Thu, 25 Apr 2019 07:07:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyxSbCAd/lm7JWi479SE0GmbPxd3e8XJACqlcU2K+/ePpmY5RR/TBzHzrYGj8WrSky4x9j7
X-Received: by 2002:a1c:cf0b:: with SMTP id f11mr3766267wmg.26.1556201231917;
        Thu, 25 Apr 2019 07:07:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556201231; cv=none;
        d=google.com; s=arc-20160816;
        b=RGHIwlKBEHiL+T8RzGeAlfF1L/7Zbd+UZG9UEQEBs3G2NEonl8Smup8CBxdm36iOfT
         BiL6hn6+QV92P5TuZT+E4dD45KQ0KWrsS0l2AQz3Gbw6ajvdZjc6haP10gKBVpfuB/1x
         8e1gJMo7drEWfQV3Ptl7tm+oxnK79HHP4wb/gI1t8K3sJmQEpf1Ee3+3/INNnJgVVdmt
         NxqG4ssi8iwuk9fpwUEf+HNtN5h8icIGsA7PMeFDRWudu0F1zPFHO+VRs37LptKyyQ5x
         qbyV7AOAjWtOiTBGtKqR0JKIdtep3AUBd0Kgxrice36XXVLFe5dAB0vL+966b+YVtKop
         EpxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=++1XX3+8k55A2Ila7MS9KJPTa3AUixyAgpwW0iiITRU=;
        b=D/cvNQ5m/DJROc4xHjjYFJvk4IZt7PjcM7p9T0SU7RDcq3BghKdt3BjmFl1tLekybo
         Mtd5eyJ4+NHHOlUWJI98/K9SnZWoZfeylDl246sVyF/Xv19jAFG53Eqvli44C6gKB+vz
         ecinIejnHmfECLP5O6ahb+/eELTi7RCTKr2Kz4AyyNJjLgUxRUKAtVxq3i/EVS0xA1rZ
         DE5tbFoZzm9lGtIGmaFU5tDqOYDRkodWOFtY7NEe0f3fRVNrNUeNBRRZ4N4XNUe/nuEE
         RzljarhYXGfu9FB+QMWgN7WmPEMiuxeU/BEAtpj1Vp5uDS9wVsCKUDpsx2xXdb8JW3dV
         O2Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u5si16224055wrp.255.2019.04.25.07.07.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 07:07:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:58082 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJf1q-00082p-RX
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 10:07:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJf1Z-000816-Jz
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 10:06:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJf1X-0006AT-GF
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 10:06:52 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:40209)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJf1W-00068G-KI
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 10:06:50 -0400
Received: by mail-wr1-f67.google.com with SMTP id h4so30523966wre.7
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 07:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=++1XX3+8k55A2Ila7MS9KJPTa3AUixyAgpwW0iiITRU=;
	b=N18f/iSfLo9ki3m6IcD1ksm/lKOqSojRF3mTvdiyQRQfCM8p988pe0j35xP6lnc7az
	yMI2gP0zUxmejLq5/810TnSckwt0GRDR+N7Jpwc3k3lknyc9JsFbJ2UJ/sef7Sv95wb1
	ncH2S7/hv9L4h08QLl4zsoe7K2RjtXcneau5HrPzuD8juLvSVkzQBWGZuvLGPy+5MSf2
	oHrovUZY+NoYnUiXUhjdiv3fqR8igYvgETaFaoiNvnitJkun6fMn/XdLWm8IJuxOTdlP
	5bYx4zRyGLU91dAajxm3AVVDRYcRA8uhgbjAEhFUTNiaHqp/tMe4r3kVcCJzHHv3q1EM
	1MbA==
X-Gm-Message-State: APjAAAVOPb+68reUnnTLN36mNWZ9AXG5MZw+JIJ4TfP7BMNtlh6HpU6W
	cxtxkIuQXstzINpFFP/nA/5LCg==
X-Received: by 2002:a5d:4d49:: with SMTP id a9mr28576571wru.227.1556201208083; 
	Thu, 25 Apr 2019 07:06:48 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122]) by smtp.gmail.com with ESMTPSA id
	62sm28308476wrm.18.2019.04.25.07.06.46
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 07:06:47 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-2-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <7d4fdf95-f3b9-786a-9869-fdfca87d6a59@redhat.com>
Date: Thu, 25 Apr 2019 16:06:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-2-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 01/29]
 hw/pci/pci-stub: Add msi_enabled() and msi_notify() to the pci stubs
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
X-TUID: tLjNqFfrkIjZ

On 4/18/19 8:00 PM, Thomas Huth wrote:
> Some machines have an AHCI adapter, but no PCI. To be able to
> compile hw/ide/ahci.c without CONFIG_PCI, we still need the two
> functions msi_enabled() and msi_notify() for linking.
> This is required for the new Kconfig-like build system, if a user
> wants to compile a QEMU binary with just one machine that has AHCI,
> but no PCI, like the ARM "cubieboard" for example.
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/pci/pci-stub.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/hw/pci/pci-stub.c b/hw/pci/pci-stub.c
> index b941a0e842..c04a5df651 100644
> --- a/hw/pci/pci-stub.c
> +++ b/hw/pci/pci-stub.c
> @@ -53,3 +53,14 @@ uint16_t pci_requester_id(PCIDevice *dev)
>      g_assert(false);
>      return 0;
>  }
> +
> +/* Required by ahci.c */
> +bool msi_enabled(const PCIDevice *dev)
> +{
> +    return false;
> +}
> +
> +void msi_notify(PCIDevice *dev, unsigned int vector)
> +{
> +    g_assert_not_reached();
> +}
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
