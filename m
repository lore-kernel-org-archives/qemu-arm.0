Received: by 10.182.158.201 with SMTP id ww9csp1502741obb;
        Mon, 23 Nov 2015 08:50:12 -0800 (PST)
X-Received: by 10.31.8.213 with SMTP id 204mr20275965vki.34.1448297412231;
        Mon, 23 Nov 2015 08:50:12 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x232.google.com (mail-vk0-x232.google.com. [2607:f8b0:400c:c05::232])
        by mx.google.com with ESMTPS id f134si13347130vke.58.2015.11.23.08.50.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Nov 2015 08:50:12 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::232 as permitted sender) client-ip=2607:f8b0:400c:c05::232;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::232 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro-org.20150623.gappssmtp.com
Received: by vkha189 with SMTP id a189so41399402vkh.2
        for <alex.bennee@linaro.org>; Mon, 23 Nov 2015 08:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro-org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=Bty+6y1haT8Gh78Gt78IcaluMZzD3hEHeUr4iK8aKyk=;
        b=uTh5OZkYFdOIQ4qzONSVHdKPd9pduK08sz0609Jw6M7gmXNDtldbITCP0HWLEY7f2V
         NTbWMs1S46gPe8vJ1Mjlk8ZgZMv2rBmnm7MIxXm23HHrEu1/4IwymSFF+S/HcgSX40UL
         pU3RlYbVFymKSFbOHG1PXDTTK0nBOqX9u5zAIA0/U3WXmcermKKpDBKlYHICYAIV5eMF
         LTOOISD5fRXmviA2gHQH0o031OK7KCTwgn+eJ4t/0O6ETqjkTgNCrPTo47dHUEt8yFe5
         Of3JuvMLWOtDIBAEZ/qPEFxJwhYD4PMwr2ftrcb3aO3v/OARKGdr3tCpstSb2VwfDjKp
         y+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=Bty+6y1haT8Gh78Gt78IcaluMZzD3hEHeUr4iK8aKyk=;
        b=dUt5VpVw+D4Ajw4uIBRTQ9Weh4bCDfOO5D39/qQ3xrEOzH1vS3M5ytSVll9jxPUsNp
         hXqTZJ7QCK/0AWiE1lM/+XylpT2O03h8j8fYVdZisYUMbqB7T5TzvXy+x657vLsts7/e
         pE152BQuPkltppnief/yWeZtQW1JLDd+AFOHR1FJ88xmOBz0ISYC7WrowG37MgSBhI46
         1c25dHBUOaNOXQ/EIAycLxcQ5zqJk3G6CyplSskI5Fn6se/tMV87NNZNDm5eBrBqhLP1
         srcAj+3vsVEsAVgmNBTzV455WlHG9kPdjIUr2TORAUL/YYK8JKytuIRqQxAFs8GFtZpl
         6Baw==
X-Gm-Message-State: ALoCoQkxWDBHWhIu8qqaJWbWJepxrBQGHkVr6GUn7uW7j+/AzJsFeCN76KB4/uqfdiIlKayzL2Hu
X-Received: by 10.31.47.197 with SMTP id v188mr20276549vkv.6.1448297411986;
 Mon, 23 Nov 2015 08:50:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Mon, 23 Nov 2015 08:49:52 -0800 (PST)
In-Reply-To: <1447698531-4751-1-git-send-email-peter.maydell@linaro.org>
References: <1447698531-4751-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Nov 2015 16:49:52 +0000
Message-ID: <CAFEAcA8Xvw+Q4PjOrhswT__M4a-Aj2uPpEcsZqpNbSAoKmTBmQ@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH] target-arm/translate-a64.c: Correct
 unallocated checks for ldst_excl
To: QEMU Developers <qemu-devel@nongnu.org>
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>, qemu-arm@nongnu.org, 
	Patch Tracking <patches@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: ED/48ElAQkTr

Ping? I forgot to mark this for-2.5, and given how long the bug's
been hanging around there's not much urgency to fixing it, but
we might as well put the fix into 2.5 if it gets reviewed.

thanks
-- PMM


On 16 November 2015 at 18:28, Peter Maydell <peter.maydell@linaro.org> wrote:
> The checks for the unallocated encodings in the ldst_excl group
> (exclusives and load-acquire/store-release) were not correct. This
> error meant that in turn we ended up with code attempting to handle
> the non-existent case of "non-exclusive load-acquire/store-release
> pair". Delete that broken and now unreachable code.
>
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> The easiest way to validate that we have the unallocated
> conditions correct now is to look at C4.4.6 "load/store exclusive"
> in the v8 ARM ARM rev A.h: our three conditions correspond
> to the three "unallocated" rows in the decode table.
>
> PS: Laurent originally reported this way back in 2014:
> http://lists.gnu.org/archive/html/qemu-devel/2014-10/msg01255.html
>
>  target-arm/translate-a64.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)
>
> diff --git a/target-arm/translate-a64.c b/target-arm/translate-a64.c
> index fe485a4..890ace4 100644
> --- a/target-arm/translate-a64.c
> +++ b/target-arm/translate-a64.c
> @@ -1833,7 +1833,8 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
>      int size = extract32(insn, 30, 2);
>      TCGv_i64 tcg_addr;
>
> -    if ((!is_excl && !is_lasr) ||
> +    if ((!is_excl && !is_pair && !is_lasr) ||
> +        (!is_excl && is_pair) ||
>          (is_pair && size < 2)) {
>          unallocated_encoding(s);
>          return;
> @@ -1862,15 +1863,6 @@ static void disas_ldst_excl(DisasContext *s, uint32_t insn)
>          } else {
>              do_gpr_ld(s, tcg_rt, tcg_addr, size, false, false);
>          }
> -        if (is_pair) {
> -            TCGv_i64 tcg_rt2 = cpu_reg(s, rt);
> -            tcg_gen_addi_i64(tcg_addr, tcg_addr, 1 << size);
> -            if (is_store) {
> -                do_gpr_st(s, tcg_rt2, tcg_addr, size);
> -            } else {
> -                do_gpr_ld(s, tcg_rt2, tcg_addr, size, false, false);
> -            }
> -        }
>      }
>  }
>
> --
> 1.9.1
>
