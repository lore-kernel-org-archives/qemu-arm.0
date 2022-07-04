Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3236964lft;
        Mon, 4 Jul 2022 06:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uBheHRDCgZu7dlRtnaeMhFL2UtBdJ96hbEkIiz9WgGBbYshWQV84bNxBa9Qqt9f13D98MC
X-Received: by 2002:a25:508:0:b0:66e:2cb4:dedb with SMTP id 8-20020a250508000000b0066e2cb4dedbmr12319513ybf.554.1656942039916;
        Mon, 04 Jul 2022 06:40:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656942039; cv=none;
        d=google.com; s=arc-20160816;
        b=HyfWFoCzdSbq+eCJHHIYvC8I4LifDyDSh5T9ZfnyLKY8piEGWcT7MonHu5+BMCC9Je
         M74V4xWPy7iwh/bqYSko/i70LU5x7+BNpo3E2/rlnQHgEoVdxVZeIYpuQHfyYbqrp9L8
         +D7OBGoaw+y6IB0wyuB7yk5eZ183bih7Qy7zFSoRj5foqY7s3j6MNG1DztR2/FiqKLDF
         tnIFojCGaBpXy2TzvopQb/NZ2sceUgNPvgksbX+WR9EnQ46/Ygpv4+7XOVGzmhFaVT9h
         ox1cvzNgzzgDtl7YAd0zDDy5IYaE7LLcDfAVP5c6NMWMHf/bgjtulKbvXcLLVZTeXzqF
         J5qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xptBX/D3GnqKCo/Q7ni8rXondMIzZbtwru7Wp5jqL/0=;
        b=q1pVcNdKqTlGTppnVYvC/scv/BdD7dI4Nw1g9O6jzVPjhQOfOgQrHUx9f96+Lm8gqm
         Ex4f5MhYoxyZ9acuNRtqPcH8XGt5nK+q8/GfeKNb9jWtdqxIpjtYcTrZUj8NhcdX+RVK
         n+HA+S9LPze7gBMyhGZoqTWjRKuKJOBv1I6ESbXH/xLWDwEnkM1pPzLZk9KEKFiBHcD9
         Wk6XUTUTrnQ1jNekGM1C9do6m7ze1PYeAkFVKtxPhPh8TJIk7kusEiD/dZRdl1W44wqp
         S+lFKXLm/j5zMke4f1rrovOgmYywY2WRpEYlhKUwjMIwcTny4reZjmbpVEV+MF7KwL/F
         AUAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wbkIX19a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h125-20020a255383000000b0066d642244f4si20273607ybb.240.2022.07.04.06.40.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 06:40:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wbkIX19a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8MJX-0000dX-KE
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 09:40:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Ly6-0002Un-EL
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:18:26 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:34589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8Ly4-0002Lr-Rm
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 09:18:26 -0400
Received: by mail-yb1-xb30.google.com with SMTP id d145so13655942ybh.1
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 06:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xptBX/D3GnqKCo/Q7ni8rXondMIzZbtwru7Wp5jqL/0=;
 b=wbkIX19a3PuIDdWZhWQZrqMvuOLfAclkD97AMc8bBCi2RF9838bCOXUmSuHyzyhUyx
 1nGfAvMfGlefp9k+KpUzKVId10tPnjYGsV3DYDWbkxh+x0RMyUTkVHSbc0h2t9/eC6kI
 L9Fd5pcxpQ/4qtqh81lT+H9kCfQUrtG/299c6zJX/BZnpyJT6+t9DWq0epsIx94odb7V
 rJIq3HlrYlwsMXK7ATh7tKHjLWRoCoOGiinl1lXfAGKJv1QnWwIWOUV0fzPj3nvErIlS
 KyDh/VyeSkVITQlslCnqAaEIFBPcTwjpZqxOLPGvpJ5noohgTbGgMyBaS4kO5zytIvtb
 OX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xptBX/D3GnqKCo/Q7ni8rXondMIzZbtwru7Wp5jqL/0=;
 b=AkFCPL6MPqRBZxsDt8rNbrWXf4P7eZ1hC3HOUB5kKcpYHES2KtR/BvzSs6d3m6EwJJ
 43RO/TQqrtSVlSRe3jpSbqKG1XEdGtMkjyN9D+kFQ1h8y79DSNO19davZH2+qcWAgctT
 FvGnXL9sm0P6OmAdBgHnYiRkEenpPZdbeF2y6uE1MmDPDbEIgnmVQJVL/wji+lSwUTP4
 urh7h4kKolbOQTGqjfNlmmIZQLAuKr+heMQ92Wh1icVCvm+JfqyNubJJG/r0mXH4/CO7
 Gv8k3/306BmBselOlPaLV8T2tlWibm6ilQYwGdKf+MgGyMCjPzdfk53U3Y9+MwHaArw6
 5Kbg==
X-Gm-Message-State: AJIora8RG81Rq1LWrV1NwBcIQBKfpEZ8ze/tvDP9c2qQXQvlGqcF/6sp
 J304x1RWP7x4EXcl3hQ6U0W/oLft+K0ZezBPvO9/RA==
X-Received: by 2002:a5b:e87:0:b0:66d:4669:9871 with SMTP id
 z7-20020a5b0e87000000b0066d46699871mr31235218ybr.288.1656940698338; Mon, 04
 Jul 2022 06:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220629124026.1077021-1-mark.cave-ayland@ilande.co.uk>
 <20220629124026.1077021-10-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220629124026.1077021-10-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 14:18:06 +0100
Message-ID: <CAFEAcA9cgeZRCpTGwUjEhqyvEQghbwR+0PZ8BNJ2w-5WcLwFoA@mail.gmail.com>
Subject: Re: [PATCH 09/40] pl050: introduce pl050_mouse_class_init() and
 pl050_mouse_realize()
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, svens@stackframe.org, 
 mst@redhat.com, pbonzini@redhat.com, hpoussin@reactos.org, 
 aleksandar.rikalo@syrmia.com, f4bug@amsat.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +HRT1RukkE6N

On Wed, 29 Jun 2022 at 13:41, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> Introduce a new pl050_mouse_class_init() function containing a call to
> device_class_set_parent_realize() which calls a new pl050_mouse_realize()
> function to initialise the PS2 mouse device.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
