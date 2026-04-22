Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D823FFA1FD7
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Apr 2026 16:58:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFatn-0002Du-Ku; Wed, 22 Apr 2026 12:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFatj-0002DB-8u
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 12:57:59 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wFatd-0002Dd-Nt
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 12:57:56 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-488b3f8fa2bso60010645e9.1
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 09:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776877071; x=1777481871; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DbTeMp0F6npNH4gs60DUNZm6vpG8shzFCghJCd+tOro=;
 b=pYXhh+JqchMsCzXSwdYupdwEYdhn3WQXhghMjEuEEmRUmZFOGhdT0Hx70+HcC9vbMv
 +kLopuHlRjf8zc+eRn+UXBo9bDmxzZOnyszp4PJhoWdGISGcqp6vrV2i4/bBpHslcrlg
 567yG6sDjs83EeyuzvWGxpXTPKbTkZ78taivZHpj/I/NNYddDGQZCoXSYaoyZEWvHSL0
 ghL2PL0eXvB8m6jUJjknqQZ4WOk72pGVv8bCVmb+6DBab0QeuL/cr1Hg7+3KZE6GP5xL
 u4IkoNKaGUcbz8iwjftE9pSP0160RsuowqQ98k4WCx0wgBFd3/yc6wk96LBRWGhnUiCK
 avuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776877071; x=1777481871;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DbTeMp0F6npNH4gs60DUNZm6vpG8shzFCghJCd+tOro=;
 b=QXFOnCBQJcSdY7KPXgXcYKPeduj+xG52McaFrDkvJxrrom3cCBBerDb1XLHZ7/Sri5
 3TCLs0ykuFEwWNudEjSramMyJwOWfFiSCUZ9QxwRFsRM9U3KsMI/scaW9gqatzSX0eef
 udipj5BTTl55x0yehRLQv0kEQfXsQg4/OU041GOJ9Rp32c/f71MBU0nw6nTZyILLz7Hu
 EX9IUkbuISjvbEFDq9G4sPowDlV/j24/5WQV78EsRhPUDuA7XK42bQah9G9GgktbzcDy
 3XtjCO6cw9vjZ7RHH0glepby5a9IXZmfAE4aeIipAnOKLey6k+0kdR61c7ULNqlEvL7v
 k/gQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Jvsc5m3PXtGeh58bDWuUE4EnF1HXOfaHFz5ksIEervB+3DWuketJbUdf+gM/VStFLQkPr9CQnOw==@nongnu.org
X-Gm-Message-State: AOJu0Ywmf/8NpBlqBvSE8YwbHVZez9osfaX9UgFRPiBCCqR9QZOIsW88
 Xs+kB7vLXYuCeOfdjJlcXChjJcUqHE3kDlgFuDRngKDr2cNw0cFVdkl0vOrpmd8PZc8=
X-Gm-Gg: AeBDietX0Wc7aEv38e3yxBIQ8haXTLBWOkjdwk2MgLAvODzOissQByle/acqkTqP5EJ
 Sb96kYGMbLVWqOcqMfz2VZMo5ojET7fyk4ai+i5pNIjDfsx5tt0BOm/67o6rGwno1rhewGMb9nh
 WVlQr+6BboyfmtBtRctkTxWA8xUltO3QpWfmbOr3TjdkyCChy/0ScPPiVu4/lZyYM2zui1th5dj
 5gzBwXLf0wdOSJodpP4NUUMu1w/8yWyTlV6hKNQfKQliZsDaDCJTtzu5uAqc2FHCaloWmIEPeQ1
 mN2bFB5cE9TkvFB82Cr81CV29uHb908WJUnwa0LvrI+h+t1tBc9CcCLq45KzBeBNrUwg4UsPB9W
 lvAxxbcxXR2pYTvH3kufYs3Pom4/DRpPktkzAj5Ii87TRQPrTLkaGlD+MuRsZ8bxco86WQk46IF
 aZdv4WvKC1Bk5v2WA3nGj2givPc46R6xcHjiAdMFOW14smxHcGTCy4R/18+KUChJCH4CzyBoMwX
 fyl
X-Received: by 2002:a05:600c:3150:b0:485:3cef:d6ea with SMTP id
 5b1f17b1804b1-488fb8b9deamr269580515e9.13.1776877070648; 
 Wed, 22 Apr 2026 09:57:50 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb72d365sm229925445e9.1.2026.04.22.09.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 09:57:49 -0700 (PDT)
Message-ID: <a0835cb6-50b7-4db3-b747-bf3d5a4badd9@linaro.org>
Date: Wed, 22 Apr 2026 18:57:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 26/32] target/arm: ensure aarch64 DISAS_WFE will exit
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Pedro Barbuda <pbarbuda@microsoft.com>, Alexander Graf <agraf@csgraf.de>, 
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mohamed Mediouni <mohamed@unpredictable.fr>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20260422125250.1303100-1-alex.bennee@linaro.org>
 <20260422125250.1303100-27-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260422125250.1303100-27-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 22/4/26 14:52, Alex Bennée wrote:
> This mirrors the logic for DISAS_WFE in 32 bit world.
> 
> Fixes: 252ec405768 (target-arm: implement WFE/YIELD as a yield for AArch64)
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index 073454b9195..d79c8ab431b 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -10917,6 +10917,7 @@ static void aarch64_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
>           case DISAS_WFE:
>               gen_a64_update_pc(dc, 4);
>               gen_helper_wfe(tcg_env);

If we mirror the logic we can also mirror the comment,
otherwise the description rationale isn't very helping:

             /*
              * The helper can return if the event register is set, so we
              * must go back to the main loop to check for events.
              */

> +            tcg_gen_exit_tb(NULL, 0);
>               break;
>           case DISAS_YIELD:
>               gen_a64_update_pc(dc, 4);

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


