Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1231166lfp;
        Mon, 18 Jul 2022 03:52:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vbD8DkRyUqwA3HcffeSmZeZ7knsfBstL4ZFassPogJOj7v0mlFTvChPvU2bXC8efbQ1bt1
X-Received: by 2002:a05:620a:c43:b0:6a9:77ef:e000 with SMTP id u3-20020a05620a0c4300b006a977efe000mr17118923qki.396.1658141556893;
        Mon, 18 Jul 2022 03:52:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658141556; cv=none;
        d=google.com; s=arc-20160816;
        b=aFWnJD4SkDYV5ermb/QFEwincXH9272v+knmmuONI0LqnNEzd3ft/4YW+BWteSa19c
         dUtVbTE5+0VJRn4lLa4kFnAr2HdPeplwMrgXxJGKBYkDj769HB4Hcy0MtJcFYnG0CiXy
         tH6Bg2wGa9/CKpEi1QL8n8lv3ZohbJ+SJNwoG6BS/TkPR/czGzUrgcClPz3Vb37gLh2b
         KytfbFkXFgKO9nI8QsfbHrBtARnqSzJSvA4Dxqm2yKQc015KsbY8kxbG3SNY/2y2+jNV
         kZjsZq2QGM3+pmsj1hh3YguH4kvWQ/o2fxr6YqlE3Bm6Cl1pl6nzkq559eqOpYfCSAuL
         bEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5dpxDoG2HIyOzF+h3BV/tnDau0651y1Vg8GeZp8E8cU=;
        b=XcaqqMnfWehHNm0v4+/ztqCs2sA0DjKqp5zUOueAlOiB7/A1gkSJJ97dClJp9lO9ND
         QGKNtuY1Y0l0dW1X/ztbA70puPRsvwHUbyALG0lKJAaYyr16efadfyiLR2z8FYaKS05j
         CINQYM5j+7x4B4+YgU++pyzmc8/5IqxJOhdrUHcCutjsNglF1wZFqqddqJzc+3UkGkLd
         l1vcvR9o4BKiiIxjW5k0BW1PCEAnPC+vdSuhahMCYAgfCUk8mb4hbC1WzbKEAYYY8+FF
         vCXAF0SzumPl07+qbvs7Wso/uWfMchA1GpK+p956CoRFjlwXz9rdHxLtBXbBeH+JV4aY
         ftag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FDxc46MM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m14-20020a05620a290e00b006b5a80dcbe0si6401131qkp.553.2022.07.18.03.52.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 03:52:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FDxc46MM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDOMe-000536-Cs
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 06:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDOM1-00051Q-Dq
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 06:51:57 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:44593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDOLy-0004cJ-V8
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 06:51:57 -0400
Received: by mail-yb1-xb34.google.com with SMTP id h62so19994455ybb.11
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 03:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5dpxDoG2HIyOzF+h3BV/tnDau0651y1Vg8GeZp8E8cU=;
 b=FDxc46MMHzOx/BsxrPesqG+/FANQtnIY2y4OG3JUbkqpMmPiAHVf8wv6OY4m7YEwZt
 EmoiHuasOyT/MUoKz5PJBnCTA+KFQSjYwnd/pQ09QjQKKo/o3ekEb0Z7ziAJC56EKb3m
 s60AxA4xT5G/DZy0p8CaMspbd273UL9pS1QJN9JkaDfc7d30Ks8r810clJxJVSVPuxc0
 RH8TErGd3HONjQVBLjfRwU5QL3k6TqBluuGVWDuIb4WsN/2RUuZZ3q+rW7w19FZO+kFG
 t1M1d7kRFS/KzDCnWnDvc6HpRiG8KwpM5wGs7h+RSCIkZ9MGUslwk3wj8Qiqx0xwrcvq
 RipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5dpxDoG2HIyOzF+h3BV/tnDau0651y1Vg8GeZp8E8cU=;
 b=pZjwcEKo5s267CHA3s5KrV639AF/uyCrqPNZ5mJFygMc36jhmOkxWS6vxJ1X4MIVod
 3oyJ8Gat5qncjDyj4vh9powM9HhpzrMxtpwDsYlrdyLObrGUMkK1co5s5+/sfLjt4YrU
 JLqKQT8G4ueZ7tvZubmR0Ya29cmERnX0dJHDgY6gEi8yVdYLxBZXiMiPjEz6ejaUInfJ
 L8B7V2DXffZ1qN6M6q2j2yENHEhmSThBt3ZPLMw/ASPHii8+Qfnrn3L6v7DuTDBa4UDR
 IohbHBhUIOjHoy8rmw6F+4/hEEsOC+eV6LqYnaepZgwpKsEfyzLHxzp77Rs65Vb4Ckd5
 uQyA==
X-Gm-Message-State: AJIora8zVolWOC79XzJZwLE4inDEyPaWmTUENHVp2mmyUQIqlYRxIDfn
 Dkez2ECmz5hPQnl3VamwVfieqxu8job0jJbA7vkaiQ==
X-Received: by 2002:a25:230b:0:b0:66e:e008:a76b with SMTP id
 j11-20020a25230b000000b0066ee008a76bmr27948865ybj.479.1658141513895; Mon, 18
 Jul 2022 03:51:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-18-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 11:51:43 +0100
Message-ID: <CAFEAcA-eoq7KVeKn354quvM=QaKOKvT2CwLpPbNVz4EZGPVfdw@mail.gmail.com>
Subject: Re: [RISU PATCH v4 17/29] Add magic and size to the trace header
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
X-TUID: gVAjNbCDJg3s

On Fri, 8 Jul 2022 at 17:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Sanity check that we're not getting out of sync with
> the trace stream.  This will be especially bad with
> the change in size of the sve save data.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
