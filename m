Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp846957njb;
        Fri, 6 Dec 2024 05:34:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV3KtwbWEaJdOepH2nuvIwmwIJ9hUYoGjoRZz0JppWC1neyxQhCqEzoty8Sguh/P614PkW7jZQPcPinfg==@linaro.org
X-Google-Smtp-Source: AGHT+IEqnyN7hqCasFi7d9SNjtI/gxEEEGtvbT39m/4bRuvzHNvJyHpmJmHf5BJn2gPQP1Pk1YTi
X-Received: by 2002:a05:620a:2b85:b0:7b6:773f:4bd7 with SMTP id af79cd13be357-7b6bcad3669mr407352885a.25.1733492043417;
        Fri, 06 Dec 2024 05:34:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733492043; cv=none;
        d=google.com; s=arc-20240605;
        b=ChI3jedrc/BWPqiqJSURvbZUvsnld2M6U6YJ6gBcxXvhfv4ytguxfmaRij9CrlDvTm
         4Rt0ew/wWebX1cGlyYb6rrbmjrBmyZzkfcBMSADVspHfBKCwQHjQByUR3kHzd7LeQmBJ
         H06nyycBpLBktH/+pagqS+LN2f0bsOkV8zBcL6bREpew/F0JCiaJnOkn3kbtTzmxpIvs
         vefyRMi/ZJXDIGZGxSnZLzT509dLuPb9wK1aGaXLVTI4I+6BBhDXfZKPZeydCicKPXmx
         a2KZXNQdBflXwvb9wV2pMUtUQKKDxG8eaIZTutIDneRhNOYI6vYwFYQVn4ysxU9goVKS
         GLEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=2MpNL2swcGGFC4JX/uRm4AT+wBWDQnwQyVZO+4oHt38=;
        fh=qSYfF6b49ZHNUfhg77hHw5d+D1CPemsMKkGZCtfEXzE=;
        b=QlCQIUitF6IOJI5TsY5mgSshlJZPTCGb2gvaM7A0/24mh29kUtuedg3sJqWWjP/m3F
         aMjN1Yo4pBtRvmXgnBLeYdEIGDk8ckMJR3vz45gv0pO+xXk/TyMDRhLU+cNRuRUhuz9T
         f+8ujS7xzlyGoIO+QkWO7qFcJwv2MGwHd7/WZDvargfpRGCBH/h9GP/S4Qrag+qMcuDn
         bH4PUkqcOVU9Zign6suvI/nJyHwyFa2VVdRtobb4lrKt1274RbrDBH9nN/jUA4vdzreU
         xtzKu47p6XeKHjsbYba5JyUsP1tQoT0MBhfCKZH/KTQdxjilW6hqOAycP86NaHRa0poA
         +uBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eq5wQKmm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6b5abd80dsi416047785a.575.2024.12.06.05.34.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 05:34:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eq5wQKmm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJYSO-00015a-IO; Fri, 06 Dec 2024 08:33:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJYSL-00015B-K4
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 08:33:17 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJYSH-0003VQ-KW
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 08:33:16 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d3bdccba49so1408955a12.1
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 05:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733491990; x=1734096790; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2MpNL2swcGGFC4JX/uRm4AT+wBWDQnwQyVZO+4oHt38=;
 b=eq5wQKmm7R+T9F8BAtFVFc4X6mVdwfOpktzzC/P6H4mbkZ9aexo6hiZS4gzz/fqfiz
 IhebYvzroYYqTJ9aQYZBq97XhvNlC6EIPJfZPhX7pLgNLpd5EArj6sXBpstNsciKt7RS
 +c3yfhXkHKuRbJmx5ALW4zQK6a/FbVxTTp+t2YdPVjUw/ycAv6oohQkIRoU2lnRFK/df
 9J3U8nydaf9leyMrGLA6fWvhu7TQI6yzkygZc6gzmOGm4xuOoz1B9OEuOqNhRYLsujuU
 oypBR8vEOZV/u/V/hdnfaB6nyhS+8uvnbZRsDOXhdyqN3a5PY3jf6wf3ihqPCely1K+O
 e3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733491990; x=1734096790;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2MpNL2swcGGFC4JX/uRm4AT+wBWDQnwQyVZO+4oHt38=;
 b=pTGUbUwLNqtHcDzV24eR83Ocb0GX4WsrPcignXQriRTV2sOaHBbu8Amfki3K6r/WKI
 DZ3p8S6wLNo8Gp7xQJhWLlnqrdoNCzjYZqJHXUnm6MLCWhGa/YcHgSVIGz/Gmr2ljujs
 +8SYiVnRB6MePhm8Jv+uwE2IllOm7Ac1EtLsve0rQPI8zGSNYW5Cou4OEhzpSTGoIm/i
 RL9WZ9ENhYn6wFE4m7RdIgmEMefMaHVCZQsM5dUPm9vSmJ2x86uNVN5bXmAcpNshYTJ2
 3n8Qsm7HlkY6YzW4wAkwmy5ONl+0LqOLFreDA1ZRxuqeaP6qQRn3PT/CrcAFLLupMBGE
 iVhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0sxywq1M5gPrt5YSNRyFaEWzR9/t14MW8xYCj4SaADu1/PgKMWlGUcMoXLqoMOXHjwjNRwLaMgA==@nongnu.org
X-Gm-Message-State: AOJu0YwJk6bj1luIhIE+x3Ac+JNQi4/jlNwwlBD0ofZ6SZgwMc//7BXV
 fPkxecNMknfHwAbP5RcsesANAnFja5suvk277YM1SDsPg7aFplmkNjqPdVgeIfAjJpux+gRc2ME
 4tQK4yFt6q1D+qQnecojKUe+XYuJb7BExqZc8OgAhx7TWXcpW
X-Gm-Gg: ASbGncuOVyEexVyACgkujLHeXL7YQgoybI/GFEif4n1q55ad1BiyziHn9FYn9AECtCZ
 HtJdB9m+FWVGtkv4Q/aKqV7WfuRbdv5CY
X-Received: by 2002:a05:6402:2696:b0:5d2:719c:8bf3 with SMTP id
 4fb4d7f45d1cf-5d3be67e27fmr2603369a12.9.1733491990008; Fri, 06 Dec 2024
 05:33:10 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-31-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 13:32:59 +0000
Message-ID: <CAFEAcA9=m99r9yaL_RrZ-W6Qh_LpJFyJ2DDnaFrR9RXT3G3ybw@mail.gmail.com>
Subject: Re: [PATCH 30/67] target/arm: Convert FCVT (scalar) to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Urt+Doyv0r62

On Sun, 1 Dec 2024 at 15:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Remove handle_fp_fcvt and disas_fp_1src as these were
> the last insns decoded by those functions.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 159 ++++++++++++++-------------------
>  target/arm/tcg/a64.decode      |   7 ++
>  2 files changed, 74 insertions(+), 92 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
