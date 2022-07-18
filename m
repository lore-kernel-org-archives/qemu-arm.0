Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1229082lfp;
        Mon, 18 Jul 2022 03:50:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vLOX1NE8wq2cVi/McPrbCajHIE67cMPp5r23qxz/wG/AUX3R6T2WMluruq2DnaT1bMEfBJ
X-Received: by 2002:a0c:9124:0:b0:473:be1e:b11d with SMTP id q33-20020a0c9124000000b00473be1eb11dmr9407562qvq.20.1658141426471;
        Mon, 18 Jul 2022 03:50:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658141426; cv=none;
        d=google.com; s=arc-20160816;
        b=XveTxue5vbRuAjfUEqJ4a7+nGaYs2QvqVo+CihXXAqc4iIyM/Vi8xuWHNdqbBe1wnF
         uhXb7x+95XBHiVbzEZqXT1j7I5u5SMQZVWr7tovASj8C/F+VrruZ2N0ROCN3Dn2MqLzZ
         2KYp0tN4fyG6eMmyCUDExMV240m3pXNZ6zc+RKb282hgDUrBrf8OpukzOf1eB8Bs+2eA
         U/rzorAICbNIKmU6cJwe/vu85JUMyhhRfFG7ao0/Cfi2GtoWqZ02ma//0QIbEYVPZjaw
         IsIE+MaOZY60r43ciR9kCy+ovi85mKERPAeKZbkZelBkds0kNrtwMueeSpJUf+xdpHBI
         sANA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QVVKli295o7T13jP/inzdTVJznvyWiLnP8E90M+rGOs=;
        b=kLuVko3d352JEjAK57bXOgQ0wNxNVt+4or9cMmb3g71ioW2ZvWWUm4SAOTlA26jtRG
         kU7Ylaqb/r+IXOlqjCPzFTgFroWPy1ls1jUJPGbnEa6PPyc7FMEmZKgZj6VGK3i8DDCw
         i3tzcMdZstg1OfakMcEtvizN00Bn/HJbap5pKG2JbkDHvYoorq5yX2WyXo7qoOPJipwZ
         nMBfqF1Qk8e+RBuwICrybC5WnEIpjJPhnK70TXAUNIei23BEaMv4W3GhttWNiMtSm8JN
         wF9gD92thXSYNYejKU+n/krpwLNA1HY87Q6JTiy0OUr1JZPDa8PJEINRRBr46eRxlhLR
         /Ukw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KIHR9wtk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id lk5-20020a0562145cc500b0047362d50fd4si4245492qvb.543.2022.07.18.03.50.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 03:50:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KIHR9wtk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDOKX-0002fW-UG
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 06:50:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDOGq-0005jh-2A
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 06:46:36 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31]:36594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDOGm-0003Yi-IM
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 06:46:35 -0400
Received: by mail-yb1-xb31.google.com with SMTP id n74so20062670yba.3
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 03:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QVVKli295o7T13jP/inzdTVJznvyWiLnP8E90M+rGOs=;
 b=KIHR9wtkqolNGylAsj8lMwbpMxIJTkr+ndauSQrDHR5Z6XxLlXSLLY3tRfNmFqbqky
 1CKao32dyBaGVj+Zi6k56g7uOFhS/sGKHGBcmk2TMZVETXm+TzslBGexn/WuqfHF5Zjq
 liOVxCb/EDI8lGFVN5GbYjXccs5lCg9mUQQOEjUrMXZnjnerF9cqsYrlwsJ59VLN26Gr
 87qPwJ0Joyi/qbgK0RIgse1L42mBi1vAkJXnJYjFn5AZ2JTqRU0iR0slDXt1ZwBuNw+a
 JGx5hR4DZQ7vBb6dOZCaGpeNw8R1rcwUAwIpvxs/obOKKA5l6oNdifn7nNhbhrEP6nZ2
 cneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QVVKli295o7T13jP/inzdTVJznvyWiLnP8E90M+rGOs=;
 b=70/mq1VY03NxX5yFw557dvYnhhJWdiOyPRVZQEs/ezRY/p0zvdHv5o84UjfY1JQXzi
 hr7CTr85E9LYFu2wZ6j3B2cqebs1xt+kRC0fJXcuwIzpXL0BMd+uYGemQ/DMyQUPWQCf
 X2++jG9b2/08pY1aSBl98TyDyYRdcgJjGCGUBrN1EqLRWbn9EyVux8YoDxdAl+dW2U1y
 9rs0Pe0LfqiYaf1xh1OCDArLS1fHsTXRB7+eVlJbb6LekBQFq48P7QQGoPdK99POWoWn
 kPXG5hmoGNjBIFQMUrbh0WrGXi+0dWCB193MQuHdkopkqtWq3Ah/ENzPlE4ohercat9D
 09Zg==
X-Gm-Message-State: AJIora/6jnbFAT5xHWPkX61sgVluIdG4kpvKg1LdlCwHvVEE1+ctJYWr
 QiJURrLcW6zqGqpzxk3LW0a1H3qM8BQggxAJHYDPWvELybE=
X-Received: by 2002:a25:230b:0:b0:66e:e008:a76b with SMTP id
 j11-20020a25230b000000b0066ee008a76bmr27929080ybj.479.1658141191487; Mon, 18
 Jul 2022 03:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-15-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 11:46:20 +0100
Message-ID: <CAFEAcA-Tm-4KODtD7BuUWGV72zneZW9drnpDW1iubGiSt6Oi9A@mail.gmail.com>
Subject: Re: [RISU PATCH v4 14/29] Merge reginfo.c into risu.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Fnj13pz49dSR

On Fri, 8 Jul 2022 at 17:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The distinction between the two is artificial.  Following
> patches will rearrange the functions involved to make it
> easier for dumping of the trace file.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
