Received: by 10.28.91.67 with SMTP id p64csp3225103wmb;
        Mon, 19 Mar 2018 17:42:47 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsHZFqHWFaIxgUDnTaIYRAaf2Y+Wg5WW+bPW0bHu0m57scOe25BI2Jcwj7KnHGZpj4AKiBy
X-Received: by 10.200.30.9 with SMTP id n9mr21532413qtl.118.1521506567465;
        Mon, 19 Mar 2018 17:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521506567; cv=none;
        d=google.com; s=arc-20160816;
        b=rbaq4xQQSJMGHPMX6CACZbUlrQ11NYIvpogwHYRbOBOQ2tn9rqS890mxwD+IEzeary
         e887kjX8P/UOiB1lsKdzLKE4luXWBdUl0+uIapdoMFKMa8VBynucDL7fHd6znIRjOvmx
         bPyqOE6opesdUoZbMonisihlr0ZgpGDdLcs/Z7wa1DStPI4WOFC16ASfYOkyG2glbXNt
         GmOcTrtIlpICB0jTDxJBZUFe25KWBJmamv8IABTMKcrGQnPeeGgNOG87FMRjIsRIFdpQ
         s9ObD6zUKPJrpdPra2XRY0xtAj8KU/NSiPNXnVddOWwcClkmyAwL5Fj8hMmgmnT50L+s
         Bk0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=z/HSoMoeQrPNPBw8mHcXVmghswPbN/SM85zQW2Ar6Jo=;
        b=jC0UYTH8WBuvnLO8Xwh320Y2SzpMaumJJDiSrY48AJlSPgu+8Omx9PF/OrNfnAU3o4
         Kv5Ttjq2zbkbThfUCc8J+eUKzie/TmthI41cEKrDc4yS30dL4O9TsDRfQiMaA89FlnBG
         moeZcmlqfJcb4hWxP0OfO1GKLiMGuBRNGFvIBdlzPWrbJU5LN1E2i/tB1wKfrzNwO/dm
         jBtKS+ibtul8OmeUgO4PGLwlS9BOTx/Vh3ik7cspA6wT/Peq8o2W5eqBjiKNEGfnNDQ2
         kvhJoUwOeGfAti3mfykd3DEcT4+OWhplrFdk6lno6Be7CZKUrADWtZDlIY37D9VuGA4t
         edKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=q4Pq+qJC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n8si557039qte.323.2018.03.19.17.42.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 17:42:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=q4Pq+qJC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ey5MV-0006pN-27
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 20:42:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ey5ML-0006nU-7E
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 20:42:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ey5MK-0006bu-1d
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 20:42:37 -0400
Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241]:35311)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ey5ME-0006WF-JT; Mon, 19 Mar 2018 20:42:30 -0400
Received: by mail-wm0-x241.google.com with SMTP id r82so299340wme.0;
	Mon, 19 Mar 2018 17:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=z/HSoMoeQrPNPBw8mHcXVmghswPbN/SM85zQW2Ar6Jo=;
	b=q4Pq+qJCXNVx4itkOyYypiF8Z4oy1zUgqLS7scHaVgscBHxuofsjbhntbYdXV0JPuj
	n014ThcXHRU5GrzlvKnHc3gKS4djHxR7jsx/i2dMWBrDszBych7CIy3XkR67DLQe6Gwv
	Txo3iyLT9YEhjx38UVK9TSQpgydwhRX8pPNmgBu/sbV+lkdO4C7sHAreMX58rKxHEFKE
	3Y3r44HW9NjGlzenYwZ5ZkZ3DlNaUeTEYLCMv3ipa2nDBLBqUPB3vZ5wZSHLmocc4Oo3
	gTjYNsLsR6pY157s62/as2Gf96RC3hCbTdSan7daDjK1GEgM9CxnTX7twfcgq8W0ND++
	lz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=z/HSoMoeQrPNPBw8mHcXVmghswPbN/SM85zQW2Ar6Jo=;
	b=YNC7g30L49s+bIHET9C3RuIgvswt77GqdmKl8FNELv9AFJf3qeyw/zwKuoCQHIeXWe
	HxztkMkB8yspkuj/UHsWA/epSRMnfncv7hZ+vI/D0h9b61h1PIy+IRsjJ7DSqcZwQLRP
	wikRhPNCRpCMCCrVUNDhkTHc0/fOWLR65FxIKtjExEjml8hZOQwvVzGq527YAqUAHT0V
	GT64zbe1kjXZbBoHn5anEn4dZpGa/im+lRwdegpEVTXfi97HNwBdxnAAyewuOQyBXKad
	KCPag3vjNvqxhYNj7UHO69ssqZlAdJRsqNtwaZKkuwyuXSQBxIMdcjURAivwGWWuS1JG
	gWTg==
X-Gm-Message-State: AElRT7GmvgqD7du3ioluKtZ562U+f9HuPB5S4zpQK06wlAgYXp56OlrB
	iGJjwO2FpumFL2756rTYhcU=
X-Received: by 10.28.139.19 with SMTP id n19mr528471wmd.40.1521506549231;
	Mon, 19 Mar 2018 17:42:29 -0700 (PDT)
Received: from [192.168.1.37] (67.23.27.109.rev.sfr.net. [109.27.23.67])
	by smtp.gmail.com with ESMTPSA id 140sm370240wmy.38.2018.03.19.17.42.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Mar 2018 17:42:28 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180319110215.16755-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <440e1c88-a720-af20-5575-9720afbdc3bd@amsat.org>
Date: Tue, 20 Mar 2018 01:42:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180319110215.16755-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::241
Subject: Re: [Qemu-arm] [PATCH for-2.12] hw/arm/bcm2836: Use the Cortex-A7
 instead of Cortex-A15
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
Cc: Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I5/j/Gp8Sxmu

On 03/19/2018 12:02 PM, Peter Maydell wrote:
> The BCM2836 uses a Cortex-A7, not a Cortex-A15. Update the device to
> use the correct CPU.
> https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2836/QA7_rev3.4.pdf
> 
> When the BCM2836 was introduced (bad5623690b) the Cortex-A7 was not
> available, so the very similar Cortex-A15 was used. Since dcf578ed8ce
> we can model the correct core.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
> This was originally done by a patch from Alistair:
> http://lists.nongnu.org/archive/html/qemu-devel/2018-02/msg00311.html
> 
> The refactor of bcm2836 means the code is different, but I'm using
> the same commit message.
> 
> Based-on: <20180313153458.26822-1-peter.maydell@linaro.org>
> 
> ---
>  hw/arm/bcm2836.c | 2 +-
>  hw/arm/raspi.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 25e74b67d9..8c1e707d9c 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -32,7 +32,7 @@ struct BCM283XInfo {
>  static const BCM283XInfo bcm283x_socs[] = {
>      {
>          .name = TYPE_BCM2836,
> -        .cpu_type = ARM_CPU_TYPE_NAME("cortex-a15"),
> +        .cpu_type = ARM_CPU_TYPE_NAME("cortex-a7"),
>          .clusterid = 0xf,
>      },
>      {
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 06f1e08ca9..955a7c4e80 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -226,7 +226,7 @@ static void raspi2_machine_init(MachineClass *mc)
>      mc->no_parallel = 1;
>      mc->no_floppy = 1;
>      mc->no_cdrom = 1;
> -    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a15");
> +    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-a7");
>      mc->max_cpus = BCM283X_NCPUS;
>      mc->min_cpus = BCM283X_NCPUS;
>      mc->default_cpus = BCM283X_NCPUS;
> 
