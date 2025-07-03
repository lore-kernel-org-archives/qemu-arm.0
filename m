Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp412267dyc;
        Thu, 3 Jul 2025 02:33:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU86jl5fMFsO+kOWsFpRc+lbz00LmskgAPxFTDCDzeuhhSnICH4qw9YzHRfyjizZf4agBullUyxNp78hA==@linaro.org
X-Google-Smtp-Source: AGHT+IF32HSkS6gOr5zTRKLHyOBYfDCj6HietDygzIkGDIOzPhVpHe5CEAv5HaHLnuYKFFunEPHI
X-Received: by 2002:a05:620a:24c7:b0:7d4:46d0:75cd with SMTP id af79cd13be357-7d5c465f314mr998290685a.8.1751535220254;
        Thu, 03 Jul 2025 02:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751535220; cv=none;
        d=google.com; s=arc-20240605;
        b=OSWP7ppCSM2A6ANteqBEMi+F+CUwcd2Vf8hG97tac68IPfOcy6N0DEqRMVI286Wz4P
         GbsEkyq5TB/Hbgni3VVTkHHJQcJysoP1rUBDOMIgDPf/ClBFbTkr/TLeG3NWSdIse5na
         nQcg/UbOubq2Xi/NL7biOX5D7yzqihoKz9Ge9/HbtOkKfeScguDnrvvzVLWddeqfwZva
         qbyD0hmOGFPBkKaaDjiE7vyZGhrqODtVoIZzFjcIXWZ8Uxk0bRaEY1bpk/OeFkqv8fBi
         ovXQXSqvWVd3qFbBgwqMNRPqZ1aIs5RPStk0Awx15NLJacTx7PaeAUex/JTOD50UunF8
         S6vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Vm7Z1X6bWhMWe7qF16wAQ2QENG5rEvn2XKUL5DZNKEE=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=GhQtbyUnkcKmYz6fY/1SVYFu4kBwb4rxtNcwY9U4AJj7cbRoVmB5yigW6cVIEQlC3y
         yQSACAfBfjADntxFTMwfuWUK/FL9c+XwfBzy7t+N/O909C4wZ3gJ3ZlHbsRL4/NDVNIO
         2uZL3Xpnfeoh5yqURnA7PfEIrIQocK+A9gopx60ynzBabVtqSv0dCJhLYFqWHiiw0AZq
         rYpFRihJwLL6rvhF11yvnWlPScNYRDFlMZwBD+h43SoAdvayMde7opjzok945/7sw934
         wS0DskbolW7gHE3tXVUdMAH6pzhKGgzD0CiRVJobh/wWErhFglalGiY71m9p1VX+WnvB
         O1KA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="xM3/CXJp";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d44329cf76si1353670485a.588.2025.07.03.02.33.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 02:33:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="xM3/CXJp";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uXGJn-0007DE-0V; Thu, 03 Jul 2025 05:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGJl-0007Bu-Nf
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 05:33:21 -0400
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXGJk-0001ES-1B
 for qemu-devel@nongnu.org; Thu, 03 Jul 2025 05:33:21 -0400
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-711a3dda147so84362817b3.2
 for <qemu-devel@nongnu.org>; Thu, 03 Jul 2025 02:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751535198; x=1752139998; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Vm7Z1X6bWhMWe7qF16wAQ2QENG5rEvn2XKUL5DZNKEE=;
 b=xM3/CXJpNVHndehE4g+KIanya5DxM7oWgvHL0WgN84c3n4jrMiE6ER2cGhyvKDAc+d
 28gEhvWCozFhi6N62sFpFISWvpu3LgpM88LNdrDqwmc6F2PTxZaaHd+3tzj5cELbLF20
 J+ASXgWmBxF3xmjhZi7yYl0us6loVjyba8BdmfXzztapUbOrxk3Q0Tye85EFxtVP6aYt
 E5+CEZoOb/rbXVK2OCvKp23fGZ6IvZnKWhShvBIZo2XHi9URNYUm+2menUFM0dYw0NDx
 1zIfqMtNpy14Q9cFXdP6gWW9w4b0lSG8AyNUGn8jwWHOkigt1llMIoIrdI0i+nG9mP2q
 gnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751535198; x=1752139998;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vm7Z1X6bWhMWe7qF16wAQ2QENG5rEvn2XKUL5DZNKEE=;
 b=SokNfuotmZdGreSA1rCbMzH+M/IzBA2+GQLIfz8NjDWfcdKMig/M2rBb6gQrkcXOV4
 0P5TkF5OwqbKmPbwKZlqw5O1fC2Ye3WVD6G61V6YPJ1i/JRDN6rvYSJhc5qrK8fEJsIj
 Hue60K3BdIisG0Hb9no//z/4vHhNOt955SUnSiY/I3P/zxo2Y4T0y6k/uCw03asAVcs/
 x5dM3MC0QOGIEpzaD0ifll2PEjj0RML/6fRAOUVNMMKXrhYLaQvY55lZfXhi/jv1V+kj
 z2QXOHV2CTT/U1VA649Mzv6FdSvzNykFQvJxVPFyZaCXIIrbu1XFKm2nvxEyZ7S5E67f
 Yjzw==
X-Gm-Message-State: AOJu0YwP+hTJzEFgp2SxtR38PxGs8lgAV4QTD2f9fXveQDSyy3ugcWz3
 WGPxaBOopExrIrlOikNjSc6c0GofVSmxV+j5AIlG5jtOHm1HK7ja2hvm2+3hKORtWTabe2S3Bky
 K+YFy2/jifKgRYBPdgPy0h8EQp8hRqwjCeNBscqAQXw==
X-Gm-Gg: ASbGncvaWqs+8LFr4u4KwgmxjzthsY/NcKdMo9cO/C5RjuCWdfOFhmxio79EBURz84a
 mrsHjK4tlt2qdQVfKeF3KtfrxIDi1l3CcXfLZOKNoIeDbqrVovMqRewjsRzxXjohbvSpcomkmYp
 lcxraKFz2//p4HMC3MXI+QOODjVnusdemV5jG04SZB6FM+
X-Received: by 2002:a05:690c:600f:b0:710:e7ad:9d41 with SMTP id
 00721157ae682-7164d385135mr85842837b3.12.1751535198593; Thu, 03 Jul 2025
 02:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-9-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 10:33:06 +0100
X-Gm-Features: Ac12FXwvc-XjNpwn3T0Xof8I_Q8DPBtphrALssCXWziI6Gz9GiKgilg8lm0v3TE
Message-ID: <CAFEAcA9ua2tYjWH0jZmWufDKXt6d4DStEWTe6g=suqK05NrRTg@mail.gmail.com>
Subject: Re: [PATCH v3 08/97] target/arm: Add alignment argument to
 gen_sve_{ldr, str}
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uqRliZoGOCOP

On Wed, 2 Jul 2025 at 13:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Honor AlignmentEnforced() for LDR/STR (vector),
> (predicate), and (array vector).
>
> Within the expansion functions, clear @align when we're
> done emitting loads at the largest size.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.h |  6 ++--
>  target/arm/tcg/translate-sme.c |  5 ++--
>  target/arm/tcg/translate-sve.c | 50 ++++++++++++++++++++++++----------
>  3 files changed, 42 insertions(+), 19 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
