Received: by 10.28.91.67 with SMTP id p64csp1858730wmb;
        Thu, 1 Mar 2018 05:57:54 -0800 (PST)
X-Google-Smtp-Source: AG47ELt9ayP09/33Edrap2Ztzlxf5nYXBani2jMP/zbA8XTR3Zk0gVCzPPAVxceB/iDJ6nFdncmU
X-Received: by 10.129.110.137 with SMTP id j131mr1081768ywc.273.1519912674285;
        Thu, 01 Mar 2018 05:57:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519912674; cv=none;
        d=google.com; s=arc-20160816;
        b=N35JkxW2cHedfUbEWt8D5yM4HwJF4z+nl2iIELNIOQk7lA4Rw0gLi+jM1oBjHTxvJ0
         amVvY/PbHNUHl01/IVnYGw0pHd0ISJHRNnRKNKtSqJ6mD3fvenZQg8Wn4RqHLHxo6J/x
         bcZVABjQrPWDLoQI6A4iGFS0HbyOaeuJPQF5IXQPz5pr9PEoTyr5o2DYilSf/zs8oVMX
         XTXZEHrWUmTByESqaOI85VnLdqC8nPEWT4ekw0HhXw3yy52tkLlcumcR9d1Ga+Mm4kyA
         l9dhhT2uW1yOnHKVSHMGcdTx8zAbKGhNEyJdgs2ZUQPHP5n11xtkhwaz0ObOtkYqlqLO
         N1XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=aaoXb9OPGPhxM4mnQPBX2pj4TXJkMRxu9WcvWdobGHE=;
        b=i0W4BuWGzlF8Gn4OJSPSTaDS0XZSzEf+4xu97aAJ0UhWQSIAu0WtEpRHgRFUpviNLe
         enraGPxYwI1ZpVlK4IKlHfN2H1hscHA1ZbfVzSXFfIKhv/530ECuHLBKGWSGa8rc016m
         EgGKdVLWVpsi84cXL+dqb5MitPyUqieC+J2F7tPPDWQflbmN6O4G43QoJ5BlxqfhxHs+
         VbemI4R7u/sfcEr8GV3wBsWaxC6EHWSmEtaY1a+R4SxFG1QadfEKKgRHY1QVxguBUi9u
         wWqIIK1NGdpmjCh4HN0Sroigj3eOdVLZybLxCUPC9TH+SLg5GTPVAmqbVNzN3IYIyfKn
         gTSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i5cQnY1n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e200-v6si101288ybf.757.2018.03.01.05.57.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 05:57:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=i5cQnY1n;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56920 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erOiX-0001wf-O6
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 08:57:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erOex-0007hy-4D
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 08:54:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erOew-00069G-Dy
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 08:54:11 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:41929)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erOew-00068T-6q
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 08:54:10 -0500
Received: by mail-oi0-x241.google.com with SMTP id g5so4488660oiy.8
	for <qemu-devel@nongnu.org>; Thu, 01 Mar 2018 05:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aaoXb9OPGPhxM4mnQPBX2pj4TXJkMRxu9WcvWdobGHE=;
	b=i5cQnY1neyVNrETn2zG7WN7qDY1hiRXuGSiGuFeQxv80IEdcYzEmLPcvW/BTMTg/gy
	eBOW7zKeXYzU1eS0WyXpXDZQg1vmb/bbJxhaXI/R6rfoKBXvWQ0ApVs9LvUG7NAKcoVl
	MOYAsJsTHjJVOslN2IllL40NbIOdAiPKlFaFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aaoXb9OPGPhxM4mnQPBX2pj4TXJkMRxu9WcvWdobGHE=;
	b=NdJptSb1N0KafVJFpO+cd2UFBtYLX8iS72djKbW1rGrovSqQARXJopQzhXBGYnMLcZ
	g1/0iLo9ogsa3IAosIgv5d3k8f6zeF2DrXJUYrtFRMl/mwsqdjyJm4sbsEE6AGCnhCbs
	0TXg54Mm5VvRltl/8M7LmmiDebd3boCVc7Sp6zqF2tzW1hC2b7yUglJPamR9bXr2GLFk
	Irz6nO1EqTQvpwKNX9e9cyxZicrVCEi9uHeeUOn1Pa2EuxycxthSFYwCdkQlWT786uvg
	ZAaRtIyF6n7AEx1qHipSWkPbu04oBkboHziQMTpJPGSJNyQo092piUVWXIvqX73ZIXtb
	42Jg==
X-Gm-Message-State: APf1xPCmP+/pYlQnIe817nFMt/42FiyApUTX6C6tjXz99f+o/MrWHhvO
	IOPwr8/UWeZovDGDkXeRItwMSRXuQlQ2DdDArLhnII7J
X-Received: by 10.202.90.138 with SMTP id o132mr1128480oib.11.1519912449314;
	Thu, 01 Mar 2018 05:54:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 05:53:48 -0800 (PST)
In-Reply-To: <20180228193125.20577-14-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
	<20180228193125.20577-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 13:53:48 +0000
Message-ID: <CAFEAcA-M_5=8JFjqgLP9qCF+ZyHqWJGqpfaObZdt60K7W-AS-w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [PATCH v3 13/16] target/arm: Decode aa32 armv8.3
 3-same
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
X-TUID: tThq8/C+yK1J

On 28 February 2018 at 19:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 9169b6b367..45513c9d86 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -7680,6 +7680,68 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
>      return 0;
>  }
>
> +/* Advanced SIMD three registers of the same length extension.
> + *  31           25    23  22    20   16   12  11   10   9    8        3     0
> + * +---------------+-----+---+-----+----+----+---+----+---+----+---------+----+
> + * | 1 1 1 1 1 1 0 | op1 | D | op2 | Vn | Vd | 1 | o3 | 0 | o4 | N Q M U | Vm |
> + * +---------------+-----+---+-----+----+----+---+----+---+----+---------+----+
> + */
> +static int disas_neon_insn_3same_ext(DisasContext *s, uint32_t insn)
> +{
> +    gen_helper_gvec_3_ptr *fn_gvec_ptr;
> +    int rd, rn, rm, rot, size, opr_sz;
> +    TCGv_ptr fpst;
> +    bool q;
> +
> +    q = extract32(insn, 6, 1);
> +    VFP_DREG_D(rd, insn);
> +    VFP_DREG_N(rn, insn);
> +    VFP_DREG_M(rm, insn);
> +    if ((rd | rn | rm) & q) {
> +        return 1;
> +    }
> +
> +    if ((insn & 0xfe200f10) == 0xfc200800) {

Slightly confusing to be re-checking bits we've already decoded,
rather than just looking at op1/op2/op3/op4/Q/U.

Anyway
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
