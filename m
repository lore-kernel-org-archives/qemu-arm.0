Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D1DE92FCB
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 19:39:38 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaJ5K-0005gL-C5; Mon, 29 Dec 2025 14:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4o-0004zQ-IU
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:57 -0500
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nabihestefan@google.com>)
 id 1vaJ4n-0000PA-34
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 14:38:46 -0500
Received: by mail-qt1-x82a.google.com with SMTP id
 d75a77b69052e-4ee147baf7bso3868291cf.1
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 11:38:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767037124; cv=none;
 d=google.com; s=arc-20240605;
 b=aLNnQKSr2SbeAWXpwBAew66pYT32AMxM4DKVyLkrzD8Oi/T30CAnExocWWIeoji/mw
 SO/hoB/ysWA/Rcjqe4tMEAMQJo/whRO9xKQCW69RVMYMpiKev/CWS77CL7jbzTZpwjXO
 V7XsBEO0gFBovp4u4xhvjEX+PiD5jca8IkHlY9NryApdEtBOtuXJot5M3veiNZBZeeSV
 jMywAZj7D9C2Q/fzR5Gls7inCZ/VP5hXYdqOWzA2Aq7N+BCTbTh96AVIdXGYjZERFGpZ
 0yMvTE6f8YaxiVIjelDiXaB5zKcoCSxEaZ2Lu5jUMDnJbLDA8wsve2mxpKlcN4dSAPwc
 LHdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=TjKf2F5ulFPO+H27YnF74bzMVix26xHFciWmteYvCJ8=;
 fh=TcONiIGBdmHBk04Sf+7KZ+p7fePdg4/5Ne8F42rAfm4=;
 b=fE0ld+vfFdoNbDAGmADZAL1o3qbVdCpHYrqxJrwpz/+wzPFi0pO24knM7s4LYCNjNu
 EvwvsD2zq9mKcrkDufARI+TyujP0fzF/ZK8FL6p3aMgglVvCY23QaT4oQJvk3/WpCUq5
 V9SN61/5yZJSUMUaUGb0+XW3eizaZcGd52/zj/ExIV6yhLt+n3KFAQs+G9IKdaZJl+9S
 CCTLOArT2L3WDmhPhNutqLtrlCpdYf4bT+BKQfXZ1bBkranF3OLHMSIcqZ0UChMGv5/C
 2iv9Bz/SGaPk7I4bQBD6RgGX9MPNCJ6TVHJWFhn2QBgDkEE63xvYKm2X0rVvJWt4I9Mk
 3Krw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1767037124; x=1767641924; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TjKf2F5ulFPO+H27YnF74bzMVix26xHFciWmteYvCJ8=;
 b=lqe0/RZRXQ6H+UizkIjAxW0LpaGSYLzKGDjQ6/E8d6pGv1C9U7I4Vikz7nOw206sAa
 G8DYY8Q89d9p2GNaAOqlr48+jmiebIPcIqAJBgqkkDqS/cc2qtagQkfFowaSclTds7sM
 tAAqmUdGK8gawrICRi6473SluCDMSyLA89yZ/d3VHLizIs/hY1XKLg3x7pApMrA/x1FR
 f5xYbykZD2+8gbqs46qy/AxlKHiDNA6N8YnOh4PAGaiE2bXO/Q39/zyUbAcNhd3OaxNJ
 T+Xla7arxD/0dW+Ey8cvMZ1AyDzQ4SHa0Rz/q+/HBd4n58CdU9nG6eGaUjqPJ/EFDUee
 GaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767037124; x=1767641924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=TjKf2F5ulFPO+H27YnF74bzMVix26xHFciWmteYvCJ8=;
 b=jC5Dq1WQXljIzSZ6z5kjgg4HAbDiHYTuxplGsT1mOfaPiAveqiuHr45ifVo6njDL/2
 xxUdE+cCvp7cKKWhlE2Ig2/6pqvSXsUX6lNvNr/yh172lZieLRv8q70QOiB77HNzy02I
 6GtJmDr7sqCGbPFl3bZt6AyL0LMaq6dmERH2uDkIdk4jRtdkOEKAPOVtY+Yw7wed/trt
 PxmOGv3QIySZRZjGK0KeNLjDNpLlfmwhiP7d+/nynld3/mqBAu0I7V5hxVPOJwcTWwoi
 4foGITsUa7fnQ5597DwvMTmR/gJYb1+3LSzNoeN6TbZ1098NXpTy8IAmf03I4htnpEJ8
 IvBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWSOg9A15FFCxv5Qr0Jk59PegO3srO9dAFFV4w50yEs0hchVBkrHoA8dAJ/RjrfM/5BFxTCle2vQ==@nongnu.org
