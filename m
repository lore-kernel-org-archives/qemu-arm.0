Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp687735ejf;
        Fri, 23 Feb 2024 09:00:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXRwZJaVErh+RR1rMq8koW4Ds2fnwWe0G4O6Oxq1fh1opsYo7GnEZUncLreGttyF08HG2P7Cci5ZHDr7rjd/nAC4wPVUtT+
X-Google-Smtp-Source: AGHT+IHXvIS0obk0vSx3WbtNRJQEV3C9VJVsaON5QuOEyd3K54i7bipNSez8HXFJ5VbzEhZPFijp
X-Received: by 2002:a05:6870:65a1:b0:21f:1705:d5b0 with SMTP id fp33-20020a05687065a100b0021f1705d5b0mr358771oab.52.1708707629075;
        Fri, 23 Feb 2024 09:00:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708707629; cv=none;
        d=google.com; s=arc-20160816;
        b=Dx8b5o4TZ1lj+HyMoTrb3Zv2mXF2fbr44oZ9lWovaV6LMyGf5Kies2nfda3RplBqwb
         zj5kDnTR+bkz3xcQqIZ6M/e4fJRqLcWENus0oDp+4AMtY3k+cigSG01mqcnA0acGsoja
         R/Q9nlLCAZ6AtrhPCBtEe2+WLmUgTdA4wbuzGaKKwmTd7fqsD9puOq2JUUFfaM2eaVEU
         A9wZRljqdqutmRp4WIBEfZ3YYHVmoDxXiPUYkEC0RnrhIM+4rrEDx2bPeJlD40RVUHDx
         YQLZa5nV3oFYhPZ1qyIqhinZBuXBqYjqW2GTWU+g6dbZDAc7BcK6Q5XHJcpfFY6hoZ7Z
         /RgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=7KNDr97GO0+PbFjKwQ4Ggp+aJeVshonNgPPnWYKiCcw=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=0DWXThdC0seTu6iaLonoc7frc6/eXnwZJxpj07eorodBBcjkzMG5v2QCPjpkJi2YBk
         DDwjujZtrYrJbdOYXg7Cm9Snrxel9asjdJotIldaaA/yQQPjT2Pdr7KZK2KZP1I+apR7
         gqKqbYQ1OCtYetIRFOp4n4CplcSttVcZGdJcDEfcv086W4AsM2tG8ktEfoRAcpyXMXr0
         FTlWqEqTsrwi0/6cz1gC8C4zaGi+R32ddgxbJhnIoJdW6K5aJRQS1XC6FUhYe0DXbkeD
         EmGXunREuVs4pWtobLVB2U+GSs65O1ylxpszOpnkcTvNET8/M9zX1LYnEQgugXaaKYLF
         1/wA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mx4PlG5V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl13-20020a05620a1a8d00b0078799b715e3si4497541qkb.373.2024.02.23.09.00.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 09:00:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mx4PlG5V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdYtS-0005IL-75; Fri, 23 Feb 2024 11:59:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYdr-0004Q1-9n
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 11:43:19 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdYdp-0001Ia-Mv
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 11:43:19 -0500
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-512e4f4e463so1474891e87.1
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 08:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708706596; x=1709311396; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7KNDr97GO0+PbFjKwQ4Ggp+aJeVshonNgPPnWYKiCcw=;
 b=Mx4PlG5Vt4n0MhEec2EagsYvBUMEs5qrElJ6WkymEddRfZyvlMB4KmHoa/Up/igvLA
 ji8Vh5gB4gEoOE5eXYQYsJBhy4o2E77SpHANskO5XI4WsJtDvJxl+Hs3N1kDDijNM288
 6Jq96S3CQYy1gXclXVYCLQk0Me6iInz92bjahhPneNBrj9QACwS8snNzQBB6YZAa4XTR
 had49HcmzZZ+dZyazsgfznuauEBgMCQdsEx7T0JkoYikrQdFutgrmpa0YSdV+Bzds8yT
 YxZYbWwYUScMUqCisw3sXst085bmmMVHLSMP1033ZGM4n8+iog+nJMsyogBhvsmACmPJ
 eBaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708706596; x=1709311396;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7KNDr97GO0+PbFjKwQ4Ggp+aJeVshonNgPPnWYKiCcw=;
 b=lp+3H5GxW8tcJOwKxIacmih0pB+JlWKkcSXQGBsDifacPky7Gd/vGan2UUlz/1ehIf
 r/WHZwJCPjUCIHYcOOGL6+MA28FB9EKMzRta2QzwrQccwBkgmxRt2eYiIhQoTpaXq3Nq
 Fxb0BxcIrSc/fShC45tqvBTk9K6MoGai0kw6nXlLzzLeiPYPLES8zrcPGVuoVn1hCVMP
 m6fGdUJqUU0OJrKkcmJrUf+s2xu756A6RjplttcKj89DD3btJ41NIib0ZjZx37UzYKpQ
 92fZj80pnC0GZMG+eHyK1gTGjqUSgZbUi3VYbY19lSR/7GMM6NLuHhuCfu0X75NClpz+
 9YAA==
X-Gm-Message-State: AOJu0YzKM90VF7A53/E6WgGAjtUfMrEA354veL3KWPuK4X5fVOJD9W7H
 yI4A0ubR1ti2h8CiCcVfzAK/tyZxeOdEoyAnAjp0O0s0f/zel80p9ptUNk5zAB9Orlrg+rSBcoc
 iHbZB85+pfXAelN8r1S/89ImHhifwDnhLaPYDMAYUwSZjTznM
X-Received: by 2002:ac2:4a9d:0:b0:512:a995:3445 with SMTP id
 l29-20020ac24a9d000000b00512a9953445mr194102lfp.25.1708706595837; Fri, 23 Feb
 2024 08:43:15 -0800 (PST)
MIME-Version: 1.0
References: <20240219011739.2316619-1-sergey.kambalin@auriga.com>
 <20240219011739.2316619-8-sergey.kambalin@auriga.com>
In-Reply-To: <20240219011739.2316619-8-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 16:43:05 +0000
Message-ID: <CAFEAcA_SZKjmSPqwWOpwyDwOdP--T-WhHkEFjUD3Sb+UUvO3gg@mail.gmail.com>
Subject: Re: [PATCH v5 07/41] Implement BCM2838 GPIO functionality
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12a.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /yiz88TNVyX5

On Mon, 19 Feb 2024 at 01:23, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
