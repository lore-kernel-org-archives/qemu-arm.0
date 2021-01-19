Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp3497159lfq;
        Tue, 19 Jan 2021 09:07:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/IWHMB0QJzjL7UeHtAo6L7rXft2l3Jzeqza8UJG+10tETvUDc2ArP8eCiBRltSp7Go90I
X-Received: by 2002:a25:4d05:: with SMTP id a5mr6853257ybb.429.1611076076884;
        Tue, 19 Jan 2021 09:07:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611076076; cv=none;
        d=google.com; s=arc-20160816;
        b=xATBCbbKJFsZhBQgT618XFcj74v8PjXpeIzy0qdpZui166pA68ZP6uxoCa0sD8YiQp
         mtAgVMumXCgfYc8sJ24ms/Q3gBbTPSU7qbB/np3Xd4Qgcdrn07nWTFGJsve98gVOXY65
         /2z9S5j1F+8TKJFqmh+0sfzx4E74eQTEYpZxkW8d/+N8dZsaNzF5hTqQLuVSMU35rP62
         8f4yx/MUYkxqwK489NhC6o/bu6dXnq128iwOX8Hu4MPh9B+HXDidh8AdAVjVma/BpedQ
         +mNpqIoXE/OISjrGqUrN8oQ90C+vjwDquAurxvsRgMDdEjlZH6yowD7SKLXjL4cF5OTi
         NsJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=71iHg5shNAX3ohyNLymKI5rSBykLw+1hENhzaZlYkqI=;
        b=NXAut7j+FgvfLYrOK63Pv6bC1iAaCIor830eD3D4gqNZIcMZa1aBexbBfHVu+8iQF7
         gW1qFg3nWU8iH3XJUobC3jNeAH5OEH4hAE+zmOV4VUSHjy/LcSIXVgrdRfmSsgPJLL35
         7+hLyKUZU1AfhDr4WYQVVk3eSNuepg8tN/RdJai+j1sqjL5bjmYT9IcC+sF4C7JULUth
         15jKgi6jKbnYGy0fiXE+C4p4PzwymL3FBwWeDv9uKphWqZc1YlMpDhLnOn9hmhqxWuLi
         83Wda80KYEMLtZmd6ncCvhwMbp236rkmeLRmXmFLNZK/cRZ1CMBVIfz2ID/OL4xB4auX
         150A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lGIHkpbN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z133si21485839ybz.330.2021.01.19.09.07.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Jan 2021 09:07:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=lGIHkpbN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l1uU0-0004nf-7n
	for alex.bennee@linaro.org; Tue, 19 Jan 2021 12:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uMN-00073M-Bk
 for qemu-arm@nongnu.org; Tue, 19 Jan 2021 12:00:13 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:41147)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1uMF-0002rh-NA
 for qemu-arm@nongnu.org; Tue, 19 Jan 2021 12:00:02 -0500
Received: by mail-ej1-x62f.google.com with SMTP id g12so29520903ejf.8
 for <qemu-arm@nongnu.org>; Tue, 19 Jan 2021 08:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=71iHg5shNAX3ohyNLymKI5rSBykLw+1hENhzaZlYkqI=;
 b=lGIHkpbNBCbIz35KqIF0wemr0QbiW5VtRY7ACMMwDXWh7ociIHryFHeAqd0KBRFwgH
 IomRUBFjMGFwGt6T5O/u27pT6dya9I2q+2YpzLdJmbtZkRB/Nu0rCAK5T0tHJDxJkMzT
 kJUrqK16p40iRnGja9gKsTLQQLuPcD5N/f3eesH6v7mycE27gbz6bqUI8G3qJw4YcjaV
 nYGNjpQ1QZDIlrLVsW7cyurVP0aC9ncUi6p8Mo36YY0MVt4SWsbQ3fXiEwweexzSzfAr
 ROPTEPzxXVb81TlSHmH3qrNOpLg4s6vXLhFfKlERVoRDLgo/oqaUNTX0wlSaBT4Lm+Tl
 4aTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=71iHg5shNAX3ohyNLymKI5rSBykLw+1hENhzaZlYkqI=;
 b=Yzm0Wev4SckK8H797PNQpQlgrqrNQSzbr+N9jBwxIGVVAW0et2bPeWwWEOvdBia6uK
 69ArdH5hvfdiZ70W40CSFlL/tWIfdLkusVoYVSvuwUf+2fzPUFq3ZOvMUZtCZWopBWOC
 0Z2cYUBIKEGZcMVZh5ejyYMOnxN109R+waIoAI6xmdvKREjpf7QK3Px2zv9KoMfv6XOj
 VerSyrUkneUIdDUTQgI+F0bVTgL75hs7+WjSYukAS+Vky5I8cobaoyXV9vOEaBkzntVf
 G6cquZRLFLrr5jN+7yBosuujLKRLQEXt9cz1l1cP5jj97CCYACOwbbbQPgN68uSEXCPz
 bF5A==
X-Gm-Message-State: AOAM530vYRoPJtAJhBO9u1AEFkXEenglkgMkGCjOgMFseTfFnD3iDHR5
 cvuYdFuncXSTfWiKIpTW9wT0RJ0UXtiaDfK44SUwxA==
X-Received: by 2002:a17:906:4bc2:: with SMTP id x2mr3523065ejv.4.1611075594276; 
 Tue, 19 Jan 2021 08:59:54 -0800 (PST)
MIME-Version: 1.0
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
 <20210115224645.1196742-10-richard.henderson@linaro.org>
In-Reply-To: <20210115224645.1196742-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Jan 2021 16:59:43 +0000
Message-ID: <CAFEAcA-hUK0ys8MU+uy1LQVqc4-zFU95sBawir17jgOBKsDOQg@mail.gmail.com>
Subject: Re: [PATCH v3 09/21] linux-user: Do not use guest_addr_valid for
 h2g_valid
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: z31tNUTWFLak

On Fri, 15 Jan 2021 at 22:47, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is the only use of guest_addr_valid that does not begin
> with a guest address, but a host address being transformed to
> a guest address.
>
> We will shortly adjust guest_addr_valid to handle guest memory
> tags, and the host address should not be subjected to that.
>
> Move h2g_valid adjacent to the other h2g macros.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Ditch type changes; retain true for HLB <= GAM (pmm).

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
