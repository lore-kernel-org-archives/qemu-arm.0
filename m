Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp3819530lfc;
        Mon, 19 Jul 2021 05:57:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzHUMhJiCSaPelfRG4OEMNxTy7UUTytxvB/y9Nf3KFpj7t3R1Q8U6cvVxqsbXjUq1QMYse
X-Received: by 2002:a25:ad96:: with SMTP id z22mr32202446ybi.178.1626699452261;
        Mon, 19 Jul 2021 05:57:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626699452; cv=none;
        d=google.com; s=arc-20160816;
        b=vdf8aQtpXpoVpIwuiQqo0CETWZQDZLtznCFvcfJ8iQMU4lhNoEbKjtwMkcnBfEHEwc
         DcGdTYR0X+PhAQQ8xAg6FRcGHxvKzdjMrffEfeL4QaX432VMoOHdJjBBcFOLRN1OwEdh
         jowZl5e3dwxS1CnhCwhVsxHSfkZ+G74lfCdjc4NytnBxOpZIuvE+AFBijroP0BMT9O1d
         tUTwQEveGpEZKwDWd/zIxxSI0bx5e9zbH9WuWVJ2P52dqAcT8bhrz8RWEWYhSJmOn0Hp
         6FxE4ALv6vW1nyTtA47lESFHAKCT37cfJi1DxuxDBEISpwNYEAWgD/Q0Fdrt2fAEVttM
         RDuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zYvO5vH/6ycZ3HLaq9mAB8JCvyq3PmppixcoiEfCufI=;
        b=EfLDnrGIbpF3MoVHRTRXtj5IVImLBzcUGDd9mJaiAiAJ0jx2qnLRmIRf9GRaJTA4Fv
         eJ7j9FOJaXbW5k1EYUdRJBKOhCUhySbI9OQJmEoK1ZtmhRUCtkeR/iXD1Cjk+UN9LLju
         2nFoj7fnh6t+a/SNPug9JJ9PVYzTEOp9Um05Osj7ixgb0QKWistX+28enX6XqSCYTe+4
         LZZJOgKp9VJ/tblAOIpTZNogtIGMGlDWLRBFR0LIDs54WNwE7m4S/zAS+aJgFBlZCyqV
         +TYIX9gjnuEoIDuof/iJ6TIFqPr7cGc4k6fICCBDA5QZPOQpTxVAAhZL4atrLqaoFyIC
         Tqig==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yymkiuru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y196si20403047ybe.243.2021.07.19.05.57.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jul 2021 05:57:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yymkiuru;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m5Spv-0003iK-JC
	for alex.bennee@linaro.org; Mon, 19 Jul 2021 08:57:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SpU-0003gR-4u
 for qemu-arm@nongnu.org; Mon, 19 Jul 2021 08:57:04 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5SpS-0006gr-LV
 for qemu-arm@nongnu.org; Mon, 19 Jul 2021 08:57:03 -0400
Received: by mail-ej1-x62c.google.com with SMTP id dp20so26592829ejc.7
 for <qemu-arm@nongnu.org>; Mon, 19 Jul 2021 05:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zYvO5vH/6ycZ3HLaq9mAB8JCvyq3PmppixcoiEfCufI=;
 b=yymkiuruDumPphv3lqfIRv8wCJFWor7muUDfj0rUU8XDQfk6ezJdt+Govha2zmjQs3
 CqTlZgxlkwKVMCqLim9V+DII90AXqWXlX87Mg5JzdROsvadHlN/Ai3ID9kVcMkxhjxGq
 UMGBK4052EUZNZkD0aElzt+bSTsjT4j7rrwnmdL0bBr9Ec7p+6lP/Ef2sjKZKEQr/tK/
 lUe3ArOirfT8rlBu4JmqnPPg29IQ6hs5w7riwIVmKhk2IiEy6BI/PfpIex2UNlD1jdcZ
 hunip624Ln/Upy2t7rGPVSa9gg+A+PO9xq3FHD5WtgFgDkbb0DJkpgYZp8p/T05pMm88
 ookg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zYvO5vH/6ycZ3HLaq9mAB8JCvyq3PmppixcoiEfCufI=;
 b=OBspl3+3xj+DiNH1+i5BEp1sPxO+ytTxO+Pahp7J/wuDbtPAdoO6Q1kxampFvuWjk7
 exFRO5uOZr3Z83ajewojL4+7rx1cPCu5OzRsnpriINp38nHuful5YoBz0SmvIkIat8Cs
 GvkJ7CMVItvl1H327R2ZI/OBDD5R+VbyDpjSZPw0tZzVMhZdQ8t5zUM1D0fur5HyyDpE
 OYCU0D5tZjr7n+xlco+MXoMuPq7lGRmkgtpcLvfyyTcthwIuLjD48/Algi27E5jO1aIp
 vbkPdPv4aaYBXjovEFMubghIcNsz4wdrSz5MEM4UBo+uA+vJANHvUHXRA9EUyHw4a83v
 85QQ==
X-Gm-Message-State: AOAM532wj6MjLDInCtfAU14inc6HUXPaGe5d5DUUyyNM7dpBRsanb+Qd
 Blqs5lE53ywzniuZyKjNV4iTBllt5KENzRhB9Rg4fw==
X-Received: by 2002:a17:906:a2d7:: with SMTP id
 by23mr26667995ejb.382.1626699421334; 
 Mon, 19 Jul 2021 05:57:01 -0700 (PDT)
MIME-Version: 1.0
References: <1626413223-32264-1-git-send-email-ishii.shuuichir@fujitsu.com>
 <1626413223-32264-5-git-send-email-ishii.shuuichir@fujitsu.com>
In-Reply-To: <1626413223-32264-5-git-send-email-ishii.shuuichir@fujitsu.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 13:56:20 +0100
Message-ID: <CAFEAcA-Dd0eh35CUo7_-_adye+DrTuFK471-A3JfBbegxoU9Jg@mail.gmail.com>
Subject: Re: [PATCH 4/4] docs/system: Add a64fx(Fujitsu A64FX processor) to
 supported guest CPU type
To: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Uty0blFcyJOr

On Fri, 16 Jul 2021 at 06:27, Shuuichirou Ishii
<ishii.shuuichir@fujitsu.com> wrote:
>
> Signed-off-by: Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>
> ---
>  docs/system/arm/virt.rst | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
> index 27652ad..5329e95 100644
> --- a/docs/system/arm/virt.rst
> +++ b/docs/system/arm/virt.rst
> @@ -55,6 +55,7 @@ Supported guest CPU types:
>  - ``cortex-a53`` (64-bit)
>  - ``cortex-a57`` (64-bit)
>  - ``cortex-a72`` (64-bit)
> +- ``a64fx`` (64-bit)
>  - ``host`` (with KVM only)
>  - ``max`` (same as ``host`` for KVM; best possible emulation with TCG)

This adds a64fx to the list of CPUs we support in the 'virt' board,
but it hasn't changed the valid_cpus[] array in hw/arm/virt.c, so
trying to actually use -cpu a64fx with -machine virt will fail.

thanks
-- PMM
