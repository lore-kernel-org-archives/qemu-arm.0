Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB37CCCA470
	for <qemu-arm@archiver.kernel.org>; Tue,  7 Oct 2025 10:14:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v64hv-0004ke-0f; Tue, 07 Oct 2025 06:14:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64ht-0004j8-38
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 06:14:09 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v64ho-0005iG-Fc
 for qemu-arm@nongnu.org; Tue, 07 Oct 2025 06:14:08 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-73b4e3d0756so66667397b3.3
 for <qemu-arm@nongnu.org>; Tue, 07 Oct 2025 03:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759832043; x=1760436843; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Lmw9oNqH+XtpMGrI4OCMpc+B/lFVCaHifFsmGCJU15k=;
 b=nul+6O3b77HOLnnxaarZgf0teDXk0GeWaRhhk09GMsljb5/YXdiGEevp8ztVT8J3Du
 x22VfQPAaO9qOkJKEmskNctwzLp4KcOvpJiVO3OUB7VIG1zsZxkvFOkDOwf/vU0dG4sI
 TKPF40kHOvkM6LheF7bqnFijFm24z5RtBOfSfdHM4r2p/ZhLb8GK01OKQ3tN/DZ9GnoU
 YAbNqZqEOa46oR9nYsJj8jBvCT2UZaxbYHbghL9Mhmk0p4il5SWLsal/Nj0pDbV8BdRi
 pwY1+9mmSQ52pyuaEDhMn4WF1WVh94rx7329ATJGEdMUAGDajhqU6XFooHDIue354yqI
 ry4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759832043; x=1760436843;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lmw9oNqH+XtpMGrI4OCMpc+B/lFVCaHifFsmGCJU15k=;
 b=K8AmtcQEWw09NTUAF5MVZdLWR0N19/rUAKr/Efob9xFL1PAqn8o7EkHui/RSZhwPTJ
 iZKJbv6uF4coqiy3uFk04gXvdGbcyUIcGxm+HVd289IQDKh3n2V4e8sxcOol9KZKQelJ
 zlqX6r8fr5KXCQuB1EjKzKcCN3i3azRlEfjPcnnYgc7VOHlztFqG/F5z0pS1dMmctbZd
 VL+yFP5pkDpyB2U0wowXU+mwJss+M1jMjwQEle+zIXh5maHbPKe0EaeU5PkAXW8Co17u
 hs+XDo/Sj8cZnHcOETRcj1RmwKiByI1fBc7aDKKbLvPLW79VfHNkyWqvag9U9fkexFCH
 x+4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMqycxVJ6OI07YcEyJ4ii7UfCrsjAtgUygeEcBrSNkGeMyO7Mw+IkmGX3cYIFBg850up0gYJGtBw==@nongnu.org
X-Gm-Message-State: AOJu0YxSX2Ry0UhWYR1G8MYQ/mrp26u6vKmxeh32DI3LxZ0BXbY6p2qU
 LDzZRX3Zrjmf/8V4O6vHQ+4ZBJS6TDOW84TP7duce59QCvgKQgfvL0K551Ex+0T/s89I3RizpBs
 wpUP9Ef0XrYN+5+UYASq81xaLAj3qz9dfaNSxoLW3kQ==
X-Gm-Gg: ASbGncvFCWfnaSCeIl8heej1r4xXIqdyR+lg8I+80VlwDPDyIQZJOvYE/9aeTDniwkP
 7/XFcW1bnYBuemtCY+ebnrpa2kxwJUCKu0Gk1Tzm5tI+qgEGNCoWV4bGtLwvInB5oCTmRIZQ9nZ
 bgRw7sYMXUWwWWGfgUfF2zf4fdhi7TpLf4KTbPvyGLn65e7ABAlar5uxo2NlafS47ztcOsaUInz
 63ex+A5Die7rbOOPxRxyTW5RpLyBuSQ/kqw
X-Google-Smtp-Source: AGHT+IHQjobAFVtUBcS2WNHFU5GOZNtwpOrIOuq68I3wExZ8bKpbjVVqsWNvyoMLjRARpNrZ/m+V8Inx4JOuey/yVAI=
X-Received: by 2002:a53:d98a:0:b0:636:f1d:e26 with SMTP id
 956f58d0204a3-63b9a0e2b15mr10264697d50.32.1759832043015; 
 Tue, 07 Oct 2025 03:14:03 -0700 (PDT)
MIME-Version: 1.0
References: <20251003170800.997167-1-richard.henderson@linaro.org>
 <20251003170800.997167-40-richard.henderson@linaro.org>
In-Reply-To: <20251003170800.997167-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Oct 2025 11:13:51 +0100
X-Gm-Features: AS18NWAXsHIiaMRhNi-XBWjB7ZF_LIqjhVPVju-BIS3tPtAa6YlhRo-xENwVEHU
Message-ID: <CAFEAcA_=eh9WAFBwRbwLOCWfjZQbzPRsSeavXte9ZfJXB1mJyg@mail.gmail.com>
Subject: Re: [PATCH v6 39/73] target/arm: Use arm_hcr_el2_nvx_eff in access_nv1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Fri, 3 Oct 2025 at 18:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

