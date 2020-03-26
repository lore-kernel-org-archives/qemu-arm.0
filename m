Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2382615lfi;
        Thu, 26 Mar 2020 14:00:30 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu9F9x7zp9CXmIowHOzd9sRtV69Wqbidtq+GmEgAS6QyU11pM2xhUUk1ubaVVtPalJ9gIaj
X-Received: by 2002:ac8:18a7:: with SMTP id s36mr6392902qtj.389.1585256430556;
        Thu, 26 Mar 2020 14:00:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585256430; cv=none;
        d=google.com; s=arc-20160816;
        b=a//ZjciyLArg+Y2yt15fUsvR99/KLH0LjhrpZAnZYlCP7URQ7owYcwrgLHN6Antx9y
         Asg4Yf4m8f8AykRQL9zgdCS/P1E/FaU1A/wZXVwmn56xThdBhQcGoPdyzl7pO7hvcXX4
         bmvLjC+LDOnQMSS0Y/5QM0CiWv3HTk0LBsgwmXScH4uSFwJfOjElykQWP5nYkE/dgVtb
         iNulkAggDV3fZi369DJ0eT+VOuRWoKPqh6vE5BQZ7pr8QLyM9uOvPTuaNrYdDfcwUlMG
         DYNE8ahQGue+qSeY44ciR+a45DmhMUpKJOdEB4NNxyTiJkhGftZp8tEkWQOYE7zdLsp3
         594g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+PYrOq7TUYA818Inl+HyxYA4YQ2VIlEfwc1rhNW2TP0=;
        b=wEQ29Mw96exDyyqxYf8Ztj2BMsm23KV7JNDB6LobUNsi2UGtFk1om3plsvO/9rp5vV
         JCOI7EiJ9HJ6QBdo9Fc39jN9pjgcoEo3laiM+grMdchubMpCDh3zwyD9lrRY11AqXzvf
         9y8f6C8QgknVlwKLmqfYdpR/fC8BISqNYweooqmZXUzvTXfNyaDm3RN2CzLX1bZEHIi+
         dUvbjw7r/CHTOcqDG5C8RubQDdEz5cUbTvneLZLF+koCzV/fO+yqJ6u72ay+pAjKqXTB
         PP0kvysQdq50BEMGNiIl8kp52D4PPeQteMCgX6PU9wmGEoD2mvn5+0CUBG3teZN2k9tt
         RSdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=smIwbKab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cx12si2092592qvb.37.2020.03.26.14.00.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Mar 2020 14:00:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=smIwbKab;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jHZc5-0000vE-U9
	for alex.bennee@linaro.org; Thu, 26 Mar 2020 17:00:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40813)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jHZbg-0000uq-O4
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:00:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jHZbf-000500-Hc
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:00:04 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:39584)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jHZbf-0004y9-CS
 for qemu-arm@nongnu.org; Thu, 26 Mar 2020 17:00:03 -0400
Received: by mail-ot1-x343.google.com with SMTP id x11so7501190otp.6
 for <qemu-arm@nongnu.org>; Thu, 26 Mar 2020 14:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+PYrOq7TUYA818Inl+HyxYA4YQ2VIlEfwc1rhNW2TP0=;
 b=smIwbKabexgcfT+BxFbZXnDPrdZKeZORoCH8xKIVfPkeOZM5mDjyzczMUbW7kxOG5t
 rtIyvGlkWqU1k5lxHgzAJuz8FPqjzJXbARVvzUC2m5kN0z1tHeNnvitY/pUrimy5+sVw
 AoAwogHFa1HupJx8ocdXBZy8Y35ki1Ofnhjhb0nZDS+h/+kss3R9puNIJvfIvNe42idV
 /srEpjqQ+DXpIe6n3ArD+1i6WZH73xA6wS0LI5lfZI179A9oxe4aVBLTtJSJgT8sqDhp
 CnBfeHPH4IQ9cazczqQZzDAQLBVAjsHTlwVgs1kwspyq562RAOtiTy359aJ0ss/llPdn
 Pmog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+PYrOq7TUYA818Inl+HyxYA4YQ2VIlEfwc1rhNW2TP0=;
 b=nAPuOhA7dpLaAsAc93xe1QnerqnKs9tFbGGuaoOcGag1hwtzHuPrPMsVbeN+DSKxP2
 r2GBSHqWD84ji5Hkx+JVC7o62oWL7LzhU8PNBh/d1KzTtwQFZWoi+bf4iHGG0n44/ucD
 wiIDN/Kd/N25BTaZCBoVZuroYQ3LAgEjJg3nBV3IU2ipyX7A3Y/SutWxfNHYQZQN+k0C
 ws7FygNNRQrPtGAfth6rzzMctQSWeYWY4OpeRJDtKNspFI6mCKZJBA3M07VL3SJsrPTf
 Z6HIdKetpBZgb+2FTX+V+h7U8eNE65IcwjACT3ZELH0b3q7ldbRaMMR3cMA3mfk4PNuq
 6x+w==
X-Gm-Message-State: ANhLgQ0rt2/7BIOnpebaveLF8nZlQxlSoPOCi9VcigN6WPCKuNlWqQmn
 KUXMwNUf07CncwqWEZxDYlYALZBHmmVFPC9PtledFQ==
X-Received: by 2002:a05:6830:18f4:: with SMTP id
 d20mr5271984otf.91.1585256401760; 
 Thu, 26 Mar 2020 14:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200322205439.15231-1-nieklinnenbank@gmail.com>
In-Reply-To: <20200322205439.15231-1-nieklinnenbank@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Mar 2020 20:59:49 +0000
Message-ID: <CAFEAcA9gPLjy4bee0SggsmMiYHFgw5Uhd6kLLgxXvGrZaQjspw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/arm/orangepi: check for potential NULL pointer
 when calling blk_is_available
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GP2tGwc9X4CZ

On Sun, 22 Mar 2020 at 20:54, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> The Orange Pi PC initialization function needs to verify that the SD card
> block backend is usable before calling the Boot ROM setup routine. When
> calling blk_is_available() the input parameter should not be NULL.
> This commit ensures that blk_is_available is only called with non-NULL input.
>
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> ---
>  hw/arm/orangepi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)



Applied to target-arm.next, thanks.

-- PMM
