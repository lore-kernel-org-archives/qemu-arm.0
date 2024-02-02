Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp919335ejb;
        Fri, 2 Feb 2024 05:51:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPf8Mrs/4TbumFi32jOx+1LLXEuLuluwQUVZfnbUX6X82ks2xmmnwGQn8MMQfU3Q9hm5TI
X-Received: by 2002:a9d:62d3:0:b0:6dd:eeb6:b272 with SMTP id z19-20020a9d62d3000000b006ddeeb6b272mr8311181otk.35.1706881894815;
        Fri, 02 Feb 2024 05:51:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706881894; cv=none;
        d=google.com; s=arc-20160816;
        b=w4XDyUrIxaZ4EDG8SRWRMbQDEqnErZzPv2Zc73CLNqa7/UYsURYfIFI9/V2plI2wBP
         D8Cpht1jE0uS2+h7sg1LNIumtyNQbmzB5DqafJjaUHz2oUlFRI+tF3OP56gBpbU0jH/Y
         hkZEY+87/U0JszyiZxMS/B2ySrqAA3RYYE5dz2N63QO8Jg5ePjAw9fnuc+6brFgSTNOL
         +eH3Ma5jk117hmrfgQybt8D/KCZFwa9UUbv6L2wRL64l+DIr6scDxxyCkQU8D4RGNjYs
         bmjI7HcQ4KEeA6/vwSqcZBMzO0MGZnJGDX4EngtUbEB+7bQ9M13x2X3xM9Zv1OIiIfgY
         0snw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gbtRmvNq3shEGyYoYnnp/hVL/MwE8wg+HWsl74QhMu0=;
        fh=s5hZWCCxdwlvIjXa/bm0XW8ldjakoxOxaM/qaxAwtwk=;
        b=Ugnc4g6jkUqAc/n57VwGIlXyiOh5MykHYT21modoyX42u8bZhgg9K3Ilp6+jyJ+Pwp
         AevxXb3Uv1/0MFqo5s+0sv1L9dRYS8Zquuad20mezUM9RKEuXz78TKt9Xig/CcV1sQkq
         bmkRgXgQJp2HagCq7Igmrnj+v+/+DuxJz1LB0T5QUVG+nsOI10ELeBb3tN6DS+bFJGCh
         0bXffFEwdj+JLESM2Ik6awZil6QSNV1lFf4IGDaOy7fk1PFfBwzMt6ZcDhlzfiE1PJs1
         N68k/UKiRGUqWeFFHYhitVfNhB07u9rgxJyL4P6blDXb27JPZNfHu1Pc8VU9cQy4anBT
         FMGw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tzbiN3fi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCXFDJ1uN3j8g7qr1Udja7nZplw3J4Rh1N5oGSE7738JFB8BozItOp527RjDnv+K/6g3s5uHN/Qx0typepjhqU89O/aNcMyy
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11-20020a05622a060b00b0042a26b35c05si2026652qta.434.2024.02.02.05.51.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Feb 2024 05:51:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tzbiN3fi;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rVtx4-0002e7-Du; Fri, 02 Feb 2024 08:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVtx0-0002VI-H5
 for qemu-devel@nongnu.org; Fri, 02 Feb 2024 08:51:26 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rVtwz-0004rS-1O
 for qemu-devel@nongnu.org; Fri, 02 Feb 2024 08:51:26 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-55a035669d5so3090847a12.2
 for <qemu-devel@nongnu.org>; Fri, 02 Feb 2024 05:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706881883; x=1707486683; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gbtRmvNq3shEGyYoYnnp/hVL/MwE8wg+HWsl74QhMu0=;
 b=tzbiN3fi3VoaHReOJmJKGxQVVunQspFFWK2H2Z9eqwSEsWjHu9QF815LTic8+I/fuM
 Tca7vShHAJOsNvjynRMQcIESoiN7UpazZgcDy+7ncSLXkIVBqMno48xa76lZO0Lqy9yj
 A0bEf3PeAiGJ7yv45B5Fp2rXSW32km50TXo0i1gyFXlajrpc1SQfGIrl97T6FoG3JV3o
 MQSArXbXzGF2W4yiWWwLKW5p7IiYWGEI4tKRHwZ6xvULz2lKr4JYFw+crPKHrvKhPW+T
 3+XKdqULcJ2O+GQTYxmYixknjOoJ7CsIeNIXsr88aF+/WiH4VLL4n22zppSPi5H6dOlX
 PArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706881883; x=1707486683;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gbtRmvNq3shEGyYoYnnp/hVL/MwE8wg+HWsl74QhMu0=;
 b=rUldgv05gg5FGfipQb0Xp+CNYNuQpX7a4JVtBYZcjty7fTcWz5UjNQV55NQ44xKzrZ
 c+xlOKfmoOKO09NqDW4deeAsgALB6I5y7ehXPyyC8qpOoubFfyLAGkpqU9qjxBJXfeoc
 Jy/pHp+GrDDmCUK3vgyWcpHJtjMs7I2p1pwNtGZWUoSbnv13c6suSHttT7RYVpXAEgjA
 fD07lfttUqhNuUQNbTNu18HhJss6Md007mNbiLHpvV70RwiVoWl5Kv2UFFGRhheFVGZk
 JOKu/tfwywMTI1mzejOBAFAkHYjOYNV3Qoza8Phu8/SuXx4YpvWl3PXmeYVbTBoeLeGz
 SeFA==
X-Gm-Message-State: AOJu0Yw7j1B5UT0QBPNtBQDoF8OD3SHrqD/CFPFCDo0oRMv6KS8YzNlM
 /TMZd1oJsC/1gJL8wAksb9r7nQ7Oi5ZbxVjBYdvz3NY4/lgvEanFH0+vQE9OnHYfMUo5wyaXfiA
 NPbo2faSkx8dWs80uWeJh8LXLHLdZHytFtWeZkQ==
X-Received: by 2002:aa7:d505:0:b0:55f:2be4:61d with SMTP id
 y5-20020aa7d505000000b0055f2be4061dmr1333180edq.14.1706881883309; Fri, 02 Feb
 2024 05:51:23 -0800 (PST)
MIME-Version: 1.0
References: <20240129221807.2983148-1-rayhan.faizel@gmail.com>
In-Reply-To: <20240129221807.2983148-1-rayhan.faizel@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Feb 2024 13:51:12 +0000
Message-ID: <CAFEAcA_=2LoYGsNKMWnKu--suyK3n2jP+UvA4pU-R8vVc9Ag4g@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add BCM2835-SPI0 to BCM2835
To: Rayhan Faizel <rayhan.faizel@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, alistair@alistair23.me, 
 pbonzini@redhat.com, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ctCTg3WBUKpF

On Mon, 29 Jan 2024 at 22:19, Rayhan Faizel <rayhan.faizel@gmail.com> wrote:
>
> This patch series implements the SPI controller for BCM2835 boards.


Applied to target-arm.next, thanks.

-- PMM