X-Gm-Message-State: AOJu0Yw/R9CCass7CU1HvehAR/eDgbLTJo4q9StBCp2J3LP2jRYs+nzq
 4w+IQz7iWiy2m/2ejNiqRcWxtE1iBvsGwdVpaZCTnh3CHHgWwK21G631bhYuAugu4NytjnhyhLz
 7ZYBrTnaMlxolmye5n8DwckczzazC+bFrolgFBxUP
X-Gm-Gg: AY/fxX62N64y8TrhVIF+twwUD70F47cPdRJO67aZ1ujCjp9YWoegeajQYDYW1SEdFmZ
 cUKHEvQO2cvfJ0z3aBfNMFYQNgPPJLnTDHG+e9NA2sWEQeHdju10fN6+Y6NLgLaIcwNr/OqjgiR
 3Ijju9QPmbjqA9sQ8dugRbM4sZ0px3yEotKKpv4VWVdwgf+FppUQz+4jCF8zY6ap2EQHeIBqhoJ
 RUIiKNala4QOTvkHgDGXixQxIXGPiMdxjtUvrp1Qm/xaVUIYaABA3lVPiieryzJ9+LDCiU+2oNF
 EGpqXEh7Fr0PiuN/C0bsHGzuxg==
X-Google-Smtp-Source: AGHT+IGPk2F+0ZlqQ6FyuiPXDvTXxNn5HD5/vYJk2ILuWsUH20DkcoIJl6NjEF9QLO8cz9N3KNvZTAblzX2g54rrHp0=
X-Received: by 2002:ac8:6216:0:b0:4f4:e645:2b6 with SMTP id
 d75a77b69052e-4f5fb649f7amr16613031cf.2.1767037123749; Mon, 29 Dec 2025
 11:38:43 -0800 (PST)
MIME-Version: 1.0
References: <20251224014203.756264-1-kane_chen@aspeedtech.com>
 <20251224014203.756264-20-kane_chen@aspeedtech.com>
 <cf900ae1-e631-46ef-9552-2860a5b25ae6@kaod.org>
In-Reply-To: <cf900ae1-e631-46ef-9552-2860a5b25ae6@kaod.org>
From: Nabih Estefan <nabihestefan@google.com>
Date: Mon, 29 Dec 2025 11:38:32 -0800
X-Gm-Features: AQt7F2rw3SDKVve6HL4JYOSyEqLT378lZmW8Be883PN0QIJx6I2_Q5p0bQ5ZEh4
Message-ID: <CA+QoejVxYxWKXhErGRrybso2gBNxPZOdp89C0q9_Pfti=fsMyA@mail.gmail.com>
Subject: Re: [PATCH v4 19/19] hw/arm/aspeed: Enable AST1700 IO expander support
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Kane Chen <kane_chen@aspeedtech.com>,
 Peter Maydell <peter.maydell@linaro.org>, 
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>, 
 Jamin Lin <jamin_lin@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Joel Stanley <joel@jms.id.au>, "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, 
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 troy_lee@aspeedtech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::82a;
 envelope-from=nabihestefan@google.com; helo=mail-qt1-x82a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Dec 24, 2025 at 2:43=E2=80=AFAM C=C3=A9dric Le Goater <clg@kaod.org=
> wrote:
>
> On 12/24/25 02:41, Kane Chen via wrote:
> > From: Kane-Chen-AS <kane_chen@aspeedtech.com>
> >
> > Set ioexp_num to 2 to enable AST1700 IO expander support.
> >
> > Signed-off-by: Kane-Chen-AS <kane_chen@aspeedtech.com>
> > ---
> >   hw/arm/aspeed_ast27x0.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/aspeed_ast27x0.c b/hw/arm/aspeed_ast27x0.c
> > index 0807481162..2eb857b8e0 100644
> > --- a/hw/arm/aspeed_ast27x0.c
> > +++ b/hw/arm/aspeed_ast27x0.c
> > @@ -1260,7 +1260,7 @@ static void aspeed_soc_ast2700a1_class_init(Objec=
tClass *oc, const void *data)
> >       sc->macs_num     =3D 3;
> >       sc->uarts_num    =3D 13;
> >       sc->num_cpus     =3D 4;
> > -    sc->ioexp_num    =3D 0;
> > +    sc->ioexp_num    =3D 2;
> >       sc->uarts_base   =3D ASPEED_DEV_UART0;
> >       sc->irqmap       =3D aspeed_soc_ast2700a1_irqmap;
> >       sc->memmap       =3D aspeed_soc_ast2700_memmap;
>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Nabih Estefan <nabihestefan@google.com>
Tested-by: Nabih Estefan <nabihestefan@google.com>

>
> Thanks,
>
> C.

