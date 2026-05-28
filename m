Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C7FCD6E44
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 10:51:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSYK9-0002lB-3z; Thu, 28 May 2026 06:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSYK7-0002ku-NF
 for qemu-arm@nongnu.org; Thu, 28 May 2026 06:50:47 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSYK6-0005wT-4x
 for qemu-arm@nongnu.org; Thu, 28 May 2026 06:50:47 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-65c477a3278so12910069d50.3
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 03:50:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779965445; cv=none;
 d=google.com; s=arc-20240605;
 b=ehNDW2+4HJopIbt6kl0zG4pb98FaFnCne1QVH3X453QUpAx2alkPmuFrIc0fxv1rQ9
 6n/BUEuKdW8xiZoWvP//bPmmzV/ale+GYI4Q70SFisF1r8/MfWmZnT6msmsEjDDrTnyx
 UDhcL+H+8ctYWNM7qBtWCK44Lu+iwrVE+zNhuQzKay8q5FXuQn4MD0rSBvC9uVWPPrU9
 W6MQEHjhbSMTEytWXLN5Dua/J1cpKzAJ0hrnLUTikFPu/2roQ7abq8xXseynZhBgbFdg
 GV9acmres7iU5u92Bz6JGysd/tIOU87UJuzvZBGGz2KnCP6Nzvv5dCNjuHfzTdoDrIOB
 bpRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=9rkKefH7qkaM7PYGtNz39Smfm7od6r4vxNbFh/5YrUA=;
 fh=vyGnWcRmO00t/qO1TXK5AMv1SmMq+I6sWN4MqEoJ8fM=;
 b=cC0QC9kPtgGJAHgfUxB1g2wpTMo/haRqI2eYF+5HBw2LhAlOPD5izElmkr2EPfZkuo
 0jfRKWHZjk8JFzL5+n8G0CBY8g+953vwk+8i4MmjScCii4+ob0gVxWtJt5z4UnEzl6AK
 KnUVgdRmf8elaIlF8IP9jGGSZ5QIIVCY6aG5CPCInRkywJpilcHcIU9M4KE5ah/LHjsQ
 Io6kLkGoIgyu5mTS7io8Xi8tBjWjBbY/iINgTQ6h/O9tYb+hwAqq6aPqwgbMqVDtPo1B
 mN7eEBpCOO+mbJdi8hLO769Sao0vWotmspJUInKQvO2KDo/A0kp8bYhSOd8NAl4o59Go
 AWiA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779965445; x=1780570245; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9rkKefH7qkaM7PYGtNz39Smfm7od6r4vxNbFh/5YrUA=;
 b=dWaoRJRJJTpcIaiH0UrdUT2Eexl77wkoHKNrcUEFj1jkm44xTH9NysSzYvi+hz4pHO
 l9QmhJrRWm81FLRhdsoCVn4fD2Cpms5yZ2c8Fo50wIsLQVBwhbTGyNEMqJU2Hy5sU5q1
 bKdbO0xLA1KEsRryWVNw9KXRRLhQETT1QCTB1jl6lB9ZHQ4Q1cRKsI65BWY3+v1g+ExX
 swDU8cS65RxepM+CdzU4Z+p4rIusvNWSxShOY9hZ5kClQxfPyN8fE/bWbOHXio8YMFbD
 gXr4HznJgerHvzuR3/GOk68E7CLjb9mDfo4nh7AGeFEuGi+PZKNqT5QI9VD44GxhVVZD
 gqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779965445; x=1780570245;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9rkKefH7qkaM7PYGtNz39Smfm7od6r4vxNbFh/5YrUA=;
 b=CN0GZdAwuZaXXi8cA8RgLKL/sRF/YxarGUHPFS8jiB3I2BPKD8sN6jO2lAL+9BQws+
 isLqcqmS4FdZvFiN9WmWVIsdNOJlp9MET9UueRppO3UFa4CDkM7YrjtznaS3q45JJW0Q
 ODrSJf1UUMoHYtO+77xUjkjMo2tA5MfkWEM/9j3K6G6tE4rknGmff62fUa7kYjEFw/yR
 ogxnNoeOkpSEn4FiND9kqPOamU8chabgd0JkWWjCoh8gfI3RGlOr9GaOlp/QssQ7fPe9
 Ci9UXKpmyrKKZuAYvooJX44LlFPXqqYhRkmkEKDCwnJyINOGr52J3hCvFRU5qwQSHINJ
 WVwg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/yUkLAa948IAdYpWMKWNOa5et34inytVkCtIWDgDaXYUf9hd3sOq/BowLcXp/Xd5miMiwT8NoPkg==@nongnu.org
