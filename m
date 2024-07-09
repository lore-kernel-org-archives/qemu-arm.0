Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3323149njb;
        Tue, 9 Jul 2024 07:22:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJlzF1wkoJTfZZzivH6n/LMEB7DTMk57pnLEsUrj4LYY0ODcEKzmJFhHy3ilF0XJxf3FgPFRhvbAYSknnefS+L/JVIDzQK
X-Google-Smtp-Source: AGHT+IEaFsUD/QFZFsJRj9XC3tZ7SgKDppFMpcmYwEBpS3lHTqMpEajQYomt2f7md3yHJeEfXgU+
X-Received: by 2002:ac8:5810:0:b0:445:397:e629 with SMTP id d75a77b69052e-447faa83e99mr40122871cf.45.1720534969480;
        Tue, 09 Jul 2024 07:22:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720534969; cv=none;
        d=google.com; s=arc-20160816;
        b=uUSZHQi9ohpgamMq+jpZq7gPdp8xMoFewDRq2zBVNpWOnYYdwKcwgYU2YcSmeQfNGy
         jndMeyXyEfcg+Mf3CmjfzOdnXqrfwYaivfaA850Xp0rIhWryND/3udWBZpvf1AFW+8UL
         UEnC6iIJXuqUYOtvz02lg4qk0sM0zx2c0EOaqendWAEI2ibleamjxBXRCiwcBBLOduE9
         8VBnC2OqUqePTJxEC3CvfNRnD0A8V/TIz/1ETMTPSllOdNS6R5KWleME6y3vBD6Ioh6t
         D9gGuYHd9y+b41NUvm40g58At7Z4ZDoXGYV1upD3rcczzaNz8t0JAHDuS8kNRKN3zryL
         hMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XvZkY9NN1zlzy7afgSOGV7uANiG1b06UW33WFeFf128=;
        fh=lNHdgysKChd59r4MfAKoXqViEB99zuPQd9uZ0P1rdJc=;
        b=saMqWUEZXgE7Qn/+btLNKu4dnFzZw3CF972/6HJVdtR5RbjvHjNRe2cH/jKhxXCNSz
         Y2qGTLpMbAkkj17K0qouA641t6wbuHPyixVGq9LMQ6rrOS7yTZhvxRZTkJev3zViqzZk
         W+TDoVqmhv1qKSuoOw2a9FMOcwqd1158tr38phIa+2K+aFB+1oNizoAIUDnljK/2uxom
         Pl2bVLp3fX3p4q9iGptVDlDS6+TGrHkAmWZpsfKTgUNE/wLJzdNik1958ugivKTf3N9W
         MB490Z8z2qlMiM7a6eznEiex6X+m55b5C3AYIvGtbBWwE0vC3fql896XTyx2MbVM/I+s
         eORA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MsRAC9uA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9ba9338si24749261cf.255.2024.07.09.07.22.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 07:22:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MsRAC9uA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRBk0-00079g-28; Tue, 09 Jul 2024 10:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRBjx-0006ud-GD
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 10:22:45 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRBjv-0001zG-Pq
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 10:22:45 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-58b0dddab8cso7716539a12.0
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 07:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720534962; x=1721139762; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XvZkY9NN1zlzy7afgSOGV7uANiG1b06UW33WFeFf128=;
 b=MsRAC9uA3KiF/hH28BjV9gBEpVYHU5YOmE9L1dBsby6pLYd/W8m+JxiW3uHMv+PzZu
 M4Fd3cDG6e/ur4AXfeZIp17Z1BpfQ7bNCWixtaTk7tXNK3+XyI7DvR/rK7Jj94Lu6vuG
 XQYoA7zOp6Mwb+QE3eiBaGjrw3YlnLEvEYyb3KgAWbFtg2co48wT3FxWhlwjGx+jsyf8
 6udZGl93z7NrAjPTiAhpSGGZ79FiHN7K3Krgqi3QN9OFvMEPBKo6vwRfIATlU1tRocjU
 YONFUku/Igdlvw/3SOJKR38UDexITNjvfwqXoKO1pwfEvrr+zkMResISwnztJruQvDkv
 +u8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720534962; x=1721139762;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XvZkY9NN1zlzy7afgSOGV7uANiG1b06UW33WFeFf128=;
 b=To+fBxZ8rEzaFHAtSS1yEZyj91NYGcCj0A+9HKE/1jpSmrspAeCTj8Rluz8Cwo4OQo
 +EDw3qF7ErnX3+t8wRpprJrjv66D+qXMLEwIKMaW/ces95BdGgK0Q7N/EIGBAkKz6QH1
 QCWuTp4qEpS1xQ+fqb8tz9zyBQC5kkF1vhboAWugiLH7o6+DMugfsTHYKHzMVdjbCCaU
 3suyV6j/qWK47QopiNswsoTtb5shyxQQ7CqPLHMImYi3cRfcXuwPZaF9abvpRo8W5WlT
 dOlrB2sHR4MgQ+NZGs2KipQBFNiNCNgPP5D9Efpwv6M+LoWRmGST+YvbM5LSNY5z1hoe
 +eaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtM/6RXg4EmC390udrlF0DthCDHnBxXZjUYMhz8jqiMgZQPa5rOG2LkX2tapUxVZaxnbLtJdiiHMdg8sKVaQ40x9nS
X-Gm-Message-State: AOJu0YzVj8c8sWgroppcRVtzqwkmP+GhH3LCGvZVvjCqptH1bbgppBc4
 3+FlhCgfTBnv/me1TaUI5Gjx78bQrVidOQPjoFdIB3Io+HOTxhk7KgY7cprD9W5YIDBLfk7nVwe
 /qm+jsfulWY27M/hH6b5OG1N5c6HiaMzFK827wA==
X-Received: by 2002:a05:6402:b19:b0:58d:842:6272 with SMTP id
 4fb4d7f45d1cf-594bb67e9demr1491419a12.25.1720534962490; Tue, 09 Jul 2024
 07:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240709000610.382391-1-richard.henderson@linaro.org>
 <20240709000610.382391-7-richard.henderson@linaro.org>
In-Reply-To: <20240709000610.382391-7-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jul 2024 15:22:31 +0100
Message-ID: <CAFEAcA_0K6awDE1KS_0=3R_PiXrxP7xjLD=bHtdSjFkDuPmXnQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] target/arm: Convert PMULL to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: S6BRdUgM6krq

On Tue, 9 Jul 2024 at 01:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
