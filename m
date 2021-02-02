Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp5575lfo;
        Tue, 2 Feb 2021 02:37:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx59xuw5Bk3mfdSKe11WgHaJew+ezEHhP8Rtmt7BTbtj5JVHff/r5ILvEiuUk+ZgBPHdGKU
X-Received: by 2002:a25:9105:: with SMTP id v5mr19973253ybl.249.1612262238006;
        Tue, 02 Feb 2021 02:37:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612262238; cv=none;
        d=google.com; s=arc-20160816;
        b=N6oCRHysfDbotvXpwIwRfH0EsbWvkmPC/Jdt7A+uumGqG0s5Kc2zdCZlO9B2FCwHfu
         l/kaDZpC/pGqKnBNIoAkEqtZ/rjsW58b8o0ZT0od8CxbWxAosg4RVQpv8C6zkhyMhS5c
         Grq8096cwTYxoIOWQR8psiY21hpiaA4PxQx48bPLhzdHUkhZRaZrld6pDO5SxPs7+DLa
         l37VonZVDXN+CqXQPSYQbFRHEhiKki7JdD7KbnLdDJ9EYMwvdH9Hxy5J2G/obz+w68fx
         8oTXAEwGMg792EGJ88iEqfF6r9KoUdXMlrLzIlWDxIRSZ7NJSnTyCBGG6/QjJ240l8Lr
         ItEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EHgFUnW1wQrVoTK6VJEdmulKhIcN39KNGoL+iGbz+pY=;
        b=xJBhbk+kzxrehHYnm2UGHU46uMcqMTnZFKSJiusHR9/6awAMzA5OsCe6j+K08dlqly
         HS+sguJ4wxGJQI2F2aZUJ6Xhi4mw43b9HMzSZdNIvmNsuaQDpdgzXDvVIceig0iD4Pvj
         AOtlYm2+1B2unR+pidpMPubyAHiwwfa1SqOtOlfSLvYwBdf0dUCfOG9zULpLiPQO8nub
         AwoxfDs1VZVqqaLhUHJkxcP9cc8veGvXRCPCanj0lysLHBbjnrULyNo3qrRBcwTEFEvQ
         lJuzSKtTBVvwM5jN7R5Uzw7j7TQB8vGCp+TBtc6SGNcGB7R2v2Vx07gYxa4PgwqKGak9
         /cmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UoyqLA8C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t123si20919949ybf.107.2021.02.02.02.36.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 02:37:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UoyqLA8C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6t3A-0007Vt-Ks
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 05:36:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6t1Q-00065E-0a
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 05:35:00 -0500
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:32915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l6t1L-0005wZ-SL
 for qemu-arm@nongnu.org; Tue, 02 Feb 2021 05:34:59 -0500
Received: by mail-ej1-x636.google.com with SMTP id sa23so12850532ejb.0
 for <qemu-arm@nongnu.org>; Tue, 02 Feb 2021 02:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EHgFUnW1wQrVoTK6VJEdmulKhIcN39KNGoL+iGbz+pY=;
 b=UoyqLA8CMc96TpllXgKucZSL3t2k6x3bXrfaSzKzNQuP5RWhd40WbUTUOibuz7eu5m
 KuSQafyKFUzXmQKeIq0fyrBJELjbk2RT3zbo6DVWXorX512UTK78QLNuXrw0kFMsJCt1
 ETDAW/fl59v6BmSOr4HIBCLIMxcsZujSGqg6RYaecZ29mkQZLhDQfVE31AjC8hagCc2o
 EHU7wgPlv/TBvJDWQZk58WKpH18+JSI2U6wvHaioFGzhU8zJ6sp+rJGx+kEGAg7448lQ
 KjUKFWbpRwrt5sJ6ukQo4bPlJeRjh1tk+CwfBALlrRMkLiAM2NIszLN6ZOdH2luCzUli
 dpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EHgFUnW1wQrVoTK6VJEdmulKhIcN39KNGoL+iGbz+pY=;
 b=BqPs5UPBSyZSiAM6PrtLk97oFEULjDRKMrejJRcRM8mzis2b8oP3YFxdU9kUj8v1hA
 k0jNWsSpEjj0U2NeFLPVUzaucl95reVckAt4BG5VYt8vtt+gSOj66UXYKiONgGktlG1k
 GoCPx93O2CNeBRtHsrDUqb7PLIZdQi+q4LA1vxa2kqC8rqOUHgRStiGXW7oqE/b+i5rt
 eTMKGEs0hV0q11dem1qIpnJZ08HJu8PWl5UHu6nOkGTndeK2JYUP/CM//uYpq1DodDRq
 93kIvS49+L8MOqg5b1/tI4Z9M5sZqHhLEBj7O3W5NA2tfn2+0ptO8G9F09GWDTwIEdSZ
 x9tg==
X-Gm-Message-State: AOAM532P3WhNoBq2ZVOOl9viVOOBJb5VrkHapKdDMLzf73CEqddmD5C+
 XSZ8SpkPdcio/YW9aNg5Js2mUn0hOdhQk+nIjMlDyA==
X-Received: by 2002:a17:906:2747:: with SMTP id
 a7mr22595226ejd.250.1612262093898; 
 Tue, 02 Feb 2021 02:34:53 -0800 (PST)
MIME-Version: 1.0
References: <20210124025306.3949-1-leif@nuviainc.com>
 <20210124025306.3949-2-leif@nuviainc.com>
In-Reply-To: <20210124025306.3949-2-leif@nuviainc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2021 10:34:42 +0000
Message-ID: <CAFEAcA-n1oXYkQA0XTVNp+rfgFRZSviao2FTSBvOibfbX24a9w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] hw/intc: don't bail out gicv3 model init for
 revision 4
To: Leif Lindholm <leif@nuviainc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Cc: Shashi Mallela <shashi.mallela@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jOwSWtHJuUbA

On Sun, 24 Jan 2021 at 02:53, Leif Lindholm <leif@nuviainc.com> wrote:
>
> As a first step towards GICv4 compatibility, add support for gic revision 4
> to GICv3 driver (i.e. don't bail out if revision 4 is encountered).
>
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>
> ---
>  hw/intc/arm_gicv3_common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/arm_gicv3_common.c b/hw/intc/arm_gicv3_common.c
> index 58ef65f589..7365d24873 100644
> --- a/hw/intc/arm_gicv3_common.c
> +++ b/hw/intc/arm_gicv3_common.c
> @@ -315,7 +315,7 @@ static void arm_gicv3_common_realize(DeviceState *dev, Error **errp)
>       * conditions. However, in future it could be used, for example, if we
>       * implement GICv4.
>       */
> -    if (s->revision != 3) {
> +    if (s->revision != 3 && s->revision != 4) {
>          error_setg(errp, "unsupported GIC revision %d", s->revision);
>          return;
>      }

This change is obviously not-for-upstream; we can't allow the GIC
to be configured to a revision that we don't actually implement
correctly.

thanks
-- PMM
