Received: by 10.28.91.67 with SMTP id p64csp1978435wmb;
        Sun, 18 Mar 2018 15:43:02 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtL3W0Mc1LmTxhtHjunIo7Ctv7+yGTWDAzlhNON2tgV2jbYTwx66HYT6N/I0FsF2grz3gbF
X-Received: by 10.237.53.47 with SMTP id a44mr15364476qte.96.1521412981965;
        Sun, 18 Mar 2018 15:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521412981; cv=none;
        d=google.com; s=arc-20160816;
        b=sWxMQAp4/ULkGWwVDruRV3E/ukno3mfZNo9NGc6k02HzumsybzwUcgL0mldjGqBUl+
         A5hExSm7nfUdygiXlinIxyIkdJ3zfsws5SBrHlezw/FzDl+Q0YF/y2VT3/KTCGLrcMb+
         dI2RoY4OUmBKStCYeYlsCQBqiJYoBBV9CXb8a8sEdcafZS1enOPz+QIhc8Ticz8Qn2MM
         vljUKDhUrVCtNHKvZ8eIE8+AlXwNEGDM9nFFbqlYNwW6l1XxjdvUqrHFiCy8eUbUZ5yr
         LVWlyVmO94skwxoMis5RsP5MppBhup5hRXVwZs20PtWBGTQbP0gTc5DOl7/Bztn1N3RQ
         bH6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=jUTmj1ynujqT+Jrfbsa+WE/nS5Qtf7Ej2mGtMbeGloM=;
        b=q/RDugexYg2ee3Aom7UkheFk7c0xsBS5hGIqzUXabqFbk37scUiwhAwJdatQKLdQ6Z
         yyqMllVbUFfyyAZYT11ye0SK9StMHFIHLFqn33W4MI57gqCxc8P8+Mlb+Gi0WD82vzPp
         rlA3o4UV4/dD3UuiE9ElqPXXTDdTkhZeWSvnN1zxeFRmwAhQ5hJYY+nGqNrdJzpp8cBZ
         8PmxLIyWT7Yof5cT1GH/w2QadxyMzQqCY9zX4CADBb3ZgJmjHg5l4llAvx85eePzlz7H
         tmVvIU56RJn7Y6nrl3IXj2DqHOBRPKNr0wngATJRqBsIJJUQKFD3IZukTAuZ2PIm6G3j
         fD9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EuwSA9iN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y77si5164396qkg.298.2018.03.18.15.43.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 18 Mar 2018 15:43:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EuwSA9iN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39355 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exh13-0005ae-Ed
	for alex.bennee@linaro.org; Sun, 18 Mar 2018 18:43:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39612)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exh0o-0005ZM-E9
	for qemu-arm@nongnu.org; Sun, 18 Mar 2018 18:42:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exh0n-0006at-HK
	for qemu-arm@nongnu.org; Sun, 18 Mar 2018 18:42:46 -0400
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:34114)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1exh0l-0006VT-2Z; Sun, 18 Mar 2018 18:42:43 -0400
Received: by mail-wr0-x243.google.com with SMTP id o8so16791553wra.1;
	Sun, 18 Mar 2018 15:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=jUTmj1ynujqT+Jrfbsa+WE/nS5Qtf7Ej2mGtMbeGloM=;
	b=EuwSA9iNix/BeUOQH3mVY/Dx6NmLZk6HXsnA+BKFL81sbJsKv4g277BpM+dJze8AWt
	JpHRyuE1llY/wxrjz70/6zZ0lnA0pCNYa4F6F0IzTBWmg1EPOJhycEJKRzirmq2fNBRy
	QjTigf3ieyOX7XcQlEj+u+rnwTMYBPUbBKF7axF8OUyWJZATAOmu8gfmoM3ADq2izZfE
	/+JoRRO1jUMXXFSqUZyhqMf+xJGNKnOJP7rUiEA4owrsrtg2i0Og396QTxOQAsZAO712
	Fkt+iHzZXsWaC3vdu2JnzFEq+UdEcGCni8C1PiwLR9mVlAKAnwnjbzZhN/gmE2l4W+PB
	ytSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=jUTmj1ynujqT+Jrfbsa+WE/nS5Qtf7Ej2mGtMbeGloM=;
	b=B3jvqY+RpnnebyCSrNQsTI4+0GrjCuYBzAzx7fVuVrRwPkHhyO7i9mLY3ymDPKyb3t
	FK6ZMH/vNLIW4Mpz2HKo5dbR8T7/gGsgStbGnd0CpdV9z/BuPfkdpwXU3hS9YEHH6ZIE
	g1hVcWw0c5EmQdo6tlE5F3vRqoLVy709GzEGMcKMavajYZhVKsMSzap14+cGqecKdkgo
	Xw19wuSWjjqIECL1jdgrYdzYDzm6k7H94sEfmlAuEh5rzRgkqcGzm0yYM9ht/S3rEFsB
	/nlTyZyjjKSLLBdQO0hVl3TVv7jjXBGYa333A8eiUdr2YIL5KjqtIopv2i/cE2FubFFP
	WHlg==
