Received: by 10.28.91.67 with SMTP id p64csp1295228wmb;
        Tue, 13 Mar 2018 16:42:49 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtscXUasHMkbIC3Hrf+Le17pzzEKPHc6O75D06Iq4m9doWF6+EtWkemeQyp4mrOeL1SIKJW
X-Received: by 10.237.55.225 with SMTP id j88mr4015219qtb.213.1520984569253;
        Tue, 13 Mar 2018 16:42:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520984569; cv=none;
        d=google.com; s=arc-20160816;
        b=ckR0SPPDRdqq9UE5x8uA6/H/60l9DCiCrOEq4ui5aIwfghvdZpAtYeQdR0+eMPZwsI
         wlH9r1qVoKtYSDbSx5y19YoJ6wrXk6q6UenbtAYGlNQk5XWJOl3pZAppraCugXG8gjW0
         YQINPQ8kJjmzjJNEMaPSZYbhyre7nCAz8gt8Lr00I/7GqpdAGNI3rOGmq+q8HZ2rU7xF
         +W8vzmTuNGW0H1QAIPgdUTttF+Sg3Glij6Xnvq4i0JtQd6PWNtgZUei+06CPP6idI8rO
         VSRkt5fhVFysRPZeH+rYfGU1OeqN8GY0L47yAvC/RWhl7OQQ4W9W0X1bkKRAKp64rQ7L
         EgVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=UGzb1VIHPPpTPOscQv8vkcfqWTLFEm3X5J2Q2OUCdBg=;
        b=iCPpjFwafaK7MU2rDWAmiYfSWlUnnR2mmUNj1wXTzpy5q/foh9L/qTrcqBFGUqCuu+
         zM7it8JTUEHFwJqp3zpsQBSqX8wG1aDy/AW8gVKiQrFPlwIJlQCFrfjvr4U8vt9lmhff
         l8tXiNeivXQQ93GmFIThn1BubbeQEJrIq9S4pBirAyDh3zS89p6DDJOIVokM+ngyUw3j
         X3G8Atbh569WgH2mUfEUc1S7Co7xXZCz6Zy0E7WRnTnhAgsbHBYuq1JVSF5j2NPpR6Rp
         2ziBPGmLOgExvUtiP57XtgrKugoQbWT0r2vLc71XfpNKMTwYrZ5mHxalNVIVwj+E/IAP
         U60w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DM87dL52;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v4si25141qka.230.2018.03.13.16.42.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 16:42:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=DM87dL52;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43595 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evtZA-0002xy-LE
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 19:42:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34674)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evt0P-0005DJ-Bm
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 19:06:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evt0O-0005ss-8r
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 19:06:53 -0400
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:36199)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1evt0I-0005q0-Os; Tue, 13 Mar 2018 19:06:46 -0400
Received: by mail-wr0-x243.google.com with SMTP id d10so2617899wrf.3;
	Tue, 13 Mar 2018 16:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=UGzb1VIHPPpTPOscQv8vkcfqWTLFEm3X5J2Q2OUCdBg=;
	b=DM87dL52G1M/OiMFKTJ8hz5KRxJ13Mt19Of7k3cVWvCgRKEroBmdhez2KBwMbU3wH3
	07k9BdGcrgixKfWzBYOdFLkoKT+BVK7reuiy730EqC9McYEWOGXQ8GV+OuKVWSLmJh70
	8YhmPGFkYjbjHbgtysInZzP3g6um+nD5j5YwLtVlw7YJsFOlMVxH7aBljS6s+s65bhgc
	MZbB6GaTQfdX0q/4d++xeLkEXK+PC71VqGFQeD3xT8D9zPu0LSe5WsbJr1guIBZJLfLh
	0NJMt2cYzDt5I7l8i92ru39ZoNkCzf+rJ6/H1Bn8aQp/U75hQhkVW1BtCXcY6DDvqdmZ
	RtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=UGzb1VIHPPpTPOscQv8vkcfqWTLFEm3X5J2Q2OUCdBg=;
	b=ZfVbhUGbkvfjcFm9UlVvZpxnQUf/gvNkpRRcj/uM0LSHmqVKNhVbFRcmNATMamXImk
	DSmogAeJ3u9ZCyLsnFVA5MfRs+uN8Tgi9IQeuKD7xXc3YffoWyk4chzEqVuZsfCHEbqN
	LC5oATKyiS4Ay8Sqo90wUR8aVNVwGs9W6bioVYMjSFYPTLPFB78oDSMdl6w2xif7Flz4
	OvJ4o9wASpaVRr8hxvKK7hjfXd0hDIn/FMgzXdxgbelchLXQY9/3o1SmBRolCgHFiNit
	XGiG2hjd9zJF9Yltim2D1746DClAkOzx5izOtKn4zOHUnicKBFKFYLyPwP9n35dwmDTV
	Y7MA==
