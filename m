Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2886934ejb;
        Mon, 5 Jun 2023 08:57:23 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5uWgX3xm33tca/2QQc11Iafpv5IcsrndeIKKQ/c8+EnDY1OmP6Gz1FoZ8CRAT3ugigM7f7
X-Received: by 2002:a05:620a:4088:b0:75b:23a1:362a with SMTP id f8-20020a05620a408800b0075b23a1362amr113329qko.59.1685980643451;
        Mon, 05 Jun 2023 08:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685980643; cv=none;
        d=google.com; s=arc-20160816;
        b=G7Dr2ISLR9aA9VHHSgOzyvfhdW/ww/vMXPnGPPZ89UxT4NwyUL7poNuodysmwHcTIf
         m8rrjsVtjHfMvvlr/BirgRUH3rq2Rlk8CIxJRPu2apZGqOgfqQLTHbllnN7y/7bKBjvA
         ABYAwyDXzixK/sSCyv6VDE+uP4Tc9SRLzTs58wtrDJWlQ2eaOC/hr5mcYhHYzzltoops
         5P2jobJsW+tw1Bf0u2R7gQVrcmAPsiGeybSdy6iHKd1c/l9zgBO0X2rvnh8KNdsl5udV
         GnQxdjNGldigG9C5p1qd0ZMeS5CujP+kXKINP+UtV17Gfp/tdCosSerdmTf2pJ17owz3
         igJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=IdJHHtffXmwBS9mTutnKEK3lnhB6cNHMZ7eV3hw1Odo=;
        b=yUrkacam/8jryl/jjDd5M8qpJoRC6zD2hotLsIlrX23MzlbZhvFCyLTCiAHt3Gzvub
         sh/8WyH7ISz9TM1CXBhZmO+dy2S1Dtq3QOrQDW+oq9xzq9AgxlO2GEH8CkOnkhDI34PV
         Q29cUB17USaKcKbODnmjtOK6WSwm4YFf6U6QpEaQYYWT8pUd3dCzNp4254aUOVk57MBQ
         dKmk8WfSkj4+/NzuEtXfgzX1xI4jmuqZX/pCIGsb2VHztHV/S1OYNKTp8lCH+sihXe2K
         S9MoipBUYjACcSXB5uamsud+50icT6jWyUUBCLeWMqTewmLtU588fAUY2Y9lDDm0ORB/
         Zn+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=boVKRku3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6-20020a37e206000000b0075cb4e1e38bsi4660654qki.446.2023.06.05.08.57.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 08:57:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=boVKRku3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6CZd-0005P7-TW; Mon, 05 Jun 2023 11:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6CZd-0005Oo-6z
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 11:56:49 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6CZa-00047r-OV
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 11:56:48 -0400
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-5147aee9d7cso7065636a12.3
 for <qemu-arm@nongnu.org>; Mon, 05 Jun 2023 08:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685980604; x=1688572604;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IdJHHtffXmwBS9mTutnKEK3lnhB6cNHMZ7eV3hw1Odo=;
 b=boVKRku3EOieHAt8iiLKJAUBlTPoiLp15LESsLBzJLDC3Bbg/oFK7M3Xxhuo75zkB2
 zL9oxCQCccdp/9ejV0ohw5U4U6tInO5JUaNnfG/PUsCKuv+WddWRUE9btYk+e+fZpC2n
 n3EE7+6+2VLaIiiX5/dxputOQil2bHjqffenP6I2XjZCBzd6C1iscHfGrqeVsr2TOsgc
 kjiaY+I7RFW5ksLNyS0p0smyi1V9ND5Wvk+hebN8t2X1M5PT/6lGbRur727olzNIewdt
 8TL7POXsyURQeJ+yRFN5l1/8MWZliBEsIR9Uo/uNgHiBMsCicsOBrMSOV+TzUgIB+3N9
 z/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685980604; x=1688572604;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IdJHHtffXmwBS9mTutnKEK3lnhB6cNHMZ7eV3hw1Odo=;
 b=cQ7eWiBq1qCzVgQP6MZUMnRO4aEG4uUjNUs1CP4SCRdJ1/iG9dIAguXfTtQ02i2J4u
 ExKNDrFcK3R6WobgkpROPBTzozuaSpec1yj5Sj+xWeSZRMM9WvMGDnRbb9p77hyuYCnP
 sJP3Q/V9TBxulDyooM+2Db5AaUaJ5CW3+MKGf+WCnYdUnXzMdPdDGPf0P66TdkNbMgVP
 GyGjOzTRAe0s2awGpgohUOlp2izK9cvw8x/0w57zMwmHJxHMU+vMh7cqdMmveTvQe8Y1
 pajfuwO/kC+NPx+ya58T0bPPswm7T7jEWKUWchqKXb+a9dmmS+dJlhSbEYRXlyST/mvu
 twpQ==
X-Gm-Message-State: AC+VfDzgL50QpZY6FshBYNgJU7Vauwm0LIhmFanNTxY/d3vdGGQWfPHd
 CXbLB6Fil7tZ2wASQhvjyQoGeRgdkduAEQzeFWpmCA==
X-Received: by 2002:aa7:d80f:0:b0:514:9e26:1f51 with SMTP id
 v15-20020aa7d80f000000b005149e261f51mr8248860edq.24.1685980604696; Mon, 05
 Jun 2023 08:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230530191438.411344-1-richard.henderson@linaro.org>
In-Reply-To: <20230530191438.411344-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jun 2023 16:56:11 +0100
Message-ID: <CAFEAcA_d71EKi2bLJVy_sUbGZEwcCSL7QMrPTGDLQqXcg1Wb3w@mail.gmail.com>
Subject: Re: [PATCH v3 00/20] target/arm: Implement FEAT_LSE2
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
X-TUID: hNVTYdM6G/lH

On Tue, 30 May 2023 at 20:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> All prerequisites are upstream.  There are still outstanding patches
> to improve the atomic16 support, but those are all optimizations.
>
> Patches needing r-b:
>   16-target-arm-Relax-ordered-atomic-alignment-checks-.patch

Applied to target-arm.next, thanks.

-- PMM
