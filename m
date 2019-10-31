Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp164082wri;
        Thu, 31 Oct 2019 16:39:11 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzVpbJ64jwov5mwjeu1F4HKkYtaw2Moq/k7C0yRPKf9u4eYg8XokUGIzbQdwj0feKiDw9RS
X-Received: by 2002:a37:e50c:: with SMTP id e12mr7837973qkg.52.1572565151786;
        Thu, 31 Oct 2019 16:39:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572565151; cv=none;
        d=google.com; s=arc-20160816;
        b=mxJAb38cQKbwjbOcaR+WhMF0nPt7AueNJlTuNLL2nTbNK80Hh7uxaf6gwF8SauuxDN
         ZgK6brEZKc9dugqH8iIHVNcQbu+tDFeei3l/nEp/PxK3UW4gnBL3pjABcTaVIquNwf/t
         4UjLRBqS1sOpDr4BDFdBAGNsv0Dt6EXP6vJL9kmgz4h4WAYWOXRfXIwSS1owLmzISujZ
         NiWgA8Hd+c0N01YtvqPcKfY8ODT++ASOH5UUa4WwE1mAh3XXMegNpRZqBZOrcVQj09p2
         Z8vpJWqvoCcKq9aRsskustluHRs1Wzkf5RYHd64akKK38VECSVtnBTbXfAfPsk3w+Ems
         dcwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=UksvnpYzNdVLEB9Tttzdp8pXC8HzwmxPaXzPQbuCWA8=;
        b=cRPBC3iwLrn602P8Xhn4c8/L0Qdq6pQtDESPOsyOELMnY7Y/aThWyAnKAEcWEbSec0
         U4bXTTuOZWW2w2yHSfaze/nXqNd8SXF+WlOhTmnjxEI5bEQcDQBf3cO6/VdETDpzTKZ1
         XZSrvmyfIa7Qr5h3p9VdYU5t5UzMJuvTOEX3ItGKrml6bMPzK8HY2qdMjaUkflYrDmPF
         c2vzPXHQkNJBgHcr6LLkD91o8SHajpEb4o3mS3b0O0ZSEb4IgVhlCtcpdgVmGlhBYSDq
         wnV9XuK8P1I42LYfswvndc0oNBEQ7LB8ikE0QKLWAzbEdyE1eovSdr38QIDHxaq2O6tJ
         hrbA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y197si5862790qkb.371.2019.10.31.16.39.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 Oct 2019 16:39:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iQK23-00052r-34
	for alex.bennee@linaro.org; Thu, 31 Oct 2019 19:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53641)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iQK1a-00051a-Jf
 for qemu-arm@nongnu.org; Thu, 31 Oct 2019 19:38:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iQK1X-000083-Vs
 for qemu-arm@nongnu.org; Thu, 31 Oct 2019 19:38:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38356)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iQK1V-0008VS-G8
 for qemu-arm@nongnu.org; Thu, 31 Oct 2019 19:38:37 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 92DA5C04B940
 for <qemu-arm@nongnu.org>; Thu, 31 Oct 2019 23:38:35 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id z9so4466095wrq.11
 for <qemu-arm@nongnu.org>; Thu, 31 Oct 2019 16:38:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J8bgphd3ygQ74msF+m1sFmeYg6lP0SClY9MLtdmfy28=;
 b=F9KOv1cxCSJ3oc+ssEYM6/OI2NPVtbyWMLZ+9zwmckkZuC9kKKWJNT1EoBbPJLpvhW
 6K/mgkhVeyykL3Qa2Nwu/0u3Z3qvo8o2/Cl8llZl1YbbUnAgduEeOe12wxPybt4pdqhh
 TqQtabuae3ySQRoPqnjtv3Lv56Vsu2XokTO/vsC/gXkUKcjcDwoHT2S+VEW2z9kd2q0M
 3efqyREpd7Am8yVCc1NPGwf0gcbpBOzJavH+LT/uBBvaL8LyM88WPV75KwXowoqTVHi3
 mJCfTLkObwmhEq/W0Mf/fXiibl1PJkOr7ZQL8dFb7kFY4IYyHPsQHibzVUf3qbrKG9oP
 KzUw==
X-Gm-Message-State: APjAAAWI4lA2T2Ih3kI+sWyXx5TJGuMh/gDq9n1H2h9PorDBqoq5kaIW
 Ub0DIGmHb0T82Oufs5TMQx10QOjZLVqfvWTGc8/XUY2UdUUMo02V8CUtH1QPtgUr/Q5+eghqDkB
 w1YzvQjKxJ6DB
X-Received: by 2002:a1c:a791:: with SMTP id q139mr7380861wme.155.1572565114395; 
 Thu, 31 Oct 2019 16:38:34 -0700 (PDT)
X-Received: by 2002:a1c:a791:: with SMTP id q139mr7380849wme.155.1572565114221; 
 Thu, 31 Oct 2019 16:38:34 -0700 (PDT)
Received: from [192.168.20.58] (94.222.26.109.rev.sfr.net. [109.26.222.94])
 by smtp.gmail.com with ESMTPSA id b3sm874766wmh.17.2019.10.31.16.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2019 16:38:33 -0700 (PDT)
Subject: Re: [PATCH v5 11/13] hw/s390x/ipl: replace deprecated qdev_reset_all
 registration
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
 <20191018150630.31099-12-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <29cfdbcc-3e83-a980-f753-dae8549e5853@redhat.com>
Date: Fri, 1 Nov 2019 00:38:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191018150630.31099-12-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 berrange@redhat.com, ehabkost@redhat.com, cohuck@redhat.com,
 mark.burton@greensocs.com, qemu-s390x@nongnu.org,
 Christian Borntraeger <borntraeger@de.ibm.com>, edgari@xilinx.com,
 qemu-arm@nongnu.org, pbonzini@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZFBLRIvLIBP8

On 10/18/19 5:06 PM, Damien Hedde wrote:
> Replace deprecated qdev_reset_all by resettable_cold_reset_fn for
> the ipl registration in the main reset handlers.
>=20
> This does not impact the behavior for the following reasons:
> + at this point resettable just call the old reset methods of devices
>    and buses in the same order than qdev/qbus.
> + resettable handlers registered with qemu_register_reset are
>    serialized; there is no interleaving.
> + eventual explicit calls to legacy reset API (device_reset or
>    qdev/qbus_reset) inside this reset handler will not be masked out
>    by resettable mechanism; they do not go through resettable api.
>=20
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: qemu-s390x@nongnu.org
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Thomas Huth <thuth@redhat.com>
> ---
>   hw/s390x/ipl.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
> index ca544d64c5..2689f7a017 100644
> --- a/hw/s390x/ipl.c
> +++ b/hw/s390x/ipl.c
> @@ -237,7 +237,15 @@ static void s390_ipl_realize(DeviceState *dev, Err=
or **errp)
>        */
>       ipl->compat_start_addr =3D ipl->start_addr;
>       ipl->compat_bios_start_addr =3D ipl->bios_start_addr;
> -    qemu_register_reset(qdev_reset_all_fn, dev);
> +    /*
> +     * Because this Device is not on any bus in the qbus tree (it is
> +     * not a sysbus device and it's not on some other bus like a PCI
> +     * bus) it will not be automatically reset by the 'reset the
> +     * sysbus' hook registered by vl.c like most devices. So we must
> +     * manually register a reset hook for it.

:)

> +     * TODO: there should be a better way to do this.

:(

> +     */
> +    qemu_register_reset(resettable_cold_reset_fn, dev);

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>   error:
>       error_propagate(errp, err);
>   }
>=20
