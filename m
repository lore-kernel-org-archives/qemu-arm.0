Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1039811wrm;
        Thu, 17 Oct 2019 07:38:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxDnH9AOKl9LjWJxWHEvj+Xlrg2UEwusUE0n2EyBvNMFOQPloYDj7yKHId4yShWsZytft1J
X-Received: by 2002:a37:8185:: with SMTP id c127mr3523198qkd.420.1571323087309;
        Thu, 17 Oct 2019 07:38:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571323087; cv=none;
        d=google.com; s=arc-20160816;
        b=Z4p/Cv+/oJm5Q98fEAvlyiyDBBMc1NJE/e9i8WhDjjdq+XvxSmWjFi5YPi1JV4vm+L
         yp9B/g85iMHpyesyRW/V3t2ITURhS2L3FG0bd1GS7JQh8PoySWF8xK2T0OIMmqrqzlwa
         vptap0I0m7gUcXcbAyjeJWN9u8/VJfRngb80fM5MM3qvDEjv2tUByLbYWuij4yySq9RQ
         jvJC8UInANjIO2JY22Vhj8CHGvt2CX24AQ0zD1SScpq4otTak8xrUIfFmnyhpKhjK9bL
         ECuvJas3XDybIp7gQJM+O96lSlFrgkSozRQMNpVSndXFj1L9PmU3dIEUXQXpbs5pf395
         VnUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=IX1tG7Jw/XnjQLIGLFO1DNvERo7K99yeCr4zuiNJ0l8=;
        b=xRCtmUXlt0gBGzWJDGWrlrCzLGEPCfselBzaODnFRR0yEODv+hX1mXTDVEciKvAETr
         sokf1bDYlYAJUDHdtliORlE9pKLARy1VRa/pnND3B6l26/PnR5xin0zERhIzyVJwOAHG
         VfciJyajiY/s6dfwBiyReKKYRC59Ce0hlm8ZkVU00ijk8Q5uFcm4GbqsanNmA3dFblAG
         oFWqewsRzR/yph9ivrLFEAqIiIw0G5IC13UbO+JIrmDNGw96Qw9XrPnZhMYorJPTiE6K
         HWGnT7nQmoQQZd/X2exTFO3UgZoh/rxWRgaion38CNpT7/wvlON53VWH/9pmuvmSPyDh
         Uu0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E+QdpjK+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3si2349300qkl.170.2019.10.17.07.38.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 17 Oct 2019 07:38:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E+QdpjK+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iL6uk-000668-A7
	for alex.bennee@linaro.org; Thu, 17 Oct 2019 10:38:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41091)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iL6Ep-0003u5-Hf
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 09:54:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iL6Eo-00040S-Dt
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 09:54:47 -0400
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44]:43252)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iL6Eo-000407-9u
 for qemu-arm@nongnu.org; Thu, 17 Oct 2019 09:54:46 -0400
Received: by mail-io1-xd44.google.com with SMTP id v2so3049947iob.10
 for <qemu-arm@nongnu.org>; Thu, 17 Oct 2019 06:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IX1tG7Jw/XnjQLIGLFO1DNvERo7K99yeCr4zuiNJ0l8=;
 b=E+QdpjK+mwsXOh5Q+wX7L3eXaC2nKtqQ5FiwJw6RF9YIX/FLhGUhoTYEPMrHrAIF+p
 37KlnnrFPnB+bvAj+WheNq0YaoBbI50rCVoSa7BdJwSuH93iQOc3abPt00F2+TPgcy7J
 6gPJYRVoX1yV1OOCz0A5XCsXyoZYhcA5eSalm1EPwGACQ4SGJo77N74mBrdl8lYqo7hf
 3AysTukaiav3Fdm8qRPYmeHTjS0fphMJOlC1MPz3AB3YQfWXw2yn4+INmMJnasGotqNp
 xtOi7p74kHgw4UPrXhGEwLY4o2t9w5ePEcJ2Vb2xo8IRnmDa61sSwlPLk0MsbEfmxjPT
 us+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IX1tG7Jw/XnjQLIGLFO1DNvERo7K99yeCr4zuiNJ0l8=;
 b=FuPvY5EwM+eW4Ms3fS+qPZRSxX5BXSQlfaO7fwWZlqV9Iw6v9Y8n0AoqOLFPoXhsMi
 N6epLxyWiQexFJwWhGnyssXEh4mWN9PlaiCRM7t3QtxzzB8EUn1GddXgJpZNWhltywI6
 TqaRnXNuERR/afa9TJy2xNMN5xAF02m4K6M+eYzVgLxWfYpoYjv26eEa09o4T/T+0qxP
 kWybhtoN5y6cNuppFMLl8Qs78FNy7D9zCFhJZGeLOA+wxAy3PJRZ+kvcwhEfZ2wubpsZ
 8w8Y9UNvwOwmJChx4NSw5beBphk2df+owkui6IlFk25Ho0zvO369aIQfuE9BoDkvhILB
 l1kg==
X-Gm-Message-State: APjAAAUFhKrMFbjhKshcBh4AXGwtO9mr0C1KJJBvSmqsS+xgwmZjKArT
 tESDMfQhG5uytyZuYk3+gwyS8mSvHPvfcguM+TYjXn/+5N0=
X-Received: by 2002:a6b:6405:: with SMTP id t5mr2939472iog.93.1571320485481;
 Thu, 17 Oct 2019 06:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20191016090745.15334-1-clg@kaod.org>
 <CACPK8XdT0_JCxzfxd4dCafK0Ae9+18ZWcusuXV+d4eEmwwBnkA@mail.gmail.com>
In-Reply-To: <CACPK8XdT0_JCxzfxd4dCafK0Ae9+18ZWcusuXV+d4eEmwwBnkA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 17 Oct 2019 14:54:34 +0100
Message-ID: <CAFEAcA_6yxaanT2N6Twos_FxjJNgvVKShwgq=pR4fqmcZUsQFA@mail.gmail.com>
Subject: Re: [PATCH] aspeed: Add an AST2600 eval board
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d44
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L8af73iY+M9A

On Thu, 17 Oct 2019 at 07:33, Joel Stanley <joel@jms.id.au> wrote:
>
> On Wed, 16 Oct 2019 at 09:08, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> >
> > Define the board with 1 GiB of RAM but some boards can have up to 2
> > GiB.
> >
> > Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > Reviewed-by: Joel Stanley <joel@jms.id.au>
> > ---
> >
> >  Changes since AST2600 patchset:
> >
> >  - lowered the RAM size to 1 GiB as it was breaking the tests on some
> >    hosts.
>
> Peter,
>
> After chatting with C=C3=A9dric I agree we should merge this patch.
>
> As it turns out the EVBs have differing amounts of RAM; his has 1GB
> while mine has 2GB. So we are not being inaccurate by setting 1GB as
> the default here.

That's convenient, means we don't have to figure out how to
special-case the test infrastructure for it :-)



Applied to target-arm.next, thanks.

-- PMM
