Received: by 2002:a0c:df87:0:0:0:0:0 with SMTP id w7csp541549qvl;
        Thu, 20 Jan 2022 21:16:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmKWmj8VyXFLmstG3HFuUhx8s3Wn1+6+3lmIhvZd7NwWcq7Y+mBLjYLLK2man0oyK5VP1g
X-Received: by 2002:a25:d44a:: with SMTP id m71mr4173820ybf.173.1642742164702;
        Thu, 20 Jan 2022 21:16:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642742164; cv=none;
        d=google.com; s=arc-20160816;
        b=WzJFLm7q07bUl49uvLohYWvYxHptexKUZNcPOvNKb/EWGfT/Wd23sFwNfBHrTBhP27
         gceJLQ2MxdlaBLEX1gHfCp71sFv5uik+QEI67jtfzWHXlOLgkeq7fkLIZfOXx7Vya62h
         Zf8JsjAE99fmll8GHv1wZ7FdxSjhOfbGmvlxIOaZXbjdxopZLSPWEb/cHy1GIEb0/10O
         fiplHj06m6TbPJEfCArFO4T2YuUiml0XebcIeLQjKRg6uuZJt6hLk9ZlGK7QqbUmkI5E
         rh5t0aiNqPEma652n/xp+ZlrrY8N+2SYwYPvF7NyXCJo2gcmXJGwfbf5W6AnMs+TVYH7
         3cwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :references:message-id:in-reply-to:subject:to:date:from
         :dkim-signature;
        bh=waInaIGAbto31AX/imfXOQT7MNMtN8ZiXY+dt3u/lLw=;
        b=oc9dmb+lMNMbTDZttrbOj/zV/Uw4viOA18YhWyKta8Ho0qDH6Fv8F0blMjWQsodbTX
         mjW0+znYhwHNjdXB6K9Zm4zhZ4zn5pX/OLAl0LQkUA/MYTVHapHR2zHLyFP4rydPd9dm
         0Q5dUpjktCrSuTbXULMimjWghjwyAH3g8TPItMDHeMezdUiPpQXdF4tOSng4k16vYoKr
         nGIOejetn8YVu7z2yaq4vz6LfVJsUKuEA8HKkJOwfzmdwiwdGjIxAvoe4oxELQ77hUYY
         6ojzYhz/A0TLOArQZGCp6DdSwZB3P8sDleiOHDA3e0SMKgyj4XFyrPdSjSjsyBqEknhA
         21sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=B3rh92+W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s186si1330623ywf.160.2022.01.20.21.16.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jan 2022 21:16:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@anisinha-ca.20210112.gappssmtp.com header.s=20210112 header.b=B3rh92+W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nAmHM-00031u-4V
	for alex.bennee@linaro.org; Fri, 21 Jan 2022 00:16:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nAmGl-00031A-QN
 for qemu-arm@nongnu.org; Fri, 21 Jan 2022 00:15:28 -0500
