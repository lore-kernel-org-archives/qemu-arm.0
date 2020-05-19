Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3539214lfb;
        Mon, 18 May 2020 17:40:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxneQtd8QMmtNPJZgflamwV3yq7PJDy5y2rMHjlYcLPcyjvjHJ5ePfCoOl0qEEZ9rR5Tg2R
X-Received: by 2002:ac8:670b:: with SMTP id e11mr19953102qtp.365.1589848855010;
        Mon, 18 May 2020 17:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589848855; cv=none;
        d=google.com; s=arc-20160816;
        b=HBtPRBrFqSW8OJ8cRi9LOtxzu9VQgErnbpqbz4HhgT3fU/SLQ2hw7cLoRKR8YN2wFw
         edkprTO1BDDF7izhkvhi0ghJ1VA4RUwI//kUcuaFNoiAsY0zPKpPGNujJgmlNq+VGGfW
         FQWSdrrzdXLqmMZqdvqSK2iAYV43+ATabXjhbbviEN0vd2tt1/QeptzThl34TIKH9yMk
         gc+rd41C8kQX2jBUbi21+kaz7IY7FabhsN1OyhMHY9hkGBZu0iyf9CUQ6jqex92DbE9I
         JZepWfUySjg/wB56qdIINjJbVRgl3q94L7KEFGH2DNMl7ky57QpnZSKn6vRjlTG5ZvNC
         Z+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=k2Zs4uU66rBLlRwIdnw2zZdEU9sfm8kTZjMAiamRZOE=;
        b=muRaswlhRPPD7fI+k/qnIf0lxHVE+PNj6dfNzzhaxixIhtILX/wrHhAagKvtEO/yDO
         d0xqLhfTV+AH9QP2n9kTiXsZMwiWGfRRIR58SmBIsG4PXIQUEbHvWivzg7pOqQa7/585
         LnZFfBlF6d3xXkNcFeSx8uGW3cKr/D14LmoHUMvVJJAgIUaqcN642OMuxC2j8aEmRVv7
         6HB4+ruZ668xu88cv64A7wt0UETi3MuSSt5ADmV2uCPY+K/0I8tbNwWiKS+ID/F49dtx
         mp2iS1Uj1HH56MwJQfWCDSbYvKheAj70c0fKPvytisZrse05D5Fjs/7y66mng6xG+c4i
         Rkew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=DfkdIwDN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15si6430798qvx.36.2020.05.18.17.40.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 17:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=DfkdIwDN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jaqJS-000627-B3
	for alex.bennee@linaro.org; Mon, 18 May 2020 20:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jaqIo-00060Q-VP; Mon, 18 May 2020 20:40:14 -0400
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541]:34926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1jaqIo-0004an-7K; Mon, 18 May 2020 20:40:14 -0400
Received: by mail-ed1-x541.google.com with SMTP id be9so6014188edb.2;
 Mon, 18 May 2020 17:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k2Zs4uU66rBLlRwIdnw2zZdEU9sfm8kTZjMAiamRZOE=;
 b=DfkdIwDNnrWa/zQZpySq44dejwikghiFrAN4dtd2FzmlKyfCRR4gUk4gMaros/NdWH
 xon3l/fUHHzd1bxwXjtacbwnaUQ9J1VkDipru8W9RGzevcIJc1gjRp/zer7mhOXTLhjT
 bNq27ErJCaQ3szGIwQubWMFxDnjyzaXz7cTu4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k2Zs4uU66rBLlRwIdnw2zZdEU9sfm8kTZjMAiamRZOE=;
 b=ZusroeKQbhKKnSU7z79cYUT1qkyKgnaqr4NlSybJZ7xpP2ES/dY9XschrPMJZPzcFK
 ++EYAQEP4LYuaFOU/zG5m1JN6Flh6deDw4j+ozDaUr3GFvzq/v1E81+cMVES1QVu46Em
 i3LVHGG7U6fsoW+NVxDpECx4mhi7WCCGNcHeuE27lIaW4x30WX0Dg0PyOMbZWZfDujJR
 MeKjU2/UtxqmyO7A/bJ7Bd3kiImEeljt8j16aAneUvpzAZ1wgZTJLFx/k0JVDmQoFxXL
 TVGy11B8OUlxHRzNCGbg83/6rcA/n8N4AmTbkwfJJL/6NmLHGxxjXzSZPHHlS5smGw5F
 MLSg==
