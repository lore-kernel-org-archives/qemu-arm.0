Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp617466lfb;
        Thu, 9 Jun 2022 11:20:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwBN91A81HvwKdDMWZnIXN+tYrybg5qWb1R7eQSLVol3r+uxTIuOLWM2rliliA4xaVCUfmE
X-Received: by 2002:a05:622a:45:b0:303:521e:a9a0 with SMTP id y5-20020a05622a004500b00303521ea9a0mr33695718qtw.621.1654798807628;
        Thu, 09 Jun 2022 11:20:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654798807; cv=none;
        d=google.com; s=arc-20160816;
        b=v1WLIBx/mZc8XMUgoXACR59uVly3aMOwp4tg5+h8UbNOpD/0PFtK+ZM7Tq5BBIA5UQ
         oztU8g+edeWAb4seuAIh0skDbBBQ3VNijvr7gZJgK0rmVnC7A0Yiuy+xdjC/gnLiu+ow
         WF4Zlg42Q8pG/mnLLTbAGf0DZEfkkSmj9T7fbfxzP26nC8dUrBRyDDMpB/UJmPs2tzP1
         pN7833fS9VtdFfsuwWWGMhn/tUOXSMuaOjhtWjw1z9h7eRKMj3rMy+fjh6L/2hR658cK
         frW4R6h01zjBpWRXVyf3NtK64wX4mz6PSKGQndU1j7Aw6ZJjSaequ1ex/bCmEWZdVLED
         EnrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ln3yeJpbJrr+PjP5Mf5aZfpBgUI4DB42NDXbK8OOgUQ=;
        b=UGnTHV2jzUdt3wCpaiag4jyqqlqdf326inSKCTyB2TP9q7AKt4SdY/gllvIh3fnjJX
         FllnQia/K1s3qwB2XWfCMcnJaELzHO4RFb17izZtWsX6P+BqoFaWtKujaUsn/GBc9o03
         dwDUdOL15c620w7t9nzYk/I3Vh1vZ2sQxLWXqr6fxmSdwswY6ITPSQPDl9061PpI7kKL
         FlQUkURO5WZmG+HAifk3TLQwi+E/1odyOAHjDmuqZUMZ9nZJ1z/cjJRwqk1VV5gRvIGE
         ugsoWD7+TRCLgsMYA98g/Po4Iymdj/hrb4JOsD9VLNJli2DDk97t12X0T4fGr1vaELFF
         0Wuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ofbOzhGl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9-20020a05622a060900b00304fdc64143si4361963qta.223.2022.06.09.11.20.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 11:20:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ofbOzhGl;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzMlL-000189-4h
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 14:20:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLV7-000547-FH
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:59:17 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:43959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzLV3-00083R-9m
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 12:59:17 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-3137316bb69so52912697b3.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 09:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ln3yeJpbJrr+PjP5Mf5aZfpBgUI4DB42NDXbK8OOgUQ=;
 b=ofbOzhGl4MqeT6FRpT+ShvPLDCLO3srzRDR+m+wRdLORxxFYGWe1OzhaOkQoKNiLEv
 IriLd4DAVfN21YcWLV0BTFSkNCPcVpVX/NnG5dB3kXVvEAYLbhxoST5gh19SyOrmspvP
 nP6XjGwGfgxsMcUWdyCLnVqAQKWsBVE22i1soUmiQtcgZd0TBPoF3tQfSFJMtVgGSBV3
 80DcOB6gM3nAe5gTh+FcNaL3Uzwbn229XVZkyxfBbTmq4vp+qwvYONGgmj3w+1Tnd1jv
 efS8cEFqGGGaCjVt715PdKjES5SRwOQTBkeG+qU6LHt479x0Pw9h/TTuSRqwekm5wIaM
 NUmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ln3yeJpbJrr+PjP5Mf5aZfpBgUI4DB42NDXbK8OOgUQ=;
 b=tbvdPChz/wxYn2ymnksnCYg4pgPR1M0f3h4kmkg7cV25Bx+uE7/zQ+TeY+9FbekZC2
 oQ7S7/tXC+hhNcabJGl6AetWKjtKXr+r3VtqUrHMr7KCUDT3o+1LWPLGVSbEaA52VZr3
 oC5Ni6jU/CevJUz80dwa/UuIeF9FBZIyQ8oxcotIKLrbEurYmGedC1Q3NwrS6vN0a4U/
 94/cV2o2SAghx52vFXSa0+icouQqaJP1zbC1Be11E94OUTq/rep5iyS8yzwmWswCAt4K
 m/vM1J8adS4GOjnFplrltkWdxKWmFkHQtEzgP9RcLc16FPyE0a/DWM7JyiToYdxeOSUE
 AD/g==
X-Gm-Message-State: AOAM5320u+NtpBAUpsNx1Zi+RrktHID9EQip7wzKtotYKAk5URpfbp0r
 xpJVIAvp3nNe7NdrRymvhiRMl21rSAJpRULwJyNaJ4VKrRk=
X-Received: by 2002:a0d:cc8e:0:b0:30c:1230:90c with SMTP id
 o136-20020a0dcc8e000000b0030c1230090cmr45626571ywd.469.1654793952019; Thu, 09
 Jun 2022 09:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220607024734.541321-1-richard.henderson@linaro.org>
 <20220607024734.541321-23-richard.henderson@linaro.org>
In-Reply-To: <20220607024734.541321-23-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 17:59:01 +0100
Message-ID: <CAFEAcA8onLGq1bpvkFZqAx-KrTneMvVSJvvzpo34EQsziZPzMA@mail.gmail.com>
Subject: Re: [PATCH v2 22/25] target/arm: Create raise_exception_debug
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LN02hUhp5r7w

On Tue, 7 Jun 2022 at 04:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Handle the debug vs current el exception test in one place.
> Leave EXCP_BKPT alone, since that treats debug < current differently.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/debug_helper.c | 44 +++++++++++++++++++++------------------
>  1 file changed, 24 insertions(+), 20 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
