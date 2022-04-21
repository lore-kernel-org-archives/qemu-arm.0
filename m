Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp580076lfk;
        Thu, 21 Apr 2022 12:09:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwX2Hv10d4+6n1HYUfI8HDC7rHB9qi0H7Ax9+ui+O1UpdernkakpJ1gYzpuIn5/HPMJai68
X-Received: by 2002:a81:3450:0:b0:2f1:d8f4:cd9c with SMTP id b77-20020a813450000000b002f1d8f4cd9cmr1205452ywa.455.1650568178019;
        Thu, 21 Apr 2022 12:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650568178; cv=none;
        d=google.com; s=arc-20160816;
        b=BVtSfumQJxpRHUGnm8vJ8rW6chc450PtAAIbgktvIgHQDudKgXBaq4wNms5yUj3DNK
         b26jYe6tyzReK8Cse3RXnlVzBTVYGbB25DTglaLdJrshuXq9G9KmP7C9ljq5TAD7wVJx
         YoFoVhe0kjhiETHN8iXRUOp34bNbql7VQSR7y6libTP4ajt/YrvpXqBVabAk0WR2rboo
         SVJPpp2Vj6v6H0NdKea9/zEEiYa6OX7HjA1WXXHq72CbfVHHNXnJGL6ejO6nfznivBUr
         tb5ktG1HGihF63d3tWzF/somR6XXi2VN8apTQDNirl7xqdMBQYziU5nXImlnwAx+npeA
         0DsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fI+MEI8RP2BGe18s3DgNtdGctOAQdnz4U334nef1bfw=;
        b=XagqUkfM49+NwwZ258uFpyzB5VgfEPL79c+2hyIcuHxRC1svDrCDzaojv2tw+iT09k
         fQj6bPoIaXInQyw9I+p5j0KAqUlXQxMDXDKf0ZesCzcM+B/mdrxOPme7iGhUuDbMLzOb
         b4wppFarxgJMFMD18m4ak2Uu+Fpgtd/oE1jCif/UTpOd1Y0Zn5ELlOfOvuFGW9C1iarE
         K+2ZD6k8pcuXd/OZgZyn5939VH7OCyb6k00ZL2qczgVJ68oViHkfUtk1g5u0Ob2iCUCf
         BNgtVnV+sBqLESXI8E0/XFBR8Zom93Q2LqnikDv/k/na+5EEWs7wML238HdRgBhd2M21
         LtAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OqdJMYeW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 77-20020a810550000000b002f4cdec4ff8si3048396ywf.316.2022.04.21.12.09.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 12:09:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OqdJMYeW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhcBN-0004uP-EN
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 15:09:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc8F-0007g0-0k
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 15:06:23 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:38902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhc8C-0001oc-TH
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 15:06:22 -0400
Received: by mail-yb1-xb29.google.com with SMTP id v10so1640404ybe.5
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 12:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fI+MEI8RP2BGe18s3DgNtdGctOAQdnz4U334nef1bfw=;
 b=OqdJMYeW1yPUs2RIi1dozoq2QfYdxR9/rdF/gn7Nj5jkkrakJd6H/sZHhpLHPSA23g
 j/64BXOSmXHInAvBNuu/+SB2a9BZgDBln1mVOEHeM6tKWxZRKNUG18Lh9U4cVvGk9GPX
 yds7OUTob7ANx8+6K+PpZwhdoK3Za3E1TPW9EREzW8a79sVjm37msek/atpBxNR0slBH
 mS8QOJp31Ja4ZWed6utOaNe2fwBeXPPSUospmdhkeDGAHT5JRdBbbmoQWVqVnR2f/t06
 IRwmdvswrRaa5aPYO4Z+zNH7G1naqiX9FOPiGuVVg1FnhaWQD7rGdiv9dX/rWl+nDawg
 WiFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fI+MEI8RP2BGe18s3DgNtdGctOAQdnz4U334nef1bfw=;
 b=FhvTtvUqqK+5OtTKxBfoHmaGQ3Ndb9miYFrFKdxOVRVKhelEIR1uIixyvggltbZL0I
 zhi7cLxCamd3ssKCcUVlMegbmQJURJEjcMDcwS7qLUCr9Cq3t320/sYnR7aKtY0y45c+
 AmrGWcqLAKmcuPCQfm4f/me1e2W8tZAqc/Ue9031UEhjXN1xCDcX48LpclSRKrFJdgB/
 LqKDhbUnfny8JgBrdfPsjwm5x3/dtQ+lO+J/DBVYd37cBmcmrliprHQM2JP1Qdhjksj3
 qNdYjzqiIVR8VQWvYd879lMBvaKvGbusT/VMF2eC36YXdlI+I7epWzeX9IyPpPW+5its
 NuhA==
X-Gm-Message-State: AOAM530a7BJEYGGU3CrWIyOs7R0zfObVcUUn14Qt/e4lsYxkYDHAgRYS
 +/tMSsTxVehXjLpPJuLAEoGV7t3sKDwZGOY9sA7cDw==
X-Received: by 2002:a25:a287:0:b0:645:3c4f:7dec with SMTP id
 c7-20020a25a287000000b006453c4f7decmr1161891ybi.479.1650567979875; Thu, 21
 Apr 2022 12:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-20-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 20:06:08 +0100
Message-ID: <CAFEAcA85PQnOrYeo+eLQ2t80YVRt+WwcQqV0TL=fJt-0f7ynWQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/60] target/arm: Use tcg_constant in translate-neon.c
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gzvlXYDgfAxE

On Sun, 17 Apr 2022 at 19:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use tcg_constant_{i32,i64} as appropriate throughout.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-neon.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
