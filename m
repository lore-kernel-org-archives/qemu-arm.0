Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2280078wrx;
        Thu, 25 Apr 2019 14:41:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwyg1zjPg+buefkct/nogjswS77ZJBSA31ispSzax5t0EeIaT8qgJmrlA9y4WsncsBdtQem
X-Received: by 2002:a1c:44d7:: with SMTP id r206mr4905726wma.129.1556228492202;
        Thu, 25 Apr 2019 14:41:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556228492; cv=none;
        d=google.com; s=arc-20160816;
        b=LDRIHknk8wELyyovSLRFvTCxkZKzvbYblFu2jmYyUBJH/GuKjDcETik0WE9COMcmVg
         c2AnkRHyJIk67SCPL0QIdxg9rELv/+HZ3kJHDLQuea6gCPE0K68cjPWjKY9VPD3fYpYp
         2ypiL26WP1dV2OPty/mWIDUleaHBa76ZqDJbpU0Nxk3jS1sIDn5bssUJByXFDyICJvqE
         fA2G+q3Ka9N+tnwX6FwOB+PQ5+vNHemLF+oV78ZZOQpv2FG+J2081Z6CCyW/3eWaTK1t
         KIyKxejvL4m2WLyuugPxwPWjvT39WhUvNEFJsnsSZbU57Vd+OUkMOuj4xWXQADEzob9e
         b/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=tTfceA5UaoyjTV9PTdaEm84vFPbIbm3ou+o6zkMHdoM=;
        b=obyq8eJhTSiMcHkoqIbAR5AFJIRbKerCvNMJ/aO/gJWjVi56DAQ6mM2m6MyiWs8H5A
         o5U2sNfPFGbVslyWdXL24fi4d23uuzTkqCQkCQGKvNCXWL+E+n1XF0JeTIxDg3oLdSDC
         LMNx9uEUoPww8bpGO9tDfpExtvSXizItcvk//tcjbLDq9Ru1Ny77rXAwENL7xjx+XNtV
         QxanlTA90OqBQ2l8CNrgXxVe4NEsKGhq7Zsabm/iLMoSU269a+zG3ffut38AtWdtKbrt
         nvVE9gQfDihTzYgjrnmVb4OO9ho0iyhvkHQb1ygLaRECoRX5DCQFjAkRra3mmJbezd9T
         hUig==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 184si15987131wmb.172.2019.04.25.14.41.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Apr 2019 14:41:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35467 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJm7X-0001B8-8u
	for alex.bennee@linaro.org; Thu, 25 Apr 2019 17:41:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58812)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJm7J-0001Ax-Pj
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 17:41:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hJm7I-0004tp-Oy
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 17:41:17 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:37410)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hJm7I-0004sU-I2
	for qemu-arm@nongnu.org; Thu, 25 Apr 2019 17:41:16 -0400
Received: by mail-wm1-f67.google.com with SMTP id y5so294539wma.2
	for <qemu-arm@nongnu.org>; Thu, 25 Apr 2019 14:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tTfceA5UaoyjTV9PTdaEm84vFPbIbm3ou+o6zkMHdoM=;
	b=qh4O/6ye7yOYWrXnY0TlTXsXoWeg+Y3R6MqssFABCGTwlp7KMfMQHiazajbZBbbV5H
	H1CSuTunFVrk0LiYmiewgqvgIObHttPl5n5smjJT9nN4IhKL2Qn2bncTMMSKo3bxPFq6
	/2yE5LlNy8ITEXaVokoauhlKznSJ5bTS00OntF85STIXUMWYsp0nc4tNb5kjY64Fl+tF
	jBL6MRPTHoBuXtjA2U1Xwy+Nf4vG+YFjnGkRrHc3bMFw522LqD64pAvMObqnB2DHLY9R
	EvIQPON49d3wlnLaSqTwuZ72OUrsQf7q33+DLX8AX8DklpafcodPwJLTXkW5+hgUSeE4
	re8w==
X-Gm-Message-State: APjAAAXBq0Sds+MHhZmp25qSxVXmwVQ4I1DxeNdGv/syeRBVVm1nbhqT
	zxBRiqY7XJubAfJB2CSEZZ/4SA==
