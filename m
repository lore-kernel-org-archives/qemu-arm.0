Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp6764395wrp;
        Mon, 30 Sep 2019 04:41:58 -0700 (PDT)
X-Received: by 2002:aca:f456:: with SMTP id s83mr16958422oih.156.1569843718124;
        Mon, 30 Sep 2019 04:41:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569843718; cv=none;
        d=google.com; s=arc-20160816;
        b=K7oecq3qNEkzkZ+k1ga/Q8KqUn5DOWnz8culBb/mzFfIqCUe8InD8lqXBSWOx8pXpk
         4sqcGVZRAa2hkB8QRSj9qpZebXKIRoD0ki6eDfxHVLFLM7lTCpAgv3JNFYj2aP64nHTd
         nP0acfNWmA3m3VebXmSqh4BUAiwcynqTqKDgCZ8miK3ljtpQ4E8C9WC35lfrhqfDWVMd
         ICvAlkEU+/+UuXQldCkoxzCTJ4uC3NHTbxUwcUvRyLJauT1MPWiRJxQg2ygP5Z0ueBpx
         8eM95fRFb5jgM0t0K1kTBhX1US9W2b/X7l7tvwwZ94h0kB1i2adPtivp9w8WHuYxT3Y+
         HFJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k7kyHwRLGtVLDMErEunJvamrWstC8uYy8LdbeSNBN18=;
        b=EmL+Nbi9xjTA9pZSpUPDCLTxDzvvyRUbv/2PTfhzCppaVZXyTLiVThEF2X1gfnvYND
         /PDzs53y8g2w9aS5c9IrcbomrLkcLMWs0Gd/A8cYSmSwrBYL1kIk+A+3pHZEt9ufU+vh
         92JET3DiicLg0QGg1GHqFypTav6dIEzbRzYx5IVjle0XVbsGUQCwfex66iRbDCPydeCw
         gl6LkYx4S8lq9lqcLIXraqMoeIQehiwY5V1WYUnQey64nBsr6Di1WdCPNNstCHINoJeL
         6FtYAXIIh9wCYb0XYomxqBFAosjiOskYe3BC1MoNyPhL+1DmTWOK6y2RfmnqmRbo8u9b
         325Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jSUZpRhJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id z17sor4468534oti.132.2019.09.30.04.41.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Sep 2019 04:41:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jSUZpRhJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=k7kyHwRLGtVLDMErEunJvamrWstC8uYy8LdbeSNBN18=;
        b=jSUZpRhJ52Hh0QYwwp9EEE/de1pDLE3EJWKkwWoicZeubIBQQP5RHGYKVmmw7KSnvF
         6kbZqlPMeQYh3OjRBVbp+xBsE87/l+Tw63CTXmBZrOFcXESkxF762R6fY9iF5Ja/zGM7
         eUvoPzALkkaC7tmVVhKV/ZNIXsq6NOzr/lTV514bpcnUNPyWdQ7oY1tNb74yWxZUgc76
         stbvK/haaNIJ9Ce3CCVXTUb5mP0kolN1p9jUe/Cjm8rV0hYOACy8v3/g7XHJgfayuAwB
         0tBXrldKMjU/KTEq1JqZ5Mn4iqTJguqDamxQKRZoGgxd5wWgx5+ksKXDmCzt/C61GZ70
         Lo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=k7kyHwRLGtVLDMErEunJvamrWstC8uYy8LdbeSNBN18=;
        b=r83ONROm8HbN6u7AKJ3gk5Rv4ImYvZudfhHwJGKQGJzuwsf8ut8dvQxUnFtC8+F6v+
         pkje3RXbvYCHX33YkwqY12Ohz9Uhe/pda6nP73znmPJpdO5psssCCXrZfEewpgpu64is
         RS8JxU5Zo2A+uIyr7z3eZ3xkjlyQZu7qj2zYKi4Ejv0cRRlng4Tvn0GgxusL9kvGN1l/
         aX4vHo49FJLQun03pKOj6FpOCR611gCdX5xzczfXD1mcs2R3ZHY9snjdepFJ+Rop5+fh
         P6V1ni4TA/dDopsK2W1Akmop/rc7cPjg0ZIxFgMRffsaPYNn4OtC9o1LSguPqEdBDkw9
         1neA==
X-Gm-Message-State: APjAAAWthnhk0XFgV4IJjAcgG70nVlDNtM5COWJsIozJU1WjKS4sb5uT
	xlFxCY8/JoIJi6IJGHhRaqCFWspnL7oP/3vAccgjmlBoqK4svw==
X-Google-Smtp-Source: APXvYqykcT9k5Yli/H81QYigJPV+34hZuyK7uNJPr3NKWVgLvpaXMLAEt7jwHSzQnsggsCVaIT25inMhjMgAMIKgaiM=
X-Received: by 2002:a9d:6d0a:: with SMTP id o10mr12837474otp.221.1569843717181;
 Mon, 30 Sep 2019 04:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190925233013.6449-1-alex.bennee@linaro.org> <CAFEAcA9vb5_Mi_axWpu7269Zg0xMLbiiV80ofLeyDpfws3G4nQ@mail.gmail.com>
 <4512b61a-ed82-e628-88e5-f44ef87c2b50@linaro.org> <20190930092519.GB11996@redhat.com>
 <87impakrky.fsf@linaro.org>
In-Reply-To: <87impakrky.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Sep 2019 12:41:45 +0100
Message-ID: <CAFEAcA8_Zt+4RuXh8ww3Xm5=fQT+e_XcjZ6VC2N9k5mzLy0bnw@mail.gmail.com>
Subject: Re: [RFC PATCH] configure: deprecate 32 bit build hosts
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, "qemu-discuss@nongnu.org" <qemu-discuss@nongnu.org>, 
	qemu-s390x <qemu-s390x@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
	qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: iSxBTtNIx7PA

On Mon, 30 Sep 2019 at 11:26, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> The int128 support is due to the fact we are going to start to see newer
> architectures with things like 128 bit shadow capability registers and
> they will be a pain to shuffle around in 32 bit generated host code as
> well as requiring writing new extra plumbing for TCG's pre/post amble to
> pass them back and forth between C and generated code. These guest
> architectures may not even be full 64 bit guests so it's not quite as
> simple as saying you can't have 64 bit guests on a 32 bit host.

I think that for int128_t in particular, the ideal answer is
that if the compiler developers want to introduce a new
abstraction like that, they should support it on all targets,
not just half of them...

thanks
-- PMM
