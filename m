Received: by 2002:a5d:610e:0:0:0:0:0 with SMTP id v14csp3903wrt;
        Sun, 10 Mar 2019 14:36:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxurc40SeES5lFhZ4WoKROHbri2SkUwuTWXu1YZujDchzSJqPrBgOpwKRMzW0id1Yqsg1as
X-Received: by 2002:a81:8906:: with SMTP id z6mr22755507ywf.328.1552253803531;
        Sun, 10 Mar 2019 14:36:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552253803; cv=none;
        d=google.com; s=arc-20160816;
        b=sLQ+RMsWbE3VnW0nVBW5ExJR7ndl1VI8kPfSWBc90Q5CwbmYdX0+3rMqHkzU81Mjgt
         hfebHYvWezKpOe1T3hRcuGpfTyqMcieQM0wcrS9I9r9Ubia/X4K3ztN5Gm4y1DYLmfUY
         AO8Zhjes2igVqvlKYnDrAiKqKNN2TzX02dVkRsCFclcUAJs+hK2plDE2n/PGN9EDoZHY
         NNTdASQxLdpCQSGBCZZFkfJBJLMOKYNYZ4c9h0F477e+md4iyuH/180iGT1uOy+WG4aF
         dxd4nf8CEI57oGu5TP1/bgvzSCXdCvl7h8NA9F0gOPoF8behkn9CCx4aGKb9VFq13egw
         /+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=46rt+D20fev5aJUESJrlfAS+65MLAZWaB0P1WVWoD6s=;
        b=oevapQG7KcceayMLyoox9AMI6kHiCnxrcfpGbpbgMi8SlBleQaJrfkLhlpPW0uUxMM
         AmXqXj5iEe8NWa0N7p1ytoToyJopu3vsS9hc3EVxe0wHCM4vjOwRnVTde57exKahSl+E
         Z74dmpV9J6l27HOFuaZQUFGPKVlEjKKMN/M/z0WRa48lQKy3G+WP7ndphZpDPWVTrMxl
         k64QdYQDRTLXWxm283rslrjGLZEYSKCrdVp0C2vfdq6hxCkJr/vDtGJNol1K2XTQFDUm
         B5FoM6894z8MLWOq6NOPMTfM/V7UXJNukM65lIVyPLR/yt/NOlPD+vLzzg+grRB71M4P
         rqqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s24si2112564ybe.434.2019.03.10.14.36.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Mar 2019 14:36:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51458 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h367e-0007lZ-Tq
	for alex.bennee@linaro.org; Sun, 10 Mar 2019 17:36:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50093)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h367L-0007h8-CU
	for qemu-arm@nongnu.org; Sun, 10 Mar 2019 17:36:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1h364X-00065e-RD
	for qemu-arm@nongnu.org; Sun, 10 Mar 2019 17:33:30 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38257)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1h364X-000651-JT
	for qemu-arm@nongnu.org; Sun, 10 Mar 2019 17:33:29 -0400
Received: by mail-wr1-f66.google.com with SMTP id g12so2958002wrm.5
	for <qemu-arm@nongnu.org>; Sun, 10 Mar 2019 14:33:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=46rt+D20fev5aJUESJrlfAS+65MLAZWaB0P1WVWoD6s=;
	b=cxJyLljb7c7DIIY0G6rsVbTt2eIQtskCmQwJex0QJEh7XQWgZkv5e+lwJTDgAr3g1E
	XmZXXCqslcR4SYgYCmqpgB4kaK9tm72DvECiAwSs7XIpMDkNyay18VKaIuO40sqz9a2b
	jLOdoRXmY7xdzS0Wd4+XJoZKwQjz9l7R+4TnKA/X2X+Di6stYfHMUNh0U7YdHrX5Ozgm
	hWYT9N4tD5WClxxDhdY3qDCyBuVpbIZjyAcCGnY7baY0fnpdK+iSsrh9hZ1GLt5aOj4t
	p7+NNtRXVp8Mvo8D17ZmoSWtHQ46NFsiGZu7tR27CZINYNyNMOIB8XyfzFa0wnHZotBK
	rMPw==
