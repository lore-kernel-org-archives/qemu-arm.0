Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp1261266njb;
        Fri, 9 May 2025 10:34:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUcfVkHOMWvQOcjBC0Ik5RvInZCdsRHZr5POc1Y5Vr9ndB/Ywey9agJVaJV18Niz8dl6OVG9sJt1NRmWg==@linaro.org
X-Google-Smtp-Source: AGHT+IFNZ07z+XZ6cJ+cdA3V3OYXsRCyXWk7pTZMOMwI56hhHCTINmlLYDCPhhRXIEghvgG2YCjF
X-Received: by 2002:a05:622a:1190:b0:48b:4d30:fced with SMTP id d75a77b69052e-4945261e04cmr60322571cf.0.1746812094149;
        Fri, 09 May 2025 10:34:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746812094; cv=none;
        d=google.com; s=arc-20240605;
        b=NMoryfdCTzHrjK0QjONMQdFyeApWeYySZkewqlnY2RZiQCofr8RP7pLjLN2XyJDOmM
         nXOvOn9+R9FBHTmwY820gvolns1/6G54nRhV12bYgqcEKr7v+IkQcf3VdXLt1pkszQ2E
         cFoAFtBDxHhniC5/vUn7N5h/+Z3HDM93uz15+1Whx3dJRVGGKvVrymqpTzWqzgFWkIf2
         tJFdRNidtEY/zfKEmJZtfgJ3lnuJNLU0a4ac5/IkrHiFZ4lsvi/LBYv6qpzFhwXmnmN8
         ITsP9VRSwsegZA0JAXfmLF9NVoeaCe0chAM3kL6Bqu4DgjqPAUbiPSo3l91zcqj6nCmQ
         vZFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5POo5JTMEcXvcliahFXEcisESlZvcsj3wN5QlvfIxSg=;
        fh=3PQdBJyLW2lxENAimu7TfGbP//LVLHtiaxBwuFSiDHY=;
        b=Z6k9axN66WJ2IAFT9kXxruJrYJ21m+z8LHaVJqWxnCv3qFxxvvkwYfnjPVEs5XLRf/
         G/0pKYQeV/ELaohIAnsHpiaOVDwGeDjP4QzXR+sXa0/hcLZgLhmV/T0YNfKejxzzb6gv
         9fmJQ/id2XLgQTrwPCbHE8dL9bLromlfj31fzkbO/o0A7XmIqM6KVtugeXcgwhP0Qbq4
         EjxHAILyLG+xNBgqBNsTNNPf/YJEYpU4fbfKF5C420jr4zLudAIPsQFjz6kXVkhpKuxW
         WOJICc5jt3TvAqql5tTD/gctp0XCo2yYqnAkDakzRsr4JkXF2OxwnV/d8D5rpEyfuqFe
         dfTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yym6UKsx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494525b4242si23820051cf.651.2025.05.09.10.34.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 May 2025 10:34:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yym6UKsx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uDRcM-0005bR-Bn; Fri, 09 May 2025 13:34:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uDRcI-0005ap-Kq
 for qemu-arm@nongnu.org; Fri, 09 May 2025 13:34:34 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uDRcG-0007Vf-Sk
 for qemu-arm@nongnu.org; Fri, 09 May 2025 13:34:34 -0400
Received: by mail-yb1-xb32.google.com with SMTP id
 3f1490d57ef6-e78e3200bb2so2385140276.3
 for <qemu-arm@nongnu.org>; Fri, 09 May 2025 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746812071; x=1747416871; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5POo5JTMEcXvcliahFXEcisESlZvcsj3wN5QlvfIxSg=;
 b=yym6UKsxxHEneJlH4oLJWXQGqo8EFcSZ31AvhQJ9cyiMc7YtmNBzilExzz+CtCayHg
 Uod6aBKv5gpfQ5ZHHb/H3MUP6prWwugI+j+eYreXzI4JVB3WFZOomK/zBIvdnLyIY9L3
 oAmXMHGezsvupbvN76Ss8gqa9a//AR1DtyiaXTQFmAMLDidruhbhQQBvG8CgR3bR2Fch
 NhOcUD9q5g69RdcaIOesf7xSrZ3uk61U8FtLvAQqtN5frkcpq9nHz126KbPpqaOHWLPY
 D69Xm7sCRpKpR2416f9Taw19nU1I2UaabLdOdsJYTe2b3Tzgz90quTP5kIA5eIemNecp
 57Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746812071; x=1747416871;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5POo5JTMEcXvcliahFXEcisESlZvcsj3wN5QlvfIxSg=;
 b=hdycutDSpvj8s432eIzTCFdMetW/dczLdJRizhNW+SOXFYiT4/Brt1RJ6Le0w+lrxN
 Gtu1ngxczX4kI1M2hQMz318y+Y9ulH9BUPc4BzB67FmlVVifyCjnCZB8P0mw2yALuuq6
 uMVrJqp4WRp+3JOZacVVVon+NPp8OfFUy4tqK+c38nMOkf12d2HdT5+yYMDAyQTmfQPs
 AbOkU3IU1gCnICexLx2+/+njJleI61HnxtsaBbRHpOPvx/XHD0P7bOX2XytAHRSoaBDG
 e2DgRJm6c407Y8WP38BZrUckVCu8mnWgXA0yeLea15vRkgv8j5mihcJ84owczcRo6bbA
 ARJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUCRHQOS9hgbms6ZozApDy/nqcUNDXooqPeDDxwby7hpb/1K+Dwtle1U1SjRIOAA+Is/VTAzMHHJg==@nongnu.org
