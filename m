Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp4994022wrs;
        Tue, 27 Aug 2019 02:34:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwT0voex3B5RX5BpJ+U96E79SELp4FcktM4M4SOlR/gpF76DazdDv8DMvRQ6tbZwDTMqEKT
X-Received: by 2002:aa7:c4ce:: with SMTP id p14mr24035026edr.238.1566898462218;
        Tue, 27 Aug 2019 02:34:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566898462; cv=none;
        d=google.com; s=arc-20160816;
        b=LbCRhZfjD8Fg2UEmuvnTpzXYmyLWM86E5RXtdqvQz4vbnvS0et3K4hWrWWcX+yErnN
         hXLwN89QBTPv2t704QtspKQnoVTbcGKi7fWL5ZPyG70C1l6Q/qQBe6nFvxnzMbTG7cgW
         V0HuILp1xmWW28OfHgQ3Lg7ntLdgDRZm+Xf4o0L6gM10/tTaPSWp37khTEgheiIskVa9
         +dpZARs4+z0sq4EPMpwucN8RYrEiXDK1ozTn15BaPeaGr+zTr8LU1/Y3qHUpg0z5RUyd
         65naodSxBaRh8aWW/N1uHPFw4m5WeIPImZHrJMbo3jks3c+tTWOYGlCA+h2kLFRMZ7dt
         +lPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T+L65C5Rg8qoq1UWu3aNUCFw/66qwLveKp8BIbMMYnY=;
        b=kufQrlq1UK8/8ScbIlkeNtYm0ciCezzG6araJx+1yE/MXUpDb0ZpYFSpdPaqi1kXei
         Z07Pd+MIBVeBGLFqwBZ/x7HMiQyzHuJth6NKqxvLDrOzsbVsPpLeaFS/4S2GQ8ylFIAs
         cgkIanUSpaoR2JrN2FhdHz44nYamBWz1yKg3Ff4YZaNUNQlg1jG3VKQmaqteD7gbBpFM
         4ydF/L5y2bigeeQ2FBBWaSa/YC2Jg+Y5URPxlzv3WxOIujAFpwgxqRok4uYCBc6I3wQO
         cwKef4j6SSjrEMJDjzOiU5KJHIMJXkY0fZD0O8DQnec1rWs6gWShGpcRTVt/QHMeUicJ
         yxgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R4cs9lYU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a52si8401555edc.277.2019.08.27.02.34.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Aug 2019 02:34:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=R4cs9lYU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i2Xrp-0006kG-80
	for alex.bennee@linaro.org; Tue, 27 Aug 2019 05:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49992)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i2Xrh-0006jh-Nz
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:34:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i2Xrg-00031G-J3
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:34:13 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:46516)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i2Xrg-00030g-Cd
 for qemu-arm@nongnu.org; Tue, 27 Aug 2019 05:34:12 -0400
Received: by mail-oi1-x244.google.com with SMTP id t24so14390417oij.13
 for <qemu-arm@nongnu.org>; Tue, 27 Aug 2019 02:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T+L65C5Rg8qoq1UWu3aNUCFw/66qwLveKp8BIbMMYnY=;
 b=R4cs9lYUzR7vb+cntJ1g5/uidixEyn83PxA0QfSA74fJn6ZyFGnCJlzlKNouMBrYc6
 iqbCMXCXeXpwFiMORnmC3auO4PaZojc7w+NJitAvRYZo/fXczpRpeqsf0xMNqO1nRle0
 98EZWcR9DYAWK3+vKkZSSPLLBSenoskiwOtZKpsM2svCxdjdHbnk+URfX+j6OYvI/+VO
 bwyy0ZgWsrmc2zRAfQnruCMu4Hzy8Pgxhi8N+exhDV6eh4xEBQe+CQGtSbpw3DF9WJ5Z
 bD7Xd6gLQYUyaKekjMIPb4sPaUodsUorHcWUdlZV/O7mEUwDhsU58FSY0MxNfwC3xqOo
 PL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T+L65C5Rg8qoq1UWu3aNUCFw/66qwLveKp8BIbMMYnY=;
 b=eV7owdDZ7Ls6CJKxkjIkwLTnno3d/RE5ZKbojemAYxdbDAk7EJfGjiYaj2mqQXivj9
 6xi7ie778/CNHdKp8ksM6z0vJrh2lVTJuSp0m/hPqtBauJmhwyX6+wxbNAv349Ib9RyF
 MKHPtPG0d7YaWsXN5HVarK9pzKYyLV5ASgESvzpsI9sRALedL3VEQHG45vMWJcUGw+G4
 ZFJbfaGKy+bybEOGfK6o89HnMNYqbb66UqYq77ZSW55iygGsxLcFSjCa5WWcTOJL2TNQ
 d/wf7dK6sL7uZvJSC/jvUCmfCgN5mso087FodppOp1n21OWcpTWnpuwy+XBqibc1B2AN
 T4Pg==
X-Gm-Message-State: APjAAAW4CurVuv3h5wOhkhOxItUCqPm9O3qirLYhhBGDPUEMoSJtbqJf
 cPKYpUpbiTVkfY6A4NUTBKSNVrSfnk9uweAsU+ACvg==
X-Received: by 2002:aca:50cb:: with SMTP id e194mr14342024oib.48.1566898451427; 
 Tue, 27 Aug 2019 02:34:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-67-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-67-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Aug 2019 10:34:00 +0100
Message-ID: <CAFEAcA9AbEzR97-2gvpPAbGrGHx_AxGgVhh4-BDufTQUX0gM1w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH v2 66/68] target/arm: Convert T16,
 long branches
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
X-TUID: gELolVCgrJjK

On Mon, 19 Aug 2019 at 22:39, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 89 +++++++++++++++++++-----------------------
>  target/arm/t16.decode  |  3 ++
>  2 files changed, 43 insertions(+), 49 deletions(-)

> +static bool trans_BLX_suffix(DisasContext *s, arg_BLX_suffix *a)
> +{
> +    TCGv_i32 tmp;
> +
> +    assert(!arm_dc_feature(s, ARM_FEATURE_THUMB2));
> +    if (!ENABLE_ARCH_5) {
> +        return false;
> +    }
> +    tmp = tcg_temp_new_i32();
> +    tcg_gen_addi_i32(tmp, cpu_R[14], a->imm << 1);
> +    tcg_gen_andi_i32(tmp, tmp, -4);

Minor nit, but can we use 0xfffffffc like the old code did,
to avoid the reader having to do 2s-complement arithmetic
in their head to figure out that we're clearing the low 2 bits?

> +    tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | 1);
> +    gen_bx(s, tmp);
> +    return true;
> +}

> diff --git a/target/arm/t16.decode b/target/arm/t16.decode
> index 35a5b03118..5ee8457efb 100644
> --- a/target/arm/t16.decode
> +++ b/target/arm/t16.decode
> @@ -274,3 +274,6 @@ LDM_t16         1011 110 ......... \
>  %imm11_0x2      0:s11 !function=times_2
>
>  B               11100 ...........               &i imm=%imm11_0x2

This would be a good place to put a comment equivalent to that
in the old decoder:

# thumb_insn_is_16bit() ensures we won't be decoding these as
# T16 instructions for a Thumb2 CPU, so these patterns must be
# a Thumb1 split BL/BLX.

> +BLX_suffix      11101 imm:11                    &i
> +BL_BLX_prefix   11110 imm:s11                   &i
> +BL_suffix       11111 imm:11                    &i

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
