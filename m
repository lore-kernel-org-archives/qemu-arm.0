Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp1077686wro;
        Thu, 1 Nov 2018 10:19:16 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dstwlPBM94/9ySEHutptfwNp/EGkCw+qkqT2lYN8fuINcy8QgjqiTl+VVCvlPlbTEPbtWI
X-Received: by 2002:a0c:d107:: with SMTP id a7mr7694371qvh.104.1541092755946;
        Thu, 01 Nov 2018 10:19:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541092755; cv=none;
        d=google.com; s=arc-20160816;
        b=QXxS241kaULz2PGhCPRMLgBeTDsSyJORPVM+3Rw4Np/IvP0jUtEtu3MsReNYjXKXy3
         6KU7X3dG4gbV5nw9y7r14H2UZ3v6Y26mffvnUEBiUWGDIZyk4F0R/ofi3ETHPwKVooZV
         n/Tdwr5nCBacwLXaenTDKaXIyHp0xQOieulbJBvmopq02iit7VHKZ/MnXYWPNjsYaRp8
         9mV2fODGc3mdRS+tM5Ky6GTMFY7uBJZK7sjW2k00u4lW3Rbl2h3z4uzpjPlfo6XuH8fw
         QKbZyfPAx4Pq+M39CfHoAjWW5Lzdgv3UuMy5v6B47tDwOiN23ovKujcqpF9yv88AG6qU
         4prg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=bpczqcJypmUB047JDTFfTOoqT0F49kKd/mJrJQesVoA=;
        b=ZcK98QptPzlDIcshL5+rXq4amiR7NPkHhXVjPbLLPJ+v9Y+fZEyRyoUBqNzCj4FwV2
         1OENnh+l+efcjiiF2e4gHJY5Qubfh1eSh4ZKmp2P6fbIFnARdBOa0UQ4pJV/xKuXonCY
         QlvFzQy4ZDyQhqSkVstXAKjWpwVzi6Ubgxzpms9c4SqmqGcmlEAV31Cl9yqk/7WPEw95
         3niFroyAHjYUUzrUaJOIez6PXr40OLj3xI6RAv6en9NyBqL3HYTOm5d5+FIxMpjdjA8w
         r2Epi3tBfDFEFw61N4lDnUja96uHw/mMNxXAd7kieVHe/bmtErkKThHTlCFno9q/Udr4
         6nQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Ic/tUR21";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f13si8805903qvj.22.2018.11.01.10.19.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Nov 2018 10:19:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Ic/tUR21";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43164 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIGck-0007Tw-L6
	for alex.bennee@linaro.org; Thu, 01 Nov 2018 13:19:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36532)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gIGcZ-0007T9-V7
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 13:19:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gIGcY-0006H0-4a
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 13:19:03 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:36435)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gIGcX-0006GQ-M9
	for qemu-arm@nongnu.org; Thu, 01 Nov 2018 13:19:02 -0400
Received: by mail-ot1-x344.google.com with SMTP id x4so18439176otg.3
	for <qemu-arm@nongnu.org>; Thu, 01 Nov 2018 10:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bpczqcJypmUB047JDTFfTOoqT0F49kKd/mJrJQesVoA=;
	b=Ic/tUR21e0NATGE/kpqdg8zibBx5fZSBre6SajuYDfp65f4hpNaPBemN4Tp2jKvbms
	shZ0F8MatLoubjQSDu+2MoShkhwNHfpaHiQtNkTx8rHOvALzuFJYYXv1j9mQt8U24qrT
	pqeArqj9SvIWcHmV50SFMt4xown+9qs1r654I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bpczqcJypmUB047JDTFfTOoqT0F49kKd/mJrJQesVoA=;
	b=MEYFy19sephHW8NP1hTXDElqc7+8D0JdDpaMdPIz8UOs4YX3oUSrEq3yMOpo/6pGq0
	naWFMHkCrZqEOdau/VCTHNly578iJOF9dO83RjOUIEUmHRuOcotqdL0TdKBAHVVXKxnX
	hhseylu/DeIRmtgRJdB9IVDJft78NeORg0TkCQS2jKIhYgkz29+vKxC2k9gcGwIkT6tR
	CguTWO4MouusP0NYmjqBcK9JV8/hCiYV+GZeQwTgWa/LdKake+y2j7//+kj9WuYlUXbu
	s59G2g7xWh50Vz3BwacnJKGLH6Fh4h0bRK4JeW8tRnjntgqsw+qSxVDUeZ+8Ex9eHMlv
	EWVA==
X-Gm-Message-State: AGRZ1gJT+dS9K45TaxTg7M7oVi4GShQBXVCNgSivPyQkwRWeRbymuU4c
	MLTU8QRFpZRTj45cATFS6D4eOjBUOJ3AtMEq5j550A==
X-Received: by 2002:a9d:5f81:: with SMTP id g1mr5312248oti.317.1541092740588; 
	Thu, 01 Nov 2018 10:19:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Thu, 1 Nov 2018 10:18:40 -0700 (PDT)
In-Reply-To: <84c5dc6a-6507-1b72-9808-ef4a58ff26d4@redhat.com>
References: <154098485103.7774.2165977871054805313@015909e0f939>
	<84c5dc6a-6507-1b72-9808-ef4a58ff26d4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Nov 2018 17:18:40 +0000
Message-ID: <CAFEAcA_ByKuDeei4TtqRzWQT-W9CFtFRywrSCbp3TQXuTk9pCQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 0/2] hw/arm/exynos4: Add DMA
 support for SMDKC210 board
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
Cc: Fam Zheng <famz@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2fAgZnmZr6a0

On 31 October 2018 at 16:00, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> The following patch fixes this crash, but I'm not sure this is the correc=
t
> fix:
>
> -- >8 --
> --- a/hw/intc/exynos4210_gic.c
> +++ b/hw/intc/exynos4210_gic.c
> @@ -213,6 +213,8 @@ void exynos4210_init_board_irqs(Exynos4210Irq *s)
>  {
>      uint32_t grp, bit, irq_id, n;
>
> +    memset(s->board_irqs, 0, sizeof(s->board_irqs));
> +
>      for (n =3D 0; n < EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ; n++) {
>          irq_id =3D 0;
>          if (n =3D=3D EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 4) ||

Generally devices should be able to assume that their state
structures are zero-initialized. In this case this memory
comes from
    Exynos4210State *s =3D g_new(Exynos4210State, 1);
in exynos4210_init().

So the quick fix for 3.1 would be to make that use g_new0().

Longer term, the code in hw/arm/exynos4210.c is implementing
an SoC, but it is not doing it in what is (now) the standard
way of having the SoC be a device object which contains all
the relevant SoC device objects. Making it work like that
would mean that the memory for the state struct would naturally
be zeroed out because it would be allocated by the functions
for "create me a QOM object or device".

thanks
-- PMM