X-Gm-Message-State: AElRT7HYI00VZ5slDoexOnaxs3UsOIhUSHL9iB2fdhZ2WvXB9G+Qjle/
	IQ5MRAiZJNNNyYOCkk/wHN4=
X-Received: by 10.223.166.79 with SMTP id k73mr7950203wrc.200.1521412961780;
	Sun, 18 Mar 2018 15:42:41 -0700 (PDT)
Received: from [192.168.1.37] (67.23.27.109.rev.sfr.net. [109.27.23.67])
	by smtp.gmail.com with ESMTPSA id g4sm6861524wrd.1.2018.03.18.15.42.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 15:42:41 -0700 (PDT)
To: Aaron Lindsay <alindsay@codeaurora.org>, qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Wei Huang <wei@redhat.com>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-16-git-send-email-alindsay@codeaurora.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <b97cdeec-6cdb-022a-63a7-b7ebb005f066@amsat.org>
Date: Sun, 18 Mar 2018 23:42:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1521232280-13089-16-git-send-email-alindsay@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [PATCH v3 15/22] target/arm: Add ARM_FEATURE_V7VE
 for v7 Virtualization Extensions
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
Cc: Michael Spradling <mspradli@codeaurora.org>, qemu-devel@nongnu.org,
	Digant Desai <digantd@codeaurora.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FaQVT2bz03NA

On 03/16/2018 09:31 PM, Aaron Lindsay wrote:
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/cpu.c | 3 +++
>  target/arm/cpu.h | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index b0d032c..e544f1d 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -765,6 +765,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>      /* Some features automatically imply others: */
>      if (arm_feature(env, ARM_FEATURE_V8)) {
>          set_feature(env, ARM_FEATURE_V7);
> +        set_feature(env, ARM_FEATURE_V7VE);
>          set_feature(env, ARM_FEATURE_ARM_DIV);
>          set_feature(env, ARM_FEATURE_LPAE);
>      }
> @@ -1481,6 +1482,7 @@ static void cortex_a7_initfn(Object *obj)
>  
>      cpu->dtb_compatible = "arm,cortex-a7";
>      set_feature(&cpu->env, ARM_FEATURE_V7);
> +    set_feature(&cpu->env, ARM_FEATURE_V7VE);
>      set_feature(&cpu->env, ARM_FEATURE_VFP4);
>      set_feature(&cpu->env, ARM_FEATURE_NEON);
>      set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
> @@ -1526,6 +1528,7 @@ static void cortex_a15_initfn(Object *obj)
>  
>      cpu->dtb_compatible = "arm,cortex-a15";
>      set_feature(&cpu->env, ARM_FEATURE_V7);
> +    set_feature(&cpu->env, ARM_FEATURE_V7VE);
>      set_feature(&cpu->env, ARM_FEATURE_VFP4);
>      set_feature(&cpu->env, ARM_FEATURE_NEON);
>      set_feature(&cpu->env, ARM_FEATURE_THUMB2EE);
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index fb2f983..cc1e2fb 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1439,6 +1439,7 @@ enum arm_features {
>      ARM_FEATURE_OMAPCP, /* OMAP specific CP15 ops handling.  */
>      ARM_FEATURE_THUMB2EE,
>      ARM_FEATURE_V7MP,    /* v7 Multiprocessing Extensions */
> +    ARM_FEATURE_V7VE,    /* v7 with Virtualization Extensions */
>      ARM_FEATURE_V4T,
>      ARM_FEATURE_V5,
>      ARM_FEATURE_STRONGARM,
> 
