Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90559CAC597
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Sep 2025 17:43:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uyDDv-0006wN-3J; Mon, 15 Sep 2025 13:42:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyDDt-0006vV-JF
 for qemu-arm@nongnu.org; Mon, 15 Sep 2025 13:42:41 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uyDDh-0002Qy-Sa
 for qemu-arm@nongnu.org; Mon, 15 Sep 2025 13:42:39 -0400
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-266fa7a0552so10810085ad.3
 for <qemu-arm@nongnu.org>; Mon, 15 Sep 2025 10:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757958140; x=1758562940; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G55C6Hr1OF19+sxYwNbMNWeWfW9S+S4g0M9L5eA7v3g=;
 b=Ux07qu9XhFtknXWtz352k+15V9yj8iPuahOifoRS8u2+Bp215XG86qErmPnFrtij2d
 y3qnAtl21VTXHZ9lskvA8KZaFfjdeioWr9SAm5IA3MgTPVqM/Eifhs/gwg1Vo/ho5kRL
 Hg1mOWeE1dbPR0sZT/TSjx1QH6cqkmecy+Z5dMtehzdhGU/sVk5txqAGyR4Uvl43ZXbn
 X46vU+6C2dMR3bVROg/OCvMiJEgxuUCUG52yaqbqfv/hshKkDH5BkhfLR5hIWRe90rXJ
 8WdC4DKz2JU4S+JlOn+dXEzHvkL60wt+bdpUlwyoCuNvtk1aZtfqYJGxKqvNkokfhNcl
 dpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757958140; x=1758562940;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G55C6Hr1OF19+sxYwNbMNWeWfW9S+S4g0M9L5eA7v3g=;
 b=n9DnLYiDa/ypzM0BWMmEws2b2WatksAgZSHR4G1NKJmg8tfX4Ay+KLlVuOnXA89rLf
 pVg6165zQ7utqhSOPRjq/wZ49pMoD68y/cP7DtpJu/zyT5jlte3mo4NpTMxVMivTZPT/
 6y3w2rdpaBwnqwhvFLGNHAtnZX+j5y6Vg3arQqXCumApwt9wl1VE5L1vkUXe9e4FWaVY
 sgor4pcdKYPuBs1pwbZeoDOG3ua94apIUhQ8VVpxr6KTN3K0sOhzy2DWvo2HZ5H4NHd2
 veU09ZaA63Bc/u3GTIKpW+hEiHLLyrqisdkfN2fRHVUrPfUK8wb47U5ew59ohGWlaatQ
 yeig==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrGDvnYPw6FkMDNIfd7hY1/ERgDbfrzuvSZZMgPwI75DotbDEvKV9Y44IBdElYZvTiu5NWcyj+1A==@nongnu.org
X-Gm-Message-State: AOJu0YyRFNkwopxqXDm1A1qigEv+P17Mh4J5SgmFgkoUTHTUtxyvxVFP
 fscXx15PZbk/5yD9tlJQAEDyYK51tj+5dj+eWMVva9Z7UA1LmKCve9KCNqRZaWMN9kI=
X-Gm-Gg: ASbGnctheBnteL72kuHp5afVQO1ih+eTWH/LCwWgK5rVkjdkY7afR5j2Sqbx7+42ntk
 u+wZFEuKugTCla7UYuLOBBmp8Zoxz/JuQqxWQ2d88UAKKN0q1hokagfqDY11Pet+3gmOf4WakW5
 0bPsKdJLDjyKAQYzgJioH5ZEWa1yhpfoki0NPSflVPl6FmNWmUC6wMFpq2ZhkxX+bB2XIzUT9zb
 aGgB/c4s3H5dsy3kjCQK8O/VpFX91loZMbVtCWjAGWvevCDXpiySTqqo6Iew+D+ViLyA4QCQb7P
 QaZSIm4J2i1EBKdAVBWrBA9Jt4XTVGcwt9ZXVx/2+I7aM6eMVoy29oyFmGuyDyqhz5HqI76yuJ3
 IKxt1EmZbIMvlnqDfPTZU3AqAwVsrK2r1U95fl+dfgkLnRTY=
X-Google-Smtp-Source: AGHT+IHMVD43+TDIDzBUC7RqA+Jvv/YYpY6BKexzFYE458gGPL+HWdxjGDS3+Yc1isk3O5WsZXOQIA==
X-Received: by 2002:a17:902:ccca:b0:25d:f26d:3b9e with SMTP id
 d9443c01a7336-25df26d3c13mr153326355ad.11.1757958140523; 
 Mon, 15 Sep 2025 10:42:20 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.132])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-265819a61b3sm45931245ad.42.2025.09.15.10.42.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 10:42:19 -0700 (PDT)
Message-ID: <69f5b63e-8b2f-41d0-b911-6f4706a73664@linaro.org>
Date: Mon, 15 Sep 2025 10:42:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 21/84] target/arm: Do not migrate env->exception
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250830054128.448363-1-richard.henderson@linaro.org>
 <20250830054128.448363-22-richard.henderson@linaro.org>
 <CAFEAcA_irevvN4jAtU9w2bXvEbcQ2gT2XcRGjYpP00QbgX5YcQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEAcA_irevvN4jAtU9w2bXvEbcQ2gT2XcRGjYpP00QbgX5YcQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On 9/8/25 07:40, Peter Maydell wrote:
> On Sat, 30 Aug 2025 at 16:56, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> These are not architectural state, only placeholders
>> between identifying the exception and delivering it.
> 
> Yes, but is it definitely guaranteed that QEMU will never
> do a migration or a record-and-replay record of the cpu
> state between identifying the exception and actually
> delivering it ?
> 
> I note that we do migrate CPUState::exception_index
> (added in commit 6c3bff0ed8) which in theory would also
> be in this "non architectural state that we consume
> immediately" category: so presumably there is some
> situation where we might save out the state after
> we figure out that we need to raise an exception but
> before we call the target's do_interrupt hook.

You're right.  In fact, setting this state and jumping back to the main loop is probably 
exactly when we'd process the cpu work queue that could trigger the savevm.

Ideally this window would not exist -- we'd process the synchronous exception data 
immediately, set the cpu state, and only then jump back to the main loop.  But that's a 
huge change.

It shouldn't be too hard to adjust this to store 64 bits.


r~

