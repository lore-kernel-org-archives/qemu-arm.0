Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp922368lfp;
        Thu, 23 Jan 2020 09:25:46 -0800 (PST)
X-Google-Smtp-Source: APXvYqykOrQDWzIIo2LGO03caHYlZHcYwrl7EnbkqNmLTB4oADH2vXo7d/7RaAoOaxluTdZncBts
X-Received: by 2002:a05:620a:661:: with SMTP id a1mr17586630qkh.408.1579800346164;
        Thu, 23 Jan 2020 09:25:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579800346; cv=none;
        d=google.com; s=arc-20160816;
        b=bJaVA4qdFqE33X2YyelTbEp0hXVVimzduxjrJ7Vjj4oyEKvKm++53OHgv7dvksP1Mc
         1T8JF/Rzuw4mzr/88kD8Yhy92I5Zs6qX+F1UZo0EmnZmTeGbO+7NdIrn1bdqZWWSfhCA
         2x4MYIJB17HeIoviJQMQoxTOEDmCNhBfOf4syGliWaGWzaelFl84b42vsdiXNexe8V4Y
         bejWzLmEhgvraWssE6pwN38LKoORy/IQzm4MPcQ1d0fJ7ANZTFLu6nCezp3tr4wipYqS
         ElP9up5QS45nkvwNq9EVX1HgpUxIx+t6pAbe2eqYgRdd/wfhYXBBzBb1Ds+Mnd/H4I1i
         P9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BGSUZ0K3tTXM+Hr2iD1GyUIPRP5aM7N3qL9xhCmhXVU=;
        b=ifogc1zuNM5X8KCkfj2uN2OZKB2OdzJ1pj3SwwyNtKYi7grIxZt6t5MY766bJKMa2e
         oALw/osz6Lh6+gxT7c9reC9uLl8ehx4te7XjLmYCzqHCNam1qqAgWWyFTv9hiZwcC+Bf
         EhDE1RkzfBfIdEvavRcdnrjbGTqt49ZUVnvswIb0mfLu39uocagjeTFcUOMSWai0xG4P
         dZ1ZlOGNGw/3sJkSmMT9dx+26pqUAgVECf27qdGMWnH1cBvIblUTMTVijK+piWyuwdct
         dY3DYAlZnF3j/YcSpwJVfw7J6FViV6uhj9uF/HUWXgvn1GdaGnc5tmLAAdhbCc0CmJKp
         elAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cjAOZDaG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q57si1798956qtq.290.2020.01.23.09.25.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 09:25:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cjAOZDaG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iugEi-0007ds-UD
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 12:25:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39611)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iudtp-000259-Q2
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 09:56:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iudto-00063F-QG
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 09:56:01 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41589)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iudto-00061p-Ke
 for qemu-arm@nongnu.org; Thu, 23 Jan 2020 09:56:00 -0500
Received: by mail-oi1-x241.google.com with SMTP id i1so3122671oie.8
 for <qemu-arm@nongnu.org>; Thu, 23 Jan 2020 06:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BGSUZ0K3tTXM+Hr2iD1GyUIPRP5aM7N3qL9xhCmhXVU=;
 b=cjAOZDaGsgpUTC9UWZvIxEmgdPZnJrqWTSvsi65TaSL430wSwYGyx6kGFthxh1FoXS
 zvkH5l7StTl4lAjZ9IvOGi/dFZ19Wn9hdZKuMkJZ7tF7YE/olOmHajXYpr4aIuZZJgpe
 Sei8HwOvcFv8p3OsmXuxPL2P/ncziAiKUpqgpL/RkN3nve1IQk4KPYl2ag0wPtDEPQTj
 +OdzBK9TmyZe0qnxdx0Fs2YYpz+lUJbYT7T3yc9uRyPM/s7ZgvXhG3u8v9eJQDBkRoL3
 Wj4qsEh5mC4jmxeYIEKJ80sW0vNRI/PgCstpw2s2s+1S31h0jsnpBhPMFs6AXNxqjrPT
 x0lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BGSUZ0K3tTXM+Hr2iD1GyUIPRP5aM7N3qL9xhCmhXVU=;
 b=JCb07vbLo3S609EvZEpoAkzj9bdJifW9/pjAOo41q/mavMLScxKndCcgV14JxEdkia
 Gc3gRz911Y55Hqr8IiuRclYSz2cQIHwCiSjeIInj9vTGegX2SFTroUWFVpvl9GuQsef7
 DUk0wI9hR58o5L5gI9BfAfMYdsvCwiYaOwF9C/3EY+9ooYkD+s5rNqajyjC9Ibcq0r/5
 d8b9/B9cky7J5j4C4+vmw0H7Kob4VLeWyhxVYvtbjBYl9dZ+obXZNi4BccUt/8ION4j9
 VUKj5VFd62JxexzWQ+wzuVKR3zhPrinWc5ynQ1UBAiWtztR/FhrHJ+uWjTv2vQ3S2dPV
 IEDg==
X-Gm-Message-State: APjAAAVOa+eE6THDxMja5XtXk/FlwYVfeEP48Aa0xbaoKe13+rD0Fu86
 JzlAaVQbXst8YDTTDKR38EOG3k3fe2Ffu/b+792rLg==
X-Received: by 2002:aca:f484:: with SMTP id s126mr10361435oih.48.1579791359784; 
 Thu, 23 Jan 2020 06:55:59 -0800 (PST)
MIME-Version: 1.0
References: <20200120185928.25115-1-philmd@redhat.com>
 <20200120185928.25115-3-philmd@redhat.com>
In-Reply-To: <20200120185928.25115-3-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jan 2020 14:55:49 +0000
Message-ID: <CAFEAcA8-aM=B6G-Zin-yEJycf6v1Brhxkn8it30jPDqrKkyWgA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] MAINTAINERS: Add an entry for the Siemens SX1
 (OMAP310) machines
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WM546/XZp1M0

On Mon, 20 Jan 2020 at 19:00, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Add the Siemens SX1 (OMAP310) cellphones with the other ARM machines.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 52fbc18566..27fbe1abb4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -560,6 +560,12 @@ F: include/hw/arm/digic.h
>  F: hw/*/digic*
>  F: include/hw/*/digic*
>
> +Siemens SX1 (OMAP310)
> +M: Peter Maydell <peter.maydell@linaro.org>
> +L: qemu-arm@nongnu.org
> +S: Maintained
> +F: hw/arm/omap_sx1.c

At least as far as I'm concerned this is 'Odd Fixes'
status at best. I don't even have any test images
for it.

thanks
-- PMM
