Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp2975722lfi;
        Thu, 5 Mar 2020 06:24:50 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsTzZ/pbD9LqPqQgTZhBFqNvS0YcO3iaq15xtE+si9gOAXj4pwh1/3B3JK4l5ysJLRO1OVn
X-Received: by 2002:a05:620a:621:: with SMTP id 1mr8241065qkv.115.1583418290402;
        Thu, 05 Mar 2020 06:24:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583418290; cv=none;
        d=google.com; s=arc-20160816;
        b=ep3MswGdrwbFKxXRnMBFRtKdbh1NLBkm3n8T/0uG8/HlB+hrU6/D33L5GpuVnciGIP
         qwFjaW2gpDN/tLPG6L1uaKcT02sVUFRXHR3T+D6T4yLI89mDY/CwOrXwRwCOAB6bzTZh
         AY+F6JnsTMg/rmEWP9GbiWTKqr4UlEMqGKKJPuMHQAuFoMsfBGiRbmrvVFRHZ4zqqSUG
         OODFGQoMb+xSX3Cjj8m/YhxoqpyqPY04ardrXt8ZGBdywwS0+qrdzx0zEjTf5xpaioRX
         S1Yy12axYfKyHFnx+y6GUOxhFTGXCO3DschKL1pXu2EUReBHyRFaj1n8J/uNyDl5K5Yf
         7LlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tNV/JKsgRC4ZNNe/XdPiKH5Cx2UyJVFV6zJT/fjG9FA=;
        b=hDE3FbNJrohsjt0YZ2pqvMKCXQnvyKlDIOqYfrb2rZMUh6/AXzhBTpsPbQ3JG6CnMm
         perkMaKqOqz76bLLDfIHUGvfr9qHjOAUN0UTe8X5J5qpNpmAP4y6orDgP/xLPYQ647Xb
         1y9bf5DA5LctHED5zinXVPB02PGRY7V1377mb33BIMivoi9pGz4a8aPg5s77Sy232GyX
         ON7k73UcL1ST1MfQ48hoKi59MS5rV7r2/Ti9QMTC8Gd2k6Zs7nIAkdVLGB3k1rK/uDwa
         ymIpIr8PuRVCWNTwGcSVQPRo9O98iXy8dsFtkB+9a65GDFR3LHPA1QDTfABHFyDFk3ED
         W/CA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u753pTUW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i2si3080254qke.244.2020.03.05.06.24.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 06:24:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=u753pTUW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9rQf-0004IW-MF
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 09:24:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33997)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9rQV-0004D9-Hw
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 09:24:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9rQU-00052z-MU
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 09:24:39 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:37317)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9rQU-000529-HZ
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 09:24:38 -0500
Received: by mail-oi1-x241.google.com with SMTP id q65so6110058oif.4
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2020 06:24:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tNV/JKsgRC4ZNNe/XdPiKH5Cx2UyJVFV6zJT/fjG9FA=;
 b=u753pTUWYh+7oUO2PPdo0m/nmRojHTZ1WIJLVU/w6fShuoC3hFnIVEssXV6FZ50a1g
 zQU3eUQJXCwZCR1SpnI4iGFXqmnBnzmg0xTGvWe1HpFw0UIKyH9cC5+dUhip2Zh9nf46
 Cfv6MZTMVGBOB86RXNTBJjulPzcuPmlfaCQGOpASWhcLkxnqk1PLIkIGSRTa0XuJ0/g5
 v0rbEdRD9immVhB8SsaNrnuf/qb+KJkqplCFR4CFOGilkJ8Nv9en3Fobu5KQgtRpc06k
 G0+duHjvsMPEe6961kSxNdjZQH+J5YIswP3f3fsZtIzB8hKhO/XQg7Aqaz1G4h+BYF1p
 FcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tNV/JKsgRC4ZNNe/XdPiKH5Cx2UyJVFV6zJT/fjG9FA=;
 b=Iw1CisE+/QZQqihb8WnVIfcWuy7lCLELV639js0MS7lyuDAN6AvRFfFj8erF5G7mWa
 oYOc8iwKw/R0gWyYo0fYaxSzDfDhT4DsqA4evmzs9yZXUyx4e0oCy/MYQlv9m3EMDZc4
 8rieiYipE/pEp2BrzqSdV1Wpk9i/oslRKsD00nAhIz6M3kPEs7tQP3uferDz+ZRmoMtf
 vYnsdc7Usq8BDHKtCyumausHS8LK9ZM2IUtSUngOUV+FfmLi0pgSPNokOEHHjNSIuTPs
 GHthbNdrJibArR9X7btdQjiBh+DBXX8qrOoLXqNj2JIU8lSw3wAMZa6/w9uXbTMGzPP2
 MynQ==
X-Gm-Message-State: ANhLgQ3E1w8F/xi3ZktoVRSFYLtK/YVTcyP+H17hx3Vex0IJpgdf8eQ2
 L5mz2OzYSrbnycEsl5YeU2sKH8PZ3vrpWigYwhjskg==
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr5606096oic.48.1583418277704; 
 Thu, 05 Mar 2020 06:24:37 -0800 (PST)
MIME-Version: 1.0
References: <20200302175829.2183-1-richard.henderson@linaro.org>
 <20200302175829.2183-5-richard.henderson@linaro.org>
In-Reply-To: <20200302175829.2183-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Mar 2020 14:24:26 +0000
Message-ID: <CAFEAcA9A1i9QtuM-eB6ZSjLio1CDdtUnBvb5qv8T6=eGi-Fi+A@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] target/arm: Apply TBI to ESR_ELx in
 helper_exception_return
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
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
X-TUID: qBZc/ou3Nshq

On Mon, 2 Mar 2020 at 17:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> We missed this case within AArch64.ExceptionReturn.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-a64.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