X-Gm-Message-State: AElRT7HBKG0sf+MuP5+j2acwXsUSi4B4NkvBb/qv99muElaOessonHQ3
	H9FdKueYABFHdVLvgCybDPc=
X-Received: by 10.28.101.69 with SMTP id z66mr2124630wmb.143.1520982405765;
	Tue, 13 Mar 2018 16:06:45 -0700 (PDT)
Received: from [192.168.1.29] (AStrasbourg-554-1-221-65.w86-204.abo.wanadoo.fr.
	[86.204.94.65])
	by smtp.gmail.com with ESMTPSA id z3sm70779wme.3.2018.03.13.16.06.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Mar 2018 16:06:45 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180313153458.26822-1-peter.maydell@linaro.org>
	<20180313153458.26822-9-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <459dc453-911a-0d9c-dc8a-26f39fa9cf75@amsat.org>
Date: Wed, 14 Mar 2018 00:06:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180313153458.26822-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [PATCH 8/9] hw/arm/bcm2836: Hardcode correct CPU type
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
X-TUID: 8R+jdBEkDoZs

On 03/13/2018 04:34 PM, Peter Maydell wrote:
> Now we have separate types for BCM2386 and BCM2387, we might as well
> just hard-code the CPU type they use rather than having it passed
> through as an object property. This then lets us put the initialization
> of the CPU object in init rather than realize.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/bcm2836.c | 22 +++++++++++++---------
>  hw/arm/raspi.c   |  2 --
>  2 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/arm/bcm2836.c b/hw/arm/bcm2836.c
> index 7140257c98..12f75b55a7 100644
> --- a/hw/arm/bcm2836.c
> +++ b/hw/arm/bcm2836.c
> @@ -25,16 +25,19 @@
>  
>  struct BCM283XInfo {
>      const char *name;
> +    const char *cpu_type;
>      int clusterid;
>  };
>  
>  static const BCM283XInfo bcm283x_socs[] = {
>      {
>          .name = TYPE_BCM2836,
> +        .cpu_type = ARM_CPU_TYPE_NAME("cortex-a15"),
>          .clusterid = 0xf,
>      },
>      {
>          .name = TYPE_BCM2837,
> +        .cpu_type = ARM_CPU_TYPE_NAME("cortex-a53"),
>          .clusterid = 0x0,
>      },
>  };
> @@ -42,6 +45,16 @@ static const BCM283XInfo bcm283x_socs[] = {
>  static void bcm2836_init(Object *obj)
>  {
>      BCM283XState *s = BCM283X(obj);
> +    BCM283XClass *bc = BCM283X_GET_CLASS(obj);
> +    const BCM283XInfo *info = bc->info;
> +    int n;
> +
> +    for (n = 0; n < BCM283X_NCPUS; n++) {
> +        object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
> +                          info->cpu_type);
> +        object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
> +                                  &error_abort);
> +    }
>  
>      object_initialize(&s->control, sizeof(s->control), TYPE_BCM2836_CONTROL);
>      object_property_add_child(obj, "control", OBJECT(&s->control), NULL);
> @@ -69,14 +82,6 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
>  
>      /* common peripherals from bcm2835 */
>  
> -    obj = OBJECT(dev);
> -    for (n = 0; n < BCM283X_NCPUS; n++) {
> -        object_initialize(&s->cpus[n], sizeof(s->cpus[n]),
> -                          s->cpu_type);
> -        object_property_add_child(obj, "cpu[*]", OBJECT(&s->cpus[n]),
> -                                  &error_abort);
> -    }
> -
>      obj = object_property_get_link(OBJECT(dev), "ram", &err);
>      if (obj == NULL) {
>          error_setg(errp, "%s: required ram link not found: %s",
> @@ -168,7 +173,6 @@ static void bcm2836_realize(DeviceState *dev, Error **errp)
>  }
>  
>  static Property bcm2836_props[] = {
> -    DEFINE_PROP_STRING("cpu-type", BCM283XState, cpu_type),
>      DEFINE_PROP_UINT32("enabled-cpus", BCM283XState, enabled_cpus,
>                         BCM283X_NCPUS),
>      DEFINE_PROP_END_OF_LIST()
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index f588720138..ae15997669 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -150,8 +150,6 @@ static void raspi_init(MachineState *machine, int version)
>      /* Setup the SOC */
>      object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ram),
>                                     &error_abort);
> -    object_property_set_str(OBJECT(&s->soc), machine->cpu_type, "cpu-type",
> -                            &error_abort);
>      object_property_set_int(OBJECT(&s->soc), smp_cpus, "enabled-cpus",
>                              &error_abort);
>      int board_rev = version == 3 ? 0xa02082 : 0xa21041;
> 
