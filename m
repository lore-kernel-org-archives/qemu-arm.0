Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp543390lfc;
        Thu, 12 Mar 2020 05:03:05 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsk5Cj1TWoFu9KZL+bd/P2uyagOiyzJ+00Naoxi6mjReBt1W0vDCdUBTTqV549g5e18y1cN
X-Received: by 2002:ac8:1205:: with SMTP id x5mr6831995qti.238.1584014584706;
        Thu, 12 Mar 2020 05:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584014584; cv=none;
        d=google.com; s=arc-20160816;
        b=my9sfdON6F8tExdWBqUbN5hhxWE4BsJZk6uSGSAHaBohix6TUbTyM88OwVlYqLR7bZ
         eDdvZA5xXDacfKa67vKsHaSVja4cFVed0JOi+OvSrQ6iYM2LJQ8EYmCUp9igbUfaJy3w
         lMuqiTSi2UNFl9Wh41qZZHYh2pJaQNkWSupS9l69RT2CHINBQ44f2ovd/XgWFT51zT8V
         5ZDP4a6ZoZ4rwOizvekHCPW6j2mt/tYeG67WKW/1lqzQpc2moloVP6U2Wa4GcoHC5o+I
         S1gIeUyM5LRGfYEik6C0Sb7wI9E1FqpvOwUcljVOPxN8QINJMm8Rp9Vy5OzoQlkI4Bme
         gh6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TyTwDg+EN/hhI8fmdjAbEYPe4BoQlHinZlVtRoD/N+s=;
        b=krV2DKoBWjU2bA91Iw1NcMsfKEr0UGdgix+xggczJKt+NORg+lgZfIQooJeaQmtlYU
         kEGYWX5EwPkFsIxs3Gcsd+CHwPbGrlr2LxLSr2HVFctbUAnthLN0kyg+YCVH8IgCNjBx
         zjy1Gy+7xAFVov/LlMijkS6J9YJhgJrCY7fyLXjO9A3NrnKeZ52GWMX0pnVK1qigbJCY
         lAkaT492KxFyDzQEHAl8+ZJUKMnfHhyfid6Jfb99vZ5BAXCU7HkSiOPRmkE48tKXmQKN
         Q48fDNZeNoAQl0WLOoyAzCxM6nVAPwgASZuSlqrh9wFQSrwGmTxadFSv1yRU2ohJcBYD
         tQvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hXPX105G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d17si2547557qkl.107.2020.03.12.05.03.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Mar 2020 05:03:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hXPX105G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jCMYK-00050Q-4S
	for alex.bennee@linaro.org; Thu, 12 Mar 2020 08:03:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33776)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jCMY9-0004yh-2r
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 08:02:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jCMY8-0006rN-4J
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 08:02:53 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:41912)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jCMY7-0006qZ-Uz
 for qemu-arm@nongnu.org; Thu, 12 Mar 2020 08:02:52 -0400
Received: by mail-oi1-x241.google.com with SMTP id i1so5168187oie.8
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2020 05:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TyTwDg+EN/hhI8fmdjAbEYPe4BoQlHinZlVtRoD/N+s=;
 b=hXPX105GyYd7i3ky+ffrxwgAmMXtKiPkeOpDCDJ+tLhXBeW2EAI6OPl+iEHW9iCVor
 9Zj3jBlCLmZJywBwpx7HZX3tkzgX3vyqkP0jIG2qtHv2keKgrpgcvtCCAl3sCC86jTSS
 n7xS+rX70pi//H05px0sw6KLsVXoolzy7nifDXy82eP2pSiBrcLi5w3K59lMXVQg4G8B
 /92hmAoWVBDVEhgAgBaugqrjKMgBnQH/8BhHlK04iGNQkmhHki4R6kZ7S0aLGM42mJpp
 2E2PMZ4EeRp1fpSWkaCvLmrfDesGtHcv87WSlyymWaFK/bSNxmagFNGVFpJ3YmeTNSY2
 qHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TyTwDg+EN/hhI8fmdjAbEYPe4BoQlHinZlVtRoD/N+s=;
 b=IUGsDjOmcOElZoeckuks0EYNXDzwNmErHAOU9PIQkGuriQ7FCYW1cGV1qzYs03Lp/p
 L4V4nvpdv0fqvLzkaFp4vh4NQtx03Sh5OuwUswacDW4zh4ObjGJFUi3rQ8/DehClBM/Q
 ymTQXD7t9FOInwctJo7p4vvY1rjVf1u9Ts8uNT5hhBvlcT7Zrneoc/f5JSAvL0IWgpCf
 AwcVzawsqtSPoQINzg07rBqvfQLbtUdYJjhRuUgJhibVNWXGqZhivtHOmMpzMf9RSGc7
 X7x34BLt0SYnqFsfOKdaY5qUktwOpBO8pZ50352+PX/42zQWCz5bpag70HeuGD9OiM7j
 0V2A==
X-Gm-Message-State: ANhLgQ27OY52yGfqL4Tm0svqFYCIeKPWghafB1S8AD/GCtiN2xyvmoCk
 89/VyTtPzTBlvEoIyvR1jKgBIcKK3/h7Gk3Sw0cT1A==
X-Received: by 2002:aca:c608:: with SMTP id w8mr2365613oif.163.1584014571125; 
 Thu, 12 Mar 2020 05:02:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200308012946.16303-1-richard.henderson@linaro.org>
In-Reply-To: <20200308012946.16303-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Mar 2020 12:02:40 +0000
Message-ID: <CAFEAcA9KdR8ZcjngFfSf7Y_zG8+VL+6pXDOJpWxP+VM7dj-XUg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] target/arm: Misc cleanups surrounding TBI
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
X-TUID: 1KlnF+nauvX8

On Sun, 8 Mar 2020 at 01:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Changes for v3:
>   * All but 2 patches are now merged.
>   * Use regime_el to determine aa64-ness of physical memory addressing.
>



Applied to target-arm.next, thanks.

-- PMM
