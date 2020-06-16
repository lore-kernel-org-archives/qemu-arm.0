Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2482077lfm;
        Tue, 16 Jun 2020 03:20:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyqZiV94ojUq5SlZLXsqm3FyytG4UndwNptzKk7NSvZeWx61iGxqAuTr2fRsRzf8EpWEDx9
X-Received: by 2002:a25:abd1:: with SMTP id v75mr3140212ybi.353.1592302855214;
        Tue, 16 Jun 2020 03:20:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592302855; cv=none;
        d=google.com; s=arc-20160816;
        b=RUjfFaioqqakTRY+CLm7aa0KAQGO6oTXNDfB2bLjYAn0L3XBVCv61rukJ4COhZDIv5
         hQiwgrAGhRWRTJxm0hRtwgY/L9blM64WYGyr/l12GFFR5g1zIJb+3++hDlPA5jQQyIVg
         GI9FyX7B1M+K24yzdFXiyqbFQomj04UdxHS33E7LZKqSTy64RFmi/3lgciFrDNl/BHHs
         cZ2fWI97AA/CejzYw4qUcGL5JNapKDaVrSpmSB+IN4mHR7FEE2lCMqMiej9yyioExSeN
         VKSDMJNK5t/avlhDvdDayHA9KXMxWeF4Qhl12jJGlVM753o4uueJmjIqsBF3EKB7CgcK
         ePYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=JuYp9Og1tcdQuLSkD2J/5unvKLO5U1ivbIW1w9nyQ80=;
        b=WccHnAp0IYJL1K/s/U6j0wlDfm94sTTH3LTx1GmzuNESR2kCKn/xYFPZmTs4DHo6s7
         XYF7i9jPT5F6C9bn/RVsBfd3/NPc/94lWcv7AElmhviGjRYp9cpiciglxI9ZvWsBaiD4
         bFNPpey4HfGBr5AWvNkg4nHujE+RGkad0wbfoopItDFgXiGl4zh+s+k3wcau8sdJhR/l
         PKW41ggTMmXXh++W+qExGSKDFp2dJ10QYRokVnPCnR2wghYP/8aoxuvHiAU47xt1STP7
         rJVwX0rdzYbI1C2doQaYXHv97tmhABJ5YfPfhRb3xJwTUhOIR9Sg1aRAP5VQFiL38IBH
         tK2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k9nZCSpp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i81si16121537yba.193.2020.06.16.03.20.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 03:20:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=k9nZCSpp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jl8i6-0004Vz-IO
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 06:20:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8hy-0004U3-Iy
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 06:20:46 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:42206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jl8hw-0008Fq-W0
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 06:20:46 -0400
Received: by mail-ot1-x344.google.com with SMTP id t6so15492751otk.9
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 03:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JuYp9Og1tcdQuLSkD2J/5unvKLO5U1ivbIW1w9nyQ80=;
 b=k9nZCSppAKKgf9stEiP3SuCd0fMsZwbBIuNboa6lsrHv+34GGhEJbXOq6wnqfJPK7k
 L7+/WH0IiN689p4OMJBjTybJaKD1XvyhXcTsWbHQ7C4QuhzTa/uODHD+5sNCSDCZB6cf
 lnF1G4LjYHaeH/RhIUuaAs55U422euCkB763wC0rddEqKDpiTt4bMnVaqjD1Oo42N7H4
 w9eCDWUdZX5rEkLw7Yj6EbNeXCmjsSFx8hJrpIDdwvMOh8Vf5McHqxqAFhh1F/mja5X1
 ohFt+adeb3DEbcUbpZ/YY3A/Y2Har7BLG0PbbeOJSqkZ1O2+iV7sy3sQi9nRinLDF21D
 TGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JuYp9Og1tcdQuLSkD2J/5unvKLO5U1ivbIW1w9nyQ80=;
 b=fUTOonfrx2c4ZcKM8sEw+SdEOfg+cHiMVCUx1gPa0lUkpppp/kXqNnIZbGD5ZeNO6H
 zDSW1ioqHhqkTX2tT5D30RZe76hGP9gPFKhUPcVVD0wCqRcR0fNx25XeyAHxs2EFr/0L
 qtYHucHbE7ZcoKemtU1pkAuP9ZcAO12mmA7MwrlguQoTAbvalzqVAf4nCNi5kfrCWz8c
 /cRlZCcwgZW8VtTGuRt5O59IPXRGS7pcYGrX3ACpcPRTOs/Fg7u5dJXx9ET59F/xg2lv
 pLlUDMVxGznU6hvE0UYfI4FZZ+d7zzhYHj8eL6k9MXEb7cTTz3rENXAtzCHsewNrjuda
 Zwzw==
X-Gm-Message-State: AOAM5308ncpQulEjKYf+wLZKgBjrghbj1LXYMD6BMONiUxpI151er+zb
 MyGEEnux9T6ZqLTkdAeu3bdkK/qJ05K/+5SmmwBJPQ==
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr1795027oto.91.1592302843654; 
 Tue, 16 Jun 2020 03:20:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200616063157.16389-1-f4bug@amsat.org>
 <20200616063157.16389-5-f4bug@amsat.org>
In-Reply-To: <20200616063157.16389-5-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Jun 2020 11:20:32 +0100
Message-ID: <CAFEAcA-jW0n9gcLUoY66cC1BEO3fAX4FZSqxdKjqANot7YBvtg@mail.gmail.com>
Subject: Re: [PATCH 4/7] hw/arm/mps2: Add CMSDK AHB GPIO peripherals as
 unimplemented devices
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Esteban Bosse <estebanbosse@gmail.com>,
 Joaquin de Andres <me@xcancerberox.com.ar>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m4yhawdpLTpY

On Tue, 16 Jun 2020 at 07:32, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
>
> Register the GPIO peripherals as unimplemented to better
> follow their accesses, for example booting Zephyr:
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
