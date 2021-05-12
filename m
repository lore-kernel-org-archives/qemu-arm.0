Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp5114115lfg;
        Wed, 12 May 2021 08:25:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxrZnZ8sJYLb7cx7aeymgDMuXDeofxpmHfm/bxiOdjGGZTTyc0HGvT/0T0VLJUYHf/sxfVy
X-Received: by 2002:a05:6638:a2c:: with SMTP id 12mr32601092jao.99.1620833147725;
        Wed, 12 May 2021 08:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620833147; cv=none;
        d=google.com; s=arc-20160816;
        b=ysVkuf8sDC1vcuOkY6jhQqnzva4LdnwJz2dtntyneLQaY7nwFme6IXjDwowokauofs
         +FN3SRafhd86UUtSonlvb6LVrUeWJHxTDFkxeMMmUv9o4PxEO8R1mgGd9liHVAe3kjv5
         rlXAnGrfq6zFXS78yFOFciN4oqPgdAbBk04t03WWrt8JizCZgkYd9fnuaXbHJC1KBbgZ
         6w6xkO6TOkbOZweQp5LJmBmg8jSFIjo2qsmgJqBwD/8ApxS9PgM7u40czUGajrVyNQ8v
         Gnh59BVVV6mlOPnGamO/QPblx0D/GQxk2oespI6yOqNnN78BEZaDsjD7qSiyA25QwfHB
         Zn0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JvvYo6RNFIX9kQ59m/m93tMWcNfN0jWwMrDYrgeOWgE=;
        b=tQTXx1C7Ct89ALj0zJ9Xhv7yPBm4NP51J0c4TYpmhzn7tIwnxERXzki9nx6dBrxyGW
         v9DmLvfXbMxSeKiHjpHdJ5Sy5rjNHljfUVKv+AIShtqLuf++jNe5XvUsUS5vXbysVNBT
         RQz8/566C7PO1XyYMqfGswl1aw6zCrTR567BG10D7i+Dsv4izkp6wqMbL9hBOszDFMGe
         KyoM1ktplWPIIR+UWsFCpEyPTGZLaShZIIpQhVA/MJ7qQ33B0QJPo0FiEvVxba6E4S6v
         3ADZnaCKIpOLXTa1XBX/kycds3gQSp1+zTSNfhFW4hFc4A18H7DMjYB9aWPDn7FdYl0R
         KEbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q69bVv6z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6si24316835ilu.44.2021.05.12.08.25.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 08:25:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q69bVv6z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgqk7-0004ZF-2e
	for alex.bennee@linaro.org; Wed, 12 May 2021 11:25:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqjs-0004H0-7w
 for qemu-arm@nongnu.org; Wed, 12 May 2021 11:25:32 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:36814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgqjp-0004m1-9x
 for qemu-arm@nongnu.org; Wed, 12 May 2021 11:25:31 -0400
Received: by mail-ed1-x529.google.com with SMTP id df21so320410edb.3
 for <qemu-arm@nongnu.org>; Wed, 12 May 2021 08:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JvvYo6RNFIX9kQ59m/m93tMWcNfN0jWwMrDYrgeOWgE=;
 b=Q69bVv6znYZwV6v6YZfxy3wkPVUqpwkbtv+cFAxH4leukpUJs8XbwNO6g3PP9yoaan
 4hilZ0KCbMRbp6M2EYoBlwRUP+ZOMqY+i/PvoZDmsNaBbXYOOJ0/4CpnvKUwdtp07rQd
 2GZfYIeN+BL3J0wb2MuIXBxPYVsNnAz4Qu68MKn0XJkn3EIW+hedct4h1WEIb3kqcNF5
 jIdqEMF8WjI9QQ15JnLoeXUaZV9Lp5+Sp5H4jCS8hiOvwIs4deH3cBk9mhnzm09RdLKj
 iBa9YyzPvXK2CDFMGRhI9FbFtlScpOHkkYDie2F2LL3KKva+CcTMPe1fWUphSpdS7W83
 b9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JvvYo6RNFIX9kQ59m/m93tMWcNfN0jWwMrDYrgeOWgE=;
 b=baNP+dE0BZAzEpMwDKSCOpJ9u8ke/lnUfXbDfVY/REhpjwpg3W0iixDYdz21s1PchO
 t65D/M6DJoo7jvqxKbLpluhgb5C604b9n/SHUDfgHPvoHhwjsLbIfZqAepEnotJsclpp
 6nBExK5JnVCkYFPxQ0PeNZ2ujZRJ8q0aFCGLCT+jrbkYAkxkuMY9RVWT6WasZe2ktO/P
 ipue7gRsClPGPX2DqZkLxLbATj5zzsxLL6yXHxyNInBMtjEtelbk1HXrHX/6LAopFbii
 l5YJhwXAgjXayvntajhjj1xIOw9L8q9LURsd6Bhy6CdHUhOIKxTT8Mj4Ibq64bNvYglR
 Xyrg==
X-Gm-Message-State: AOAM5337PjT6wg8Dtyu/+VIaMKutoOHjKg5nDuBzy345VWibCFm1WQo5
 qUJBJEkGqsDogtYsmds+77XvHtw1wpAO+KhyeK5LXw==
X-Received: by 2002:a05:6402:3548:: with SMTP id
 f8mr43515876edd.251.1620833127842; 
 Wed, 12 May 2021 08:25:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-40-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 16:24:14 +0100
Message-ID: <CAFEAcA8pYZH8qVrso1bw1WnPgXNGWD_mgAX-=n-4NPee5=Np5Q@mail.gmail.com>
Subject: Re: [PATCH v6 39/82] target/arm: Implement SVE2 RADDHNB, RADDHNT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0OegJeOOWgpQ

On Fri, 30 Apr 2021 at 21:56, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Stephen Long <steplong@quicinc.com>
>
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> Message-Id: <20200417162231.10374-3-steplong@quicinc.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix round bit type (laurent desnogues)
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
