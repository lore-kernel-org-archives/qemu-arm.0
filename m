Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2425498ejx;
        Mon, 21 Nov 2022 06:25:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf44qHTVf7kKiDj0QtKpbztgCboPWwlM+3zlYH/SbB97gSJRsjzNLxB8p1Zm/zRY0UEpKGUe
X-Received: by 2002:a67:cd82:0:b0:3b0:55dc:f642 with SMTP id r2-20020a67cd82000000b003b055dcf642mr1591420vsl.8.1669040743326;
        Mon, 21 Nov 2022 06:25:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669040743; cv=none;
        d=google.com; s=arc-20160816;
        b=xZz0EQj+BBisd5/MO3zch8Lwwzg8pYXNs7g0LOcwlPhCYsX9DxW1pNMKisj4CZD7yU
         olhyh7B4s9ZAlz9mfaB7UflFjZGS22Ls4khcvtIHMpadKcP0MtiKOd1uY5bEbijkS2k1
         0DGz7rTPS6H/1CyjTRVGJJddWAtZcRmLjfCFvCepMOv9Q3rNT1e1MmfNB+kM4ly5KbOh
         ZSNfD2T0sDNjXx+JRh4rSBr5D8EBFrUOfzEwZ0TSYb7v7gmwmG9XAymOk0bW0KVttLL9
         haVm10VVKgAW3UHWh4mMga+YcDNjbeRiuBprco9JfZJ+kym/siCiUqsALH6TMvUrt6Ue
         j5lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IIDlOTJa7mYn4R6oEw7yWJ69w3aotmbbA7HorUUofwU=;
        b=JWAVZRNLdf8exIj9sbm3SJYI4HehH50glMBZyR6SMDaNcMRsUi3iuDk2xJIocP9reA
         djgPzYTpPI4yBOumNPeH5DuVvL6omYOEEAo7jePirOTnRqJqN0dUJXh/0Y9qX192WmI9
         tqidSFPHe5CuQmDeQF2g+XGYRIQR+uEsVWXLYMRnBAcyL/r5pNftC2xw+4GJRPQRElfL
         CgmsVkGrMCifb/ZKe2voFwUJp6oIPmbyf/vvDP8myPILcfyT5pElKkDKXh+/jjLTbgf1
         Cd0wT6yQ25Q80ieDzGgMyjjEg0R0Mu9swTfm1qScbGBr89irVmsOEUnQTsOtiwqVuSQT
         CnGw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lnn9LcZj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 62-20020a670841000000b003aa3e6fe117si1751130vsi.331.2022.11.21.06.25.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Nov 2022 06:25:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lnn9LcZj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ox7jr-0003Pz-UT; Mon, 21 Nov 2022 09:25:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox7jr-0003Pm-2z
 for qemu-arm@nongnu.org; Mon, 21 Nov 2022 09:25:35 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ox7jp-0001kk-FS
 for qemu-arm@nongnu.org; Mon, 21 Nov 2022 09:25:34 -0500
Received: by mail-pj1-x102f.google.com with SMTP id ci10so4383458pjb.1
 for <qemu-arm@nongnu.org>; Mon, 21 Nov 2022 06:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IIDlOTJa7mYn4R6oEw7yWJ69w3aotmbbA7HorUUofwU=;
 b=lnn9LcZjR+T/nRaghLaj1Ko/e8bU/wxNf9jHaGnvmuOqjBuH5kD2rXho8oySOGd5Q4
 +3O5W0PKSS+qZuNM1SGLbLIpxC3ThKz1GgiedcMbcUIdPDN2unId1aIIqGsDT62gdeib
 OVnxA9UkPU3h8wfQDa8v4qlWbnThM75EYAqfhKjHoeUHFLI05rxUAYf/oB9nIzF3O+iw
 MbZqUvla+ONNdbrhub3Fc+W/rc2oezeutmbBPixG1TaXsBX01+Poy5yr0yxeVkhQGuSV
 bIvP2hh6KJ7guPuvRI0nZCdUrz6kRs8SidPKE07aKOEr7Gsv95JKdkfB4htRkghEIuMz
 Ew7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IIDlOTJa7mYn4R6oEw7yWJ69w3aotmbbA7HorUUofwU=;
 b=rFbq+Cw3hcH1fmFYflz4bJJndHZwDBeLdEWNeDSOYXb7xetMzRrm9FdW0LEtoj3RHV
 PGotGEW8Ijs/d2pi1dvtm0qEefiUKvHI32p16qzjeBLoY2Ame3Dx8IzMqObBSHh2Z+PQ
 9UXp1ItFQKW36tmoRNeND26Pqtre+KSWq4KdmrbzGXi6ZuuvP9jwvMJh7ucd+KI8xO+N
 C3cGoP+toWRhvukFD6rPVJt9endwhmFRLON+0UyoEiuK9/au5I8+YcuUQrqEN/0AZQVO
 8CtlMsNLZk6LlJoy2jdscH/jV4X+BnWBQ5+dZzkluQW84y7r6EOKwh7fpTBHRJUa5PmA
 9EQg==
X-Gm-Message-State: ANoB5pm+7BHkAXaWyLe6q6Q9jLI64b3zgdkvp5Qqtc0seiSYajiGyRr/
 glTlv+j6SCbydU3vz+Jmk5csQ1x8J0y/LJY+6qW3Mg==
X-Received: by 2002:a17:90a:7003:b0:212:f169:140e with SMTP id
 f3-20020a17090a700300b00212f169140emr20168093pjk.215.1669040731995; Mon, 21
 Nov 2022 06:25:31 -0800 (PST)
MIME-Version: 1.0
References: <20221121134605.2762683-1-tkutergin@gmail.com>
In-Reply-To: <20221121134605.2762683-1-tkutergin@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Nov 2022 14:25:20 +0000
Message-ID: <CAFEAcA8Sqfud80PbJr361kJPSOH8aUw-r2eku0T2idghy0Evqg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: added cortex-a55 CPU support for qemu-virt
To: Timofey Kutergin <tkutergin@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102f.google.com
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
X-TUID: jhNolto29Tok

On Mon, 21 Nov 2022 at 13:46, Timofey Kutergin <tkutergin@gmail.com> wrote:
>
>   cortex-a55 is one of newer armv8.2+ CPUs supporting native
>   Privileged Access Never (PAN) feature. Using this CPU
>   provides access to this feature without using fictitious "max"
>   CPU.
>
> Signed-off-by: Timofey Kutergin <tkutergin@gmail.com>

Hi; it looks like you forgot to cc qemu-devel on this mail.
All our automated tooling looks at that list to find patches;
would you mind resending the email cc'ing that list as well,
please?

thanks
-- PMM
