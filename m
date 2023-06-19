Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2734640ejt;
        Mon, 19 Jun 2023 03:36:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7y7++yZqKe8R1GXiO4AJOaIFSEZjc9N6+3TMvRJgY+c+UO5xvzndAw+xDhoO44h2LOMUJy
X-Received: by 2002:ac8:5bc3:0:b0:3f8:291a:d701 with SMTP id b3-20020ac85bc3000000b003f8291ad701mr9890025qtb.22.1687171016274;
        Mon, 19 Jun 2023 03:36:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687171016; cv=none;
        d=google.com; s=arc-20160816;
        b=msbU5JpUBN7/H0qKHmxbnmntsXkxhB/nMqAL0dHh6JSOzTE2XaUMrrhcIm95jMVs19
         bcz43x+J9Lbc5uQCvEDoXS/xoKkCPYfGTPR+tUt5PcaBn/YkgUXRVQYXZjktO6ZJ5/xO
         2zi0Ak4Ljqwjidpbyj673Oq0/3FUpSL+ihpFz6eCgVfy3Xax6MMiN7e/nI61WAAY6zK9
         rS7sKp9ywvzGscIhmMAKHxoIBxYnujhe5K56UhJzKWSj8HvVXOCYTY5YWC8gTb0XO8Cf
         L4dZB0cz9VBvnQ554FAUwAJJoAPraPWbcIn+whwYoGAOF0CWMISO0RE3taugAFEZTgcN
         0u/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=J6jct1q5lacDM58VmVdH1mphAGq2zPurPNXj0DlXZxs=;
        b=UPomqxM6mvNpfxlCMW+8bbxXncrmHULO2UbR6ZzXiHSPdxMm+n+WTxlFlqSpFxmcAr
         HvwLrfL5SlHPDk0hqRcm+/NQKQQJRQmk28VKkbh6Vm3Hr+LWxJbHV7/ZC0C5P7VPU4h1
         7bNvyNvZemxf7TYfLNzu5nP/FT0eXU6Nk166dlcVsE7CVADHGrZO2IdhdPi+T9YGETxl
         gHsZ8LXRZopqoNr4Ea1SBB3RjT9jcr9lLuteCWbXY7zBwNwnwtMmaWixCXquViP5Azdo
         OqvE7Nd8c5tU6imkdXTvKdoscZr6heaZaahNm2CE+FDDuLMyvvNt9MoLMzKTGxfd4M4m
         7PUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WMNg+2uw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15-20020a05622a15cf00b003f4dc3f05d7si13138201qty.563.2023.06.19.03.36.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 03:36:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WMNg+2uw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBCFa-0006h9-3U; Mon, 19 Jun 2023 06:36:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBCFT-0006g8-7h
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 06:36:40 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBCFQ-0002pK-OC
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 06:36:38 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-519274f7b05so4525393a12.3
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 03:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687170995; x=1689762995;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J6jct1q5lacDM58VmVdH1mphAGq2zPurPNXj0DlXZxs=;
 b=WMNg+2uwXKc5dP9UueUuYBydYKj2ZehAHR6XDHyLHGM/2EFqTFnCOkYsqqgR2se59E
 svuer5UTWJvIsTCQqqqV+xNTt8gtsXmLwRcPoG6NA/GWMEnxabaF3ky+cpnplZDfNOug
 ZAWj7mQuJx235xkJGa+iH79rmqv/oorrxP+aMg/9wD4JahCVlOotnHxquQDlNKCqy3r9
 NfnpWnOuwV0gFZRaQi1Ef68DDpwpmWtJ8P/BXQBgEtYGhhRbIk1y5gs2Rc9IiSUpuJ0J
 emsb0P6u+AXdyK2pKPWxVt/rXbpdZ0N9P3CWBETW94xDakbz2B0+vJPHPzG4O7LFby52
 +kxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687170995; x=1689762995;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J6jct1q5lacDM58VmVdH1mphAGq2zPurPNXj0DlXZxs=;
 b=W6Zj/qldbZHNnRwBuz8qpwVSHbOLHpnGk0zBs86bYsVap8i22csFzQvXMi95a4hjaf
 Ne3RHLSR/DQRFYdMSpeDriBDOddgYI+bN2ifbXD3BforGImsiwC8lplTs2G6Nb1Gg5tz
 lK9SnMlU79Pgk2HJbYwMrDgQz8E6l7MAM048y1bpA937qqbYCmxdhhVp9xx/2eyViBTA
 OH9CRFKVMtOUqxe6RrJS7hrHGuveADxQwm6b4h9lpdO5a5gMkj1zA6qotz5SRyDU44vD
 4yboo3U4rIGbbGlmCzdMy7xkzzm9wJtRg3O6XN/anf+6Xi9K9i/mFVeNgaBwsaxH4AWq
 BRfg==
X-Gm-Message-State: AC+VfDxkp2OiJzh+zfa+cAXjvVRABa9RUJOlC6ROcoWlykWO9ZdEw/X5
 JgU/G1y7kw4T9LtvzRFXPoCih1CWHgsFHKkrEgxTsO411KM4pVrT
X-Received: by 2002:a05:6402:64a:b0:510:f462:fc47 with SMTP id
 u10-20020a056402064a00b00510f462fc47mr6553339edx.7.1687170994993; Mon, 19 Jun
 2023 03:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230608154129.133169-1-martin@kaiser.cx>
 <20230615142256.1142849-1-martin@kaiser.cx>
In-Reply-To: <20230615142256.1142849-1-martin@kaiser.cx>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jun 2023 11:36:23 +0100
Message-ID: <CAFEAcA84ng=jMTvb+XHrvGatf7UOPNxg7u+m-LXKVYT_kaDm5g@mail.gmail.com>
Subject: Re: [PATCH v3] imx_serial: set wake bit when we receive a data byte
To: Martin Kaiser <martin@kaiser.cx>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: 4zvGy9CEcqzt

On Thu, 15 Jun 2023 at 15:24, Martin Kaiser <martin@kaiser.cx> wrote:
>
> The Linux kernel added a flood check for RX data recently in commit
> 496a4471b7c3 ("serial: imx: work-around for hardware RX flood"). This
> check uses the wake bit in the UART status register 2. The wake bit
> indicates that the receiver detected a start bit on the RX line. If the
> kernel sees a number of RX interrupts without the wake bit being set, it
> treats this as spurious data and resets the UART port. imx_serial does
> never set the wake bit and triggers the kernel's flood check.
>
> This patch adds support for the wake bit. wake is set when we receive a
> new character (it's not set for break events). It seems that wake is
> cleared by the kernel driver, the hardware does not have to clear it
> automatically after data was read.
>
> The wake bit can be configured as an interrupt source. Support this
> mechanism as well.
>
> Co-developed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>



Applied to target-arm.next, thanks.

-- PMM
