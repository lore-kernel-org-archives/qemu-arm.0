Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1115041lfb;
        Fri, 10 Jun 2022 05:58:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZCuPQZP3eeqFGFCPOr0W5la2JAOnYyYtfgzZb+SVEQSDRSvdH5Ua6vQhKqRrnhJVFF0eh
X-Received: by 2002:a05:620a:d8d:b0:6a6:e1c:1f21 with SMTP id q13-20020a05620a0d8d00b006a60e1c1f21mr30286984qkl.430.1654865916353;
        Fri, 10 Jun 2022 05:58:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654865916; cv=none;
        d=google.com; s=arc-20160816;
        b=ZduZ6yKVVaZdA4KDf2B9PRBI8YoQI7q3sSdxMq4uWUdZnf9F5TlFez2I5V4c9Ox8d+
         9iaYRLBgYjNNIOEZsga9/AFQ3IEKFiNTyszn50I7GFn5ZLIBVZTfgttjQQWMogNiCrXs
         1mh79nm7QcTYgur3naxTfPSc/f0uBW+oD27mSzsqifa0EnF8DID3j9ULxwdQOadBNtsR
         6eU3EM0NkpzTFWX5Pcb9KtM4FGn/SYjXStWt0NU7i5sRy3DCzfJkwTeD5b38PoSdxBps
         JW4RYljrQh9kO7YPWfjcOLITcfIqhoi2TBaX9VaVTutk0Xh3EyEkitP2usxlNze1wJI0
         WgGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nFl1ynvr1uhEcB3rmbTJ0VXwIQDyuN2T1XrvQVdal/4=;
        b=gtu66IbaJFZJkR8w9i7KSesdYajgON9a3dnyaUk3FlVB5ROuvLq+tb2N0b+JSJ94N5
         ahWpNEx7zDgyIZg/T0PDe/1LN1oIGJmdv5R55nqY6gP3srs/PzYc6GWXKzitLfe5Nr3n
         33PW622MZrIwRey9yAkBm01kpQFXEUp+pUu13v5rLm+y6BBymOmr70qe40Yg/18peklF
         5d6ZGR6qoUMVrRBFJmcm9/REVhD+jrNMLmLy5fEPk3eljQG0Aq79h4M2pkWpLJfQvrdS
         x+W47rcMxb3rNWxzNe8gaUdo2/hSD6VMpMT5+jhK0WJ9qpqpsykkZF8y9i/Ldx0bO9df
         u0Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vrjsrill;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h6-20020a05622a170600b00304dd9bc432si11973916qtk.660.2022.06.10.05.58.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jun 2022 05:58:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vrjsrill;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzeDj-0004ag-O2
	for alex.bennee@linaro.org; Fri, 10 Jun 2022 08:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nze9H-0000Lt-7G
 for qemu-arm@nongnu.org; Fri, 10 Jun 2022 08:54:00 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129]:42305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nze9F-0001mI-SB
 for qemu-arm@nongnu.org; Fri, 10 Jun 2022 08:53:58 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-2ef5380669cso271097807b3.9
 for <qemu-arm@nongnu.org>; Fri, 10 Jun 2022 05:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nFl1ynvr1uhEcB3rmbTJ0VXwIQDyuN2T1XrvQVdal/4=;
 b=VrjsrilleEY+GQF1p7btjuKFhxJLfL26Q0TepQDSRHvj8gHKBgEP39eZ5s0/t7BERh
 vwrFNBcbNQC0fb+tF8sxyKPsqL1DWRw+noK2UnU/tdwRjXUmHPifEPIUeIkDFoD5hle2
 Jq5mIhBIVG/fOXwE+OZyhYvngtbU3+n4UV+EhObPlFN6BZrUo+YwCn9PCMnWf8bEb0Ad
 E6v/YONZQAoPQ8eqg9dX27JbIKls213uudkgw3XGIdG2OoiLqllf5XeAIgvKuAGWEzHz
 0uVE5CButeZiJ4Twa8dfr2o7gXcWz/yJjLqva5y2hAiYHgcEh/PhOrUEbUg88Mu9hmkK
 7eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nFl1ynvr1uhEcB3rmbTJ0VXwIQDyuN2T1XrvQVdal/4=;
 b=QC2AA2zBLOwkZo37wBmEN/tgSx+kLXX4hJeQog0zkyC8ycA9Gk8/9q7/Sie3MtZrTX
 xlNqhx3nyN1HRTiFE08DDMW6Z9d1iTg+FX4Sd7vxl05MoSS4QuUqqs3puBE2h6hscM8P
 2puPrcMa05vOVPrQD9m7wpMSWATkWM3JnqX4LCDKxWmimKuGH+Ud7qDYVvww8nc3VHjt
 3zhb49p6Ny2xjyY1IHBZzp/6KyVwqWLZQw5oiIHofRJL4Jb8hNUO8BqVTpDr/FIC3UJ+
 tmP6kSBYj5X+wLDCSoUXt7u+djevRmBqbMGmblej1VxziJisI5whNyIOw8ekVJl7oaW9
 KvPw==
X-Gm-Message-State: AOAM533d5pVu4S7/5BKbd4pqWUDn/IK2mdYdF3ZQex7cu1jNylOR0P2O
 5WGNl7qAulrcPVJACxjdGUUZ+IlqKhevZTDnwovGFQ==
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr49278843ywf.347.1654865635981; Fri, 10
 Jun 2022 05:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220609214125.4192212-1-wuhaotsh@google.com>
In-Reply-To: <20220609214125.4192212-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2022 13:53:45 +0100
Message-ID: <CAFEAcA_ioevQQAmahyx6UXaFxUnzQ5=uJSr8JoFayC41SsCqVA@mail.gmail.com>
Subject: Re: [PATCH] tests/qtest: Reduce npcm7xx_sdhci test image size
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com, 
 f4bug@amsat.org, bin.meng@windriver.com, qemu-block@nongnu.org, 
 stmao@google.com, richard.henderson@linaro.org, jsnow@redhat.com, 
 lvivier@redhat.com, pbonzini@redhat.com, thuth@redhat.com
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
X-TUID: +LWZ/ZEFDFdA

On Thu, 9 Jun 2022 at 22:41, Hao Wu <wuhaotsh@google.com> wrote:
>
> Creating 1GB image for a simple qtest is unnecessary
> and could lead to failures. We reduce the image size
> to 1MB to reduce the test overhead.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> ---
>  tests/qtest/npcm7xx_sdhci-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM
