Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp550797ejb;
        Thu, 15 Feb 2024 05:05:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWAoKRrm+anHSQKlr2NTU5WjMBBdMop/DKnzQWLAjggyyJNSeivSoO3cSMmv/K8YyJV9Euez7d7paElBXQ71gBY65theyGP
X-Google-Smtp-Source: AGHT+IF3dmscpQw3zlU4yLTp2Q9SYN7f1EtNpFundMT8QQTd/wWUoQiAcdgqJSr7UDSElug5ZsVG
X-Received: by 2002:a05:622a:1350:b0:42c:8130:9e7e with SMTP id w16-20020a05622a135000b0042c81309e7emr1915549qtk.20.1708002352940;
        Thu, 15 Feb 2024 05:05:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708002352; cv=none;
        d=google.com; s=arc-20160816;
        b=QkFXTBoL7CkJe8hgptUgHGGoHQhJLxW2RNpGHV3KDouCz4ZcMaT9KbGGoKen2tULpB
         YDMWmnFp9NHkBHyXB5P7H03A9vDRCZnpyTLMytTdb0hTJkNJQ9pWqGm1TZutFi5B9hIx
         sMs8e37rJ/jClRvdmduX8857I8MXPaC3XyXtOb998LukH/iSjzbAcfobVqv4sj6CyU76
         +d/yvdqSU+lJiVcFrzfN57eNcNbh/kccPVDtsxx34SRFsxngrTk545S7Sa+WQgRlWS/a
         tlL8BkGZC9jc3AASUQaWf51jCs9S40YZW61YcHFwNrHv77tEOND99tReprJGB1JWSRJh
         OVYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=P72819blLW8ODq1qfDtLgN/B2hbVdRf2dZsfpr3d4yA=;
        fh=okBdXp2j7ZzUTSUTpGCvfl98J3L9zXWlzkZsOlQF4t8=;
        b=tpmBOXiJjJhcc/wPfLBFex9iKnVTMcYj5eb1N0BEc6jCZdlcu/38M8wLR5sNeJlThR
         ZJMMtLhRsvxM8vy4keCk4JtjXEMp+tW8iiBNjP//yNASUH0PRwNBt8942JSHxl42dwaT
         QjpZsmUiBvm7qaUoqyFouvPnOwiFbztg0A6O14j4FFj+NRk+vrTxkprlzg1tmmmR2n8j
         5DHNa+JOseeBFe1zVDDhQHTAArX1jF/MHtvt6mNHl6wl2XsOOqjz1/AC7m01QNxRLPA5
         tzniIiDum+hjfIZ0FYCkdug4U5f9VS+vIZMKypRy0D9S+y413tGBDJVMQPzUZa/688J6
         iAUQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HSJWZeTC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d13-20020a05620a158d00b0078724568bddsi1390952qkk.691.2024.02.15.05.05.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 05:05:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HSJWZeTC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rabQp-0000vj-UC; Thu, 15 Feb 2024 08:05:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rabQi-0000uz-CC
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 08:05:33 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rabQg-0007wF-2K
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 08:05:31 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-563cf32e130so121061a12.0
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 05:05:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708002328; x=1708607128; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P72819blLW8ODq1qfDtLgN/B2hbVdRf2dZsfpr3d4yA=;
 b=HSJWZeTCjLmJTZkfz3YjiYK8ZAYhj52iE+0MisHLmX/dV+0ObLG6vW/D1oQWXNvLpM
 j/2T30NaxR1C0V/2URj2OEtJheGj5LjvXTgZzsY5UjQYV2kP1r+B2sMzbDnPefFTSX5+
 mCS2jKJGTpAIvE3PCcHcVemooBu4zF/n0HsxV4QcI391ok/eaoEr7Y81UhKpifLKDFoh
 J+BGebzdkxKDsHiUWYOJXSK6JPCwrCc6aWJkFMA2GyV1oegJXHXHVYV6Ip5QS9AwjAB9
 tt4ULv1KWNGZvlAhL4cOk6liHl5Lkoo6yRxMrqPgznIMO/s3dZwpboj7apjG+7zbkYtE
 uNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708002328; x=1708607128;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P72819blLW8ODq1qfDtLgN/B2hbVdRf2dZsfpr3d4yA=;
 b=d6UT/FETnL8zST+/NU45ujgFYmzEQjSsLq5LKKoIonKqxjWao68v6QrxsPgz6MMATj
 L1j6oVS/X2x7XsoL+ztsmtatNCBjf8bXHZAF4WY+acNqKYv09Q8Bav9VB7bkiKawRxu2
 vQte2PWhAyBGLlWNSwBbKcSpBPi2VurYqsHZFMxgr5gnedy0Pgj7pcA0LWUdBE9uebQk
 sKERxx/GeFyrFGZz/A3rRWmaMjUhNZf5OTmmNH5HqNXMy+MTd0JM+wa1Z0nnvEAuByXI
 o7eOHqhJnO/NppbYjZCszGsDxVrmanqi+Y24rA4m1wSXspTP6NSDb9ScMRUNWHjDWvco
 pD6g==
X-Gm-Message-State: AOJu0YzdqaqtyPkVOtXQp+d9ECISu/qoZgfplWgn7PSROMBTcIVZuFms
 jpV9ZvvMmn5KWfOgNdKbvIpsxCtfDqlOeJ73inIjtSE7owJP1arXk3dx4fmtsBIj76E9WDkVkbu
 ELJYVx+lE6WZlJIl3yDCWEXjYM7qXGk0i/hH35g==
X-Received: by 2002:a05:6402:2b8f:b0:561:3704:329c with SMTP id
 fj15-20020a0564022b8f00b005613704329cmr5000302edb.8.1708002323681; Thu, 15
 Feb 2024 05:05:23 -0800 (PST)
MIME-Version: 1.0
References: <20240208194759.2858582-1-nabihestefan@google.com>
In-Reply-To: <20240208194759.2858582-1-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Feb 2024 13:05:12 +0000
Message-ID: <CAFEAcA9JTeTk-mXW2+zub5dbRQBMkuiz2m0Fgx0t9K33pzLN2w@mail.gmail.com>
Subject: Re: [PATCH v3 0/1] Sending small fix for NPCM GMAC test to properly
 test on Nuvoton 7xx
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kfting@nuvoton.com, 
 wuhaotsh@google.com, jasowang@redhat.com, avi.fishman@nuvoton.com, 
 kwliu@nuvoton.com, tomer.maimon@nuvoton.com, Hila.Miranda-Kuzi@nuvoton.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: pUuaV/K00GtJ

On Thu, 8 Feb 2024 at 19:48, Nabih Estefan <nabihestefan@google.com> wrote:
>
> Accidentally added extra file to v2 that broke email sending (and was
> not meant to be upstreamed). Sending our v3 to skip that confusion.
>
> Removing testing for PCS registers since that doesn't exist on 7xx.
>
> Nabih Estefan (1):
>   tests/qtest: Fixing GMAC test to run in 7xx
>
>  tests/qtest/meson.build      |  4 +-
>  tests/qtest/npcm_gmac-test.c | 84 +-----------------------------------
>  2 files changed, 4 insertions(+), 84 deletions(-)



Applied to target-arm.next, thanks.

-- PMM
