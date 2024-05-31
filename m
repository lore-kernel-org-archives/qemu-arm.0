Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp423913ejs;
        Fri, 31 May 2024 03:38:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVM0X5fz6a95drO+1P8xX6WIXBO9P0698GflGDiVFqilMm+M6Nd9KaxN4i0tL5X5CTKMcyCHLVR2EWZXr86SPWvvxBjs6r+
X-Google-Smtp-Source: AGHT+IEQ6Yfn9TaFFdArjPF9ujDnQUfC8zBH9nQOdeBBnnLBeCe0n7Kl74s3qEaRQ9FGDECiH45Z
X-Received: by 2002:a25:ab10:0:b0:df7:7096:4097 with SMTP id 3f1490d57ef6-dfa73bed914mr1386684276.11.1717151937954;
        Fri, 31 May 2024 03:38:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717151937; cv=none;
        d=google.com; s=arc-20160816;
        b=d4BWp7Z8pLUJXfmIGqMfQvt1CcS9gx4oR8VqZ6o7Oj+y0Uad24SpXcMdSCOU4vVfCy
         EaC3XvtooReZv6wwR8cAQIB5aojFbrbxanyq4bORu1H1ryna4EmlVTGMtVgUS6JZ+nCH
         iJwN+V98hmJ5uUXa8tuZ0onM8I+z7RgYmkGrZWPK2aDG0YSJkca6c9Gilxhpk4teVG7g
         aC15dsr0sWIVCgH41NWP7JnnXjnoQcYF6epmv2IxvWJQxgUFR7SfhrjJwHqUUpGZuau3
         7Ay7Oj30zkgSKDr3o/6SPzzbX+ldmade395dJgfpBY5udNTrGRE25ZRNY/P8G2q7FxsI
         t9Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AkI2FS62x+Dhu1IK0lIKypdx1eV3OekuMiHqJQ6CMuA=;
        fh=H2AmuqulvQE+T5zu97MCEUC3z9wF9NssS7895NhR/+c=;
        b=OJKVwtbaDLM4U61GYDIPaqnimCArj0DRR3fcMgmISBYk9Bfjg8H2gfblCswUy+aLzX
         YKVEr669Z5x/mKeL8Ohkd+jz5fUJltn/Ds6PsEn2TxSrFNYXzVBs1NaKHcTaPFjBiRMs
         9jxRAvq8NohLZiwHe+A/AhA8uOpo4c7fKbBFOpuqVxPGRArB0m0oSJTihsMGbHbqtoAb
         QWfdsQv/lHSa+gV77cAEXd22ff46dbpcTb4tQID5PfUA2kCi12uMU4mAKLbXXC8HOuku
         lUUJg0vGrB5OnCED1yYp7EJt+VeiocJ9/bxGadWVRRyQOyrs/Y73CbVc5j4Em+OzuIFU
         kjQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tR1n6uCB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae4b43daa5si17369976d6.584.2024.05.31.03.38.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 May 2024 03:38:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tR1n6uCB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCzep-0005OW-Mb; Fri, 31 May 2024 06:38:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCzen-0005Nz-Sf
 for qemu-arm@nongnu.org; Fri, 31 May 2024 06:38:45 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCzem-0003pD-8S
 for qemu-arm@nongnu.org; Fri, 31 May 2024 06:38:45 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe63a96so1504284a12.0
 for <qemu-arm@nongnu.org>; Fri, 31 May 2024 03:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717151922; x=1717756722; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AkI2FS62x+Dhu1IK0lIKypdx1eV3OekuMiHqJQ6CMuA=;
 b=tR1n6uCB0YLnExY7+0bvjPitC7tYtt6NmWwCNbQwcwxy/wCYJ7e56eliYkqRo1Gp+P
 S4bXY3lNoiNmm+w4tbKO74qx3PYgIX5h+dEy0KiDfa6avqU9TR9+dqbXU1XFZLuaXAwG
 2w+Lm6NdXsf77/4x1mdZaUHtqwY3XxLSZKNi8Q43LRRqPY3AsX1mXt74BqkqlikZIFHa
 c2fG2VukjYB5p0AKmvADun4piIR52aKVTW2zvDrIVJ1wPrHTKOuCefuceKJT2pGNc//6
 kkVl2n50mv8YMNm38RGa/izVda48l/4StiTj1v6t+xw/3TzD6l1gdHkkHN3Im5K15IXI
 eAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717151922; x=1717756722;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AkI2FS62x+Dhu1IK0lIKypdx1eV3OekuMiHqJQ6CMuA=;
 b=Sxp6rUGYy7tCW+89G067xohNCDkG7FRdQ+NCDTkEdu0OjnC0ncxHoLOt/8B4Tx80BH
 NFc8tKg3Z+u9xQw3kvXLStnG1xdjmqTQ/h6J3VsZoMnldwVM6q31OnAavI5LxvvzXCB9
 B3iZ4j1+LFS7QJ0dgEeAnNcE9fLmwsH8OKmz6Pz65cWoDhUaYSJK1xTjhymvUJtlH3WT
 r0kz0SXRML+IO14btoHTmt//Z9+T8RC390k82Ieuu4pgzZqEF2sKzrFKWBmEN38ahGHJ
 9ajXhsnf4DwMTDqZ/mHHTNg6Wyr5WT/+CWnSPUbRREhpC1jHYop82paiNeIwQGNGyWVD
 XyoA==
