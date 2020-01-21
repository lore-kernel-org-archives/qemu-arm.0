Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp937967lfp;
        Mon, 20 Jan 2020 18:35:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqxiQ6tWxos2Iue9pIdMfAkpojpjkO+TnH1LM+YLUmC7v2CwOqv6BP45O/1CZfo4DwOmDFhk
X-Received: by 2002:a05:6402:2042:: with SMTP id bc2mr2007970edb.300.1579574123280;
        Mon, 20 Jan 2020 18:35:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579574123; cv=none;
        d=google.com; s=arc-20160816;
        b=wtwPb0OJeh/BN8XmJ2NFeivFmkO+UUpb7JRMPKMnCy0Qj7Nmp9bpNoU3m7ZXdga1nv
         CrS1zjREponhuAFWnw1EZ8AC05OxqaRDOOQ5rrh/5gksTiQ6o+p4uX4BGOaH6murvXFS
         nmHZY03Gna8aC0QX7qRyssC9EHXKRcAThBl8mnuZKTkU0TFzUQnWnYWHL++uKFuMrDmx
         MpK4YtYnWCOBh1rqwJkvZ9TiYzbEFvC6ssMyR6+Jtpnj7xk1nn4mWBovjIXwE38BMzg1
         trsFXPFvUqhVdBU2dEUAt1EwiknHsMZ5F4LNF4P+jxfFwrfRDA42Plaz3m0HfQnq+Cjt
         pozA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=JDjK8f1wNDnYnv5MklAFUQW2n0lqeI71GG2vg7iUWG8=;
        b=w2Rh0XRplkrkSI0ErB74i47JxvCahZLW5ybE7pdhGMsBv3kOxkUyPnMYLqewDFUUjp
         ifhCuJltaODJqGCpUht2e7uY87FK1eKSxz3S7mN/tHW4Z6KhHRQ6CEtO8pCZ2gGgR4e1
         usPVXYy98V8xTQnQzbX4NalI3dCnzzVXJjeZO8NpHIhSds5r+RkFP4N3TOoTfjlqtrK2
         Gz5GqPsCAt9OQpnc+WfHcvC56tMSTOtT65y0KsJIZfiazXvqRwPtRWGhLsvOOIZlbGwD
         vSsuhWxaQ/V6n9nQObX327NAm0XJONxkYFM1vwA1oNgEm2n33+pf5hyx26NkJmaZWbWM
         I2HA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fQ3yqI+L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ny23si23045672ejb.291.2020.01.20.18.35.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 18:35:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fQ3yqI+L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itjNy-0004QE-6k
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 21:35:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48926)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1itjNO-0003k7-S1
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 21:34:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1itjNN-0004ut-NG
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 21:34:46 -0500
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144]:42518)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1itjNK-0004sc-V8; Mon, 20 Jan 2020 21:34:43 -0500
Received: by mail-lf1-x144.google.com with SMTP id y19so888299lfl.9;
 Mon, 20 Jan 2020 18:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JDjK8f1wNDnYnv5MklAFUQW2n0lqeI71GG2vg7iUWG8=;
 b=fQ3yqI+LFK7V/MhmaV3QyECDozlmW8wLhOlzrtdO8cnsSJcvgQGgN4r7Srxu03Ck8/
 KGX8HttVcq1QoSKZu3LbFcdxyhVVhZnbA7ze1N1Xp18eXsnv0ty8e/Ic8Y/9Ml2+RNwr
 E2VXjl6Cgt4ri5bQkx2d7WRLKnzvq1Mg1Sa8OywfFmAOn2QljpGQOhtOlRMz6RWVeDLD
 qWxR1Vx2Q2b+xgt7JPqmlE7JF8511+AWxZC6nusnOLX010bT+YbmPHK+XIIVa065ZeSp
 mh9ri4n2g7GqI0kZBPdxAvNfsW9W6RM+GChS0ODuTV4ByOSlA3Hf2Lyc+vevV9O8z4kv
 RuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JDjK8f1wNDnYnv5MklAFUQW2n0lqeI71GG2vg7iUWG8=;
 b=gwQ3yhebHEki7ZpRRigOtCrztjrEzjcfQ4t7oPiz9Y0rjRUcGe6bCCA9cPXnguwEs0
 oqvL4y1WJ8vNu2dY2KIjA3TZ+cIaSCVaYP+t2RuPuB1LlXfYI0nJowgjrWb6WQqrVXnH
 xFcPNs87nJHSvNQvxAL0c/kEgUbbk+RLPhwzSsoQe30lUH49jO2uskpCU4/lzFNvTBov
 QOa4/mWI8dBsAaUki3lZ6GhEUEuHCEB/V3wivdTBos3zZ0uNsDp3RjgGAx9Tryr3F52D
 X2vMqqfyeDM2osPs3aFE3tl5vOEKalUIwSGXyZAjHVL7BUnUjYWaiVkKaOTg5eUBDD6M
 3dTg==