X-Gm-Message-State: AOAM533i/TmQThurpw4i5fyWQmGUQI3Ov7vm1m2KLsdZfXHsiZkhfNbW
 iELQ0ZSaLqNExtCVMqoPaH2wHO/Vb2l+iiS5dKQ=
X-Received: by 2002:a50:e444:: with SMTP id e4mr15501058edm.191.1589848812480; 
 Mon, 18 May 2020 17:40:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200518050408.4579-1-armbru@redhat.com>
 <20200518050408.4579-6-armbru@redhat.com>
 <fbd7151f-159f-7568-77cb-7ce86f4948ba@kaod.org>
In-Reply-To: <fbd7151f-159f-7568-77cb-7ce86f4948ba@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 19 May 2020 00:40:00 +0000
Message-ID: <CACPK8Xf+Qf0BkOiDWj_wKXT-yF+2N0Ton01Nq7Xm5yie+fqqwA@mail.gmail.com>
Subject: Re: [PATCH 05/24] aspeed: Don't create unwanted "cortex-a7-arm-cpu"
 devices
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::541;
 envelope-from=joel.stan@gmail.com; helo=mail-ed1-x541.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, berrange@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Markus Armbruster <armbru@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UnONpxecULs2

On Mon, 18 May 2020 at 12:24, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 5/18/20 7:03 AM, Markus Armbruster wrote:
> > The number of CPUs is controlled by property "num-cpus".
> > aspeed_soc_ast2600_init() creates the maximum supported number.
> > aspeed_soc_ast2600_realize() realizes only the wanted number.  Works,
> > although it leaves unrealized devices hanging around in the QOM
> > composition tree.  Affects machines ast2600-evb and tacoma-bmc.
> >
> > Make the init functions create only the wanted ones.  Visible in "info
> > qom-tree"; here's the change for ast2600-evb:
> >
> >      /machine (ast2600-evb-machine)
> >        [...]
> >        /soc (ast2600-a1)
> >          [...]
> >          /cpu[0] (cortex-a7-arm-cpu)
> >            /unnamed-gpio-in[0] (irq)
> >            /unnamed-gpio-in[1] (irq)
> >            /unnamed-gpio-in[2] (irq)
> >            /unnamed-gpio-in[3] (irq)
> >     -    /cpu[1] (cortex-a7-arm-cpu)
> >     -      /unnamed-gpio-in[0] (irq)
> >     -      /unnamed-gpio-in[1] (irq)
> >     -      /unnamed-gpio-in[2] (irq)
> >     -      /unnamed-gpio-in[3] (irq)
> >          /ehci[0] (platform-ehci-usb)
> >
> > Cc: "C=C3=A9dric Le Goater" <clg@kaod.org>
> > Cc: Peter Maydell <peter.maydell@linaro.org>
> > Cc: Andrew Jeffery <andrew@aj.id.au>
> > Cc: Joel Stanley <joel@jms.id.au>
> > Cc: qemu-arm@nongnu.org
> > Signed-off-by: Markus Armbruster <armbru@redhat.com>
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
>
> Joel, Andrew,
>
> Shouldn't we enforce a default/min/max number of CPUs of 2 for the AST260=
0 ?
> That's the SoC definition. The fact it is configurable in the Aspeed mode=
l
> was nice to have during bringup but we are now done.

Agreed, we want there to always be two CPUs for the 2600.

>
> Thanks,
>
> C.
>
> > ---
> >  hw/arm/aspeed_ast2600.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/hw/arm/aspeed_ast2600.c b/hw/arm/aspeed_ast2600.c
> > index 0a6a77dd54..6ffa587a7f 100644
> > --- a/hw/arm/aspeed_ast2600.c
> > +++ b/hw/arm/aspeed_ast2600.c
> > @@ -287,6 +287,9 @@ static void aspeed_soc_ast2600_realize(DeviceState =
*dev, Error **errp)
> >              return;
> >          }
> >      }
> > +    for (; i < sc->num_cpus; i++) {
> > +        object_unparent(OBJECT(&s->cpu[i]));
> > +    }
> >
> >      /* A7MPCORE */
> >      object_property_set_int(OBJECT(&s->a7mpcore), s->num_cpus, "num-cp=
u",
> >
>
