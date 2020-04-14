Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4656550lfm;
        Tue, 14 Apr 2020 00:04:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypITXR5io3fCe2SFVqqSUCHy4LjGWlluw24aXHVme1PlMg4vYlJcITnuarzbz5116Ki8hkHL
X-Received: by 2002:a37:a650:: with SMTP id p77mr18997113qke.342.1586847892478;
        Tue, 14 Apr 2020 00:04:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586847892; cv=none;
        d=google.com; s=arc-20160816;
        b=sffMPMe7QxxWU6qbEpP3tREYDPvWcthOhxhSAP3or4AThB9eD+3tDGEEC/MdnwZML3
         2ryzRBWh1qKo0LeVhDS0BX3yGO/V9i6YV5EjwD4mc27fPTwU+0nZJwwC1rjkdMd6SkHC
         b3raj86/NIFH57ns1DxMsjaL4igiRFMJPzev+wt/h/0q7Wq2giodvrrL1oVeXmAadURg
         237amlVSewoKgYFWl2rPNjnPy0P8bg7K9wN5I64rjUq9z3NZbA+Kw6FF13mcjxdO4Ctw
         nN2iSZQTCf0/3f9h4Xzm2GaVEUmgwYj2oZTw3CaezvnLPb7cn7g8Tp18TvjvRQsj1QGR
         oxqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JzEKBDC8MCFs6RzlQYo+6BPJPoODwW8SiaUozInCHTk=;
        b=JJf6aPJBwBttEqWdEiTFEwfzpPDIJAFHbXWfYvyGmdSm+bX1bWRSTR8kyBu7XuM9lE
         s8SgNDLJiCrKdeXvxl+8hxLhQea563FVI86bQ37oAjel6bLBXm3DVbJ9JUvQc8rLRb+H
         wFozA12kS94bM+JV3ViPB/shBW6JGOxfl0Wu2qzZZyurQ8it7u8jZk7ra4CaDTFPjE4b
         9ljXYMA8ZmFUJv3kWVyAy0y++Enweqw48Aj+JO6aIuh8AI7JFP9Ej6J/K8wgJa8C7nl8
         Lxuqptne8YcER5F/XwMTiv+fNEz4YOMK0cuxETg4A2h+3veZMAfGn3n2jgO3rVvvIvD4
         9ynQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VIsJc2XQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u16si6289444qve.88.2020.04.14.00.04.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 00:04:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VIsJc2XQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOFcp-0007I3-Tc
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 03:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41467)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jOFcj-0007GC-0S
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 03:04:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jOFch-0005kc-Ve
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 03:04:44 -0400
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42]:37711)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
 id 1jOFcf-0005jR-Ki; Tue, 14 Apr 2020 03:04:41 -0400
Received: by mail-io1-xd42.google.com with SMTP id n20so12141838ioa.4;
 Tue, 14 Apr 2020 00:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JzEKBDC8MCFs6RzlQYo+6BPJPoODwW8SiaUozInCHTk=;
 b=VIsJc2XQnUhAI3zLm1/k5e1jLgkypVjZzqcEKIzwbgkepMU0nc4J8uxr1YViXoe4qW
 ea1MxO/xo2aG5KjkBJtQxr4PHJU2b6nDsKH/fa1qpgdfy/Lg3KhRItuxilq4+1tIWN8C
 Bzz0cfUZoJ4bk4fZJV/LKGlakXAw6m1m6OieCWZCQcVM5A0jMaY4zuJsFhL1W3gOGLc3
 hwu51EmCiKMgVGsJL6S0M00NXRrQqItoIIiSv1lRlb1fiK+2MTwdTgm797tU6NSsEUZp
 +my733TdOXm2pM8vrodDzRRCR5bqhorQTAUxODtdN08KfgbEkmdGNhjcU5xx3XeW3FDQ
 RN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JzEKBDC8MCFs6RzlQYo+6BPJPoODwW8SiaUozInCHTk=;
 b=L0GqjyQGdZPl0/9vnzZuG7RTcQXWXfYdXetkHhWB594N3on95PWOpMgkKG5mpz+Xf5
 Ao9VqwariFFgNs6x1PrdDNHn/CPF9zNJc/E6JsvyAQ0X5L3GsmGcws1oGWTqBQa0EwWn
 F5iHt82Xi0o+Yof4tzc0MH/7jpM2p3yiD3jX2IC9EIWjTEiHEHqCFGvQ5mcO7o4BNvsN
 ehzOQwPpHQjaXoxi6Ry2z5XhZJL3hHV43LomF+oL+7oXWtrW773QnTB8fQr3+gPvC3BM
 fPJxwmybcKp8mdKAcjSGeDit8u3QUvIDIbu1Skauw7YrXcWZu/0NEaE6zismKFVgYJ46
 epmw==
