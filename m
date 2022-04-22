Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp385553lfk;
        Fri, 22 Apr 2022 04:54:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+puSNQjs6Dmn4w3A+mOTNFHtyAkUp1JeUIBC7bQw97h0pufVeKaskNBFCNnvmYxrkL49j
X-Received: by 2002:a05:622a:19aa:b0:2f1:f985:3c0a with SMTP id u42-20020a05622a19aa00b002f1f9853c0amr2885277qtc.228.1650628466013;
        Fri, 22 Apr 2022 04:54:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650628466; cv=none;
        d=google.com; s=arc-20160816;
        b=Xp/9OzLPqLuB+Uhr07VPXlwBsnHhDb/aRAsZGErI8YSCKA3MS0NYkibHOnZupXM5iu
         7iGtB8Kr+2VLje4Mm6Y+jOUevcg9LRW6Cz47t3mrR6v6AW753q+cdUE8SOh/KBLRPwdJ
         Hm3QjZVJgeJufDJe9n10yZMT8OSvmqQHi7iFi/pRgJ7NT1i1HWKuXyfk9mjp2ohiXCiZ
         bhSOXe+5+Nn8gvNGIwgaMavhglr+oAINaHjVmxaH/ze6MaC0d09c6grPhNmz0rBtKKxk
         a8uKBH2SMyVpJnIqcIJLd7Cc3aGHZmQPjMpud5wcYoRVHoWc5M6DoPLD6JWe2Q5fjhlk
         i+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k2hD+lRJ8kqNJdKjKRHtgESEYeoTaS4cvGosPA3HIyI=;
        b=BZzpTDJGiDcNoyhnmeauC7xgrDplTGsxeQ9qnVDFM3jLxuSabdADnjaoX2NrgQSeTO
         t5dFk9RLDfvxpqmyxuTtNT3sjaliYjl50DIuCmcPXSV7Tq+nj//KBCkVEC44x759Ancb
         ri49b7tRWwVwD2S0IS7uAL0Ph/DNCSVHmmaMfjGRoeSY17mRhHGCyfWEx0RrZVSslPek
         7ByDskx8eap7a8uDHBt6xWgNbIKm4b+gIar8C4XHCnK3jsWSSjadclHvV/r1rGAY45jF
         fK8GxuW07VO60tl7S6lRPtteeQMQZZ9iGbvL9012xarYYj9I9st39iSSVDOyfpVcPb+t
         y+sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TOetFUU8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20-20020ac85994000000b002f1dbbe520esi2292639qte.88.2022.04.22.04.54.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Apr 2022 04:54:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TOetFUU8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhrrl-0002c9-Fi
	for alex.bennee@linaro.org; Fri, 22 Apr 2022 07:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45706)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhr9O-0000HO-74
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 07:08:35 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:39856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhr9C-00057a-Ug
 for qemu-arm@nongnu.org; Fri, 22 Apr 2022 07:08:29 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id r189so13854136ybr.6
 for <qemu-arm@nongnu.org>; Fri, 22 Apr 2022 04:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k2hD+lRJ8kqNJdKjKRHtgESEYeoTaS4cvGosPA3HIyI=;
 b=TOetFUU8HJvOCh/P5gbPfnw3ZtG7FoJC9/SjMJzwEjDwbmDGrdmGxWOT9VQ3XDjuk7
 5IdlPx02zuOnbsGzCvYMduE9Y8jIPxJHd0cLTkgyLhhojYsJhUXpY8Tyw1YyBHEWmr4f
 62DaW7mHYANRTOGesObfaMDvfWnIX+vZP8sc8AXlVSTJVMkEynR/6pvLCZoLWt0/ImHH
 OvvQdiKpt47alNoVGigxBaLwBw1XFvWV2az343Qap930cqAPWtgnn89VdPpwGfVjSWTz
 mNQ/pI0JRWPWeTGIDAfYpYnKksERf94ClFCdc+IruC0KYUwx9/EllTUqAiGqN2SX6ywu
 NSCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k2hD+lRJ8kqNJdKjKRHtgESEYeoTaS4cvGosPA3HIyI=;
 b=x1FmfuUtxm32GPQYDoxseUf5vClTwu/ZKDQbgP5KhuSdkBfDSweMjtFNHaeZbxaV1x
 9ICsB82lpa5XTBEc02lV7RPOD4RSMZdlIvd7MqUE76D4TFyjzmFS2JaXpnnT1YGT5C4x
 6H0xBwpt/U41pdr3s4D6CEgWfwsS64hlZBM5Vf8914EaZwxru9YBz421dR5z2b/HqD9J
 nJZSIpuZr7G2ei4BMWKqph0REefZdnP18IFIdfDlft7aWJlhhkb5YJEAP0qww2D40wld
 6o18ypQDc9nWAuX5nryuXJutCD3CveZlS1jQxxerXqpL2Zjg19maKOxbpR15qQSXFwCJ
 ifwA==
X-Gm-Message-State: AOAM533rqfvFu+1MhUDILI3vIiZQxYRpyUQp9rJ7ITJXXRqRyf7/QHTf
 ei8JOjrOXUjx2HvB/jS0wX+/4ukywQFEnf+9Z+awgw==
X-Received: by 2002:a05:6902:34f:b0:645:463a:b824 with SMTP id
 e15-20020a056902034f00b00645463ab824mr3752709ybs.39.1650625701205; Fri, 22
 Apr 2022 04:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-60-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-60-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 12:08:10 +0100
Message-ID: <CAFEAcA-77AcEoeVd+mq+Wq64_Mi_9jGwc+mUVS8G963QD1Z6qQ@mail.gmail.com>
Subject: Re: [PATCH v3 59/60] target/arm: Define cortex-a76
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hweZmXEx8mWy

On Sun, 17 Apr 2022 at 19:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Enable the a76 for virt and sbsa board use.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
