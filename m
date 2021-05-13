Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp461043lfg;
        Thu, 13 May 2021 05:47:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNKEtgIqylEBOBTlzUf4uLwgQKMpsv9RtiZ0fkJGKV0PxkiE3yu3zyuv2+LEomUy1YJYbd
X-Received: by 2002:a92:650d:: with SMTP id z13mr20655680ilb.193.1620910023748;
        Thu, 13 May 2021 05:47:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620910023; cv=none;
        d=google.com; s=arc-20160816;
        b=d66tRmsGwS6StkVDxXx/pbD+Sof5Qc9AaZpD+34kPsaVS72eNG5mI+dMeHpRWHz2/U
         RZpoMJfpT3vBvJcXLiAwNiJyrQirDA9FL5k6Jinf6OY7zTPT/UMgkpy2dCmQyVCILiro
         SIxV/ifpx4JrhANCUw3RhuQ+1U9yEEmj3LLXGZhbAPul21Gmkcowg8njC89d8KaYh05I
         t+LDsCzrMAHeycUxp9RRPNG7DGgGjOEuPwtDOtbCsbiUSHoMDRwzSBWPDfMU/nbnZTzu
         n5E05x5Uc8OXChVZsmGEBD2X4fmtIlej61vC3rGX3w73Jgc40BXQ0do2qCLywkwN9ZHP
         iwGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZnAZ/nP9V5EdBdZL2ikFX+lherf5ZQMWDV1UogZdwlA=;
        b=ZQFJpJqs732LT55jXpfSH9L70sO0eQwyaxuxIyegBrcGWOxola27ya3twXUCrLAZn1
         Z/QCO6X7NnQToJ/DkEZu4GsgAqVmK0z3kMgbqgWSWN4mtqp/9FpKm4inTLjMv5PtOSbl
         1NMvhG+bu7VsVZf9Dw/R3lsZFS6wy4flyMJfUMyHok64e7x3RP65dXpP/i9CobfRkTfq
         V21quwBuAH2+6vlGXf7L2EAC+/tOAvTE+mxrQjLh74/iFUqnnXoHIRkEqvK/hlcm+mke
         8kEyJ6pSL5Z03GArxiIDukoDeSEjC/KabL+24k3AB8thRqoMBwejbaZZRNFCcUOiTiZ7
         rySA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N5Vbp3+o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si3987044iom.61.2021.05.13.05.47.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 05:47:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N5Vbp3+o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhAk3-0006A7-1a
	for alex.bennee@linaro.org; Thu, 13 May 2021 08:47:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAj2-0004is-La
 for qemu-arm@nongnu.org; Thu, 13 May 2021 08:46:00 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:36651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhAj0-00071P-B7
 for qemu-arm@nongnu.org; Thu, 13 May 2021 08:46:00 -0400
Received: by mail-ed1-x52d.google.com with SMTP id df21so3588933edb.3
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 05:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZnAZ/nP9V5EdBdZL2ikFX+lherf5ZQMWDV1UogZdwlA=;
 b=N5Vbp3+oB6c0I71oAVyd56O1FLmXwT2wjugLon9FeuOYEly1bwNmKuhPY05qF2rDX/
 GQE6cJEpsI0ifuOeLrmtGB7HU8Gq8z3MShJkkOaKxYmgN1KCUIuNtnK6DJW885D5/hBZ
 55cH0yXy9mjkhayqMaDzV/dEWZcW3Lw7iq3kMIRzaQYaCfURNKXPL6nnixxbSF7SgaQD
 IA0Vj6vhAoYJnGOFrrAMp+Uv4fo8DsWsfWi2Jj5igadJM6OxtZm/gwtd5i41D6zfHxzb
 Tpk56ThFWk1W2F6mC63AXt9dcxNV4hRCMXt9ItS/uqKbWwGoX94FcQ9niBo09tfMDGn8
 peZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZnAZ/nP9V5EdBdZL2ikFX+lherf5ZQMWDV1UogZdwlA=;
 b=SIBDK/bUzVSnHzOMMKQKefwdzecdjl4+KsqYVUfJdJPaLlXFy+hDZ3xrBMVaOJMNlw
 1d7AtSvZ/taaTs58Ev6GcTqEh3+0vIDFuDJPd5TJVT0S/nNz4uzsCZPw8vZpr4ssI4er
 IwaL5c++6TYA4F3tBmDPAK0Es/JsImd2HA/gyoCMQRYdnqeeXnrfGJDAUvbkaIXM+GXQ
 uX6dvIlzskxrdxTLsgexmW0omft1ejHXZ65sz8EIzDbK7zSuJWsY4JLdSI93iRu27MQ1
 au37nuyIupyXumYozV+C1VzL9lPHVOMsGyyXqfqgQwpNI34WinQ3lXegqjJYQp7nAZiO
 WKkw==
X-Gm-Message-State: AOAM533qjQsZv00Z2Ptupb2NBOI0koab639/RXzjgqG4HfZZaiMPe9nm
 58M6Dc0s/D27Vn/gMHFAA4LrT4XKTGoLiGlgx8xImA==
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr49520272edd.251.1620909956858; 
 Thu, 13 May 2021 05:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-57-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-57-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 13:45:45 +0100
Message-ID: <CAFEAcA8aXj7SVVA72oa9wPAMwoKHoCMrV8hC4b7zq26XMN8rag@mail.gmail.com>
Subject: Re: [PATCH v6 56/82] target/arm: Implement SVE2 saturating multiply
 (indexed)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: jUyEKXf+ufc9

On Fri, 30 Apr 2021 at 22:24, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-sve.h    |  5 +++++
>  target/arm/sve.decode      | 12 ++++++++++++
>  target/arm/sve_helper.c    | 20 ++++++++++++++++++++
>  target/arm/translate-sve.c | 19 +++++++++++++++----
>  4 files changed, 52 insertions(+), 4 deletions(-)
>

> +#define DO_ZZX(NAME, TYPEW, TYPEN, HW, HN, OP) \
> +void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)            \
> +{                                                                         \
> +    intptr_t i, j, oprsz = simd_oprsz(desc);                              \
> +    intptr_t sel = extract32(desc, SIMD_DATA_SHIFT, 1) * sizeof(TYPEN);   \
> +    intptr_t idx = extract32(desc, SIMD_DATA_SHIFT + 1, 3) * sizeof(TYPEN); \
> +    for (i = 0; i < oprsz; i += 16) {                                     \
> +        TYPEW mm = *(TYPEN *)(vm + i + idx);                              \

Again, not sure why we don't need an H macro here.

> +        for (j = 0; j < 16; j += sizeof(TYPEW)) {                         \
> +            TYPEW nn = *(TYPEN *)(vn + HN(i + j + sel));                  \
> +            *(TYPEW *)(vd + HW(i + j)) = OP(nn, mm);                      \
> +        }                                                                 \
> +    }                                                                     \
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
