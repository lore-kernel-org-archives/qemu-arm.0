Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp959409wrg;
        Thu, 16 May 2019 11:22:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwNkyyvY6A4KNaf0LAI4w538BIPgPLyLXcE2SUS3yk1DMzcy3m6rLIVxycfX1UgJAUOVZNs
X-Received: by 2002:a50:b662:: with SMTP id c31mr53281867ede.252.1558030939502;
        Thu, 16 May 2019 11:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558030939; cv=none;
        d=google.com; s=arc-20160816;
        b=VEjMn7DhmTaVum7VaaoPaVRW7f73+hwfZZazHGwC5OXVBADDn1akQyqzt9PrPEYybr
         V/1cuzR+A7Zx+IMweJpf9taplEoJI8IC80Vcu565auScRd+xcCAF8RRNkEKdJj0hsP5W
         ud8Rdownj7IpblAEpigaddvn6kGQsomeCi1qeGKi5IhZAZ144tQpj8vyiRjfsyE4mPf2
         24OrL+WxYBOuoUpE+cD8iTKt+WyCZEWia2lNSAyCyHlmEC6uoXX9eE/jKoyisbTqroYp
         82s3a2nt92UkGLndgR9enwH7TjrZRQjAXHdjAbbSzKve+50tTl2mO4xh0JrCQ0860ELf
         2fjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=yP/YJD2ElmWGhTgQZR7cGmP8AAs9UlpMfM/kkwaxWo4=;
        b=Gyr9+nx4lCDudA81sumtyPbYIvdhhQ529JSJHeo9K8eRP2xTnh5R043aWwmwTklUx/
         6ARBkWxbjRnYh1RRrX6FJFTgR9MRdsyB8odoVU/Ju6ip8ua+ZMW2YPqwB95Z528dnMqO
         HBHK5YGNoK7Kgwd3brRozGB8tQnDdkLlJP1LST/ohuLrGohkqZQjQXt1cnFOaVBECQRM
         TUK5gn3ONRXeoeCFpFQQ7kyuQPYuJeKsVgXoA7fP1IuXrRQxXiF8vphtjXnzHGLhbXYO
         eS8TcIZay/BrNJO281/CC41jqldd+9x+vLiVeoOZmnD7NgP2y7qM3jUr2B9HE/lQBiJ7
         lEHA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D08g23WU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3si4008796ejj.99.2019.05.16.11.22.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 May 2019 11:22:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D08g23WU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:33737 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hRL1G-0002aF-Jo
	for alex.bennee@linaro.org; Thu, 16 May 2019 14:22:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRL0m-0002Zx-SN
	for qemu-devel@nongnu.org; Thu, 16 May 2019 14:21:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hRL0l-0001iL-SQ
	for qemu-devel@nongnu.org; Thu, 16 May 2019 14:21:48 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45111)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hRL0l-0001ft-Ll
	for qemu-devel@nongnu.org; Thu, 16 May 2019 14:21:47 -0400
Received: by mail-oi1-x242.google.com with SMTP id w144so3226787oie.12
	for <qemu-devel@nongnu.org>; Thu, 16 May 2019 11:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=yP/YJD2ElmWGhTgQZR7cGmP8AAs9UlpMfM/kkwaxWo4=;
	b=D08g23WUtc/A3E2BkR8WeorV3nK+gNYY77HNnQQJTNN0vkUL8SNp0pz2xGcHeQOAU3
	+MgWyS+WKRZYgUEyMocDcF/Yj2OYvZHLYAJ0mjSSiQ5KUtaV0ADBo46gEJnora9/BYPI
	pzKeBtXsg0pC4h7Yab5mDePZoOcoSPzttk8SybVPlzKRJBMdgqqaRehIOy8uMZiu5Ibc
	d6yp3KFZirucwOXe7ZdoXfzSdfxkDFYHkJEDZ4r5Y1vUbu5MeEoyX8Dik9QJDmAsfRUM
	gpZh7Fw22KpR1TE1qQPcyH0hhktIlWewX5e2Vm6JJ+QxDLAArhprJIiPKNrh/m9frYDf
	NZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=yP/YJD2ElmWGhTgQZR7cGmP8AAs9UlpMfM/kkwaxWo4=;
	b=oXn02Qbhrl8RvW9W9sO+OlgJbco09jiOU2oaglIksboLEnX/pxoDVCJwulWb4g3Dcu
	BT8fE/XEfm5C4JHC46fEDOSOEJbMmCAZ6Sos6Jgss1dLuoE8d/5R0EbG55mxHpadcq0Z
	08Ubnqk84P2Bg8IEqZ7fpiZLSOQY1z3IeKCGmbNL7J2zTl2yTM02pyjlJ34fwzbjFIG1
	aJtqVc7OJRaGEQZb36uUZNU5rQlCZiXe0PwH7P2pTFin2p1gTpEeu4RraVRxZ5GXia33
	t56c9Nmnv3zcz2DyEfCFxNESkY17g9U60bOOigKAojsKh6LWLIwb108W0CRDdpg/gjCU
	FgcA==
