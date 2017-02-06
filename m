Received: by 10.25.77.65 with SMTP id a62csp1727788lfb;
        Mon, 6 Feb 2017 06:54:21 -0800 (PST)
X-Received: by 10.55.126.2 with SMTP id z2mr9496648qkc.178.1486392861856;
        Mon, 06 Feb 2017 06:54:21 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z65si629718qke.324.2017.02.06.06.54.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Feb 2017 06:54:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48836 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cakgP-0004JU-AV
	for alex.bennee@linaro.org; Mon, 06 Feb 2017 09:54:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cakgI-0004IG-Ro
	for qemu-arm@nongnu.org; Mon, 06 Feb 2017 09:54:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cakgF-0003dl-2w
	for qemu-arm@nongnu.org; Mon, 06 Feb 2017 09:54:14 -0500
Received: from mail-wm0-x230.google.com ([2a00:1450:400c:c09::230]:35275)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cakgE-0003dO-SR
	for qemu-arm@nongnu.org; Mon, 06 Feb 2017 09:54:11 -0500
Received: by mail-wm0-x230.google.com with SMTP id b65so123808771wmf.0
	for <qemu-arm@nongnu.org>; Mon, 06 Feb 2017 06:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=rHcIHFVzwWYx5OEo9zHiciyfeBz502Zx2T09Eg4lzxA=;
	b=cL6ey6xF1ENWilBsZBNhCeN3MhrXEcuQVJK7FCPFvgFJcfLju2z+ziVjpZM8DjQfMN
	s4gZxHkRpGpMW0EpdZujTpsYiLaKL4jK1OybKVEXJ7DJblcOWUup4n182LTE/IlNcV27
	mjY6iuYzVZEVkP+Le/KlEz4MbA+E4m+DtLVmY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=rHcIHFVzwWYx5OEo9zHiciyfeBz502Zx2T09Eg4lzxA=;
	b=ISKcuhcndBmfxRqq4mZCV95GMgSLM2JZi3fxr7XH7r8wte9Ml71kFW6osaBXcQexRC
	SiT2Xlcb+f62v6wBNf7oznaZZMe4ifGss14m2g42F5M2/q4zW10Ccg3W7kjRP1ALTdmO
	TtvxqbkWYCXdHXzCUxFAzPSjioDndUTrebJQu9lHYOS9hz3HZNxyH8GXOkHLEeFTh3pU
	wrPv0LQEjfa0Ntu6aaoJe1PH5Wtax3nPbXWiYOk7rFNRJCBskTq2R0rd9WP4U66jDZgH
	nq0Hr242yE1iezJ/bOD9tPCGU/lLMPFYvJdgsC/BF5+Gy9xP/UC0PtyC9I+QQrLKlOFh
	C1sw==
X-Gm-Message-State: AIkVDXKKkE0xOCXm+egVxr4507fXUzyAO9ix/wJbexMZYSua2Qte211zT89rD0ZvsSbuAQXuKuDZTIvPSqjd3J9A
X-Received: by 10.223.152.175 with SMTP id w44mr11852756wrb.151.1486392849578; 
	Mon, 06 Feb 2017 06:54:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Mon, 6 Feb 2017 06:53:49 -0800 (PST)
In-Reply-To: <20170204143132.GP9606@toto>
References: <1486144135-4894-1-git-send-email-peter.maydell@linaro.org>
	<1486144135-4894-3-git-send-email-peter.maydell@linaro.org>
	<20170204143132.GP9606@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Feb 2017 14:53:49 +0000
Message-ID: <CAFEAcA9ybZzMPKMUUyrALGq4ufwBbWPFAtZEctHmA1CKnnpLgQ@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::230
Subject: Re: [Qemu-arm] [PATCH v2 2/2] target/arm: A32,
 T32: Create Instruction Syndromes for Data Aborts
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NCfh1m/yGlpp

On 4 February 2017 at 14:31, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> On Fri, Feb 03, 2017 at 05:48:55PM +0000, Peter Maydell wrote:
>> Add support for generating the ISS (Instruction Specific Syndrome)
>> for Data Abort exceptions taken from AArch32. These syndromes are
>> used by hypervisors for example to trap and emulate memory accesses.
>>
>> This is the equivalent for AArch32 guests of the work done for AArch64
>> guests in commit aaa1f954d4cab243.

>> +static void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
>> +{
>> +    /* We don't need to save all of the syndrome so we mask and shift
>> +     * out uneeded bits to help the sleb128 encoder do a better job.
>> +     */
>> +    syn &= ARM_INSN_START_WORD2_MASK;
>> +    syn >>= ARM_INSN_START_WORD2_SHIFT;
>> +
>> +    /* We check and clear insn_start_idx to catch multiple updates.  */
>> +    assert(s->insn_start_idx != 0);
>> +    tcg_set_insn_param(s->insn_start_idx, 2, syn);
>> +    s->insn_start_idx = 0;
>> +}
>
> Could we move this into translate.h and share it with translate-a64.c?

Sure; I'll just squash that change into this patch and put the
results into the target-arm queue, rather than burdening the
list with a v3 respin, if that's OK.

thanks
-- PMM