X-Received: by 2002:a1c:6587:: with SMTP id z129mr4939651wmb.84.1556228475435; 
	Thu, 25 Apr 2019 14:41:15 -0700 (PDT)
Received: from [192.168.1.25] (abayonne-654-1-209-122.w109-222.abo.wanadoo.fr.
	[109.222.216.122]) by smtp.gmail.com with ESMTPSA id
	c139sm12300783wmd.26.2019.04.25.14.41.13
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Apr 2019 14:41:14 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	pbonzini@redhat.com
References: <20190418180057.3593-1-thuth@redhat.com>
	<20190418180057.3593-11-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <377a2033-504b-a84d-0eb0-765de81af730@redhat.com>
Date: Thu, 25 Apr 2019 23:41:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190418180057.3593-11-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-QEMU-4.1 v5 10/29] hw/arm:
 Express dependencies of stellaris with Kconfig
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
X-TUID: zd/6i0WtNMW2

Hi Thomas,

On 4/18/19 8:00 PM, Thomas Huth wrote:
> This patch is slightly based on earlier work by Ákos Kovács (i.e.
> his "hw/arm/Kconfig: Add ARM Kconfig" patch).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak |  7 +------
>  hw/arm/Kconfig                  | 10 ++++++++++
>  2 files changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index b7ed3c530b..3f82d635e4 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -16,6 +16,7 @@ CONFIG_MUSCA=y
>  CONFIG_CHEETAH=y
>  CONFIG_SX1=y
>  CONFIG_NSERIES=y
> +CONFIG_STELLARIS=y
>  
>  CONFIG_VGA=y
>  CONFIG_NAND=y
> @@ -24,16 +25,10 @@ CONFIG_SERIAL=y
>  CONFIG_MAX7310=y
>  CONFIG_TMP421=y
>  CONFIG_PCA9552=y
> -CONFIG_STELLARIS=y
> -CONFIG_STELLARIS_INPUT=y
> -CONFIG_STELLARIS_ENET=y
> -CONFIG_SSD0303=y
> -CONFIG_SSD0323=y
>  CONFIG_DDC=y
>  CONFIG_SII9022=y
>  CONFIG_ADS7846=y
>  CONFIG_MAX111X=y
> -CONFIG_SSI_SD=y
>  CONFIG_SSI_M25P80=y
>  CONFIG_ALLWINNER_EMAC=y
>  CONFIG_IMX_FEC=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 71126254ff..b91503f5a6 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -91,6 +91,16 @@ config REALVIEW
>  
>  config STELLARIS
>      bool
> +    select ARM_V7M
> +    select I2C
> +    select PL011 # UART
> +    select PL022 # Serial port
> +    select PL061 # GPIO
> +    select SSD0303 # OLED display
> +    select SSD0323 # OLED display
> +    select SSI_SD
> +    select STELLARIS_INPUT
> +    select STELLARIS_ENET # ethernet

This one misses CMSDK_APB_WATCHDOG:

$ qemu-system-aarch64 -M lm3s811evb
qemu-system-aarch64: Unknown device 'luminary-watchdog' for default sysbus
Aborted (core dumped)

(gdb) bt
#1  0x00007fbee955d895 in abort () at /lib64/libc.so.6
#2  0x0000560905068f6a in qdev_create (bus=0x0, name=0x5609053b9e5a
"luminary-watchdog") at /source/qemu/hw/core/qdev.c:131
#3  0x0000560904ec1afc in stellaris_init (ms=0x560906d82c00,
board=0x5609056e79e0 <stellaris_boards>) at
/source/qemu/hw/arm/stellaris.c:1344
#4  0x0000560904ec22ff in lm3s811evb_init (machine=0x560906d82c00) at
/source/qemu/hw/arm/stellaris.c:1468
#5  0x000056090507326a in machine_run_board_init
(machine=0x560906d82c00) at /source/qemu/hw/core/machine.c:1030

It works with the following snippet:
-- >8 --
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
@@ -200,6 +200,7 @@ config STELLARIS
     select SSI_SD
     select STELLARIS_INPUT
     select STELLARIS_ENET # ethernet
+    select CMSDK_APB_WATCHDOG # Luminary
---

>  
>  config STRONGARM
>      bool
> 
