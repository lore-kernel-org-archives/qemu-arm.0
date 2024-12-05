Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp436505njb;
        Thu, 5 Dec 2024 13:27:47 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUDt7l8SN8T2LPZRJC9NUWAJafhiK5bpV+mrbhkkk80o+KOcCBdOfoFVWw6o+sjI34NB9FduKA/fFMpQw==@linaro.org
X-Google-Smtp-Source: AGHT+IEISdXIonuZgeZIqG7wWdsjGTCUB+QiVQ6cXlbWVrhQ+o84pk+g14QR1rbLL4X5sHGftF8P
X-Received: by 2002:a05:620a:8010:b0:7ac:c348:6a52 with SMTP id af79cd13be357-7b6bcaf1012mr91328885a.34.1733434066947;
        Thu, 05 Dec 2024 13:27:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733434066; cv=none;
        d=google.com; s=arc-20240605;
        b=HtRQXhWQSLarf+XoNZozst0f/MNYGbSFFiXGm2POanNVyER94xPAxx65la3bOv1j+D
         bCXGegxK9Se/hKU3FCLMfzdrfGLgOduj7PU2EZ984V2OwAW+6vs/UkIdG1h6/Nnt1k6n
         svUbe9Q0c3nag5QrSp7LUNq8/6HmMh5tr/kqs19FUcy5rNvKiOcNVH0wBgdIT9Prytfs
         rOMhfPsCTT9Tl+Uy87Al9oRA1xH2yEX1Kkd5Yv2FM8Qr9HI9yNg5Fo7FabXOPv2KrUet
         xFMofTeYA+tcc17lVrArFRmfDqfamQyY/S76PcaZQqdE0ZBYpx2Vxsv15ZFKC+fexb6I
         4ixA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1atv2OOJIGDmQ398j/z7UHHtE0Ox/5QmzfX+EUWF9KA=;
        fh=vbwSRXXR9OQfFa7xPEBhv0ffYM0dDrw7fWMZZewPVBQ=;
        b=a3PTnuHqA/k2B8Y4ZV52r62550J+yqBj0/q3+lxzsTK0x+xIOycGR4EEyhYldAWaUw
         WCwRyFvpD7+eDCe3Bw9xo4jNb93w/H8KXuqIK0JJGEpvRug/Vh5gE71FFWhhl0nNxDeB
         GnFYWaeXXX9Tt2GvhrW1Kx0rxV+wP5+aoShsW7pyAwv2tCgSZOMsFnADS472o5l+VzYQ
         hZp2YtY92BLonwK/p2MtXPCw3mCrxMVNsROaCHwP9euonMPjzv8Zl31dc/61rYDl9maG
         8gHWUj/rTweoww3FFTRtiMLEA0RCMwoACQtRvjSRtcEcaLA1xecKrCyrNt7QKrjoX9nC
         NDCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KK2ASPxM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5a4459fsi248884685a.76.2024.12.05.13.27.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 13:27:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KK2ASPxM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJJNl-0005DC-Rp; Thu, 05 Dec 2024 16:27:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJJNk-0005Cv-JR
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 16:27:32 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJJNj-0005mp-6g
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 16:27:32 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5d34030ebb2so1157043a12.1
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 13:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733434050; x=1734038850; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1atv2OOJIGDmQ398j/z7UHHtE0Ox/5QmzfX+EUWF9KA=;
 b=KK2ASPxM1rDJDmsKSaZLcVgzLi7lfS+gq2WTQ/OA89NtSC1yAA5eF5pyBxUYoPXSiS
 s1HmfTulW0KLm6jb3r0v5Puj1T9rul9/ikMEPru2lGfl+auwFVIknCqhK7qmPJzkDon1
 KNwOl8L/8nKsFJ7Uzqb3AM17RAHD+hpFz133dD5ZMNl3eV26aAirupCjXOAhMNPWy0fg
 8Lll4TwXXtTx6p+LbFZPY/65SKzFSylqwIiIyHUVXt9rob11CG6M8YxfGG1Yd1kxnK7O
 q7TsAQoxqY8gTsmjUav3SQcvnqi2l126e7kTv9WbGgtyrAlGdWfE2F60e2CWvOdzzkdF
 NY9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733434050; x=1734038850;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1atv2OOJIGDmQ398j/z7UHHtE0Ox/5QmzfX+EUWF9KA=;
 b=I7UUPaWk8r48jQZeJoe7aHnWP0fyiYL2pRJ0536fVs3AjpdMxJDkXCvjXRxxW0xsqM
 k6intWLZ+cfzgRErMX3WY6uf3yfbWgFHr7T+ku0paK92PjqQ8I+IjZ/QRPepDXYuMojC
 hmSUo6kutWib2SDJA7d6cAA4agK4i46+P+uj7eUlpNKsCnM06UlheMyNqsEh4+niywVr
 IiCiRkCozLHkAtQtgzL0AdWJn0h622IUaQEothsuu+rkj7GutYKGQZFmpy/SWTo/MFNw
 Uz2why61MAsIhNuwwAPkIn+2cczfAuWvjEKiCM3kSI9psXU7AbTShNnZ+fQSZUolRGz/
 q1wA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJlpO6nIHi/VWqeoAjYyYkmK1rusHU2kUwiDW/6cAlcL2Y6mjeY+nsgxPDfsmoCc2bpHt97+LJSQ==@nongnu.org
