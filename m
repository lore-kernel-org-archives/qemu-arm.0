Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp1579687lfa;
        Fri, 30 Oct 2020 07:20:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRJxjqj6OV0q062O4YG0xrKGBCqhjLizJQhTGAifAI0qLSqNTsQYXWv/zQECD9EX0LB+2T
X-Received: by 2002:aed:31e3:: with SMTP id 90mr2358663qth.300.1604067614986;
        Fri, 30 Oct 2020 07:20:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1604067614; cv=none;
        d=google.com; s=arc-20160816;
        b=UVjGEZ9cz5HqAMD5xZI1XUh8ccmWShLSRIOZId0qUY2xk2APGa7KChWmNvjRG7axju
         742q1yEVUbvpYwpe7Kv1GwbeJvwiBIA3hYe96jyUdFKnrykZrW068tQ0lwI/COGqyhsw
         QemKseb021hgjkQgnkoTN0+A7pe3FTqWlLAKj9/C6wXh0Q1dMvuJ1Qcwy4qnOL//08vW
         vwVtQ/LtpHk9UnojpgRBTGa0SOyVVrS/uX6XOP+QziY8ekP9D8TgofOuWmBXt+QOelU/
         4U93pnLHNFx7BYv6R8R9AYYUtWaSVFdvWa6EfbkcNre48Jk/BH+Dot2PkT3ZnJ0gxnND
         CbkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=encGXGDBIxLLYt5MkaJe/Ez6hqIFN5D8qmeAtZb1mM0=;
        b=ZNBBfUs/8gcNMIChLe+M7iPK7uOvuexBaz6v5nVe2FPP8UA4oqHJ+nfxDp1Mgmbo+7
         vsTbQKJwxPRkIahuUK8n9psGSuoK6gUCi+w1YNtUbCkSPYhfY9PkGUXCtmsYgyOqh7Ly
         oX9v/els6xCqEOc2Vkxe6TMF/aOxwvlMlf97gk3kgyO5D3Q7N22zpfoFLDTdNU28MzVs
         JQuKaCRhdPbwPIygpsHcJlC3GTQp49SyWXv0yWsfrV7mH/yNExS0h+WD4h16QUxdjbCO
         iIkDKG/40/Qf2W3Uf8ZFE2aR2AnyaGCellBnqZqFI8N3vLN8CQDwW1IjyPHERPoV1Rsu
         CGpQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JJcDqgz1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2si3610757qvr.156.2020.10.30.07.20.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Oct 2020 07:20:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JJcDqgz1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYVGI-0003d2-Cb
	for alex.bennee@linaro.org; Fri, 30 Oct 2020 10:20:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVAw-0006M5-Hy
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 10:14:42 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:43643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYVAt-0007XQ-Ih
 for qemu-arm@nongnu.org; Fri, 30 Oct 2020 10:14:42 -0400
Received: by mail-ed1-x542.google.com with SMTP id dn5so6774812edb.10
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2020 07:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=encGXGDBIxLLYt5MkaJe/Ez6hqIFN5D8qmeAtZb1mM0=;
 b=JJcDqgz1RZsbfxr1SinJqWwxP/VvwjXCZsrm3wUoddKZ7N3XElPj98yXhk/ONeJgLJ
 YVkfnPITkAcWn5aJZY6qJUYQBaGKRQcSDRr6cYgnJ+XACynxTjMKTE6m3LklJqMeG8M9
 QFv0qraHd+DW12wgtT4sxowIZFLIXKn/8t9/YcSBaKuM7VfDLUyeAwfgmHhsKx8EjjwT
 O+wDdocyEmm85uj/NUaCoqotl6Fl0oXVPGVrICTJ+ESmJjWJcjJxXCbDWQcAsZHruFWH
 BMrkfOzo3Mn4StMXJ4Z5G7UwuT3BbDm8My38R2gosege/UR+3Cw9+xVpbKiSBFvUQEWu
 KqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=encGXGDBIxLLYt5MkaJe/Ez6hqIFN5D8qmeAtZb1mM0=;
 b=hu2F1Sm9SM2Ats+Gfuato+Y0m7N3NDjv1kIWhM1w+BYJo74QA5JyPrnqKYVKyfMUIP
 NCowwZ9n+dn+Gu/skybnlN5FubZKEQVs2ks/vJ19dn60Sax+1nrdyZ+7zOxPn9+S3xlq
 IHmJLs0W71VAo0qqpQQey+UcsOyzvVU+CW8P7VzulbZSnH2b0KNInDhZIcXnbYVECAzs
 rLrL9mwSF4dGlqxbA1Qk7AvHqtQCNON7X3/wxnjPv7ju636TWTJWT4JkSfNHGbOORMjs
 JPnyfRaQCuRYbdHJhY8PLWzAZEqOUIgxOpHE3Yz6AyfrAdJ+/bYZdSV2k70NOrLorOBK
 Tayg==
X-Gm-Message-State: AOAM530yur6ZN6QAfbNnoys39XU9zeakdDuiO461GfaqmKK0W3jdo6rU
 KlYw+tFoxH3sgRbzkoF/KuNKw/FC/Mr0t3sahZtGUw==
X-Received: by 2002:a05:6402:1482:: with SMTP id
 e2mr2695753edv.36.1604067276872; 
 Fri, 30 Oct 2020 07:14:36 -0700 (PDT)
MIME-Version: 1.0
References: <20201029202520.9313-1-remi@remlab.net>
In-Reply-To: <20201029202520.9313-1-remi@remlab.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2020 14:14:24 +0000
Message-ID: <CAFEAcA-YA3JmNP_Q2p=VpvrxCq-MOiQoV8NpJdjO4YZ7iE_+Vw@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/arm: fix handling of HCR.FB
To: =?UTF-8?Q?R=C3=A9mi_Denis=2DCourmont?= <remi@remlab.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: fNs0vkYBv9hY

On Thu, 29 Oct 2020 at 20:25, <remi@remlab.net> wrote:
>
> From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
>
> HCR should be applied when NS is set, not when it is cleared.
>
> Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> ---
>  target/arm/helper.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)

Applied to target-arm.next, thanks.

Could you cc future patches to qemu-devel as well as
qemu-arm, please? The automatic patch-testing/harvesting
tools and some people only subscribe to the main list.

-- PMM
