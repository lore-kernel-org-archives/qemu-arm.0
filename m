Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08125CD5BC8
	for <qemu-arm@archiver.kernel.org>; Tue, 26 May 2026 10:22:57 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wRovt-000889-GU; Tue, 26 May 2026 06:22:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRovr-00087Z-PI
 for qemu-arm@nongnu.org; Tue, 26 May 2026 06:22:43 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wRovo-0004yV-7X
 for qemu-arm@nongnu.org; Tue, 26 May 2026 06:22:41 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-65eb1b25c77so4990617d50.0
 for <qemu-arm@nongnu.org>; Tue, 26 May 2026 03:22:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779790959; cv=none;
 d=google.com; s=arc-20240605;
 b=c9LRNzA5DYTjA/ZbbDrLrRkhWSmhMrK5lUwCueNpp05YGVZ86xGJbwqSlSJOCrvBzG
 e+QaJQ4WX6AXOa5L92fX1nTkU8MgAXDC9T4TOQzxWkx0pA+jw7EASQOOj7SAEr3pX7AV
 qUJJ4frH8nbadIO2S55Hre1IQY2HERROSfc2dYSrPJRnNCdxU5Lt65IicQ6849oW+c6m
 P3tYxsKQNUoQMsGmI8ThRh0z62gUVKexVd/4Nq4brQ5CKKeWqHext3Muwejdb1j8PPK2
 vcHKFTWoNeUZdETayJodPQ5jt6sLzlQ2Md8sZ0cw56t7+TjoOQ3HQ5ta7EUTSIBRj6XR
 FYzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=KaVe5Ybwtsi/RKz9YyscUO/kLPV8SjjWIEwHlS9ZWnw=;
 fh=EV7UCCm8fcPEHjG1U4lriloaVhkLtWkWY3ujlsixeDY=;
 b=JKjXalhXvVzoJs6+OqyotBVIEEFE4TJ2pVzw0AtLZPmHOnRa18wKpSvm6HetqppeP5
 vIthTlk+DENy8cbQmLOOSE3/QeEoN3Nwr2HH5n1Y0szUEKC/suoVcRlJKBQtoab35ERd
 9rmimrcOibNzBQC4YIZdMDd3yygB/agoF1pllNqnLi2aSxK7z8hE/Zn0JxiyXnQJvw4n
 MUPeP5XSMQFXbF+nBjaZguPNCB5wvQATpwJKlAC2KLDi+vJAuGnq8jTW05lkY9/pZLML
 DboAqssBayPvNGzKEnpr4MUOeeIyPOfk8DsjgK9Ucp88FdUtWkx2mhC3YKJKb0ej7gOL
 Bn2Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779790959; x=1780395759; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KaVe5Ybwtsi/RKz9YyscUO/kLPV8SjjWIEwHlS9ZWnw=;
 b=N235Eag2MU6BbrdnHI7C367JNgnaJ0NIqTB6MMTDWNzHPqs/4ZfdTrQYXKF7+aLc9e
 3OmXUnLPXFsPseGuAS8CyFtvQPZPCk2J3LFgA+to5wARHT9c1Ui7HZAHtQIke+YwXDH6
 REKsrf66ZdYMw8q78+dY9Dh+tdGr9LDJTeuSWLyPlh/62C7Bx7VksXwa7XJHKWWUYX6o
 EcyFg+sToTF13TUK9xKGFF0Yyo5txJVq8cZCbHH96DAzfR7gJwsH3ufgw/81GtgzrxqO
 gdRPnHY83Mk3wpS/9dBxmRnWrr51wbwZA6gKtX/GOa6sshha2kmgZrqOJARrK97Sjhkl
 OTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779790959; x=1780395759;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KaVe5Ybwtsi/RKz9YyscUO/kLPV8SjjWIEwHlS9ZWnw=;
 b=poShkVRQTnU8KyY2fFnavzMvY4gR2GJ3bIAyhgsxgRZEg0ZUKlOhIQrpR2xDdz8Cp8
 KMFipUlkDjZ3IQyyV2QM7lNwqNgp/v+u0hyJKPRzHJ8aYk3ISrNr/h3+POEGuA2EzKwW
 ZcbmJyxLWpIbUSXQJUqmbRtFpqUh5alDlsLTSSdVwSkgec4RCSZm5iYKpForVMugPF1r
 kzfoNq6MOxqFJnKN33cPr1qZR8rs7VDHXLSE2uaGFiD6IAULylrzvNsh6oV79v8puRv9
 p4zd0+/wVqXjEH6IB09Ef6HzhHQ7pLjvmLACUwtsH+2zP+hz+UwTCV3CGFHw5CvxoyWb
 rgHA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+7THIfK6asOAYq6/kE91xZ+MNVlab871UMBYK09vSC7eJJ2edoMU5aAYIz1bnRXp3iz0COM43cHQ==@nongnu.org
