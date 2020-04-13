Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3958074lfm;
        Mon, 13 Apr 2020 09:20:47 -0700 (PDT)
X-Google-Smtp-Source: APiQypLYXfk5/NEkNGQo2LwX4s8MBVKMhDb6OelyviWKttSf+fWFATiKmhBpiNncYlsRsqNoq6M7
X-Received: by 2002:ac8:6c24:: with SMTP id k4mr11910796qtu.257.1586794847169;
        Mon, 13 Apr 2020 09:20:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586794847; cv=none;
        d=google.com; s=arc-20160816;
        b=sLrASriuvBOJX2dwM0DC1woVACsnVd15PA4Jn01mNafX78TYEywixP6BtD6jqFQp82
         PuhDpm1j3sEYDfcSPVNfg1Tx3ckyuv01t2UsM7PqL5bK+nfv9EKBzeN00oaYM8BCDtg+
         R23hzDJHEiHZorahSadyGcE0V0I83OcuQRlh17qWeWJ4l8/UfnQ837oNH/DJn1b2Klmz
         VtYd9bDQFndJzOiHQRCgofSAy5eEr79oqffAx9PF5eGjorPM74pYe6S8hkeL/NOJJaKN
         ZOVMiJmHSPFXk8oz6bXDSoxOeIkbM0lQA0pNyJL3dYv0ZQxpFbh03JNouFdt4mQTupmd
         15mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FrlZ2Og4Gk2rDGcvN4xoQ+RCSEwEyV8v9+mVj65fNVY=;
        b=W5kTuajW8/eP7yADQREDra80qaswIPRUtVMTpcSgenBRLMwzA6PBKmN237ttWbuyyQ
         i+arNpnt4D8PbcIGzI2CSM1KqrrC11oJ/qnPjZexVpwZh+VJN8+lBCO7xymtgtiR+DEl
         92tlWXftYbGNI7t4n/n0rF+obH3FNbUfv8UqDFjj8hFqGy3cXfStWfWvR3gytflatHJB
         TZfAC3ks+YAeCWLM2AlQLgcjW4sPr41DwbEXm1eROyuzaFvX6UgV4qsIo5qOpnZsMQM2
         bvZGKoX+WqnVIV5apwKTIhPNEYCCJqQKND5eP6VfDNFwDxCcUsFSM0IVTw5mOhzqrfmd
         f0Bg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aU72Uekj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2si6038328qtu.34.2020.04.13.09.20.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Apr 2020 09:20:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=aU72Uekj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jO1pG-0004YS-IP
	for alex.bennee@linaro.org; Mon, 13 Apr 2020 12:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60918)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jO1p7-0004V6-FE
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 12:20:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent.desnogues@gmail.com>) id 1jO1p6-0002JY-EX
 for qemu-arm@nongnu.org; Mon, 13 Apr 2020 12:20:37 -0400
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:46055)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent.desnogues@gmail.com>)
 id 1jO1p3-0002G8-5p; Mon, 13 Apr 2020 12:20:33 -0400
Received: by mail-il1-x141.google.com with SMTP id i2so8124095ils.12;
 Mon, 13 Apr 2020 09:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FrlZ2Og4Gk2rDGcvN4xoQ+RCSEwEyV8v9+mVj65fNVY=;
 b=aU72UekjHI2jP8suG7Hx2B+ZZYabYxmgjehwnc45drjHkuZmnm+ckS7gc/MSLOlKnY
 XzhRrK/D0rvvU/19gqmrEC0lCf2QTVr69rpXMeKqf5U4xTUMiUFxHyi2mSTnevWMcDFU
 HcgCkgZx9XF3xR+e/v1opxesxSeZcCTYTHVBsOxXKqz86DPpSdgKDtuy9tQge4mK166b
 8d59wHiMTCGW1UWmaT63U/3yFIgaCmBFHvBxHX6JItI4cS5jMrzQ0oVuzpXT0MVNxEGi
 zraJRyx04Ix0/XW2vaNjzhaOdvErCqL5oRBBDMMyHk2WqwRFrN/SLelllnMEWWcGfggj
 fF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FrlZ2Og4Gk2rDGcvN4xoQ+RCSEwEyV8v9+mVj65fNVY=;
 b=q6V1plYVtALD6rpYmRIgwEv0RAE4qTGoIT9giTnd2B2dtYDd2KeimSvpGQav2sVdFZ
 JEmMnzEBhRu+SIjz1OPJC4nKtoZhcWei42ESZxcR3Qd1JB1/na0apW95Rk3U5I3sqLzV
 vv/rOaVcFydsfTXYpEr3WGCanTqP4cqoPkR2U0w0XIt7w+ofevG/nc4Gx1GWH1q3eUx3
 cUQxrDa1BwQQo0npTSzTSKf6RYPPwkT4E+XKmMfvB8B5wEZvERxrufcmmV0N47t6vHq3
 O3Qmw2bDTguVd8Q8MHrDsIwZh6orQTHw+D2uZ4WQ3vHjYAJLaVYgrirOVBi9zh3g5d1h
 oPOQ==
