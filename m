Received: by 10.28.91.67 with SMTP id p64csp1877086wmb;
        Thu, 1 Mar 2018 06:12:29 -0800 (PST)
X-Google-Smtp-Source: AG47ELvJal13NsjWmdMxd3EGHNQKqEMnN5+6q0wPZAl3Z65fx6UYEhHNzmRZMSTMJaVXMlAKCaQi
X-Received: by 2002:a25:2c87:: with SMTP id s129-v6mr1124986ybs.151.1519913549054;
        Thu, 01 Mar 2018 06:12:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519913549; cv=none;
        d=google.com; s=arc-20160816;
        b=WoVdDkKW3nAkSQlie1UgsSjim8qYZl5bEiKfV+dp5B3PkuHHxQkWyZXaTgcjYCUGiT
         LEh/Z3hvMlkot8DNr52OdCrH/Ntqa+pyyX8He59f3Sfp6Etr8Ofj/ug/FToW3XcbkyXS
         sL3t9zrHccaGaO3tUWX6GJEM62HXSXDYQGPfllEivU54w2yFZa7fBXuul04UNLj0SXFl
         xbo1ZNJsVlfnnuk9rcIRPHCWyMFXNZ/2LdN/IO/tKji7sQNlt+Q2RlC0v+aA4jWyO4qE
         2qZ0EvxM7TDrbEO01YHnmN9w282T0+BpWEAzJUMyL+y3FnlJSPlKlqRIBv1Uq2c519cN
         P2nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=q9r8R8HRhyRYv2m0bZjemDJek67CN2UIHWGy7rnyiy0=;
        b=zxR5E3qzK1d/3ExsaoHShyyRIPQCnqE4F/n6OVvvn9Mr/2W2qlcuMUa4NpgsKJUEW2
         gVYDtvC7OfqzHebh64WK7/y73GKB5/zQD3ojpGsQiH5fWUWIkVR3WI6et/TEZlHyLqyA
         pjFtGg/nz8gLu+kVzX4OrKRr5L/FRBTEkq8UgItijumAWKNCDwAosUTELam3+rvIoWFB
         Vm/X8Rm0b97kgz4ynvvokUX71JHW5Ha18YLYkJSFA4nenSYwBxVa/QBy8J+gSNr7PR2g
         B+45fqPs1mS5iR86CJq7Ih28e4mqz13ARllhODKcKUwci9O8HfNngZ8FWLuzyWfzE0lf
         TtpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iqLTaCZa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l127si648101ywd.726.2018.03.01.06.12.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 01 Mar 2018 06:12:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iqLTaCZa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57153 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1erOwe-0004fU-Ge
	for alex.bennee@linaro.org; Thu, 01 Mar 2018 09:12:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52601)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erOmd-0005pG-DI
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 09:02:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1erOmX-00072z-I7
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 09:02:07 -0500
Received: from mail-ot0-x241.google.com ([2607:f8b0:4003:c0f::241]:42205)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1erOmX-00072M-CK
	for qemu-devel@nongnu.org; Thu, 01 Mar 2018 09:02:01 -0500
Received: by mail-ot0-x241.google.com with SMTP id l5so5609208otf.9
	for <qemu-devel@nongnu.org>; Thu, 01 Mar 2018 06:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=q9r8R8HRhyRYv2m0bZjemDJek67CN2UIHWGy7rnyiy0=;
	b=iqLTaCZaP4pxf8hjwKK3/r9GaXRf6whdSRGDxcqThV+t0Qn60zChyLbKZLAbK9uaZm
	OXPTrAJ63+/OJ1EB8trWGGk1z2+zIiGZJWln2vt8QzMVO19gSTCn8r6Na6jWMfmgB26x
	bvVu0Li9BuGblmmRuqhhDLLuP/BQLc72LWN94=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=q9r8R8HRhyRYv2m0bZjemDJek67CN2UIHWGy7rnyiy0=;
	b=dzU537VHMHlxjoBKLIPO3M6LeqINLjQQ1ccjSzy3+x/BOr44PlzNG0sr0r5wGnkhjl
	oP/iPkhJdQ5gWngObM9DitRrxVWvVLHEzHTEU64nILbexoHnuXRBWWPD2xeMB89BpBiu
	2ZSHCIkMas7xaFo+VRaZdCUcuSuOaIznthQkR5p6rFi3jQazMtt6UYpmCr0nlojO1s9E
	IAoUcaZr/T1eeuU6/zylCml/DLvaz9NYHNoOyqwtGp8YmdAgUUnd2/dUhfaIUT1aHopd
	zvKyE3NndQ+hHK1j2Ub0KSwGaNyiDxhCwbxtvy1EWjJPjwbpsPCGujD6sAL/Qzd3cIgj
	YUtg==
X-Gm-Message-State: AElRT7G0mPfcrfSFFE8HITfB/8o5r9+bgMCb9joTE3SMrbhX5r0CcEfU
	ojaMUx1z++9GaEiQkE8t7lAXsTXMgu84/eaSItto+w==
X-Received: by 10.157.3.70 with SMTP id 64mr1323373otv.258.1519912919788; Thu,
	01 Mar 2018 06:01:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Thu, 1 Mar 2018 06:01:39 -0800 (PST)
In-Reply-To: <20180228193125.20577-14-richard.henderson@linaro.org>
References: <20180228193125.20577-1-richard.henderson@linaro.org>
	<20180228193125.20577-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Mar 2018 14:01:39 +0000
Message-ID: <CAFEAcA8w=UJEzycn3Wc9b4GGZnP5YQm+Kb9__ikPg_+du4ERGg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::241
Subject: Re: [Qemu-devel] [PATCH v3 13/16] target/arm: Decode aa32 armv8.3
 3-same
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QjDfanKzIC21

On 28 February 2018 at 19:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 68 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 68 insertions(+)

> @@ -8424,6 +8486,12 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>                      }
>                  }
>              }
> +        } else if ((insn & 0x0e000a00) == 0x0c000800
> +                   && arm_dc_feature(s, ARM_FEATURE_V8)) {
> +            if (disas_neon_insn_3same_ext(s, insn)) {
> +                goto illegal_op;
> +            }
> +            return;
>          } else if ((insn & 0x0fe00000) == 0x0c400000) {
>              /* Coprocessor double register transfer.  */
>              ARCH(5TE);

Oh yes, shouldn't there be a similar fragment in disas_thumb2_insn()
to take care of the Thumb encodings of these insns ?

thanks
-- PMM
