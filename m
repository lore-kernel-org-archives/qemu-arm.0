Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp371944lfg;
        Thu, 13 May 2021 03:56:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFcg/0zZofPuZVecJRfP2MWDYSQMBxJBR7ya+Y+OyTDghRP8rIxhcLngYugVUd0EHR6lN5
X-Received: by 2002:a05:6102:2ea:: with SMTP id j10mr36683417vsj.46.1620903359973;
        Thu, 13 May 2021 03:55:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620903359; cv=none;
        d=google.com; s=arc-20160816;
        b=uHQnr0k1OQljwbRGTqnAtthFz9HCcyv0sUg0dnZGx7dmYpfnxUnOV3+Ka0ffk4zG/b
         gjBUPmIrpfjTW5JQnAYzRgE2UELlXmX+kMG4iumECfGo2vxcvDEaVANf9Grkvo12BQ9C
         LPdWdL55Q930eRNpL3e8U8CFN3aonZGFRIJDsl5qNF1MuWp7Bnv3sMlt7EsMTBobT7Gg
         4cAihBHLMlHvXbJgvI6vwJ2LJREFHUp2K3S5HI7i+Y7AHBy3GM3k3rTlfj8Q+LQ8GiTC
         F01bEs/MLPxlsBOPimFGJbTRwctGyLY+iQJ8r50af+nwULOGoWE0m6areUMI1llxKg4B
         0r7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SjQq5kMRx9t0ry0aH2avs96pr/9GpuyAlWUU7MAX0eg=;
        b=Dy6MaZgCBdoOD16HUvTJVEW3ZM6697CL1aO0FsWC+7mmZGwqEFrwzN1htWa5TjJRdB
         Wz6BP151TRIXhyqBRQSLZxSSPJBIhAGA6nrevoDAMERbGSB85wUlebdrCbZWIVR9j5mI
         wM7bp8Agucp+O8RjVbEMjGyRN+OetTkcKTmBq9+OnPhPeYcdB+fHX80ijpEs7X2uapTj
         OgWBeu21CgfqClQVcq39zBiUM3DMv4vLWZ8/sYKElnmpN5kQ+W3xEMQ/jsexiLF6lDiM
         zJcHMZXK6z5DV2jVbue5d2dkQGV8GoJ4FlGljAJpzCvihPuX3jPbKRazfUyt2yn3UyQA
         BOdg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k+M44BQe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2si1805045vsf.190.2021.05.13.03.55.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 03:55:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k+M44BQe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lh90Z-0008OF-9w
	for alex.bennee@linaro.org; Thu, 13 May 2021 06:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8yY-0003RF-QU
 for qemu-arm@nongnu.org; Thu, 13 May 2021 06:53:54 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:41649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lh8yV-0006O2-DQ
 for qemu-arm@nongnu.org; Thu, 13 May 2021 06:53:54 -0400
Received: by mail-ed1-x533.google.com with SMTP id v5so19396248edc.8
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 03:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SjQq5kMRx9t0ry0aH2avs96pr/9GpuyAlWUU7MAX0eg=;
 b=k+M44BQeMrVaRMgmJfRpbtQeyYAWfhSrLF2olN0MoVREKSCvZ7lgZFHbnfu0bU6GPG
 nndnReSSz2KGrWipL3zu1N9un1C40U2SQOONxzsh8SiJ4y+ocQK5pupfpeF6x5sVbX8z
 42Dw3BPh4nZRoxnKCEaiyu5gqTagJoT4DDDkPcpQ9spKOcl4ptKyZfXI6mOMAtY2CTu0
 dlhk3j8cDJoag3ai08qDmCEauPiBYyLDm75dt3T3UIe8f/J5i9GdMtbrcNG7gjlfjRCe
 7rzpsBgiY2RbneRN0GaNhcMnY1UZSwXuYgu0mV3aTVLmX2Vbi6dUCEHfK50uRXkAnBWZ
 lcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SjQq5kMRx9t0ry0aH2avs96pr/9GpuyAlWUU7MAX0eg=;
 b=RrVEki7ItfQ1WAZa8XIe+xnNUk4mcZ6Q427mO9tKQL/NC5SyTfq941LSA9WerI8wOp
 oggGalowLR87HT+AkwLGRevITA3vCQvZq0Re83eyypv0MR9e5dF/A1AP5C8obWqQqm9o
 0E+4+v14gHcynFmY/p62E8VZLwiS/bNIoysrmxOOAiJn8rtY8x/pGE8Xek0GYvsiEuqz
 IyYMTmZW7m/rRKH7msb/02dEB9BS4rYd2LQwvuznrYM7pvc6aGLrXj7phGAyuswRq3Ms
 HiovGprx80oVXTSVHtY85r/fFrHFPHrmEvGTPu+vuViYau1Ghhm2RrLaumYKYEIj71Ir
 kHIA==
X-Gm-Message-State: AOAM533N+uaPLPLBatSrNYXLE45kdR1FcQHMWOJUDAb6zMnmojbUARQ0
 5SY/lJ5C6sgVz5OufL8Fk+dbnNjb4RrAwob9oZ/P4Q==
X-Received: by 2002:a05:6402:416:: with SMTP id
 q22mr49601018edv.204.1620903229726; 
 Thu, 13 May 2021 03:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-52-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-52-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 11:53:38 +0100
Message-ID: <CAFEAcA8OLc6LKC+M2djTjZTFBzASwBysBCQa0NAMXo=ReTwnjw@mail.gmail.com>
Subject: Re: [PATCH v6 51/82] target/arm: Split out formats for 3 vectors + 1
 index
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ECIQObOcEnzT

On Fri, 30 Apr 2021 at 22:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Used by FMLA and DOT, but will shortly be used more.
> Split FMLA from FMLS to avoid an extra sub field;
> similarly for SDOT from UDOT.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve.decode      | 29 +++++++++++++++++++----------
>  target/arm/translate-sve.c | 38 ++++++++++++++++++++++++++++----------
>  2 files changed, 47 insertions(+), 20 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
