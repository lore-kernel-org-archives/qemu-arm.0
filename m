Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp577271lfb;
        Thu, 9 Jun 2022 10:06:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBW2kWvaYYf/f8lAILCBgaIPnXsvfN/S+QiK5z16ZyshVUqSiL4aaoaM7R/MrlpwqGBmKV
X-Received: by 2002:a05:622a:1181:b0:304:eb7b:5e16 with SMTP id m1-20020a05622a118100b00304eb7b5e16mr18427292qtk.313.1654794418788;
        Thu, 09 Jun 2022 10:06:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654794418; cv=none;
        d=google.com; s=arc-20160816;
        b=hyDWvkjQFUWuSnqZCGHidcS+/20O+T2XskA5rU4jqa6lEIhW3VthZaNF3be1epr6Qs
         L2b6gP40XhPE3+C6fEGw3NjCrr3YZuFgx1tcQ1XvGxJZ0EEE6OtnNvxYjm8EfMGIJSmf
         2fXjJpqiaMTD1qA+bxOdwRjNOEGXYFf58qDcNIv/AOUKBl4hhIiU5V3xRy8A0pKaNfpe
         5NeCNLiH0lQ3ppgnfAEouLFzB7EQKeWSJCCdO8M2vMdDPQu+QWTwTkKZQSZfXFIlrb81
         uzuT34smx2zEXgHXRzLuSEBaZ7DjzRHGvqqDFJTESS7QpcWoUkKvnV2YiuGkEG/mlLPX
         PvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=mgdDus+EMTVrrj6/hW8xm4X8Ll6MDA9ryOrNRgI00/Y=;
        b=Tj+uTs60Z3qWUXMykV+kh1OvNa2ElN//IFOlELxe/Wgjp46QGl5HGyrb0fxzy6kw6U
         JJZOWRgcvUMwYNuc/Fq2SPMH3gKHZInoUK5dqGG1AOdXUjogN7u9PCU0prrqK5tidtfr
         W8EmNZsllQEO8hRT2OV1QwDnceKVl6q7UogIqL6SaRjvlrj6YJjuDlPSXCFVw8QiRBu1
         H48MwWDUVJ73dI+pUWHGBgcr/bunZ8wONhdjcfJAusRBB1tpzQaMDf3Tqx6xwRQZlX23
         Ffdq1UQww2RwcwehzJ90pdPUpaPI8gnddPkPHdxjMq1RaKJOUwmSWNY4jUBEmT8T4XqM
         sqVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NjFRrb6W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ee23-20020a05620a801700b006a71a3878dfsi2110616qkb.347.2022.06.09.10.06.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 10:06:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NjFRrb6W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzLcY-0003nD-4T
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 13:06:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLFU-0002NV-Ah
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:43:08 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:42460)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLFG-0005jv-Bf
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 12:43:07 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2ef5380669cso247140807b3.9
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 09:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mgdDus+EMTVrrj6/hW8xm4X8Ll6MDA9ryOrNRgI00/Y=;
 b=NjFRrb6Wr+ciKmJvnoHQjxsOs1uhVmggiHKbaoOLRl9s3QHnPz1TbyNcoLmo4eLNsy
 sntXXQNLB1D2R9jgHLSqInRapaACit7CsfkEHSSOvk7Bx6HhZtqB/PFufWkzbjExuwrF
 dBdka9R0aEQT2WLMwUZxS6UwCS8xeMrG4Hsrhwu8pXNNKWayfpbHn/W4m32pBPKbtXlo
 789A7EIA56V5MU7HJMvADdn2mZTeX4d3DlW5QyzYqStjb0SODTOabJFVoi7ehjcb21+g
 AUHZtHZ82465vce7cvbkoWp0CNalFtDQSPdSl4RKZ6QYFXwhwBl6O3rL5Zv/x/nZZBTQ
 0ZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mgdDus+EMTVrrj6/hW8xm4X8Ll6MDA9ryOrNRgI00/Y=;
 b=gcaPmRqgVz7yyKc2upxsxneHRpsw9C5G/AB9D8EQkI9z1QSq2qLB886/QdR6EBWaYv
 jrvW4zXiqQatSfnOtKepXgh2Fm6SbJaPkhsqrMOeRUGVvtxWKpl95ssFUuQf/y9vB1Dh
 ME10RDSZICKSbpvTX8UbTSZ40fgRV3KmfsAppJNagJ6reOq3yY21AU8Jk32BRkg5QLuz
 ltMe0uRLWS6MDqHOCx2aLRVCL0f9qBEaG+FlAF7St4M6i9hVLvHcRGB1Md1Pp99Iu4vn
 AsW/A+di1Gy/K6s1NoTDTAFBBqmwPdTNyWsQ5coeArIkoX99ZHJ0fsuX+TjwTb43pAs1
 4YLw==
X-Gm-Message-State: AOAM533BUl85dIuk4DfNyidNGO6CGzp5wFU61b6wJxRzUGp7SXai9K/K
 qd3UQ+5xLYWCfVqL1j9tm1q4bks+y+nU81Wa2GKteg==
X-Received: by 2002:a0d:cc8e:0:b0:30c:1230:90c with SMTP id
 o136-20020a0dcc8e000000b0030c1230090cmr45550042ywd.469.1654792973083; Thu, 09
 Jun 2022 09:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-21-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-21-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:42:42 +0100
Message-ID: <CAFEAcA-A19rRzvXTF0ZqRyNwxYRs9QRTwzsFkDfChkdfbbAjwQ@mail.gmail.com>
Subject: Re: [PATCH v2 20/25] target/arm: Introduce
 helper_exception_with_syndrome
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O7mTeEbEh1AV

On Tue, 7 Jun 2022 at 04:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With the helper we can use exception_target_el at runtime,
> instead of default_exception_el at translate time.
> While we're at it, remove the DisasContext parameter from
> gen_exception, as it is no longer used.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Basing calculation of target EL on the runtime state is definitely
fine here.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
