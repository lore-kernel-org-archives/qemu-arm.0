Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp439763lfb;
        Thu, 9 Jun 2022 06:30:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2oz7v1xt5stTnFpmhQsDJca6RnM1lwzSgN9aOHwo0OIjKH6WzSoPY1JxMjHOutzNtTXNr
X-Received: by 2002:a05:620a:4102:b0:6a3:5f1c:f9d3 with SMTP id j2-20020a05620a410200b006a35f1cf9d3mr27174405qko.672.1654781433171;
        Thu, 09 Jun 2022 06:30:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654781433; cv=none;
        d=google.com; s=arc-20160816;
        b=pzYH4J1ac50jpaAphz+Q9W0zw9KTDKsfwEPnt8bdtaMW6ltgwL6iYwxmNGt6AOeKiO
         F0CuCWa/4gSrQ1d6HUcEC6iADGq2PIjAplshYkROb4zg3nCiTG0uoNGfu+oZzZZk91F5
         WrW0sctFIwwKXuo5qSJpZKe51poRztPgQJS59cNprQ7XRVQx9bumglfAsu1Uuxes6fNx
         vZK7Pa+n/BmIh20MbuqekyoToON3oCdaaCpnPbF90p0sfckjC2R8vLwi2vhPWPc4YqnN
         CsHTpDiHXbO+rZMhyuj7LGmU2XgA/QNmb7tfAzc+7s1cj6ma/rhrVkp/z36D78LUVxD/
         FvTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Wbbhcz3Uo0bsjp0Ed3YVyYPm3yMkjIjwGUurybx4Lpk=;
        b=kxYgIPi6Rj/GZFhstb1hcdIyhbYArEYGZGaPdsv4sS6AIwYIxW4lriR4fhOS7sixVB
         U3B74AEqrXAFkBVJkRN5rsB7/c2GYUrb8c51YWabIY2KSi6TwRP7Nvlv8nR/UWmGXPb/
         vQn1gPtxpJgrdHF1/CYN2kIUfKTH5U87HS1y3JMVcD+OSKdn1TITlwNdpkm673Ry05xC
         zoyCS/avRc9bL6hIJF8UQr4WGTzmvvzrRDa2oUf+flWYXHKDlp4/GfjkOGdqvxJW4Ucl
         q+9Q5jniUFeCPxoQSfvHyawhI89s0sKtpFj93/xZuW0du/gJvKqUfTXFXbIyT1IpZ7Rv
         3VTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ks4h5Btz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17-20020a05620a12d100b006a69637cb2asi9302240qkl.467.2022.06.09.06.30.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 06:30:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ks4h5Btz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzIF0-0004ow-UO
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 09:30:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG7T-0006iO-Q7
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:14:31 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:35054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzG7R-0002Yr-IP
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:14:31 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-31336535373so86458577b3.2
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 04:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Wbbhcz3Uo0bsjp0Ed3YVyYPm3yMkjIjwGUurybx4Lpk=;
 b=ks4h5BtzKJbhJNEs3n9ssvIuMOZ09P30Vhbv3j7l8g9wuk5OGxu1PTcTZC0Q3pgloh
 9R4dWlwMiB8tl6b1ktCF8MfuAmrW8sjUNFjHY6F012nUIexmMP+N6j56LmhLxt34vbNo
 lcBisijqFB7j/alek+wqYBftgfmMMPK0zOIGWIXyNlqWEbX7zyY4bUskCs6/Fw21/hcA
 Kp5gBMBpZl3u12KoPAHaE8th2iH1c81NhslE5nbkKZozTaFD1ZwEAO0uN3LAt7aJ7Aco
 z9z9YovZrGaF0OxEWEPmXc936rWkp5MPKBa9OTNkkQWDxRuZJKhhtPfSDlVP/hHA9pl2
 yOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wbbhcz3Uo0bsjp0Ed3YVyYPm3yMkjIjwGUurybx4Lpk=;
 b=R+Ntl7lW3IC0XihNwJSym+zSgeFvSgt2j5Nxo83ZCjMUZdpXVUWsDRfCNv8wzJ47RP
 SL6TWooMlEaRJHZvWAitqjHUlfRzAMyByoKEVNTCh0kV4vVDk7q0lBL7IMDq9YB9kVlN
 nRl0xsOOu3xoJfx8lUijpTv2aCBCgr/65JWc0o2u9uJfQrkL8CNZ0hpwhKG1oK0QMnNK
 wMIhwh6Ebz6uDbEFSVM0ltNao0AZtiUqFqieUzP3A4u7fbJC4ZdUtUjA/DM8jjEDQClj
 AnlclO46Ne2Xsf+q58T87gpTeoo4kUIQfQpWCT22YCTOw/6WEOjizjTtEZJnb36oHiKB
 mu1Q==
X-Gm-Message-State: AOAM5325VF9Zl2/npjjbWbJY/WX24JUulRDTrUbniOq0uP0FNdviqIRa
 O7jDmFA8F5P0sLmxforP7KRCcO1kvY97iedeC5VuwA==
X-Received: by 2002:a81:6589:0:b0:2ff:e11d:3fb3 with SMTP id
 z131-20020a816589000000b002ffe11d3fb3mr41886972ywb.10.1654773268587; Thu, 09
 Jun 2022 04:14:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-45-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-45-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:14:18 +0100
Message-ID: <CAFEAcA9stboAQQqbucusU943QadekF5=w4coDqbr32TpsBrF5g@mail.gmail.com>
Subject: Re: [PATCH 44/50] lasips2: implement lasips2_realize()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WkvA3ThzDfQ6

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Move ps2_kbd_init() and ps2_mouse_init() from lasips2_initfn() to lasips2_realize.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/input/lasips2.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/hw/input/lasips2.c b/hw/input/lasips2.c
> index a7c7192c07..6849b71e5c 100644
> --- a/hw/input/lasips2.c
> +++ b/hw/input/lasips2.c
> @@ -256,13 +256,17 @@ LASIPS2State *lasips2_initfn(hwaddr base, qemu_irq irq)
>      s = LASIPS2(dev);
>
>      s->irq = irq;
> +    return s;
> +}
> +
> +static void lasips2_realize(DeviceState *dev, Error **errp)
> +{
> +    LASIPS2State *s = LASIPS2(dev);
>
> -    vmstate_register(NULL, base, &vmstate_lasips2, s);
> +    vmstate_register(NULL, s->base, &vmstate_lasips2, s);
>
>      s->kbd.dev = ps2_kbd_init(lasips2_port_set_irq, &s->kbd);
>      s->mouse.dev = ps2_mouse_init(lasips2_port_set_irq, &s->mouse);
> -
> -    return s;
>  }
>
>  static void lasips2_init(Object *obj)
> @@ -292,6 +296,7 @@ static void lasips2_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>
> +    dc->realize = lasips2_realize;
>      device_class_set_props(dc, lasips2_properties);
>      set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
>  }

This is a valid refactoring, so in that sense
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

but I'd prefer it if we just broke migration compat for this machine
and converted it to use dc->vmsd rather than vmstate_register().

thanks
-- PMM
