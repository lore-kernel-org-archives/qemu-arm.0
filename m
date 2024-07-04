Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp675566njb;
        Thu, 4 Jul 2024 08:15:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVTuTw4bKsi2TvarVmcAp/SyeDIHvdtT3vrXYmPhpz08pDqDXcHaoXpWKv0mpNrpJtq3UXGKy3QJzq9Z6WbG4ERSPtZoV9D
X-Google-Smtp-Source: AGHT+IG1H1AtuFiDG2PIufsUS66evhJLDewnSTPXzhMvnghdkxd4IYbzZfsPYOHZtXq7/0aiZ70Q
X-Received: by 2002:ae9:c009:0:b0:79d:916d:aed with SMTP id af79cd13be357-79eef3a146emr231133685a.9.1720106107072;
        Thu, 04 Jul 2024 08:15:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720106107; cv=none;
        d=google.com; s=arc-20160816;
        b=WHzrUaWx8F1DSLcPi7AEehnFstubAqgudiPj/gF4HvFSmjC2IPY37VLVc5gQ/bj7fY
         rjDrHTSZGvMWgzujE2D1znDu2g+FXu4ffMaXiIb/bKxrM1UXrLUj0rjg0VyRscvGIAff
         aTBpM+La4/Vm3o2YxFlh1DGaygfNijNvj2pZgKyzvrTjA00JlIxE9vBw4sL5b+TSuF9i
         FgqFfvrys3YJx76cYPtBNnn5axKeFXXCuK8bheNBr/2dKhgI/S+EshuPjTf1qXHNeiZ7
         PsPHNp/lKKL+G2XIKy60y6D1qUf/NcToa6FS1om83Xccn6eRgSMEp6ood4nxAfA/ty62
         S/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TnybP8MOaskl5toG+ba21y1kIgGyAjS0s8TVYYu0N2E=;
        fh=J6minPfrv9ESuOv7/pHXNLOwJ4qdY/Rp3wwAMscgepU=;
        b=PuX+DpHAM2Bejqm8fasvsHRQqkLhRrexMmKfKnw5x87DUP1HFeolR/6Kk2XiuoUm1y
         ozH2gFDXUKa7X6YH48qpTtTqaB6la3dDDGhHu9Y29tgt9OfFNA9VRLEyBf2gpoDASgwz
         j/E6y046GxtVssNxli/XBcZJz8LEihG8YaOsuAjGfIukYywm/LWoFAgf4yELaVRFsP1Q
         YpJIvxg3ZM5p9Rwb1TxblV8zUoot/8wwEWNT04h48fUsfLCV2Dub6DkmUsSLnb+FkErx
         hcEiILUBxbfR146BpBBaCr7o5XCaAe2rj+h1eBCUk0HsZ3ZUIV/iZnV63PBN6xcsBSof
         oqSg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=keND24X4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d6934c9f4si1470272785a.720.2024.07.04.08.15.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 08:15:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=keND24X4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPOAg-0000oD-Gm; Thu, 04 Jul 2024 11:14:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sPOAe-0000kr-Km
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 11:14:52 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sPOAd-0003qQ-6J
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 11:14:52 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-58b0beaf703so1001852a12.2
 for <qemu-arm@nongnu.org>; Thu, 04 Jul 2024 08:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720106087; x=1720710887; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TnybP8MOaskl5toG+ba21y1kIgGyAjS0s8TVYYu0N2E=;
 b=keND24X48oorYEhb/4uYe3N31nGxlsT2CUIDpM2gMafcUJLroBpxFI+frbfUayTzb9
 ANfZhURsZvwJxCy8/xO4PtwqhgLth3Kvuriw0y3Ffj0M1YJBNcP3sG1Z6BfQD76YmF7m
 ey0GE2AgOE+JHhAhY4UiidrMDFNVgwGNB5PCIW0Y8Vp25/7C1eSMjsj+Kbo4W6rq9bfz
 HKLW4sAICVgHP6dpvSIpdHlJ0mjkd/TqR6XQdAWRQjv8fuafQP8gud8D4IiAG+E1Yd1C
 BKnlhXsm2qeVwjgCRMuQ5IoVk6klK48yzUQNGXJOkzLuGpqsExzxd+i7ZHzs+lNCXhR3
 qeuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720106087; x=1720710887;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TnybP8MOaskl5toG+ba21y1kIgGyAjS0s8TVYYu0N2E=;
 b=nj6JD1MGsQ1v1vhO2XIQ8iEJG5KrQLnTegTBL6pkan/4HtpxjhhWsUHM2EvaT0H0SX
 cO2QPOctH1x/3nvP2TkLu9c9cmMxnl44pwXWtZs4v5egw971NhJk7PhdWs937I9SPoDY
 usCjD1tN0f09I635IUdExkvmFu71FIdAUVfxtWKYvvBmENstxXKPrJGg63MaI7200cVQ
 WoKWDFQ+rhPw5OQOc6ssu2MeGune6g/o72LHKo7XRh4WlAaL+RTHBuRCCkqNOQmaZ73t
 cDZa1gGDnaAVZ2l/NGlvHqxu7eajSiOcAjtBiGBPqAd+c8tdXWmchJ8tn4Fvdu2MMyko
 DHbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE8IarKt/ub/nVNejeeyBtImDH/sDbH/Qi21IodnKRDeQ7t+ZhMVHppkefd3t3LDUl2V556Tf1TXKRXPWV5AYwhdZV
X-Gm-Message-State: AOJu0YxkJbNroTQHEK7bFAL345zq+4Xg+WP3EFziTCA2Jp9mNDA5eWl3
 lndkstRlAsL6z1kN4s15jbcPgqez6oNxt4Hk80+DTvVz+t08bui3sfGYUxw61Mu8AQystRG7GPM
 D36eIKZDV70CGPmeX7HM9JIalLu/QI38+5Aayeg==
X-Received: by 2002:a05:6402:2353:b0:57c:c166:ba6 with SMTP id
 4fb4d7f45d1cf-58e59b42805mr1683680a12.19.1720106087611; Thu, 04 Jul 2024
 08:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20240702154911.1667418-1-richard.henderson@linaro.org>
In-Reply-To: <20240702154911.1667418-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jul 2024 16:14:36 +0100
Message-ID: <CAFEAcA9jVe8Fa4=TSHqfbmV54ECUJdpB_-hBsE_0-vYZBDtKow@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Use cpu_env in cpu_untagged_addr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: PFeh9/IwnWZS

On Tue, 2 Jul 2024 at 16:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> In a completely artifical memset benchmark object_dynamic_cast_assert
> dominates the profile, even above guest address resolution and
> the underlying host memset.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>



Applied to target-arm.next, thanks.

-- PMM