X-Gm-Message-State: AOJu0Yxj4WlnTTF1cEtSX1WghPGnCb786rT82ySjeuDRCyK+dNXJjkea
 zl23FnwPK+E34O1Vwz2HoVlsEPlvicS9NNDKV95QJCu05/OqXlnEERj8pWcZRSrvoc7wFEdASH5
 XHbfPV+/d8/UY35XLNxSJ676ZMSWRt0ZDkD5pVR27Gp4eYNCT
X-Received: by 2002:a50:f682:0:b0:57a:2f7f:4800 with SMTP id
 4fb4d7f45d1cf-57a364ac02amr1020794a12.34.1717151922311; Fri, 31 May 2024
 03:38:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240430140035.3889879-1-peter.maydell@linaro.org>
 <20240430140035.3889879-3-peter.maydell@linaro.org>
In-Reply-To: <20240430140035.3889879-3-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 May 2024 11:38:30 +0100
Message-ID: <CAFEAcA_745eAvDv+ZPq4gE7fyBxVvmB3M-jymTA-XB2UmDnYVQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Implement FEAT WFxT and enable for '-cpu
 max'
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: TehiHeTiCrNi

On Tue, 30 Apr 2024 at 15:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> FEAT_WFxT introduces new instructions WFIT and WFET, which are like
> the existing WFI and WFE but allow the guest to pass a timeout value
> in a register.  The instructions will wait for an interrupt/event as
> usual, but will also stop waiting when the value of CNTVCT_EL0 is
> greater than or equal to the specified timeout value.
>
> We implement WFIT by setting up a timer to expire at the right
> point; when the timer expires it sets the EXITTB interrupt, which
> will cause the CPU to leave the halted state. If we come out of
> halt for some other reason, we unset the pending timer.
>
> We implement WFET as a nop, which is architecturally permitted and
> matches the way we currently make WFE a nop.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---


> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index a152def2413..006092a6b12 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1132,6 +1132,33 @@ static bool arm_cpu_virtio_is_big_endian(CPUState *cs)
>      return arm_cpu_data_is_big_endian(env);
>  }
>
> +static bool arm_cpu_exec_halt(CPUState *cs)
> +{
> +    bool leave_halt = cpu_has_work(cs);
> +
> +    if (leave_halt) {
> +        /* We're about to come out of WFI/WFE: disable the WFxT timer */
> +        ARMCPU *cpu = ARM_CPU(cs);
> +        if (cpu->wfxt_timer) {
> +            timer_del(cpu->wfxt_timer);
> +        }
> +    }
> +    return leave_halt;
> +}

I noticed in my pre-pullreq testing that this function needs
an #ifdef CONFIG_TCG around it, since otherwise the compiler
complains that it is defined but never used if we're building
only-Xen or only-KVM. I'll add that when I put this in
target-arm.next, rather than respinning.

thanks
-- PMM
