Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp2709256lfg;
        Mon, 10 May 2021 00:20:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzgMK8+zExl9BwJxx251PuP9O37DOnr5EJsmFT4nMgiN3We4aRfFw5tCtMhsjkcYO0kwqcR
X-Received: by 2002:a05:6638:3ab:: with SMTP id z11mr20235986jap.58.1620631259182;
        Mon, 10 May 2021 00:20:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620631259; cv=none;
        d=google.com; s=arc-20160816;
        b=0sPoTNobif6HNtp3UWAZ35EfdAMoLcZJWpDG62RgNjwoGmMCL0t7SN0AZETnIG9Dth
         3nNUUgBA+VV6/j6cpr1pkNQDnFdl+tTsZ7CnBXl/8QCGv9237ngcQXyiz61WDWOE5lFN
         0oFs1Rt1kAbhkiQtkcJsrObiC4oGk0M5oBBKs90osD9k58pjY6xbEIxi5vcaNwcd2T7C
         WGLMFPTRO3kJbjDeZifDPx97/1avgdpcxdtA5Bx+Dly9d/mGKOdQuew0TsRqsjl/GJo2
         GdHXwMiDI0CCWfzhed2HI3u3fkTLs+O7pXXCCjxMlxq4SiocB4Jzh5F1OWy1FOTofL0A
         9AaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=w6Iq2HqplC+makTPcxbfwWjM3P10y//4+6kOL15hviM=;
        b=VxghyBdEHcOJjAmbTEgG1zRruwUlFBPAsoxoubNbbruN/h+gwAs2013DrTuPazDDlJ
         2Rbt52UgLMAc2wqrLjHvsabm58BU0lyjdFHwDYqTzZuRiRDf6bNKMqvkW2UUcXzRCp9c
         eWf+jVLTZeu2LDUpO9Pf1popwtS9JvKXu0oWpuLaPsApdveU0JeWKLbMJuq8IJ1usAl/
         iGC45xKwUj7AJ8nPpadveB+U+PxKmAaP8V4PcnWS5cBG2/fwMVN1tA9+ASnFcTWdn4uK
         DLBxmbw0+wj8BozeH8fzaIEGop+wZRsxQh2ewJVjApzlEfE8wsC3GzqvrppQDKAiLS31
         X7Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=iKgKXnKh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10si13019765iln.4.2021.05.10.00.20.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 10 May 2021 00:20:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=iKgKXnKh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lg0Dq-0001mT-9K
	for alex.bennee@linaro.org; Mon, 10 May 2021 03:20:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lg0DF-0001kO-5a; Mon, 10 May 2021 03:20:21 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:34659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <joel.stan@gmail.com>)
 id 1lg0DD-0002tf-9I; Mon, 10 May 2021 03:20:20 -0400
Received: by mail-qk1-x736.google.com with SMTP id q127so14486802qkb.1;
 Mon, 10 May 2021 00:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w6Iq2HqplC+makTPcxbfwWjM3P10y//4+6kOL15hviM=;
 b=iKgKXnKh7HXyuV6RgGtdl0fRM6YYvkur0DOKn/YnPaM/kEq58wPdF8I6YPWIruOXTB
 6mi/BapExxFOfYSnZQZihP18fs1yocdeldx56X5iNztL/CD7iIX0Eu5rTcN3vTQFCqDx
 zs7zDotl8kR+Q9Fp3FxAFhLM7dqpFhJz5mUug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w6Iq2HqplC+makTPcxbfwWjM3P10y//4+6kOL15hviM=;
 b=PdDF0Ep7ZHL3XXEQ3Z3xzDf9qGsK4y58rloGkV/d+z8G7FSrUg9gXPCuwBNZlFfHbq
 g68UYuGTgW9BYsmVd2T3uJliAsNCaPeobJdSr2xsY1IIJT6QNS2r0vfKxhm1HVKecYA8
 uQkXFbFxyEAndFS+a+CuikBCUiG5VuDpxHoSh/YwAg3H0Ar0k+bdau8IzGjLqXNDYs5N
 S1nACwLzQcN5S1U7EY5id0euczKtY5j7BDdJ+kMA5h/OMcXFgEr8eemCRUvDzSmCdFX6
 8ckKNkdhWfA+EdKweZbWthA8S5rAtN6DQhamRJwKj459qiZaGmMDe6YVW3+tFkGbof/y
 jJvg==
X-Gm-Message-State: AOAM531t3DAUka9qThIh99qIgUDdtumN34tlbtoue+qsEzpyZZRb7DDb
 lthWE0/JmqNxoH98ob5UCxBZKLmNpLhYAwhZSJM=
X-Received: by 2002:a37:f91a:: with SMTP id l26mr21250961qkj.55.1620631216774; 
 Mon, 10 May 2021 00:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210505170101.3297395-1-titusr@google.com>
 <20210505170101.3297395-3-titusr@google.com>
In-Reply-To: <20210505170101.3297395-3-titusr@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 May 2021 07:20:04 +0000
Message-ID: <CACPK8Xc+iPifDBgo7B0VjYFCwtJMpf3unJ0CC_qPYNX5VLeEjg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] hw/misc: add ADM1272 device
To: Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=joel.stan@gmail.com; helo=mail-qk1-x736.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Hao Wu <wuhaotsh@google.com>, Corey Minyard <cminyard@mvista.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pp89xqc4om2C

On Wed, 5 May 2021 at 17:07, Titus Rwantare <titusr@google.com> wrote:
>
> The ADM1272 is a PMBus compliant Hot Swap Controller and Digital Power
> Monitor by Analog Devices.
>
> This commit adds support for interfacing with it, and support for
> setting and monitoring sensor limits.
>
> Datasheet: https://www.analog.com/media/en/technical-documentation/data-sheets/ADM1272.pdf
>
> Reviewed-by: Hao Wu <wuhaotsh@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>

Reviewed-by: Joel Stanley <joel@jms.id.au>
