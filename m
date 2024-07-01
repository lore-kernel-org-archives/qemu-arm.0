Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1331144njm;
        Mon, 1 Jul 2024 05:29:33 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVfZBxNNdLbVdr+RXe1yLF634bXPUA9sG32429saX+AobSz4DiWNI5Z7UtFBWekDYoUaqEYGlW+/vpIwly9xcR0Us4S/Ush
X-Google-Smtp-Source: AGHT+IGb7JoAnZqNsqyNHjyFtukCZ2kyCRSBH8BYzJJgognMFCKyJDm56+Q96izaUASwi7DvKJfy
X-Received: by 2002:a5b:484:0:b0:e03:63c7:7b46 with SMTP id 3f1490d57ef6-e036eb3dc4cmr4112367276.20.1719836972943;
        Mon, 01 Jul 2024 05:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719836972; cv=none;
        d=google.com; s=arc-20160816;
        b=hPws9sH/WhK3r/KRWbh15wsj4pKO+pivyndJFlwTslytaqyAYGBEBozIN380DSxteQ
         Q5qyd6qpymnUyhHkpL9sm7AKGTFz+2stQSkkgbLUGvbGQVmiGzlGS7CTXERRqqlcRuXS
         89U8GwfYZ0OTJnPhZW2ROxNEQZ2xPxwFtBrM66YW4NeQd7JixmLc3OBBdndSPwaXXifW
         GwkC9GmLH38Kr00+YZi6t9IdVqwDlf3Ff0DS/0c+y2TPrWRtBoNif4Ij466CY5/ncMkB
         +6ORcRQp6o8VWDKrW1QtlhWf40NGmqv/9+y4fBFK1e2h4zeH/gv50bu8wrpoLI3Zrd/I
         oMsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MzDh3WELYAqnPjOgFol2sHjG+aIvVmLDwXGfVlwOuAI=;
        fh=65uQdRl0YRMnkE7k/rj15Y8rxNlAOZC+sfv5RMjMzkQ=;
        b=eSPb2QR1cazsyxOXJbO7cXB6S8+1DA2DtLIttOvYv9h8ZHPJh2+GrF3J9HPWngawM/
         HJqh40HWm1TVoai6wE3DKScI2I8Y7HKrLOUecJ0/qBYL8u7R8V0Gcfk5wFURhNPHAWs3
         qjs1/F+EpKz5VYgc1D6o3XA52UY1+tbTJe8xsrgbjT2bCuS0sskyGI8TROzA78aF5F8i
         tm20fRH6/T7tWPpcQ0ke+8XJbxSpRErctw+i6ZE+8AiKx56HvG2mjbD57M21fNroEk0S
         3T0VPKSU50s3f24Y90m6UNtsizDC9KxWOPGpte49umICO9J3zznct57eZBeweXWXKrn9
         /FwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JkkVm9Yx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44667159948si45279181cf.455.2024.07.01.05.29.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2024 05:29:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JkkVm9Yx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sOG9g-0006eF-Lt; Mon, 01 Jul 2024 08:29:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sOG9f-0006dr-Na
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 08:29:11 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sOG9b-0004y0-IV
 for qemu-arm@nongnu.org; Mon, 01 Jul 2024 08:29:10 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5854ac8168fso205990a12.2
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2024 05:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719836946; x=1720441746; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MzDh3WELYAqnPjOgFol2sHjG+aIvVmLDwXGfVlwOuAI=;
 b=JkkVm9YxO0ppwvwAQrki3s6u0v6yZJyVqS4mRMFEShBp9TRjmqgS2vdAU46L+ks0AE
 QMDtRrotolEb4OO3E/AGK+30fKflxlkyYhRKdfXB1SVQ/5JtDg0+T01AIST8bnBGv/6N
 9qMJ4QD9P95hbFGthEkWpIR48gVABrlRhNvFdw0PzmmrO0qap/5+QFXMtjT0XpoMSrl6
 68EeSaFSDK+K1/J79doPKZ/vaPKJMdgQwbuDdlfSuxKgTT6qj/htEh2NwjjlwRyb7roZ
 6952lijMCofmPOEI19/nWRLVQ7tuj+TjvzX9nZXq8D8rI3lAjusHmjwvPn6uRVkPMLt1
 mOJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719836946; x=1720441746;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MzDh3WELYAqnPjOgFol2sHjG+aIvVmLDwXGfVlwOuAI=;
 b=vvXC/K+z5b14G2Cb6AOm6LAp878+Z4Met5HpbyVrXfTt4nCj4RwVzihPH8b4CdjbtC
 trT97CmXhIG4W08w7qckPzQ0QMCtHbEh/x5SoSDHXHztbc3YDCIq9wJaCRR2bI4oRqlC
 u8fituCD6E6rSpdiTnspbtQZwspLDLr5GP0YOmML5kOfm/uKRI4DIKt9Zz02H0GcrjG+
 ubZode27VF3fo+xdaEnsI2QrllDEfJeRsA1Ici6inoeuLBDPZF5Ek/3ifugiAzyyipWS
 7x/Z1GKP+dFUG4PHHkz3CaJTzap3s3K1xA9iB30YXno1qc5rgul/IXJoCKWiXtYIn/X8
 oVJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcetYUtpFuP5FCIuSPjujyfghiSKA++okFQ6rEVpGqJpll5aB47yZphvlSvmkwqahlQhUXe1QdoUyC7n9pRLUVasDz