X-Gm-Message-State: AGi0PuaTMC+WnM4stOBscdaPe21jBRU23lC63iFyXSV3Y+fbWwJSJnXe
 NthORDn8sE1uShlI7Hk89EK5VO7BWGcqIMEUEKQ=
X-Received: by 2002:a02:9445:: with SMTP id a63mr19377779jai.10.1586847880360; 
 Tue, 14 Apr 2020 00:04:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200326230838.31112-1-richard.henderson@linaro.org>
 <20200326230838.31112-22-richard.henderson@linaro.org>
 <CABoDooNE=R_jQjg-dZrdaK-atmuQ4XjMkGjKnmebKvuXcTpDQg@mail.gmail.com>
 <ae2cb680-2200-e9cb-afa1-e55593ef6d6d@linaro.org>
In-Reply-To: <ae2cb680-2200-e9cb-afa1-e55593ef6d6d@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Tue, 14 Apr 2020 09:04:36 +0200
Message-ID: <CABoDooMBkn-knRM70HmMqiSHrif7DjDKkZAr+j3ZLsEY6noGeA@mail.gmail.com>
Subject: Re: [PATCH 21/31] target/arm: Implement SVE2 integer absolute
 difference and accumulate long
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d42
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
Cc: rajav@quicinc.com, qemu-arm <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bZsrNbvHHGjQ

On Tue, Apr 14, 2020 at 1:19 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/13/20 9:15 AM, Laurent Desnogues wrote:
> > On Fri, Mar 27, 2020 at 12:18 AM Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> > [...]
> >> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> >> index a3653007ac..a0995d95c7 100644
> >> --- a/target/arm/sve_helper.c
> >> +++ b/target/arm/sve_helper.c
> >> @@ -1216,6 +1216,30 @@ DO_ZZZ_NTB(sve2_eoril_d, uint64_t,     , DO_EOR)
> >>
> >>  #undef DO_ZZZ_NTB
> >>
> >> +#define DO_ABAL(NAME, TYPE, TYPEN) \
> >> +void HELPER(NAME)(void *vd, void *va, void *vn, void *vm, uint32_t desc) \
> >> +{                                                              \
> >> +    intptr_t i, opr_sz = simd_oprsz(desc);                     \
> >> +    int sel1 = (simd_data(desc) & 1) * sizeof(TYPE);           \
> >> +    int sel2 = (simd_data(desc) & 2) * (sizeof(TYPE) / 2);     \
> >> +    for (i = 0; i < opr_sz; i += sizeof(TYPE)) {               \
> >> +        TYPE nn = (TYPEN)(*(TYPE *)(vn + i) >> sel1);          \
> >> +        TYPE mm = (TYPEN)(*(TYPE *)(vm + i) >> sel2);          \
> >> +        TYPE aa = *(TYPE *)(va + i);                           \
> >> +        *(TYPE *)(vd + i) = DO_ABD(nn, mm) + aa;               \
> >> +    }                                                          \
> >> +}
> >
> > ABAL is either top or bottom not a mix of two.  So only sel1 is needed
> > and its multiplicand should be the number of bits of TYPEN.
>
> Yep.
>
> > vd is both a source and a destination so a temporary should be used.
>
> In what way am I not?  Both sources are read before the write.  The operands
> are all in columns of the wide type (unlike the addp case you pointed out).

You're right, sorry.

Laurent
