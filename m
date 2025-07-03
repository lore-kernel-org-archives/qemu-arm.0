Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp441494dyc;
        Thu, 3 Jul 2025 03:39:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVnwb9pA6Nt35pTItC3zbCAT0sJG99kYK3WCgke757QdhLQw/UFPpjO7x2cJx5TmA5lVk6JPyqH8Jr6gA==@linaro.org
X-Google-Smtp-Source: AGHT+IHjDCldwVqvYd+TDKIk4SDi01pdh7FeW9SZeApadSYhrw0EdllEpRQzLHJ3GEv2l4hT+a0L
X-Received: by 2002:a05:620a:25c7:b0:7d0:a165:60f8 with SMTP id af79cd13be357-7d5c4745290mr1048955385a.25.1751539166387;
        Thu, 03 Jul 2025 03:39:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751539166; cv=none;
        d=google.com; s=arc-20240605;
        b=B183Wr7LBMbBO1Rl+/zkH5esjlRjPgWdT4VzVMFtGD7uCgAWXV4B8Vrf3f9HRPgnXF
         gyuSka94McwaXm4fMz0Rxkaqo6papF/W9Itby3/k8BG+/3IZKziztfZ2Z7vpQLF08trW
         zGXdCVLFEkpruuK9BZcHrYdkDYToTrNhQxhKxSVYU4pjQ3Lmj67zowD4+NI7n1AgHLZV
         nnmolaqWjVwuwfcd5I10ckSScJRuwMfESXX0TfBtfoWYS5S3BKQyVEzLHQ/C1Z74A1sy
         MzS0F8/eNxT+AAEzwP7kPIyR4CJkm8lv6SfKGvWAUwCbf28u57z0Or6bgwQrX5tiYACq
         Tt4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=m7ZhX30w+SUHKxcEOBIia1xGdqedQEidjKYU/P0aAHc=;
        fh=ISHdnAf+1DwMwZZFdOcn72RHhlQ+eZcJVCQq0Kw4IHE=;
        b=eQldSl/XINJscTda+BL545kbCA2vfJr3ieo0huJcKaebmyIRLxAFbsGmFjzsO3uZK7
         +lyFst2ILZCbaIBZ85oIypbBmZZTCtxGNRCXHSfAHvOtMIYrl+MPfVepgWPXLFyncVsT
         g5n7FUnFuE34OOL26q0ndwq+cFJZlBja+gIBH7QhZauo4uAy96/mO3BH1T11l4zHrVoA
         TDXp+qPgtaQTf9lN/FAJJlomZrpCQmkt5d1kWaruNcqkSmtSRA2jnM6HNEPDPwAylE14
         20WEK3kdJElWvD9wOTBqkOhqZHGL87pTXs+8eMYUcZ6EKAQGp1Byr4c0JYTYCKN7Av4M
         jtTQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S69C80Jz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d4432975cfsi1428893585a.564.2025.07.03.03.39.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 03:39:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S69C80Jz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXHLS-0004Bm-NG; Thu, 03 Jul 2025 06:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXHLR-0004AX-NR
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:39:09 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXHLP-0002Eo-8I
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 06:39:08 -0400
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-e7d9d480e6cso4162983276.2
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 03:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751539146; x=1752143946; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=m7ZhX30w+SUHKxcEOBIia1xGdqedQEidjKYU/P0aAHc=;
 b=S69C80JzvhWZamBL7Fs9CWthIJxZSkxlUlBtcFaM6V6ZOpdQQZKESqAIk6Z5GunMbW
 tXuEIIrktBHCryqCWUrjX1RfkRfEsiPSPoDfqNND4SSrCz654kZTn7AVLBlkzMooWSGZ
 TDD+mJhyaXmevCBo7SUjni9kgIoFevM0V7YEKejyaKT5yKJNjHkiojtbrPXM7J2OlgAV
 OWJk9yeZmrvItcl2GPHLNchciIsNua0NGVYLdU6RJTiCpqBjBAMy+ZpypFD9n5Xfwg97
 4g0tklWf/VGD0fcziDyG2d5oX2qj7woXF6ldTRzVVFRSRxhYppwq6XpxhqcZDD/3Xph9
 9n8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751539146; x=1752143946;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=m7ZhX30w+SUHKxcEOBIia1xGdqedQEidjKYU/P0aAHc=;
 b=swxiWNYtqKmMQulQq/8BfEr3K3f2ZI1/pDo3mBW+YBnpFUVmyQhQepDUT+ZZmaNZ03
 naq9aYJn1nnWahtn9Eecy5MlGjDSKeZzWVlc3yh4JhGRCbNaxM6AhmOYfKnl72iXhICm
 HevMD7AJg2Va9gyUEygKt16vZZJuoXvV8ggeOEGGWAGKo+V7YgQtb0uKNsmL+j28fGPM
 SkW6d6DyMT5fmwB0ChETDE146rEZDaMJrUzHb5jc8ZmnW4YGg7K8x//sNwwQQ3SJFN5P
 shN8+yiHXdY0KXK3/geR2ohcUGiP2xXeGcf9u5lx1t/OdQ3tLNipFsjTZth6m4V8P2ws
 h+NQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG41aP4BPcTWxzdCD3rD69ga+LNnMewvXMduWYZ78SUeCeSUOTSs8EB4PRUounMJrIA+KGPj0fBQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx2Sux/+Ha8UZyk910MMXUxYjtFVKUgLgvXCPI6qJy85z/codKG
 FZ/CL1bu6oNnV/8LAGJUm7jAPYLx+nMZshUHI9aCicqc8k9czmiJf/4WFu5m6zU5A6PpZ/I2Q2X
 bAmhCR8iFSrE4ybJRq/k5qaKEo4THapkqApTdMz44uYy86fZKNHul