X-Gm-Message-State: APjAAAXq0rRfqs2vfsnel2uHLMJpO7kiE1nIr4OZYMiE08c9ELLO2oXy
 +tphV6yf7PsMkhYDh8Y+D4XKm25LuATTyt3DpYc=
X-Received: by 2002:ac2:4422:: with SMTP id w2mr1278069lfl.178.1579574080791; 
 Mon, 20 Jan 2020 18:34:40 -0800 (PST)
MIME-Version: 1.0
References: <20200120235159.18510-1-f4bug@amsat.org>
 <20200120235159.18510-2-f4bug@amsat.org>
In-Reply-To: <20200120235159.18510-2-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 21 Jan 2020 12:34:11 +1000
Message-ID: <CAKmqyKOCx5kc9ZvPCB9nJ6W3UZV6K1ji=zWvgo9_30U6BLQWBA@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] hw/arm/raspi: Remove obsolete use of -smp to set
 the soc 'enabled-cpus'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::144
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Emilio G . Cota" <cota@braap.org>, Cleber Rosa <crosa@redhat.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b1NG/FdpL4wn

On Tue, Jan 21, 2020 at 9:53 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Since we enabled parallel TCG code generation for softmmu (see
> commit 3468b59 "tcg: enable multiple TCG contexts in softmmu")
> and its subsequent fix (commit 72649619 "add .min_cpus and
> .default_cpus fields to machine_class"), the raspi machines are
> restricted to always use their 4 cores:
>
> See in hw/arm/raspi2 (with BCM283X_NCPUS set to 4):
>
>   222 static void raspi2_machine_init(MachineClass *mc)
>   223 {
>   224     mc->desc =3D "Raspberry Pi 2";
>   230     mc->max_cpus =3D BCM283X_NCPUS;
>   231     mc->min_cpus =3D BCM283X_NCPUS;
>   232     mc->default_cpus =3D BCM283X_NCPUS;
>   235 };
>   236 DEFINE_MACHINE("raspi2", raspi2_machine_init)
>
> We can no longer use the -smp option, as we get:
>
>   $ qemu-system-arm -M raspi2 -smp 1
>   qemu-system-arm: Invalid SMP CPUs 1. The min CPUs supported by machine =
'raspi2' is 4
>
> Since we can not set the TYPE_BCM283x SOC "enabled-cpus" with -smp,
> remove the unuseful code.
>
> We can achieve the same by using the '-global bcm2836.enabled-cpus=3D1'
> option.
>
> Reported-by: Laurent Bonnans <laurent.bonnans@here.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> Cc: Emilio G. Cota <cota@braap.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Andrew Baumann <Andrew.Baumann@microsoft.com>
> Cc: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  hw/arm/raspi.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
> index 6a510aafc1..3996f6c63a 100644
> --- a/hw/arm/raspi.c
> +++ b/hw/arm/raspi.c
> @@ -192,8 +192,6 @@ static void raspi_init(MachineState *machine, int ver=
sion)
>      /* Setup the SOC */
>      object_property_add_const_link(OBJECT(&s->soc), "ram", OBJECT(&s->ra=
m),
>                                     &error_abort);
> -    object_property_set_int(OBJECT(&s->soc), machine->smp.cpus, "enabled=
-cpus",
> -                            &error_abort);
>      int board_rev =3D version =3D=3D 3 ? 0xa02082 : 0xa21041;
>      object_property_set_int(OBJECT(&s->soc), board_rev, "board-rev",
>                              &error_abort);
> --
> 2.21.1
>
>
