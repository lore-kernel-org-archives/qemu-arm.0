Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp583659lfk;
        Thu, 21 Apr 2022 12:16:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyjcbw2upux8ob75UrcoPu6/gb7PqXw+ti4VWeUExstiuPPKT5f1WOl7YrQbFcqx/rL2ibe
X-Received: by 2002:a81:60d5:0:b0:2f4:dde7:5bf3 with SMTP id u204-20020a8160d5000000b002f4dde75bf3mr1322832ywb.174.1650568560466;
        Thu, 21 Apr 2022 12:16:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650568560; cv=none;
        d=google.com; s=arc-20160816;
        b=EnSFFmlLjviyjSs2SQSACyY5DGZpILcOFw5sLgQjFzkM2u9vRVY6HdBb6qCSJlJ2hV
         TspGUC5fEg3v6jQqQcn+6ID0L+aRh4/PYcMEoyk2Ptz1xpM0Nr74G21GP580avsH7mN5
         JlJ2uxZ3OoUqnu9sG3I9jUiL4d//WCoXamFD1U/QsGC5daGxzElJ0dOlWxwz99lZ8nbj
         41zMsh4M54fYgcTOG1Hoo2sFMvfT6jGXoGmigeNJHR038JHE0Uoo+6nkaZhf5Q67DF+t
         fT6t9TPUTmhhuMdDda4aYMPsd1YNMfVB/W5Cley7SqMu1cp2MAVgOnQvUan2CNzoG7WC
         aptQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MEzVHx/Y2iKUerFjo7IpeEzxX8eVxH/Clvq316RbT/s=;
        b=EW6bIiLQB1Rixq292DpKJAl4ZsUiqdEsvOlpNM44unX5FAdOyNRA4NayGpv8wnjuN7
         Re1vpzQR2xI8xUgaOket8nqdlH8qP99PUMIYZbG4yynDKcB98ZvPwSyi+Bw57KSSd10R
         QHdkJnilUam/o3FRB3W8deAI6Ibx7MO70ecWYjWqiVwEVcV87dH4PiSyZTUNkPgbRZuK
         gZnGsA7SsZPPZloIQOCZyf/v+XKlWHxpkguYd8Eng4ozSK+STqSE8Abiz1rUGIgv2D9B
         f++CICZL/yJRjwASBOyJdVdLqY9n1VVoVU4xcUp4mwG3fF6PYKKBHehuhnMeTjZYZhPj
         ny7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vuwFuvTZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s7-20020a815e07000000b002e62b533f23si3436048ywb.432.2022.04.21.12.16.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 12:16:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vuwFuvTZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhcHX-0007QN-S1
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 15:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhcCx-0007MH-BR
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 15:11:15 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:37594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhcCv-0002TT-U9
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 15:11:15 -0400
Received: by mail-yb1-xb31.google.com with SMTP id m132so10457606ybm.4
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 12:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MEzVHx/Y2iKUerFjo7IpeEzxX8eVxH/Clvq316RbT/s=;
 b=vuwFuvTZksJaDghQgQeIK6eigL90sHlf2K6CfDB1y4jVqneQzX52Buhlrkv2gXb0ku
 ueB9s2T8O8pJyu4W3UXlswPZm+k54DjZZBJcPwU3tGMGpEUg5nOluIA6fIn5/cSUloCl
 7a8H3A/hwhkTK6o+TPFzes2uevCa6Qaa6/jdpBLbu6WXlCGEakDTl+5GOjrvjhgBaomY
 79xgs91nRKoyGuyqnwJlIrlHPwQQJZ72MpVvk7G/8+4Zl5av82Exmzw9boYNXZ0Gf8QX
 hVXN0/YwbRf1Pm7N0RnrweYS9Cniq4Vjww1hfdrWLQo4AACBvZpwOYNWyNlj0aT138Ug
 RXBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MEzVHx/Y2iKUerFjo7IpeEzxX8eVxH/Clvq316RbT/s=;
 b=GdAkH2s6VYwqx9lHR6cHZ4bZrrRWUdilYutJzV0e8+9rMW8tAU8c1LHtIoF5cskegW
 kBL8IOwf4o6sY0RJaonDLUUdcXU5B3uMp/x51jXm1lE2oQUg/0WjByHTA8GfGe6WcLyF
 SdlmMuFQeQZYpP5TJxNPs5TgWyVC389HIMJSU6/0sWV6XpnWZ7URCSs9q6v+8Vsl4niw
 KX5eWhhxNY3/4kfkKaavcmJWjsv+cnn3ohv7PRfXd6BB6UQFu4O11YuLGq6QEiWhBg+C
 jt8snPeB4n2mv5jQto0vbL0HQCTsL1LCIi5ano2tAmhsa4qS8nSY/LK4+cneR69q1QPG
 xpAg==
X-Gm-Message-State: AOAM5329+vRNyFucUlwH+AjDMPF0YksBS8MojMBfWmQnAzj3y4tiZRu4
 AeKHJPTHLyG9aBS3WhebX20sYWgGERvlkX8IspHpCw1xxTY=
X-Received: by 2002:a25:a287:0:b0:645:3c4f:7dec with SMTP id
 c7-20020a25a287000000b006453c4f7decmr1186355ybi.479.1650568272076; Thu, 21
 Apr 2022 12:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-24-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-24-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 20:11:00 +0100
Message-ID: <CAFEAcA8x8Rj9VjujUn88GP9ZVsAs0UqR74MhR0T11uVyvGhEWg@mail.gmail.com>
Subject: Re: [PATCH v3 23/60] target/arm: Use tcg_constant_i32 in translate.h
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0QosxtQVsSFQ

On Sun, 17 Apr 2022 at 19:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.h | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
