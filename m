Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1920832ejy;
        Tue, 20 Sep 2022 10:04:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM65lyD/wEZgHVZkvizU73a/jnuBT1Vm4FnXDscIH5VWuhYMC+uIwEcR5vc+CCpENVcjHm2m
X-Received: by 2002:a37:ef18:0:b0:6ce:175f:409a with SMTP id j24-20020a37ef18000000b006ce175f409amr17461539qkk.572.1663693488869;
        Tue, 20 Sep 2022 10:04:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663693488; cv=none;
        d=google.com; s=arc-20160816;
        b=GZl8RLzj0XQ+wzzVJg/19r68df7WrQNohp/jVjG8r+ubXhvWXUqpnnDA9MfCFbIVXI
         xg2/cL+g/Ax5KCmd2PEyThJoKOnl9y0i/Ul5JJ6USbQYroQZ2viExECUszC5UZlKW/ox
         eWu77HRwMHFnctTbaL87QFzDgO3qy57VioS2ZVmUrPXi6ebYNxT2OlGqqqrz+MsVlRhq
         PUOA9KSwh1L4EVTYNwSca0Z2VkQQm0cUjKUcqUbxBhwhEH8+JXBxHZR/Ny41MzLYd31Q
         VTTjXcci3IDlluO8MiePwaN7//WjyI1fdDVsCfVgyzcGRo8cQBc5CQjvG1IPoWQX8w5G
         eSHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pyJ/nFjoPXO9wUYurMj3x/9Yvz0F7hKxeSMMyhvPSO8=;
        b=cKW0Cm2ar4LPEgrPD3yH94+LMpqxIv1lqupK+7hnSHGdiYF+175ZPitJKQyQLIixQ3
         F3vsvvI/+4Iha6/BtwkkEp950xKMQ1KzpTQw6Ktj0q4l/NLNtYnme3IHogfgD7D6mZbn
         ezsD0U45jLlnL+GUtrp4OHRVeKsNXOCjudbp79vG82OGN8HQSHprsKQJHwOlxx7oqwnh
         AHZJgK3weNRhJYN0fHmaef+alfGFy9n+tppveIAY/ilBZRmOwD0IT6AX53DX0SbpneIt
         F0JH+dafl8gVJnjgs806kMd9hdmLq05ignM7CjX6XOzkTwFalPAZuPhqjElMJzKF/JRz
         cg+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u9gse6kZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr12-20020a0562142a8c00b004aa26c827f1si132531qvb.523.2022.09.20.10.04.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 10:04:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=u9gse6kZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oagfw-0002M0-7Z
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 13:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oadeF-0003gU-IQ
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 09:50:58 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:37458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oadeD-0007iR-4c
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 09:50:50 -0400
Received: by mail-ej1-x62e.google.com with SMTP id a26so6344446ejc.4
 for <qemu-arm@nongnu.org>; Tue, 20 Sep 2022 06:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=pyJ/nFjoPXO9wUYurMj3x/9Yvz0F7hKxeSMMyhvPSO8=;
 b=u9gse6kZtiz5FN9ayfIMzkcb6N8mX6abBSng7LWr0Mw1WazBS7a1fFQkvcXkBha/n/
 dphecKLFdQU3QHhKm/fQb9wclos2D4ywpB8SnTeJHo1X58ttkzvEOrAQHgNe42l3W4uJ
 Aknj6c+HPxbSeHWTDA7ENuYV6sZqgFq6Oih07RlSejrHubX0vQgP5XIDXfNaFtuS0uWa
 QsrlVKKcSlhbmPwZZx/mG8yEl/xrxRCNecaT2unsq1L2zBYeJLSg7GhhSIUTskuWJQKp
 LCDf10WECNmEbzyg30bnLyffb1XvwVQRgb8D//zUB28PrviYYrdFW4YPg9c1g61vK9g9
 5hJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=pyJ/nFjoPXO9wUYurMj3x/9Yvz0F7hKxeSMMyhvPSO8=;
 b=6cUSUvctduOJupGaxIRewyqOUzvc0hTgdYTbNJMnB0Bt8jHUtSoh3Vw3owc70Jz8Rc
 P9+Eqd4nWeox2vdGa0Y6l7dxFwtii/8/fvxtNOwn68iZ4nmBYBjB0VXbxJh5bXm0sBQI
 nWeb2/aVAczkmnJfeBmRTDW3z/9saWRQDfUTUN33FYA7tQfIjRfg2nIC/H4buUxvpTIh
 CaYqS8g7yMK14b2fdQ3Mwkk2uJazi3hsYb4Tien7IH7aVRNXvicpb88qu1rcxXrLG0SQ
 e2WbhQLzXxRcMYMiKUWDrqVCcax9VHrH3LWKEVSf7Kr7SzR9Mlh40LJliCngMueVUo8R
 Ihlw==
X-Gm-Message-State: ACrzQf2Gz1zfFUmkvg7UitVoy+dFhoSIu/h7IUJStvnKk10Yypsw2zxs
 5/lcaYBz+NVJY04zV1btEUYzQ4lx8wC2UVt6VnuzMQ==
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr16304619ejc.504.1663681847568; Tue, 20
 Sep 2022 06:50:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-2-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 14:50:35 +0100
Message-ID: <CAFEAcA98oM19VbJmk-79cfq+05r_RwmAhkRQv9ANw=9nhEKK9g@mail.gmail.com>
Subject: Re: [PATCH v2 01/66] target/arm: Create GetPhysAddrResult
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000008b433605e91c1d43"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1KCdxxAlvIKz

--0000000000008b433605e91c1d43
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Aug 2022 at 16:42, Richard Henderson <
richard.henderson@linaro.org> wrote:
>
> Combine 5 output pointer arguments from get_phys_addr
> into a single struct.  Adjust all callers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

--0000000000008b433605e91c1d43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Mon, 22 Aug 2022 at 16:42, Richard Henderson &l=
t;<a href=3D"mailto:richard.henderson@linaro.org">richard.henderson@linaro.=
org</a>&gt; wrote:<br>&gt;<br>&gt; Combine 5 output pointer arguments from =
get_phys_addr<br>&gt; into a single struct.=C2=A0 Adjust all callers.<br>&g=
t;<br><div>&gt; Signed-off-by: Richard Henderson &lt;<a href=3D"mailto:rich=
ard.henderson@linaro.org">richard.henderson@linaro.org</a>&gt;</div><div><b=
r></div><div>Reviewed-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell=
@linaro.org">peter.maydell@linaro.org</a>&gt;<br><br>thanks<br>-- PMM</div>=
</div>

--0000000000008b433605e91c1d43--