X-Gm-Gg: ASbGncv29Br854tdP5AnLUEv/FTjP6G00r1vuddOJcitk6Nun1nwNfDT4Fh3ByGSW7a
 LylBy2yXfDViZKOt7r13rNcuqUTnlriM3witP6UTLEOeuSzP7ytw3nJq16vMI9pptoveylmo81B
 Y/+IIXWafk6oPazVIhWrrVLteCE2rTNG7/zjIZHhcOtcaz
X-Received: by 2002:a05:690c:c09:b0:711:af14:3981 with SMTP id
 00721157ae682-7164d470778mr94959007b3.31.1751539145807; Thu, 03 Jul 2025
 03:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-63-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-63-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 11:38:54 +0100
X-Gm-Features: Ac12FXxCxzKyizBcCofBFylPh1SNA-Y29KhJca5O_hv4XKWCDbD4jcoL69RBx5s
Message-ID: <CAFEAcA8=25c3yADyE0nD7N6SmZnrTE+Km5YC9-pDZWKT962uNg@mail.gmail.com>
Subject: Re: [PATCH v3 62/97] target/arm: Split out do_whilel from
 helper_sve_whilel
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
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
X-TUID: E6V1VrT47ti3

On Wed, 2 Jul 2025 at 13:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/sve_helper.c | 28 ++++++++++++++++------------
>  1 file changed, 16 insertions(+), 12 deletions(-)
>
> diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
> index 5014fd135d..4497e9107b 100644
> --- a/target/arm/tcg/sve_helper.c
> +++ b/target/arm/tcg/sve_helper.c
> @@ -4113,26 +4113,30 @@ static uint32_t pred_count_test(uint32_t elements, uint32_t count, bool invert)
>      return flags;
>  }
>
> -uint32_t HELPER(sve_whilel)(void *vd, uint32_t count, uint32_t pred_desc)
> +static void do_whilel(uint64_t *d, uint64_t esz_mask,
> +                      uint32_t count, uint32_t oprbits)

Does the compiler generate worse code if we give the right
typed argument for d here (ArmPredicateReg *d) vs uint64_t * ?

>  {
> -    intptr_t oprsz = FIELD_EX32(pred_desc, PREDDESC, OPRSZ);
> -    intptr_t esz = FIELD_EX32(pred_desc, PREDDESC, ESZ);
> -    uint64_t esz_mask = pred_esz_masks[esz];
> -    ARMPredicateReg *d = vd;
> -    intptr_t i, oprbits = oprsz * 8;
> +    uint32_t i;
>
>      tcg_debug_assert(count <= oprbits);
>
> -    /* Begin with a zero predicate register.  */
> -    do_zero(d, oprsz);
> -
> -    /* Set all of the requested bits.  */
>      for (i = 0; i < count / 64; ++i) {
> -        d->p[i] = esz_mask;
> +        d[i] = esz_mask;
>      }
>      if (count & 63) {
> -        d->p[i] = MAKE_64BIT_MASK(0, count & 63) & esz_mask;
> +        d[i] = MAKE_64BIT_MASK(0, count & 63) & esz_mask;
>      }
> +}

Either way
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
