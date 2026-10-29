Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B2F606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 16:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zyrp+1O/
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMT1j-0006zK-Hv; Thu, 29 Oct 2026 12:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMT1h-0006yo-T0
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:30:54 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMT1g-0002QO-5p
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 12:30:53 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-8ab432273c5so22845037b3.3
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 09:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793291451; cv=none;
 d=google.com; s=arc-20260327;
 b=anBP0eSQuZO77536j7rXQdSd9VfoHZr6xvGLtKlVAccSboOZ7tY+7efxpTbEOuelr0
 M3stPntNEAexc3am6XbMptWAPJcbU+4zpeoJqV2SHo8NL4ZiXet6xch/BilN2vQdnNsp
 diHaEKvoAU1QOdFrnKA/0DL/bNihALPDL5X5rLcrtKPFC91h+AkK7uXJ5JkHUccO7cWK
 vtz/rNGU2SKRl3BvaFPksxXhhwre23SzvzUP9U0Ys5FsVZpv8ZcxC8Y5uHVukQbOMFfU
 9hmfO5hegX9Yhsue0nHATgUWnvXkcCK2IwPXZr0HizOcKVc3oYA0dLDY9OsWIepoU5AA
 Lhww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=ALQagMtWf7GCqJQAFi2UBRYxmhKmnnsb9HsHQ+zOXZw=;
 fh=rvmK34B7axGAW0O0qyFvJoDDslcssLBYvqSBgAQ4x4M=;
 b=gHQ9zOtRdOtU4snd/wV5MmRUfjj4sfN58DdacgIESPBkp0gjuCiim9kKLIVWlrSUoz
 11RgL7/0ZncgNlfjBJWIyVn/5t6Z64+PUGZfhpWJOZe/TNO7WLSANBXdMhQe+NukU2yc
 G41lXwnMxr+5ZiXLzkZW7GnyEKkI3d4ivZaTNJUIHhv/40OWSGfwTs/jYmdLJJ20kboy
 S4RRhKZ/mYc06o3d1wQV969gs3dtsgXHY3UDXI7ftV+c796mflHF2RrP1M+EsRN9kqOy
 Ghwq7uwdMVJKLW2+uTJX9zeiyEsCMhVmONPY7RySUp/jlb+Z9sVlcSkrzqmtuuZ0C9eT
 MEKw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793291451; x=1793896251; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=ALQagMtWf7GCqJQAFi2UBRYxmhKmnnsb9HsHQ+zOXZw=;
 b=zyrp+1O/t4hY1uoWAOub10z7SO9FAXG2/v/yck1et+G9Q52ogLTY3nVt1vbpjfnNVk
 x5kBGq87DCWE43++JxbPfQgwNZBEqew6HcqNYDqPF9XcnTP1Id3XE6AzEz/ukebrwPDp
 f1PRnLBfHhXtVpu5V+GifxQ1giZjf9t1FWcgRnq6B/q7xItwxVOyDKItNgCU0s2EUmBX
 lECoJ59VbBo6pEkmUAWDNkLEp26mhZ4OXTXrxiuW40DvmHsK1yot46jKa00j6we4MBOm
 0as2ZUEQbBVZpeXUvuEvOf8cJnKGK8kUaL3cOGTEmCgo7f+UtSH2pnM82ZvCpvWk39GM
 NFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793291451; x=1793896251;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=ALQagMtWf7GCqJQAFi2UBRYxmhKmnnsb9HsHQ+zOXZw=;
 b=rmyb0bMUL/WtI/zJwde42/YeC5+Yk3S9/8OsXbuswkGbVkoh2Oa2Kkb0RkA/O0If99
 /Cgh9walfvw5ozAtCCuLkmomYqLujQwgITZ1Q3G4LHJiYm1z1ND9o0mwU72veRCMANC6
 7Eg+DCNA9pjID/5vWd9A+y+P8YFR6dvrY+ZZ1goizOFnUgVuJHf4IWss33qp4rzfk9fn
 qZ3pkAu/9zdAE/CGYzcHjastOXWlqd0lhg9EDWcFBsG2l99p/AG3izQGnnsBieCYV0N+
 YebX5Yi/8btSpV/qGBTPQPwP1jtD6wYS7oSDvJBeA/cCe6rlsbr20TP9oyevVHQw0UKF
 lZ6w==