Received: from [2607:f8b0:4864:20::433] (port=43832
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1nAmGj-0005xO-UY
 for qemu-arm@nongnu.org; Fri, 21 Jan 2022 00:15:27 -0500
Received: by mail-pf1-x433.google.com with SMTP id u10so3328115pfg.10
 for <qemu-arm@nongnu.org>; Thu, 20 Jan 2022 21:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=from:date:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=waInaIGAbto31AX/imfXOQT7MNMtN8ZiXY+dt3u/lLw=;
 b=B3rh92+Wzeh/RPD8JAKc8++jFkWwFcca3etwnSmtjtvOatyFK89mwOCV4WH6TiH0sD
 nZN0Tqq7c0TikBL/Uwu3dEqa2nlOCKbBzrahokaDwFC9+XBgztOjQulsSWY6PX7pDazj
 g79S4G07lov5mHLzfGlXo9ZKl+eS1TAV9Cq5W+mpakH8fM2h4eALKml1sw8R664c5fpy
 +fGQFovFXYvlsAq5BnQT5i4NRW1U15hQ2+rumDV+TNug32e+TOuwjiZvdSy60iNlvAcj
 FPePfqy7whXbP+vw+UtlnIlfasTEZBGdIC9hxSwu+DleUOJdXyZ2o35dkrxmdjwFnomo
 wzGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:date:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=waInaIGAbto31AX/imfXOQT7MNMtN8ZiXY+dt3u/lLw=;
 b=e3vO9eYoutxYEnYEQ+RgbzA9HBjfnSd4UlioA2JeMme2Tkp9jjqJj90Dyz2Ssvs5BO
 6Ja111GH3r5cnqeTSPwE69J87jdo1SmDY6I+B0/FYUOAIzvCoo21pCmdoLj06F52yXCD
 HhKBk5d8vKqicFU9jAt47Bx6gdoLF48pJkQWy6e7Ll2VVzvJxiJcQr+se3rI4Qr0axqo
 gBbVJs20pxaAT/2/he32PDMP2hTNthvpyuhP/oGwYDxhAY7Nfdp1JIM7jXg8+xTf12fp
 yhRtjhJB/+ITIY5jPbFTQ/oKIID9PLerqd66rW+t+ejASy8NKiT05ek1dPgIRWd8m2vy
 00QA==
X-Gm-Message-State: AOAM531781+unCsbKUhVJIcphMPg0p7XS602ggR2x3VLVw+rwSfygbMt
 hSW/JLJG2/ZFmc6A/QjBbYD4QQ==
X-Received: by 2002:a63:e448:: with SMTP id i8mr1844643pgk.206.1642742124204; 
 Thu, 20 Jan 2022 21:15:24 -0800 (PST)
Received: from anisinha-lenovo ([203.163.243.216])
 by smtp.googlemail.com with ESMTPSA id o2sm3723625pga.57.2022.01.20.21.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 21:15:23 -0800 (PST)
From: Ani Sinha <ani@anisinha.ca>
X-Google-Original-From: Ani Sinha <anisinha@anisinha.ca>
Date: Fri, 21 Jan 2022 10:45:17 +0530 (IST)
X-X-Sender: anisinha@anisinha-lenovo
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/armv7m: Fix broken VMStateDescription
In-Reply-To: <20220120151609.433555-1-peter.maydell@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2201211041540.889046@anisinha-lenovo>
References: <20220120151609.433555-1-peter.maydell@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::433;
 envelope-from=ani@anisinha.ca; helo=mail-pf1-x433.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yoFha1T8NMUW



On Thu, 20 Jan 2022, Peter Maydell wrote:

> In commit d5093d961585f02 we added a VMStateDescription to
> the TYPE_ARMV7M object, to handle migration of its Clocks.
> However a cut-and-paste error meant we used the wrong struct
> name in the VMSTATE_CLOCK() macro arguments. The result was
> that attempting a 'savevm' might result in an assertion
> failure.
>
> Cc: qemu-stable@nongnu.org
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/803
> Fixes: d5093d961585f02
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Ani Sinha <ani@anisinha.ca>

> ---
> It's a shame there's no way to type-check that the struct
> name used in the VMSTATE macros is correct...
> ---
>  hw/arm/armv7m.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 8d08db80be8..ceb76df3cd4 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -520,8 +520,8 @@ static const VMStateDescription vmstate_armv7m = {
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .fields = (VMStateField[]) {
> -        VMSTATE_CLOCK(refclk, SysTickState),
> -        VMSTATE_CLOCK(cpuclk, SysTickState),
> +        VMSTATE_CLOCK(refclk, ARMv7MState),
> +        VMSTATE_CLOCK(cpuclk, ARMv7MState),
>          VMSTATE_END_OF_LIST()
>      }
>  };
> --
> 2.25.1
>
>
>
