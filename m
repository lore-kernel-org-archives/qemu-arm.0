Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4365961wrs;
        Mon, 26 Aug 2019 13:38:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzF7LK0QkujPaHJdgJm6gykVkZk+/7xv88T/cy6skoOwDIU/BXsRkMpBeQgq8SbbGqD68TS
X-Received: by 2002:ac8:7b8d:: with SMTP id p13mr18986542qtu.316.1566851920543;
        Mon, 26 Aug 2019 13:38:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566851920; cv=none;
        d=google.com; s=arc-20160816;
        b=oglgI59/dogxXrLvtSxoPkxzNBcQ7ka1lTdz0P8RFYKSfyUMFn7HvZiWiDN/W1Zs+Z
         Ducspm2cCLu9XKRuQkf5cKKd03seeqWg9tbVyH2rRl7ZsOssBdHJgNneELl/Q5vPont/
         u2bBcL3s5pDEciBNR9ZM7mQpJX6bqpYnhzQcExqfncoyC0dhGiYMfVXHcKEMK9lMEpRf
         vXvN7AXom/rgfKImbmPPXp/GyI9neJ2BxGkL5YWwxpAsnTBybPD29QyfB2zI2Yt6PZMq
         htfBGJSPMzHCbZ3bhpCIL4lmz0jEt5WnBPA43kptfcrNIP9Yqx/zpzh/JJ3BjWZ2QJ/f
         0fbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YOpw9/8CF7yxsaYpT9hZb6dDlRxBOI8qBaE+1q63LEg=;
        b=M7ONpTTDeJl6Ph3BOXcMMFYJvNmX3CVyKnlA+suLxKpj8CbzaZcReUBAMq12RSydbl
         IzBQCoT9CixhHd2xOe8Ba/r4u6/6ZM/RA/+nxLT8tNxotQR0tZgw21mZ5SPF3FtPXdAX
         RVN3X/WdZJCN3rjXXFjsk18+TTDHa7geM3Mj51Dae3OgkiTFpWZyFGRY45EpFJFW+met
         /UGn11DXOCde0YYR960u0hlAJ6hZHHzyuGAVupw+o1f3/Uo+EmdSE3GI1TPQM5rDNbFa
         J5+vQt6ZcxYwXZB3xZFLQylm70a0gQorY+DLzL6Z/9T9rpAEIprilP/2JHSpOT5WYaON
         wTCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dIzVWh1s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v42si8746839qvf.203.2019.08.26.13.38.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Aug 2019 13:38:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dIzVWh1s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2Ll9-0001NP-W6
	for alex.bennee@linaro.org; Mon, 26 Aug 2019 16:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55314)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2Lky-0001Ki-3E
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 16:38:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2Lkw-000405-Oi
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 16:38:27 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:33524)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2Lkw-0003ze-IK
 for qemu-arm@nongnu.org; Mon, 26 Aug 2019 16:38:26 -0400
Received: by mail-oi1-x242.google.com with SMTP id l2so13212959oil.0
 for <qemu-arm@nongnu.org>; Mon, 26 Aug 2019 13:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YOpw9/8CF7yxsaYpT9hZb6dDlRxBOI8qBaE+1q63LEg=;
 b=dIzVWh1s36l9rhUuB535e7WO6clJEzS09mxxeTCz+auLFW0KS6H1TFq8NLPv9S5FX/
 1+g7DZihacfm1g+c2A63yWajEBviNGXUQSB8k7envnJzE4dMMHCug1V6Jp+xM2VM9vdw
 k4QdjH7HmjoJ+QZkscoj+nx9l+q8M9zBQILZl2Nt2TXuX2VqPRwAEIp8heMvB94EFWkp
 d22+/JKHxvhbEH2mvTwpT47iItSCQnjWRQj+J+SCtad/EFsnU1fUlvfZOA2W3GYO5uJZ
 LnXF1GVlgunWU3Lvgu5xi3+9qpPpc5X16JgH1jmsuajDfiMyiSnIEodagbXn+LthD5gZ
 l/mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YOpw9/8CF7yxsaYpT9hZb6dDlRxBOI8qBaE+1q63LEg=;
 b=QiJkCyyarfeIJDsNCAg1e5WZVH0sZ856DTvTBXp1WWcrh9lzZINgAFOa3CZ9L2SsTy
 rJ8ZFzewPfy98CO3GJKEnKfEiHy81f1mTibwvCqj9f4jPbduo+4q5b+7ArfJoLmwcbGc
 2UmOm84XZSwH5IVIrpg5TK7qxWLt/9EEb90CnPtLZGkHKWEBWpXE0uGY1+c4oyHQhX3x
 eLBe1N5ZAGrmqQqFPmx/i3ASy+4AATe/Qcix5xPV7h+aRBSO4Z4YTK/kx7dSLL3KPVIk
 UVMIXoLlE8nHYbACbEBaRpWoGVUBv9Z3GsOqeMx7VD5XLx2bXNrMYIK0OrgEaXHfkszc
 uCmA==
