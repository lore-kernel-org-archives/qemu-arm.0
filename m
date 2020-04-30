Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2070655lfm;
        Thu, 30 Apr 2020 09:16:47 -0700 (PDT)
X-Google-Smtp-Source: APiQypKj5RP+qqIN42qMBCDb5FMKOIzmQ9PAJYq2qqXTqmAIEe5b38/LFPEXHe4tkiFd/fE3qycj
X-Received: by 2002:a37:5102:: with SMTP id f2mr4322010qkb.18.1588263406968;
        Thu, 30 Apr 2020 09:16:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588263406; cv=none;
        d=google.com; s=arc-20160816;
        b=Oz5Kg4N7kV7cAVDrdt3QeKlXKSpf/taRGz8IjVziixsyDMDZOaPszyhgGrGPuzdWGQ
         PwEwYFe2P0JbNa2lXIbKJl+hzUZRVxb5BVexYibPSasQJOHWpEU96UPJ1q4RL4eKBM4R
         kExcFmiwvew7//WaiDn/14Ji4eI1B6rCurVf6aXt86oBl9TKI94cjIqIq+JCSEmgnobx
         gC9c8hvvI1WDjYldy4xlPOJVqACoeC/ufXCyfFJn5n/S4emMzxNRmILKBCMRpWoS0gEO
         mT0f1+UJQ8VMX3b3jnRsICq8HLIz4HV8nxjr40T/pkMZ36x6rOAP6n8iWajaH32uZPJa
         fXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=AZvzpM0iOvLuHS3OTVM61+QPSNz1OnIyUOVib2ZSyNk=;
        b=kxdr8bPMqIKPojngxlcv2jbpxok2dv9tRdaKYJ+qsOv2Q/cv8SnVBOs5OFdWIW5zNZ
         OilqdsmLds/foGY+vgkK6QG4YwYxiMuQRFwsz9w/+mJX/BMTnD1XjtuSbr13fo8Wu1Iu
         fTXoLnopOJVZ8ZzZC7JviIZ0peO8EggI/FOnOuH3iiTiVVnb5MfSb2CHPAQ+ZPlKLD4b
         DM5AQbskkNFLiidR8gopNlPJSmV5wGTqTr1SC4wLyex198cR7/HcLrKQu5SIGoWrmrQS
         sCObSc0wJa2LgPcl7nQibjmIeSKvUQYISPMM25Hsw994BJfOcBtfd+aSUcmOiE7KIX9c
         bBUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="MqxWZ/Cy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6si73274qtt.175.2020.04.30.09.16.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 09:16:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="MqxWZ/Cy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUBri-0000Lj-AB
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 12:16:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45486)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUBdm-0000qZ-9o
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 12:03:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUBao-000458-Bi
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 12:02:22 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:44042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUBan-00044w-U9
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 11:59:17 -0400
Received: by mail-ot1-x342.google.com with SMTP id j4so5307635otr.11
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 08:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=AZvzpM0iOvLuHS3OTVM61+QPSNz1OnIyUOVib2ZSyNk=;
 b=MqxWZ/Cy07gtt5H+46vX5buMBOYmQr1V2mkdxbJIxWXbY9WHH4WmmaWPYWFYKRoWkd
 Tt6YfcoR8+fULmD/BHUIARkkMYfMfhJAVdKZhruB6NwqHwDlGpwT3OpAOabRdWiUL7Js
 BE/fDL1CLwEKiUpq/gGiJ7WcS+gVXYMHvIOET77oUyl0VDcoUcIxomyXFFoT9plSL3fn
 ym8nO9taISusAnWrpWjvYD/X/jsufBuVUvSMb3/4uW6SgLCquh/ftqRR11+S/uloVRE7
 JvQjbmxzjgFF3pSt6sW1WQaSZy7/JNtNZcAQZXoT6sd7mHAavvp4AjfUp953aCW5XJuq
 5zcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=AZvzpM0iOvLuHS3OTVM61+QPSNz1OnIyUOVib2ZSyNk=;
 b=QF+VSTnZqghy4Lh3HX/hm/y0sUJgZHwbotzfUOOlDQn4sTHvMb47u31d8f8MfzloQz
 pbhSXNXiVSfFgbKsqpOE0G+Av+h/DElSVhsS7Z8dbd+qxCKadyzM+iu+mhgsJ6QSoDlP
 QCd3Qm63jiXoRQZYhb8kNakptz/ykrMeFXCwMsGfEV41yC4g7tzVuw7JzrkjjhNQuziI
 fxRi8Odin4f1MSLW4896kSkAuR1UqRV8x/OpXEWzYiXzP7ZG3GEgvnlmnMtHgtP0n9Fd
 kAU0SJkkTb+l0N9ceC4RSEX7odmX4u/h75O1nlBfYSVU3u8MPWbv2lkwZJx3cG3uvOAd
 L40g==
X-Gm-Message-State: AGi0PuZr+9Md6yAj9JdVqnLJ8Ap+oKHFLIkr9LJWTxkTY8f8oY+c04ds
 YJwhPnnQksijF61eGY2milkDQNR2mwNIbUSYN4o6nA==
X-Received: by 2002:a9d:2c08:: with SMTP id f8mr3151692otb.135.1588262356613; 
 Thu, 30 Apr 2020 08:59:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200428172634.29707-1-f4bug@amsat.org>
In-Reply-To: <20200428172634.29707-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2020 16:59:05 +0100
Message-ID: <CAFEAcA8RymJaowHcp1_Er_GghPAzMV6RTP7jgxNVmZEvR5ssbg@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm: Use correct variable for setting 'max'
 cpu's MIDR_EL1
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pPvEmj/XFXk3

On Tue, 28 Apr 2020 at 18:26, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> MIDR_EL1 a 64-bit system register with the top 32-bit being RES0.
>
> This fixes when compiling with -Werror=3Dconversion:
>
>   target/arm/cpu64.c: In function =E2=80=98aarch64_max_initfn=E2=80=99:
>   target/arm/cpu64.c:628:21: error: conversion from =E2=80=98uint64_t=E2=
=80=99 {aka =E2=80=98long unsigned int=E2=80=99} to =E2=80=98uint32_t=E2=80=
=99 {aka =E2=80=98unsigned int=E2=80=99} may change value [-Werror=3Dconver=
sion]
>     628 |         cpu->midr =3D t;
>         |                     ^
>
> Suggested-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Applied to target-arm.next, with the commit message fixed
up to match the patch contents:

    target/arm: Use uint64_t for midr field in CPU state struct

    MIDR_EL1 is a 64-bit system register with the top 32-bit being RES0.
    Represent it in QEMU's ARMCPU struct with a uint64_t, not a
    uint32_t.

    This fixes an error when compiling with -Werror=3Dconversion
    because we were manipulating the register value using a
    local uint64_t variable:

      target/arm/cpu64.c: In function =E2=80=98aarch64_max_initfn=E2=80=99:
      target/arm/cpu64.c:628:21: error: conversion from =E2=80=98uint64_t=
=E2=80=99
{aka =E2=80=98long unsigned int=E2=80=99} to =E2=80=98uint32_t      =E2=80=
=99 {aka =E2=80=98unsigned int=E2=80=99} may
change value [-Werror=3Dconversion]
        628 |         cpu->midr =3D t;
            |                     ^

    and future-proofs us against a possible future architecture
    change using some of the top 32 bits.

thanks
-- PMM