X-Forwarded-Encrypted: i=1;
 AKwUvBzr3Fipt+2TwVHsXz2AKdGIu2Tizsdayet+Sck+856Cf2izCazzwtBe6S7phFJQ7Mp730C/L5BSnw==@nongnu.org
X-Gm-Message-State: AFq9FYIEKKSgfHtblkNCthzPH3lJTPgLnddEphT0eWXvsPCLroM9/d4J
 tdMlPpYzvpILJ/Ty+VJU/n5YTEc98IaQtFRV0l/EHwLWQmJCbQ3zTgCEHoSyX3MXMwSZC7LVqqw
 lJ4An8W61tEswz5jAEEeZNzi8e7AhA2FL4VDoZsto7Q==
X-Gm-Gg: AYBFou1aymdSK73zAwtZzNotbV70BH+cuyF1ZCNROSgnjipDyavmfzk+Mbr/wbMphNV
 wIiat4s+42tv66mZgcJUX0vaMfq+QCdGnKSjRaW+PIojz7i5buX/TDRZdU/I/WvcA9f5R757u4V
 W/sp+yoxvXV9HAl+KoXXqFpwyy7/cNJJOY5hXNNttEQkQv6MliWLHPMHytJnlBloYZVieDS8HPM
 4smYEsxR/dM04a5a48gpUQFSwMgBrD9SbDExh1VZ1+mIzaO/8s533RAU+bG2V+DumUC+A+DZ9T0
 bMcsLfDxSc4SixplHUNTrCPjpeZ/UoKZEtBYTREKjigX/s210wuoARy9rlJlsMXu9FFEg/FcVA9
 5ge3CsuV5bjFvGEfo3UrUjQjqw6HG/a3gIPqTXXIDzgZP5EXORQNDL8GK4S3rhfj71IwH7bNh2N
 wM5A0LsBBHoiWHKvZAiVXj
X-Received: by 2002:a05:690c:a:b0:8b0:9def:97ff with SMTP id
 00721157ae682-8b1b5d0f34dmr48524777b3.46.1793291450790; Thu, 29 Oct 2026
 09:30:50 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029161310.2065290-1-alex.bennee@linaro.org>
 <20261029161310.2065290-6-alex.bennee@linaro.org>
In-Reply-To: <20261029161310.2065290-6-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Oct 2026 16:30:38 +0000
X-Gm-Features: AclHuK8fuI1RJkOglTAO1LqC0wX5xGGaemm5802pAkywOTpuW7Jpk3tVMWp5R8E
Message-ID: <CAFEAcA_n38tLnwzwNpOaQjoa92k0X0_zwtvzZ-+j5H5qvXKGbw@mail.gmail.com>
Subject: Re: [PATCH 5/8] target/arm: simplify wfxt_timer_cb to only trigger
 cpu_interrupt
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-s390x@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, 
 Chao Liu <chao.liu@processmission.com>, Tyrone Ting <kfting@nuvoton.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Hao Wu <wuhaotsh@google.com>, Halil Pasic <pasic@linux.ibm.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 29 Oct 2026 at 16:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> HALT_WFE will always be cleared when leaving halt via
> arm_cpu_leaving_halt so we don't need to worry about atomic games in
> the asynchronous timer callback. Furthermore, a WFET timeout or
> event-stream expiration is not an event that sets the event register;
> doing so causes a subsequent WFE to wake up immediately.

It is the case that WFET timeouts don't set the event register.
But an event-stream expiration does: R_XRZRK lists
"An event from a Generic Timer event stream, see Event streams."
in its set of things that set the event register.

thanks
-- PMM

