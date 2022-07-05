Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3890617lft;
        Tue, 5 Jul 2022 05:06:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1su9n4as8a+C9vkWhnyOCODakTxNk0tRvdh7hYN7L67ZMaNcP7AbQ6le/WFz7qchkltnvDn
X-Received: by 2002:a37:66c9:0:b0:6ae:dcd9:f17d with SMTP id a192-20020a3766c9000000b006aedcd9f17dmr23581634qkc.634.1657022800917;
        Tue, 05 Jul 2022 05:06:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657022800; cv=none;
        d=google.com; s=arc-20160816;
        b=gQfhMIAoZHU2BYl17cLP9WGH8GyTnSkbCsvh5lT8FQ6vlLktkytq8HrQViKL92HLkd
         DIgPmYonIUJotRv547+q7xxT2dZRjRRaaRZmCew5ZWVTHN1pl9FYLfTlW+IipFHwY/EY
         zrqXgBn7QGChw6mEtZaTCC4SPaiX93TfK/rMbNrjX4OXsH/WNnfQzFy6GDwqJGWXrZ/m
         OHWNM72lhF+hf+0AoqL24oTzjG/AteCUp6kwONRSU8dWamwNMn6Q3zot8Z8JX08p4hXc
         +n23bc91zH4qImxxqkjg80uWix0DeiW86ZpsxO5z+NfNCNocxUDBvYfLlrx9JChEaazB
         BVIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=T5uh004xHAS+Dvz7+Ps6RyFRfJNa3YTXOVgBkRFiqq8=;
        b=kpXqx2MWxOSF6LCuRQBXjqw2BOArb85o+YXSfYSzKuezI+kee97r+qsBWjKSjuXOLk
         3xTpuycz3StyzKWXqH4FffE7ZXIM32kXFcOd+Gd92HkBQ9YYA1m+ypIyQjkXNKA9l9oB
         x05RGZRVf1pMox1XWgHxGlzxHWnYY0EmnYxBTYbISMVBkv1BBsW5U1++q00V4b+MdNn1
         lFBZ58BugijPe8EXxASaIN1iIr23e4XSIqg71Y4ugCdfndBP5TxEOYbJCaFRCL+QDYn2
         QCkizv6EvBfiXFZbNv6qkmk+SFwFZXyXJGaQ2Xpjh4YldpeWWaLvU4h7Yw1MDp5NRByY
         Kxjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ox+sE89f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h11-20020a05620a400b00b006b14b58f4efsi14242094qko.97.2022.07.05.05.06.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jul 2022 05:06:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ox+sE89f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8hKC-0000wq-BX
	for alex.bennee@linaro.org; Tue, 05 Jul 2022 08:06:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54988)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8hJE-0008Il-GS
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 08:05:41 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:46851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8hJA-0004oe-5F
 for qemu-arm@nongnu.org; Tue, 05 Jul 2022 08:05:40 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id l11so21362399ybu.13
 for <qemu-arm@nongnu.org>; Tue, 05 Jul 2022 05:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T5uh004xHAS+Dvz7+Ps6RyFRfJNa3YTXOVgBkRFiqq8=;
 b=Ox+sE89fQ/XRice4h+3Z3lOugXMmZ33jK0MNHEhvBSPW4IJEHZG1JT0HsqJdN4gXXs
 4Sl1auADrkE1b9c1q3jIGfrL0n8gwf4unEvJmL+kJPC9Y5e7A0HiquW5DgeEF8LOOcT7
 67edj2FRZ099uM/3numW0i0GYPnQC28ZpFTmKTfzxUhoHV8fh84TERu9UX3hbo8bnA5m
 yZzyLXy3fZGClhakSLLgQB22i1i/fPBNR8a1XBQAaleUTm1wXFi4mf6ga9z0xZqa1pW0
 xnBUVIo/VMRlOl1pg1gyy30xWPk4Q5A5fjWP66/DlEMBsesfQZg9/qFBEc/NVnJ+Wsmv
 dfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T5uh004xHAS+Dvz7+Ps6RyFRfJNa3YTXOVgBkRFiqq8=;
 b=alBkIPZgX/0T4hmBIBwlE+BOLXj2/u3vYLECalNW5EblIFzBoQtgf/up5ge0a+rWI7
 /sr46mZqU68ac3IhSAIyzOl9fky1sD9nTTAwl90ngkPEbI7qyZiAxQmchv9Iu67h4BC6
 LsYtD4S5bJnojbu5VDfvuDRY3B+hIINnke+P1zGNn53fDs7SdBN13GDJCcJEbIN3aYEL
 lW9u/B+YJHtRQazkS5CPjlxnKWoy9N4d5bnb/m4ecnL4fDlESVZyNFqlV2K7afALWXTX
 0lR3LDuJstdK4O29xKNqsufwcqE4RJR52KWKm7L4TlEiLW3OqpXPjz1z/HJ/kNwAbtQS
 lIGg==
X-Gm-Message-State: AJIora/jMkdKFCKO+dv2p9RFzYBeB/fbMZWQnOHPXH1Rwnas7rfVVzPi
 EhxVODVKm84vf4MUpObz+PSYs1nMEHb4QItIICzzUQ==
X-Received: by 2002:a25:d381:0:b0:66e:2943:1c9d with SMTP id
 e123-20020a25d381000000b0066e29431c9dmr17960460ybf.67.1657022734890; Tue, 05
 Jul 2022 05:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220703082419.770989-1-richard.henderson@linaro.org>
 <20220703082419.770989-4-richard.henderson@linaro.org>
In-Reply-To: <20220703082419.770989-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Jul 2022 13:05:24 +0100
Message-ID: <CAFEAcA9rawNH8PJFU5dXZbafhJYjG4vuS8r0gATj9aXJYLC_kw@mail.gmail.com>
Subject: Re: [PATCH 03/62] target/arm: Fix MTE check in sve_ldnfff1_r
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v1zf2AMU/L6N

On Sun, 3 Jul 2022 at 09:25, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The comment was correct, but the test was not:
> disable mte if tagged is *not* set.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/sve_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
> index 1654c0bbf9..db15d03ded 100644
> --- a/target/arm/sve_helper.c
> +++ b/target/arm/sve_helper.c
> @@ -5986,7 +5986,7 @@ void sve_ldnfff1_r(CPUARMState *env, void *vg, const target_ulong addr,
>       * Disable MTE checking if the Tagged bit is not set.  Since TBI must
>       * be set within MTEDESC for MTE, !mtedesc => !mte_active.
>       */
> -    if (arm_tlb_mte_tagged(&info.page[0].attrs)) {
> +    if (!arm_tlb_mte_tagged(&info.page[0].attrs)) {
>          mtedesc = 0;
>      }

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Since this is a standalone bugfix I've put it in target-arm.next
so it doesn't get held up while we review the rest of the series.

thanks
-- PMM
