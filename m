Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp936668ocb;
        Wed, 5 Oct 2022 07:30:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6aE6bLDNGY6oUI3vh0Lib5in8nSewJJRQRicx2gX0p5RNIo92V32JRHn0eC6x96FXKx+Qq
X-Received: by 2002:a05:620a:2907:b0:6ce:80fb:74ca with SMTP id m7-20020a05620a290700b006ce80fb74camr20215883qkp.171.1664980200594;
        Wed, 05 Oct 2022 07:30:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664980200; cv=none;
        d=google.com; s=arc-20160816;
        b=c+/OpQcMd19qvX7PvKBomOFCTiUcTzG6CPcWN6C7PJ5Sod6PQUGxVGk5lrv86kKB82
         gRAq2tUr8HMgLP33YZbQWysVC3h33WceCyd/15cSSIgOKy7dZm0QVrJ04mWbYoxVsAO+
         X8iVesntGwXLlFGtvZ2VxLSi/Qe7q0nzb+Ano5cu2WiLsmuNYUzQcR69birQPH/PaUP1
         17IzN2LwO/sS/38Ty67HxMtV/QtPuE6gfyQw6+Cirb3Rhi3Jb/FWXlwPOOUNbdyIx1pM
         EG/IPx9DAxzntezDStYPk9ElFhQxevpF8hpWV0g0JmF9ZMlp1GuOkOW4tpSAjlo+eISy
         3/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dtjn7CZWhhh0QYbxJQV5Gx7SHvrrb+/CR/4o20A8Zmg=;
        b=PtdU4+KC3d5BGR7jgA+YxX4iO8PrYUfu3L7rYg0ppv0ixXGd3zEWEuEXAu2CbS+e8H
         bCoT0frAU/5uwKBe4U5wOhsj7gCt8M2ylfwJSK0MsUeXP1Yy/xbSzUbaFc7L3U1lyJy5
         Z+QL3Jyc99DCrZ1KSysuobS9TXxXrEYioM3lFaEvUzhYJGPieCsCFzBxabrv22ZPhFG4
         CYtAetux7bva2VeOF0968mzZ0p4edr38TijsSA+CqHRK2UsAE0uWNFEaXhZOCD3pKqe1
         WqyTPWltzbzhVMTNP818JYf0TYj9qApLlVJ/7gzSRu81a46ETLdHrtopVOxyO1xdHZpu
         9YcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BVMJWyl6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iu2-20020ad45cc2000000b004b17a404fb9si2123582qvb.490.2022.10.05.07.30.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Oct 2022 07:30:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BVMJWyl6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1og5PM-00032B-0G
	for alex.bennee@linaro.org; Wed, 05 Oct 2022 10:30:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1og5BL-000187-Fv
 for qemu-arm@nongnu.org; Wed, 05 Oct 2022 10:16:00 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1og5BG-0006xN-QK
 for qemu-arm@nongnu.org; Wed, 05 Oct 2022 10:15:30 -0400
Received: by mail-ej1-x62c.google.com with SMTP id au23so15009167ejc.1
 for <qemu-arm@nongnu.org>; Wed, 05 Oct 2022 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dtjn7CZWhhh0QYbxJQV5Gx7SHvrrb+/CR/4o20A8Zmg=;
 b=BVMJWyl621a1WLdt71d/Nygc6W7GZzyQti3RYQ2xCP9bopNy7xwjtwEdeyiSdhlQZd
 N+xmZTKtzGHWMQyw4f1lKi0QjR2Q/jyiyIAPr+9vETz1BWHfZu6vH1fdCfYIGdtq03wu
 N7WDYHJDfphXcW+tRh0qbDexwCl0t5bHHKz7avl5tvMmYKUZDriRs7XmSJStBU6mPRp7
 nk16461+VMBESYftgItpbsTGoNNP5vBWNgL2qJP3UBAAeMVp9AkfHYD8hjEfcXCfOMut
 w1/x3AiaSV7mJx2A70mNyX6hpozJ9+e3v2RSt90Rg9g0V5yhlxFlP/KAqxuwNp8zTSqa
 Nt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dtjn7CZWhhh0QYbxJQV5Gx7SHvrrb+/CR/4o20A8Zmg=;
 b=ClbkFR3iY1cno0O/uRl7WbRRoYZ6UWHhCQN8TX9+TqICotbtn0Ai1NHOl0Hwkq1zIk
 0yvC4jwu99jblr6ehSHwdRQJuq5RpwvsOMTjet6H1OSfQyq7mI8U5vpfFhVebm0L8KZ/
 LEOZCzGm3QSJgQqzzwxuwPLDSYN32y8DYRUyI/oZ0WaBFMte1kM97kwILkPt33ElHqSW
 aGNpPA64c2VyLWMqr+2Abulevv+nAlZaWjN9Hj+3uRm+1yWOmlbNRlZI/N99sf4n9o6z
 irP13auQrzda0KslDspXuCt3xfGDpmo9iuQE3/ZrSk93av4pfyAnpyrCBD7Q+9VnL0Zp
 A00g==
