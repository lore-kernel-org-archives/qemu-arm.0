Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp43718ejk;
        Tue, 28 May 2024 08:55:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVjaa2DHi/ocOtS4LYYNDaQpTHqnZIVP5p/7Si9NY7tXGMwDDstkqm/MofpghwDYUyJK59ogu1+xBm6yP7UqAiJbebG5gLY
X-Google-Smtp-Source: AGHT+IFove1W+ZceCkSRPnIyuM4qaFxXO11bzfWTScD5nwhrq9UYjpWw9jqCebo0IpYhKSjZoxgq
X-Received: by 2002:a05:6871:590:b0:24f:e6a4:991e with SMTP id 586e51a60fabf-24fe6a4d0c3mr7649832fac.6.1716911728723;
        Tue, 28 May 2024 08:55:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716911728; cv=none;
        d=google.com; s=arc-20160816;
        b=T4nr17EzkwEEk9cpoBrsPPhR3A/1Dx760ZUG66KpKc+fkyq8vi1sPEFeWNYYOGveOB
         gL2iaVtdWw49EisfyOxOxrRY9YbnBItP59vVbD+7/dZRRVRbqu60rncFqtALNZ9QCU4Q
         hsgPphtjhCF+O85v8gV5GL8jOanxsUsXTelcsFO2cLuGEDJRf/ESdt4NBGQgTKfHiHzx
         wAxPVo/fOAg8rUj6mshvz4wWq1KzZW9frVjaRzJQecCTXXZZw95f21o9IndKstfbdmQS
         UQysaIzkH6v1WGEg6pirDcl2WzQeYJugxphZc/6MZyix16G8s+0PZSqJzxj8UxaAUG8G
         l9Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nFxJYvNldHwZrVCu+fFet6j2GNc53uIscAyjPU2nE/0=;
        fh=udZI09buqB1o6D6S8OprMUdmX/tCQMB0ZY7n5M9lskk=;
        b=IK4LlAl67lm24CSeVeC4rhpuoZKXU6+4YIPKwBtpiHtM35WDZX7gue1V80wngy/CQH
         6+/ZmW0uy760FvUEODB2AkwwhQDhP8MHd5HF6fYQ827I5Ax9nRDZORKZP0hT90EKdx75
         Pcxnt+Fk1vOcBv4Unqy1fiWj/Q3Zr+xyGekLL/TYkGRPKrTbK/n+IRkh7Xgixvr6NQG+
         IR8yad/MGZQSLlDY97YfWU81E7eNe3eAYlqRGVvAO174YuvH8udLYFGAKottZsFX85F4
         W9IBaFrRY3WSa2qxyKhCOWwhAhLI0rlpJkPl0cSdMqgBIQYfWyHvNuKRG84q2XUtSNMu
         UWmA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Szvlft/v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fb18b63b2si105346061cf.519.2024.05.28.08.55.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 08:55:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Szvlft/v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBzAC-0004KI-GB; Tue, 28 May 2024 11:55:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzAB-0004JU-0Z
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:54:59 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sBzA9-0006iD-8K
 for qemu-arm@nongnu.org; Tue, 28 May 2024 11:54:58 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-57857e0f45eso873359a12.0
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 08:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716911696; x=1717516496; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nFxJYvNldHwZrVCu+fFet6j2GNc53uIscAyjPU2nE/0=;
 b=Szvlft/vbsNKp4eY00LbD7s9nw/bk0rJOtrvZYWO51VZnGi0eI4lRISs8q+nGptMjT
 gmnEZL+RoPhrI7LvAyd8XOB1dfvjo6A/r72N41Z420dPrHlOmgTJlpw7WodBya+6a9v8
 6u050p7R3kNVZgTchhodm3CxDpupe8AvWbBWbXxS82SD7Ys8ADb/t6r31+uzDxG/u5N8
 H0R+sKsePxS8tQ+g9+4j4x3evLk7L0Jc0TmIQiVNrzn5bOxmpXrLqxnQg1MPO93Zdl5Q
 /QQQwHPZj1t4sjpzKWeZO+xzhpIXdLc9Vae2aOjojK85Ha6webhXVUekpWxM8zOIYOGy
 zxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716911696; x=1717516496;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nFxJYvNldHwZrVCu+fFet6j2GNc53uIscAyjPU2nE/0=;
 b=rWBEssWZ0sOvp7IMzAEfWL4PjNV98FdWeO1uaAnNC4aB5KIsFID4E+kY5QHapGBBVi
 Yo6CaMlPCj0plhdZc3LCuO4Aflps0jpGnvUJMbboo8+HTl2qFBkzWz2V0HMabAMTkmz1
 alsfJPSisolkCjqZKBXy33pG1VCm8pZo8vfarDi2yVTWpn4l9kIbSmWJYeQslnfYfU6B
 4o+HmUlYzdX8n+1ZadT6Yy5yvs5Rfl03rIFd2rWyrS/lZnxbtIXW1Kri7KNlc0gD22EC
 P0KjwRrTEQ08SpHbPPA/kPjaen9zqYGJChHubaJSWxu3Ip/v6Pim9IL4hXjTVjJy5tck
 Ti+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnqjRpV0TCv61i4MbMbZ/o1ma1ZadvdFLglruBcGbddXsJc5+1BY2DBpveVjYr57/cZYkajDA9TEZZasJsf/q3iQsC
X-Gm-Message-State: AOJu0Yxyjv0BpWCrglf4FQRYmLa/n69jYLbfc1IfuDRKHckJfEfsX2ql
 2zU4d6mEtkg4MH7pPbi/khwwgaNCOWUY7/POIqAF8V9qyNx3Juv1PGGr5sRJKciCaNAepJMa6yM
 kVh/svs4HrEHWMACwbYY80yOiwMLdSxJLwfQPrDMnUHSl6Zax
X-Received: by 2002:a50:d5d2:0:b0:572:719f:b430 with SMTP id
 4fb4d7f45d1cf-578519aa424mr13014427a12.32.1716911695634; Tue, 28 May 2024
 08:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-49-richard.henderson@linaro.org>
In-Reply-To: <20240524232121.284515-49-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 May 2024 16:54:44 +0100
Message-ID: <CAFEAcA9oLG4U5-pnAJhsiVbBttAyJ-+2xmpEOT-fZs1MRAX2OQ@mail.gmail.com>
Subject: Re: [PATCH v2 48/67] target/arm: Convert SQRSHL and UQRSHL (register)
 to gvec
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: OcQL06HciEOQ

On Sat, 25 May 2024 at 00:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
