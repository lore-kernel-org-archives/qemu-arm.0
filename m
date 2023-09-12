Received: by 2002:a17:906:9502:b0:9a1:fa4e:495e with SMTP id u2csp2161570ejx;
        Tue, 12 Sep 2023 09:24:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGt1DAFnnfUexVbhSdNAXc6TSXssD7AgIx3fxezLYeYcOJnuliYQ5nPXVsw2XP6HhhCRRO3
X-Received: by 2002:a0c:ab86:0:b0:64f:82d2:26fe with SMTP id j6-20020a0cab86000000b0064f82d226femr12283757qvb.39.1694535850733;
        Tue, 12 Sep 2023 09:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694535850; cv=none;
        d=google.com; s=arc-20160816;
        b=EPMmFAEL/gfDFdplF2QTnZiMYMAeuRDLF9xMcn7DOUuDyEG8sbUGVpg6QRWQUfehRz
         22Vcn2mgc8tXGwggtTn2VlqTTmRk6OycAoVorwLCiOLgIIzlVxMzv0B60QjApMF23x1v
         6ITleR2SxadX1zIe2iJOO5IfPt4yfRzPgSwgaaLXzUr2w3B44c49XQa2Gapy2+BUy63i
         Mgqs0cteaEnG/ZuwI1S3MBm4JwX6vWxgxnlGdRsuY2vpKD/SFKLhGyxSlKv6buv+y1Ai
         E0ZUjtn8Wo6s611EuCIBntbNznQHhNs7cix35vsaXdOXDtSFYH4ec1IcOLe0/S2fQMbP
         Lnfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zMayzYKzU97jiOAAncdxm8PQcmBi6tmYeUc4gSGN6b0=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=FmZXUYyly1n98Y6OjHSKse1/1+Ze5smR7aU3KeqdErsojNChXSZtYg0bZsoh9fMYtZ
         ZFDsmCjrgXgsn92V4nfmMyeYI9bHiukjSOlPkZyh7lDnCVEduSzcBgQ7Ull5FwSL7Eez
         3Yh6TAgFV30vGETRjoRBe7n7X2kDkHkTry/wDNHoLlpA3sLqQyQrpU3lLYcMWURa7cXH
         OUtjvM1kEVYzgQq2Krn+MrPIr8uecuoAPRKzYveIh44sfmJgIHZ74V1pcAB39KwNspxY
         EW+G9UZ8p6r401iQoKmUB1aNWVtH9hVilNZUsPBd6j/iSPCozCrwFVijsTXnoL+ZFhE9
         PY8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LFTY9qW7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2-20020a0cf482000000b0063f8ba6c77bsi2743792qvm.238.2023.09.12.09.24.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Sep 2023 09:24:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LFTY9qW7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qg6BF-0003et-5o; Tue, 12 Sep 2023 12:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qg6BC-0003eb-Fr
 for qemu-arm@nongnu.org; Tue, 12 Sep 2023 12:23:58 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qg6BA-0004EH-3E
 for qemu-arm@nongnu.org; Tue, 12 Sep 2023 12:23:58 -0400
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9a648f9d8e3so744903466b.1
 for <qemu-arm@nongnu.org>; Tue, 12 Sep 2023 09:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694535834; x=1695140634; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zMayzYKzU97jiOAAncdxm8PQcmBi6tmYeUc4gSGN6b0=;
 b=LFTY9qW7GNbY9n2Hm+arL7VYVsDGYhlfDtrNvAt1uF2e42sa3cVmUGsuv0u+HL1wyc
 6YzppcNn5zHW6n89l5IjZbtX0Y+ommNPFZLQN9RGYP42q/WriDa5unFhCAzyk+RovIXA
 bHCh8mdH51dlIe/UdQKsU5B1sYZTxow2uWESInOa0kPj81FwNMnR7jI57fRF1we/wweR
 vSwzQU03pscTMkKMRFTf58cfMqVs6swKq9utcURS5Gpsrjpo1UGz8HAcK3rj1DCgWV3r
 BmyXLq/d/fTvPPW1WJX1TQKHl0oFEib7vQwrmQn5nSLUmb8VMXC972VMehd8WUMSFuGj
 t+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694535834; x=1695140634;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zMayzYKzU97jiOAAncdxm8PQcmBi6tmYeUc4gSGN6b0=;
 b=nYDV/YjBXDvPttAD8wxsOLy7y2gR0AwhVE9f/YlzprucGSRJ628VyzgsLxMjgOrtCx
 BciPjcGpINS029XXMjAsruPD/uGUdp731Sx0KVlvaiU3TefJD24i5t0JW9XE8NRcsuC1
 p71IQJxSRtVo5k+xoQ04ckkvtQfduYd5oNIk3+BEkl0DWM7mHsjC4SqrfCsCp96TYGQ4
 +PYvQvxKR6/tWDL5t/+y+mnElD0XJNv3icIS9yTjrLxr30pqXVckiQaC47F0/lZwQx40
 M2RnxEexdLYmeNWyFG3JrF/+xjJaoV+06GZd5QV5cpOQ62p2cpvZfXKvIG8A8qfhuDTN
 JzsA==
