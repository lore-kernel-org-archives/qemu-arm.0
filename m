Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp954710ejb;
        Thu, 23 May 2024 03:09:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0fpYtfFkteGCgK5HJkNTtvz8qbWddm2cwqorlKCxb2HuISDCZJTAMqm2tAAMTWsR/ow3KxaZVVJRMOBpLFcPsiDiOt11m
X-Google-Smtp-Source: AGHT+IFNY9zlHnk4Ud6vyXiFtLwr0VLFPeN8/j4qxrmKbnRqsjgnjTPvY4T3M633ojJ8OdCDAB1N
X-Received: by 2002:a25:8002:0:b0:de5:4ab8:317f with SMTP id 3f1490d57ef6-df4e0bc89d0mr4656746276.20.1716458948304;
        Thu, 23 May 2024 03:09:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716458948; cv=none;
        d=google.com; s=arc-20160816;
        b=f3FXkQYs5+sdOunGgsY7QI5E7VAZUG/y+7EjEVbYlUAwuP9BrgJQIVqK8DlhuDnyUc
         dzztthhagVwTr6oI4L7qloisrHKDb/oY+N8V+vBw/D0xHNrvi+vNckdwiDtLhOVYaoYa
         N4Pp1kFcEo44naR5rtumsu2po0dbFEA5pSfRnjoLTie92V83MwklJYZKwKk3N508XJqW
         Xt9D62mpLKIcxwpvxsC4RkGCMePax3cRwKWqXW4t5QdwE4barG/p1j2aV4kPLTtZCP/Q
         vm9/Ou82WmT9+DU2C5VLjog0gmlqIwcbCS00kQJE7we1uL9qiH8NJcwlzHVIh+CvHTuy
         Abrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5M4AJuHJDFz41iRl6LmXlJMXhZQlHK8b0XnLffpBY3U=;
        fh=de6CdmOEpJii5HQsez9dfmDW5NtrT76zbtF4jRU5CMY=;
        b=GfNq3YFc6yiB0Ouhlklz3CpIWq7lTlR2BlKGlAN7DkDXpPPG1f+2FMhUNzjW1YwG7m
         +sv5H1hYUy7/CM5PI4fRrBHFPkBM2n4lwm5ZaMJH8Lj+yVsftHDhOQs1in+SGFAMVWED
         ZIZBxlHpRq221gKbJgzRgRIuSWSovKxKpuvYPPjtNJRKaf4pj112B+yS3QOTzP6iWYEc
         /mfwIrsE9mr4T+pFyWYAwUEitgmnkEGTyh//A7sGHpswGBBVa2D/wnj2Az14EWUjXZDC
         ymDjL7Hb/GVFTrDdBT7mbiv2+rg2vsq6CoGFp/3v/0BOSXnvC/2DpGkzjjAvzx3rlGmw
         tJeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QMGMB7ix;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a9f3acd2fdsi8676916d6.11.2024.05.23.03.09.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 03:09:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QMGMB7ix;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA5NY-0002JI-Kl; Thu, 23 May 2024 06:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA5NW-0002Ic-Ka
 for qemu-arm@nongnu.org; Thu, 23 May 2024 06:08:54 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA5NV-0005gv-2p
 for qemu-arm@nongnu.org; Thu, 23 May 2024 06:08:54 -0400
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5238b7d0494so7967808e87.3
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 03:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716458931; x=1717063731; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5M4AJuHJDFz41iRl6LmXlJMXhZQlHK8b0XnLffpBY3U=;
 b=QMGMB7ixqwU00dS/JAjOcG5N0YxXul4oFXH0X+pGTR5Q0NHVVNX/OWn+z2ItwMX28Q
 78pX6Yo/p8ZVcDyH5SFru3bZ/rBf9ie66GB3PXXY/40jPrCTXEOutDREX/Z0ZluzM3E7
 DJG7oB2I7VShItUXN7YYJXpXvDRR6aYCEdY/qGjXbRjsnNOqSKw5FZxxe6UrMoqXYsUI
 vW5KJg6jXG1uwDKZ1xtHMWjbGnbKkpttbkM88uRpbpJwCSDPuuBP6VXwlWh3I6Gbu6Ki
 fUg3GRYse7Q8dRZKwQ2bJFDzgHftCUpiWa1qSEmfnh4ZtkC6eWSN7HpFF5xXSZcszMZS
 FGOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716458931; x=1717063731;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5M4AJuHJDFz41iRl6LmXlJMXhZQlHK8b0XnLffpBY3U=;
 b=l3NSTYnVqU2X6xY2XWkL8EDqKoh+JOI8ykes5SCERIJ+ozKQ9d+F0umTKwvaDu6q2D
 Qx1m6RtWAB5Er26uLZZOmzZhfqMcu300BKLGV1NWbYZpVhj7vVq9k4ew31uX08zT15nX
 IeLw/Y+lB/YNEzbockEmwAooIYD5NylkQvAVgowS2xvyIO5rhzLNkfBoDGkpcHxOKUb2
 u0QY/2KyE4rTM/+MeabEZHhD+XL/bPPBcRlo32QK3AVvx5qPmEoDnRnxxIYUnkSCadyD
 CQ9ePmioE5r91gFMTs9O1TsRobcFuvdQksJy+RLefCq8e7N+11SgsaOKKN0skBNW4126
 SXOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCEzm/oQ/HuTeXnN6U2in0wExExQYY+UxeoI4S50OCEyM7tsvlsRkXTkaex49nKf4REJ4wi4+RYQ0ld/41Hu/J7gFW
X-Gm-Message-State: AOJu0YxHmyrVC+fA4Z3BquymqzFZ5qtInGCAjJAr0FBj9xhzBEnUBF7w
 jUgjdCSPJev3I5lXFRNpFeYjd5pxxScHJbyjNJw9ydAldwdiPPz25gYjRziuLPs0TUj9O9PPFd+
 b2iarkWWIUJBnFkI+kD6VLglz3azTaR/6N+iy8A==
X-Received: by 2002:ac2:5a1c:0:b0:521:4f20:6275 with SMTP id
 2adb3069b0e04-526beca95e1mr4152165e87.10.1716458931311; Thu, 23 May 2024
 03:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-7-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 11:08:40 +0100
Message-ID: <CAFEAcA9zumBr2nQ10bRK21KU9MnB9ouYzirA8MVyb3hb4a4tGw@mail.gmail.com>
Subject: Re: [PATCH 06/57] target/arm: Convert Cryptographic 3-register SHA512
 to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12a.google.com
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
X-TUID: ths0DCRlHUMl

On Mon, 6 May 2024 at 02:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/a64.decode      | 11 ++++
>  target/arm/tcg/translate-a64.c | 97 ++++++++--------------------------
>  2 files changed, 32 insertions(+), 76 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
