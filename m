Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1768037lfb;
        Thu, 21 May 2020 10:21:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjbTtVQj8r81qHe50H+cfenw0jfF1NmMUV2nqmwvTTVpbsV1FNdIvadT9iEkjZbgpwy5qp
X-Received: by 2002:a37:4ed1:: with SMTP id c200mr10453646qkb.385.1590081698480;
        Thu, 21 May 2020 10:21:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590081698; cv=none;
        d=google.com; s=arc-20160816;
        b=cY8SF3HThl7XcSMV3/d8xd3EB6EW8H7UosmgcWOA1lqQcrsHn6PtC7ipHkxJfll7br
         XRTWkBzLEInBXBa1CqL3zS//bCKVrosqgflpy2rFROO/AEnLUgzI5u+ZPrgS6JkRBGi4
         JOXJQSwX/2EUWNi9DqBhuwMSu+NJWij7rUhwK00WUBxOKTlcnFrsnryU2QrxVAtu8yri
         RCKHQcXlGFiEl4sZbilqwno1cTZJvLZGb1XuNEX3+BxwKUMBrwKriPOLWvr88aH1qh79
         HSl8Z/VbECm01da92tHOd+YNiv3SVFc05iUFnpbYiSBbuHszlErIIY7q4cnbdSwzYH2g
         zFVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oHKmpJirg4EZoTKDF575j+PCYShCNB8Xm+6VogrN6FA=;
        b=C+01L35c35UqKgkTnWw0cbYWtb2dIWGGCZBVUldwd9a8UbtRXw+B9FSnwvxYWrTD1S
         ppiey0zDjSAob+vqbealyMmuT3GWAETautlb8KGgDrP708RH/+ijw/z59h4mg6SvjYg9
         ZXY9QAITrUUkHiLK6ro6rnu8Y4dyRId4LfXW5IxMfastAa0AtwVTzcxQBq1PfqOzPYhS
         EROQP40uDk3B833N1acc8A67SPS5ee2y4Qjx1q6u3SOyL4qHjU2KydSfRrC3z5qwaa4+
         hrDq8a3iD/uI8TY/iup4Ti8JLlKYeSxOirZbT0ZrvrOHXstVrAmIS1YwD05aj8SHXC9O
         r8HQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G4Eqelj7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l2si3569239qth.62.2020.05.21.10.21.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 10:21:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=G4Eqelj7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbosz-0007d2-Qv
	for alex.bennee@linaro.org; Thu, 21 May 2020 13:21:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jboXu-00012j-KX
 for qemu-arm@nongnu.org; Thu, 21 May 2020 12:59:50 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jboXt-00016X-F4
 for qemu-arm@nongnu.org; Thu, 21 May 2020 12:59:50 -0400
Received: by mail-ot1-x343.google.com with SMTP id d26so6028003otc.7
 for <qemu-arm@nongnu.org>; Thu, 21 May 2020 09:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oHKmpJirg4EZoTKDF575j+PCYShCNB8Xm+6VogrN6FA=;
 b=G4Eqelj72FTUuEXOQDgLe1SoQH1v4Ua5qW0EWqZ8ULWhG3c+WQbKYZo9vWNniboF/O
 PHf/AznmoUJk2dltC+/ThYvTKdN2s2KCMvOvdvm3IynzPiHWaVvdnJtDJbrA/sP8meYV
 7PLQ/AASuNRXviX1CLYakMauQGlHAdJQAI2kaOg71DTLeCS/I4hKPh12cLXEeaQPe9pD
 xImacx9JfiSZnZKMOtKD7tKRSohBwXDwW7s6WH6YQD7xOCPgEI6pzF8bb66tfI+KA137
 GCNO56iA69u6+YbumNJaMTh+ea3UKgUzg6d7RQg2915hK+Np+xka8RjaCv83PubIlRRk
 wvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oHKmpJirg4EZoTKDF575j+PCYShCNB8Xm+6VogrN6FA=;
 b=JcH8MmQecg1qvjz7PysvpQxR25b/qSZ2RfGLrbrbg5zr720ewrzCCQZmIfrvvdkgOd
 fBuHJyN7z0IPW/JxauTPTShsQtFICqHlUlUy/n/6dgrsOXj5N2itmjrsoFvg+yQFvgjB
 T2y3n2h1oSsOBB5/hpnQ46hkopNgBEvyoJVcqp/UtwnkrNVmDh3EtUqAqOTF1UUD1pXV
 Sn8uqW+PhmTcK+8g2XcBYdwDTGNqLwgglf8dKKT4imNqo6vQYqBri8X0KR6WBO6dPq96
 jrjyr7lTcygS36wXeeRmm7N0qH+21vl9yXhMfPryK/808F2ehYeM73GpGft+h4wBwWB+
 Id7Q==
X-Gm-Message-State: AOAM533upmpsixFo2c2vHMAZGTytHRTmE2+eyDQd/WCXCDJdDW5mvmFe
 szLrrHhCwm63pcw8AL3lwigTcz8kk5KpwcmT3ti/Ow==
X-Received: by 2002:a05:6830:158b:: with SMTP id
 i11mr8016316otr.135.1590080387984; 
 Thu, 21 May 2020 09:59:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200519084904.1069-1-geert+renesas@glider.be>
In-Reply-To: <20200519084904.1069-1-geert+renesas@glider.be>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 May 2020 17:59:37 +0100
Message-ID: <CAFEAcA9-wQ72_M+ZY+EbEgw1L9LVchBgpLivexFXVZ3HuCtcZg@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Fix PL061 node name and properties
To: Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3gMxOJNIp4+7

On Tue, 19 May 2020 at 09:49, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Make the created node comply with the PL061 Device Tree bindings:
>   - Use generic node name "gpio" instead of "pl061",
>   - Add missing "#interrupt-cells" and "interrupt-controller"
>     properties.

Where have these properties come from? They must be optional,
because in the version of the binding documentation from Linux
5.0 they're not described:
https://elixir.bootlin.com/linux/v5.0/source/Documentation/devicetree/bindings/gpio/pl061-gpio.txt

They seem to have magically appeared in kernel commit
910f38bed9439e765f7e, which purports to only be a change
of format from plain text to yaml but has added some
extra properties and claimed them to be mandatory.

Since the devicetree spec says that the interrupt-controller
property "defines a node as an interrupt controller node"
and a GPIO chip isn't an interrupt controller, this seems
like some kind of error in the dtb binding. Maybe I'm
missing something...

What actually goes wrong if QEMU doesn't specify these
properties?

> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7dc96abf72cf2b9a..99593d7bce4d85cb 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -818,13 +818,15 @@ static void create_gpio(const VirtMachineState *vms)
>                                       qdev_get_gpio_in(vms->gic, irq));
>
>      uint32_t phandle = qemu_fdt_alloc_phandle(vms->fdt);
> -    nodename = g_strdup_printf("/pl061@%" PRIx64, base);
> +    nodename = g_strdup_printf("/gpio@%" PRIx64, base);

Does the devicetree binding really mandate what the node name is?
I thought that finding the right device was doe via the
'compatible' string and the nodename could be whatever the
device tree creator wanted.

thanks
-- PMM
