Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1957657wrx;
        Thu, 25 Apr 2019 08:58:16 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw0XRL76bdziSL9d9R4wnKptc1PTMCChGAMi5504eNXd6oIFAYyFY5NJQ4V2pB+XMO9+vdQ
X-Received: by 2002:adf:eb4c:: with SMTP id u12mr21226587wrn.235.1556207896879;
        Thu, 25 Apr 2019 08:58:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556207896; cv=none;
        d=google.com; s=arc-20160816;
        b=EdAF91HsyLmyV1Ib7XgRCe96FddQMh4R+4IEVtjqM1JidtStZf8znuTedspOCbJvlE
         aWJI86w1hacxOEmVMk5t5e9eH1lqVxw7xTq6Q4VkZ2Xw+TrGmwFXLZ8Fldl/oFRepMCC
         KW1mF3sSJws6g4mYJafEt8Lr/GPX5i8H1h3GgOxO4VdTxQO7hCwPmSXcCJSbT+b534F+
         WVM7QCY1EryPBIBTIWVP5mmb8u4o/RFLYOqo2HqsgFD6Fct/1BSNOvt1qS710ugrK2vM
         W7UKL6Z4u1wSlAHUX/INgU/sRAK1nEpucSjVdTw9Fl9wcbD7yCvuxUHhvA6U694i2rWy
         0lEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=vkQAtDfMoIc/AqOZqt0xBI/A7og4dZgLq1NgZdkCB4Y=;
        b=VmTDmwF+MpnBqD117W1inCdG5fXHGLKxb9UZHcT02A2xDzZ4Asb/++Xq4fUfk9am/l
         dVSDaNCNIDEhmC7J6p2wZn/DxwBUOZpA+0Tx/s7zJqv5FHIwSqfexeuWzSRk526F7VzD
         YQLqcrOaR8GPeMj/1tp+OHIZMiZFilHBMBPeYTuncqvD83l4hYFVqiJaiep22qKPrPfL
         gA/7zvrnIcBDC7L2b0JRuM81aHc2mbXAgZIf6xZ5e40VLhG09IPKvGXeS228pTBdOi8L
         J6Y/3vtHkVp/bK6fZc/ZI6v/olsmBoJh/g7YuXVTpaSSi2ZLoI9SxguFhWrbvpMeixXB
         HTnA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r6si15192888wrl.270.2019.04.25.08.58.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 08:58:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:59619 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJglL-0004iM-UV
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 11:58:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42041)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJgl6-0004hg-1j
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 11:58:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJgl5-0001DT-2f
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 11:58:00 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50926)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJgl4-0001CF-Rz
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 11:57:58 -0400
Received: by mail-wm1-f67.google.com with SMTP id 10so10001282wmk.0
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 08:57:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=vkQAtDfMoIc/AqOZqt0xBI/A7og4dZgLq1NgZdkCB4Y=;
	b=OPHQVA0nXus0pJsI2S2BtWVI+SXPWzft29zXnAcmEfZ/Lw6jZ5NNw02PXuNccUm/dE
	T7/LmWtIclJd/buLEIVIWGWX80tH4MnJe+hUx3x/rriEmIfokMcpbiUYpS7X1YIJfmLZ
	aOrHwiIg/ZHwSuwq2HS5O4KsNYFNidOByBAFd2vpfw1uFbESOKPCB6AHbpHJcAjhEcox
	EJh31ZjQ7h/vX0cax3U1vrgd5j4y6XY9PFsbI6s6GFkqCrJ0jfbJU4fh1vj4V7bJ9zI4
	UAo3F5kikPVrMrGFLYiWRAN/vTEnHZ5070WN9RIPWYdDN43ahtiB549lFyaKW8rG+cxI
	B+cA==
X-Gm-Message-State: APjAAAV5hrFMmXhfdC1st5aPadopaZs0zRU+lvKqwpnLnhFRKr6VbpfX
	lKpD6HaA4s2iIuSOVuwgTb5eXQ==
X-Received: by 2002:a7b:cc96:: with SMTP id p22mr4286172wma.17.1556207877990; 
	Thu, 25 Apr 2019 08:57:57 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122]) by smtp.gmail.com with ESMTPSA id
	m17sm3486401wrq.27.2019.04.25.08.57.55
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 08:57:57 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-19-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4c6269d8-f4ec-04d2-8a17-81e00a2f26a0@redhat.com>
Date: Thu, 25 Apr 2019 17:57:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-19-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 18/29] hw/arm:
 Express dependencies of allwinner / cubieboard with Kconfig
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
X-TUID: VFEY5SbR0OEQ

On 4/18/19 8:00 PM, Thomas Huth wrote:
> Add dependencies for the Cubitech Cubieboard.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  default-configs/arm-softmmu.mak | 6 +-----
>  hw/arm/Kconfig                  | 9 +++++++++
>  2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index c86a9f5427..a0b9016e3a 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -7,6 +7,7 @@ CONFIG_ARM_V7M=y
>  # CONFIG_TEST_DEVICES=n
>  
>  CONFIG_ARM_VIRT=y
> +CONFIG_CUBIEBOARD=y
>  CONFIG_EXYNOS4=y
>  CONFIG_HIGHBANK=y
>  CONFIG_INTEGRATOR=y
> @@ -32,7 +33,6 @@ CONFIG_NETDUINO2=y
>  
>  CONFIG_VGA=y
>  CONFIG_SSI_M25P80=y
> -CONFIG_ALLWINNER_EMAC=y
>  CONFIG_IMX_FEC=y
>  
>  CONFIG_FRAMEBUFFER=y
> @@ -60,10 +60,6 @@ CONFIG_IOTKIT_SYSINFO=y
>  CONFIG_ARMSSE_CPUID=y
>  CONFIG_ARMSSE_MHU=y
>  
> -CONFIG_ALLWINNER_A10_PIT=y
> -CONFIG_ALLWINNER_A10_PIC=y
> -CONFIG_ALLWINNER_A10=y
> -
>  CONFIG_FSL_IMX6=y
>  CONFIG_FSL_IMX25=y
>  CONFIG_FSL_IMX7=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 49306d6419..2ef5696900 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -25,6 +25,10 @@ config CHEETAH
>      select OMAP
>      select TSC210X
>  
> +config CUBIEBOARD
> +    bool
> +    select ALLWINNER_A10
> +
>  config DIGIC
>      bool
>      select PTIMER
> @@ -245,6 +249,11 @@ config ARM_V7M
>  
>  config ALLWINNER_A10
>      bool
> +    select AHCI
> +    select ALLWINNER_A10_PIT
> +    select ALLWINNER_A10_PIC
> +    select ALLWINNER_EMAC
> +    select SERIAL
>  
>  config RASPI
>      bool
> 
