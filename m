Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E66CA0ED1
	for <qemu-arm@archiver.kernel.org>; Fri, 15 Aug 2025 13:04:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1umu6B-0004TJ-Nk; Fri, 15 Aug 2025 09:03:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umu69-0004SP-Tv
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:03:57 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1umu68-0002El-0h
 for qemu-arm@nongnu.org; Fri, 15 Aug 2025 09:03:57 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e931c858dbbso1852022276.0
 for <qemu-arm@nongnu.org>; Fri, 15 Aug 2025 06:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755263034; x=1755867834; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O3PDrFiW1JgqJriyjH0NT1Rxeu4jC8cieQEXmK47arI=;
 b=qwyZnYMsZwPhxurgAE8f3clUVhmPHRZ8uoRdx8qim1ACR8mYVnr7chtNP3T4PY7xu2
 QOvo96kmA2n9wpOKHtqi95/ttUVoyCckYuSrVZnVSIVb9zGtEtwzdxAxPbtilRewgVnR
 X59TVuskRoj+MdRBQ1c8LFp0nljoaAbCsEA/Yhs6/t8XpDcEdufUdMJhkV9w0hfOuiLW
 BjfXmei5cNZ56bASPk4/7HxM5iJmRbVm0o2fE0IVd6tCxwRDov3R7kFHKZ2mYWD6LbFn
 ezPaVWOOGxeL0fAeswMmN1r2ragCDkMnGT2a7Fphq1IBSH/Ri82eTLqgWfmPnqqAHXnT
 r9ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755263034; x=1755867834;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O3PDrFiW1JgqJriyjH0NT1Rxeu4jC8cieQEXmK47arI=;
 b=ODmqq2G7uHj3oXHAcIs/T7BiT5nz27Qj0lRJAFlWbC0kArXqWdY18WvSYSUt6j0AyZ
 nzyJ3geEm7XYmQ/XvAUD1cRCtJknS9N0KxOcN0IQ0YSgTzYUwiAIit4yKloByxL6MHhM
 /dn4t050BHzriM/8JbgrFK5fObZZ/xzVMjWCPISbJPVlcwOrH9yVUylKGkEqMJb1vVsH
 PXuO5v5QZit5TDsAwGJjui053FYIo6IAQs5fQFaw0Fel3BgOkxPRM+XZ2VbpLP87SFzK
 D1E1NtLu+to3DYhE4bDo2TASx7QG5FroKBTKjtZ053RVY14acHCIF5EWjinVBnxM0U9J
 63yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwCC5gLR84TrDd83/FGmHkNi/aTgBXIJHdFOUtgAjYv7CUNJ1r/wjAVLsrBiITLBLWEQMQgfCUUw==@nongnu.org
X-Gm-Message-State: AOJu0YzFeedqHM2rAXPneWzg6hOTYtin9VO5U98THnjuai8t8avzlUK2
 4WpGEdwdaMKlxAFBm5hpU7RUSDa2UfNV281+l/ExKR6I3KIMQwQHKpUUHRsh3lujf8HSuVNJfp2
 odsSLJaSwYpPG/klD/H6dWFQZz7W3eCU7fHN7Es7ekg==
X-Gm-Gg: ASbGncu+wpSTZWRKQcbo0AGhwSOR8XDGbgyqwW3ox7A5yZAYQThEnsyD7J+VmRMrPce
 BePLmJAjrHwlT+/FtgB3luFX1rk4r2/HoBrOW6H+v69OfE3o/2rD9ynFnU1nNmQT6lp8qR02a7X
 QEHzhJiuMVdk8Zop1ESMHhClaO4ttgJFCgntOQz0XhTj0AvM7D/lCS6BcvmZ5HAnaMtFLSsscgT
 XjKKOZRsO/HDRWfNis=
X-Google-Smtp-Source: AGHT+IFkfUve/8Ek/sb7rVwDY6v1lOCZH6hXV8OdVO6hY6o8lFFHqu7WMaqhBoeV+cMg2KMhBeagwPj5TMh19t5LQTY=
X-Received: by 2002:a05:6902:4787:b0:e93:1c73:d1d6 with SMTP id
 3f1490d57ef6-e933239e5admr2009955276.18.1755263034356; Fri, 15 Aug 2025
 06:03:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250727074202.83141-1-richard.henderson@linaro.org>
In-Reply-To: <20250727074202.83141-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Aug 2025 14:03:42 +0100
X-Gm-Features: Ac12FXzlDwud-WX1t6DqHakMyIpFU2bEluhwmcOJ8BGfqljPRrBAGw7siKrpQbE
Message-ID: <CAFEAcA-Cm6rn6N+H=v1aaeDZBeJVUQQ2v3XDVsTu=PeLpc76QQ@mail.gmail.com>
Subject: Re: [PATCH for-10.2 v9 0/6] target/arm: Add FEAT_MEC to max cpu
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sun, 27 Jul 2025 at 08:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v9:
>   - Set bits in arm_hcrx_el2_eff has bits whose effective value
>     is 1 when EL2 is disabled.
>   - Include Pierrick's firmware updates.
>

Applied to target-arm.next for 10.2, thanks.

-- PMM