X-Gm-Message-State: ACrzQf35YwqH2WEHlQZKoBAeowuWKD/SGtw1a3/MAd2TcPkKJklEyhCA
 GgoNHSwE7YKxDO40cPGjs5Ccru5PyFi29ItwujxAXQ==
X-Received: by 2002:a17:906:730d:b0:782:a4e0:bb54 with SMTP id
 di13-20020a170906730d00b00782a4e0bb54mr24537760ejc.659.1664979323225; Wed, 05
 Oct 2022 07:15:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220930220312.135327-1-richard.henderson@linaro.org>
 <20220930220312.135327-7-richard.henderson@linaro.org>
 <CAFEAcA-hH=kqGfPQ3d6wJfo-ti_UvdMAs6pZx6A79QO5Mi-Q=w@mail.gmail.com>
 <c91da352-f27a-d81d-59e9-43fabd604e8f@linaro.org>
In-Reply-To: <c91da352-f27a-d81d-59e9-43fabd604e8f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 5 Oct 2022 15:15:12 +0100
Message-ID: <CAFEAcA_zKX1RVjHfTnxHOUogVX_JxpnWOPW-yYDCuAvk7J3YEw@mail.gmail.com>
Subject: Re: [PATCH v5 6/9] target/arm: Change gen_jmp* to work on
 displacements
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: P5Ck2AEnS56s

On Tue, 4 Oct 2022 at 21:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 10/4/22 08:58, Peter Maydell wrote:
> > On Fri, 30 Sept 2022 at 23:10, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> In preparation for TARGET_TB_PCREL, reduce reliance on absolute values.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   target/arm/translate.c | 37 +++++++++++++++++++++----------------
> >>   1 file changed, 21 insertions(+), 16 deletions(-)
> >
> >> @@ -8368,7 +8372,8 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
> >>       }
> >>       tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
> >>       store_cpu_field_constant(!s->thumb, thumb);
> >> -    gen_jmp(s, (read_pc(s) & ~3) + a->imm);
> >> +    /* This difference computes a page offset so ok for TARGET_TB_PCREL. */
> >> +    gen_jmp(s, (read_pc(s) & ~3) - s->pc_curr + a->imm);
> >
> > Could we just calculate the offset of the jump target instead?
> > read_pc() returns s->pc_curr + a constant, so the s->pc_curr cancels
> > out anyway:
> >
> >    (read_pc(s) & ~3) - s->pc_curr + a->imm
> > ==
> >      (pc_curr + (s->thumb ? 4 : 8) & ~3) - pc_curr + imm
> > ==  pc_curr - pc_curr_low_bits - pc_curr + 4-or-8 + imm
> > ==  imm + 4-or-8 - low_bits_of_pc
> >
> > That's then more obviously not dependent on the absolute value
> > of the PC.
>
> Yes, this works:
>
> -    gen_jmp(s, (read_pc(s) & ~3) + a->imm);
>
> +    /* This jump is computed from an aligned PC: subtract off the low bits. */
>
> +    gen_jmp(s, jmp_diff(s, a->imm - (s->pc_curr & 3)));

Cool, that looks a lot clearer. With that change,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
