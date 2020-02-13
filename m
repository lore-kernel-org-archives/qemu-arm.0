Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp640912lfp;
        Thu, 13 Feb 2020 06:01:45 -0800 (PST)
X-Google-Smtp-Source: APXvYqz83GCV+AxHWU7gEDSZBcwzbtM/xegVn6X5uCz3eCZuKdtr6uYI4/r5srK7vrEsNo/aupXD
X-Received: by 2002:a05:620a:16d3:: with SMTP id a19mr10989866qkn.427.1581602504961;
        Thu, 13 Feb 2020 06:01:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581602504; cv=none;
        d=google.com; s=arc-20160816;
        b=EyYOXUDnn4yqyqjag6198Ud9sV4Dm+LW7cMGhcAW+ua01Odv1YW85Lr95hRxBw/L8n
         fjg76QvjMpa1ujqw6sIhuiw7F73qFDNcvvvqK3lV+8kML8nftuiQNb721h9yMhRk7+CJ
         +TpAPAwU9hAaKFjgCeQUHnVZZ69b4JQCtC5JgEOhkE4tQMl/IQurTnKhlBvWyLMh/Bi3
         mJen5NepKFVfXaD4cyFn9971367QmDccOz9tK5vgL2RvM2CcSTQ35Qhm9pjFSU/vz7Fi
         iW4Wmc2zjEez7uM+DvZwvCPiHVsoHBahlkOMKa2j03YZgVerHA8W3lPWtoBXXQ7nFOvx
         Rozg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3D+BOc9yngWvSSbXBA6JOzlerIO/fYcLBPTETkaebEw=;
        b=kCtmV74qQ/KJNUGMY0RlOUZvkmjk+MZ8hqcQ6nIsR23d5sVW78L2fUgqE+l0gHD3Tl
         twOw9KgydybKOlk7s2wdwu4XYkBaJUxMMEpRcSHQJHwaxLYixnVHs05/4uUkIokw41RB
         SqqjcF/Y4vNG3I9rl/JxVVmrvWc5rHg2BfIYi1uJarEGu1Pr6ccrO1841T3ePI46Eqrs
         26bCvQyG02zOw2LSwzRWKTLiH1cVsc0iWan8G7aV2RH4Me1KTql2ve7c7Y0y2VJc3WNn
         9gzWKBVj66GMoriaXJa2tGTFklezP9zL4lLLPEgH4cTJCSEMFtEbBuT75crPa4OutjOV
         zmMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lDJFbqgg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y82si1337691qkb.103.2020.02.13.06.01.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 06:01:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lDJFbqgg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2F3o-0003oG-DH
	for alex.bennee@linaro.org; Thu, 13 Feb 2020 09:01:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52692)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2F3A-0003ln-Iz
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:01:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2F39-0007Xm-DR
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:01:04 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:34504)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2F39-0007XT-8W
 for qemu-devel@nongnu.org; Thu, 13 Feb 2020 09:01:03 -0500
Received: by mail-oi1-x241.google.com with SMTP id l136so5854006oig.1
 for <qemu-devel@nongnu.org>; Thu, 13 Feb 2020 06:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3D+BOc9yngWvSSbXBA6JOzlerIO/fYcLBPTETkaebEw=;
 b=lDJFbqgg7jQsSiojonamh1KVfRY9eg6vFs/kB2Bebhzacrmew3ERepPDXsD1IUbUfq
 jv5L+4t2GPifVX4J77vPCVNO8n33HRSB7rRQ3d7Zppai7k+E+MuaLz+uV4bKPA8fdIgB
 wJeZYfar84qA4DRYx2MGxdQBk047LL2QacLtmOdXnwq1NJo9XVR6vmyolowtSePQg8Dj
 Mz8lsTpUFlgjBXhANaZtxUsMQT1HRmVJAWtkdUNvyiVmfMal1vsDQmpnrg3RmCij/a9P
 7KncaYA2YdtyQ8LP4wWrNrTA0WDOfnYY+fhffjDaDGt2KD81qD0R1mexYfq1CGk03V/k
 h+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3D+BOc9yngWvSSbXBA6JOzlerIO/fYcLBPTETkaebEw=;
 b=rSM2MyblU2CNEZ+2ApfWgimqVw592vzU3HI4EC60NDF9hWwAcEaoBG6adRBt8ko+Jr
 f6az8sMKhWFVwQVs74sudblBRF3oV7N73L/oKjIePa87cB6cfiZBQGVH+ziQxFnJXLpb
 YG8bLAiKaJhGU7ejnzeFUg7+2w07a7utejd/PAV5oE0AxxG+vvRZX4w+5ElwAPcO20/y
 pC3ZA36CbOjYrPGV5e5hpVXoWGYMiXaBaVi3DcWaJHG6EnMnNRixbDw7VhZD0MqxriO9
 PpzxZG26hfYQjJ060khm9C03h4FhbYjn2Up7xyazoYIJ1n97ePyj6A7nD/OLv3PPrIqA
 vDgw==
X-Gm-Message-State: APjAAAUx7ggr0ttZ0+TlJk/2YWfCzJp59J7uqpwkoILAtXBRWeYOEWPn
 W6qs0rsgmV09bUMQwb6Xy7f3Zfh2hiDSrVUtR9JevA==
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr2872492oic.48.1581602462453; 
 Thu, 13 Feb 2020 06:01:02 -0800 (PST)
MIME-Version: 1.0
References: <20200208165645.15657-1-f4bug@amsat.org>
In-Reply-To: <20200208165645.15657-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 Feb 2020 14:00:51 +0000
Message-ID: <CAFEAcA9dcRvkZOVDYyk9GqPLK0OTEQM_8g1ZtUMjSGv39E4aFw@mail.gmail.com>
Subject: Re: [PATCH v3 00/13] hw/arm/raspi: Dynamically create machines based
 on the board revision
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
Cc: Joaquin de Andres <me@xcancerberox.com.ar>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Yisjfw/f+9x7

On Sat, 8 Feb 2020 at 16:57, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Hi,
>
> This series is a preparatory to easily add the raspi0/raspi1/raspi4
> boards (see [1]).
>
> Igor has been working in his "refactor main RAM allocation to use
> hostmem backend" series, and now v4 [2] is almost reviewed.
>
> His raspi patch [3] clashes with my work, Since it is easier for
> him to apply his on top of mine, I am sending these patches first.
>
> Since v2:
> - Split of bigger series (30 patches was scary)
> - addressed Zoltan review comments
>
> Phil.
>
> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg677145.html
> [2] https://www.mail-archive.com/qemu-devel@nongnu.org/msg675738.html
> [3] https://www.mail-archive.com/qemu-devel@nongnu.org/msg675752.html
> Supersedes: <20200206011756.2413-1-f4bug@amsat.org>

I had one or two minor comments but I'm happy if we address
those in follow-up patches.

Applied to target-arm.next with the commit message tweak for
patch 13 suggested by Igor.

thanks
-- PMM
