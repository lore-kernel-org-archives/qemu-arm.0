Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp527991lfb;
        Thu, 9 Jun 2022 08:46:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMs5pAqw4GoDPtBZk0zk91td7lx4TCWTvyHUdg4OP4Vzpu75FjiIZEwbUWXp2rLCSBqVR3
X-Received: by 2002:a05:622a:11c5:b0:304:d8cd:2058 with SMTP id n5-20020a05622a11c500b00304d8cd2058mr30049403qtk.324.1654789617571;
        Thu, 09 Jun 2022 08:46:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654789617; cv=none;
        d=google.com; s=arc-20160816;
        b=LKb1NRHCF/C4ObqtTZHHHVdk5DYs9f1fed9YRCZRtUzjC0HnCr5xnhQOub33BS6vLx
         pg8p5JIO+KQAHQviyOOyiMKMA2B2TkA2aVtqKisOLOiFJ6Apr7cY+d57jL57RpCuDAmV
         Q86xutb5LZFF8Saqjwlx0VIC+B6GqlFJk7R0PjYZ9LK/wjNPqmgRrjRl4WsARheGJJut
         XXw6Uv+RsdM6n8LAJX+eM3yq7BXNXNn6ElAhDoK8QLJ+kpTFxVq1bbem+qjMl4jnePY2
         YMxFnFLfvMiY7tdST+aDwWHGMnHxFznMeB16pqR0OvDcnnh339Chn27fFjUreHdGDyhy
         eoBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bxCMzOxDZkayrkSFy7hjnTQ2NwE0Zau9TIRgcPxD/Rc=;
        b=AoDnHX3XyyKC99Fqjhv+APL4T0Bi44o38f5Eahq3roAcFn7UhhmvyIHJ15+ZN3xaII
         qVSfamkXTz3KJ9IGsuyYRAKGjvF9jlFSgUaq912XAAneLBXOFGqT39plr22Z0vNaKd9H
         PNG8eeZxxADqNw4LYi0N9vSRuHiFS1enN318Fr0tFXsIqaRIVFBilUK+YbB0weE7bPL/
         JaWvEYPerXCvxfuzr/xLTIFov6uqxlOZBQcA/j+PzDZcZBUtl+dMJQCs6SGN3PULgh7b
         VuvrIsroQDwSjlxgflmyN4LlS57QlARsXaByedLN2feWe/smT6mzV8c312l1ae7gmgQx
         fmnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ryw8j0+f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14-20020a0c8ece000000b0046bc3e19dbesi3070607qvb.391.2022.06.09.08.46.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 08:46:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ryw8j0+f;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzKN7-0008Fr-0i
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 11:46:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK7n-00044O-3J
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 11:31:08 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132]:38582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK7k-0001p1-Bo
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 11:31:05 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-313a8a8b95aso11042397b3.5
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 08:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bxCMzOxDZkayrkSFy7hjnTQ2NwE0Zau9TIRgcPxD/Rc=;
 b=Ryw8j0+fm/27vS6IIF09t+YloHjCobqEYjEUxy6u9QKvZ7jQYxTGuRSJ7tmAzCK6tA
 iFM/3UmDiZnNvWlDbTO2lZpW/si7SsJZVHxVNPOWT8IGoSzIlDiO8zNRYlRfH6Qkf2cD
 p7rPshJ0xZM2dVVOLXdnfTlqaBF5s3yapnmtkWXq5M2wwLqSZnjvIn0kGs9G1UyHyNL3
 JSdVEaEt/iQEs1NahiHRrMlrbKySUAPUPIFC0fN/ZEhhfUP4s2oUnhNMrwiHJgMPpEn3
 WomeH0b/0NQdgnO0GUCOz62JjtJUURZNLTksm2iIhknrleF4fXZdgOO+k+QXb17ASN9s
 P9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bxCMzOxDZkayrkSFy7hjnTQ2NwE0Zau9TIRgcPxD/Rc=;
 b=Zuh+MpVf0B3TY62NviRO3SdTiD5Q/QMkbqUBj/RuQhKE9dFR/qnt/6tk6ejS/Ys2mz
 a2cAPhc/euNjKH2ZX1O0TL+fjnIHRZmv6P45ywBxqNnvi2FdP3XPLHjITvGCryRjML/i
 XWTIyHslTFscasGVWWDytR9H2Bpo37L5rqlPgMVUYTBnitPnaBlcwfpDWHHFgpsM31Wk
 1tOnvLhVGgOLEGPzVuSd53xt9XBVc8xwHLkGGsa5p84Kv21p3+N5P+/mziLBOSbZtTKZ
 l6/Ay0PjIWB/mr991RT21MIjG6QDx2StEpl/vNFThhfHSFv1NDQ9a8t9tmaS3Ad93ea2
 CeGQ==
X-Gm-Message-State: AOAM530Nk5n30dUfkUueOUR6SDykPj//4C0ohbPVP+pQ7WWadTSWKyO1
 hTqPQtgjQobhaziJhWGS4QK6pJR3pj98YiyOfHlvmQ==
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr42345408ywc.329.1654788663190; Thu, 09
 Jun 2022 08:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-34-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:30:52 +0100
Message-ID: <CAFEAcA-K9tSbkUAOFhHwBxcguaFgBW3K-cFKAa5q_1PZwvX7fw@mail.gmail.com>
Subject: Re: [PATCH v2 33/71] target/arm: Generalize cpu_arm_{get,set}_vq
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0bOy9APun7gZ

On Tue, 7 Jun 2022 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename from cpu_arm_{get,set}_sve_vq, and take the
> ARMVQMap as the opaque parameter.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
