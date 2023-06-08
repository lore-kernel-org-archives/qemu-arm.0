Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp381895ejb;
        Thu, 8 Jun 2023 07:36:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ioIfHOZ6f7W6iCiA0gSyyAQzHNPjmUoNZATf0m5WMYmIIJC34I1iSGymL+ibRwcxd2j08
X-Received: by 2002:a05:6214:5086:b0:5e0:e52c:5d7a with SMTP id kk6-20020a056214508600b005e0e52c5d7amr1794060qvb.38.1686234977080;
        Thu, 08 Jun 2023 07:36:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686234977; cv=none;
        d=google.com; s=arc-20160816;
        b=SjEtG6trtppBftxZlxSOz/EhDeng13Mq5jqdpt2mpWYqNsAuZVVqXezVGmgJJ3OVep
         bOt2JxHVxI4q9Y4+WTcdCpo11bbeGPlq10Kdv17z98Nq5+TCTUOVl2rBVsQfA87nc9Rm
         Va4zjc0FEcdseMr+II5szCNIvmV6WPWjLqzav6wg32fM9JSSFs/zp8uxQnVY+yNxxiPd
         A6bDe+dlwM7KPLR1EXFtK8LvsLAi/YCSJbrs0UdfhcwagIl7Iws/PHenrNU+CvZQfcle
         gMgec3Rrv5q8wo0GPZq7SIK/EqU4EJUvtzgXvClSMWSmRpAufultfDvaNTt1O6RuO/cF
         bUhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=mNgZ0eJmlc956bFtj131ysP7IFncrFVU/LsvjIum3RI=;
        b=c0JtfhC9msQaZHDGcwsZC5fQioaY7tZPwu1zHVUb7fNdzM3mMZKgflKUjov7VdHW6i
         F+tpaI+fa6mF3iHqNeNXQZSMNPwvCZ+TDw6WZjSnv8HAKKG9SO0LIglqjKHYWK0zOJtU
         EexPCaoplDBfAwutyD0cCD+QH03XUjjuVIENo0YxX3oTRvfzl8OGHXjMSUxTKQNJcUFY
         pKpXTDD+TMKuf5t0FGLPic5ka5g2E0vQa+7DMNQNlor7zA0UWauPG0NdKiuDZYw+RWWm
         64ATwfPhFG0OjPczwDf972GGDdGZFN9n3+59yvuf9OZnpXR383BGXq9ODJM8xGnr5F6i
         TzNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g0YWidAk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 13-20020ad45b8d000000b005a768be48f6si780251qvp.520.2023.06.08.07.36.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jun 2023 07:36:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=g0YWidAk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q7GkD-0006sa-JK; Thu, 08 Jun 2023 10:36:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7GkB-0006sB-U4
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 10:36:07 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q7Gk9-0006Ki-Lg
 for qemu-arm@nongnu.org; Thu, 08 Jun 2023 10:36:07 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9788554a8c9so127690166b.2
 for <qemu-arm@nongnu.org>; Thu, 08 Jun 2023 07:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686234964; x=1688826964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mNgZ0eJmlc956bFtj131ysP7IFncrFVU/LsvjIum3RI=;
 b=g0YWidAk4B6pnTgxwqXYBpKOk/fWtDodFaMMTdsC9WCjayF1Fp6IKNTJC5mnemuuKb
 2dHBdS2jT7cSY+yA7uhj3PwF3aBFnebl2d1IpmTfSQZffy3F4Xp+FNslJzRQclWd/GF1
 zrfzU55NIemBfyXHiyxbOeKH/TWv1n3/1qxn3myQz/SZVSI1tMu1HXVCRrHxhdPO74q1
 MeJ9uAX1u1tW6Nb7PFh+3x/zIWYpWLVq+nw0zJ9aV7zDyMfrmQWzNPLEaCI6n1uS44Ut
 GxgWoVF7e3NoziPQUd56Z1+9uN+ncXunLFaVN/zuALPGllWul++6FdFs7ST+9JF/RwRz
 eLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686234964; x=1688826964;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mNgZ0eJmlc956bFtj131ysP7IFncrFVU/LsvjIum3RI=;
 b=FtWYKCd2G16gVjVr9Uj1++CuYN3/fQg7ZH/iN+CMbCdzrdYEGmlpIZ53wcE47/YtAs
 UdLIy0FoIdKFpAoFd1hFiYUzcdW4txfiuarV9f2dWxQTlUDhL4xrw3rME3fGxo0BCxQW
 /C4TWsK1bQZ99IH3NqFZdXYd0CL1nSZBpHg+BQVLH7q1VRJl1WeSuRJ3M+uwSYjn4S29
 deE79bOfY9tI6Uk5zx9RHK97AgcbY+pQlahOEgAuSa/HloxCwwTh/VIOMh0kcBPJ+PNs
 cyo6yFKuYFuHJUoWmfeZ5CK70WZeKjbh55Ls9y6gne7eYkWlUbB3N/8IJwppRf8Wi6as
 /Seg==
X-Gm-Message-State: AC+VfDydWFr3YsouGVhzLhkiPiYvr80yaDWCafGMCaCaeVCUEG0x7ZAi
 iZ9ia+np6DcPkpS533FFMaFE4aSixtKrOkuHuh8Y/g==
X-Received: by 2002:a17:907:7f0c:b0:973:93d6:189f with SMTP id
 qf12-20020a1709077f0c00b0097393d6189fmr11332281ejc.61.1686234963906; Thu, 08
 Jun 2023 07:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230531203559.29140-1-philmd@linaro.org>
 <20230531203559.29140-2-philmd@linaro.org>
In-Reply-To: <20230531203559.29140-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jun 2023 15:35:53 +0100
Message-ID: <CAFEAcA8+Ad6MiGiMy_XReKOSOOVURCF9wc63KuT7Mx2_yL0V5g@mail.gmail.com>
Subject: Re: [PATCH 01/15] hw/timer/arm_timer: Declare QOM types using
 DEFINE_TYPES() macro
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Sergey Kambalin <serg.oker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: R1Q1SBFD6BKe

On Wed, 31 May 2023 at 21:36, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> When multiple QOM types are registered in the same file,
> it is simpler to use the the DEFINE_TYPES() macro. Replace
> the type_init() / type_register_static() combination.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
