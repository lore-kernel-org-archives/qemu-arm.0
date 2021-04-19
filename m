Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1350745lfb;
        Mon, 19 Apr 2021 10:09:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyNVBbhVQF7HjZaVdtD29K6354FZYmxqfYw65NgRuFb1TSjuMcLTu5hbCQMF7Xh6yjVz2t2
X-Received: by 2002:a05:6e02:13d0:: with SMTP id v16mr18607623ilj.8.1618852171773;
        Mon, 19 Apr 2021 10:09:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618852171; cv=none;
        d=google.com; s=arc-20160816;
        b=dUgYi4+xFyejXTUJHpOCngbT3gPrS3G2EqT32cqiopVZlDCzrZWm8MCdxkQQgWSdER
         AtttfknP1fAhZvggz3MTUP7m4S8xFFyPxAhpEY/vEjPG8p/0adPhvWaCz0XD0Ve92ts+
         ksRAovOVbKdcNY6vbDrTLL1RML90oO5ZalXmREBwsvx9sRpImGZqtcofXnPzLR07sdjI
         UJiW4A/gbupfSulebdt/rTxutCFQpcn41iz7kzOu7+1O6lxnXqF6iNe5uFDuaj0PjeVy
         HVBmDSQT/XTPjQd2lilYwuNGjIIdHMboDZ77xIjBv1YyPEkoTQ7q8q6rVIC8C/1Tm/F2
         AvbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aVPhSohj13RY2ubCrOD/7pMisW0+KCkn1s2cajpB/nM=;
        b=ZLKVqrCZhiD2FgGbNL+C7HWFdohgmH9AYOgW60KUYctWZSV+WUWy91uT6VJm2RPcNz
         fAw3MFXWEu1/4z7moQgNyb7MUbostZZdXaj81DUrxi38Hvgjnm4KWU3dgX2VpXa1DCGC
         3Smh77DPdiHc16c8VySNIoCAPi1jHlbL6ovsjwRJRsTlvqh86Q9KGpaovWafzFTBJ0Uo
         7aw+cbxJj9d7MIE12A8ejvhN9XlC1jBZG1ZprHfXyh8DDMzJGlIbHhBo3HxQvwEvfP8g
         sPx8vfbcEqUHsMkVwz7LB6cBuJWVmpDDGPCHpvvYSwa03q8DyXlw6bcx9nL6w4Bi2+67
         vO1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vIYeRV6k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11si15371598ioq.81.2021.04.19.10.09.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Apr 2021 10:09:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vIYeRV6k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lYXOt-0001Me-2h
	for alex.bennee@linaro.org; Mon, 19 Apr 2021 13:09:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXKn-0004Hf-ST
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 13:05:19 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:46780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lYXKg-0004Yw-Ld
 for qemu-arm@nongnu.org; Mon, 19 Apr 2021 13:05:16 -0400
Received: by mail-ed1-x530.google.com with SMTP id h10so41593291edt.13
 for <qemu-arm@nongnu.org>; Mon, 19 Apr 2021 10:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aVPhSohj13RY2ubCrOD/7pMisW0+KCkn1s2cajpB/nM=;
 b=vIYeRV6kEXq9w6IWOZwsRJyyspPG/KQBgJSqDvOH7t2VCiHYqk8swLR16q5q0zDMAG
 2GoWg25zv4TSseURbheeVsQxmClhj5uF9mVKquAAv79OUSZiEIGuOu7kd9xdEtEoNmLF
 jerdVJqn9L8n4B6SCa1PjQkZ526MrmLSKNH093cgnsM90jdDtf8Raprgx70YEbyz5J4h
 rD5sLGta7MB2VQoj3cMtfW4CVzuS6jNwrUaAOcmbRL6z/XFVbikHgMTD3+XArKSvQyMF
 ctpRBCg1gN6csWRNsfg2A3820D1E7gUES9XS0oT2hNU7GA+lzgvUIItj0/AG08xI3dWy
 XquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aVPhSohj13RY2ubCrOD/7pMisW0+KCkn1s2cajpB/nM=;
 b=ZUQpuRhiXAhu/XHfLnrsXHeIwXEsEl5GttCUl8/ESb2bdj3k1oVfNXME/AiY0qForH
 VEWbgu1bFDkrQS4/n3x9WJg7+HaPZ5RUepyoGypgF5a4w/Q8E4tllKgzwSbXsDYzXwUm
 816yYzMvmL5fOsQTWgSW6bNSakZD1a8yE3Xf3oav7vyc0U0i2JttiUITPUBNvrTr27eF
 TGtFyWoGZq3/bdJXSqNE+0tS5vh5giYmDG5HroUDWjE72tDOqIIPHFLj7cTd2UsK+l+3
 RRrR8/cTHqVktTZ7DG/OncK+efoxSg5WOwGtYP7LiTn5oEf3SQoijHjDmWwdlUnYYQeu
 bzbg==
X-Gm-Message-State: AOAM5333nd52opzDXDaz8WRvTL+SoQJ998gK8gMryBUHStQJgTnfEA9F
 pRtOpoxdQAhYF4JjHR/LvSS5o5LDWXCAepoZdYiyzg==
X-Received: by 2002:a50:fb0a:: with SMTP id d10mr13919146edq.146.1618851909255; 
 Mon, 19 Apr 2021 10:05:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
 <20210416185959.1520974-4-richard.henderson@linaro.org>
In-Reply-To: <20210416185959.1520974-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Apr 2021 18:04:17 +0100
Message-ID: <CAFEAcA89=Xi79OTXGHkbR2S+v_PpSiKst=9xcbmWLyQ-+5A7Yg@mail.gmail.com>
Subject: Re: [PATCH v4 03/30] target/arm: Rename TBFLAG_ANY, PSTATE_SS
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
X-TUID: g8YNzAkYECsZ

On Fri, 16 Apr 2021 at 20:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We're about to rearrange the macro expansion surrounding tbflags,
> and this field name will be expanded using the bit definition of
> the same name, resulting in a token pasting error.
>
> So PSTATE_SS -> PSTATE__SS in the uses, and document it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           | 2 +-
>  target/arm/helper.c        | 4 ++--
>  target/arm/translate-a64.c | 2 +-
>  target/arm/translate.c     | 2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