X-Gm-Message-State: APjAAAXCQnieD70HXvl+3NP9nEndlwDzRqC8s+DJmOqgG2Ng7MA+MMgB
 6EUT5tyRcm5348J4cd3kqA338X4y11OWy8tYndiGAA==
X-Received: by 2002:aca:4b86:: with SMTP id
 y128mr13848848oia.163.1566851905494; 
 Mon, 26 Aug 2019 13:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-63-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-63-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 26 Aug 2019 21:38:14 +0100
Message-ID: <CAFEAcA-iBjMbeqC92A69Xn_Y0qnOu93+VhQwqw+hOeBYRXrBjw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v2 62/68] target/arm: Convert T16,
 Miscellaneous 16-bit instructions
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C+uqpFod+Xwp

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

> diff --git a/target/arm/t16.decode b/target/arm/t16.decode
> index 98d60952a1..4ecbabd364 100644
> --- a/target/arm/t16.decode
> +++ b/target/arm/t16.decode
> @@ -210,20 +210,33 @@ REVSH           1011 1010 11 ... ...            @rdm
>
>  # Hints
>
> +%it_cond        5:3 !function=times_2
> +
>  {
> -  YIELD         1011 1111 0001 0000
> -  WFE           1011 1111 0010 0000
> -  WFI           1011 1111 0011 0000
> +  {
> +    YIELD       1011 1111 0001 0000
> +    WFE         1011 1111 0010 0000
> +    WFI         1011 1111 0011 0000
>
> -  # TODO: Implement SEV, SEVL; may help SMP performance.
> -  # SEV         1011 1111 0100 0000
> -  # SEVL        1011 1111 0101 0000
> +    # TODO: Implement SEV, SEVL; may help SMP performance.
> +    # SEV       1011 1111 0100 0000
> +    # SEVL      1011 1111 0101 0000
>
> -  # The canonical nop has the second nibble as 0000, but the whole of the
> -  # rest of the space is a reserved hint, behaves as nop.
> -  NOP           1011 1111 ---- 0000
> +    # The canonical nop has the second nibble as 0000, but the whole of the
> +    # rest of the space is a reserved hint, behaves as nop.
> +    NOP         1011 1111 ---- 0000
> +  }
> +  IT            1011 1111 ... imm:5             &ci cond=%it_cond

This is correct (same behaviour as the old decoder, but
it looks a bit odd here because it's not the same as
the fields defined by the architecture (in particular the
'cond' field is not the same set of bits as the 'firstcond'
field). We could maybe comment it:

  # Bits 7:0 in IT are architecturally simply the
  # new PSTATE.IT bits (despite the instruction description
  # splitting them into 'firstcond' and 'mask' fields).
  # In QEMU during translation we track the IT bits using
  # the DisasContext fields condexec_cond and condexec_mask,
  # so here we massage the bits from the insn into the form
  # that that optimization requires.

(Or equivalently we could just pass a single 8 bit immediate
to the trans_IT function and split it out there, I dunno.)

>  }
>
> +# Miscellaneous 16-bit instructions
> +
> +%imm6_9_3       9:1 3:5 !function=times_2

Would it be worth adding support to the decodetree script
for letting you specify fixed bits in this kind of field-decode,
so we could write '9:1 3:5 0' rather than having to specify
a multiply-by-2 function to put the 0 bit in ? Or is it
not likely to be common enough to be worth bothering with?
(Not something for this series, anyway.)

> +
> +HLT             1011 1010 10 imm:6              &i
> +BKPT            1011 1110 imm:8                 &i
> +CBZ             1011 nz:1 0.1 ..... rn:3        imm=%imm6_9_3
> +
>  # Push and Pop
>
>  %push_list      0:9 !function=t16_push_list
> --

In any case
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
