Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp5184342lff;
        Mon, 13 Jan 2020 23:53:16 -0800 (PST)
X-Google-Smtp-Source: APXvYqxIl/MIFLcwV1D9gZydn8v9JIHxY0Yp9qsQtSvVop4terDbP2f+/7ZFzBeeUI86Upn7/uej
X-Received: by 2002:a25:7255:: with SMTP id n82mr16454160ybc.176.1578988395838;
        Mon, 13 Jan 2020 23:53:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578988395; cv=none;
        d=google.com; s=arc-20160816;
        b=eSudHX2RdOug3ppOh0rrT/ztOUqBZAZwVFsOyq2djE4/cAWGlr2YKe+ES2poaCaqIP
         HmMvGlLcOn2u5YfnhBFrYjFhhUiT7kklE9fmekMHU/GdCCUclpv3yWbGD54GiNQ3yZKa
         xEX6PdZMGyJCBFzRuL0LSt3PAQ8fKbEF3PDwqp75g5erx+mFyDIgfT2Zh6SnQQXhfudL
         PK8nc452uL7WvGSmuS58hjUmne8IoUZb8kWlmbsPwTQcIOGPUVJyDecomALkve109MV7
         krmFuWMgJXtdYoPBMbQeSOIkDIrQYN/yDpAJFYvAs5SEzWZ4cDd0cQ6pW0YPujuAm7cQ
         rqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to:date
         :cc:to:from:subject:message-id;
        bh=FtMQtmlsd+BI34urMHLnIbW8pwEEgx23hGdirHciNJE=;
        b=bN7IuJP/HmFKWO/qGUeHi1e/bKMTKtegkZZv4J6miUYF0CSqziIJ3yuRCY5zeMx+X6
         rujCTMPOeyCurbiJTgzxr9EIYXY+RMCasmTR1OtF0YGIMsmfNxbynKmvkcgrJraqwpVl
         OnX3/4HN/qzi0trpYhJU8qY3yQGN7WhUeq/5WPUjn6vJ1/NpzVMrPnmuNIodoFWb42kO
         fhhPt3PKASWPgXphqX1+wJJ8EvMq/CheSFO1py91zqYVSynS0yXU+2mXTILpPPTskarp
         xiFRtFJfQFhbJmnqKbZBjs2AjpY2t69FKBKED0AMYZUdHia5s2BnsR3ZwgbJfl1irR4w
         veOg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Return-Path: <benh@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org. [76.164.61.194])
        by mx.google.com with ESMTPS id f10si8709225ybk.110.2020.01.13.23.53.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 Jan 2020 23:53:15 -0800 (PST)
Received-SPF: pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) client-ip=76.164.61.194;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of benh@kernel.crashing.org designates 76.164.61.194 as permitted sender) smtp.mailfrom=benh@kernel.crashing.org
Received: from localhost (gate.crashing.org [63.228.1.57])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 00E7r2tr000335
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 14 Jan 2020 01:53:06 -0600
Message-ID: <cd9a2de94700a2781f176247131dceba690d8f31.camel@kernel.crashing.org>
Subject: Re: Semihosting, arm, riscv, ppc and common code
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Liviu Ionescu <ilg@livius.net>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
        keithp@keithp.com, qemu-arm@nongnu.org,
        Alex =?ISO-8859-1?Q?Benn=E9e?=
	 <alex.bennee@linaro.org>
Date: Tue, 14 Jan 2020 18:53:01 +1100
In-Reply-To: <AE7841A1-B4D6-4D6D-9AFD-01C4604D7BC4@livius.net>
References: 
	<11d88b2741eac3f634d5aed9e3355c974b533f7b.camel@kernel.crashing.org>
	 <AE7841A1-B4D6-4D6D-9AFD-01C4604D7BC4@livius.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TUID: xlJvs6GriLxQ

On Tue, 2020-01-14 at 09:32 +0200, Liviu Ionescu wrote:
> > On 14 Jan 2020, at 08:25, Benjamin Herrenschmidt <
> > benh@kernel.crashing.org> wrote:
> > 
> > I noticed that the bulk of arm-semi.c (or riscv-semi.c) is
> > trivially
> > made completely generic by doing a couple of changes:
> 
> Last year I did a similar exercise in OpenOCD, where I took the Arm
> semihosting code from the Arm specific location, extracted the common
> part, updated it for latest Arm 64-bit specs, and then used the
> common code for both Arm and RISC-V.
> 
> If you think useful, you might take a look there too.

Well, one of the LCA talks wasn't that interesting so I started doing
it and am almost done :-)

I'll look at doing something for arm, riscv and ppc and send patches
once I get it working.

Cheers,
Ben.

> 
> Regards,
> 
> Liviu