X-Gm-Message-State: AOJu0YwwaQSL7imXObKj4fZROULXVegrPpurae6h2ZTB0dRrXHl74p9Z
 R+mula4toFzabLw8LgW+e2NQwnWcjjwDUhmqiFvdwQ==
X-Received: by 2002:aa7:c6d0:0:b0:525:5a65:6dfa with SMTP id
 b16-20020aa7c6d0000000b005255a656dfamr101661eds.14.1694535834238; Tue, 12 Sep
 2023 09:23:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230816142516.469743-1-richard.henderson@linaro.org>
 <20230816142516.469743-4-richard.henderson@linaro.org>
In-Reply-To: <20230816142516.469743-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Sep 2023 17:23:42 +0100
Message-ID: <CAFEAcA9_St7e4G=BC2k_f8oWKphiD+3P6fEOKzW=vBGSijiKTA@mail.gmail.com>
Subject: Re: [PATCH 3/4] tcg/aarch64: Emit BTI insns at jump landing pads
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
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
X-TUID: 4JeOR4B1X3ff

On Wed, 16 Aug 2023 at 15:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The prologue is entered via "call"; the epilogue, each tb,
> and each goto_tb continuation point are all reached via "jump".
>
> As tcg_out_goto_long is only used by tcg_out_exit_tb, merge
> the two functions.  Change the indirect register used to
> TCG_REG_TMP1, aka X16, so that the BTI condition created
> is "jump" instead of "jump or call".

TCG_REG_TMP1 is X17, not X16...

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

>  static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
>  {
> +    const tcg_insn_unit *target;
> +    ptrdiff_t offset;
> +
>      /* Reuse the zeroing that exists for goto_ptr.  */
>      if (a0 == 0) {
> -        tcg_out_goto_long(s, tcg_code_gen_epilogue);
> +        target = tcg_code_gen_epilogue;
>      } else {
>          tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_X0, a0);
> -        tcg_out_goto_long(s, tb_ret_addr);
> +        target = tb_ret_addr;
> +    }
> +
> +    offset = tcg_pcrel_diff(s, target) >> 2;
> +    if (offset == sextract64(offset, 0, 26)) {
> +        tcg_out_insn(s, 3206, B, offset);
> +    } else {
> +        tcg_out_movi(s, TCG_TYPE_I64, TCG_REG_TMP1, (intptr_t)target);
> +        tcg_out_insn(s, 3207, BR, TCG_REG_TMP1);

Since it's now important that the tempreg we have here is
one of X16/X17 in order to get the right BTI behaviour,
I think a build-time assert of this would be helpful.
That will catch the possibility that we forget about this
and decide to rearrange which registers we use as
tempregs later.

>      }
>  }
>
> @@ -1970,6 +1984,7 @@ static void tcg_out_goto_tb(TCGContext *s, int which)
>      tcg_out32(s, I3206_B);
>      tcg_out_insn(s, 3207, BR, TCG_REG_TMP0);
>      set_jmp_reset_offset(s, which);
> +    tcg_out_bti(s, BTI_J);
>  }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

"Did we miss anywhere that should have had a BTI insn"
is a bit tricky to review, but I assume you've done enough
testing on a BTI-enabled host to catch that.

thanks
-- PMM
