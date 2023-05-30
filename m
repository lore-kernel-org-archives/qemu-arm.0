Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2124464ejb;
        Tue, 30 May 2023 05:08:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ExBrACh8gj6sNyLvviIYWuP4fRZsHbd+83l2cknc+boYm0M2f0kVNIqLwykD+UwhqSxVF
X-Received: by 2002:a05:620a:6746:b0:75b:23a1:45f with SMTP id rq6-20020a05620a674600b0075b23a1045fmr1483662qkn.37.1685448505070;
        Tue, 30 May 2023 05:08:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685448505; cv=none;
        d=google.com; s=arc-20160816;
        b=F/JDGJT5UF0Yup0r0roVFjRAHz6gkwqfSExV7bmLXjabkgOmBz66XBFgdkQUflB/n8
         /M0k6cWTkG66+WzNQUHOPyRHXxmcmyIg+h3q/krWYiJ8OfYumvr4wJh5zdVHbiHeZPdf
         5eca2lHtjNruIvVidibkid0VzxtL3iSpOlBrdPjsDh2ltIZXiQjk+cvoQNrNfxexdTZ9
         mj2+4E7a9TDywvAS/c2rfLCst1ioq0lIdGC/mJoMzJfnEL6FcKVfMyLFD6VLD6eTKZnm
         wsDHlnSfWHn+ZFgIZysy7N6nW+N/J3EXhefXuxNmtuj3V7eeYyj5q9nswNoSsu601AJ6
         qJAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MSuWP6Tjlq00tgiGKc8x47EKNDOX3LLt5p9C7mdvsOQ=;
        b=m3Fqe94W6pyMUC6dVmINxuDxSKParRhE8g6XDbnWDPGtL2WKozw/m0R+WFL6NSrLIS
         tcZS1QfDBKrgX1bzyJVTVPxZ2b8weuFOzVhanQSDO6LH8fIjcyY7r+KS8DC4Tc9d30xd
         +BHn7qbFskaMWK2CwkEx8tMOUsF3qhsSOV5q4VdYQApBRAv2fa/AI3O9kNf27rHQYPxi
         Hc7AJvOXDRn2RZ7GBFyvBHiwLZjg0zlu+7AOMfcAz5B7cmLJfUhCjqBY0e8B4oCwhosf
         9ErIPVqaViotB6ExeAfPHlFE87g8p6A+WYwbnlYw/JOecYFPierxD2Njc1GklZcUUW++
         X3fQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cb4QN6tk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19-20020a05620a141300b00706672c17c3si6163586qkj.758.2023.05.30.05.08.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 05:08:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cb4QN6tk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3y8y-0008GE-DO; Tue, 30 May 2023 08:08:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3y8w-0008Fw-UF
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:08:02 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3y8q-0004FK-32
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:08:02 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5149429c944so5255752a12.0
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 05:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685448473; x=1688040473;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MSuWP6Tjlq00tgiGKc8x47EKNDOX3LLt5p9C7mdvsOQ=;
 b=Cb4QN6tkD5YWQi0z2tF7XSaQ537lWzF7uiGWZWn2xObk64GWmKU4dXF/uMUG8x8O9I
 17WJVzwaKkdpdiK5zvWKt0ZQ3BJnkO/5szrM0II0ZHSb3ssQ7gAo+SCSADodESihwSUj
 P8HM3cb5trpTaxfgPtKMqBfebQ+X9zGq+LKALlJylL1235TJPvMelAF4NkxziEVsR9+W
 jVDMtZsm1rvwJVcarrD536m7lc9LsmH0w8ywrIdKVkq8KnJQYDpA0fL+Hyi2lJQ4Yvqf
 rEfIBf9rGSmGI9zvWxTfEx6T6UDXyRbIEEPRUOCapvakHHZsPp03v9sq/tVHzYzD5nCh
 2jiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685448473; x=1688040473;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MSuWP6Tjlq00tgiGKc8x47EKNDOX3LLt5p9C7mdvsOQ=;
 b=Nz0FFPBcQb2JZi7dvCRwsGHkKGPWx0WwRTVqAZ3Py1muRaBtihVLam3Z/IpaR5HUTk
 n8gzuWQmtGYMF05TthPWomSJ9bF+WvNYf1V+0rBhBmm4izwNgmj/oaLyq0fQ93k9GsP/
 4xUjKlkAMmrZE6VbRQrxcCs5dNBsVx4awyhn0HHrEf4LhwuDp3G2YOwKH9mVlvX6jZ0m
 be5GyjISbd4nmP6Ay0KQvPdRxPkDQdzZpLY56Hey4xj292GJenFcmNk8Tt2YUB858rzO
 bOLXgQMX6e00hrMHOgjwzZTtdPyUGm/OQVotgnqL5vgk7FMg43wpTF+K1Qow7mNxpokk
 6//g==
X-Gm-Message-State: AC+VfDzkeRMxXSb8gtlAri3z/YJbqxsSSZIG2kbnMnVgKTrMdsxtm13o
 8+N0C7XsyEi2B1R795E93uuYJN+R1QGvTdAztG7Q6w==
X-Received: by 2002:a05:6402:1517:b0:510:f462:fc47 with SMTP id
 f23-20020a056402151700b00510f462fc47mr1254911edw.7.1685448473045; Tue, 30 May
 2023 05:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230523180525.29994-1-farosas@suse.de>
In-Reply-To: <20230523180525.29994-1-farosas@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 13:07:42 +0100
Message-ID: <CAFEAcA-ozqau8_tM9d=VH8RPfG4SDzgHWkvVJX4g3y5qHyiSsA@mail.gmail.com>
Subject: Re: [PATCH 0/3] arm/Kconfig: Some convenience changes
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: A19K+sx8odxh

On Tue, 23 May 2023 at 19:05, Fabiano Rosas <farosas@suse.de> wrote:
>
> Hi,
>
> These are some changes that people asked for/suggested during the
> review of previous Kconfig series that I haven't had an opportunity to
> prepare until now.
>
> CI run: https://gitlab.com/farosas/qemu/-/pipelines/876384304
>
> Fabiano Rosas (3):
>   target/arm: Explain why we need to select ARM_V7M
>   arm/Kconfig: Keep Kconfig default entries in default.mak as
>     documentation
>   arm/Kconfig: Make TCG dependence explicit



Applied to target-arm.next, thanks.

-- PMM
