Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB0AC43458
	for <qemu-arm@archiver.kernel.org>; Fri, 26 Jun 2026 12:59:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wd68u-0000nV-F5; Fri, 26 Jun 2026 08:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd68Y-0000eJ-Iq
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 08:58:28 -0400
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wd68X-0000hK-5v
 for qemu-arm@nongnu.org; Fri, 26 Jun 2026 08:58:26 -0400
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-66481f17a4cso958661d50.1
 for <qemu-arm@nongnu.org>; Fri, 26 Jun 2026 05:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782478704; cv=none;
 d=google.com; s=arc-20260327;
 b=E/TvSUt+J9pZ6agNA0DoV+gfIdCi05ts8W9WUX5bDqiPULylxvBkQNA+Xin83i16LN
 ++ICgeK3tNkhjzTKKQlVdJw+aNJeY1gusr/iPHqwHJr59WjlM5tqLkRnF2RqLZ7fQtfc
 AvywyIkr9/ng6AZOZyIyYlO5RNoDdsKcXKZhSj8DZj/v2Dn0+hpmfPz1cKGnfCDbZJoq
 pPzNt/WDuSyPzka+eqOLUV2R3wItuyYJGszzUkX3/dp+eAbXM3MEUa3MBQwmAi7C+IXI
 6t8HNpMMlgJTAtM1CF/yOYmQxG3iwBDySolnj+y4OmeqNL3VRoxhUToMZe7WDxpzR+vO
 GpLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=8VwcliHq8xl464nnWTtg3JJJwkYrSrQwNu9NWItGi6w=;
 fh=zv/Zjlg1SeXnj6Ye/e6y5ecN4eoRVjj0joO9EmSFqMI=;
 b=ds/YAGK6yz0Lm27GMSFfThFW0z8gJv8MCWaCQd/HSSuZ0ZcH5A1BvuYutSCqjVZbtJ
 qXWm56fGYeXh5+43BTe/1VZvxXczsvqOobT1l1gxnJGd/yxeQw5mcLLkXTWf9q8fpW8l
 2BDB+T+tP7763BfEyaUD0RlNa/rCdOS+ibhw4CoA6UOF6T9A8B+LbELJOX1BYSuwiDFc
 xfx1Xi2HDKIszEZHg1IIr3vauWaR3kMNhe/kK+tv//x8eJQkDmQXQb1LBBtcTX3UzKjy
 hY7egj/n7Hhhjg1dG7+xEDvCi37e8WDczctPl8vuYIYFu86clZ+pOUCyXbXf5Khz+mfY
 elyw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782478704; x=1783083504; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8VwcliHq8xl464nnWTtg3JJJwkYrSrQwNu9NWItGi6w=;
 b=pai82z0qrtwFOrpCwxWyCgcCcn0QkPULp3Ha5+hoIbz3+HMpLYY3v2qMyH/TgbaI8W
 iZQzLIYHTUv4S6f3B7kJIKaNThf4rmU4eokL5Hei+UwDpPsQhGYPwMsNtnYemZnoH3sW
 W+uttUuUxkd7rCSDxnDNsKa5myMBUjLlcaqQ5hh6nu+sxieQ4tRPSEM3vdBGDwVOj7lX
 WQeAR9Rlxw79MZ24cdw41Cyq+N2KkQqBvdS6VCwtaeOMdzE6bo6LYGhWZBeoxdQwUgNf
 qHvHea4fFqhitYXhluC2pbnqcAvwdBRCWcmBF7l5Oi6w91tTX7jcHEj/3gwWyv6US1zt
 Uw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782478704; x=1783083504;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8VwcliHq8xl464nnWTtg3JJJwkYrSrQwNu9NWItGi6w=;
 b=bGqekjaaOMaiqZWLWNf83fh5M0UREQSWe6jsRjZL+w9wfH+dqsOt9Nj4tib7gS7LTy
 0QSJLKyY+YQO9LMwJciA2y7cb4Xnfl0dUQdjWpmdFkCbhtl2BjdfNTIwWHcXeRsi36fq
 GmnqsOufjrU+iUY6R1nt8A8kjWMWeuqEohhGVpPGW0GB7QpjdGkwIOk9Om7H1kaWT7V9
 +1kVGxOJjEriqPZA5wRZfB+ZsYg/ntiB5lRCXe+ZVax/q2Nq9CAEF/t2ZoKB5ViZFYF7
 IwinLptuLCYydsv/ygVVMHjnX+eE6wQTX8eDONkq1b7jUWMfmjlFsFph/42YCQQINo6k
 xCTQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpQYI6vE2pMlg/QUzXfyKVWzrYEmpiD/RioNRT7zCdGCxZx6VdK5opOQDWlXDBqKdlq6dTPmAHXBg==@nongnu.org
X-Gm-Message-State: AOJu0YzTTnb/2sXHSuw5ZM474Oc76NkWEM+0ajIhtHpxBAhtKfWl/sis
 ZJ6liteQNFIdYgM3kJkBIBAalXijqbwGsL4yZrZGvAgjPPQLtylre6HjXAJEESx8dZvFDn1AxuY
 jwjnV/jlr5z69inXBXVVCSpnhJ5UkcgtYI0UczNI7kw==
X-Gm-Gg: AfdE7cnibpZIjMgN0aoOknKdXWdH7S4kep+tTNEQ7s1KMq0i9fKmoh/XGlfYWAgSdYQ
 botbuV3arOUZ4BjwcZTi8cazDNuEtNHZzwil3ix04fxGulDuiLWIvdV36rwlmL29l7RwolK0Cok
 1+llzEDM5VfPLxgC+0/Qbu+qFSbuv9Uf3VuGUFHxV2lDmGHEI2DRwpP3DtXmdpss5Ta9awSoRc3
 xSTjYeqNl18yzLCODFpbmvPF/qKNlg6Ub0tWJkwU29iqSrJSiUoldYHe+MXmyCPf6K9DUs45whK
 N6cDGryHVnCAtlLsjX/wHy47+oDABxCtWY/K8MRUEGcgDBu50bpfqPN9
X-Received: by 2002:a05:690e:b41:b0:65e:3d3a:de1f with SMTP id
 956f58d0204a3-6635564cafamr13063010d50.26.1782478703928; Fri, 26 Jun 2026
 05:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260625223200.763198-1-richard.henderson@linaro.org>
 <20260625223200.763198-6-richard.henderson@linaro.org>
In-Reply-To: <20260625223200.763198-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jun 2026 13:58:12 +0100
X-Gm-Features: AVVi8CdUu-sLfl1QJSF6_wUFzbAnZ6KEGwb81dgtDCHUXCmOFMcHRgTQiIAY-s4
Message-ID: <CAFEAcA94EZ=KV1baWUH3Q1SGhM0fcXfyB8zU5V6kkr7k3Kd9Jg@mail.gmail.com>
Subject: Re: [PATCH 05/15] target/arm: Implement BFMOP4 (widening)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
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

On Thu, 25 Jun 2026 at 23:35, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

