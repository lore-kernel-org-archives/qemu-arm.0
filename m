Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2864848wru;
        Tue, 17 Jul 2018 09:28:43 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd+iEUOpaFG1NQhCno3DAcBy6dN9fpkRQj5eOtEunUEOmm2y366isXUwcu9Tn6lW413p6MT
X-Received: by 2002:aed:25cf:: with SMTP id y15-v6mr2274743qtc.341.1531844922997;
        Tue, 17 Jul 2018 09:28:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531844922; cv=none;
        d=google.com; s=arc-20160816;
        b=fviu3mpv4CKAK1mI1pKuNpWOTrSVXWJNliS1+izbjVzQES67aSZwgFwHUxeyc2A4HG
         PTQqruVB9jobKpVsjss1QGxtfcEuGmJ2qWWvzOv77YMWyNF2rHPpoG1E9rVyWEsMcmYo
         gcC2eqCCRV1nUFFa8tGiIXwdhbvqz5LUnodQ0zCjDEWZH6BfIOqJpF/GN37MWivFuyTm
         Uiq9rVQvg68CMhMFQSMofFG8C+zDG+O1SqTD+qvW/FnCFYvd25Ro7J5giQUm5YoNU5BU
         Q3MPTzn0IPNmdd5R8UxPBAgGYaVQSLLeTmXjYdbWFXAFqVYuRXEJu3Gb3dc34pvZAdBb
         MT+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=vSIugiIh0YVndYyQJiBz1BQV3OzsMrnWZKmgZ3Z2myM=;
        b=Fgp5/t+ye+/5A4AwXHkMEDm+TQuprBPN+jxu3pJUkkZ8xvHM5wyRNIkIW5nxRzQIix
         bBvDExDm19PgvsyOvP/UoqxOBK4hU6+KKGi61wEsPcUHFwKMw8VJpPvQW/QAMHqEOJrw
         V+U9J6scciclkiYvTYeiCLBSBg5Kg5IVBwzZgcPv3F5mMtqAOMm6KiiLaxw7BK+DVHM6
         HjpZ0qd/blwUNpFedUOZ7kNQUmfZqgyg2NDmhIp863gs/VvOcSvgc2Qk8DixPTB7tubM
         hScY7uJXEoRGeSWKJv9am/edTGCZutKfGEbYr6pgq+AB2uF+kDnIeVqvXUzAjB4j5vAt
         5wqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CxGqPnIi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q15-v6si1189613qtn.130.2018.07.17.09.28.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jul 2018 09:28:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CxGqPnIi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60403 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffSqA-00070c-7v
	for alex.bennee@linaro.org; Tue, 17 Jul 2018 12:28:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffSq1-0006zw-3S
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 12:28:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffSq0-0004qR-6Q
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 12:28:33 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:42089)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ffSpz-0004pi-OP
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 12:28:32 -0400
Received: by mail-oi0-x241.google.com with SMTP id n84-v6so3159262oib.9
	for <qemu-arm@nongnu.org>; Tue, 17 Jul 2018 09:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vSIugiIh0YVndYyQJiBz1BQV3OzsMrnWZKmgZ3Z2myM=;
	b=CxGqPnIi0haqDZ6egJU2RUvfmUAWav3iGws5OEmIGCNx+IyGAE2YJ0QFLEG2J57oeC
	1xvssZ8b0MEmUrQB0D7idxxwMLl6IAFkf2sDGGB1MVs+iPGmqQY3cnONjASYQRB8b184
	qI3CupGzUjcRFN3ZYSXFDHK6KU4er5We4R0PM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vSIugiIh0YVndYyQJiBz1BQV3OzsMrnWZKmgZ3Z2myM=;
	b=JEt8lJut8YZlf9Tqkc7KvLEMLlHnIaMwyvv6VMVlHXQ3pfFnubcnByCWQhhz4BMlo4
	z5qxeYbhF4Iuc/y+ZRYrUJeMoa9exwFLsyC4PrrVUYQlsUIhP39lnGtfmGnPb5+27EFC
	XJrJt1tRL7jmZGagGqknSuJQTbsEayXo1Xq1ML/5XgVIrz90Z6MTyM379qN/jXZHsSnc
	EYoHkFScYehVUc6rei+oxskPoK4CLknOB6MtSkngAxg6M5+lHq/5X9Stsn0uYMnXlu4t
	zHMXvXJuxhGJDbUSRuE6xVU3PYItpzpY0NksoEROWLjBtguXcVgKkDWFkmXzfeeLr2yV
	oBYQ==
X-Gm-Message-State: AOUpUlELuEjDsRl0N1H6tcfg64P+X7k/7zm1YcGFZcIZMwLSEodWCve3
	yA/my6mOBtYYPWWO8Eap22i5roR88eq6ZhtwhDjMnA==
X-Received: by 2002:aca:4a49:: with SMTP id
	x70-v6mr2216830oia.11.1531844910986; 
	Tue, 17 Jul 2018 09:28:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 09:28:10
	-0700 (PDT)
In-Reply-To: <1529699547-17044-14-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
	<1529699547-17044-14-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jul 2018 17:28:10 +0100
Message-ID: <CAFEAcA8v=c6Q-Ftoq-JWk2LLnv8hry2gyOrgsxAV5GSs_6eo1w@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v5 13/13] target/arm: Send interrupts on PMU
 counter overflow
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lz7n+tfZVW8q

On 22 June 2018 at 21:32, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> Setup a QEMUTimer to get a callback when we expect counters to next
> overflow and trigger an interrupt at that time.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/cpu.c    |  11 +++++
>  target/arm/cpu.h    |   7 +++
>  target/arm/helper.c | 132 ++++++++++++++++++++++++++++++++++++++++++++++++----
>  3 files changed, 141 insertions(+), 9 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 2f5b16a..7b3c137 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -743,6 +743,12 @@ static void arm_cpu_finalizefn(Object *obj)
>          QLIST_REMOVE(hook, node);
>          g_free(hook);
>      }
> +#ifndef CONFIG_USER_ONLY
> +    if (arm_feature(&cpu->env, ARM_FEATURE_PMU)) {
> +        timer_deinit(cpu->pmu_timer);
> +        timer_free(cpu->pmu_timer);
> +    }
> +#endif
>  }
>
>  static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
> @@ -937,6 +943,11 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>              arm_register_pre_el_change_hook(cpu, &pmu_pre_el_change, 0);
>              arm_register_el_change_hook(cpu, &pmu_post_el_change, 0);
>          }
> +
> +#ifndef CONFIG_USER_ONLY
> +        cpu->pmu_timer = timer_new(QEMU_CLOCK_VIRTUAL, 1, arm_pmu_timer_cb,
> +                cpu);

This is a confusing way to write timer_new_ns().

> +#endif

>  #define SUPPORTED_EVENT_SENTINEL UINT16_MAX
>  static const pm_event pm_events[] = {
>      { .number = 0x000, /* SW_INCR */
>        .supported = event_always_supported,
> -      .get_count = swinc_get_count
> +      .get_count = swinc_get_count,
> +      .ns_per_count = swinc_ns_per

If you always put trailing commas on the end of the last line in
a struct initializer, then you don't need to modify the preceding
line in later patches which add a new line to the initializer.

The meat of the patch is beyond me at this time of the
afternoon :-)

thanks
-- PMM
