Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1857281wrx;
        Thu, 25 Apr 2019 07:25:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyQqSr7bYmrj4q5LhN6xCU0gSfPMe7R5zGyR2WHebv9YnYS7EE3Sm12UAaKaHHiOj3SKk4e
X-Received: by 2002:adf:fc49:: with SMTP id e9mr4342248wrs.269.1556202357520;
        Thu, 25 Apr 2019 07:25:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556202357; cv=none;
        d=google.com; s=arc-20160816;
        b=J6ldx+FFo/FPbz3liQ39ePiIqN/BAA4ln8os+gcYhQ8zp0t30DzWPgMJ8aaZg1AcLF
         KER5CQfXKjCaodzYOy4zektHtKk7WqTNmWznMAdHCFxkJc8rtQIhw+WkTl/aJFHhj/0e
         eueXHN3f1UPDH2b6qYLguHasc61rTAQqi8U3AlPpi24SUTryJ0KZbnvbJcs0arrT45TI
         acIXWwdIz1rpLyHGXqpGZN1rp1ePOiKKuT5d2grOWn9/OzWCpZeqvwbFoUz4GmylwktS
         XmOoTQrkM4HKiLGEho5mV4u/U0iwuIYTKrdecIvbTXbBcWO0eCXSt09adB72Kv+LfQc6
         z72A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=tjNSeGqW5ltbIALXlNRkf09d8BwHxi8TlGUDyry9ra8=;
        b=axIjcscQLl6rGMhTHNEoc8VID0Cqx7++RapDYfbFyFRyaWl13Ew05R+itvLJKSUxpT
         tDS8f8ic2oItEtbDiKuDNv2mJhcrSIMuHbZQdZLF43zKfdcSpF4vBbWKLRlIl8356tVz
         svIuQlT8sw2eQNzbHZmhPb4xtk6XKw3155BTwi6pse5Xc4fNqFX/cNfqgJkhprwFoh4i
         0E48nJh6fRM9r9nqpgt8svAWvT6AbczgN4p96ZnFMT9+T6ivQNtiAu4oVfqyn9bysmTJ
         3872lEK2jo6Voh1stVwp3j0D6ZR+8+YoAMoRWgvEfdIYyYCxLMYgOGuYx0l7LMpzrPfI
         QYBw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3si89483wrx.334.2019.04.25.07.25.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 07:25:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:58493 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJfK0-0001m7-Hz
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 10:25:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJfJE-0001Ec-9F
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 10:25:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJfJD-0005LT-84
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 10:25:08 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:40872)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJfJC-0005Ki-UT
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 10:25:07 -0400
Received: by mail-wm1-f65.google.com with SMTP id h11so4089461wmb.5
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 07:25:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tjNSeGqW5ltbIALXlNRkf09d8BwHxi8TlGUDyry9ra8=;
	b=s+k9LViyihw+mQnhtEPS4ZiqkyAIOAOK5T9ezG2oJDWgCGtlAy1Bejl4s7hIf+vLIk
	0KTLhs4Kohz/Ft3f1Jnc4VzjwzaJ5ldi3gcRWhnzX+1Uqahfxq3p6mzUCnNGuKx8RIxi
	IfxuxYjzy0/rI1TreakDNYwguwigyOChi0/HxjYg/141uktp4uJxTOUvUaofASw2DKaF
	EkYrMWPzOPwVDMwFO4ugS529C+vEZhwY/jnPZDjrqASfjfP6ZiQi1ABPsvq+h+aDV1eU
	VHy5ud75SnlDGPTz1yIb63hvdE8EswA3e8p2Aty9c3cFnWt5DYY6/J2ofLrsUEJfjG1O
	fyug==
X-Gm-Message-State: APjAAAVRyRVNlMeLi1ifs+b8s5+nXyWjKHP/7vZCtj6ZCRDXdyElXsBW
	KTPUPLPxiF8Xqj9t+KmdiHCEPA==
X-Received: by 2002:a1c:3507:: with SMTP id c7mr3598956wma.20.1556202305924;
	Thu, 25 Apr 2019 07:25:05 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122]) by smtp.gmail.com with ESMTPSA id
	j190sm28069868wmb.19.2019.04.25.07.25.03
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 07:25:05 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-6-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <acc9802b-5f72-f9f5-32dd-a03d9b6d7e4e@redhat.com>
Date: Thu, 25 Apr 2019 16:25:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-6-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 05/29] hw/arm:
 Express dependencies of the highbank machines with Kconfig
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
X-TUID: Z2R06jokqd8d

On 4/18/19 8:00 PM, Thomas Huth wrote:
> Add Kconfig dependencies for the highbank machine (and the midway
> machine).
> This patch is slightly based on earlier work by Ákos Kovács (i.e.
> his "hw/arm/Kconfig: Add ARM Kconfig" patch).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak |  9 +--------
>  hw/arm/Kconfig                  | 11 +++++++++++
>  2 files changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index 2a11e76cc7..50a4be3cad 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -8,6 +8,7 @@ CONFIG_PCI_DEVICES=y
>  CONFIG_PCI_TESTDEV=y
>  
>  CONFIG_EXYNOS4=y
> +CONFIG_HIGHBANK=y
>  
>  CONFIG_VGA=y
>  CONFIG_NAND=y
> @@ -45,24 +46,17 @@ CONFIG_PLATFORM_BUS=y
>  CONFIG_VIRTIO_MMIO=y
>  
>  CONFIG_ARM11MPCORE=y
> -CONFIG_A15MPCORE=y
>  
>  CONFIG_NETDUINO2=y
>  
> -CONFIG_ARM_TIMER=y
> -CONFIG_PL011=y
> -CONFIG_PL022=y
> -CONFIG_PL031=y
>  CONFIG_PL041=y
>  CONFIG_PL050=y
> -CONFIG_PL061=y
>  CONFIG_PL080=y
>  CONFIG_PL110=y
>  CONFIG_PL181=y
>  CONFIG_PL190=y
>  CONFIG_PL330=y
>  CONFIG_CADENCE=y
> -CONFIG_XGMAC=y
>  CONFIG_PXA2XX=y
>  CONFIG_BITBANG_I2C=y
>  CONFIG_FRAMEBUFFER=y
> @@ -150,7 +144,6 @@ CONFIG_XILINX_AXI=y
>  CONFIG_PCI_EXPRESS_DESIGNWARE=y
>  
>  CONFIG_STRONGARM=y
> -CONFIG_HIGHBANK=y
>  CONFIG_MUSICPAL=y
>  
>  # for realview and versatilepb
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index acd07b2add..0ba377ac18 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -18,6 +18,17 @@ config EXYNOS4
>  
>  config HIGHBANK
>      bool
> +    select A9MPCORE
> +    select A15MPCORE
> +    select AHCI
> +    select ARM_TIMER # sp804
> +    select ARM_V7M
> +    select PL011 # UART
> +    select PL022 # Serial port
> +    select PL031 # RTC
> +    select PL061 # GPIO
> +    select PL310 # cache controller
> +    select XGMAC # ethernet

Similarly to my comment on patch 6 of this series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

>  
>  config INTEGRATOR
>      bool
> 
