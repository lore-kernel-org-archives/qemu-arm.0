Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp1076845ejb;
        Thu, 23 May 2024 06:55:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXCFJg+i5U8wlHNdvKeCw+38P+Aadkd3gjUy5DhIXyy+QZjSztfqqYu1hFCeWh5hLTsEsgrwDj9YxLPLlOovNlypHgtG5pD
X-Google-Smtp-Source: AGHT+IFIgwETrj6xwB43lWbfzF+IEdCfBY7boQ0Vh/GhjAHRKcRiCNAWCQNhlXKke6danzF36QuC
X-Received: by 2002:ae9:f809:0:b0:792:dbc4:23b6 with SMTP id af79cd13be357-79499441bd3mr471577185a.22.1716472552528;
        Thu, 23 May 2024 06:55:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716472552; cv=none;
        d=google.com; s=arc-20160816;
        b=MWw69nOX7qS4NSWd4cvzOCXC2+qruJde0iQJW08L2SUTUDK/qTGC4mPU/X2sBOvzCr
         /5NRMPs8um3kuM/lHHXBtpsme8OvhjTVADh72F+jR1K9Rb+Ok1QQYZF9rT/hIVoqFgO0
         7piH+0qQyhoaZB6weEFXxzd9+Ls6C4eKJQbc7Zx7h5DBtNzExa2OtXwnoA9kzlSpTUHE
         S/vt92/3HFKmfZ74XEPJ4R/yOjs+2NOkuIgOxOCbFEwR9b015Jpq1ACvxdozPKPzG3bB
         rQkNUO76W+ZHhJK7KRiRKAjlk1RD8X3cQpElOq+MopYJ7VbQssMc1KROF3I9nFx+NVRD
         3EUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=eoMDYv6Pr0/M5PDIzOn5GQoV8a+8rzEppAxC02rkN9I=;
        fh=ipJ83sSua0hott/1DoFTl0rZk9Kztj1kvh+XkK3Ifgw=;
        b=zWWraTpdAidyESeDPCKy7jzcpJPDqn8X+or7CZDm9Ap5gFkXH5agPnP9ZDOVYZgJMI
         l5Gb80cDDs7clCAZM142J27ZRPSOOaxtjf2NGG3CAvvbsSsY7fqZS9q1KB5p+A+gqvPj
         5yf/AwP09BiA6/IWRyA/3dtYFrgBrNFn8+lVCdI1DuSX1Qhz0cB2IEGrt9YayQiq8gpQ
         Wd98+sRCrj4O4GViTXuODOk7DeLVyfxE+WXhS1GunAjmDN6AuoiXlHCfSaCDP9diOsvL
         DziHKD70g8e9GimN3psb7cU/nlzD3+1wuGHpFgQHSUPrdi3cqfk23is7F+xnJ6sSLp/g
         k79w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zJnAdjLh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43e3cc57d14si6768401cf.489.2024.05.23.06.55.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 May 2024 06:55:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zJnAdjLh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sA8un-0000y2-0p; Thu, 23 May 2024 09:55:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA8um-0000x5-4t
 for qemu-arm@nongnu.org; Thu, 23 May 2024 09:55:28 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sA8ui-0007kZ-Ch
 for qemu-arm@nongnu.org; Thu, 23 May 2024 09:55:26 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5751bcb3139so9056692a12.1
 for <qemu-arm@nongnu.org>; Thu, 23 May 2024 06:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716472523; x=1717077323; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eoMDYv6Pr0/M5PDIzOn5GQoV8a+8rzEppAxC02rkN9I=;
 b=zJnAdjLh/vSuRNnZ/sM/NvjVnXmOSE2UTbdwI0tZ7cdfFBKbr2tcWj4ReTN0cSPzA4
 P35PpoJq1TcZHWqyLnj9ktQYazugwgEqNR3OwB0kedpR3rgQOPMzGb3ZOR43fZ3OxYdd
 DdeCHhucvJkSO7UtSpKHh8+CjkViVfhUsDcUOBXsk1xTsQTXkJv2LYcGRitbR1bVW8gt
 uKiuKDAaerkAza+p0BUYxgJHAVJ2W2fQqIf/2RhytUU0OUJRaE60aQPehMBv4TICXy2o
 KAKBB01WkYYh2+18tpuxNAKi0j9WiiFxaoSKKkqqtHhQXqs7EKHLUPNYhPUGop0QgwoZ
 sGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716472523; x=1717077323;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eoMDYv6Pr0/M5PDIzOn5GQoV8a+8rzEppAxC02rkN9I=;
 b=c4Ubx5cPFurJlzzjL8Kq5w+SfRBnWbZfDgPHWrv/zPO4BIJBLhXN/+AGSjz6ptBQIz
 rpoCUKc1JscBFUZTzkR7JEU537GTDihMY8ac556jsuzQ6ydGH3lDS/1nJNN2I+5kKBQR
 /Dzwe58yGq8s96k2I/4MabPxeJJ59y99E/rcp3C/+ePejcpoxKO8CcRn+GlE2tyQ7ocL
 04aLd65Lv031FMk/YAQKZeXuyhIUimJgZfo5/Vcgw3YtbkGburuJVTEwZ4WfzhIR+lXd
 JjiroWQyYmw8GvlkyCTJv6RB4FJT6pHdp1lJleqJUpdBMcWgBaPnANNnUqtbRrLODeII
 wh1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTTDZS7OFV/UbKKGexINJwebgKv0egNX51zkmQyWfSHRlfdDilya4AnnqlNt81GNDTi1Ir5ovT52k3ULZEPtrnLHbd
X-Gm-Message-State: AOJu0Yw3giVAN3b8foZ/lXrU0EbRRxRrWAYz2AUjzCUyqX1nAtzVDLkj
 SjKnPbRFtQSKb5sW/lZTHOslxaEBro56uM+kKoy8m8lCp/gyafYI5zfwhpb/8eu2ZREdjfdwRHU
 4daM+YX5OOtH4kBvgdjGQK2i81Q4EXilb+yhCKA==
X-Received: by 2002:a50:d790:0:b0:574:eb43:3862 with SMTP id
 4fb4d7f45d1cf-57832a01cd1mr3130594a12.5.1716472522741; Thu, 23 May 2024
 06:55:22 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-24-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2024 14:55:12 +0100
Message-ID: <CAFEAcA8tdCvbpuyo3=0A3WAT1NpxeWUjD3=K29P3sncZRXFcTQ@mail.gmail.com>
Subject: Re: [PATCH 23/57] target/arm: Use gvec for neon faddp, fmaxp, fminp
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
X-TUID: fId2n9WG6hAe

On Mon, 6 May 2024 at 02:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper.h             |  7 -----
>  target/arm/tcg/translate-neon.c | 55 ++-------------------------------
>  target/arm/tcg/vec_helper.c     | 45 ---------------------------
>  3 files changed, 3 insertions(+), 104 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
