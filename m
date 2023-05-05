Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp376013ejq;
        Fri, 5 May 2023 05:23:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ784Wp2kFaHp0pI7LJIkW00NlS0YXuF+qpZ3WhgJUxQFNW2F33bMjvbul82sZriHJnyPGbB
X-Received: by 2002:a05:622a:1baa:b0:3e6:4ff0:ef0a with SMTP id bp42-20020a05622a1baa00b003e64ff0ef0amr1973473qtb.20.1683289419791;
        Fri, 05 May 2023 05:23:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683289419; cv=none;
        d=google.com; s=arc-20160816;
        b=dRJLxOe9njJUjxyq6PXQEtPlK16sN0nk31HK7t6hxs0R9La5DeC5tO7CrHtG81V7rJ
         WzU891WHGp0LcnNoWTN3ibsPV4UPbIMdq2kdT2G8aYU86JfmAJpYIm26E0elraVMirj3
         6RgMjwJ2f2B5liEmjfqMSxFtP0Owi0ESXvINz9m9M/pI6Czuz7WZ6Pk0Ihwye22YtuW+
         NCOlHRB7nICvICq44Dr5tRP/QJLSPEG+p503+I94fyRsFCiIPh9yZpyucTAyppgT+c55
         wyZIWzbXYIgMXjJONw8FVZb/GP64/SkrZx8glLGUUEOp1oE3pqHVQF1yt2VowoJKaeI0
         /sNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IDXqtmR+rJjiu+55yNvHJbdVtRbZgI4HnSJOWQkinNk=;
        b=iySpuxDNuWe7v1T0WjauTgYnEHz0atMgwlCNA5E8BnvicgjIh3JkusUovZZXQodFrN
         GDE8N2qR2D1/hGIbdE4j0XA98nFs3fB8cFbM/qAtbp9L6+RAkzZfWa3qre2IjdlkMNgo
         0x/5JP4Aaa3JQ/CAbbcHP5bre4tIBjpFg1XT3nsmAeG7qpJaAcvrpj2udIQPyHkGixZZ
         63L1pMtddH6G92RTikrfzeEVc5eymgYhkCA6/xa4DHyYTQvA68VxDbErkzM5ixzHwWHj
         9wfg/681yZz+5qMQmvdrB9CE/7+q2E7ch9ZK6wfkdF3lICCUwImuSkWu/t+ESbetgArC
         FTLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GUsFqNHF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11-20020a05622a148b00b003ef6e84ee79si506074qtx.775.2023.05.05.05.23.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:23:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=GUsFqNHF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puuT0-0005YP-S8; Fri, 05 May 2023 08:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuT0-0005Xy-1o
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:23:18 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuSx-0000of-1w
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:23:16 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-50bc22805d3so2623684a12.1
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 05:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683289394; x=1685881394;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IDXqtmR+rJjiu+55yNvHJbdVtRbZgI4HnSJOWQkinNk=;
 b=GUsFqNHFyKGoEnkKxLsJ6s8OL5NTIJgppsZp9gwi0v5+3WzfgBDinL8bM1AKLT2/8A
 wAKuZkAxj2sKfBJemzkm5gbfv1XQyL/Igjgn2plKnXOnvNL255ywmR2u0cdSwyoDC8Sc
 708tyvP71DixPU4iqkaEOwA3drrrZ6IlMMThRv/7LLBJwd3jvCXfHY/Fs6FpYp2MCcoN
 1v6ywPNZAFCErGclOHcM349+U/4NHBxVdmzH1Xtp+Tegb9wkcTDyuTTtpfGskdzaClrw
 LSkdEoR2Vr4ewkMr6uHXRm8cV6HCIRp8S+ZDF/pg0V8w19J0fl+ypftNaQdEyirQmV+u
 TX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683289394; x=1685881394;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IDXqtmR+rJjiu+55yNvHJbdVtRbZgI4HnSJOWQkinNk=;
 b=TfzhZsY5p1YZ7SH9riEvTMfGnvFZ4I3kYypkT+tPoA8KRHk0kDtT8dTsBj88dRqCBt
 akx4Wp9UwkK/v/6Yg1FgbpA53EBFYKrTbnMd0iJU90ArH382Ks+bpzs8wn/RJrJe7jP7
 hLjm4VpwGe872DjA30Hr0rBC3N7yAFB0j4jRzIV2DJIPggxxDow4EYYei7gxgBCPCL0R
 aXLzS8FMHWM84JIEUNRqscWNytGtok/NVDdAW/067P6VdjoyBhrcqf5R6pWRVjQKE1Xh
 CXNw34QsJGgTvOdH4dQMMPnLck0zV5fq2scwp1r71ysMMyYYfjSI68jxGBvLd6AMjrXH
 0KbQ==
X-Gm-Message-State: AC+VfDwjib5zvjKD8IAf1kDo9rFPgsXXY0RjKA1L9JJgKZjFUaF15Juv
 3hzijSg18C24cHHXffkG5Ju0IevMd+SQkB6aAbqZmw==
X-Received: by 2002:a50:fe8c:0:b0:506:ba8d:c317 with SMTP id
 d12-20020a50fe8c000000b00506ba8dc317mr1176747edt.40.1683289393705; Fri, 05
 May 2023 05:23:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-34-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:23:03 +0100
Message-ID: <CAFEAcA_yDGUbcHZskE_gMtPsMU3ohsNCo_=3ZakUubZMVqXM0A@mail.gmail.com>
Subject: Re: [PATCH v4 33/57] tcg/sparc64: Split out tcg_out_movi_s32
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ChqUt1qBnX4B

On Wed, 3 May 2023 at 08:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc64/tcg-target.c.inc | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
