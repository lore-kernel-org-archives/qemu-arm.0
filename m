Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1747641wrt;
        Wed, 21 Nov 2018 03:34:28 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Wk1rQEmVvHA7+/U2hzVri0PTZBoa/nbRVmRRuBFf/YMmYSsrOhOKmqg0qzWWZHwGWVBn9e
X-Received: by 2002:a25:a246:: with SMTP id b64-v6mr5502806ybi.192.1542800068046;
        Wed, 21 Nov 2018 03:34:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542800068; cv=none;
        d=google.com; s=arc-20160816;
        b=XJWdVE50mNkOkU23P4fpJeeUl2PP3DGarhzuNqU7/DaRuOJim1is84wKr8Bil+T2AD
         E4hkaQhcvufD3rhuIm5fX12+iz/2GN2RmT8zC2Ksh5De3BoWxb0BLVfyOvv7K8JUQmpl
         res3s88yVZzvugY2yAAcfBb2t1sy+iwbugHLeJKKQL2cNC8K0TYPDIcFteHoSIvsV/Xw
         lS2h/ky+xuTjDnS4J7Rx7NU0ul4a29vAqbAjak/AYT3aJOrLKCTqQI6rJKkxC64xK8Lt
         jywCzSL8Pq9oysgqHjm3d70DnRKxyRBCL1kS1S5arxnRD9RvmhzRBRRC7gkASMsTOl26
         sDMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=hNiPAm1k2NicLg9B/Uyl+VgjNK8eHbFO3pw7j+Op6Gs=;
        b=Kmo1QvMDK0exPDfd2MRk+vLjj5JHYye+tzz6XzLBu5wiiYtBiCj31fHIU0apyQEZUx
         6HcE9+sedf1wkBZePg8CWTzfgLPOVwXULoa7HESNdbh1psa/5693KvvwwXRPKL35a6zb
         /AY3p5f1CZLTW7iIOgEi/WmLNIBjQFgKirDjEMw49fouWQb3LyU1uUpyTMdfMEgEaFlq
         IvyZVkqMO65+w7SEq4IogSu8rOy7mJSCH3YmnsXdCS+13V7TIMRIaOdH7237jjqXWB9E
         siSrmyBn9UcC3lFKX1c7gmIGC7SwFrAqGkHp51X2nyRmL4cp5D6Y1a2j8xoAS95wYm+e
         3teg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 12-v6si28905673yws.65.2018.11.21.03.34.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 03:34:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38587 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPQm3-0003KF-H6
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 06:34:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54627)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gPQlu-0003K3-GU
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 06:34:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gPQlq-0005xb-Ha
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 06:34:18 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53351)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gPQlq-0005xO-Bi
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 06:34:14 -0500
Received: by mail-wm1-f67.google.com with SMTP id y1so1922740wmi.3
	for <qemu-arm@nongnu.org>; Wed, 21 Nov 2018 03:34:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hNiPAm1k2NicLg9B/Uyl+VgjNK8eHbFO3pw7j+Op6Gs=;
	b=Siq+gjxtKzWxJR2ZtwTXoVaMclBL1N8bf6TpNTNy3Q0H+Y4+vR0S7/i0Re3EQDkKBB
	f35sgsosmFEEMbzcwoymQ+qGxxuhy+2DGjYIOj/xmVz1mCBfAfgMTwhqzWTyH1C0loc+
	mtD10C9lhgls4Q+skNksCJOm3WBJvuR2csUt6WtaAXKEk/symHeTUL+COi6STiKnWqPX
	5xlVGLJz3QwYJdvrCBNzu2SSZjuB8gIbJVCHL5eplO3Ej1PMfCYrpoYkkM4RnKyx5IIC
	feX1k9GhKqR5uHly9wH6SnOWDFlCx/+7yXc9GUKQYnJOEDnPT3hzEvNjQ7IfJyTzjVQA
	OfRQ==
X-Gm-Message-State: AGRZ1gLObedGE21/4v41CTp7Lzu2lpNtFnHyLz5p9GKQLr96BG0yTsXI
	T59WY059yd4aw3mrNE0R+V/JPQ==
X-Received: by 2002:a1c:4046:: with SMTP id n67mr5281202wma.123.1542800053280; 
	Wed, 21 Nov 2018 03:34:13 -0800 (PST)
Received: from [192.168.1.36] (35.red-88-21-102.staticip.rima-tde.net.
	[88.21.102.35]) by smtp.gmail.com with ESMTPSA id
	z15sm13822750wru.42.2018.11.21.03.34.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 21 Nov 2018 03:34:12 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
References: <1542782568-20059-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6f2cdcdf-225b-44b8-d228-ae4ac3bfd299@redhat.com>
Date: Wed, 21 Nov 2018 12:34:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <1542782568-20059-1-git-send-email-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [PATCH v3] MAINTAINERS: Assign some more files in
 the hw/arm/ directory
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
Cc: qemu-devel@nongnu.org, Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 99RSnUiAguu1

On 21/11/18 7:42, Thomas Huth wrote:
> I apparently missed some more files and even a complete machine (the
> "imx25-pdk") in my previous patch... but now we should hopefully have
> a completely coverage for all available ARM boards.
> 
> Fixes: 95a5db3ae5698b49c63144610ad02913e780c828
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>   v3: Dropped "ds1338-test.c", added some more pxa2xx related files instead
> 
>   MAINTAINERS | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1032406..63c88e1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -533,6 +533,17 @@ L: qemu-arm@nongnu.org
>   S: Odd Fixes
>   F: hw/arm/gumstix.c
>   
> +i.MX25 PDK
> +M: Peter Maydell <peter.maydell@linaro.org>
> +R: Jean-Christophe Dubois <jcd@tribudubois.net>
> +L: qemu-arm@nongnu.org
> +S: Odd Fixes
> +F: hw/arm/fsl-imx25.c
> +F: hw/arm/imx25_pdk.c
> +F: hw/misc/imx25_ccm.c
> +F: include/hw/arm/fsl-imx25.h
> +F: include/hw/misc/imx25_ccm.h
> +
>   i.MX31 (kzm)
>   M: Peter Chubb <peter.chubb@nicta.com.au>
>   M: Peter Maydell <peter.maydell@linaro.org>
> @@ -615,6 +626,7 @@ R: Andrew Baumann <Andrew.Baumann@microsoft.com>
>   R: Philippe Mathieu-Daudé <f4bug@amsat.org>
>   L: qemu-arm@nongnu.org
>   S: Odd Fixes
> +F: hw/arm/raspi.c
>   F: hw/arm/raspi_platform.h
>   F: hw/*/bcm283*
>   F: include/hw/arm/raspi*
> @@ -639,8 +651,12 @@ F: hw/arm/spitz.c
>   F: hw/arm/tosa.c
>   F: hw/arm/z2.c
>   F: hw/*/pxa2xx*
> +F: hw/display/tc6393xb.c
> +F: hw/gpio/max7310.c
> +F: hw/gpio/zaurus.c
>   F: hw/misc/mst_fpga.c
>   F: include/hw/arm/pxa.h
> +F: include/hw/arm/sharpsl.h
>   
>   SABRELITE / i.MX6
>   M: Peter Maydell <peter.maydell@linaro.org>
> 
