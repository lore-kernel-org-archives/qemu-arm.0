Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp418232ejq;
        Fri, 5 May 2023 06:28:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4GlwG7Ll4ldMpVTevN5tppJ+L0AIbg1PatekX0WrDqJ8KHnRyUrp85illPN0JLPz6SnYxA
X-Received: by 2002:a05:6214:412:b0:5cc:277c:b5e with SMTP id z18-20020a056214041200b005cc277c0b5emr2404339qvx.33.1683293332225;
        Fri, 05 May 2023 06:28:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683293332; cv=none;
        d=google.com; s=arc-20160816;
        b=qDSkszF4/3CWauhpD/EGtv4SA0LzpcIxdsFtrglNW5Guk/tCUxS12i1LNp/njHbkpt
         JTGJvjrP9pWB3jrLT8ZEg9mycnr4MHwPru81fzW9DQJtprWs6QYmn/LstlVVzfBh5i6h
         gvwoLKcXA4f2mVLNan5pNaFxoRDzBV/tweGGelCCssByylsYVrzKGvLRb3fF9grO3bJs
         CQExri+ntxq2et2bjDG3GOvfGS5ABTNxesbIq8+McHBEZZchjBIjidr/xk5vtwoq8yRt
         R4uGKIXvnIcdG/YjHGtPxIHgFlbXnhS0hym8RbJ7a5ZdipB7VYRNbqB4vJMRdKteGLJB
         Yeew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=G1dhCNyDbz/C/k2Zw97YFzuMEVZFBNEZLBtUVP0klfs=;
        b=PHK5QX+xACsqMTlHeU6AfUrpXw1Ug3y2QYsHPPATqEnGi1Xzybv58Hirr2jqZtkbO0
         cD/N/uEpzJcuPl51lpKvSsnYpexS8Zku8mRhFvroJPgAIp5md6h2O9GYLnF6zD9fRbCI
         +JZtldkqDt12KlY3i5Hooft5GOjfwaXxicnLAqmjWcQ5URPrXPf7rQTkA3zxSZRx8KDK
         V0/RN/7tWc58IMfB0mYPikP+tJda6rDNKKgmZG4dhFHYnTAp3MY0SJi2Elp3WyFT0sX8
         TgeAbeq8yilSSiB68mdDDW91iZMXXBYUlP6fepfl4WYndUIDaaBiSnb0Hjb9MSWKalm4
         sTYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iTaNlcCZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020a05621419cb00b005ef8004e0absi599150qvc.556.2023.05.05.06.28.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 06:28:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iTaNlcCZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puvTv-0000cL-6b; Fri, 05 May 2023 09:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvTs-0000Zw-QH
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:28:16 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvTp-0001Sm-PP
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:28:16 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-50bd37ca954so27131624a12.0
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 06:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683293288; x=1685885288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=G1dhCNyDbz/C/k2Zw97YFzuMEVZFBNEZLBtUVP0klfs=;
 b=iTaNlcCZmH66puyNQtP7ho9mqjb5qc0/l+qmppyEuY/Lf35YGwMHFubNi/mZAJOFlt
 OHV9wmux/Oawc6FvxNVILNGN/ScOlqE9fi+xv/11/v0IT4afb23icq3xLantJERuaqI4
 CXVpAzuT80A7URBobIwreaPrvFiQQz0hoTmwTaFbfhsgPS9UdmUsQbR2SxMzWi644w/+
 vEiEXJCmXXIiJhcaPm3R8f+o6l+//MOyZbiUggieLfMsFNr7BXF7Dk6L/8iuWRqgEW0x
 iulIvjrRWw5nLhAaVhT598tEQbE+DHol+YqO+uYjgXPT9ZOS2vEItMJUji2bom9TOLuV
 eKCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683293288; x=1685885288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G1dhCNyDbz/C/k2Zw97YFzuMEVZFBNEZLBtUVP0klfs=;
 b=Nzov7/B4eVqQGy9yW8gki0Ds+C746iawouSjlf9WARORlHibUiAnmEvDI170bWBsTc
 XDrcR3pcFfAor6+j2GxrhjEyGNFnsW3S+fuMt5WA6BwwVKe9Q0wZXUbFfg27xaVE96xi
 uklc11cUPn6t6+v9LRUEQFvZVSXnHbjkK8kvrKl4f2rQ5Ka77Z/KGAKMMZP1Eac/LL9e
 u5Jhn87XzEwxcYewZv5fAR7aSGGqzhdDjIYKf1RckQjHeQtOYg/VDtgNX3PKSwQcih7M
 nqvz8UAlTQBe+/BYccY3CXgzHDw4LHZcgC2QAoFy1QRrNqPZJhb3xJcmwpQ+vwOyXm6M
 N5Kw==
X-Gm-Message-State: AC+VfDxw8y+2Q3OJGuCY0fYtohpAI0gJJfGJnsx6lBSOwarYdxFk1lzy
 J+ZeBT29MX9SYPgGXeTUG4n2DisT5YxK9/A0TY//6g==
X-Received: by 2002:a05:6402:2794:b0:508:3c23:ae95 with SMTP id
 b20-20020a056402279400b005083c23ae95mr2135595ede.3.1683293288053; Fri, 05 May
 2023 06:28:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-53-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-53-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:27:57 +0100
Message-ID: <CAFEAcA8XQ2_GFyBCqW4N7p32dvkWe6B21bpHhOf48xHyc_petw@mail.gmail.com>
Subject: Re: [PATCH v4 52/57] tcg/i386: Honor 64-bit atomicity in 32-bit mode
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 0UQttlkhNVll

On Wed, 3 May 2023 at 08:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use the fpu to perform 64-bit loads and stores.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -2091,7 +2095,20 @@ static void tcg_out_qemu_ld_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
>              datalo = datahi;
>              datahi = t;
>          }
> -        if (h.base == datalo || h.index == datalo) {
> +        if (h.atom == MO_64) {
> +            /*
> +             * Atomicity requires that we use use a single 8-byte load.
> +             * For simplicity and code size, always use the FPU for this.
> +             * Similar insns using SSE/AVX are merely larger.

I'm surprised there's no performance penalty for throwing old-school
FPU insns into what is presumably otherwise code that's only
using modern SSE.

> +             * Load from memory in one go, then store back to the stack,
> +             * from whence we can load into the correct integer regs.
> +             */
> +            tcg_out_modrm_sib_offset(s, OPC_ESCDF + h.seg, ESCDF_FILD_m64,
> +                                     h.base, h.index, 0, h.ofs);
> +            tcg_out_modrm_offset(s, OPC_ESCDF, ESCDF_FISTP_m64, TCG_REG_ESP, 0);
> +            tcg_out_modrm_offset(s, movop, datalo, TCG_REG_ESP, 0);
> +            tcg_out_modrm_offset(s, movop, datahi, TCG_REG_ESP, 4);
> +        } else if (h.base == datalo || h.index == datalo) {
>              tcg_out_modrm_sib_offset(s, OPC_LEA, datahi,
>                                       h.base, h.index, 0, h.ofs);
>              tcg_out_modrm_offset(s, movop + h.seg, datalo, datahi, 0);

I assume the caller has arranged that the top of the stack
is trashable at this point?

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM
