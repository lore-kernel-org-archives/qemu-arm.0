Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp307534lfk;
        Fri, 22 Apr 2022 02:35:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwyati4MBRVYBIXDRasuZs3J0fk6OEwLd3bnPHQkhxdn5vM8hY+XMzv2mlAv/PBkd8SW6Z/
X-Received: by 2002:a05:620a:4310:b0:67e:8460:5a10 with SMTP id u16-20020a05620a431000b0067e84605a10mr1919916qko.636.1650620112035;
        Fri, 22 Apr 2022 02:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650620112; cv=none;
        d=google.com; s=arc-20160816;
        b=tFyh4bfZK+sahENL/+OR47aq39rddb+q5T2bYTaVRa791srslEDhh4Iba4xKld6MhR
         UpiX6tbUeRmgqUxEnTuB+2EGjPY4uA89CWWr6H9Jg+/H7IuVTXZxSROkk6xwqa+iSHeM
         8XZdTRZXSagIorbNl7iEM3A6HSp4w/MFqm6iV8+t6RsYm/x8jgRCG5neocIdNHobbBvE
         /nG4Ywf3DoE4xSNZ9NJDuUluuqpaoqATMDN2NeMI7Skf4KHw17pOIaf9nBkxJZJkqqz/
         O5gsfj6lbGsvhrVOlJBy3s93dS7c48QYhl7xHZgMx8Afqk2JmMb4nLpAZyoG/qlLd3zd
         GNvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lTccXWDTn11BKpXsvaJ8BfFFQNZaVmYselLZ3TLhkeU=;
        b=vKybbIWfdOES4CdzTuiG23vLRIkrimcw5F9v9y2QkqdnTpJq+2yKOrC3QMWAfeIf/k
         AGrFqUJjC5yTx738Hm0xHBZzelcLSDL/0r819696cwM1iNpCGH7oxCeSgbYdsvgZm5PN
         jT5DZRfCAUobUQ2gDAaBoVk6Q3FDM6s1rj7NvUI9B2PZxiwovbS/RJSF3aofDsWp8RAq
         GRNTaYbyEYgp9u3UNZZ9nyQhIGkAQz/hI6CllDCOPFGIC0+A9cR2yKjpJG5D4nTM2i0U
         XIEe45a3gaevp+Z+/dH+3stGjc8llyhz9GPX9l8oK+/5R2+2351sItmVShUGXqbZb5Lr
         jqSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iw3UaZxi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13-20020a05621421cd00b004464144009bsi2071337qvh.17.2022.04.22.02.35.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Apr 2022 02:35:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iw3UaZxi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhph1-0008Fz-Gx
	for alex.bennee@linaro.org; Fri, 22 Apr 2022 05:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhpet-0006oU-5V
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 05:32:59 -0400
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32]:34637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhper-0006LG-LJ
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 05:32:58 -0400
Received: by mail-yb1-xb32.google.com with SMTP id b95so13477185ybi.1
 for <qemu-arm@nongnu.org>; Fri, 22 Apr 2022 02:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lTccXWDTn11BKpXsvaJ8BfFFQNZaVmYselLZ3TLhkeU=;
 b=iw3UaZxihtdvRVJKhqEnf/5K8PsPTSjUKCH4L6iT9HLyeoDMivID3bEpudmZzayzjc
 rlOHqBo5lCPhZ150W2V+V+fjxzEybOUb3ifdLbmSiViRHrybtWTmwjgH9UFuEKTAGyzf
 SHeYe2m93BkjC5iG+o/2hKAFlAu3EDwi3/BTj2P51w3+RYJ+EW22urhcy625qnoJlvQz
 g1a6GKK8nVIY23s1DYIBHsLskflXlIbva27G2rWx7Gbh0uwBj2aMoMRSqBIczeJPk6eo
 q4KmBBEA0PtOvPubyy06k9btfN3zc2OcRA6rpW+RTZSqoh3JEUD+AVUOCjhnwQs6mzn+
 /1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lTccXWDTn11BKpXsvaJ8BfFFQNZaVmYselLZ3TLhkeU=;
 b=qfQAOBmP4jPiC9pREgJgxNHveoWL7V3ghQtkOHLGFRMuzDsFPTGb43Mre9Txqjq5NL
 PKbnCkRxs9qaOYBO+2xx6y/eW11zcxnQpm7tnJeF1yhH2zdmuQAzu2FibjkMm3P0JWqI
 OYweePsOgia6nwDA/BeGy5L53UeQ8Xakeq186IZ9skuFkYbFHnnokFS69xGP00MfnmLU
 ZMLRHTU00cqT9cTB5gfc4Eu2jvS9iB1EkwuUU8mXu2Nok6u0G2brAUugHKBzz5l/WKLA
 WMWD7hksKAq3CGsyXXA2ENlrg1xJM899toMwLMRZjBh4l6hcQTzzOx/vJABlDxv7b7Jx
 X9Zw==
X-Gm-Message-State: AOAM532+bNkr0cxxciXGj+/BJIoVjZNIkDYJWb+MuS19VJwAua2tdfkq
 5a3/2vacoubF3pDyDsIp3ASnfN9gPNSjXZHgIsXEhg==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr3512464ybq.67.1650619975567; Fri, 22 Apr
 2022 02:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-26-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-26-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 10:32:44 +0100
Message-ID: <CAFEAcA8fqfvM6PjaNGwioxpnAr2yOdhTz=Wa47LtmwBP49+3cA@mail.gmail.com>
Subject: Re: [PATCH v3 25/60] target/arm: Reorg CPAccessResult and
 access_check_cp_reg
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Lp2uIJViiCFe

On Sun, 17 Apr 2022 at 19:00, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rearrange the values of the enumerators of CPAccessResult
> so that we may directly extract the target el. For the two
> special cases in access_check_cp_reg, use CPAccessResult.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
