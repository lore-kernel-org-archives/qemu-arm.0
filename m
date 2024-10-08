Received: by 2002:a17:504:1f11:b0:1be9:327d:8ee3 with SMTP id z17csp125835njl;
        Tue, 8 Oct 2024 04:43:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVPoB+fmerqMczvLjW8sTSu6UxaxzypbJJempf4QXf6x3sNYkWasSrRkpsk0O5u+SPGefKxOpglBs/CYg==@linaro.org
X-Google-Smtp-Source: AGHT+IHVWHjpCLt0sNbtc5ffWrXsocfrf1IqcGinPdWbXRXmWK+cnP1PLESI8afLxxWe7G7+kFAV
X-Received: by 2002:a05:620a:29c9:b0:7a3:51ed:38c0 with SMTP id af79cd13be357-7ae6f3ac39dmr2242039385a.0.1728387805481;
        Tue, 08 Oct 2024 04:43:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728387805; cv=none;
        d=google.com; s=arc-20240605;
        b=fmLr2yexeY0nswAF++tYzI0+N3PmgjlMfeNhbN1ukKRiZ3U+JK6QNt6nGIXVm3KO6x
         CdOuKbVoIDCwHqet0nQMLDBagfetb9oM/EulXIbpyDrcUr20HaVwnnjW6iqLcdA7k07Q
         b7lHVKJyQ3eK0TE5GWGXRnswLCca/Zqrv9HI97Wc2oddJXrN9ZgjaQIKnLPPcfBqJQX8
         zsIdaJgZNAFojBUdPu37zcm3zd2gv9cVql4G6tWwyUVkCWA9fyCi/Apix2D3mBSmuuS0
         AG3bRZQ2OeCGE4RCfSm6IZeSXnmtDrAePKSVNj+ALpKqJsVV7GfpAhJ15We8UheKLN/K
         TdlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=L9bjrKMiG1XjAfVWKSbhToTRw4R1e8uTq9PWBp2Y6Go=;
        fh=6oWnXUonQFqYnF+SGjh7TE+Ljxhn+8dv4ZLCo2Gjx7w=;
        b=GT1fUQ7UeDWaZ+eC8Id/20yAwmR2/eo4GZPXg9yeKtrwPxBcHzKIUIhk5wZQmKxmR/
         ZgLDNkBBk7dJfSiZC3cbjF+vQcDZvM9vAki/gdDJQWrtMNbCcgoR27h2zpccYasMJBQu
         uIrq1ojoNU9hbiSMK0DxxjoJitBuFO7rwInD2CBsD2Pj6DE+Foydxsd/t+zTbTv61WVC
         r0oISCJ7b1MTE1rssh++ORvefd4SJK4Dp2cZizfxGr0YrKZkSfXVzx2usTH0NMVYFM1L
         nHfubRv5Fdrk4pEPCE6ddkpgT7NcwQlWAgpb14JSICzKsRI5nvHtL4LW3yh5a7IKYspw
         wG1Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mZo4ShUr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ae75764fa0si810356885a.509.2024.10.08.04.43.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2024 04:43:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mZo4ShUr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sy8c5-0001Zk-LZ; Tue, 08 Oct 2024 07:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sy8c3-0001Z7-8u
 for qemu-arm@nongnu.org; Tue, 08 Oct 2024 07:42:47 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sy8bz-0008Mc-LQ
 for qemu-arm@nongnu.org; Tue, 08 Oct 2024 07:42:46 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5c42e7adbddso7498822a12.2
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2024 04:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728387762; x=1728992562; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=L9bjrKMiG1XjAfVWKSbhToTRw4R1e8uTq9PWBp2Y6Go=;
 b=mZo4ShUreJ3koStqNkIFzWmqFEl/ZLFz2IImzXj1ljHFpg2fYxVtpVXzRc3vF9Cj63
 dB3HGjTs4sA7AevucC1YDp1tudyZQLQAuUSXCfEJpKJn8yx0hphWe1DvfcLNanlTzHUt
 eucuOo8KYlUK8PwDjXZizsczgfRq7TCd+WqK4ZvBG0tXb74kV/z/AtB6BhzuqI1gUWkO
 yYWKmpaiYba9ty2HWlZQ0h0TCgUsuDsSMvc2LZC0EwC7kPcNY03CgtRMKIUH4SFbfppS
 1PzHP7K07ZXMIPyoafIwJAN6r1Ra3kx4blX4eUhNAputXz7pVpK0T+kn3YBSw0LkCG3J
 HwIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728387762; x=1728992562;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L9bjrKMiG1XjAfVWKSbhToTRw4R1e8uTq9PWBp2Y6Go=;
 b=pCFn8EEqN29cg0bN6z5OnQF+r8yKNLWa9dNNEnLJK8e5KckeAu2ZWWWhwPeRu2S6Jm
 b3BCLj3PbacfA9JdQzoH+F32mXD0HQbPkFDD2fYBspYXzNgts3ZcYkhRJGlGpldbnvap
 TE/RsWXZ5RQZ2CVF9T++n30ECRO84beJOdnjChA5Dbit7hGKnF3CCZClxXHl0gBUUPA/
 x3c9mFKjESkXFcGzR2Me1DTTwbghHpGd3Kw3XfOiCg7g5RG2G3SmvHTLdSfOXEkmAubX
 qPIFR3kleHEotOJ8gooVIc++ZdSfHH9e4GAEOs9Qe4r2X/CNi/M9ewshiIgoPQzsl4Vq
 YSiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3+GfPdBeOKj8eWN8ckJlM1U21H6wgSe/Qj5zPjXuQN4m6mpEQW3tyqYbouyxkvyQ452IB1iQqnw==@nongnu.org
X-Gm-Message-State: AOJu0Yzquhdx6pnkPia/w3k76R1cD+LGEoJt6/Yc/WIE4qtRXzN8cuZY
 5LevcfBQovIkRzZTaGmaPc2xwT+COF+rqisfD1qJGlU68lgWccwe/hYK6Qc/4fmgsezXIfySZMU
 isLy1K5lxGGQg9/AeJYcCuh/H8FSbEYOI+1ybtw==
X-Received: by 2002:a17:907:36c4:b0:a8d:1303:2283 with SMTP id
 a640c23a62f3a-a991bd7a123mr1614170766b.30.1728387761760; Tue, 08 Oct 2024
 04:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20241001221349.8319-1-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20241001221349.8319-1-strahinja.p.jankovic@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Oct 2024 12:42:30 +0100
Message-ID: <CAFEAcA_xA0jCSd4Q1rbu9KyphthDrwLyiHhFdZnK9JwDXSCCBA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Allwinner A10 SPI controller emulation
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: A+dcf50eCPf2

On Tue, 1 Oct 2024 at 23:14, Strahinja Jankovic
<strahinjapjankovic@gmail.com> wrote:
>
> This patch set introduces the SPI controller emulation for Allwinner A10
> SoC and Cubieboard.
>
> Only master-mode functionality of the SPI controller is implemented.
>
> Since U-Boot and Linux SPI drivers for Allwinner A10 perform only
> byte-wide CPU access to the transmit and receive registers of the
> controller, the emulated controller does not implement DMA handling,
> and supports only byte-wide access to transmit and receive registers
> (half-word and word access will be treated as byte access).



Applied to target-arm.next, thanks.

-- PMM
