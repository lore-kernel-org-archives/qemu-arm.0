Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4350220wrm;
        Mon, 21 Oct 2019 03:06:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxUu7o2TUngbMmBeZ3T1TY3PXT+52GmA/hwvC7lHYvre90/EhTabHI94Ka4TQzJ5zXRDaBR
X-Received: by 2002:ad4:53c8:: with SMTP id k8mr23020360qvv.240.1571652386304;
        Mon, 21 Oct 2019 03:06:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571652386; cv=none;
        d=google.com; s=arc-20160816;
        b=pSIQ3Nuw1Oe/nVEjkesyxpcweUJirJh0I//e323t5wcwJS4hyunxX6P3SOS4C70A8A
         XJKn7EVW+niMXwWhlZekreuU0pOUD/p20bD4OB/Kk/NevkCwaIrrDE1nEJmivs4OLgMh
         oPZIStZRTThQ8LJNTTj1eUCLDLK+/mctf0N1HmO3zgD82dI6iGlKYstzxQewO2hTesgh
         E18D5bx+R3jVLyLTMTLE7hsFfT300g+ld8Hp/vHGNcfsuF1YWXZrcRzZ6xyCDUNWu/jr
         yup578Zi2SXKSRcG0fsw4E+bE2yqCMSysEub+4TZZOki52JS8olGKTR8vTp3n458IZvO
         GCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=dT7v0dc2XmlbOSGjc2YcIFbasuyFnV2qK9cc5zJHHOg=;
        b=jNgwRJXXleMlYnzM7LUcElObQxP5yevCGU7Oygci47q9iegnHa4ExXaJLaF7DUQ3e8
         VgrD3j7Fwqan7xTkJ28RxXMoEu01lTRoG1qNWzFDhdXd+SPCB+wkF0HHCBszyRwya8d3
         T4rgU9GMZc3M2alToWG9cTCVd/dgDHxH2D+BEUAbHH7go0LYVLZdK8+u8Uf3JMMoodmQ
         aXV0ZvZ/9g3bFTRY3YGM7PxN2yZqVCSdPL+YttWiqcI94PEYt33myXf82JmU6TfFsXfx
         ho7pwUF1SMtIqTV9Nliaq4l8vh/pTuoeGqKWKA7noQD7yfymbpqYH0NcL/lqVESTpxSP
         SVOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oddKX0qT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g11si7024447qtr.293.2019.10.21.03.06.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Oct 2019 03:06:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=oddKX0qT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iMUa1-00011P-P3
	for alex.bennee@linaro.org; Mon, 21 Oct 2019 06:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39894)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iMUYy-00006K-Eb
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:05:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iMUYt-0002A7-GG
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:05:20 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33347)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iMUYt-00029g-AM
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 06:05:15 -0400
Received: by mail-ot1-x341.google.com with SMTP id 60so10483410otu.0
 for <qemu-devel@nongnu.org>; Mon, 21 Oct 2019 03:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dT7v0dc2XmlbOSGjc2YcIFbasuyFnV2qK9cc5zJHHOg=;
 b=oddKX0qTpgHt+ktzDfZO29chm44hHpCAN9OxkMdr01CLwHge1yzw2wBpCuPIjZBq2i
 eciyfy21ImtLIFeKgtK90Jk1k90LVVpWGFMCaCKjxTGOokZ1iWyBgb8VAGsXyd1q6WiO
 h14MOyhEcyuywwV7b8LG0iTfTdT77vMYU98vJlSrUfFbM0ZSxQ3FAmJxhgSz/KihJpQ6
 AgkMajOQPkKsr2WDVxuaIfZ/CP763Jf1v3Ug3RRJOF5d13yR/fWzPq8pNFPt47svIiYA
 esbAP2mbs/4Lm/Da8Vtm8BhgjPNJXRHZlyFoK8+6JyxJjrltHbH5sLa2oC0Kk1Y0XdRz
 Rz9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dT7v0dc2XmlbOSGjc2YcIFbasuyFnV2qK9cc5zJHHOg=;
 b=JxDA1zN17NT0Cvntc2nknom3SqzXt3fu7wjjKm2dCrmaEE1017pWe+eTKpL0Usr395
 0C3EULXJBmaujiL7+HssctDOS+kGfpljk8vSKEcGxMKr/j5BmZ/6F84GiPO71vPvGKCU
 oexT8W08eMy/BMJDnrvn9pJsHXGH3Bzsxm4GXYMJ3Ln/Kaf9kURuLAfXNln8Iyvl1LOX
 IrwvoQ1PDQjLYOekaG4otaFU+GqMpIziTsbiFGVF7pjuO+CKw5OEUowyNmeaShgferqa
 5WgJwo//c0Wa+uPfKogBpImRi/J8ufjTKYLwX/pAkN6p5M1O7n9WUmyIjzO7TbOyiYeY
 SGIQ==
X-Gm-Message-State: APjAAAX1e1VvXqwOQ8LONEwg9Yd6yGq9cUyDrJX10jJr9vvgpwAul23b
 tzBBVnPACYEe1SYqSOT58z5AQGBGjoFq9+EzqIFMKQ==
X-Received: by 2002:a9d:398a:: with SMTP id y10mr17111943otb.97.1571652314434; 
 Mon, 21 Oct 2019 03:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
 <20191018154212.13458-4-marcandre.lureau@redhat.com>
In-Reply-To: <20191018154212.13458-4-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Oct 2019 11:05:03 +0100
Message-ID: <CAFEAcA8a-B7O31MQosSX5kjVZi=1NCr0+=62j6n1DU+ewuN-kA@mail.gmail.com>
Subject: Re: [PATCH 03/14] lance: replace PROP_PTR with PROP_LINK
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>, Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tuHm9HFAh3+G

On Fri, 18 Oct 2019 at 16:42, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/dma/sparc32_dma.c | 2 +-
>  hw/net/lance.c       | 5 ++---
>  hw/net/pcnet-pci.c   | 2 +-
>  hw/net/pcnet.h       | 2 +-
>  4 files changed, 5 insertions(+), 6 deletions(-)

I feel like there's probably a way to be more type-safe here
(eg for the lance.c property we know the linked device must
be TYPE_SPARC32_LEDMA_DEVICE, not just TYPE_DEVICE), but I guess
this will do.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
