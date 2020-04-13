Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3953223lfm;
        Mon, 13 Apr 2020 09:15:47 -0700 (PDT)
X-Google-Smtp-Source: APiQypLgNdiPvaRDxc2dVJKXEfxSbpstKHJ+QcTu+/94urMxV4qR2EDFVYz3kiYH1FdrYaT7VX3R
X-Received: by 2002:ac8:554b:: with SMTP id o11mr12109456qtr.168.1586794547385;
        Mon, 13 Apr 2020 09:15:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586794547; cv=none;
        d=google.com; s=arc-20160816;
        b=DFaDkz6FoQ/UkmMshC2J4j+q69r4zcKtqdPWpjldLo+typjcC1Hpnws9/+4+7B2wa3
         aYHZEAsWXgxM20Sp02IEe9TJNO15Csgj99TYjgJu2lqCicIy3fEb7ZPzpzOic50R3Ycv
         R9TJsRR0xJyx3QKiqOGMp3KS4X5Dh6yMJ9+ne7ZUFhBtfgqAtAEFuLbBEsTqCit8SbUU
         RzAyOxm6EZ88yrn53V3uwrG2u7dwmyU9mjcQ1aiVtZC48z0pFaNLODl+ZRNf0fFrRieO
         6FHJF08C6H4nKqvMpd7Ts3ojxxoCoPdczXW0S4mVmdwduISuzYXpTkIy0wAtOvWoC3pS
         /stA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gQ1lX+0Zv2ErLXbq8TUvD9X/ClSwnHxElXLxffzrnBI=;
        b=GaE+HaceKg1mnbGns67i5HRIJiRQ+rhKicwb+4v9d/SC7oEZFH4uweVvaUktwfMC+Y
         KXRNcaxSrreuR7cByuFkBzhq06n8CK84uzd4/UdhlKs9ikC5RFrtOTccYXtuHG1VPjFI
         M0hmLq/xq6hME1Uj7F1jtiGZqqo7mRY3KwN0504Ew80wgDhl86d/c0KpgXe7dt8iqH/K
         rE82pr7mPJ+QocoRicNpGnReCo9bvkw3gHEDtBvAoe4pLvFZwAiFz/+wonBxxdiKWUOE
         R2fMDNojYPJjkdbZeiSSS1qbhXC3H0AheLbmM0Hi4gtvW0LOT3zcvufT5pGr00V9zIcA
         AmCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="rVWm/zl2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c130si6357928qke.298.2020.04.13.09.15.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 09:15:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="rVWm/zl2";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jO1kQ-0000pu-Rf
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 12:15:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60126)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jO1kH-0000nz-FL
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 12:15:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jO1kG-0007zL-IT
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 12:15:37 -0400
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41]:34876)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
 id 1jO1kE-0007yF-G8; Mon, 13 Apr 2020 12:15:34 -0400
Received: by mail-io1-xd41.google.com with SMTP id w20so9888961iob.2;
 Mon, 13 Apr 2020 09:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gQ1lX+0Zv2ErLXbq8TUvD9X/ClSwnHxElXLxffzrnBI=;
 b=rVWm/zl2U5zZTO16oqrMAOqgRfbM6645LAqDylahwlWIFdt34OZU3gQZyX9t2zDctP
 vci+uhFcpvDTAHIbFFMDlxVNzYtMRc0CoOLD/M9iRA9JT6vlUGVQWKiYvjRJlr5aHIWi
 rlTk68ZsGjrp87aZzPyqdEGUAozyWInFjaH0byQBhFxrZvK4hWsJsy0SElg8AL40OsMb
 svvVbhw3PiyyJnJgYazW233+bQ0r7cLX8fpNISjZJUMkr+BQj6AsXrr46wKK3cM45u4c
 6PHYdgau2whp0gcgOBbEvfPclbHpL7fVLiH5DYIlzuyMSV/Jc4wwq7pNB+eDmeE8iLwT
 4afg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gQ1lX+0Zv2ErLXbq8TUvD9X/ClSwnHxElXLxffzrnBI=;
 b=JK901Ol+a7FZJARzCaGkcG004qqzWlbQgAYBFtB/F5r3NQhBF33mrBA104ie06JCpX
 W8U2aLtiXdEG969Hoqn6LbQ2nI0vyGz5EirC6nIOXGIfH7TFnJ1QbryvKqbx4lhpayk6
 cNr6q1riRjKLWbMNnj8nJH5PfCDDPWAqy/i0CTMzqe1APAnsIojrN0w0xFFS8fhLL0aq
 12PUm9ObYryeuEUSlty0wlMDLuHyGQdCu74cq11XVhizxvggV2BVBjHsSkwRIVH7mroj
 gpfdKMHbtm9vjUw5C+CdEPxiDGPY58y+nZP4qIAjbTH0dEjTb2wegtLG5ClGUZEJgUof
 6KPw==
X-Gm-Message-State: AGi0PuZfY+jY8juTg7bNWG6lTsWYMCtIZqs8/ADYfDfRsCDDmTMX8hFP
 pKsuoXPg21yunQ7XKMExTd62NlrSxoxzcu4phrQ=
X-Received: by 2002:a6b:3989:: with SMTP id
 g131mr17018872ioa.202.1586794533709; 
 Mon, 13 Apr 2020 09:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200326230838.31112-1-richard.henderson@linaro.org>
 <20200326230838.31112-22-richard.henderson@linaro.org>
In-Reply-To: <20200326230838.31112-22-richard.henderson@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 13 Apr 2020 18:15:29 +0200
Message-ID: <CABoDooNE=R_jQjg-dZrdaK-atmuQ4XjMkGjKnmebKvuXcTpDQg@mail.gmail.com>
Subject: Re: [PATCH 21/31] target/arm: Implement SVE2 integer absolute
 difference and accumulate long
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d41
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
X-TUID: gxcJfq6N3sBx

On Fri, Mar 27, 2020 at 12:18 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
[...]
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index a3653007ac..a0995d95c7 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -1216,6 +1216,30 @@ DO_ZZZ_NTB(sve2_eoril_d, uint64_t,     , DO_EOR)
>
>  #undef DO_ZZZ_NTB
>
> +#define DO_ABAL(NAME, TYPE, TYPEN) \
> +void HELPER(NAME)(void *vd, void *va, void *vn, void *vm, uint32_t desc) \
> +{                                                              \
> +    intptr_t i, opr_sz = simd_oprsz(desc);                     \
> +    int sel1 = (simd_data(desc) & 1) * sizeof(TYPE);           \
> +    int sel2 = (simd_data(desc) & 2) * (sizeof(TYPE) / 2);     \
> +    for (i = 0; i < opr_sz; i += sizeof(TYPE)) {               \
> +        TYPE nn = (TYPEN)(*(TYPE *)(vn + i) >> sel1);          \
> +        TYPE mm = (TYPEN)(*(TYPE *)(vm + i) >> sel2);          \
> +        TYPE aa = *(TYPE *)(va + i);                           \
> +        *(TYPE *)(vd + i) = DO_ABD(nn, mm) + aa;               \
> +    }                                                          \
> +}

ABAL is either top or bottom not a mix of two.  So only sel1 is needed
and its multiplicand should be the number of bits of TYPEN.
vd is both a source and a destination so a temporary should be used.

Laurent
