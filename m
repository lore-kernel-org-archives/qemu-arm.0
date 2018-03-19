Received: by 10.28.91.67 with SMTP id p64csp2743133wmb;
        Mon, 19 Mar 2018 08:31:59 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvpkYrngE4akt+wBJr7ArWUMMb6q0so/DaFsJ19V45brGiPE9lfLsK0S92F98B9v5/lTiwJ
X-Received: by 10.237.34.136 with SMTP id p8mr6558129qtc.316.1521473519210;
        Mon, 19 Mar 2018 08:31:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521473519; cv=none;
        d=google.com; s=arc-20160816;
        b=KQsfAWDAQ2DWleJcycNPFHv9+r8wfytbjk5QGwrZEcWymEMTsLr7JmNdRbnS6ZVazJ
         oyPuBRYfKuyUs33VuaF++slImOn94wIXyHPFekDxJEURwjE8YtGjVqtzuDOMMwu/nFB0
         iiCatL24ZCFAXYDzBz7hEWG4FBcEd2WnjvP81fRwN4bB0Qedc+bpXXCEIZTyfzosGRaQ
         G2PjgTztp0FBKJimnEQ8uK5cWXEInficlao5oc9yOCUfR1zhPRU87gWJCrypuIGhknNU
         Axz9DNQ++rGPnqmpLU2xfWPn2G/e3GxDv0uKVKpaEduT2AslCKjdzA7F51Ob8OmVqR3q
         MQgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=ug/IM+J2+JDeDxb69u0EyzCEuZ1K4P6NcpgYNIrZMpk=;
        b=UCvcqZNqHcoUe/5S+uIyFYVUbbG9kCHnpIjJEBmv4/5+VBsk3nEowcxIJ/E7aXHIbf
         yx5QbnjP3wqniZsjP4kO/lIJF+y4qDnqWp934UtNja1biXaXY1vy6VAu9+ATGmgEAo3b
         De0WYgbaL4AMx8u6pgcDY0vLTbkIfgdd/QpS5bwwbFYBVH1TlTcyfXZi2AvUFn+8MUlb
         ngq6oUF7HhQMNS4X0ee3iqVnMbixDTDVImQjgg/RYW6Uk72d8iOgrVXWRR49/4rDbCHM
         FO32iaOpe9IpDHiCZEb46nzOelUgTrhFacWRB6eLg6il4se5eTf8f1Ex4LJm0ROolgLg
         lTyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RBQTd8Qf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h52si275027qtb.336.2018.03.19.08.31.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 08:31:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RBQTd8Qf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42572 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exwlP-0007Uk-78
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 11:31:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1exwlG-0007UK-4U
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 11:31:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1exwlF-0001QA-5N
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 11:31:46 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:38829)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1exwlF-0001Pp-1E
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 11:31:45 -0400
Received: by mail-oi0-x241.google.com with SMTP id c3so1620611oib.5
	for <qemu-arm@nongnu.org>; Mon, 19 Mar 2018 08:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ug/IM+J2+JDeDxb69u0EyzCEuZ1K4P6NcpgYNIrZMpk=;
	b=RBQTd8QfmEb/8rg/pAqt/fWxY5z00LRytIxsPVeK0oUeulEgWwVqRrB2Lsz6VX0YSG
	8XVFx97TDt6OMxaGdgczQQaXnyRcosRQO8F70wyo6/85GLrLqe854cd0+TncFTFiI4Yk
	tFY2nkPa69Ap5r1XNu1A1P/jV57o5dA5Kpi0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ug/IM+J2+JDeDxb69u0EyzCEuZ1K4P6NcpgYNIrZMpk=;
	b=fF4PqASWOHoi2/hDIkP2llCVz5iFC7B11DpFrJfTDReorNKX4DGMHiBM3gPxn9wAp7
	eaAMk5d/TTTtr5/890RJoVU7LIYdr+3LPFzdS+ducK3QpZTNDor6u+F2jEn4MUaWYmlD
	lCMsx3xeZQcALxHsshp2+0NEyE68BFniMWWT8xBo2EQgG8j+HrCuY8mXZ24HiIp8TliN
	1RZpr4SVp6zzEffnaiKTSBtQAULTcznBP56YHgGA4kBhjfpCTq0qfapm2VeT1MYF3piP
	XRMejvkm5sgDt7iZTAOUDIJ00laIsEfeicl2rVei2a6z/7xKL4PTjmeLkq68YjeBoGQT
	h/qQ==
X-Gm-Message-State: AElRT7EZZ2oyWvL6DAuBgMbtIxKF/IP4X1rIvFptqrbTU1Vvc2eon4xR
	G3Squ8BY3NbXnvLAdevw3HDzoGVgHP9VkxiyudY69A==
X-Received: by 10.202.97.87 with SMTP id v84mr7466576oib.12.1521473501780;
	Mon, 19 Mar 2018 08:31:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 19 Mar 2018 08:31:21
	-0700 (PDT)
In-Reply-To: <20180319152426.GB24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-15-git-send-email-alindsay@codeaurora.org>
	<9af89876-bf5d-4696-a430-664fcd5a02fa@amsat.org>
	<20180319152426.GB24561@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Mar 2018 15:31:21 +0000
Message-ID: <CAFEAcA_1gVEziptLMoEm-noVM7EZqP=KLg1uyaLfAd+7PToHdQ@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 14/22] target/arm: Make
 PMOVSCLR 64 bits wide
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 680hajBScQur

On 19 March 2018 at 15:24, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> Phil,
>
> On Mar 19 00:14, Philippe Mathieu-Daud=C3=A9 wrote:
>> Hi Aaron,
>>
>> On 03/16/2018 09:31 PM, Aaron Lindsay wrote:
>> > This is a bug fix to ensure 64-bit reads of this register don't read
>> > adjacent data.
>> >
>> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
>> > ---
>> >  target/arm/cpu.h | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> > index 9c3b5ef..fb2f983 100644
>> > --- a/target/arm/cpu.h
>> > +++ b/target/arm/cpu.h
>> > @@ -367,7 +367,7 @@ typedef struct CPUARMState {
>> >          uint32_t c9_data;
>> >          uint64_t c9_pmcr; /* performance monitor control register */
>> >          uint64_t c9_pmcnten; /* perf monitor counter enables */
>> > -        uint32_t c9_pmovsr; /* perf monitor overflow status */
>> > +        uint64_t c9_pmovsr; /* perf monitor overflow status */
>>
>> This doesn't look correct, since this reg is 32b.
>>
>> I *think* the correct fix is in ARMCPRegInfo v7_cp_reginfo[]:
>>
>>     { .name =3D "PMOVSR", ...
>> -     ..., .fieldoffset =3D offsetof(CPUARMState, cp15.c9_pmovsr),
>> +     ..., .fieldoffset =3D offsetoflow32(CPUARMState, cp15.c9_pmovsr),
>>       .accessfn =3D pmreg_access,
>>       .writefn =3D pmovsr_write,
>>       .raw_writefn =3D raw_write },
>
> Nearly all of these PMU registers are 32 bits wide, but most of them are
> implemented as 64-bit registers (PMCR, PMCNTEN*, PMSELR, PMINTEN* are a
> few examples I see in this patch's context). My understanding is that
> AArch64 register accesses are handled as 64 bits, even if the register
> itself isn't that wide (though I haven't personally verified this).

Correct. Technically there's no such thing as a 32-bit wide AArch64
system register -- that is just a shorthand in the Arm ARM for
"64-bit wide with the top 32-bits being RES0".

thanks
-- PMM