X-Gm-Message-State: AOJu0YwWH3jEZz5r7T2S90eWyLi44daHWxGq1sU7rRL+RMlVXPvEYMzX
 JK1Eax5qnm6o01Wb3ZgBHXdYGn1xdqgi+duBasOmAmBwU5DDy6/c24vqr/AWbBFwotljt3Bxu6p
 kYxdUm7AZd6NSY2y73kNDrJTl5UmlEeyHbG2DmK0kjw==
X-Gm-Gg: Acq92OFV4S4wcQP7IVfAzomaQ5BGPcJM5kas7ZsLeCMTcBCImkOqGJN+s9AEd2zrAuM
 kGPruc26BS0mEnzxOHCNvJTOvqQszEyIXhQXajoYGXjoJ+9Egb3/Z9vxSUqez5Sr/bZH8NB7n8f
 ULeJzqK/EPDy0h5cSTzOrYENudAP8ZCbbv2EUPO1UAIhmvIOpO9EFoF8sYVsjWl5/x4rCkjXpsM
 PmMhyTfpRzEoCTclXI4a+uR+oFe0wnkYTe2srKMjCh6p0iEKmIZpVZ46LSfmEOIBDxcKEd1BQhX
 ZkLulimoqtDxPlDXi1gEztyXk/e0j/HdSeycVqjXQdIgUwEMhaT0K+DIxvfNlolBdQZRP2Dq+j7
 hrg==
X-Received: by 2002:a53:acd3:0:20b0:65e:3bde:7c14 with SMTP id
 956f58d0204a3-65ec98abf9emr19937828d50.32.1779965444708; Thu, 28 May 2026
 03:50:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260518-pr-pacbti-v1-0-8932a885b03d@foss.st.com>
In-Reply-To: <20260518-pr-pacbti-v1-0-8932a885b03d@foss.st.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 11:50:33 +0100
X-Gm-Features: AVHnY4KJRmcjERNiffgoDdYHdUlGdwxutkidaNwXeY929YG_M0Vlg0VGmaz-2xs
Message-ID: <CAFEAcA-EVi2K2=LgZ4QZXoX7qQAg8j7mCphWostTmpVtBzTJvw@mail.gmail.com>
Subject: Re: [PATCH 0/3] target/arm: add support for Cortex-M pointer
 authentication code
To: =?UTF-8?Q?Torbj=C3=B6rn_SVENSSON?= <torbjorn.svensson@foss.st.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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

On Mon, 18 May 2026 at 17:16, Torbj=C3=B6rn SVENSSON
<torbjorn.svensson@foss.st.com> wrote:
>
> Testing an arm-none-eabi GCC toolchain using QEMU gives unpredictable
> test results for some test cases. In the GCC testsuite function
> check_effective_target_arm_pacbti_hw, the testsuite tries to identify
> if the target supports PACBTI instructions. The test consists of:
>
>         __attribute__ ((naked)) int
>         main (void)
>         {
>           asm ("pac r12, lr, sp");
>           asm ("mov r0, #0");
>           asm ("autg r12, lr, sp");
>           asm ("bx lr");
>         }
>
> Running the above code in QEMU will cause LR to get corrupted.
> The reson for the corruption is that AUTG overlaps with the SMMLA
> instruction, and SMMLA will write the result to Rn, that for
> `AUTG R12, LR, SP` happens to match `LR`.

If the test case is expecting to be able to run on any M-profile
CPU, this is a bug in the test case. The AUTG instruction is
specified as being UNPREDICTABLE if the DSP extension is implemented
and the PACBTI extension is not (and to UNDEF if neither extension
is implemented).

(We could consider making the QEMU behaviour for these
UNPREDICTABLE cases in SMMLA etc be "UNDEF" rather than
"write to the PC/LR"; we choose to handle this kind of
UNPREDICTABLE decode that way for other insns already.)

> The solution to the above problem is to define the following new
> Cortex-M instructions in QEMU:
>
> * AUT
> * AUTG
> * BXAUT
> * PAC
> * PACBTI
> * PACG
>
> This patch series only implements the pointer authentication code part
> of PACBTI. The branch target identification part is not implemented.

I think that overall we need the full PACBTI implemented -- we
can't advertise it in the CPU ID registers but only implement
part of it, or only implement it for user-mode and not for
system mode.

thanks
-- PMM