X-Gm-Message-State: AOJu0YxuA6t5h/TXWYrpNXcAx6m1lvHJIdLzLhe0Xczv+xxH8GZce+dH
 ZkYSf49GmW2ZJfTdOUHgFYJzErxhmH9VHFk222IwudrcnOefjG2GCWby8c2Iyff3GnEo44xSaA6
 CrxewmkDnhmuGBk9Rlkj8Aq/NpxJHiXXbkuDuBw==
X-Gm-Gg: ASbGncu2IIxYdd87kPtSNaOQnfw/bJIvgNm54HS6nCV1T26YibRzIm+7X7/eS4gQElb
 ajxLkq1exnkZk69iZCf/XqBUF/zan5jMV
X-Received: by 2002:a05:6402:348a:b0:5d0:e54d:5ae8 with SMTP id
 4fb4d7f45d1cf-5d3be7a6cf5mr478484a12.34.1733434049634; Thu, 05 Dec 2024
 13:27:29 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-23-richard.henderson@linaro.org>
 <CAFEAcA-2nA_UYVt+U5hkngxxNEEUmLa6EBkt18v2=zv6PUMMnA@mail.gmail.com>
In-Reply-To: <CAFEAcA-2nA_UYVt+U5hkngxxNEEUmLa6EBkt18v2=zv6PUMMnA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 21:27:18 +0000
Message-ID: <CAFEAcA_aaioxN2_ePCcMBLkaXVoUx1mR8-MmAar9tVNJMtAa1Q@mail.gmail.com>
Subject: Re: [PATCH 22/67] target/arm: Convert FCMP, FCMPE, FCCMP,
 FCCMPE to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: DXnPo5mFbLGO

On Thu, 5 Dec 2024 at 21:21, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Sun, 1 Dec 2024 at 15:17, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  target/arm/tcg/translate-a64.c | 287 +++++++++++++--------------------
> >  target/arm/tcg/a64.decode      |   8 +
> >  2 files changed, 116 insertions(+), 179 deletions(-)
>
>
> > +/* FCMP, FCMPE */
> > +static bool trans_FCMP(DisasContext *s, arg_FCMP *a)
> > +{
> > +    int check;
> > +
> > +    if (a->z && a->rm != 0) {
> > +        return false;
>
> We did not check this case before, and the pseudocode in the
> Arm ARM doesn't check it either (there's a comment for the rm
> field that says "ignored when opc<0> == '1'").

...this probably falls under the "RES0 UNPREDICTABLE" handling,
but "ignore the field" is permitted for that. If we really want
to change our choice of UNPREDICTABLE here I think we should do
it separately from this refactoring.

-- PMM
