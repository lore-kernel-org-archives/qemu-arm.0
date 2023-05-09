Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2765631ejq;
        Tue, 9 May 2023 07:34:02 -0700 (PDT)
X-Received: by 2002:a05:6402:605:b0:50d:91c8:9e10 with SMTP id n5-20020a056402060500b0050d91c89e10mr8589033edv.10.1683642842817;
        Tue, 09 May 2023 07:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683642842; cv=none;
        d=google.com; s=arc-20160816;
        b=fba2f8VvvjzlGiMAiG/t5E2aFeY9u787Gbxzss7JJZspwytZPzClvNBlMAMGo/ye5E
         NDkNh98qsSIbii+6dXKB+nS2Ste8bfae54kbZjMeTYQTo/aYfJ3lHgtYoZeigYgZRhRY
         LJHRFv854ZSXju4vN8QCPurT1m01jFf94kjfYEJ+QIySKyDKdsXivy8tZMBEQyuQvv2N
         +xh/lH73VxYzY8ndhfRdtFejw1LnyrsHVLNCHQv0ZxO37g+6kUqipUNPr+ertyHeV9H5
         2PZFAH3MFkKppIKP+tVaPHENu/MDJvL06/WpG7vXtCjeEwH0MLNE8fFLN6ZIxGnrM5qh
         rhFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yitkHOatw+41xMWb2v58gR45bgh1aVCxP3+JcDGrWe4=;
        b=uWsvP8GTrYTxCmgRiEQEqv1EFF7pTeFlR/SxE1//VpzR+XmqTMLm8sOjkG1fCT73ae
         mKkeWtoDx92Tqe4ldUAe6qSFLBrIFYRh4RmdWW33QwfC3FUTFjLN9Madzxas0bigx14K
         t4vX4m/WxHqYUJJVgLz7hfOEw+EwuMzkaYO6EFkwGXKpbDMm/GqdpEbhcoizXnqkRHNr
         SoggryleeYgCctQM0LeV23lR6qrQFNDzNsq64zdiixm5d/weMRKabnBU8T5jxElL/H08
         xiAgK0QmGUWoiAuLZ1zuAS4q5Fw0xVA5i4fFl+0aiCRYs7fn7W6EOZz4hTWgqQq958hE
         3DjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MnNBtGc1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u2-20020a509502000000b005048c32a533sor1064433eda.4.2023.05.09.07.34.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 09 May 2023 07:34:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MnNBtGc1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683642842; x=1686234842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yitkHOatw+41xMWb2v58gR45bgh1aVCxP3+JcDGrWe4=;
        b=MnNBtGc1IyZ8dmNyzJgev0mvjZq/P8QhS1375O0BJxNDCBUIPjb0gChZOStI2gCE4r
         +7zTWrWV2y+KSTHRYvNgK1jtzP0VmTm6ijzeRQloVstXuiDWn25s12Yp+3gAHqYMOnk2
         IVY6ieJvyvI7Q1tlkxPGMOX66LhkFyXLJyhN+HHzbR9FGTTBV97ZKhL26oQqkIOfEqzC
         ojr4tae5nuNWQk6bRA084fAfdVbxifDy+EdQQkgVK93XAQUi+M5e0lMj+IfafNl7Qxms
         tuYVzEz6pld29nRqU+MXjErsmGOkIqsjmKpzvclLjUGqedcH2tNfx2wej1gWMsd7Kca8
         Vh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683642842; x=1686234842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yitkHOatw+41xMWb2v58gR45bgh1aVCxP3+JcDGrWe4=;
        b=k8zIZpq9uTBUzxq2ZcDsaLSzY/oGfZHQV75/O4WLR5SsNty75N4nZV5h+jcYhmxVPp
         HgA9z1uiAggFXQPWqGrUg5ehNUaf6ov+DPEmKriXBkQgH7LqZewG6WcCbw66rUD16EQa
         M/TPD+eG77BKroeqYjrMC4Y0IMDYwaYfsGLgYM6XdGff46AyW+3Zg3gHUsQdVNbL5Xr4
         EnFBbj+IdAc156U+bO2ha+Jmmy+bizyeipyHX5tYG/+S7e1f/1Ve0SgN8bN0Fjs4KsS4
         uiKcLyAU9BI7lNa20fq2Jm4sjDSb0c+bchVefYFDwO01HRtNE2tk05oDInJHzV8MZMro
         XQdA==
X-Gm-Message-State: AC+VfDxZQmNPtutMpsHBJW/i0n1vYr8/AR+Hk0dEXhCOsKHLIf6V+Lv/
	UhwUWS/gHGzjD8RNUFCiSmcscd5oR0hZqR+hIA7NRFtmS0PcR30EiFw=
X-Google-Smtp-Source: ACHHUZ5gD5BJH4YVtu+jFcFneKbKmXftdOcOs3lBAEDCP44UNh+UXADB4yovPKbuR/9Anutb0u7Jz/5bveQVBBMIzUA=
X-Received: by 2002:a05:6402:194:b0:50d:9b59:4330 with SMTP id
 r20-20020a056402019400b0050d9b594330mr7632788edv.4.1683642842430; Tue, 09 May
 2023 07:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-7-richard.henderson@linaro.org> <CAFEAcA8muJ84GMqSBuU0P2YhfERM-kftfq07N8BVO2yG9p6jBw@mail.gmail.com>
 <8988fc6b-8f07-1ab7-663d-3392ca19f7f8@linaro.org> <CAFEAcA-79iL8=+143w1jxTG1WM-8NODqqgF4droY=avopm4a7g@mail.gmail.com>
 <434236ad-8348-1e42-23e6-3ed7d6c21366@linaro.org>
In-Reply-To: <434236ad-8348-1e42-23e6-3ed7d6c21366@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 May 2023 15:33:51 +0100
Message-ID: <CAFEAcA8hXYK=o98FSG+X9Q4PyamPePaYvoSYdN3jHt4V0qikmw@mail.gmail.com>
Subject: Re: [PATCH v4 06/57] accel/tcg: Honor atomicity of loads
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
	qemu-s390x@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: +hRoO2MU7XCi

On Tue, 9 May 2023 at 15:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/9/23 13:04, Peter Maydell wrote:
> >> If the LDP is aligned mod 8, but not aligned mod 16, then both 8-byte operations must be
> >> (separately) atomic, and we return MO_64.
> >
> > So there's an implicit "at most 2 atomic sub-operations
> > inside a WITHIN16 load" restriction? i.e. you can't
> > use WITHIN16 to say "do this 8 byte load atomically but
> > if it's not in a 16-byte region do it with 4 2-byte loads",
> > even though in theory MO_ATOM_WITHIN16 | MO_ATMAX_2 | MO_8
> > would describe that ?
>
> Correct on both counts.  While you're right that this is a valid generalization, it's not
> something for which I've found a use case.

Yeah, that's fine -- but we should note the restrictions/
requirements in the doc comment for WITHIN16. (And maybe
an assert somewhere if there's somewhere convenient to
put it?)

thanks
-- PMM