X-Gm-Message-State: AOJu0YxscD+jhrqkcIUxAultZlZqaUcE36VS8nqnNq+ZfYHHx5P6iPg3
 irBhWqbL8hukh1/Bt2ak8JiEyZExL7pdgPW6ydz3a5Nyq9N4OkVn9hrK0clazbPVRKek1WjhOV8
 ruz+ZFJ3ubaDoWF8Q3MSJGQ8DazZNKvR33uPSOOQNcA==
X-Gm-Gg: Acq92OFAYo8sK0lWAAdJR/wXBj4s1sLB7a8VFXcbzv1QcE0Bxwh7IBSjFCM7Rp0f63F
 I4j1ZHJ6OP3X0pNXdl1gBABSxVhKe1XGkyhJXVzApVew5WySYQyFT7y26uuWhS75N2CVcKDKh1T
 CsQ2wsp3ti74a0tQCeWhbHndNgJNp3qK4ijloAwSaYFZgWFykdjkr08LcLy+eJ24IjMQhM+Z8h5
 NgFbaSofJtUrgk2UlJxucF+0s7chQOdm6NsRfCAh+4+ryStsHD+j5VqUUcznkaWPPujZUH+szeJ
 pqUjw3+tLq8DijKTzsrFbk97/cmpRjtmP3/218TQuGMdu1xyGk9+ZQFE0poRGbQGRzrzQ8OzBwf
 5ww==
X-Received: by 2002:a05:690e:1183:b0:65c:5fdb:e981 with SMTP id
 956f58d0204a3-65ec95f013dmr16368654d50.11.1779790958603; Tue, 26 May 2026
 03:22:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260522220306.235200-1-richard.henderson@linaro.org>
 <20260522220306.235200-5-richard.henderson@linaro.org>
In-Reply-To: <20260522220306.235200-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 May 2026 11:22:26 +0100
X-Gm-Features: AVHnY4J-VHupbhMWI8vSyiMMD8sLQCMpxBjQih7aaB7j_mUHOrDzFSU4eCzsu08
Message-ID: <CAFEAcA9BTe2B=Y=ghOLKXgiB4dHvit8g+LgwLgCZViytcQYYJw@mail.gmail.com>
Subject: Re: [PATCH v7 04/64] target/arm: Implement FEAT_FAMINMAX for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Fri, 22 May 2026 at 23:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

> --- a/target/arm/tcg/translate.h
> +++ b/target/arm/tcg/translate.h
> @@ -872,4 +872,11 @@ static inline void gen_restore_rmode(TCGv_i32 old, TCGv_ptr fpst)
>          return dc_isar_feature(FEAT, s) && FUNC(s, __VA_ARGS__);  \
>      }
>
> +#define TRANS_FEAT_STREAMING_SME2(NAME, FEAT, FUNC, ...)          \
> +    static bool trans_##NAME(DisasContext *s, arg_##NAME *a)      \
> +    {                                                             \
> +        s->is_nonstreaming = !dc_isar_feature(aa64_sme2, s);      \
> +        return dc_isar_feature(FEAT, s) && FUNC(s, __VA_ARGS__);  \
> +    }

I think this could use a brief comment, e.g.:
/* For SVE insns which are only valid in Streaming SVE mode when SME2
is implemented */

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

