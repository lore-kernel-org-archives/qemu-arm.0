Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8C30E85389
	for <qemu-arm@archiver.kernel.org>; Fri,  3 Apr 2026 21:02:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w8leI-0008PC-7A; Fri, 03 Apr 2026 17:01:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w8leG-0008OC-OV
 for qemu-arm@nongnu.org; Fri, 03 Apr 2026 17:01:48 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w8leF-0001OP-6I
 for qemu-arm@nongnu.org; Fri, 03 Apr 2026 17:01:48 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2b2469e5117so12140645ad.1
 for <qemu-arm@nongnu.org>; Fri, 03 Apr 2026 14:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1775250104; x=1775854904; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PvMNywnOxM1Ko4lHRw2mrBmkIQW+MXUABB15WTDxuP8=;
 b=WXiT6R0LAngUzDWzFe9/otJOp1fUc1p6nHZcTimsvFDZOWzEoUYn5shlJxy5sr+SQZ
 lFRy9RkqOX/pRm7H9TUcIVP5foQt0KkUS8jE+TjMbkr2FtN3rKRPGrym0gY0EA5Pdcac
 rizvN0CmOwU2rEvzJoJSpmVx4xfqw7Pt8oZf2P8LFPgn6E1TTdlYBcfpx6rFagEuknCO
 lnQlQ7keBqNSdzCJonzDF2cyIEOM83VdUQEDSCk5KKg7xSPPY5KLpyNBkoU66pALD7I1
 JN8APzGl5GJn/8t0jtyBfCF2GeJ30vb9r86KS1vOMWMWE+ORls7k7BSxWTS9gQIRUCOw
 rCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775250104; x=1775854904;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PvMNywnOxM1Ko4lHRw2mrBmkIQW+MXUABB15WTDxuP8=;
 b=OmvOPHtmZV4H4Kh/bbEKV/72tMtgpAa0qTUuzoMy2GP4Q6W3KMK46uHyl108AVRzxt
 YQcFnNvP0BjJe1g75ZGtTy7v6qHSqfzbPGLVOyeXtUFCs+5oAkB03YFZ3m9EshThc1Wv
 csadpens8vPVFEtZs7/EPpdyBoEJFtg9dlccRQ87blCr9DsK38r7XI4wxmYy3qbHcNIp
 +yPTqMNmRK8ZN2Rx2Hxlejki10x4nXMHdHqlFEdz9B4mDgIPByex9pYOtp7xyv7raEA3
 7954LK+mhhjAL2h35Qk77LU04oRU9OTU58zMagKfuYGDrdxAX+bA4GTyOoHYV3ofR4bd
 kqOw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc4q5OMfhYitQNwuXDHTaua44XEGTGytfpmlj5OGXhk+lQZoiztEyLhvmNMhAo0fHXAxcZkhQp8w==@nongnu.org
X-Gm-Message-State: AOJu0YxcPadVzo5oJbBC56IFLLvOo8+beGyx3D1yy0a29WizV0WuI+i6
 jrDPfeF+CCDIasHowiPXl2TG0XgbIbQeowCZZurkZpsEHWA9pvmRv8+UIHr646C+71c=
X-Gm-Gg: AeBDievbUDEz6Im4DsKpqvfm0jYWbzK5VKEg3/spT2UO6He2juKULeK0oEMAFWptNjW
 w/39uBLUajJnBNgSdge4Ba7XoPLg8qP19WnmO3W3ruZvWpWmqZnLmu0avyDjc4TV+5aq96456BC
 2k4uF1kVjL6A+11TP0u+WZuD6VjQCCZUHnlD0TeMoyxgfPQeanvGxOVvpHRCswNRk6YDBVcc0Xv
 wowCMr+OsPNJMkad/817kvmexfWNVLgRa95p49WJi69dOO9R/Os+ua5+dfcyKgqGqXt6rE2BBQP
 pc4NerWPkFGenk7pIMBYXH37FqIWUqiW/tCC9CSAMspWDnHjrqNQukIzzCXRAL27bSlXbg8hOv+
 HAmu//jvDY4VvAszXL2fhxACjGLKt9s4a7+3bhBDgDFIzepWY3ujP2liJgNCL605W710ZLDMtUq
 cqurcrs2mpdSWQF08nLv2t+6aEJ4cOB1vybhjeTx/6tXuYKuYxxD2F5ReaZnxTL/TfUgo=
X-Received: by 2002:a17:903:4b03:b0:2ae:5a38:96bb with SMTP id
 d9443c01a7336-2b277d633f8mr73464105ad.2.1775250103756; 
 Fri, 03 Apr 2026 14:01:43 -0700 (PDT)
Received: from [192.168.1.105] (124-150-69-109.tpgi.com.au. [124.150.69.109])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b2749a4791sm64169935ad.66.2026.04.03.14.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Apr 2026 14:01:42 -0700 (PDT)
Message-ID: <77bdb8a6-fa99-4b15-8466-852f20b8d52c@linaro.org>
Date: Sat, 4 Apr 2026 07:01:35 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/12] target/arm/tcg/translate-vfp.c: make compilation
 unit common
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 jim.macarthur@linaro.org, philmd@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20260401192057.1182724-1-pierrick.bouvier@linaro.org>
 <20260401192057.1182724-6-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260401192057.1182724-6-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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

On 4/2/26 05:20, Pierrick Bouvier wrote:
> Generated decode files must be duplicated between user and system, as
> they are generated in private folders per libs, and can't be included
> otherwise, as meson does not give control on output folder.
> Indeed, meson generator is a different approach than custom_target, and
> this is a limitation by design.
> 
> They were already duplicated between arch variants anyway, so nothing
> new here. They will now be compiled once for system binaries, and still
> per target for user binaries.
> 
> Reviewed-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/meson.build | 18 +++++++++++++-----
>   1 file changed, 13 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>


r~