X-Gm-Message-State: APjAAAWLx0skkxHInNXV8MPSZxesQoPjDRVtsDGhHsRevmdRmpgcVdTP
	4xM+Aeic3dVsdCOEElEKQW2e8dONBDN0HOpUk/OqeA==
X-Received: by 2002:aca:cd12:: with SMTP id d18mr2688422oig.146.1558030906459; 
	Thu, 16 May 2019 11:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190516163857.6430-1-peter.maydell@linaro.org>
	<20190516163857.6430-4-peter.maydell@linaro.org>
	<f56bfa7c-4f77-3200-b3d7-c11d4e9b1558@redhat.com>
In-Reply-To: <f56bfa7c-4f77-3200-b3d7-c11d4e9b1558@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 May 2019 19:21:35 +0100
Message-ID: <CAFEAcA90MLKZBzfM6rerZc+iG2U6Of0fLZxujC5=oxTWcM9noQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH 3/3] arm: Rename hw/arm/arm.h to
 hw/arm/boot.h
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xOHBIJ9Y0Otp

On Thu, 16 May 2019 at 19:16, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 5/16/19 6:38 PM, Peter Maydell wrote:
> > The header file hw/arm/arm.h now includes only declarations
> > relating to hw/arm/boot.c functionality. Rename it accordingly,
> > and adjust its header comment.
> >
> > The bulk of this commit was created via
> >  perl -pi -e 's|hw/arm/arm.h|hw/arm/boot.h|' hw/arm/*.c include/hw/arm/=
*.h
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---

> > diff --git a/include/hw/arm/aspeed_soc.h b/include/hw/arm/aspeed_soc.h
> > index 11ec0179db5..24078fd1895 100644
> > --- a/include/hw/arm/aspeed_soc.h
> > +++ b/include/hw/arm/aspeed_soc.h
> > @@ -12,7 +12,7 @@
> >  #ifndef ASPEED_SOC_H
> >  #define ASPEED_SOC_H
> >
> > -#include "hw/arm/arm.h"
> > +#include "hw/arm/boot.h"
>
> I guess we can drop this one...
>
> >  #include "hw/intc/aspeed_vic.h"
> >  #include "hw/misc/aspeed_scu.h"
> >  #include "hw/misc/aspeed_sdmc.h"
> > diff --git a/include/hw/arm/bcm2836.h b/include/hw/arm/bcm2836.h
> > index 93248399ba0..1b04a0e7fe8 100644
> > --- a/include/hw/arm/bcm2836.h
> > +++ b/include/hw/arm/bcm2836.h
> > @@ -11,7 +11,7 @@
> >  #ifndef BCM2836_H
> >  #define BCM2836_H
> >
> > -#include "hw/arm/arm.h"
> > +#include "hw/arm/boot.h"
>
> ... this one too ...
>

> > --- a/hw/arm/msf2-soc.c
> > +++ b/hw/arm/msf2-soc.c
> > @@ -26,7 +26,7 @@
> >  #include "qemu/units.h"
> >  #include "qapi/error.h"
> >  #include "qemu-common.h"
> > -#include "hw/arm/arm.h"
> > +#include "hw/arm/boot.h"
>
> ... and this one too, it is not required.
>
> >  #include "exec/address-spaces.h"
> >  #include "hw/char/serial.h"
> >  #include "hw/boards.h"

I guess so. I decided I didn't really feel like trying to test
whether all of them were needed, since they're at least all
includes in board or SoC sources in hw/arm...

thanks
-- PMM
