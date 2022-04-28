Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1636953lfu;
        Thu, 28 Apr 2022 03:58:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxj4RTrN8MkrI/pW3jBHyLhli3I8oKUI1/sqhQmQS7ytLGdUjG9yvVbistvYolDS1TQxTFG
X-Received: by 2002:ad4:5b8f:0:b0:446:646a:a508 with SMTP id 15-20020ad45b8f000000b00446646aa508mr23197828qvp.113.1651143529344;
        Thu, 28 Apr 2022 03:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651143529; cv=none;
        d=google.com; s=arc-20160816;
        b=wUCo3hHPslsHh0W+DCphMlcUY9v1tLVJhkTVQno9FbijEZ4FaRy7Y4m4oT556UB1Ll
         NItuN7oDfdc+B1a7S/JmP18MU7ul6zh2NTWFGezHe7MUY4JO3sxOYmoT0Iwk3bMJsLps
         YKftvWia4lsH8DloFGdJ/YhYDg65efR5p5HpNlz5KRcFXXJeAbPrJ3iD6jtoJdgfBKF+
         eelKTlGypKY+c6/Tg88UHXgmtoCFo5oTZwTjq3zi6A0eJv1UwVApxTpXuJ+L9lZHoR30
         vlRxI+JxqzUd4CFtcRUQpK/vQoTOEtAPLa+H8pk0DYMA9SeK33wXDtqeS1cwacgW4M4Q
         RtMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TR3t1TfnbCor1eozYnYhmH/MDRiyI4xw33OeQAeNJdk=;
        b=OzQmlgIi9Fq1OVTDuypcHUCcdXoCGmxFgcIwhT5aynq7/Gu4uXYxI7llwRspZqB0lX
         wbC9lYae33nxeClB8OiTRrRJgG3VVCexDRZnOKgd3bSzgxU9qXmk6eZwl8dxfy0Sgt9n
         RBrJJJsLsQF17E2//EsHLBQcdfM+puZ34hdF3a4cSsy9rjmhDwv1LhXBE0LRdsX6SZnr
         YOZipj1McVhJ5xOiX9KIhYvNlg3E5lSi0rfUr3z/21dsZm7YOr8W9io2m9N6lNRblP18
         Sp85xGND+2MWVMb16+L9a79NfjNLpvUjLblXmx3cM2zEPKHwYXZTMQFDAI6QRbBkNDD/
         gQhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UG5hvrhI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16-20020ac85e50000000b002f3752e19cfsi1600200qtx.549.2022.04.28.03.58.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 03:58:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UG5hvrhI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk1rE-0001Dc-NH
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 06:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1KE-00066e-N4
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:24:42 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:42450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk1KB-0006Pe-P8
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 06:24:42 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-2ef5380669cso47428597b3.9
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 03:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TR3t1TfnbCor1eozYnYhmH/MDRiyI4xw33OeQAeNJdk=;
 b=UG5hvrhIo8pYKRQU/CY0pm4vVZDw2ltA1QYVLtKkJ93N3249CJ6Dbao6bPuwqXKfU9
 aINMUU/HRkNCLwTZVd44MEHmpVGPV6XwvR8a8H0aH8xwkozq3Etqe83TI8nQZ1+H9C3i
 khAMdwnShBHCvGsOekTpXY8V6l7gL0ujNstXPkMyoc7PwHT+kT/C/riZRf77eBcIEnVe
 u7UM23dUNYH4cuTWcuETimitgsQx8X6ZVCbEPYbfak1omUheHIZlndqya+k/sv61bqhg
 +fcZZB12xqqdVMuSrx4b6VXe7h7P7X2r3/MxlJI3V+hm6TzR54/OMTmrDWk4lbdPWaJ3
 Rkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TR3t1TfnbCor1eozYnYhmH/MDRiyI4xw33OeQAeNJdk=;
 b=ij/3xWXN6scayNf5ncGtyyRoX1AIrbNCuo7CG+Dap3uVgmNwtBFo6Zb/XvPcDI2iec
 +wzqxbRitfrZdGx4j9iderhP1dPG2RtD/OlioFcms5K0Hl3ietfGXvbJHMO0MvLBdtMw
 +Ib4VKIV504vtX1JDJB0Mj0UjiYwWYVWKydSEeTggoklEw0YcN1FE/d/McQRtIXGESux
 zDFDQmhxIuak3V/XzpXYxvUyr4pXC0r1SCyjPI9MRT4aROn61KgS5Ys/KgCCDutdL+/Z
 D9YxKwsrtx9O3pMv59yj7YNj27N7HYSPTo3tmW6IIvYUsVwvG0D7xmAKwFRDe2ykCI55
 draQ==
X-Gm-Message-State: AOAM531wyjG8ZInQ/nRzz8qvNj9X7BUJH3OeJfBcB3QwUKq84INc6scW
 7Qly4e3W70tTXc/TgNfjyi0jQu+vyYnKi+G0Udl4IZ+uHZA=
X-Received: by 2002:a0d:db4a:0:b0:2f8:3968:e808 with SMTP id
 d71-20020a0ddb4a000000b002f83968e808mr9298970ywe.455.1651141478805; Thu, 28
 Apr 2022 03:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-25-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-25-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:24:26 +0100
Message-ID: <CAFEAcA-gy+iuq+yiaRmqt8D0Rqyx7EFRWLi1u=PHDawN55JeCA@mail.gmail.com>
Subject: Re: [PATCH 24/47] target/arm: Use tcg_constant for gen_{msr,mrs}
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2zDcvODwaWzY

On Tue, 26 Apr 2022 at 17:57, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
