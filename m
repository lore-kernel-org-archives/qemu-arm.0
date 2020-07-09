Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1694415lfm;
        Thu, 9 Jul 2020 11:46:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymmpDEgTwxP+Gu9DUr0DPucalCR7BuymIKRL0DfbgZc0WLzc7af2qQUwF8KhljfrjCPwi8
X-Received: by 2002:a05:6902:4a6:: with SMTP id r6mr180819ybs.249.1594320370753;
        Thu, 09 Jul 2020 11:46:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594320370; cv=none;
        d=google.com; s=arc-20160816;
        b=L+z879TtgM1OC6vcR9CLTrmAPf/yYYwCcayCOr610RlTgoS2cV9zPH19AucFY7o5KR
         IEjbwixzJ4UpFUaam56/EpZzYalF5l6tGZ9OAzlsK3fPhEwGHfh7KTUdESKAiDL1HkVC
         oESmSM/ambbZ1HaAznIriNqkLKsCspHqjGcOldinDCuIpn+fPvu9ATYWcbC0ZsICkqO+
         +2HtpQB8XJqjscPrer/J91DkkyWPGEjoK/Y8OtN2g4gghDi4K/h4k+R0pQK7f+iGN2Bo
         ySPOQioTSnz7xqvlt+TEmw2kR09Qu9YrMOQlyYdrBRShXA+d/RHVkdWVUWX8bmCnrrBM
         zwZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=3kpbldytbHFLFvJnDvvCuBLwCoOs0v9NjC6PiB2hZvQ=;
        b=WC/gl55RN9WMEa0OMR5/dQRhWfrSdFu0AQ5mBKPVlzLPNKbJpqga5xp1FUxAUvnJYd
         i5eD3gmUmaViU6wBDGA3aZXJRKK58ALH0vOEELZiKCiSOGsSe8SikK1HnNwtYT7FXlwX
         Cu56ISCKNM0Xl9u+L1+TR8Ibm8yUHndWm2157MRBEiIjG5Q4gWl8GP0dP4dttZ6CcnRp
         yLzyOyn9mHa7mmPtT3ecBIWoSych1LPeoSbR9hcYKJimO6/l63KvX8PEuq/6SyZ2yh1K
         tMMxZJN3kbTMUAsIKwFOS4iM0q63Y2krZ8Fvp46dY27NLMIINP16rSAtrOzXhqgWNdVg
         yBrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Td/7aobe";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x4si4722131ybt.310.2020.07.09.11.46.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jul 2020 11:46:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Td/7aobe";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtbYg-0004Fg-1z
	for alex.bennee@linaro.org; Thu, 09 Jul 2020 14:46:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtbYX-0004F7-Vg
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 14:46:02 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jtbYW-0001gs-EQ
 for qemu-arm@nongnu.org; Thu, 09 Jul 2020 14:46:01 -0400
Received: by mail-oi1-x241.google.com with SMTP id r8so2715029oij.5
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2020 11:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3kpbldytbHFLFvJnDvvCuBLwCoOs0v9NjC6PiB2hZvQ=;
 b=Td/7aobe8jiff563YEHfcdY1NiVpPOZmZ+kyCZHBf6Z9RFdqfq5rAUdRYG0BCol2Mp
 gMUmHTXy5a4rmwFQxte/17TOhjwF1tYe8StqlKn4lljUs95ZB/jwrrLWsRV00XNlhTn5
 l/pcpCGZy3hZ9ssfAaO6+ZlIGtuPP6t63tV+u9VY7vJZt78Z42Ehukw1YkJE4CgnH+eG
 QsZ3k9EkWI+e3U3OTWsNuRb0qZrWCk+W10KsDl6zB7soIkZa0pzL9LB1f6wRL6cNCX+K
 ZYRvQIGFwjc9yVmmNRbuRrTuXqQIFuyNz6nRQidRXOnu5HOXUXAIvTHeX3vm2uzznIjw
 AsZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3kpbldytbHFLFvJnDvvCuBLwCoOs0v9NjC6PiB2hZvQ=;
 b=gHYZyH0GCMadqr3tQHjRO8pRmCh8d3MlKd2zsDz6YYlC6n4iZ7rPM9wg2orSMMfp+C
 00IpMYYxx0P9lw28KeVpH+5L4KPm7y3pXjuif+3B0ZXzAlmS95VBCXnt8Yj0GfI4JSeh
 sXOer3Tbbkh7VxcNRfpvRTsFMxf9TVuKsfxoJb6+8/Own6GOIBBIw+fFZQF13IBe6uyh
 2AyjdOhnahZpbEy85U66yFpXFkNTTcMzJvls8GS3NykNv1WwoCom2tQrHeyjnXU8Pnqj
 xHb7FSpj+PUrJZdbQfBuady/71Gmc2wP09ivtoimENtCaQ+MdUc8dEclrMhPPgB13ZAT
 UeDA==
X-Gm-Message-State: AOAM5306nWQvTdYRPv/hzaunc8Sdb9aR3KBRIkxfcVRXlTvQqUaIDLGc
 zBlQTsnwcAapA/puMkQpg+icxjgJBLnwfzYp4g3iTQ==
X-Received: by 2002:aca:54c9:: with SMTP id i192mr1277445oib.163.1594320359006; 
 Thu, 09 Jul 2020 11:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200705213350.24725-1-f4bug@amsat.org>
In-Reply-To: <20200705213350.24725-1-f4bug@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2020 19:45:47 +0100
Message-ID: <CAFEAcA9q94W2J2+07jPVbp_oX1J+vVvmLWXxj7gTJatbLwrB4Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/sd/pxa2xx_mmci: Do not create SD card within the
 SDHCI controller
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ldijB0uHt2bK

On Sun, 5 Jul 2020 at 22:33, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> =
wrote:
>
> SDHCI controllers provide a SD Bus to plug SD cards, but don't
> come with SD card plugged in
>
> This series move the SD card creation to the machine/board code.

As with the other series, I can take this via target-arm.next
or you can have my
Acked-by: Peter Maydell <peter.maydell@linaro.org>
for an sdcard pullreq for 5.2.

PS: this series didn't seem to make it to patchew.

thanks
-- PMM