X-Gm-Message-State: AOJu0YyZjmIJfzqEuTS0EPse0j7HFLrIitGeRSmQ3QEjDy6vcAF0z7Eq
 AVCdbruq3dl4QuHCT05JzHj4ZjINuGeBB+q7wdfg9zNnrRKkuC+pqzmIqcwAcD+GxoVVyzd20D3
 Qk66WuZXIfwUxxAOWlHQBlvunCVhe9CWRgi3KGQ==
X-Gm-Gg: ASbGncvXhvQBuz2W3NwM+6KuSfXKO2KTvp5D3T180jGwLex8XZzZaF1+K63blJ/VcGR
 CjBWe5r/HdCRLFJo6cjy9zhsUxyBcC+e5JvMKmep8j3FqkJtVv6YkgBpCfESo09pwpCojwKcN19
 p2oPoLvk8f73DYQDRgb7Rnol/UIKfPO5XJ5g==
X-Received: by 2002:a05:6902:228d:b0:e78:f3ea:200b with SMTP id
 3f1490d57ef6-e78fdc71abamr5857607276.22.1746812070986; Fri, 09 May 2025
 10:34:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250505131130.82206-1-santimonserr@gmail.com>
In-Reply-To: <20250505131130.82206-1-santimonserr@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 May 2025 18:34:19 +0100
X-Gm-Features: ATxdqUGY75Fo6psiRVX78ErX6GDtG6GXy41vQPQSl3qZFWHKXiWnZ0GYDGLJ10A
Message-ID: <CAFEAcA_754T6Aucak+MimuaP0gO8mtUoAmq5wNj1N9oDmpa5eQ@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm: Replace TABs for spaces
To: Santiago Monserrat Campanello <santimonserr@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, thuth@redhat.com, 
 sw@weilnetz.de
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
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
X-TUID: xApfUHXG52oN

On Mon, 5 May 2025 at 14:11, Santiago Monserrat Campanello
<santimonserr@gmail.com> wrote:
>
> replaced all TABs for spaces for arm code
>
> Signed-off-by: Santiago Monserrat Campanello <santimonserr@gmail.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/373
>
> ---
> replaced all tabs with spaces using vim :retab
> used 4 spaces except in some defines and comments where I tried to
> put everything alinged in the same column for better readability
>
> fixed the alignment of the previous version
> ---
>  hw/arm/omap1.c           | 1016 +++++++++++++++++++-------------------
>  hw/arm/omap_sx1.c        |    2 +-
>  hw/dma/omap_dma.c        |  334 ++++++-------
>  hw/gpio/omap_gpio.c      |   28 +-
>  hw/i2c/omap_i2c.c        |  178 +++----
>  hw/intc/omap_intc.c      |  154 +++---
>  hw/misc/omap_clk.c       |  470 +++++++++---------
>  hw/timer/pxa2xx_timer.c  |   76 +--
>  include/hw/arm/omap.h    |  534 ++++++++++----------
>  include/hw/arm/sharpsl.h |    2 +-
>  include/hw/arm/soc_dma.h |    4 +-
>  11 files changed, 1399 insertions(+), 1399 deletions(-)

Hi; thanks for this patch. As a general note, this is a really
big patch, even though it's only doing tab-to-space conversion.

If it were touching more than one kind of Arm related code
I would ask to split it up into multiple patches, but since
all of these are basically related to the same OMAP board
and it happens to apply cleanly and I can confirm it's
only changing whitespace characters and not anything else,
I've applied it to target-arm.next.

thanks
-- PMM
