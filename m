Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp167448lfo;
        Thu, 28 Jan 2021 04:13:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxTzVRYb0MPObo3N0v8zYxJ/9ZyzgfltL1lAKUYhywdTIZ/adWmGUnVviXxgjPQUKX4woPO
X-Received: by 2002:a25:ea09:: with SMTP id p9mr23167649ybd.109.1611836024985;
        Thu, 28 Jan 2021 04:13:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611836024; cv=none;
        d=google.com; s=arc-20160816;
        b=Ruyx/HBVunNvpAjtJkerpYdjB3zKS1UHaEmUQpTloaAHlmZqckYZJDEHcmbMEm2pa9
         3Tb7xmN+nPKeX5Z39FvfR7mtNsEIJiq0LygHnBphmqq20Ty171j5VKX2uJcQNzawHRRF
         7l8jLxPPwKL8g4q7gAKGUi8oejjJqaM0k4uRte+ZvFf3p08L6vWkVXN6vonC7yWazUU2
         zYM6+eila2jTq+Yq5ws1lYAqNpdw2ckgdIgnuDcYLwP50sp/PwCLlfDZ5jf33UjeV67Q
         BPz69qlYN2V1YZCJAY5EQYg75eDQSrCrsMXJOjSNPXqKtJYkS5jF3nm9sHSIFOGYOILg
         rhxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=o1MPU8r9HSmLvy6ehcR6sHJeNxsgx0I9ZQfq80tgEmo=;
        b=XUa5H/syWnATLFZ4Psy5nCN1b1TX48jBaoPR6gviK2UJz1CD9TYRmwi/K47gMLfOBJ
         9dDuIAy62nKQsCUAmqRoDPBMG4QV5n3Ig2bYC4ZsNdnNKGGhFU2W5lbaSfK8zvu9PmZ2
         kZSoXSad8PfsUiSDu7pgmu/STZK6DEtAXbr9JSc8yTU505QkpBr5NyR0GWtc76pFQqrk
         0+rDbOy3lfPHVupYW+uk7AGnxVQR8AQxXiQTWXDa9aLODsQ3G4QSJVegui7U1bojchjL
         0OW5NUPJx0nxTOoJmB6gMGAzNswZpntzRj+FpGVUSD2HqSapt9x75BcE73i2YDGcDvqX
         TxYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="pifV/XKy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13si5409488ybf.315.2021.01.28.04.13.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Jan 2021 04:13:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="pifV/XKy";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l56BE-0002f5-B9
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 07:13:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l56Av-0002c7-UP
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 07:13:27 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:34249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l56At-0007mP-AP
 for qemu-arm@nongnu.org; Thu, 28 Jan 2021 07:13:25 -0500
Received: by mail-ed1-x530.google.com with SMTP id d22so6343665edy.1
 for <qemu-arm@nongnu.org>; Thu, 28 Jan 2021 04:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=o1MPU8r9HSmLvy6ehcR6sHJeNxsgx0I9ZQfq80tgEmo=;
 b=pifV/XKylliHX4mHla34pIWNX/uEqWi71GxxL2chwR6xIIAxdkhniHgc2DySzLgDP+
 Du5mVdPq715SeNmPDb7eMOI9QNbWDskmc9BbCLJMZY6B9oNS/BZLdiguY7zBvLWwTfqs
 aKxoAKk4VpIjCet/azNSvJcmnFM7vZuusP7Ev35oRhukqHIBLcKQvbbcZIN2HnLn0qCb
 1OhAxwr3DFqd5vkhkvl5RucfTSXSEmPFZYZ9RuH9NXGC7hIRXNUbTN+KHbvS95kF6cvv
 GM3pME5VlPcj6CGHeHKTnXQq9uq6u6afNYNo4DR/4Aie7EEgaIjgohbAG0wwFURP3wMM
 C46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=o1MPU8r9HSmLvy6ehcR6sHJeNxsgx0I9ZQfq80tgEmo=;
 b=QD9w90JaP3eegG35/IIjO/sbSFe4BY4rcK0iL3tJ8psQcYeBlO6Mn8sjm67i4ESjXO
 hvcWPoBt9k+BjasKpdVVYM+RX4lpiYZQfvfj04D+QSWPsPEnqoC3hbOQITv1AabtZn7j
 rK5fAcpqPDsHy94TRs+B8YQNM9jqD4gLJZkPwJNE0w41SPZC3UvCZEEdVcOpScgIrsWr
 uxnF/IotQvIyP+O1e84xpb83rndvXH70Q16/7k+jKNXlD2NhF+z2A1y67rAoEqmohan9
 ogsoADLpfAOsaU6+/bc+z9PEy6jT5aSRKtmqt3836N1xt8CpD2mS9zfHAN/jC62nOHZJ
 sCtA==
X-Gm-Message-State: AOAM5317NBSlEyt4QlyaTzgMk5yb5QNJ/rb24aIwW/+lf9RaQb+I4bwj
 f7eYQtDzQnqEdF/GU9JR3ugPxeUnpuK5b+wWtxhXrg==
X-Received: by 2002:a05:6402:b2f:: with SMTP id
 bo15mr14125279edb.146.1611836001301; 
 Thu, 28 Jan 2021 04:13:21 -0800 (PST)
MIME-Version: 1.0
References: <20210127232822.3530782-1-f4bug@amsat.org>
In-Reply-To: <20210127232822.3530782-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jan 2021 12:13:10 +0000
Message-ID: <CAFEAcA_Brm2KH35i9OkihORA9RnOYUUH1Fngh+rJrPccZOrKrg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Replace magic value by MMU_DATA_LOAD
 definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Joe Komlodi <komlodi@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HLKwk7W/gptS

On Wed, 27 Jan 2021 at 23:28, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> cpu_get_phys_page_debug() uses 'DATA LOAD' MMU access type.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  target/arm/helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM
