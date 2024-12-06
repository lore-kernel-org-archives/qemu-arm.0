Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp857162njb;
        Fri, 6 Dec 2024 05:52:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVE2WAzfuaei8HWtyaTn+GIujDa+WH++Er2foeQHcSTtkv3KjdEdLaZ7nfHJ4avEToHH2+3L/vuF0aoeA==@linaro.org
X-Google-Smtp-Source: AGHT+IH8PWC1O8O/OHfB6zcuTYVEbaQltP058mgkqnLYR1Dp+2iIWzdXUORfJFThUbZAqYVmf58v
X-Received: by 2002:a05:620a:40d0:b0:79d:536f:7b3a with SMTP id af79cd13be357-7b6bcb9808emr545098685a.56.1733493126771;
        Fri, 06 Dec 2024 05:52:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733493126; cv=none;
        d=google.com; s=arc-20240605;
        b=I/yw3maxq5fDUg+jC4AtTVSIe57ZFsedllJ0TCSkp9VGjzDUW89JoPaSXJRLY12ImI
         n5W3dLdeMwpA7GKd4+FOdRWunPZ1iwlfw4+BuwVylJefbBWnSQWb7Uy2oSB5w4GmHsEM
         2oDG0osRsH8Wl69gCMB7F5qC+zLxap6tbAokKLzPo1oiPFmJONRxjTY+zTzdJCfTTnUG
         YRSa+dShXBuU1DKS4LVBJvYzwPV0KxBooEPu4L8NTkdWPOvTQI7Ci7I4B1ZnzRLLBeu/
         NC9IuOxR/subUxFawFzar+O+HUG8vsDB3eVZgSODfgj9KcD7X2AGQvJuqaKbhFA9Zn4i
         j07A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MYAXp/LqnuXcI9snRuByYwYtzgOA+i9+vc1iiTasQiI=;
        fh=GBtICkJPISthJ5wyLGx8MUYkVsjzh6T945gEwwOGQIk=;
        b=aBbiY6dLJ8fQG0D8E7X0ykDkXeV2HH2t3EKLG+rpjNwcM+VaI81xBblNG6Qtixf5xX
         2S3aUu3BqE9/Ygej6OPfy+uDYh5BT8xslhQny8jDYmGzRhmOmAzumCxHhJk03TbJx/yL
         g6eOK8P92W2ZSq+Rvhx24eGVgwU80h4c4v9nYUxAJpwhr5rHzPSBVVZR9vA9hIOfsCzW
         RZtW+LIukJ0Todgveg/THRvbtUdZgB2xjSiQyuscaRyMeK2saz9fbUKQ7nSg04RpJJmF
         CtL4MsAku5USVglwG0hzqYhxj3vBO+hFKebvCHGqJwQ+P1dffsMkpIDeoV9DGA+bEOwO
         If7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b5VI3DVo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8dac46667si42904996d6.526.2024.12.06.05.52.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 05:52:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=b5VI3DVo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJYkS-0006um-Nn; Fri, 06 Dec 2024 08:52:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJYkP-0006tj-CN
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 08:51:57 -0500
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJYkN-0000go-IQ
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 08:51:56 -0500
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-3002c324e7eso14023361fa.3
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 05:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733493114; x=1734097914; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MYAXp/LqnuXcI9snRuByYwYtzgOA+i9+vc1iiTasQiI=;
 b=b5VI3DVoicZowoboQadl23G001Hnb7HNYHNJqUD4F1Cy6zfzKa9sIWSqu6iDLAw/GQ
 RP2UriLD4fbX66bIxeFmdKOvpUsJ9Zlor5Rzs+PrOEdjSGsC4rZzAF0rqyisr9Ete64X
 gwzw4E5CWzFmR1H1xoooy3Bro18tGAuS1JpS0vCPPHG05W7B6udJYg/4qr4ZNlGaXY+Q
 x7vApNFbBpk0y1/79CTCE2rkOmh9j674V/JzdMO7ymVtCryi17TtpLCs9dSS6uLp/uMS
 YlOqjbiLlrUFyvFAmo0juTqjHmT8Piz7ezxXSZf3XQPJHnuyO6MR7TewOE34SLEf/q0a
 wZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733493114; x=1734097914;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MYAXp/LqnuXcI9snRuByYwYtzgOA+i9+vc1iiTasQiI=;
 b=IkMDAUg99xExvt0IsCqnjZQDVKyQNS8Pha+T/Zj3Ie8zSbzPP0365BMQagT/dtREMY
 GK90LCl+H7IgnOqMuCMXwP7bsqgh44tSnWCtL+LoOBsxanklaFOKkECnKwkRQg9vbQBO
 sCDj5EaDTlZs8IT6th8x8Zpi9hk/uOKsmsM1d6LOL2Sb07aebGCKZPEhD2ZhXDp822r6
 66aJ+t9OJ1FQFmQOFjise+plshwpv0K83o3KRLq34rRuTaw8FLyrUCx/G1oipGarXBSd
 nWen5bKYTZukfBCKtQnj9Te6oiK2duafk7i++CbZ4eFSLWnuoCbFWpXcCtt5V6C94Owx
 kUZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs/bnF+QfQXuUJ2etHLbaa0WyJMxwcJbEeo5aaXolTswNTa/qy09jTeNuisSUrmgFhKw3LSU+XAQ==@nongnu.org
X-Gm-Message-State: AOJu0YzkZOMcmHuaF6RlnSTF3jPKSc3BnDAFAGRKuZwletsM8u0EGC4X
 jFJDMweuxs8fOCIo2PxD0H8DW+NoVUYreuc07NXc+d3yBJtEV8Lh3P/NsuV89VLQ9hYE/JMl74V
 MJqtp77G6OQhgHpGG4Kr1hvfjFRz9HmUNg1kQAg==
X-Gm-Gg: ASbGncvgZfe46uTWUucgBOLAgurJv/abDT7+Tqkrf2mccp35YAOtqYnVT6afCDduY2L
 H6p34Ws0TbiByhxN+yu4RTb2GU0vhbrR2
X-Received: by 2002:a2e:9e4f:0:b0:300:38ff:f8e2 with SMTP id
 38308e7fff4ca-30038fffb2dmr6340831fa.10.1733493113661; Fri, 06 Dec 2024
 05:51:53 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-33-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-33-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 13:51:42 +0000
Message-ID: <CAFEAcA_G21DzdwM2bpQuKwXH5W174UR2gA=zhRcSuOm3LqSYeg@mail.gmail.com>
Subject: Re: [PATCH 32/67] target/arm: Convert FJCVTZS to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22b.google.com
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
X-TUID: wxQUVA+djXPe

On Sun, 1 Dec 2024 at 15:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 41 +++++++++++++++++-----------------
>  target/arm/tcg/a64.decode      |  2 ++
>  2 files changed, 22 insertions(+), 21 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
