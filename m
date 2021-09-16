Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1091578lfp;
        Thu, 16 Sep 2021 05:49:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz3W6MnMjPeLjzIL4mH17XLgWjHm1r/ptEMH3hlOI2tkJLF+jzDgtRJDA6w0UZpX/UEukR5
X-Received: by 2002:a05:6214:6aa:: with SMTP id s10mr4892178qvz.56.1631796591491;
        Thu, 16 Sep 2021 05:49:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631796591; cv=none;
        d=google.com; s=arc-20160816;
        b=nCxEW8XjPxsIvuGdUklOwuXTKtNvFLEy9YshXz6pTjoy/JWRw3d8o+8Jvl4sVpXyU+
         KjRv1yzqTUZFYhLVQER7MfaPV8zsef06Dv8Pa2ScZWik0R26XaZ/UstJfVUsQZ2qtJaK
         pCPqpT/T3r+7/veC7RDhp3aIzyHKBzg6Uw1X/13PwelJQ4VvdzXzgBnQg7Zy3/b/t2i9
         BxDaja7OC82wMJzTAmoEA+++IHHKECVMSfzs4KjPkkv/bF+uAUsIGrWE4srdTnI/LwzD
         YeVzg43sMYN5l6zh4pV7OU1Xt4pT/usGxl14bqD66axDbR0cRFLcf+sKwSTA5H6BS8yG
         InPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=L2Yvd/cgfHZHV5jXl0qKgtBYgx1SM1is6wGI6Lh7oXw=;
        b=d7TV9DM45ly/QSfvRsG0+oH1nlJdHvgThhuMcjHW0y+ZqzyuZdNZTrNGL6F+dF5yxJ
         /D5BwmThM1bi2hiU1s04eHEK7n8WkyZQxiIDPLe5TN/FcsnrPIPiGi8lh6/qa2qJJtLJ
         rhkp6aCqNGxGoHyA7kpj7YqJZDO+giQy8WF7gEipoOy+jEk010sMpBpsJLF0NwW56Pqt
         CntSzO76/XRK6Kv390kvBvrlPjeiHnMBye8Gn+SvM1XNiQ9dp2iZl0IsPrQhuRjeMsBi
         2FS1UTLtVKIf/r9CU7Q67pxABJn3h3qMb32R3sYj9X4X0FBzux36ErxSn6KZRkjr5jSb
         FfyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GFZH7ar4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w8si1633898qto.206.2021.09.16.05.49.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 05:49:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GFZH7ar4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQqpq-000495-U2
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 08:49:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqnu-0002P2-Q4
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:47:52 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36825)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqnq-0003mW-UE
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 08:47:49 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so7280355wmq.1
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 05:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L2Yvd/cgfHZHV5jXl0qKgtBYgx1SM1is6wGI6Lh7oXw=;
 b=GFZH7ar4xtW6OrQgCBwABLE+0JEVHVLxPIpux5FWWUF8/3qhkbiYYdQxSiqAQd41Ks
 BoxQu+cxx28prBeXV+8bWwQqddzuiXpD/j+6rDoh6viEAUm8TfHpi1QdvXDD6dvkjAFg
 gWC1FkHkHf5CnKFcLX6+k8J5+jCAijxKvO/JeABlXSPCdv3CHBw2+AO/NyMLo+Bt4xHt
 wJiU94CW3PUxfkjuCRg5wPlafraM8GC/wD8XpXSQEUDNj/YhFehbVvjKzF6b2KxQKAgv
 o4gVN3woJvF9p/wp5/h9q6IgO3cu8+eW3W2px2V/nDM9MIFFBka9jpL+U725WO/3yPCD
 zhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L2Yvd/cgfHZHV5jXl0qKgtBYgx1SM1is6wGI6Lh7oXw=;
 b=mOehk/fknkwrYi/8yelZ48ezOY3ifiUYLTwh6le6ymv6l01YZlAFvJpApTjRN0zAR+
 d+4uhaOsygX3Ty4gV5uag6eMRyWr5FeEU0YQhFwOVqWXs0g/ckizOrUPSWWC468Z+7h3
 LeNmQiPSUcuYKR6MAtxqCC/qd9YJerzJ5fi0zPjG4yBABCnFxWGVp3J0djQ5YkIW23Cx
 OZjgyiM0wYwR8wRUWSvA6PxbodGqgEstE7R0NWa0Nj3WaeHa0MLXPZSWD1KNhY/4ncLM
 D9m4jc7YMRoJDieuaHxSg7XY3HZYXu63Uuc3A265KUnpiOEDQ7Xq8+lryjpra2LnekUg
 9M6w==
X-Gm-Message-State: AOAM531qOxOJAejxRSxS0b/9Nfh1Hd+zMuaXLJtQZUxIXXmjJm76O9Ii
 WLRPIHuF5HI1DCHISLXZRXAlrUJuSA5sIXwLEvSkmQ==
X-Received: by 2002:a1c:a505:: with SMTP id o5mr4877905wme.32.1631796465207;
 Thu, 16 Sep 2021 05:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210915205809.59068-1-shashi.mallela@linaro.org>
 <4aba1039-addb-9594-924a-4f8650637df4@amsat.org>
In-Reply-To: <4aba1039-addb-9594-924a-4f8650637df4@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 13:46:54 +0100
Message-ID: <CAFEAcA8C3_Yzc7fBvP3Tz=ybZQqnRQ_sOP4EYCJMsNNibH=Zpw@mail.gmail.com>
Subject: Re: [PATCH] hw/intc: GIC maintenance interrupt not triggered
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i30SUT7/Ht/X

On Thu, 16 Sept 2021 at 05:36, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 9/15/21 10:58 PM, Shashi Mallela wrote:
> > During sbsa acs level 3 testing,it is seen that the GIC
> > maintenance interrupts are not triggered and the related test
> > cases failed.On debugging the cause,found that the value of
> > MISR register (from maintenance_interrupt_state()) was being
> > passed to qemu_set_irq() as level.Updated logic to set level
> > to 1 if any of the maintenance interrupt attributes are set.
> > Confirmed that the GIC maintanence interrupts are triggered and
> > sbsa acs test cases passed with this change.
> >
>
> Fixes: c5fc89b36c0 ("hw/intc/arm_gicv3: Implement
> gicv3_cpuif_virt_update()")
>
> > Signed-off-by: Shashi Mallela <shashi.mallela@linaro.org>
> > ---
> >  hw/intc/arm_gicv3_cpuif.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/intc/arm_gicv3_cpuif.c b/hw/intc/arm_gicv3_cpuif.c
> > index 462a35f66e..34691d4fe2 100644
> > --- a/hw/intc/arm_gicv3_cpuif.c
> > +++ b/hw/intc/arm_gicv3_cpuif.c
> > @@ -418,7 +418,9 @@ static void gicv3_cpuif_virt_update(GICv3CPUState *=
cs)
> >      }
> >
> >      if (cs->ich_hcr_el2 & ICH_HCR_EL2_EN) {
> > -        maintlevel =3D maintenance_interrupt_state(cs);
> > +        if (maintenance_interrupt_state(cs)) {
> > +            maintlevel =3D 1;
> > +        }
>
> Or:
>            maintlevel =3D !!maintenance_interrupt_state(cs);
>
> But your style is more explicit.

Applied to target-arm.next, thanks.

I opted to tweak the code to

+    if ((cs->ich_hcr_el2 & ICH_HCR_EL2_EN) &&
+        maintenance_interrupt_state(cs) !=3D 0) {
+        maintlevel =3D 1;
     }

to avoid the nested if()s.

-- PMM
