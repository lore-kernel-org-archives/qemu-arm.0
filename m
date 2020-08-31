Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp3918211lfc;
        Mon, 31 Aug 2020 11:54:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmZKkq7cZ8V4d1XZkoTdYjo1WDT/K7UvCrr1mRkzdmnCE6lmRzzJfV346VTNj1/NCAQG/D
X-Received: by 2002:a25:4883:: with SMTP id v125mr3995042yba.503.1598900084587;
        Mon, 31 Aug 2020 11:54:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598900084; cv=none;
        d=google.com; s=arc-20160816;
        b=FvvOHZaTxVI07c/r6TRBj+rlrCQXONFClf4J4XAvfvMrhQw5S+zAZy5DlylXOW4udW
         LXg6QKJZu/WFTYRNbSh/lkVcCUJx97o/h4hO/gnLVkwm3oenXnvbxItEY14t1wsK8Wrq
         pIla2Qj5KSts+0r8MlWgcBNy3soD7gmKyD5K8boFPpLTSu10bLEjDKPOJ3AU/HMVdn+6
         2L+wrukOtlz724Anixrv7drgm6420vX04pXlR76LgD/URjY3/XYB1Jn3NR3W7jut+sGn
         eMoZvIXmH0A+gAovZn9oYJ0znLFkemlO5tH7sS5Md/Buf44zFx6qtHE4JSwlD7357TdC
         uaDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tZG4mEf3mw2LldYqTv17dYwa9Wjjf+ZQLxvryr99ssQ=;
        b=00sEbtFJmdBisKoYrjHUMa2oOfaq5gUCwOZ6mkBpMxQdp1tJG4E8blnwmBpA99MLaS
         bSmED0mbxoRgQbc9y+qIc9R0B3QE9+DXjq8w+9m+U0vc0tnsHyEgs1+BDK94Loe07Lbr
         L4ubeBODcCUvt2Q34YMqxTVUofwqzv4SxfBRw+8ykjLlapLA1zdLYQ8JfoPEZ+curuLF
         ZBkd2D5TESnXMhwLjoRGIPJ3RyaF7O6yRxTV+glF4MWCy4epnn7NiXzBMWdfGk1AQF6w
         uqvTHFqUWl/c1+ciZ1e6Q1EI5wUeZnSp4tQ7Avl3laP78yhHIBT8GWSQzUGTLqzBG1Ek
         XpPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OSFumeiB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p18si11478034ybc.313.2020.08.31.11.54.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Aug 2020 11:54:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OSFumeiB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kCox1-0007jl-UL
	for alex.bennee@linaro.org; Mon, 31 Aug 2020 14:54:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kCovH-0005CG-CN
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 14:52:55 -0400
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643]:41809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kCovE-0000Ls-2z
 for qemu-devel@nongnu.org; Mon, 31 Aug 2020 14:52:55 -0400
Received: by mail-ej1-x643.google.com with SMTP id b17so9870809ejq.8
 for <qemu-devel@nongnu.org>; Mon, 31 Aug 2020 11:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tZG4mEf3mw2LldYqTv17dYwa9Wjjf+ZQLxvryr99ssQ=;
 b=OSFumeiBKc+QoK/T7nH7ZuJ+7ecc4ATRJh4gjXqN+qdiNWXdHBDbAyckzDH4WcfkVE
 7rFiEqxuA7amXuTgWvc2L1RLvkm7WeR80EtwNSFTnJIwYER+tVv98wFUwPJQ22/7ema9
 dtw2r/5eih4LbmzQS+pkX9RuixVahNEdVQjIhSFSFB43mndwCSORBTj0WVkrHMx0GSiU
 HMRsMVkTy8IViY2KlyQoJJeOjHrkhKfvUp96zJ9OtjCXYAQ+ZjRvbHfWXL1Adcchc6T9
 qCyE5q5NZMdUAxkDz7BCWU0tyO/jnlVLJe+wLx4tc8pDF9pgYDrQlnaHpvSevy6VL7nT
 I+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tZG4mEf3mw2LldYqTv17dYwa9Wjjf+ZQLxvryr99ssQ=;
 b=RvXm0ToLrpDZQyQVQ+sa5l9PRrSnTeBxZYj+w4hIumrqHCGjUHV2nSKfaRyVS0QAnv
 UFSoZJBT1GxAfsSqqCJvN8QyErWpM8cWS1E3uL3hkeygw/kKH+fxQjD0fzvHNXhN5m7X
 wPmBajmfM2Pp1I5PFLdipCzV0FooC0nPHy/09Fyv9XWw1rxPRkYVGes2lYEzheA02aXm
 2181kIcaM6YPtwK0Hnj9maPJchT5MP6KFUipICulqKvqsZRWiuDvKGxe5J/uHvJN+3vc
 9Yqh9heYCwTdeahV6KnHr0BIQGpjG5e5gas/e0fxWqm3TbpnrFy7BI/KSbiidWR2Gno5
 Jlsg==
X-Gm-Message-State: AOAM53213wqqYfJIstQB2SjnyPLdll+xecrSF/CKnx3efPgRDgww7hK+
 5O/hOw0ByZRyxZnevPyUJlfJ/ve2G4DHGKFnrKn+6w==
X-Received: by 2002:a17:906:2cc2:: with SMTP id
 r2mr2223485ejr.482.1598899970530; 
 Mon, 31 Aug 2020 11:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200825192110.3528606-1-ehabkost@redhat.com>
 <20200831172314.GA4940@habkost.net>
In-Reply-To: <20200831172314.GA4940@habkost.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Aug 2020 19:52:39 +0100
Message-ID: <CAFEAcA8QawQfy1qOpf5T-Oqj_14cOCfPQVvEh5vL-FAug3pL1A@mail.gmail.com>
Subject: Re: [PATCH v3 00/74] qom: Automated conversion of type checking
 boilerplate
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::643;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jnJCC1mM5gM8

On Mon, 31 Aug 2020 at 18:23, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> On Tue, Aug 25, 2020 at 03:19:56PM -0400, Eduardo Habkost wrote:
> > git tree for this series:
> > https://github.com/ehabkost/qemu-hacks/tree/work/qom-macros-autoconvert
> >
> > This is an extension of the series previously submitted by
> > Daniel[1], including a script that will convert existing type
> > checker macros automatically.
>
> I'm now queueing the following on machine-next:
>
> [PATCH v3 44/74] imx_ccm: Rename IMX_GET_CLASS macro
> [PATCH v3 45/74] mos6522: Rename QOM macros
> [PATCH v3 51/74] arm: Fix typo in AARCH64_CPU_GET_CLASS definition
> [PATCH v3 52/74] rx: Rename QOM type check macros
> [PATCH v3 53/74] rx: Move typedef RXCPU to cpu-qom.h

I've just sent reviewed-bys for these ones. (Wasn't sure enough
about the other two.)

thanks
-- PMM
