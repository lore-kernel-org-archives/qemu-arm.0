Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp2916296ejy;
        Tue, 4 Jul 2023 06:41:00 -0700 (PDT)
X-Received: by 2002:a2e:9205:0:b0:2b6:e128:e7a3 with SMTP id k5-20020a2e9205000000b002b6e128e7a3mr5772051ljg.33.1688478060720;
        Tue, 04 Jul 2023 06:41:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688478060; cv=none;
        d=google.com; s=arc-20160816;
        b=wNwyiR+U+FDWlYz4/XtbtXuKIdSECGPNZ36gn4EyVrRm6CvwO/A/n2ppkfwa9pju2L
         ziiAVhurhssvH/pc26nLN4MV2J0xpm1SQZVw7T5OMkxZiwp0OD8zGsksNPWZpOL+iKes
         Bk6LFe8TAuAWM98U0Gv16BB951aYeMu+X8OqIiO4b5y5rp08O8Zpb72ON3SH7h8WPvZG
         QrhtYWJIwdxi7tBJl2QARe/CaMmKW4tsdEXZvt57BtNZXn7JyvTheRSzTTSSQBUWaFJE
         p0VAzKY/lVynI/LjCClYz7w5tI+SDjV9qGjpnRGeOO55eERVdPzYHrkzEHrJFNwkVFDL
         TjoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/lg0Whi/bgBckIsuGfUVC+la2EtqrOlrhiSmAojFdd4=;
        fh=xeZpCZUcz5+/LxCyKk6qk6KK9cD4mAsPbYo6D4//XL8=;
        b=ypiRTzPi0izKe1TEVCUSeRcN1u39JP+4wn7dqMuli1cLGTLGktFnSGJZaZoqtuuUOj
         JXaYNKnnBUfYRCxjavYmYIFkWnOejbVUNrcv1564pMa7FgjQzWfl6B5VTnU7gRmg0ImR
         9rSsMy6iTzA6r0CcR4BLIxZT57uZ7zxRs0UTdnatG06IOfZShmjYxrONAsyTHz3eWVgA
         +BrqOubBWOh6cHytmWpRs9SRZtIPI3jVuga9YXvD4CoNdbo8fXrj2Zp90pI1cgPprR+V
         Zg3phtqula6PBLNvc2KlVZdgPClh8WuJtwessA916RcAY5lOn8Nb4YR9YHm+evI3wm8b
         9WEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dmZQnr5i;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o8-20020a170906768800b0099232c10338sor6171931ejm.7.2023.07.04.06.41.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 04 Jul 2023 06:41:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dmZQnr5i;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688478060; x=1691070060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/lg0Whi/bgBckIsuGfUVC+la2EtqrOlrhiSmAojFdd4=;
        b=dmZQnr5iRm6uCZKm8d6ajNZUTn/KQdK0Zky+8pJLAGHprO0OADbck8b3+v199Q6LX8
         Mn6vwIYMpaSP0gkT3IXwqrGZFkPQd5ruLntY9S0A4oyOcXz45UYrlGw+dEO1s5QQEz0k
         DKJUJJlI6PNNENkVucN+eTSu+SaRiBceMNrUPH65juB1Fvf64vvWwfql/66yElQEws6b
         BfNlnE/Qdzet6AB7RjKfcxon8TCRwAsgNxfk4iabfT0lJWy0Urfvxfa4j84yM1GUYI6R
         fnRk2kqmA3h9rCedkHz936gvj9l2v9xFYKe6KLw3nEcnyHDFIUDQV0v9VjA8GfopZOGu
         Z5tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688478060; x=1691070060;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lg0Whi/bgBckIsuGfUVC+la2EtqrOlrhiSmAojFdd4=;
        b=QEag9v8p/HxaaXFEJaAy1vZ4VMxYIuPPjk/gUvd7ivrtkxhJ3gUMnU1udZXPwalpbO
         pV/VyicjEON2+8MFCO2HvVsqPPt8Q2bh/YIIrNwRUR31prplsZVLIAETH5Q6PoOgYiv3
         35m/0BL7r927iH52Fr6fuWuYdapyn4m+MZ4ACWPbzcVRZeYLixIFKPWI2aaX3ZxTVKxT
         4fmk8B5r6mxPWycvAbAyrlLM+n1G+PEHYmNLHA8ja4qFu2+JVH4v005unJhmJvIJ3I/R
         NSv/zyE483rCJkFb8FdmRDd4vLJxx7EJRP7LJs/sklHWICH67rHPO3/j/LM5H2xrSgrR
         cNzg==
X-Gm-Message-State: ABy/qLb2wOfY/SzFi37FSmUxa++ry9EnNCeeJHOwQ+lPiy4yeXMANJjc
	kK59S+Q1OCLQYV4NGLMq9SfqFuRhSfwkLugbtJQ0tDQkFV40Qb6OfuQ=
X-Google-Smtp-Source: APBJJlGdpjI+XAdQQEbO56rBZec1M2jV8oxfU+sgBOUP4+bkTXorxz/2FF9t9PRHIbPlVXgDSKWps1GXlTGCOLA9l+Q=
X-Received: by 2002:a05:6402:1482:b0:51e:22da:186c with SMTP id
 e2-20020a056402148200b0051e22da186cmr1075081edv.35.1688478060412; Tue, 04 Jul
 2023 06:41:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230609172324.982888-1-aaron@os.amperecomputing.com> <20230609172324.982888-8-aaron@os.amperecomputing.com>
In-Reply-To: <20230609172324.982888-8-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Jul 2023 14:40:49 +0100
Message-ID: <CAFEAcA8P=isZWs8kTF+f3OErv5Yt8eRQXZr87kkU2uWYEtw2Kw@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] target/arm: Implement v8.3 FPAC and FPACCOMBINE
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	Richard Henderson <richard.henderson@linaro.org>, Vincent Dehors <vincent.dehors@smile.fr>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: RbNzzXsC9wwf

On Fri, 9 Jun 2023 at 18:23, Aaron Lindsay <aaron@os.amperecomputing.com> wrote:
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>

Something weird seems to have happened with the different versions
of this series. There is also a "v3" of this patch that was
sent to the list back in March, it's the same text as this one,
and Richard reviewed it:
https://lore.kernel.org/qemu-devel/20230322202541.1404058-8-aaron@os.amperecomputing.com/

For the benefit of the tooling, I'm copying that line here:

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

thanks
-- PMM
