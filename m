Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1409899lfe;
        Tue, 17 Mar 2020 04:19:46 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vteEwfSx3M7YtnaaZcidRWR4h1jE/fodgh5/eY3RffJmdbWtPWPDZMpmaU3qvDsAAbq0m6X
X-Received: by 2002:ad4:5222:: with SMTP id r2mr4429625qvq.178.1584443986858;
        Tue, 17 Mar 2020 04:19:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584443986; cv=none;
        d=google.com; s=arc-20160816;
        b=q8EAaZOGThIhvlsQtgzpmCnrDsMPVvX86OqA0cVXUV0AVF7aLBOJ9Q5uElv5OOROTK
         sbvYGvTEOGd0udfWcmesdww/Qtdiu9jJh5hlun8EW0TOvVLpiDXBo2CwyHfdh+uIuopq
         UvKwSNWGOFs/vYUS9FRth6HuPymjV2Pm4rLA4LYdzCkDSTGsUK4ykzvL3w8Iya+BdvhH
         EJo2l7itLt1Lok1zV6RFBVlHKXkMN7pjPar23aks8ivykfG2CkJZGutnRc9csOM2xjon
         ZlXIYDxNr9zwyWeI2BUaCB07t0oz+5WPZA/ykJz1kIDZa1tu0o+CHnuqEqlzhwp4erNd
         aGxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+PoEOXEBpQkNeh3emDDls5uAWutZ7pcSClgHt7CSvr4=;
        b=vIZ4iWln40TzBZnDjPrMvMryS0DM28U7d+xZDzNFbBaaUaiPPgellBYOLZJtHKOl2i
         Xm55aIewlUlUjZAI8mYDvglZK/lDxV6D02ZmDslZ/OoEvO3uqeOoEdAgvjSdWxmsWe5o
         IaG7CIfZ21dwMKqZnU1+GXZLUzJNqCQAhux1eCyTKvLOcR6Vufcgc1+RH/TuZQSYIctD
         iIwBUgyU1F0kIsGL+NyEw+GavfSxoKUfQ1dZon/3t5x/Qam2Jc3N07xMvxbdBM4GBcRb
         u7fcibJ8Nc6yPW0m7FojhssGqoyGKNRtHnmhzwEE2zOGMoRRhk2jsCmofrlwnXRhc+iC
         sF0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a0W2Bnoq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l12si1639959qvs.3.2020.03.17.04.19.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Mar 2020 04:19:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=a0W2Bnoq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jEAGA-0003Ol-9L
	for alex.bennee@linaro.org; Tue, 17 Mar 2020 07:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49454)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jEAG0-0003Nx-8u
 for qemu-arm@nongnu.org; Tue, 17 Mar 2020 07:19:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jEAFz-0003z2-9K
 for qemu-arm@nongnu.org; Tue, 17 Mar 2020 07:19:36 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35744)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jEAFz-0003jv-0e
 for qemu-arm@nongnu.org; Tue, 17 Mar 2020 07:19:35 -0400
Received: by mail-ot1-x341.google.com with SMTP id k26so21260981otr.2
 for <qemu-arm@nongnu.org>; Tue, 17 Mar 2020 04:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+PoEOXEBpQkNeh3emDDls5uAWutZ7pcSClgHt7CSvr4=;
 b=a0W2BnoqzActavmd1mYsJRHLs3qOvzetk1FbCz7c9Pxqu9prH5T7u5GhaWZDKdqXcb
 J5kSaAfcmco/mD9UvUgho2IkwQdjPaung5Ti7yahSk8Xe8GVwJVM1qBl7R6GQxwSp+OM
 j8wVzMApyiMA0gr88eO57lEjQPhOojM7o1nZpkxZJoEN6Z1/sjl+8+U3gExLOtyVdsm1
 GkZe7oFVqPF1bEmz8GZBRYxykvlntYquUfT1oe90wC0ovwtnh7SgICXrUShm0zhTJDuM
 B3ZkSo6l+qtb3Y9Aj0Tt9xt4LW5NPrUqVBKcJnSlhYZuzxfzpwzzioAPdAf6Y1L1SO1w
 MfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+PoEOXEBpQkNeh3emDDls5uAWutZ7pcSClgHt7CSvr4=;
 b=qJChNshi8/mTR8qsriWCiKFfboRUKO7/oGcx2kZrHfqU9jsdyjRhxD6vqYWkX5E7dl
 pzHOzFzzKH3eQkuwueoI+xg5/oQLDoGqPEpXNU9iMPGneDbveh7KJ6k2vwxvpadb/H9E
 60wqLc3nj3XgQEWUTsLCNb26/CoeWdA9M+VeSMFBDV8d58raGbTa72/p7issQ0hcN7mo
 pKmsWKU6fGx82k5APefpDWNeKCXentJv5XS55zfC5qlsT/tDTI0mWz6xE3iX3l22UGdl
 NNJ7ISWEJ30kuCuHphOw4j2H6x9vSZj/sOf0mkqmd4UJoZO7XXbpbpnSotLyHISle8Xz
 Npug==
X-Gm-Message-State: ANhLgQ1msXWnhloecv+Vbjvbe0FhXj5ox4Y6DS78bh2Dnv/XQvBHfyNo
 eA+d+3rBbc3JV50d8iU79D9l04SmmGHq7xtx+riLqA==
X-Received: by 2002:a9d:19ca:: with SMTP id k68mr3261522otk.232.1584443972621; 
 Tue, 17 Mar 2020 04:19:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200313160215.28155-1-linux@roeck-us.net>
In-Reply-To: <20200313160215.28155-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Mar 2020 11:19:21 +0000
Message-ID: <CAFEAcA-Ep07yOjzUvb0AXnStEkomoki+rmhKRg0as3Dcf+J88g@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/pxa2xx: Do not wire up OHCI for PXA255
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Andrzej Zaborowski <balrogg@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l5RdV7WaZBGw

On Fri, 13 Mar 2020 at 16:02, Guenter Roeck <linux@roeck-us.net> wrote:
>
> PXA255 does not support a USB OHCI controller, so don't wire it up.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  hw/arm/pxa2xx.c | 3 ---
>  1 file changed, 3 deletions(-)
>



Applied to target-arm.next, thanks.

-- PMM