X-Gm-Message-State: APjAAAUdF9NOCGoxN4b8O68DTD1nvaoaDXTs1vbzCeegngx9ZqwQ3qc0
	I/Ybfc4g+eeAQTuufwIxRrQkYw==
X-Received: by 2002:adf:ff81:: with SMTP id j1mr18338628wrr.261.1552253608551; 
	Sun, 10 Mar 2019 14:33:28 -0700 (PDT)
Received: from [192.168.1.40] (43.red-88-25-181.staticip.rima-tde.net.
	[88.25.181.43]) by smtp.gmail.com with ESMTPSA id
	d21sm15867597wrc.44.2019.03.10.14.33.27
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sun, 10 Mar 2019 14:33:28 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, yang.zhong@intel.com,
	pbonzini@redhat.com, qemu-devel@nongnu.org
References: <1551968334-18982-1-git-send-email-thuth@redhat.com>
	<1551968334-18982-20-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <7e477c03-59d0-f6a4-a557-a8f5740d259a@redhat.com>
Date: Sun, 10 Mar 2019 22:33:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <1551968334-18982-20-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [PATCH v4 19/29] hw/arm: Express dependencies of the
 MPS2 boards with Kconfig
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	John Snow <jsnow@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uZlzHt/zO9ZJ

Hi Thomas,

On 3/7/19 3:18 PM, Thomas Huth wrote:
> Add Kconfig dependencies for the mps2-an* machines.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak | 20 +-------------------
>  hw/arm/Kconfig                  | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
> index b6f3d60..b8509fd 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -27,6 +27,7 @@ CONFIG_Z2=y
>  CONFIG_COLLIE=y
>  CONFIG_ASPEED_SOC=y
>  CONFIG_NETDUINO2=y
> +CONFIG_MPS2=y
>  
>  CONFIG_VGA=y
>  CONFIG_SSI_M25P80=y
> @@ -35,28 +36,9 @@ CONFIG_IMX_FEC=y
>  CONFIG_FRAMEBUFFER=y
>  
>  CONFIG_DIGIC=y
> -CONFIG_MPS2=y
>  CONFIG_RASPI=y
>  CONFIG_NRF51_SOC=y
>  
> -CONFIG_CMSDK_APB_TIMER=y
> -CONFIG_CMSDK_APB_DUALTIMER=y
> -CONFIG_CMSDK_APB_UART=y
> -CONFIG_CMSDK_APB_WATCHDOG=y
> -
> -CONFIG_MPS2_FPGAIO=y
> -CONFIG_MPS2_SCC=y
> -
> -CONFIG_TZ_MPC=y
> -CONFIG_TZ_MSC=y
> -CONFIG_TZ_PPC=y
> -CONFIG_ARMSSE=y
> -CONFIG_IOTKIT_SECCTL=y
> -CONFIG_IOTKIT_SYSCTL=y
> -CONFIG_IOTKIT_SYSINFO=y
> -CONFIG_ARMSSE_CPUID=y
> -CONFIG_ARMSSE_MHU=y
> -
>  CONFIG_FSL_IMX6=y
>  CONFIG_FSL_IMX25=y
>  CONFIG_FSL_IMX7=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 743c78b..32c8663 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -308,6 +308,13 @@ config ASPEED_SOC
>  
>  config MPS2
>      bool
> +    select ARMSSE
> +    select LAN9118
> +    select MPS2_FPGAIO
> +    select MPS2_SCC
> +    select PL022    # Serial port
> +    select PL080    # DMA controller
> +    select TZ_MPC

Can we move TZ_MPC to ARMSSE?

>  config FSL_IMX7
>      bool
> @@ -347,6 +354,17 @@ config ARM11MPCORE
>  
>  config ARMSSE
>      bool
> +    select ARMSSE_CPUID
> +    select ARMSSE_MHU
> +    select CMSDK_APB_TIMER
> +    select CMSDK_APB_DUALTIMER
> +    select CMSDK_APB_UART
> +    select CMSDK_APB_WATCHDOG
> +    select IOTKIT_SECCTL
> +    select IOTKIT_SYSCTL
> +    select IOTKIT_SYSINFO
> +    select TZ_MSC
> +    select TZ_PPC
>  
>  config ARMSSE_CPUID
>      bool
> 
