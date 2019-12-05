Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2420877lff;
        Thu, 5 Dec 2019 10:09:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqwBfX6HQ67Sjp0lFsvHQL4ZNqEPBKUIgHRTVKtj2aPfeXmMTEX9NUCUBwWQGB3FcnCqT3Tt
X-Received: by 2002:a37:62d2:: with SMTP id w201mr9186882qkb.445.1575569363228;
        Thu, 05 Dec 2019 10:09:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575569363; cv=none;
        d=google.com; s=arc-20160816;
        b=MBGWdFNT1x7UODwLz1E3TxuhqVN8FL0mDW0XJcFK+7fYxfFg69/FSyfVNN+OK81CRJ
         oZ61/O3TQ9a+8+vpdwxXoSoeRHAYRIKgePgBTkgCoWeTGsOURrZCkYotrEAQQeP5QXtG
         Z0KReE+46y+kzXAXiSI0vEjC34PUGWcAsX12HvWmkX7IIKHoojNpc6uYmuA45VYyIWwt
         LO42IRMhbRlEssezHBCyElNmUT+HI6rllejHLwueBPch5pOXKyh2UOLyKoKI5LKdgtxF
         9GEL5twv9whh6uyaVIyU34vZnP736Bs9ilQ53VE33bD/48PZD/QPEfxdbJemyzdXVg6c
         IEhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pYOvYVtwhI2S/mDqdqrvk92S8L5OgxKP7rFHJhTjPR0=;
        b=kqN7uFnhPPjcyFJVwFI7ii309lGQtK960ZVwqWQ/l/emm40tiwzFQVKTMKU2tIIuwu
         R/pivu803hIKIeMJexonvNzH6fwc8EqqSzSetZ2ZFyjwkUk/7OqYC/PEjqWk0tc/pNUY
         TO0/VI92rsJqOvoyqRFL67DeSxaq99ZNpvLaopFiSYHyOjFJ7y7hDlyWuuXiqrqf5kt2
         vs7H9BnlTrUT7IrhbHkqZ30XYt4aJZIv25C/3dcW6rxmtPOiSRhTEA78UXt1f8ac7bT6
         xu/+/a8+va/uYBKHo+3dkT/E28ODUKqH/hkUaaxAWhEvbZHUCzt6H85pFzMAtbVlTZsd
         eVCA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="t6pWO/TV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16si964761qto.204.2019.12.05.10.09.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2019 10:09:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="t6pWO/TV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1icvZ4-0006dK-Js
	for alex.bennee@linaro.org; Thu, 05 Dec 2019 13:09:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1icvL5-0008L6-US
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 12:54:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1icvL4-0003ga-SU
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 12:54:55 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38396)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1icvL4-0003gQ-M3
 for qemu-arm@nongnu.org; Thu, 05 Dec 2019 12:54:54 -0500
Received: by mail-ot1-x343.google.com with SMTP id h20so3379954otn.5
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2019 09:54:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pYOvYVtwhI2S/mDqdqrvk92S8L5OgxKP7rFHJhTjPR0=;
 b=t6pWO/TVK+5BkLfuWbEirKmZHs5GZ3vCHTiHCrxcSLP6tMsm/En+EqeIPXycN6wQfx
 j2QNH6wC++IIohwIid+BgS/i2O7wY3q19DrroInE5+fcQAU2x+CNv2Wag5qfv0ucwL7H
 n8rcQ5KM4yGrYnzbJdUU1jhwVy3i6W4VXCxYwP1AYQwtb7Fv/kKv5PJMSdM919CdgQ5/
 aAhCAm5F9/0VjGo//NjJAMj0BsrkVYC4dUfctkmhPiy4xodOE0znuHVYMilVc81AXfk+
 3HEYlvm6A59MrQLd7Zzv87BSgQy0I4FnYtWtebglYenojTluzNrwAHCaA6lhGQm0t0D/
 hhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pYOvYVtwhI2S/mDqdqrvk92S8L5OgxKP7rFHJhTjPR0=;
 b=djPDd2JBm3JXjzhD+A11Yk0cakbc/0oU+B2oBi0fpK2ZbEHmNQYhbRwrEWBnTgYqjR
 ewI9lJeiwxrBZ5Sm+Hf/FagLvBKH1C42AlTRN3A067xO51PLEJfF2naetJIB025YAePS
 rpKMeMWzNvOlwFWR1wzO/ysllBmclftBQ2yqZWD08lytES4jEp6B5M5ziK8R8IkFksCI
 sikmbJedxw/iGXBq+sRXZDKW2q6uAHe3P8lLiArMqiRyZQRQcjrI13C2jf+lnVMSS2Z9
 TUl5h4uFUFGsnBLTgjlx2udY6KjRFzaRf2e+6+1XrPAsJPAgQQimUcmdigQ/81FgzMiJ
 hIwQ==
X-Gm-Message-State: APjAAAU4XApxmQN+hJi6IOeZa+0u/3WXJwgcUvXG1dpjwi88DfQNhLcu
 Oy3tB5nngwzD59yoHCzCyhphJwA67aBxt/Pra2zdVQ==
X-Received: by 2002:a9d:6745:: with SMTP id w5mr7319934otm.221.1575568493991; 
 Thu, 05 Dec 2019 09:54:53 -0800 (PST)
MIME-Version: 1.0
References: <20191011134744.2477-1-richard.henderson@linaro.org>
 <20191011134744.2477-16-richard.henderson@linaro.org>
In-Reply-To: <20191011134744.2477-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2019 17:54:43 +0000
Message-ID: <CAFEAcA9TF5bQWpOccJynDSBVRekZaUbgMWtjxkiyKzmM7=g2eQ@mail.gmail.com>
Subject: Re: [PATCH v5 15/22] target/arm: Clean address for DC ZVA
To: Richard Henderson <richard.henderson@linaro.org>
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
X-TUID: kTQtSm39aItw

On Fri, 11 Oct 2019 at 14:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This data access was forgotten in the previous patch.

Do you mean "in the patch where we added support for cleaning
addresses of TBI information"? As written it sounds like you're
referring to the previous patch in this patchseries.

> Fixes: 3a471103ac1823ba
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
