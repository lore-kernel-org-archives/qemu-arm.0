Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1824697ejy;
        Tue, 20 Sep 2022 07:30:52 -0700 (PDT)
X-Received: by 2002:a05:6402:2b8d:b0:43a:5410:a9fc with SMTP id fj13-20020a0564022b8d00b0043a5410a9fcmr20435139edb.99.1663684252289;
        Tue, 20 Sep 2022 07:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663684252; cv=none;
        d=google.com; s=arc-20160816;
        b=lvWigd21p4uB0Os9ZlnJvKFUIeH7bzoRUeuTwxCBJziIQTgGQIFTz5h+ArNCEdHGQN
         pGMFudo8q8I4UBYYnAv4IjJ+vcIOndanvRcOvmJG6y4iePpSHPT5n5w7IcYFspaLlxjd
         u+FM8Vy3Q2UVD1bWZhRl27Xf3BfyRkem9kJbBwS68MiHE+fizCxw1Ux7NxTTZpSXtQTH
         mXNMGFWjo0PDHHZzRT/6b6sLgGjeIbIz0WYeit6kkD8UZdmI7Rn5K7XpjL/p2hpVXE3y
         lgV1QZFnhyB43LR3Vf6EeTM23QUj6rRIIJfTXnAMuvPLIICbOPHBfwy9Rf8kH4y8vS59
         nfuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AUmvu7vrC9ryCBmL/ivn9kK7tghWXrI7/qQgwoyYW+4=;
        b=WTHD7FIC+RpgsfLiVOpQBvmmZZkcoXs6wFsrhezgOMgY76LZPtFlfaXMawdxUZ+dE+
         GmT7FQA8Yxl4B7/xrJ5eFf4HtyWk+7qB9FLBKfESfYRzYOa1eckvLqfDxjlb33KfRp4h
         F5WXH5GcZ1r8Wrkc+Rnk9e69VxbT5kKiCg9P0ybcZ2qjN8kp9ljcy+ZTkJIsnJXAscoj
         ErWpb2+uFN2n/YAlRdZremwJkkg2o3UEbpmSSX0q/TneAa6sjURiyA6MsZy1XDEsnnOX
         +XzbRrpbEVJy2Bs60iRdhY3ZQKg/0LnTTcR1I8TzmZF5SwyXFj/U8s4mG7wZGCJx+ukY
         SMJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hq9b3ZOd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q15-20020a170906b28f00b007797e21e478sor840054ejz.46.2022.09.20.07.30.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 20 Sep 2022 07:30:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hq9b3ZOd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=AUmvu7vrC9ryCBmL/ivn9kK7tghWXrI7/qQgwoyYW+4=;
        b=hq9b3ZOdv2IobvBGdmQfpCooB4dMqVATmpi4c0JFXF7hzqRu5Q2yljB9ajFwR1MkNt
         EFUOVX0VD7Yz3LlUDPbuuBbp1sEq4cA9O+B54tih8HvBqgXfJCek49PAzk/Uu5DGxzdy
         Q3nazI8CHvKntQswhN3zX4fMS++3CwD1XThK2drBx+iPaCC8TyXki7O9Bh2HcCaNFKKa
         3Ht7nI5o3MLS1c865gfZrTZYClQNcPwCSKno7TFv8okZ9rYHHxWge3c9oV8AmAQyAD8G
         p65apSn2XeXK8h0agDUpnqKJZbWDaoi70CBshuHnZ47C9KTnKBiVIEaqC7oMRrDxrtL0
         SiQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=AUmvu7vrC9ryCBmL/ivn9kK7tghWXrI7/qQgwoyYW+4=;
        b=gT1dLTcZbbiCw9x8OUc0f3inV2H321j375bCiD19MtTfbaFh2zvlEzD1+2/JPJcr6R
         IhtHMqjkrkXfjyaOb45NRSrLsb7mexjY3UnYu6an3Btj8xVpmoV1GF+Tb47wuXWZDAhL
         D9pPYo0X5ExPiBdvgvSXlXiBScVDVRY0KJa1S1sgAG20zyjgiDOCkA7hogpGNgxkG6ks
         viGjom+zl5ozsoLNDfeZVLiFbxbBI5frAL1CnxZfcgfFT41/+uwgEY+3o5Q6u8GIaWZv
         Mt4DrM+wE6FK+Zw3bq46joBrfAAtgGvnFSdFGwFtwtLZgB41jUYoF9hqggpH2IQ/5rCH
         H/vg==
X-Gm-Message-State: ACrzQf2+dfiMVU6ikis9wxBUPHiqd2zHpH2d/jqJMa41yACw1HU6FCPv
	r+sw3omrUioo5iye6cuhg5Gz2sDSSKabvKaMAjpX5e81Y+xzXw==
X-Google-Smtp-Source: AMsMyM4op3tl8si2YWF4SxWucZ5DfGFi0Tji99P13wo1d2+T++5AOvh5wsOcMuXEd0J3bp2FGmZRgJjkEoauUZSah/o=
X-Received: by 2002:a17:906:db05:b0:741:5730:270e with SMTP id
 xj5-20020a170906db0500b007415730270emr16499608ejb.609.1663684252075; Tue, 20
 Sep 2022 07:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org> <20220822152741.1617527-10-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 15:30:38 +0100
Message-ID: <CAFEAcA-LSq1TC2OuLnDdR1+Md81hiuR6gF7MQEc5hCAO3jScSw@mail.gmail.com>
Subject: Re: [PATCH v2 09/66] target/arm: Use GetPhysAddrResult in pmsav8_mpu_lookup
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: nBQY7JfL0jDE

On Mon, 22 Aug 2022 at 16:49, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
