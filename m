Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp893269ejc;
        Thu, 23 Feb 2023 08:37:51 -0800 (PST)
X-Google-Smtp-Source: AK7set8IAYRAaNckSljTTQipHEq5hcmbZzItwiIYOdVxk0zaDQYc2HUsmQqN9NKWkGJ5rQTIXMhi
X-Received: by 2002:ad4:5dea:0:b0:56e:a96a:2beb with SMTP id jn10-20020ad45dea000000b0056ea96a2bebmr19291882qvb.43.1677170271365;
        Thu, 23 Feb 2023 08:37:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677170271; cv=none;
        d=google.com; s=arc-20160816;
        b=IimeCZO6elJjF4R4gv67jptpGV4Ks2HBD9Zmu0+U0duc9fxrFlo/XTWVum4er3UVbs
         OyqE4JcG1bUssK9BBOqwNrPOpgdYN01aSFq1XhcTTR/DzRIKgCGAqSj/fuRPQums2i9x
         fhTHGqtblyWXrFl1nduY9avxKkD8uKePQcEFK9oVWVUBbDjmUUvEEBTNkI55y/vqD5W9
         8sUqh3brT9yi5nq0v8QUM8W3jGC5zFh6jBSLjnhZ24moU5GDcz5qjaQIifkuxxBY3ZiD
         m7Vwo9vMkc0Ea0RmQmh4oubgb/HqtiwxFAT3g7vp4yvJMsmmB9Ye1bxHa1rqQqPu2vCF
         LGyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bgNup2kZZsnzFwgCpi/xBc7Y68kv0vqYeEF/Akq9nVI=;
        b=eRPGWby+/Ob7gH6Jm+I1ABWSSzXhWRAN20DOOv7o/MTRyViRUmBaYZkY5PzAlHuBXA
         tSeMSXVXZyogezHkLhfeZ05CWXJBF0UL/yEPu+TrfSH9Zhs2zu9L+nxBGchJJfZGKf3C
         myTXV6hem05aNZRC/t5sRjygWRXi98GD3NBvYlul9+ghjhvItYlR0zAflsdTD8O6O2nw
         dYTrCgRP4rZC2DVXWKfuk3b7SFgx8kG+JIIUinJ4aRdmBdwC4ozX6vVoQ1bnlsm13hbC
         taOzdGAvcb39D6ceN7vMg0dWHcFeYQHXUrW/G3HBHliXxALpQR0XDVQwXozCpHcNoH+t
         vd2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XseukFfb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do17-20020a05620a2b1100b0073ba752d3efsi7509926qkb.565.2023.02.23.08.37.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 08:37:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XseukFfb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVEbI-0003LA-0b; Thu, 23 Feb 2023 11:37:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEbF-0003GO-Vc
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:37:42 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVEbE-0000j8-Dj
 for qemu-arm@nongnu.org; Thu, 23 Feb 2023 11:37:41 -0500
Received: by mail-pf1-x429.google.com with SMTP id fd25so5412912pfb.1
 for <qemu-arm@nongnu.org>; Thu, 23 Feb 2023 08:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bgNup2kZZsnzFwgCpi/xBc7Y68kv0vqYeEF/Akq9nVI=;
 b=XseukFfb2nezka3xVfoOiDblvkBFXmX73Kx74t56tISh9LbE79NqhACFs4FPBJK0o5
 2spXYxceW6Kx4YzzajTlKDHchEIc6zyQIYU4pb6mWNVWW6F/RIa3U2/QHDzM+SHc8vxW
 z7nLe7pYXHIYj8I5CU2bBpehDQ0tDk58dwZzJDpY9A64LnVnqCucx14k7GON9AfOmiuU
 Eqaa++mefgvCDtTXll77MgjBC0c/F3Qbz6uPhPjR7FOVaB5Y7ApR2L+SeE+ocB844ALE
 EwSWFqyqSmoPfKZ607X3Wn3zuU7+ejgqsq8L+nRvKWhUQbnSm1BEsym9G1SRU1QtFWAK
 JPvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bgNup2kZZsnzFwgCpi/xBc7Y68kv0vqYeEF/Akq9nVI=;
 b=E7T7E98m15d1s0dmVYheCVCui7kP20uV6oQJgJ/kghLScmr2uBGP1eG0rD/HZELMUE
 kv87bQ2KW0uTlh6mD79f4DjG6+Yju9e3lg9eZ0xsSFKHV+K07R4HPvI/zk3ZFmrCC/rl
 DCbjIdjoD2fCEsh6e4at7FDHTHRuQZ3uwFSJxPZfvicg5EwsUarVpH2Vd4mxcEsRiLQV
 Y6h6KbFIA5x6tK0yziHUfEpZCSB2DasDQ7xKzqsJTGrItQbNoCOgbvdEkKL/Ql/1qJ/X
 9lz1O3pQHUk76jzawysc33Og9Zl72ZmY0Qa9gtoPPHwwKsurgAzXj8U8K+MG6Uxctz+I
 lq7g==
X-Gm-Message-State: AO0yUKVfWD7zdPGZ0Qb5zJ/tBxv4I1ROmUpY9Ofmc/om62cqAmvi9tkB
 a/oxmCabqY4wJkRkat1eCiuUr9nUiaGLMHgPTpXO9Q==
X-Received: by 2002:a63:364a:0:b0:502:f4c6:305c with SMTP id
 d71-20020a63364a000000b00502f4c6305cmr495025pga.9.1677170258849; Thu, 23 Feb
 2023 08:37:38 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-20-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 16:37:27 +0000
Message-ID: <CAFEAcA-=HWRJXmjAvk7VnA5JCCJS7+MOSGFNu4kfMrATF9kDRw@mail.gmail.com>
Subject: Re: [PATCH v1 19/19] target/arm: Enable FEAT_LSE2 for -cpu max
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: KMxaKdujJsz2

On Thu, 16 Feb 2023 at 03:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  docs/system/arm/emulation.rst | 1 +
>  target/arm/cpu64.c            | 1 +
>  2 files changed, 2 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
