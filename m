Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp646536lfg;
        Thu, 8 Jul 2021 13:10:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxpMft90/3geFwcR9q//1zXWRLRDGEtXcu1BZmNqTI3AcIGvckpXOAkQDPJJ1VwVYsvZ/Ma
X-Received: by 2002:a05:600c:3546:: with SMTP id i6mr28452568wmq.26.1625775043633;
        Thu, 08 Jul 2021 13:10:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625775043; cv=none;
        d=google.com; s=arc-20160816;
        b=gOwl2yydzOTcntYbUk6qbsP0y7l0iLmDY4JGux5TrPdLQpU3vPSmFdW9VRIMDyGq+Y
         gxs8tjA+12UhmGCHWKOrdnO3yezeuaTbgjbWIztq1PU+XEzid3CYj1QyTKRbKsIxyYnw
         rJV3t1jYYyHsSM269XWPYx2Nl7o0WQS/65aA8GGCRE3Hz93/XQMwhoE1IyP4oHse4S5S
         1gcvQAlh5ZsQ6AE/RnTAB5H9a4LsNorFpBjeEPoZImrrc4zBsMGkCHEUq2xo0Y3/UAcm
         kD3kCY0YImCRGH+awLlRRflhqtQUlz99tvFt0NjAOcxYknhAKU2XN33Vq35gb/hopDET
         fpbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2G9nBmIYLHh+9p2e6miwlMUurOY+mO96KAtmbCn2hf4=;
        b=ko9sILW/+MVb3MD8ZaR0ThvYsZ+UbnngSA9itTfaE9Cl3QqIUZftfL0QnKs91MVMKZ
         +nN1DBfhr2GuEYYewMLtjFE7Doy69SBkxivxxErkNyGdozfdNjxuJIYUcTEZ/A6Mxc9R
         JbwkL2ITUzosCfYZ2VZfYQ3INPWochN5bPdtMJXcHPqUo7aom8E6xSGXFtRXShoLzp9U
         P1Y9QCVTOStysZ78X20TmDdnLDS7dqM+U+00FVL4Pig2mAGM7aoiJ8mpty5ai+BiwgHG
         bytTsLFnVYiE8I089hC4zGY28X7VbyYarhZt+0ujG9gFZMu8r5HHnn+s6mPr0BpCvCxm
         neHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rO08ItYP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18si4397637wrv.426.2021.07.08.13.10.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 13:10:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=rO08ItYP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1aM6-0000LS-O1
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 16:10:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1aHL-0000dA-0k
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 16:05:49 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635]:41567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1aHH-000576-6X
 for qemu-arm@nongnu.org; Thu, 08 Jul 2021 16:05:46 -0400
Received: by mail-ej1-x635.google.com with SMTP id b2so11813059ejg.8
 for <qemu-arm@nongnu.org>; Thu, 08 Jul 2021 13:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2G9nBmIYLHh+9p2e6miwlMUurOY+mO96KAtmbCn2hf4=;
 b=rO08ItYPEm7jlI6mzav3ymDMMq/5Fzp8+i2NA5Fw6XCLIYOF3H2ex3lu9UALrlMs3r
 FqIUjxL+yvYw6rFn8aga4wnFKMDVBY1dntkMQQxK4QTW/i1Q4LdxmRGCKUx58jsHmzMs
 6CZOPrC+dySRDbZARweTkg4mNA7sDnDn75F+JuK+JgMo7NfybdcPHuQd/2pkPsYN2TwY
 dbLBfCGiZPyKRdYyEqCMCWWRStHKlLPBIXhKOYsBpsoCLxGfEgfWkOE4Jn6QDGPQ3RXF
 xlhsAZoqgTT5+JFemsEybzcw2sc76mDKAtmLf5m//JrX2Y/Nwb2PQXe60F1mYgIrSCMx
 G84g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2G9nBmIYLHh+9p2e6miwlMUurOY+mO96KAtmbCn2hf4=;
 b=KKM+iXW5EJb6qIVSRKnkfQvjr7+o03UpKUkf86DWKM0WhPFv7CF5t/f4gOw7u/EdN+
 X3k9gWPTiUDBgad+1V3hjdxQG5rEgcmKkL6iLxI23amrwoe/UrkjIjmG44o15xseScfK
 Ill8+MhOv3+HZxzukxeVA4KQ54L8zPG7hFJKgD3EA+0sXgIg0txhUrliFgJJkYfN0Db/
 ekgjocgyiI23ZVmlxPxPeJvGWYdR23C2HYjBMG8IxB9ahfnQc+oAGeLol3BU0xWr2x2a
 eWkWSPPKj+Fq3QLrUHyqgqzHhEdQMxMCXa2Ep0dusCyV/yvlgRFbHak7SkM7+G3mbZUT
 +BUA==
X-Gm-Message-State: AOAM532DVjGxMaUsW3ycHxFSjYhnRSAcWJc/6zgyGfr906BAhWVw2juN
 KLSzMn+/sIdn9tgYxZseKNj/yjTs0hSFuxc3bNtN6A==
X-Received: by 2002:a17:906:f9c5:: with SMTP id
 lj5mr11691506ejb.482.1625774740883; 
 Thu, 08 Jul 2021 13:05:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210602180042.111347-1-shashi.mallela@linaro.org>
 <20210602180042.111347-8-shashi.mallela@linaro.org>
 <20210603114254.mkqr4jnpfqkx3m6w@leviathan>
 <e2e1b2e1aa54669c0b73dde83f0e20636835e1ab.camel@linaro.org>
 <20210604104204.z3hhm2cxesnm2jx2@leviathan>
 <16db7ae4bb0b38100a08f0539ae2865c15264f1e.camel@linaro.org>
 <20210708194053.ar4yspiodigxwbwc@leviathan>
In-Reply-To: <20210708194053.ar4yspiodigxwbwc@leviathan>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 21:05:02 +0100
Message-ID: <CAFEAcA-9XnY=4qsD9RGVy1sTW-d=B6MGPLd-Qqs7HWMRC-dfeQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] hw/arm/sbsa-ref: add ITS support in SBSA GIC
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /la+VF15Ho+Y

On Thu, 8 Jul 2021 at 20:40, Leif Lindholm <leif@nuviainc.com> wrote:
> I think my summary-summary would be:
> - I think we will need to introduce a compatiblity-breaking change to
>   sbsa-ref.
> - I think we will need to have support for more than one ITS if we're
>   going to be able to use QEMU to prototype real systems.
> - I think we should then start versioning sbsa-ref (like many other
>   platforms already are). And there are other reasons why I would want
>   to do this.
> - But I think it would be unfair to hold this set back for it.

FWIW, I do not currently expect this series to make 6.1, so we
have some time to get things right.

thanks
-- PMM
