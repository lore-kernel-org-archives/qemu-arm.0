Received: by 10.28.71.155 with SMTP id m27csp2159878wmi;
        Thu, 12 Apr 2018 10:22:34 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4/dT5++gjNUiqzwobE1nPkEqRXPdmsHP9Frr/Q0rtg1TpVAoK+Qq75lzmR5zwwYlWl1Qlh/
X-Received: by 10.200.35.67 with SMTP id b3mr2393912qtb.91.1523553754699;
        Thu, 12 Apr 2018 10:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523553754; cv=none;
        d=google.com; s=arc-20160816;
        b=IfH6UMbTCM+MmlRg0XSNfgxpqCO4cVFAt35tMrrkHAx3fSpjFnqKhLLpu1AtZZdGgl
         DmxMkzs9lFvnAWKsJa217GzUFd1gIOhrF0/pZK3NuLMpwZnoAPLNgJs8maZP8ERnzxuF
         8GZbZEJp5n/VUCJ7XkqiugMaxYbeUcf5oKDGesSP8IBzxYZNG7UyzVKXq3o6PY9qfnh9
         qG1cf5aPjovW6IEkCTm9rEhzlXF6mxxKV2pcT+SeV4xMb1iBxLoHpFbCcI3GR09nCr6P
         Rvo8dJJvVLC5biK/gg/Uah5oTESSLTPwAGNnqm3RFBvIVAp8roZAuU6DT/8nnv3x5o6V
         ezkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=SKsLG6t8t6CoKAb8vYylLFCsAi1llE2Po+sSFcekbH0=;
        b=pYSY6pYUmyG1CydAn0pgP0m+tDuM4KonLL7Tvd6fQ6BPtuk2Lm45D5N8VR/PBjQ8W0
         tkJShLLM/6N2Tk5r5oHwaMxB4/HoOQjLD4RcB6fULFCvD/sH+1B1zwTjkkcAWbwxB3qa
         uZkTciLqjMhGVPI0+Ju9QJ8+v+Sm13n3uhWprClvXRBVaGmWZLLrzFGd13Si5ZmA6WHB
         qiVBriyunrafxvJ5Qnqord0KufVjH99GrTRYmgnsDig5JhUMYgHeJn1wBigNVeCxD5O1
         FIQdLofF5e0+W9g4qYVKZ5KX3R0Mt4G9qzEkH6i+2TFA9wwJzF/nIznvQCN9Y3r+RpTU
         Ttzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dMAU7xpr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c6si5143516qkb.164.2018.04.12.10.22.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 10:22:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dMAU7xpr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56547 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6fve-0001FN-5I
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 13:22:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6fvR-0001DW-2B
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:22:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6fvQ-0003j6-5g
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:22:21 -0400
Received: from mail-ot0-x234.google.com ([2607:f8b0:4003:c0f::234]:36359)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6fvQ-0003il-1F
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 13:22:20 -0400
Received: by mail-ot0-x234.google.com with SMTP id n40-v6so6878106otd.3
	for <qemu-arm@nongnu.org>; Thu, 12 Apr 2018 10:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SKsLG6t8t6CoKAb8vYylLFCsAi1llE2Po+sSFcekbH0=;
	b=dMAU7xpr3ba9vzkIxYb/vLxclHW11Qhj1Jrql5mcgo6AmmkpBLgKjeNsrny80sXKr7
	Ncj0C2PedklLA34U76dUst0eXoBGdaGqlxsVNxYmHfFrvGoNabzEG8J7DoGMaWJ/nGTP
	Q2VFsY8th1sY6k6khJ1e4wk1J/yPcjgIIgcQs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SKsLG6t8t6CoKAb8vYylLFCsAi1llE2Po+sSFcekbH0=;
	b=PSo+mDQNj9xSPUiJVsVLJekVfLvsDNROYbd2sbrzFQIX7I1oNNl0t8NrtO8HX6Xxjd
	YLHkJfLNiHd+9kKLzUPnBRpega6CbKpfKB+CbRKBHOEWN8/E7uxfsYxk37XJ788fF/BG
	arzuwz1Tz3PKeEgGFRo0EDQ970TcWv3lzpOWsOaK8B72OIZbk4sa11377PC8WOdo7KWP
	oCrcXQrCElSvFJSutw4h7BsDSE1ohiS21L1E6prnl1DAD4Vu+j/KkKzhudzY65hNtSJj
	0UJ65eEn5/qinzY/cl5Fu4RLd+HNIjpAMH2sAf1FvO86X6dtgr59RsfwlV8SHhgq3m+B
	mM+w==
X-Gm-Message-State: ALQs6tAVWF/qAQ6I5YKPrjkTo1kvVlVYT6XQ4vcHDCbXRD0gldO0gkZ7
	GgMc7uq8uGIh8qlcrRh4WhpU9vMOYMnVH4dv5JwUWw==
X-Received: by 2002:a9d:56f0:: with SMTP id
	b45-v6mr1345875otj.294.1523553739500; 
	Thu, 12 Apr 2018 10:22:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 10:21:59
	-0700 (PDT)
In-Reply-To: <20180412170816.GI24561@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-11-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA8XARzPc-YEoQVQUEoV2gL+ZOLsqzxhh36xzqjXZXniPw@mail.gmail.com>
	<20180412170816.GI24561@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 18:21:59 +0100
Message-ID: <CAFEAcA8E0NiXMZDRmU1zKCsm78Y15b-f=mbxvqywhfnW81XR7A@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::234
Subject: Re: [Qemu-arm] [PATCH v3 10/22] target/arm: Allow EL change hooks
 to do IO
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
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kv937fhuk6VA

On 12 April 2018 at 18:08, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> On Apr 12 17:53, Peter Maydell wrote:
>> On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
>> > During code generation, surround CPSR writes and exception returns which
>> > call the EL change hooks with gen_io_start/end. The immediate need is
>> > for the PMU to access the clock and icount during EL change to support
>> > mode filtering.
>> >
>> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
>> > ---
>> >  target/arm/translate-a64.c | 2 ++
>> >  target/arm/translate.c     | 4 ++++
>> >  2 files changed, 6 insertions(+)
>> >
>> > diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
>> > index 31ff047..e1ae676 100644
>> > --- a/target/arm/translate-a64.c
>> > +++ b/target/arm/translate-a64.c
>> > @@ -1919,7 +1919,9 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
>> >              unallocated_encoding(s);
>> >              return;
>> >          }
>> > +        gen_io_start();
>> >          gen_helper_exception_return(cpu_env);
>> > +        gen_io_end();
>>
>> You don't want to call gen_io_start() or gen_io_end() unless
>> tb_cflags(s->base.tb) & CF_USE_ICOUNT) is true.
>>
>> (Ditto in the other cases below.)
>
> I assume there's nothing tricky about this and updating this as follows
> is sufficient?

Yes, that's sufficient. (The other thing that needs to happen
for a gen_io_start/end is that the insn has to end the TB --
but in all these cases that's already true as they set
s->base.is_jmp = DISAS_EXIT.)

thanks
-- PMM
