Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1874585lfm;
        Thu, 16 Apr 2020 07:23:44 -0700 (PDT)
X-Google-Smtp-Source: APiQypI6v3JWZH5GGw/ZnxkNFQJjKwdXQR+Rzv9D/0V0w3SoLiR7VUoVRwyuVhfGp8zJS5zNi9P6
X-Received: by 2002:ae9:e214:: with SMTP id c20mr20234156qkc.107.1587047024026;
        Thu, 16 Apr 2020 07:23:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587047024; cv=none;
        d=google.com; s=arc-20160816;
        b=Wq2DnH5WH9fUdH9EUBziBA0oJOHli21vDgJ9za2HzYrgU8pIuRCPhZdFMEJgb5YExm
         lnvXjTLLxyColxJTWBFF/PqR4VviVM5i6N/hXWpcLNrfqv5RLZIWlLDh4C3H3eeBBHWd
         XZLX3FHSKIiQzuPNWHDwweV9TjD9Z17Duia5AmeDyOiww3Gto5u4tNH681qqsdV/84Y7
         6QT06yE1SEEpXOKjEv1cGpDcw2gxRpC7eiLW2vLy5Nio7buhkkGLi1b2z9Yx+i2n3/LZ
         4XUVnII31xFbHOT+A1hTLjTLNwrJfXVIztsa36A5AiyGhllE6RF7iPYcNUfLwr13RR3q
         8n4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/jAf2FbxydNNbQDtHpCp6CvdVyhHMkK3D7xMPYfuX1Y=;
        b=KCrtV28mEvi2VDWV7SrhJKnMHCqSf8TAgGyokeo+GbNmU4j2BFacJ+njQRlGae6LzK
         wpf/YwfPbza5VaIg8iAcHSxyv6swJmgvXd7hDLvd0atm1nqPmm537IyFHj63nnGJuR/+
         fEPOPlIfNupf7EyH5MxpPQvXRK4P7qnJnbGCE5t6JC3SUUx48xRZDvmcvru9+SIodjMV
         hWtzQsiLJz3lx3YunvU/vjdfCdE6iEOvotuLuPBEb6eMK6G8sMs7J53ho8MiybNKpgSQ
         SczkP1bmUsyeZBXKZvjYUZB0ubAqEY6eGZ6+KDnEOB8sjkKsQ7cFVlzCTy2EapQtI1gV
         I6Zw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EVLFfVvH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19si11146963qtp.312.2020.04.16.07.23.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 07:23:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EVLFfVvH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP5Qd-00070L-Fe
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 10:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40635)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5QW-000700-F9
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:23:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jP5QV-0008Fq-KU
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:23:36 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40515)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jP5QV-0008FV-CO
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 10:23:35 -0400
Received: by mail-oi1-x242.google.com with SMTP id t199so13302778oif.7
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 07:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/jAf2FbxydNNbQDtHpCp6CvdVyhHMkK3D7xMPYfuX1Y=;
 b=EVLFfVvHGe63c9ijfvkZJjppOrZqwddwk9l/799utYbGTI6D3dcRDydmFRsCBARUO1
 XlbEYdTJpr0Ayb6KPXz9gmQcTJ91L6NY0EH3YRJr5OYeSrWzNJHMXf3xOfMqxyGVFecR
 hG8oQxpNI43zUt//Ky6MBOMEuJQwpgq2C6xrgtZTJ06El2psq3R7LfmF7aNOyJrGGaTi
 RZHnEe6vYzUjp87ubscjaP24Ex1826ENH3G60DXhPlwVw3kvNkwL55uaCZOnktiJj1ql
 tgV4U4VLcWjvS157MItIr8sVPu+DplA8EkG4ee+Q81hhIbxD9BfOcs5TWarAHxaSDN6s
 /5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/jAf2FbxydNNbQDtHpCp6CvdVyhHMkK3D7xMPYfuX1Y=;
 b=hqiGh1ySl+qXKfvm1i5JMbPfgOw43qo1n2rlGWJG2UZIhkKGJ6ZTWXwQd+iv9K2Qb8
 7jt1hBULQdYFzclUEpKQlM7NFVsWhKfmYgvMHJVP/kEIX6Ac5N/07L9Uh/Ij2CW9fApH
 oWcGonpKgVJtFOJHB5cnFrp8TDKPKiSdJFLq2cXkH03qylvmDHD/zehLWgPq8XlZVmlN
 v29wmJJQgSH80Gvc127i8q1m8elpiLjZIUvNquaGQ8kVtjqU80+IQ8h+3WYjMosXufL5
 lR0VkGNrCaet7MhDd93ITovTMWdCqrlCWXUH+wa+a1PknutFkt4U6RU0W8mCRTifc/hd
 +Ydg==
X-Gm-Message-State: AGi0PuZdEI1d+cehb6WukAFrtKL6Vo3Yj2b5F18fYJ7a5ZRVzcUAuB39
 Wjwlkr1A0ShXlEd8N1TRPpU0U+Ng6e/roQTNtCEC4WA19NA=
X-Received: by 2002:aca:170e:: with SMTP id j14mr3040616oii.163.1587047014474; 
 Thu, 16 Apr 2020 07:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200311064420.30606-1-richard.henderson@linaro.org>
 <20200311064420.30606-14-richard.henderson@linaro.org>
In-Reply-To: <20200311064420.30606-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Apr 2020 15:23:23 +0100
Message-ID: <CAFEAcA9_F3yTHC+Rt6A8NPYjEDESRY6cEAqjYEA1LVV-MDE-JA@mail.gmail.com>
Subject: Re: [PATCH 13/16] target/arm: Reuse sve_probe_page for gather
 first-fault loads
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
X-TUID: tFyi/wTrC3Iw

On Wed, 11 Mar 2020 at 06:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This avoids the need for a separate set of helpers to implement
> no-fault semantics, and will enable MTE in the future.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
