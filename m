Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0732CCA470
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 09:57:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v64RR-0001E9-Qf; Tue, 07 Oct 2025 05:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64RR-0001Da-5W
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 05:57:09 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64RO-0003xE-B4
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 05:57:07 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-63605f6f64eso5329743d50.1
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 02:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759831024; x=1760435824; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=QCv/b3d8k5MXLi2MYer4Dl7hAiDFoTI0dqQOpJ+CSSk=;
 b=rvVQyfryib/DxdsVhrlvAoUdSYgA78KKSky7pj0aV/9GtQ6CVcQKEnilXPU2dvhdxE
 742Cuv363k/K6t49XZ1/k8/tcUG+IbwWm5M8Qq3at+qQH2n+iXhRLH0OWLDliax1/X2F
 NzFZoLH5l0jKkawWS8h92TKbdiptOc8iyCbAAgFOH9c+mv5+pxUA1Ua55E5uGuX2SK8g
 ee8xw+L8rHXjYQ3B17+RLmtZxCWs10Rkz470UPN72aZKVZ9X3Phtri2o1G8BdfIH9PoL
 7SyHEKJc9DKqgcnbakhRFeud2IDPN4S4edthk2LodlX5qeZxh/IAwogRQMdA3TLPMi1k
 jTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759831024; x=1760435824;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QCv/b3d8k5MXLi2MYer4Dl7hAiDFoTI0dqQOpJ+CSSk=;
 b=jdoNt6GCqRqiDjBfkzN+kVZq5+xPwgcSOAcV+Kyh1ApfhkiwTjbBeDSpLraYiWM9xr
 9ktWkJ8QGTxcfVJAkhw5oVM7OQ9HpmOZazWgXoK/lyf0AikyJnzMS9mzNZMBqopan9V9
 aWHiAL3tB9NgCLWS0N5B3Xi7JeVulVJMhsc9zvgkErQwhn/WqCv671scFijuO0ivQc/s
 qXK9VmdbBEH12/ATKXr9nz2nbQbLDC6MN1SEd4aOy3HoKoBpP0TaOTN7cC6tlHYG1J1O
 W/TJwVniE3XcsgPwASPaMYHdM3B+9ovsEA0l3W8vdA6mijhh3pGEQ2N01uqJ/xm9LSxP
 qFRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtrtR/Gf2GF1Bux8dz03S/c1Apa11jAeDMtKfPL4tPcis7Y+5q2Y0cyNv7wfU3WBXItqAQEcesGA==@nongnu.org
X-Gm-Message-State: AOJu0Yyc0bTj3tExiAVVfURSCimjFKnebq1DNn2zNi/NxQeV5Hy1x+ja
 atAiIdWwHi0EN0x3U9acxuSnkbOmiH76/6Z5aABKXTJ82IpO7B0FuZ/jKdMhApI13s4uFlC7dXJ
 WPvEfMBf7IVS+tMIVA+UuWnwNVSyF6BqIjaSo5KwYzw==
X-Gm-Gg: ASbGnctzePBusmt7Pzse7tpZvYz+mDnOYI/6URHe5FugtSavrVHFpsqA2RRjmXKP57b
 kLEghKc+ow2mupnYNncfLHhXzZ7p2HSXmX378i2M1r1OaBM07rx7QS4Gp5keV8x/13S5muPqiiI
 owZJOImsMncItv1iaUkgSxMLh01eOeReywjakq93C7IFPwZENSybnjZHnKd3wUyGrUiBOOTq2OS
 W1BrmG5oTDHg3Xti/yNguSzBDguN4f9jhqABPUtp0cnq1o=
X-Google-Smtp-Source: AGHT+IG9AAPM/O0uZO0ds74baGvZNzJfpqew/1d5uWlSlBo9YncfX+qHJs9IZhNju8S57Pec59LeUhEPho30ENWgvCA=
X-Received: by 2002:a05:690e:2441:b0:635:4ecd:75a6 with SMTP id
 956f58d0204a3-63b9a107d98mr11647329d50.52.1759831024317; Tue, 07 Oct 2025
 02:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251003170800.997167-1-richard.henderson@linaro.org>
 <20251003170800.997167-36-richard.henderson@linaro.org>
In-Reply-To: <20251003170800.997167-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Oct 2025 10:56:52 +0100
X-Gm-Features: AS18NWABbsEqf0IIUCQPZeBGa3W9vevYnQLUFs_sB9Xrke9HY5-cGzFEcQR-W-c
Message-ID: <CAFEAcA8cz6nuaswjqAcHTA88NTjc38qwQdf=ipyN0xA=crE2mQ@mail.gmail.com>
Subject: Re: [PATCH v6 35/73] target/arm: Export cpsr_{read_for,
 write_from}_spsr_elx
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

On Fri, 3 Oct 2025 at 18:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Move cpsr_write_from_spsr_elx from tcg/helper-a64.c to
> helper.c, so that it's present with --disable-tcg.
> Declare both in internals.h.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

