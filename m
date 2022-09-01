Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp385220ejh;
        Thu, 1 Sep 2022 07:54:35 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4PLOxXcsJwdxy8wOD4oQFSMWx6HLOBqnBBREGXKqHZehSkb/GbG/BLY1SdRULS3ZX7GBgz
X-Received: by 2002:a05:622a:198c:b0:342:fd20:239c with SMTP id u12-20020a05622a198c00b00342fd20239cmr24174998qtc.358.1662044075422;
        Thu, 01 Sep 2022 07:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662044075; cv=none;
        d=google.com; s=arc-20160816;
        b=ozZbUbNOhdeOlffvHBlXap49Pg70+aRP+KNlZbZBmLVphX4NZpjwrDPX+KmXHtbXkj
         xWn96W118pO71eTjMGS6A2oNhdX/vQudE+nBteiD6RTqEmNsrnrxOcSPbN2GIpZs7zeN
         eADTA9THfqGXR+XAuoPqZMQ02aFiwwoaVQfI9pvb4V2/WDNot9BIdAYsetK9vQn1MtP2
         J3jbHLhlahKPVZSU7qhslMGx/q/J3Wspu2gUwvdXVQoWnnQm4t46VhxPUJk6NmfWP2Y4
         giJNnjJPSFfpG0gFo0ag6XPLOMPBxbk1V4cqJpUx9n6NYVQaFqAur0hbpNDIDOmLmAcL
         e6yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=nu7sumbqAfqzuOt6q1DBECNPK61XEbxkKFUKshcSeI8=;
        b=xrDabVfm6jP5zZba2c9dw0WDogcL7PmBPXi2FWalvOgscYfJg0NZ8lQ7L1EbeqTE5y
         0wTsxNRwwW6D/TxruTleexOr0WTUxYvFOeWcJgqBPV6Uu6NmPqHUuDzJMPxs8Ut+jv0R
         pPwRsXVY+GhmJo/qaqKTSQuiISh4CC2NWp+nEmlqviO0GESKZik2g/6UGob5oCTZvUe0
         ULPjc8YpjqjkDC8Y4OpiC5Q8KHLkRCQc5K8hye2R5bKtYQz6rno+bXYsb3jiCBqam8cn
         /KiZADODLOP4EaKhMxZFlOMVpxtBFkhCLOUQzZP13Kv0FWmIV0jcEBWhNIDeuWh6V7sr
         raEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r6E0dofJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v22-20020a05620a441600b006b98ff83cd2si9834334qkp.718.2022.09.01.07.54.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Sep 2022 07:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=r6E0dofJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oTlaU-0001bP-Td
	for alex.bennee@linaro.org; Thu, 01 Sep 2022 10:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTlZs-0001NQ-NR
 for qemu-arm@nongnu.org; Thu, 01 Sep 2022 10:53:56 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:42586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1oTlZp-00028L-4i
 for qemu-arm@nongnu.org; Thu, 01 Sep 2022 10:53:55 -0400
Received: by mail-wr1-x42d.google.com with SMTP id m16so22682382wru.9
 for <qemu-arm@nongnu.org>; Thu, 01 Sep 2022 07:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=nu7sumbqAfqzuOt6q1DBECNPK61XEbxkKFUKshcSeI8=;
 b=r6E0dofJyWlq2h9wKfSnN16jIZVYzRapWfgBy1QQStBI2+fogDzjbxdyWA4m9Ikpzv
 weNQc9Y10j4cilndm0X6HnUAnYK0Hsg2qwlcNveWvT4H5QOClorbPr/1aINS+oiYv8Ut
 I5gAFKjKtnMx4h4OQA9Xu0LCXMR/5RF2dgz7PVTkHg0ko++XHu5oRIfryQ8Sf6CkITlK
 yLP/488GnNn4wdf9+aNU9n3ynzMwMp3EwHx0YSaxoz9V3sIyCavXihlT74HZVAuWGDi5
 6EFKZhhZGOGEDHyq+vaukYBS4XbZtdPng2eqqxceZyirShJ0yYDDOHugsrF8AdXN8R5c
 5pzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=nu7sumbqAfqzuOt6q1DBECNPK61XEbxkKFUKshcSeI8=;
 b=OQiDb8AZs0bwKl5uf3JB5TnivBo9lAKRhzwo3FZs22Z7Ft/6QHmUvm+ZFf09R1kjX3
 QJuyENzJ5CBJRK6CvWMclDZ5ulV+fWMRyet9BRB1smOu/LrGEXakAq4SyQPNvO9ox/UX
 sZaFCnHoowz2h32wjRXiZDDQAaFx6pkZUkMXDhFzA5vGOzZuiFZZn9ZLO9bsYud6VGSh
 8WpGAQznQ4wHOwdpYOCr7BN6PHqzj1akctkG1RsQsDoniYMl8DNXA9H34/+ceSPaiVxq
 dj7a2dZ3x5LPy50iNUE+96Z6r9z5d5kjhA8efyS2elgqr991PyvdXq9eSqblWiIbGP5b
 MmqA==
