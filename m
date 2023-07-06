Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp4246568ejy;
        Thu, 6 Jul 2023 05:30:06 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEoqZUJEnP7mhfOqQgY6PiRF38SPPBYeijUD6byV3zH9MC+nwm6oHnslA7Z7BD5JxnI3xnH
X-Received: by 2002:a05:620a:1722:b0:767:1241:54b5 with SMTP id az34-20020a05620a172200b00767124154b5mr1613189qkb.1.1688646606144;
        Thu, 06 Jul 2023 05:30:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688646606; cv=none;
        d=google.com; s=arc-20160816;
        b=K3UzPcJnTLO52lQJWs/OVOEtNVyxA/2pJTr2ZlufXJtXhBEZk+EZfjsQJEEjD9NtoF
         OdKCJW7AmGe9eagzjGIyTYAlcTy7Pw3IzYBLAfs/0GPqBbN7LTyat/2vIH3k2/RUDd/5
         YViUBjPzaukAM1n3f0JaoPYXoWeG7NOJSYPGrDUwZfLcg5xteXBbDVT5ALhiDlKVrLF3
         zFzVk1cMWC6eHMhAIU7K5jBO7y7z3q3IkhwhyICWdmjh4c6bWzN3DGjAIAynGdvdy4Vw
         HEYC5JElbNRFxCWvAa5PAE0DqZ/zoCF3bf3Kxe3KGqhW3S32C0ggaHeGc53O+sGo/4i7
         84rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9WuXS1bpnCIT0yUrBldYGQxYo/Xm6JygWdrvtRk+JkE=;
        fh=iByCkWWLbfzkUEAbrXL4bSVFGIA/zPAWHnBglvbE63U=;
        b=c9Al5ZLg1bkSiJNdQ9vgn+7bw1A3f1hLWlZpJPOgGVfBu5SylDz/3X3jShu8tOSOHh
         /aEHMV2cKGJxisTMJotSUdeEksq7GyIZAgUb1PJ/brOWx7Po7VDdDrYQHbB+X5ts5TXA
         O/7XnYnIRdd7HyjL8K/V9QiBkw/5xT8u05wFHjbyjiJoh+pq3/aI8JP28MOD3KpjtfE5
         awLoYE0moOJz/UNcVpTpygvmSawkh7HTML32PmsBgQYE5BeJFSOeZKL001aSetDmgsQi
         uKX2gHyi+Wty21aSFxFEOzSRFfZwuE7+rvUABlWc0iLbLJZ5Y7OycdyGnOmh3jZnMok3
         nYaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sLVIDt4v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o14-20020ae9f50e000000b007653ed76dfdsi999953qkg.303.2023.07.06.05.30.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jul 2023 05:30:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sLVIDt4v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHO7O-0006j0-OY; Thu, 06 Jul 2023 08:29:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qHO7K-0006iI-B4
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 08:29:51 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qHO7I-000478-KO
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 08:29:50 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-51d7f4c1cfeso974808a12.0
 for <qemu-arm@nongnu.org>; Thu, 06 Jul 2023 05:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688646586; x=1691238586;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9WuXS1bpnCIT0yUrBldYGQxYo/Xm6JygWdrvtRk+JkE=;
 b=sLVIDt4vGua6yIgv/UWU3fQVpzsnHMSoOtzIPKk2Y+hNspPUZ4WC7JEM3wKwtH37sn
 aZF+h1Oq9i2+4+b2rTEQDJLOZ7tLWzlz3osaLVhQxRzOg1rnuSPJJpj04DY1yucTC76D
 mg47D/z2N2AuiRrrT5UxEoNX0jbhnHzHJyjp0fV8oLQNF70BwFzpOnyuouWYoE/zt0/X
 mJximP4LaAf1OMSjIBBako3aAQ7uWnh/WwIckHjyaU1vDVESUclSXkBR9/Dty47liv3N
 QGLrYGrwjIbP24cNLBmucOQz9ihyqu2sbyS9AV15RCSfAyUmhHxXK11GwkGCcxOW+dCp
 AZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688646586; x=1691238586;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9WuXS1bpnCIT0yUrBldYGQxYo/Xm6JygWdrvtRk+JkE=;
 b=KWtQcWAmUIEWItkQ7EtUGv/co5d61tMb20WITJDIcFCYjleIpNIlJnmFSp0tZN9Aji
 sUqAprvYnYAhMMtR5ya2UBfkA02s+wJbXfU7c9ZtLNIYpgVbDKCai46ypFuHt4A4MOe8
 ffhShYzykZ3gyyQSQ9zvkrlwkMrsd5pLTQFLtEB0tS1y29SxV0AkZIbg6IBoiJBa4irZ
 IQEy6VaVnx213ur3UrD36e88rx9QP1wv/9n4fLXUN7qKzx/U9TpfUfwtIIIQOmBsvASQ
 9yY+2rSvaymbtwBiZ+Almynp3xXCYCfiZsREI/xWwKvLNdewmxqjoVWTHopgspZ9p+ms
 bNmQ==
X-Gm-Message-State: ABy/qLadxatqEWK4viPknYnYQhF62Dn8xXWLhhCd9XWyj4qpvL6tg2mc
 KNmPbEEE/aANewJ7XVFVZ8wUFemU5WnOM9aSD27f/g==
X-Received: by 2002:aa7:cc15:0:b0:51e:1690:1b97 with SMTP id
 q21-20020aa7cc15000000b0051e16901b97mr1436602edt.19.1688646586659; Thu, 06
 Jul 2023 05:29:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230704130647.2842917-1-peter.maydell@linaro.org>
 <20230704130647.2842917-3-peter.maydell@linaro.org>
 <efed6e67-beb2-dc60-18c5-af0fe1431f0b@linaro.org>
In-Reply-To: <efed6e67-beb2-dc60-18c5-af0fe1431f0b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Jul 2023 13:29:35 +0100
Message-ID: <CAFEAcA8itOZACU_MWTzZHUf0Nt64LBGcSLJ9Qry9xn4PCw2W+Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Define neoverse-v1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: uLjlcbYD1FUI

On Wed, 5 Jul 2023 at 15:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/4/23 15:06, Peter Maydell wrote:
> > If you're checking the values against the TRM, note that the
> > summary tables differ from the register description in the TRM
> > for ID_AA64DFR0_EL1, ID_AA64ZFR0_EL1 and ID_PFR0_EL1: we
> > trust the versions in the register descriptions. Also the
> > MIDR value in the r1p2 TRM isn't updated from r1p1.
> > The CCSIDR_EL1 values in the TRM unfortunately seem to be wrong:
> > the comment in the patch describes how I've calculated the
> > values used here.
> ...
> > +    cpu->isar.id_aa64mmfr2 = 0x0000000000001011ull;
>
> I see 0x0220011102101011, not in your list of exceptions above.

Good catch -- I must have cut-and-pasted the neoverse-n1
code and then forgotten to update that value in it.

-- PMM