X-Gm-Message-State: AGi0PuZV9dhEKA+sl/7++gLZluySvrIZfg/U08KZdi/+486gyVsO+hdL
 6by///NsdxtPJ98Bv2UCQ0CqJlkQwJX3r1Lo//8=
X-Received: by 2002:a92:da8a:: with SMTP id u10mr18738648iln.241.1586794832022; 
 Mon, 13 Apr 2020 09:20:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200326230838.31112-1-richard.henderson@linaro.org>
 <20200326230838.31112-21-richard.henderson@linaro.org>
In-Reply-To: <20200326230838.31112-21-richard.henderson@linaro.org>
From: Laurent Desnogues <laurent.desnogues@gmail.com>
Date: Mon, 13 Apr 2020 18:20:27 +0200
Message-ID: <CABoDooNtOgV=gWGVpo6OJppiLtJWFhEpWsvU5rqw68MZP1Sorg@mail.gmail.com>
Subject: Re: [PATCH 20/31] target/arm: Implement SVE2 complex integer add
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::141
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
X-TUID: F3koHa1ykS7i

On Fri, Mar 27, 2020 at 12:20 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
[...]
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index b5afa34efe..a3653007ac 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -1289,6 +1289,48 @@ DO_BITPERM(sve2_bgrp_d, uint64_t, bitgroup)
>
>  #undef DO_BITPERM
>
> +#define DO_CADD(NAME, TYPE, H, ADD_OP, SUB_OP)                  \
> +void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)  \
> +{                                                               \
> +    intptr_t i, opr_sz = simd_oprsz(desc);                      \
> +    int sub_r = simd_data(desc);                                \
> +    if (sub_r) {                                                \
> +        for (i = 0; i < opr_sz; i += 2 * sizeof(TYPE)) {        \
> +            TYPE acc_r = *(TYPE *)(vn + H(i));                  \
> +            TYPE acc_i = *(TYPE *)(vn + H(i + sizeof(TYPE)));   \
> +            TYPE el2_r = *(TYPE *)(vm + H(i));                  \
> +            TYPE el2_i = *(TYPE *)(vm + H(i + sizeof(TYPE)));   \
> +            acc_r = SUB_OP(acc_r, el2_i);                       \
> +            acc_i = ADD_OP(acc_i, el2_r);                       \
> +            *(TYPE *)(vd + H(i)) = acc_r;                       \
> +            *(TYPE *)(vd + H(i + sizeof(TYPE))) = acc_i;        \
> +        }                                                       \
> +    } else {                                                    \
> +        for (i = 0; i < opr_sz; i += 2 * sizeof(TYPE)) {        \
> +            TYPE acc_r = *(TYPE *)(vn + H(i));                  \
> +            TYPE acc_i = *(TYPE *)(vn + H(i + sizeof(TYPE)));   \
> +            TYPE el2_r = *(TYPE *)(vm + H(i));                  \
> +            TYPE el2_i = *(TYPE *)(vm + H(i + sizeof(TYPE)));   \
> +            acc_r = ADD_OP(acc_r, el2_i);                       \
> +            acc_i = SUB_OP(acc_i, el2_r);                       \
> +            *(TYPE *)(vd + H(i)) = acc_r;                       \
> +            *(TYPE *)(vd + H(i + sizeof(TYPE))) = acc_i;        \
> +        }                                                       \
> +    }                                                           \
> +}

The then/else branches of if (sub_r) are swapped.

Laurent
