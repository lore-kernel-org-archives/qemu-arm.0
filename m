Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp7042355wrv;
        Thu, 1 Aug 2019 07:38:30 -0700 (PDT)
X-Received: by 2002:aca:7293:: with SMTP id p141mr56926758oic.122.1564670310265;
        Thu, 01 Aug 2019 07:38:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564670310; cv=none;
        d=google.com; s=arc-20160816;
        b=1DxDZv4S/MCpeCpcPDKdAutxdRe/PkqHM2XH6AMRJY6p7N0/WmD5YIN89JrhW0p5gE
         9oaYhvcP+tK/GJGMAHgt9t7NVXeNJEsSEt6risHmX1G8lQjxfuUqLkKfQU/7peuVIdso
         OYKKEaVc+IL15nkd5XkceoXv5/1SJL20i/rSVpXjtGXRRh40ow7aD7TfZHuVOs4UkSpt
         B6JFHkeDNJhOrfu/9rEERy5ufDoE9fzFhDtMYdcxKqBQR5KXZJn+0Fq0jpT/iN/tmc1J
         6P0JRJIoZt0USwtfIZQf4JvfOs37eA2z8n880zdft5k7eLkS4LuW4a8Lh9iU77rKbeTR
         gYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sd+kBTIn1vxtV46hDUciCkeOpwmQ7MLQs/Y6E4lbOlk=;
        b=QK5WrVQJiCqp9NOm0Ivhfg86ejSoP9T95VF3N0nQko0/va8yT2ArUYSdBJDYMONB14
         kquh1QFjnp3qbZGxMflrk5KU0yIj1SAgsy/Vm5koJgV28yYA7ktNJs4SwIB1u6RTZecA
         tZCgC8Z6hffOyQTWxE+q+jJKW5Liszq3nODieQAWFI3gPJhsQgVzSBcLacR/KfRsDcdf
         Ap6f435Gp5etb5KDu8/6xEmdGsAkTcQAcjHKCcj2QBTKCsCheakHHlAch68u4PEue9Dt
         Qj2NEL9BxtMzsBXy0PDdQ3ambtHjHxgJylRZMfBpgJHaCDV1AkSS10TBLLiyySdxoQip
         In7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d7CtjVII;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 66sor32855768oih.141.2019.08.01.07.38.30
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 01 Aug 2019 07:38:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=d7CtjVII;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sd+kBTIn1vxtV46hDUciCkeOpwmQ7MLQs/Y6E4lbOlk=;
        b=d7CtjVIIujX5QmgM5Ti0tRBBdy0ZQzCYhliixl+F16Pzx/MQ/RmKMu7Qf4ySFCD6P3
         2uffV2HASIJJ99YdpouXvfipmgwhYhQOn7M7h7wrOFBMOOo9y3wc9we19BwbiEO9B3jn
         O5KNm9Mh5Vir9sOso1xlz3/BrdTq6KnMmLfIY+lvAZPSslH3L79yUsgyu8sSnGe1lfns
         xDcDX+GkYkD+2zDBVaGDtrOe/QQtZax7zjgBjZY/KY4ILXO9WYe7ZOtUkf7HF/lBNNHh
         pLZWH6s9lmfGOINGYem7TeUlijjTcLgpeHgeHMs/H8R3B46AQmUKitsyPf7daCySu65U
         VVDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sd+kBTIn1vxtV46hDUciCkeOpwmQ7MLQs/Y6E4lbOlk=;
        b=DkHaxlWpy7xTQZxbIQRzMyGPQn30q+w26WH/dzwud2YwaVVDOQodYr7WNgdmzS9bVf
         euZjZffnzBuDErVBWeF8GSeS1nr9Db5LZkfEy3RzRLZi7Dbj4EXML9+657VnO9wXqc6B
         yRjrXdo5+4QAjl/4eVO+17Owf7lGq7Cc5pNAjUvRHVjLzM2OwQbiNhyzPZOx1hITn5Ju
         d2reTY8QKcYNevJxyMX9mAOYx2/8DUg7Nc2NdufIgQj8fp/wbLTrf2xk+mXMTu8iNWwM
         myILJgZrooJd8TtlZIDeGrKzeCLL25OG97vMVP0Dt14NsdObviJao8DxQE9IVDxkZx5y
         XVMg==
X-Gm-Message-State: APjAAAXWBEx8iMVWeZ5nVMNIWQCg4cOmhbzigUSD6hWZ7hPUUxGCri12
	Pqof/mApcW5vQDFDgxoaDHn96sqXGF6w02/GvGLVP1wQQrk=
X-Google-Smtp-Source: APXvYqzEvIY2nh0q0cKiIHdSiiMs6cqXWwr34dME9fJZdqYM9hLJKBGevw35/foXDbD/d/dqnkXolnBCX8h0qYWZOXM=
X-Received: by 2002:a05:6808:8c2:: with SMTP id k2mr61800073oij.98.1564670309823;
 Thu, 01 Aug 2019 07:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190801105742.20036-1-peter.maydell@linaro.org> <af347b17-b524-1075-d462-2b0e6eef41a5@greensocs.com>
In-Reply-To: <af347b17-b524-1075-d462-2b0e6eef41a5@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Aug 2019 15:38:18 +0100
Message-ID: <CAFEAcA87XdDJH5TO-AiDfSqudmwzuY0yoa0H60objxXp3Bh9LA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH for-4.1] target/arm: Avoid bogus NSACR traps
 on M-profile without Security Extension
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: ctijkpdYNrN1

On Thu, 1 Aug 2019 at 15:20, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
>
> On 8/1/19 12:57 PM, Peter Maydell wrote:
> > In Arm v8.0 M-profile CPUs without the Security Extension and also in
> > v7M CPUs, there is no NSACR register. However, the code we have to handle
> > the FPU does not always check whether the ARM_FEATURE_M_SECURITY bit
> > is set before testing whether env->v7m.nsacr permits access to the
> > FPU. This means that for a CPU with an FPU but without the Security
> > Extension we would always take a bogus fault when trying to stack
> > the FPU registers on an exception entry.
> >
> > We could fix this by adding extra feature bit checks for all uses,
> > but it is simpler to just make the internal value of nsacr 0x3ff
>
> s/0x3ff/0xcff/ I think, given you put 0xcff after and in the code

Yes, 0xcff is correct and the commit message is wrong. (Bits 8 and 9
of the NSACR are RES0 in all situations.)

thanks
-- PMM
