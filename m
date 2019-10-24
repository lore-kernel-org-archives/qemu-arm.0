Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2062484wrq;
        Thu, 24 Oct 2019 02:07:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+jSvCiD55P0eI2ghWSpDm839jUDGaqRjSzD6OIXfYWsETmMUuRsEOJHMB+3cPTxfPszox
X-Received: by 2002:ac8:498b:: with SMTP id f11mr2970174qtq.150.1571908056079;
        Thu, 24 Oct 2019 02:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571908056; cv=none;
        d=google.com; s=arc-20160816;
        b=d4fxHjgG/s19PRA1pL69J5eBTWwEYwKpFJU1BeHbmTYqd+qRmN0F7Ukr0NenB510wY
         /99DN2B9p8apq61whT4+WnDd3i8lDQSA8VtHzEncoceWpWIvGhOPa+m7cNLaB6SnuDV1
         FiG9RVSBJP7Le1eyFC+/6Q8SNp7uksRXbWoH2g2g2AJd+7sTa7XvTjV+5QSHfnmI9pA7
         +0TQVKgoaYIK7hurxhU70yaPrBYF6bokxDmkozFv4AkZ9eCg8AcMD/tpTlTru0kUhhxc
         /XD/G26EP4VwYNdMs9aIkprfwnlPRSSL6VAD3eayVRnjKks02rHzli7TZgSGED50ZTll
         UGmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=UDo616BZ+C1phhRsTqOfhdcBGtgd8QLcUd2Xek8QHqo=;
        b=Pu1ivOxkxZD1j7+bYZWdhZg3BSnWc+9zsp98E0XXENdKkZSjWvNKypqJJTEjSpp5HT
         soIfiXY7w8XXKaVIAlHkMtL4ZFsci8ioHd4dwtXdDuds6ScpWny+mbtkBl8K7B45moDB
         qSEGDiz4mzSTia80JUXUWGuab9BSkn8dGkVuWIVaiWVyGn6Ng5wpg2AhLRJymmTGvC2k
         LLH2uxlh6sCjpR/uhXScWKqskjZsKx00xa9FtFpiySyFAQ8azHSzYaTkwlzP8JDoo7Vw
         0sCFnI9rXRVOOn9e9nKGK3FGkNdEuLYKZ9aGZRDxtszNXjcr74RTnUSFCPJXlSVKaotU
         C4pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kReDDaf0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k23si20892404qkg.118.2019.10.24.02.07.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2019 02:07:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kReDDaf0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNZ5j-0002nJ-H7
	for alex.bennee@linaro.org; Thu, 24 Oct 2019 05:07:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43202)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iNZ5b-0002lc-Ez
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 05:07:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iNZ5a-00028j-CP
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 05:07:27 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:37158)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iNZ5a-00027w-6w
 for qemu-arm@nongnu.org; Thu, 24 Oct 2019 05:07:26 -0400
Received: by mail-oi1-x243.google.com with SMTP id i16so19965169oie.4
 for <qemu-arm@nongnu.org>; Thu, 24 Oct 2019 02:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=UDo616BZ+C1phhRsTqOfhdcBGtgd8QLcUd2Xek8QHqo=;
 b=kReDDaf0y6EAJa5FqNEcgkdptw+m/Uty4JV9EKzwtnABgCo1HOUR3FkaC7pVX+56wn
 QBry+RRozeLeLM3X1mFVeoUs4XDVruSIeOjYyLsqP0kkYKGXc22O1gGRN+dK2RtUN62l
 lh//sw4hm325SoDB4uFRk+X0kiEsuC3UR2WTzNy9fleariWHQUMMBKuxva1YLzMYZt23
 iHViOHSSbKKZSc9avZaLO/Mvy1R0VQmQv4Mb29dh6EBvz3tzQc68XdJBwhRUyBXgvWl7
 bZEsJzO+NAW7lgJhX7yZPiUU8ZVpdxg+uzsa0CPVe9cBsWjytT+edJXCZnWcT9wsrZJ+
 aJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=UDo616BZ+C1phhRsTqOfhdcBGtgd8QLcUd2Xek8QHqo=;
 b=ZVuIb2PFbaEZ7aRDELSWUkk0H7D6+oD5oJovxWW3yzdIQyJil3kd2dufCDbDwqGcjo
 8mMouJItNWCzEqX/sZDpQJWjZSqut2eMt9q/oECopBybi8RWB0OYpA8ssICjkijSanmn
 pFmuC8NAAUrEqf9ZqSmUIbUnoR7up0m7vVsvF3utWe2RNncYn0FNyVv502c0yGmF2kls
 OSNaAUU6+UQTc0J2cK2K+cgXkrN0qnZg37HG6bevCfGLN2VOpMJNLCYfqQIS0xZKPLmN
 2nDtkdVY2jGVZzvkFjE0ljh9EyQhXsgVbZdAu3ussDN4mF/1aMUPrVh+FEp9LzrlEiBq
 9P2Q==
X-Gm-Message-State: APjAAAVTBKV8yUAB6mhQhzdkCcmAnSvXjiL8it121BXUhRa3UcnMvZhY
 iXlXDdP8QbRzITXWV+w05t4LcmdB/QS33HZjOGKgMA==
X-Received: by 2002:a05:6808:608:: with SMTP id
 y8mr3548069oih.146.1571908045162; 
 Thu, 24 Oct 2019 02:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190904171315.8354-1-f4bug@amsat.org>
 <20190904171315.8354-15-f4bug@amsat.org>
 <c8a8c7758104a1a5fe052743b5a22d3a1353de91.camel@gmail.com>
 <5f1dd044-2909-767d-5a79-8a40d330e129@amsat.org>
In-Reply-To: <5f1dd044-2909-767d-5a79-8a40d330e129@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Oct 2019 10:07:13 +0100
Message-ID: <CAFEAcA9JXbqnKKK+m-7=FThXTa_x_kxRsvtwONWA69C2nb0=FA@mail.gmail.com>
Subject: Re: [RFC PATCH 14/14] hw/arm/raspi: Add the Raspberry Pi 4B board
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: =?UTF-8?Q?Zolt=C3=A1n_Baldaszti?= <bztemail@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Esteban Bosse <estebanbosse@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Clement Deschamps <clement.deschamps@antfield.fr>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C/AnhPOP0nrC

On Tue, 8 Oct 2019 at 10:04, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> Hi Esteban,
>
> On 9/29/19 5:53 PM, Esteban Bosse wrote:
> >> +static void raspi4_machine_init(MachineClass *mc)
> >> +{
> >> +    mc->desc =3D "Raspberry Pi 4B";
> >> +    mc->init =3D raspi4_init;
> >> +    mc->block_default_type =3D IF_SD;
> >> +    mc->no_parallel =3D 1;
> >> +    mc->no_floppy =3D 1;
> >> +    mc->no_cdrom =3D 1;
> >> +    mc->max_cpus =3D BCM283X_NCPUS;
> >> +    mc->min_cpus =3D BCM283X_NCPUS;
> >> +    mc->default_cpus =3D BCM283X_NCPUS;
> >> +    mc->default_ram_size =3D 1 * GiB;
> > The comercial models are: 1, 2 and 4 GiB. Why do you choose 1 GiB as
> > default?
>
> Well need one default, and 1GiB is the least beefy :)
> You can start a VM with more using the '-m' switch.

Among other things, a 2GB or more board will fail
'make check' on a 32-bit host, because 'make check' tries
to start all board models, and 32-bit hosts can only
handle up to 2047MB of guest RAM.

thanks
-- PMM
