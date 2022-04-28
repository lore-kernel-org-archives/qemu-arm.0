Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp1629798lfu;
        Thu, 28 Apr 2022 03:43:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4T6cdjeZfnZCSmCqEa3CTRJ+KIWBVIaWeH64IdPJj1Ed2uKJYyE0cXX64R/RwhVoapGR3
X-Received: by 2002:ad4:5bc1:0:b0:42c:531c:ef12 with SMTP id t1-20020ad45bc1000000b0042c531cef12mr23826409qvt.15.1651142595825;
        Thu, 28 Apr 2022 03:43:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651142595; cv=none;
        d=google.com; s=arc-20160816;
        b=zyUOSNayPpwcZj4XmqBC/oONBX8lRqp3mLBPbTkMTlXDmkAD6iXAj8OXnp31KiaFxU
         JZrlujy6nX76O4Gspd1e2p594360fLmNnwbomlgsm+O6ZrzCbyc3+lItOjcLPhn5Syy5
         jj3Y/+iuTi4rgdTbG8W2ImGuBhXFCD1fW9cjD6HxhT9ygAptEbWerwh+Rv9n4XqmOwiu
         j/dwtIJUis81R8ZgugWXIh0FCcjq+9lnNnhF5GGi51um0Ib+x4uQGVlNRf3/cTxut/ez
         xaacLTuLQD1K+f3sNIn43dlo+uWQpSR7oOQh2AEKyaI3KSrSGkcxTECRjvALmSmahGH6
         5fGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mpy8DiKXqz43OiSDdKBT5eC7qrPJws6sI9POxOJD438=;
        b=AlGLRTjL8BUn4BWxL5KK2DfAofTJ2zPf7T5RybLg4kQbT9VQ6ke3KMJKK8S7gDbfg7
         QyjQT6i9ZB/KeGJEp6OrSYPZ9Gt4lvZOujgJ9mTSVHDTKp4S5JAl/t6YSlgJ7O05Yup1
         E+0NFbyKXhATVSF63Pk8e6NBEsDz4qg5LRGjOWwzPTTSGs6eLoIA+6EPDDCz+dc1YBfl
         nu0Q0WBtp0oYOKbi8dqL3JJbwQMN86VkLYxR0rg936ZHXjcFpC5T/nKY64Y/bYC0Y8BZ
         cUB0HiAWeqsQick4kV0fM3IwxmLd9eskzEEVz5Xr14fApquCkhgkJs/N7MWcbiV7qpNd
         /yEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=t65ax9up;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ch8-20020a05621413e800b004563d449789si1276891qvb.486.2022.04.28.03.43.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Apr 2022 03:43:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=t65ax9up;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nk1cA-0002vI-OI
	for alex.bennee@linaro.org; Thu, 28 Apr 2022 06:43:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0wd-0001wa-Gp
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:00:25 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:44796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk0wZ-00020j-B4
 for qemu-arm@nongnu.org; Thu, 28 Apr 2022 06:00:17 -0400
Received: by mail-yb1-xb34.google.com with SMTP id e12so8010050ybc.11
 for <qemu-arm@nongnu.org>; Thu, 28 Apr 2022 03:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mpy8DiKXqz43OiSDdKBT5eC7qrPJws6sI9POxOJD438=;
 b=t65ax9upElxo1J/egNd56iVCmTLKeYCPTdT3iIZUujhxHjiDXCHZsHxLZTm6GbPrjP
 7pkyMb4SewJma+qKb5Bkf/P51oY1iSbNBsNn1WuMltOfKAbdiNLvQW/ImX4d3dW35Iai
 4qyKz2ggMKupr+04klSWiS8zsnyu+ppkRbRhwWaMr4cfP7Js+c49IpDI20WxUxJhpHHX
 hCp+fZbI05rVw9dwWEmfd2KY8JhEq6b/gHEh+49FOgzE/gj0byHoCnW0qoeclQP4RyH2
 0tKJpHGtSY3aGS9D3rLqDQ4tkZDzpvP8QVtSS7PLAqw0Pseii2qB8N+1M9U3w3DHH45w
 qLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mpy8DiKXqz43OiSDdKBT5eC7qrPJws6sI9POxOJD438=;
 b=mDTVO+uuHHKOQMAGUOKIRSzJM7rWsEpBOXDl8LxVqnlZ9+Y4AVM3Y34Ckfw/boHu7I
 uAzVvuTdHhEIytGl1dXzacfUb4IeWEmei9xqKyGu1wWORLhh2I2fuzRh4uPE25DbJWkr
 qqFVERfHStQjA70AvNgklgaM9Aj1Gi0nwjvLYzt4PrZnlZsb4v53fj+v2IXTTZihbl5e
 3oGZa4trJvzVbavg+zaiN2WD0UXKnVpeGDFvzFFimowkZeAMJBKqUhBQNgpGnf43+p1Z
 Vwj31eogoPPX37wN8CRl9rV7AFOwKUfGyL4Ka0Al3fwzQ6mAKSWtIEs6Zi5APcxWnAPx
 KQRw==
X-Gm-Message-State: AOAM532poirQfxuHB9O7XaIWDmT1UJrGbJNZHw2wpsvmDgzZSrLEUqOK
 E8xw+gQ/Mx46q8zSEyy0dJCQse+Sz6Vx9FlXys+fOA==
X-Received: by 2002:a05:6902:34f:b0:645:463a:b824 with SMTP id
 e15-20020a056902034f00b00645463ab824mr29537789ybs.39.1651140014188; Thu, 28
 Apr 2022 03:00:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220426163043.100432-1-richard.henderson@linaro.org>
 <20220426163043.100432-15-richard.henderson@linaro.org>
In-Reply-To: <20220426163043.100432-15-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Apr 2022 11:00:03 +0100
Message-ID: <CAFEAcA-DVqBxeuSe4AUCZx+KJVaFHPs5hPc=RSQiqGE3qJt6bg@mail.gmail.com>
Subject: Re: [PATCH 14/47] target/arm: Use tcg_constant in disas_cond_select
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
X-TUID: Nmc9yQ7zkHeV

On Tue, 26 Apr 2022 at 17:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
