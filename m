Received: by 10.25.44.15 with SMTP id s15csp4314092lfs;
        Mon, 24 Jul 2017 14:06:37 -0700 (PDT)
X-Received: by 10.55.73.135 with SMTP id w129mr22341128qka.249.1500930397258;
        Mon, 24 Jul 2017 14:06:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500930397; cv=none;
        d=google.com; s=arc-20160816;
        b=WE5vRaWQroZQCoQBMZeLN0spHPKOZ7xUBmnZyUNrmJvOpxKeM8t6TUlVqxZYkxzoYs
         ofDciCzjj2/hpGVzXaPjNv3tCtigm0T74NRy7x5qqG9yFx8oAr0YAt/PdzXpAHyIv68z
         l4cjI3PW5t0Hi4IOs2IfeTCf+KNmnFcoFWsVXW8e7f+zr6XCMz8A8ZPapUxC6c7uiezN
         odzOBFXUBMr1Drmnphe3B0Pw6Tp0pOifn3hRWT9z5DAeJt4lpudA1lcYN16ygUfd1kvj
         epm//6Xw1yQxy/qYRZA5N9Qmdxf1pJaR16qMK3A2HvyGmxi1UTNn7gl/NkfQqkXyPlsc
         OTXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=sRUo1TKlG/t3gZ1s2n+4rdOmcZYMAelaD26SMo0+D1A=;
        b=e3PmpFhs8R5rLnmVuGJ0NelOEM0hF6rF/h0Qg1wdQjQv27oj8qYbnxeAOq6XVERezx
         CFkQFjdGAUgTzPCtCf9SDZaVB7IO/pSaTo2zhCKvZRbEVZIB5UAr8dtMXjPiH4UYGTAJ
         4kS3kJdQBoLw2LuTgTrJ14TtPV7a8D3Ba8pWLcTCP05waBz1v5sdYZAVAEDWQw28KZfK
         C+AsbJi77HYPZymWPksRmZtRx7Vah1aeViVPJccXwVAIJmww/4v3DXQClLae766xrbga
         O4c/tPj3x7XH+lO4BEaDGzEwq3Gi3H09WEkIhq0Z1CtMISR9uLfED7w+3ULo6c8we8MK
         HO7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.b=FASs0IiP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h36si9636284qtd.225.2017.07.24.14.06.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 24 Jul 2017 14:06:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.b=FASs0IiP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57040 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dZkYk-0007BL-Nz
	for alex.bennee@linaro.org; Mon, 24 Jul 2017 17:06:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59251)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkYZ-000751-74
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:06:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dZkYY-0004I9-BK
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:06:23 -0400
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:35258)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dZkYY-0004G8-58
	for qemu-arm@nongnu.org; Mon, 24 Jul 2017 17:06:22 -0400
Received: by mail-wm0-x236.google.com with SMTP id c184so35952613wmd.0
	for <qemu-arm@nongnu.org>; Mon, 24 Jul 2017 14:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=sRUo1TKlG/t3gZ1s2n+4rdOmcZYMAelaD26SMo0+D1A=;
	b=FASs0IiPVc9dUvArVyAMiCtiTtsZW9PYh5oVTpf4RRjy1YLW/A/o26VeY7QReJoewJ
	HFwLRodvmiSBQfK6tuiPz2PfjmXxfW43It+qGIFVHhRtm53FWTlkhpCIKw3Wz4cpc3nz
	J5+dBQyk1Qocre6hs7d5oP/D2I8f7NU3TdRmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=sRUo1TKlG/t3gZ1s2n+4rdOmcZYMAelaD26SMo0+D1A=;
	b=phaYI2erspH7qmLfgM0tdGM9HsM8cQ5NfW+AOdfdh+OP6LGSpMzzN4nvtH5q6ebrB4
	P58rv1mDaiNsnvHkdvBY+A2qpX4f7OQSN2hFf3XF8W0WY0IUIi2xXNui6LgZlTrqY4tX
	SyxHDz7tx5iXeUUHSiBUEvoYuqANutNfJswZ7Cy4CDikRmlRVxqwZyFazxPULKmTXzKB
	gtohtJkEhTemhHn/WTRVoEbauMySIwUU+DxcKwQ7qcMPvwZ4RjxheLnYtLc5rOm735A4
	4xsVAzJtR3DVyJ/xt9da2/28eSlTYzpL5oiAkmq3T++5ObFUrqQNTBalx4Y8h0GL1ExH
	7O+A==
X-Gm-Message-State: AIVw112UG3QzE8fP35sSvB8ZTWX8lGTkX3TQFL5QodyT2/DgnP7HWYqv
	1+Tou80fUXBpAmFrK6+4wT7Q04hYmslZ
X-Received: by 10.28.193.138 with SMTP id r132mr6041656wmf.155.1500930381111; 
	Mon, 24 Jul 2017 14:06:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Mon, 24 Jul 2017 14:06:00 -0700 (PDT)
In-Reply-To: <20170724182751.18261-21-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
	<20170724182751.18261-21-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Jul 2017 22:06:00 +0100
Message-ID: <CAFEAcA9RvWoL0cr=irYQ0iphHT9E4pqoQKTW+Bu28uoEJGR3mA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::236
Subject: Re: [Qemu-arm] [PATCH for 2.10 20/35] arm/boot: fix undefined
 instruction on secondary smp cpu bootloader
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Eric Blake <eblake@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DDVwCBDw7VgJ

On 24 July 2017 at 19:27, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wro=
te:
> In a ARM multicore system, write_secondary_boot() only initializes fixups=
 for
> FIXUP_GIC_CPU_IF and FIXUP_BOOTREG, while smpboot[] also uses FIXUP_DSB.
> This results in write_bootloader() using uninitialized fixupcontext[FIXUP=
_DSB]
> instruction in the bootloader code...

Hmm? The code does:

    if (arm_feature(&cpu->env, ARM_FEATURE_V7)) {
        fixupcontext[FIXUP_DSB] =3D DSB_INSN;
    } else {
        fixupcontext[FIXUP_DSB] =3D CP15_DSB_INSN;
    }

so fixupcontext[FIXUP_DSB] is guaranteed initialized,
as are FIXUP_GIC_CPU_IF and FIXUP_BOOTREG, which are
the only fixups that the smpboot[] code uses.

thanks
-- PMM
