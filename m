Received: by 2002:a17:907:10c8:b0:98d:b2f5:1316 with SMTP id rv8csp1701659ejb;
        Fri, 4 Aug 2023 05:13:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpJgOCNqrDeuJbx9YPSB9vx1M52dnaePyDI2S96AnkRf19xWNkZ10soyWOvHQirKLZw4/5
X-Received: by 2002:a67:f1d6:0:b0:445:1ede:4e7d with SMTP id v22-20020a67f1d6000000b004451ede4e7dmr1158803vsm.21.1691151204492;
        Fri, 04 Aug 2023 05:13:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691151204; cv=none;
        d=google.com; s=arc-20160816;
        b=t4F9ZUcmAvggQtX3mC4ONTTyH2kw1vG/tsSELdFR5GmW2xmV7NGPrbmJ5WgkbrbAh2
         qMgw49WKN9hbCLKcYq17pDQ0K1uMf3ZsYGYgQRs88hqhTJBMLYpjmsRthWrlF7r+pJEw
         qXymbR73yLv/w94Pa3dDYQWSWdvFY3KqkkUVTKo4J3qktVMxP06+sdvuPoYis0/UHzbP
         yvzaXxhPsEZsaEF3kBJQvDLrvRjMwvGid4O9W9aniQGfzrUHy1Ypsrm0aY1vwcjp1kDB
         3IlISDGMMyry7yc0MnHeNRJlcJdWCk+XitQqolOS1w2sDgW4PvBt73kLWA7UK5piGfuX
         9g9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=oP6Nv/sWOF7ZKHuQERNU0H3pM8N2LUjQWlVQj7efbV0=;
        fh=Pe/MIC7yvB073Sd6/4lunpd6aUW6AVi1jfN++S25pLo=;
        b=0hsJrmR/Ra5TcksZiOud68yTugw6FEZXZym/+utVVI29MAKd5UGJLrYjHwAKBjT6Af
         wIt7KC3br+vWtEcLrcZw2dQV25+IVoVyqCBkCwtFRaAipO/VpYU9ilOH0tty7S3FdDla
         PAakGn4jVuGfIi8BJdmmBTDWaYmLCwdmn4Y3mxo2ByHjmdcEpQPAu9zHP0UuL52dTv9l
         yyzWmfXeXsuYt9gOb+ahgZpRUipfg8e17rdQIZM60TVbgz+vtb3g9dBYgSpzriLucW06
         mh8P04a8GL5Yc6+wc+ZOZF395fCjvP8gkwpxLi8kBv6uMsGshQrDG7DKrITUuk7NVGtJ
         xQrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KU0YAg8K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13-20020a05622a11cd00b00403bf9d2091si1175092qtk.363.2023.08.04.05.13.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Aug 2023 05:13:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KU0YAg8K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qRtgH-0000eQ-Dl; Fri, 04 Aug 2023 08:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRtgG-0000bG-4Z
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 08:13:20 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qRtgE-0003vP-DY
 for qemu-arm@nongnu.org; Fri, 04 Aug 2023 08:13:19 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-523100882f2so1955505a12.2
 for <qemu-arm@nongnu.org>; Fri, 04 Aug 2023 05:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691151197; x=1691755997;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oP6Nv/sWOF7ZKHuQERNU0H3pM8N2LUjQWlVQj7efbV0=;
 b=KU0YAg8KfSJc9VaiF0NMiDu43sMOBsVp7AyiqOJUSxfCPkufmsnQjMLYVQ9BSTvWBv
 LiR7sCzwj4riQfwLTBinf/JpGfgxJsLZMsvz6bpJT5jHJe4uh9eMjlRQZRIUGMbc9aFN
 AuRJaZbjny5C2dM3KJU5gqp/0xUJ/27244QuX50L2TYrC2O+Mm8sEYydkWGw8KNx5oXp
 s4ZEZvctq51DLAUmknnpjlaKBox2vo3kRoOKipwNwvRXtwXOimy8KCzz9Uu1ZXcJ6gDK
 nKf97mOraF+CSI7zN1TL65TA8Xre9varf9JWgx2285K/WUaJRX9LIgEHkpnR2AUqQvgQ
 dgFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691151197; x=1691755997;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oP6Nv/sWOF7ZKHuQERNU0H3pM8N2LUjQWlVQj7efbV0=;
 b=Fuq6tuW05F2xFJ32WgZLYVpaW5MtMwRbGpraxk8lZbUvO52BpmIOl5ExJbNXVBFYEv
 M4gHloBK3gwlFcGT/igNMURH5FyPazDV63z/5o/n/7YTod173aeJXmj+0Bu8aSogNDkW
 BfSg00kPgzUE3zUb3A96V3xUsZEor7BwDINf2y4d/79RHNLnGbPlSAx3PP5S4i2/BbgZ
 VxlidhV+GL9zw5m8BPDLQ48+A07CTqvMy2WuI2DVrHEaoaW7XjSRUE0sJUHvnLkKdjaR
 00Lx99GQnZJwgj2V2nk+pWZnuWAEuAPVK0lZhgeNbNp4PdU2HirRtM89cFYaEykXNz8/
 7/GQ==
X-Gm-Message-State: AOJu0YwTQvLGJVTTZ8eVX86A1aRB21KlIneJ/LIFln4/p0gqGlf2dBQc
 BC+NpYoYD3QD0tudcBIu4Oy0ET5a/1pPMsySkASFgA==
X-Received: by 2002:a50:fe8c:0:b0:522:472c:cc36 with SMTP id
 d12-20020a50fe8c000000b00522472ccc36mr1261764edt.4.1691151196867; Fri, 04 Aug
 2023 05:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230726132512.149618-1-sergey.kambalin@auriga.com>
In-Reply-To: <20230726132512.149618-1-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Aug 2023 13:13:05 +0100
Message-ID: <CAFEAcA_xyq3KjKVkrbtGktbS5OySZU2Q-gh_qqzv_iqnnDbQqQ@mail.gmail.com>
Subject: Re: [PATCH 00/44] Raspberry Pi 4B machine
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: OOVoBtTqGovU

On Wed, 26 Jul 2023 at 14:56, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Introducing Raspberry Pi 4B model.
> It contains new BCM2838 SoC, PCIE subsystem,
> RNG200, Thermal sensor and Genet network controller.
>
> It can work with recent linux kernels 6.x.x.
> Two avocado tests was added to check that.
>
> Unit tests has been made as read/write operations
> via mailbox properties.
>
> Genet integration test is under development.
>
> Every single commit
> 1) builds without errors
> 2) passes regression tests
> 3) passes style check*
> *the only exception is bcm2838-mbox-property-test.c file
> containing heavy macros usage which cause a lot of
> false-positives of checkpatch.pl.
>
> I did my best to keep the commits less than 200 changes,
> but had to make some of them a bit more in order to
> keep their integrity.

Thanks for doing this -- I really like the way the split
has turned out, and the overall structure of the patchseries
is good. I'm going through the patches individually
(which will probably take me into next week to finish)
but I'm not seeing anything major, just some smaller
issues.

-- PMM
