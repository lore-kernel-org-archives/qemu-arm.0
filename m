Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2092628lfg;
        Sun, 2 May 2021 13:48:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyn5oAt+5qfEbNSWFEJyTLmAjQJFXKUrzdpZYYLnbaNvEqsHu49hkgq4B7SZG0gtv5Wpnhf
X-Received: by 2002:a92:c6ca:: with SMTP id v10mr13400336ilm.97.1619988522351;
        Sun, 02 May 2021 13:48:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619988522; cv=none;
        d=google.com; s=arc-20160816;
        b=P3cvQR4M6f5/r8K+Dq8yV5e26zGnL+iW5a4nceoXvMnS+UeCCmmYMnvfEFraGRxAA6
         EBo4sv+mTgq2gnZ5aKxyF9IxWD8m0+11kX0NdLuEKLC6ubp+0ylggVpjCt18EReyqIYq
         EAkjs8w/ZXHsAotPldauOa/JRZME//E7R9LgfMew2zunhWLhCv6SOt0kS1JQuSDveaJ6
         S980ciX4jU3b776LrabI4jnywnQz0lnm91UZEGb6bynW4BhwaAwIX1Z843+D98qnDr9p
         KFO0T4L2gHA/lrKmct0O6HUDZ/juq1o1Ijm2QLbrOsHAt8XXnrl/180LUP3miwgv0avd
         A7nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=8Y2JInxxq3BF5yZ61pBjPVFMuDnWB1KwokFQSejViw4=;
        b=m4ur3RswkOI0cNbtHDu4+YwkdJ5Qnt+i6TOlYnRSh+4CYfY8sHIaf0oY7p9IjloIpv
         7Es9TVD7qZz0UT4pCw4wVzrm68tN8yBXzYEVoM3X8I6qtuo96BJR+B+UKMlQcIJE1vl2
         zbd3dtNfeZjQCJ8N9hqskz6lh3/yHXJKe88SziRbRdpWEpuexxl8rhr6YCILWPPiG/JF
         8B0wfVXMyJHvl2SuE9eS7sxepDFtfk0tHtzI821yoxnHToq1QTtaubOulzQPSde48aHi
         Zbh7kSvgIs2btpA3TijRv0XCLGCRLtBj3kmiRCqSI1krzV+PlqYm7sC4g7B/hmFGc8ut
         0HMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EAaM3Ppd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c18si11346475ioo.20.2021.05.02.13.48.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 02 May 2021 13:48:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EAaM3Ppd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ldJ17-00038r-Ko
	for alex.bennee@linaro.org; Sun, 02 May 2021 16:48:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldJ0i-00035o-3T
 for qemu-arm@nongnu.org; Sun, 02 May 2021 16:48:16 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:47036)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ldJ0e-0000X3-3S
 for qemu-arm@nongnu.org; Sun, 02 May 2021 16:48:15 -0400
Received: by mail-ej1-x636.google.com with SMTP id u21so4892843ejo.13
 for <qemu-arm@nongnu.org>; Sun, 02 May 2021 13:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8Y2JInxxq3BF5yZ61pBjPVFMuDnWB1KwokFQSejViw4=;
 b=EAaM3Ppdu6SALKim2CFiVla5hUHBi1M1QOrbCU2FwkjHHrpiabtisoHM5gjGEmxdgK
 39Ppp8/AiYBtEewOeHuHG5gad4S7j346UYJEK1V3sJHvSDkY3z28blplynS11+sAtGqC
 7sbHyOm0ulVd+bOV8Wuga47B3vSWrBySdtPiBOyUj6VfdPky3QLzjFBQ6GSldBhtbtrE
 +//eJkDN9IjrwByib72/+vr+dQxJQj7j9/mnP+HoM8ypF2t9joZqqO+GIAX8ju0fnS8y
 y3bItbUTgDMZlHiQ61oJtdo1RLkMZ49TX9rMZO/PH+7aeUwPfN/vEPsA1KNVjSj49z/k
 o0WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8Y2JInxxq3BF5yZ61pBjPVFMuDnWB1KwokFQSejViw4=;
 b=Q3kocCkMM1/G4lyh3P+PDvnY8lcDJ9g5LEv4fFRXC9P+dOrDc21QDAIKjwbFOAKIb8
 dbEg0/dLgODulehHl4NRudhZ3arE2U8ZVdXW/9E5z7lNqB7IqTTP3Vf6Um41GggyN3YQ
 6/VfVAZwhBhk3kAUW6PM1eQtJORUl153FQvFSgSV5gOWolXSnKnfUMWX9lgSzEiJzKZw
 P5szeEimoaWeWMlD6R1eoIyj5KvJxu3zDZoM1OVUzKH8eU46gWdLQlqmzq8vwsiN8tPd
 +Jw5aS2+HU2mGOQn208ZK38bkCSkrIC4/oJy/FQqXuBJ/F7KpK3/sWps9y4nuALTF84X
 5qfQ==
X-Gm-Message-State: AOAM530pnMaY1qaGyDJ9E84mXTyumvJEkx0a21J0hk7DK2mmZ2+uHlzI
 qzMgtkIfvSfH7AHTi2GR8n5NlKPFBfQlUBY+SvvjYg==
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr13510415ejh.4.1619988490527; 
 Sun, 02 May 2021 13:48:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210502203121.630944-1-f4bug@amsat.org>
 <20210502203121.630944-4-f4bug@amsat.org>
In-Reply-To: <20210502203121.630944-4-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 2 May 2021 21:47:06 +0100
Message-ID: <CAFEAcA-4i3mu2=n=kiJqixPQLcinJ3uYv7_3e10PEH+Q8vLXXg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] hw/arm/armsse: Manually reset the OR_IRQ devices
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc <qemu-ppc@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mE+Po6G+FkZO

On Sun, 2 May 2021 at 21:31, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> The OR_IRQ device is bus-less, thus isn't reset automatically.
> Manually reset the OR IRQs in the armsse_reset() handler.
>
> Fixes: bb75e16d5e6 ("hw/arm/iotkit: Wire up MPC interrupt lines")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/armsse.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
> index 2e5d0679e7b..a5f8e89950e 100644
> --- a/hw/arm/armsse.c
> +++ b/hw/arm/armsse.c
> @@ -1668,6 +1668,10 @@ static void armsse_reset(DeviceState *dev)
>      ARMSSE *s =3D ARM_SSE(dev);
>
>      s->nsccfg =3D 0;
> +
> +    device_cold_reset(DEVICE(&s->mpc_irq_orgate));
> +    device_cold_reset(DEVICE(&s->ppc_irq_orgate));
> +    device_cold_reset(DEVICE(&s->sec_resp_splitter));
>  }

I guess we should put in this temporary fix pending figuring out
the better more systematic one.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
