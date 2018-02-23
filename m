Received: by 10.28.71.27 with SMTP id u27csp571271wma;
        Fri, 23 Feb 2018 05:09:03 -0800 (PST)
X-Google-Smtp-Source: AH8x225UCV0A+reYWRxs8AIFxkuEGr/g+AVu9VDexam4Dzvto85w8/kdSCsmAU43EC+U6hx6414b
X-Received: by 10.129.109.1 with SMTP id i1mr879824ywc.113.1519391343127;
        Fri, 23 Feb 2018 05:09:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519391343; cv=none;
        d=google.com; s=arc-20160816;
        b=LEy+PtrBzOpBSfehhznwU8yphymNm9pt/iVd7OnfRe/34ggsLhwrFh78wuacCd4tWD
         oIfvNUlRy5JOfCSlArKfecbY7waTxb3PE0iygtXoucA9gjO4n+ffLVtns3I+9CqZFHWg
         rslR1tTca1GqvuCCVq8VcGnvg5GTKmsI+QqRBZV2iSUr3svuxyGE/euCtNk+ElJGR3Hw
         Zti8oBekgz0gjOWknKHq3jLufyJF2UYLQ94aJpok9TxgdmTzEHuPz3KiGlfJrvsMUtVO
         mPP9wGCfHQwK5EKHJ+8eB4nTS/lbZgV8qJb4e7F/fXK4WWM1NaqB+JtLth5ZgLbPxlNP
         qeuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xeJ3n+UfFdJaftfN2SpcN2fi9VUGOYt7DkF89m8lnWQ=;
        b=OcNfpeXAeZ+uKp8ETV12Oh4GNotJ3Q+OJf59pIjrLp4n5gLWKXBTdhIvJJfYE/hiW0
         lie8A4oJXqDXjZo6M+6zs/IaT57qtBRF2Cd07Y/S9WrsyL2yDf7NpqzOPWGNQMo62Y7p
         rdBoDE2nnXDsDF6pgfLMQ+jlid9r27/1C/N6ljno5HSJ0oNOsXihrqtx6sqNILe47Wk8
         qY1jKP27TJEcVXNKTdvsfjOxYqPWcakjNFQyPnEYUDM+Nz3NuoHOpEQr70YhM8enOE/7
         q3RNVKO+gQynWm75XhNYHkIP+4EWbPum2Kb1dQkyVXXVdmF/givw9dlri4dymtkoE19y
         mC7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XbzjSRyx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q81si390273ywc.354.2018.02.23.05.09.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Feb 2018 05:09:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XbzjSRyx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1epD5y-0008GO-FT
	for alex.bennee@linaro.org; Fri, 23 Feb 2018 08:09:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59501)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epD5q-0008GA-0S
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 08:08:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1epD5p-00076X-5V
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 08:08:53 -0500
Received: from mail-pf0-x243.google.com ([2607:f8b0:400e:c00::243]:34661)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1epD5o-00074a-Uh
	for qemu-arm@nongnu.org; Fri, 23 Feb 2018 08:08:53 -0500
Received: by mail-pf0-x243.google.com with SMTP id j20so60413pfi.1
	for <qemu-arm@nongnu.org>; Fri, 23 Feb 2018 05:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=xeJ3n+UfFdJaftfN2SpcN2fi9VUGOYt7DkF89m8lnWQ=;
	b=XbzjSRyxtaHscTKNY8bg+r6hYE0vXj2gbcVnUm8Elca2dceR71MMfzX6dCmTq77aOp
	X7Rrnslw25dpmM1t60mUoybSmVJUN6OvSMOX2fPSUPk0rE3RtX1gBz3NjgJGcj0r+nhd
	AIGEFmQc2R1rUGzeNgtA85B3gyEcjslZ9kyR0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=xeJ3n+UfFdJaftfN2SpcN2fi9VUGOYt7DkF89m8lnWQ=;
	b=MaO4EBQCJBJbwEQng3wM+l6rzCyuATolPdW2vlueuHB9dq5VKI70w/6qSB8bxHUUxi
	vpFQ8hrVVGWZ9LuLXDOmI0QijF6SdwTocelqaqRLz7XfH2Z6aqswGH8Lclb3WTtZ//Pi
	0WPfqS4964FpHe5cJiBUnQicIcoqFVM9Zk+nVKidHFQ6y+oRB1HJwN5yugwgAbIPBviF
	e0pTPdFiExG3aefFNL7kXS15qAZCAAtALVcrWPcHyAExCT8ZkkCmngXTprMUOjcOY2el
	FPU3p2sfhXFyFYHevncQGd+oZpIYayhItPBRcAYtRRq2JCfAwmwSrWGeJ6aDMbAFHSBW
	g9ug==
X-Gm-Message-State: APf1xPDpGHYHqiOgkipf129e7rC88Ii6NwSNCcrmoNupCQzc+k/14gsp
	hufZTlElbnzE8zHl913xDAlJrr1Fi1/r5mvgnfs4Yw==
X-Received: by 10.99.182.12 with SMTP id j12mr1450851pgf.113.1519391331787;
	Fri, 23 Feb 2018 05:08:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.241.10 with HTTP; Fri, 23 Feb 2018 05:08:31 -0800 (PST)
In-Reply-To: <20180217182323.25885-15-richard.henderson@linaro.org>
References: <20180217182323.25885-1-richard.henderson@linaro.org>
	<20180217182323.25885-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2018 13:08:31 +0000
Message-ID: <CAFEAcA9wa32T_vjH2NVxnsW3jzDw6nwPjMXuAdaBfrAXfCdHEw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 14/67] target/arm: Implement
 SVE Integer Arithmetic - Unary Predicated Group
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iLco7QI/qbAR

On 17 February 2018 at 18:22, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  60 +++++++++++++++++++++
>  target/arm/sve_helper.c    | 127 +++++++++++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c | 111 +++++++++++++++++++++++++++++++++++++++
>  target/arm/sve.decode      |  23 ++++++++
>  4 files changed, 321 insertions(+)

> diff --git a/target/arm/sve.decode b/target/arm/sve.decode
> index 177f338fed..b875501475 100644
> --- a/target/arm/sve.decode
> +++ b/target/arm/sve.decode
> @@ -165,6 +165,29 @@ ASR_zpzw   00000100 .. 011 000 100 ... ..... .....         @rdn_pg_rm
>  LSR_zpzw       00000100 .. 011 001 100 ... ..... .....         @rdn_pg_rm
>  LSL_zpzw       00000100 .. 011 011 100 ... ..... .....         @rdn_pg_rm
>
> +### SVE Integer Arithmetic - Unary Predicated Group
> +
> +# SVE unary bit operations (predicated)
> +# Note esz != 0 for FABS and FNEG.
> +CLS            00000100 .. 011 000 101 ... ..... .....         @rd_pg_rn
> +CLZ            00000100 .. 011 001 101 ... ..... .....         @rd_pg_rn
> +CNT_zpz                00000100 .. 011 010 101 ... ..... .....         @rd_pg_rn
> +CNOT           00000100 .. 011 011 101 ... ..... .....         @rd_pg_rn
> +NOT_zpz                00000100 .. 011 110 101 ... ..... .....         @rd_pg_rn
> +FABS           00000100 .. 011 100 101 ... ..... .....         @rd_pg_rn
> +FNEG           00000100 .. 011 101 101 ... ..... .....         @rd_pg_rn

Indentation seems to be a bit skew for the _zpz lines.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
