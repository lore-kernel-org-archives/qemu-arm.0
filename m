Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8683500lff;
        Thu, 16 Jan 2020 09:44:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqwchrI75Zn+WC8jp/z+WnCpxOykp4XmdpgNdhKbb7HVJDbFzZouBTPE+pj9e0ZID6736RUE
X-Received: by 2002:a05:6402:1e1:: with SMTP id i1mr33480654edy.338.1579196640035;
        Thu, 16 Jan 2020 09:44:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579196640; cv=none;
        d=google.com; s=arc-20160816;
        b=bX0KLg6bnx8EYdAs00zOYLq4X4ZLXwgORHFuTcnFIhn0Edutx808eoksS/9BrFD8RL
         vH0XMA4iDodIZYwm5dj9BwLWyIz8G9lnMqLtwVzOqbo0OmafD1rQpe4/0mpBPvqWWqqe
         +JmWEDgqVWD41XkEa5AmSulLxEnVxBHECWlWijH05qreW6XIDKCqFTBfJ6K9TCjnvaTX
         CY0IsZcijHB70E+htbXXlNN3a5yAvkzzDAqD1vOy2Ax3oTF0oHQItHU0X6BPgnY4aHDj
         qam00wGfP8RcLbmIJWYyiX3TGfB3uZPOKXdCmSPz4JmkRijtF+Jafi9m4ogGcmEiSjOJ
         U6aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=2qsPxMUJ4K94ldEbJIVkf7JQnMntDmQYKtoJKrcyxwQ=;
        b=RE5Janl4dl8TUNU8OoxNT1QNPfpgymfv4QpkVsESwZZKzzd7xdU5+CIPcxJlCStfsf
         AnwT8ey6/3vA7f9K7C7oB4WJubzJhfx+PumkdY2fATx2b9zc2LXsC2jJY6is6RPx3K+A
         zbvQGrjrmnfyxecKGEfwQWbQATRaNFE95W7v2BWihCuwbM8JeovXuL2sNRzGhyI9t3Sj
         ADbcmezm9Nh4PkqYJpyIo5Owj+JR2AlJfyQXcqrMQTObXu+xCjujra1B1c7EBij1QWSt
         WyFsPD3jhMEwa1PmslOSx38GlmrG4C4MSegiPgPR5nPAxCqb2NKtkomUtbFSM9FMHRAq
         1ltg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mTgQPW2p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c1si949563ejs.169.2020.01.16.09.43.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 09:44:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mTgQPW2p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1is9BW-0004Xg-Ew
	for alex.bennee@linaro.org; Thu, 16 Jan 2020 12:43:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59570)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leif.lindholm@linaro.org>) id 1is9BH-0004Si-Sk
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 12:43:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <leif.lindholm@linaro.org>) id 1is9BG-0006F9-M2
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 12:43:43 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:35078)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <leif.lindholm@linaro.org>)
 id 1is9BG-0006CD-AY
 for qemu-arm@nongnu.org; Thu, 16 Jan 2020 12:43:42 -0500
Received: by mail-wm1-x344.google.com with SMTP id p17so4751009wmb.0
 for <qemu-arm@nongnu.org>; Thu, 16 Jan 2020 09:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2qsPxMUJ4K94ldEbJIVkf7JQnMntDmQYKtoJKrcyxwQ=;
 b=mTgQPW2pw5RD2cPGWqVXXtTFi9OFIZMPglHLnd9Gk9ZZ611IXLlombiCb2uOyr0ik8
 FFFWPCCQCSTPqoAJXluAuE6KCo1K7TisyyUH+yl/64AE1aG+dD/bbQBxrsCVKvb/WUrA
 URi26Z/tFBqxVLGuWqV9WOCJaXCzTE9xIbIek6OLajiT4uIcnVJ2uqB3o8T3IDbWX35V
 JXrJP+aNO+2uDyvnJJBvXSD7PkHFNObI2U2FGsUERkWRAvatOkFzQ7XKsD+2sdwOcNj0
 Syjz+c9F66XFqo7vgyCa0a/BoEQvyP1E3LZsw3E993Tk/I2WIwB2+YoE4Li/NNeYwnoh
 1VNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2qsPxMUJ4K94ldEbJIVkf7JQnMntDmQYKtoJKrcyxwQ=;
 b=Clc6zfepWM5+6lMWYFwJlJ99fHLiiwvq8B7bjqd17KvCHfIm1fwtTJibffjuSnk4Ox
 odpT7yEjFuCCvHZDTfzTucEb/7+Lm8j7EzcuwkPgAfn/uAki9aLS9D+4odmmGmuLGvcj
 40F0F029XPRC+MbAX8qFUrQlMBDxPULq9M4vr6/dUGLZqddsruIDBzrf02exV02uCBpq
 RvXNX/9bJ8ebDfwCVp6n8CchyODDg5jq+FtmLX5GO5kVAlYYCduVYirk4+X0Tx96r2kS
 sP4kPpLkTZzoTQtvIT6mM6MaEtNfZwWcUqANKZsL156QH+zpEAfwF5+NB8JWN/Yhcga/
 o/LQ==
X-Gm-Message-State: APjAAAXb7D0aMpF6SUo/kHsOYKb+dUw3dPKtYB5WEdYYibZ23qwFcOAF
 ifvAG3kLjmV55QUxX6zMQ+i00Q==
X-Received: by 2002:a1c:3803:: with SMTP id f3mr203204wma.134.1579196619045;
 Thu, 16 Jan 2020 09:43:39 -0800 (PST)
Received: from bivouac.eciton.net (bivouac.eciton.net.
 [2a00:1098:0:86:1000:23:0:2])
 by smtp.gmail.com with ESMTPSA id v14sm29993062wrm.28.2020.01.16.09.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 09:43:38 -0800 (PST)
Date: Thu, 16 Jan 2020 17:43:36 +0000
From: Leif Lindholm <leif.lindholm@linaro.org>
To: Leif Lindholm <leif@nuviainc.com>
Subject: Re: [PATCH] MAINTAINERS: update Leif Lindholm's address
Message-ID: <20200116174336.GD20629@bivouac.eciton.net>
References: <20200116174226.4780-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200116174226.4780-1-leif@nuviainc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +hDV69XCHhx8

On Thu, Jan 16, 2020 at 17:42:26 +0000, Leif Lindholm wrote:
> Update address to reflect new employer.
> 
> Signed-off-by: Leif Lindholm <leif@nuviainc.com>

Reviewed-by: Leif Lindholm <leif.lindholm@linaro.org>

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 483edfbc0b..3c8653f26f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -735,7 +735,7 @@ F: include/hw/ssi/imx_spi.h
>  SBSA-REF
>  M: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
>  M: Peter Maydell <peter.maydell@linaro.org>
> -R: Leif Lindholm <leif.lindholm@linaro.org>
> +R: Leif Lindholm <leif@nuviainc.com>
>  L: qemu-arm@nongnu.org
>  S: Maintained
>  F: hw/arm/sbsa-ref.c
> -- 
> 2.20.1
> 
