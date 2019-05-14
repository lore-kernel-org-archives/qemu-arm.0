Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4177633wrg;
        Tue, 14 May 2019 09:11:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqylyXfQLSiXS9Qfd22cn+2eqr7gl7c1Bd+k5jRPpMLaTBc/TaSHGgSkrI62cFzGzQAI6/Ux
X-Received: by 2002:a17:906:139a:: with SMTP id f26mr9774521ejc.154.1557850275222;
        Tue, 14 May 2019 09:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557850275; cv=none;
        d=google.com; s=arc-20160816;
        b=SJx7oi2QZtFh53vK3qIJz9/7rZ6nAK6BxquR2N7A2mnX3CvWTAzuO0qnFfCjSH7H7D
         rnH09kQb1vrvI3Tr4jaBYko7O0+AWil28prAKr+wtz9jGA16NtetrN5l3uyCw2hfyZBI
         rr3P1xXTNlQRp8ROu63IIUPqR9KbNlmvycGHFfnUIMoOBaXVxJGOnEAD8YJ9Fy96xxnH
         MCIYw2XuoWAa1mOh1DUxB+NA7LSsyK03B1zv7xca1y+kXgzkt+TrpDT/fxdLWKz9sVC6
         WdWGLrojkQK9D1Y8+GavximE2e1i6OQ5TVcoVbz7FD8nO7EswW/O7OGGxoYBQQUUz7a0
         xQSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZpmdCK+ZGwEPJRy3Nfak62DAqT/DdkPrXc34xgi3TxU=;
        b=TwsqiZjFAVAmG3ZrQR6JkhoVlN8XB1Up3RVC8hGbg37lW6FGkcYjz9oguPrwKhhfdr
         H6RHEo1u623nQ1eHt1L2S4+aFWevHgAX4jroa5J8mPStXfduJbMynoNwo1Bx6i5r/BOJ
         ojI7idj7g6MRVUlg3PqnuP7PoGlbSAesi+ImextIN9S4g55g40fkdX7sXRq74vhoSsWo
         gPBPvxQgtGTYfL0DPmHAF8KHswgVwFyo7yLr2nrX9A6xhclifyNu52ZNyOmoVem6T8bo
         9yHlYw9slIlFoZ3pPiwN+wejgiy5xdeQbgFRzT+DtBjTuT32UXk5gkVbyP+q7gGh1cRZ
         bIkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TkzBc7fD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l1si7874923edi.385.2019.05.14.09.11.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 May 2019 09:11:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TkzBc7fD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:50610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQa1K-0002zA-58
	for alex.bennee@linaro.org; Tue, 14 May 2019 12:11:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37472)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hQa12-0002vD-GA
	for qemu-arm@nongnu.org; Tue, 14 May 2019 12:10:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hQa11-0000wW-GC
	for qemu-arm@nongnu.org; Tue, 14 May 2019 12:10:56 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:39857)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hQa0y-0000r9-4N; Tue, 14 May 2019 12:10:52 -0400
Received: by mail-lj1-x242.google.com with SMTP id a10so6880296ljf.6;
	Tue, 14 May 2019 09:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZpmdCK+ZGwEPJRy3Nfak62DAqT/DdkPrXc34xgi3TxU=;
	b=TkzBc7fDo6TZGdbmm5Yqzir6G13RxLdvzfGPBNOoe9WgHrE8JCDX6aHjUaYEVw86X+
	2c15fiDqHp8uAfU5s0IlfNc0a9cqHrLxgnXEUkoTDHETUjnU2kXQhUHHGz2TR8yKTg37
	48vWLgHPTqxvfjCXWNdTPPE2oPNWI7rxlvsTWSd+OYFEps7SDTIgsgd9Jir7fSs1jLpV
	qjOmmp1K0wF1vxMZjXVXjmEagMOuYdy7Ah4e7MHpRtFK2D95+ak9z0B9hLlk4zkbxRrQ
	c99fZOrShjddDPVXlmkj8KSTmZrlYSUDPttGxvDVZ2xemN9jqPzQ++ZTksejPCM8T1Fa
	ur3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZpmdCK+ZGwEPJRy3Nfak62DAqT/DdkPrXc34xgi3TxU=;
	b=UEs5qTbtj0Frm1vJJ1h1clRLFTZvhE7AfJIXu4hlXn9uH6roV3dQPZaVlGZDmBAuHa
	w10E0S0CxLqILXrsZRNjX43kd9zTj0IT465bmmqWbJVv8j6Wa3f5ZfPGv7JQZqBiowuf
	lpbZ6OKjN1Dxj2FDxQWckZyCDTvX+GphlVlFeDGoZyZGskUNTEr2C9ttF7lclgmy9L0X
	QAppGA2Q9ozYeAFzi1oDraQHCNgjZVrPy9wJoN1vt4irPPmkcSO4BHV5CNn/Bqrq3wdl
	bXtJavCl2D8lNm/Yf1FnPAAVOSJOAeC1SnN4rxRUq++dTlF+jgkhPkgvSptxfcQcfUW/
	NmPg==
X-Gm-Message-State: APjAAAXtUvjXF8rsSquxgWT7+H4bgkgzx97+o7BkZyQNjP7u+rkviiqR
	UvO16ihOHNJ76PPf4mOatpDCgxcLRH34wvSKjOw=
X-Received: by 2002:a2e:8709:: with SMTP id m9mr17508557lji.140.1557850248896; 
	Tue, 14 May 2019 09:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <ed7713d9b6c523d1c453ed7ac5de5501ef8cf405.1557792121.git.alistair.francis@wdc.com>
	<28f47fb8-78e2-942a-a678-0d44553ddc55@linaro.org>
In-Reply-To: <28f47fb8-78e2-942a-a678-0d44553ddc55@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 14 May 2019 09:08:34 -0700
Message-ID: <CAKmqyKNkWuuyVUMOyM0zfDsWVTiMotzuoxs8nOYJaqKegPbnFQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v1 1/1] target/arm: Fix vector operation
 segfault
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 66oZ7VQsKUP5

On Mon, May 13, 2019 at 5:19 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/13/19 5:08 PM, Alistair Francis wrote:
> > We hit the second switch case as
> > NEON_3R_VQADD and NEON_3R_VQSUB don't return from the function in the
> > first switch case.
>
> That's the bug, not here in this second switch.

Ah ok, I couldn't tell if it was there or not, I'll send a v2.

Alistair

>
>
> r~