X-Gm-Message-State: AOJu0YxJXd+kim/GDthG0BQraV/GBbrT6fPTfFJIL7CWMPtCdDCfn0eD
 t4GGL1jHk5rEvFjdjffEhFXd5DDZTje70LoQJ7eFzoYGKFaIQdzfF7pe8HlzwRYInJBEya5GDRh
 g33rjXXtN+/Wa3WyIucK0TDspQABLN+fcdXvOoA==
X-Received: by 2002:aa7:cd78:0:b0:57d:10d2:23ef with SMTP id
 4fb4d7f45d1cf-587a0fdc8c9mr2855001a12.42.1719836945796; Mon, 01 Jul 2024
 05:29:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240630165947.2975457-1-zheyuma97@gmail.com>
In-Reply-To: <20240630165947.2975457-1-zheyuma97@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2024 13:28:54 +0100
Message-ID: <CAFEAcA8Osq0g2=0LriqA4P6V6TYK5dQTVumxakBRYkJjMyB9Vw@mail.gmail.com>
Subject: Re: [PATCH] hw/char/pl011: ensure UARTIBRD register is 16-bit
To: Zheyu Ma <zheyuma97@gmail.com>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: htKKLQ9KGBmM

On Sun, 30 Jun 2024 at 18:00, Zheyu Ma <zheyuma97@gmail.com> wrote:
>
> The PL011 TRM says that "The 16-bit integer is written to the Integer Baud Rate
> Register, UARTIBRD". Updated the handling of the UARTIBRD register to ensure
> only 16-bit values are written to it.

Thanks for this patch.

I think we could improve the patch commit message:
Have the subject state the problem we're fixing rather than
the solution:
 hw/char/pl011: Avoid division-by-zero in pl011_get_baudrate()

and then have the commit message say why this happens
and why we make the change we do:

 In pl011_get_baudrate(), when we calculate the baudrate
 we can accidentally divide by zero. This happens because
 although (as the specification requires) we treat UARTIBRD = 0
 as invalid, we aren't correctly limiting UARTIBRD and UARTFBRD
 values to the 16-bit and 5-bit ranges the hardware allows,
 and so some non-zero values of UARTIBRD can result in
 a zero divisor.

 Enforce the correct register field widths on guest writes
 and on inbound migration to avoid the division by zero.

(I mention here a few things which I'm about to comment on below.)

> ASAN log:
> ==2973125==ERROR: AddressSanitizer: FPE on unknown address 0x55f72629b348 (pc 0x55f72629b348 bp 0x7fffa24d0e00 sp 0x7fffa24d0d60 T0)
>     #0 0x55f72629b348 in pl011_get_baudrate hw/char/pl011.c:255:17
>     #1 0x55f726298d94 in pl011_trace_baudrate_change hw/char/pl011.c:260:33
>     #2 0x55f726296fc8 in pl011_write hw/char/pl011.c:378:9
>
> Reproducer:
> cat << EOF | qemu-system-aarch64 -display \
> none -machine accel=qtest, -m 512M -machine realview-pb-a8 -qtest stdio
> writeq 0x1000b024 0xf8000000
> EOF
>
> Signed-off-by: Zheyu Ma <zheyuma97@gmail.com>
> ---
>  hw/char/pl011.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 8753b84a84..f962786e2a 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -374,7 +374,7 @@ static void pl011_write(void *opaque, hwaddr offset,
>          s->ilpr = value;
>          break;
>      case 9: /* UARTIBRD */
> -        s->ibrd = value;
> +        s->ibrd = value & 0xFFFF;

This is necessary but not sufficient:
 * we also need to mask the write to s->fbrd (which is 6 bits);
   otherwise you can arrange a combination of s->ibrd
   and s->fbrd such that the addition in the divisor
   exactly overflows to 0
 * we should mask these also in pl011_post_load(), to prevent
   the division-by-zero in the "malicious inbound migration
   state" case.

Also, this source file (like most in QEMU) uses lower case
in hex numbers, i.e. 0xffff .

>          pl011_trace_baudrate_change(s);
>          break;
>      case 10: /* UARTFBRD */
> --
> 2.34.1

thanks
-- PMM