X-Gm-Message-State: ACgBeo07ErWyXQVFk9OW1rqvUJ0NY9TQUYi4svr0tA0SCfBdOC6SgocQ
 L3q0tTaHL9uzymvmMX+RbdL+Jw==
X-Received: by 2002:a05:6000:78b:b0:226:d10f:1c3 with SMTP id
 bu11-20020a056000078b00b00226d10f01c3mr14054806wrb.149.1662044029795; 
 Thu, 01 Sep 2022 07:53:49 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net.
 [82.27.106.168]) by smtp.gmail.com with ESMTPSA id
 i16-20020adffc10000000b002253af82fa7sm18032231wrr.9.2022.09.01.07.53.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 07:53:49 -0700 (PDT)
Date: Thu, 1 Sep 2022 15:53:46 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org,
 eauger@redhat.com
Subject: Re: [PATCH 02/10] hw/arm/boot: Fix devicetree warning about the PSCI
 node
Message-ID: <YxDHev0qezcjSvxE@myrica>
References: <20220824155113.286730-1-jean-philippe@linaro.org>
 <20220824155113.286730-3-jean-philippe@linaro.org>
 <CAFEAcA_dXgmFeZnrimenE0yMnupM0pWuj5s96vk-sBDmtvZQxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_dXgmFeZnrimenE0yMnupM0pWuj5s96vk-sBDmtvZQxw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: CZnkcu+7HkgA

On Wed, Aug 24, 2022 at 08:33:54PM +0100, Peter Maydell wrote:
> On Wed, 24 Aug 2022 at 16:51, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > dt-validate warns that an implementation compatible with arm,psci-1.0
> > shouldn't have arm,psci in their compatible string.
> >
> >   psci: compatible: 'oneOf' conditional failed, one must be fixed:
> >         ['arm,psci-1.0', 'arm,psci-0.2', 'arm,psci'] is too long
> >   From schema: linux/Documentation/devicetree/bindings/arm/psci.yaml
> >
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  hw/arm/boot.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> > index ada2717f76..527918227e 100644
> > --- a/hw/arm/boot.c
> > +++ b/hw/arm/boot.c
> > @@ -493,7 +493,7 @@ static void fdt_add_psci_node(void *fdt)
> >              const char comp[] = "arm,psci-0.2\0arm,psci";
> >              qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
> >          } else {
> > -            const char comp[] = "arm,psci-1.0\0arm,psci-0.2\0arm,psci";
> > +            const char comp[] = "arm,psci-1.0\0arm,psci-0.2";
> >              qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
> >          }
> 
> This doesn't look right.
> Documentation/devicetree/bindings/arm/psci.yaml says
> "arm,psci-1.0" means "complies to PSCI 1.0",
> "arm,psci-0.2" means "complies to PSCI 0.2",
> and "arm,psci" means "complies to pre-0.2 PSCI"
> 
> If you want to drop "arm,psci" then you should be arguing why
> we're not compliant with pre-0.2 PSCI. Maybe we aren't and we
> shouldn't be advertising it, but you need more rationale than
> "dt-validate complained".

Yes I agree, and that's my mistake. Rob already relaxed the bindings
https://lore.kernel.org/all/20220803201639.2552581-1-robh@kernel.org/
but that's queued for v6.1 and I was validating against mainline.
I'll drop the patch

Thanks,
Jean
