Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3157689wrs;
        Sun, 25 Aug 2019 14:33:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyoEVBVxKVfhlejA1ZIYFB42zyM+afd2FjeFMKnLKRle/MYOMPdmNPhYWmQ3loKLBNurMt/
X-Received: by 2002:ac8:296e:: with SMTP id z43mr6640921qtz.11.1566768815468;
        Sun, 25 Aug 2019 14:33:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566768815; cv=none;
        d=google.com; s=arc-20160816;
        b=Eg93V/IKhUGxqApxqvPJVX5leMeFbtC1SfnjnyoURvjPChBr3Bhc4Gr0O8199KnO74
         2aSE2LKL2N5RIVuF0ToTxt9Tho/MnZc80gk6wRvSmx0FR+6voTZ01Q+7+gzJPTTGmgvZ
         ljyG7tU2wCzcCtNuqmmQvbjJyTnYXJq5kuvVHPIWEnU0FiClY3XoEJKhRGgb6TgAyUDn
         Sl439T1Iuv6MRyS5dmtU8o11HfrZ1N6w4DcpJBxbjcHXgsV7EJGdQry9WfeZTU77kVo7
         OpI9+Xt+lK/Rbv2verpJAvXDcaIEslwoqP/s5rQ2IOly0g8P6p4Lgot/9OBS5Tz6EqwL
         bSTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wWhvyYwynS+P4F/wWvOseRqOVfRw6DTIe5vx2xn6tdA=;
        b=Jv0HScYlq08YYrmUSB6KDOZksZohNcT+2LeysREeYZC17GaHiiCzq/kmHcVP5DZEHz
         fop9ah1g/AQvaf4wpc0p3Q5E21KFkO4Mv9A+GTYjXFPgRjiujc9cIXRxGaWG9f7BJj+9
         bMmpkhLnAIz2+f+w5Jwyv4lmBYmesBRqdFHVRUKSa9jayWU7yhE9cFV6AzWGoSTl80BR
         4+ytpS9skjk78kNB4IiYAJXvCqAtsuz/XH0yTcl/Qb/XyReP5O4j3fC4rFsU8qrHkNiL
         zj8YaMFMPIqLT8b89uPi/X3p/Twi9B1k08J359lGCLXjWGldOlDvEl71GsDhkY9iSP8P
         wFBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="IIKN/5Gd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l19si6775068qve.49.2019.08.25.14.33.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Aug 2019 14:33:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="IIKN/5Gd";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48212 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i208k-0008GZ-Ru
	for alex.bennee@linaro.org; Sun, 25 Aug 2019 17:33:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57398)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i208a-0008G6-30
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:33:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i208Z-0006hQ-0z
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:33:23 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:34763)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i208Y-0006h2-Sl
 for qemu-arm@nongnu.org; Sun, 25 Aug 2019 17:33:22 -0400
Received: by mail-ot1-x344.google.com with SMTP id c7so13456573otp.1
 for <qemu-arm@nongnu.org>; Sun, 25 Aug 2019 14:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wWhvyYwynS+P4F/wWvOseRqOVfRw6DTIe5vx2xn6tdA=;
 b=IIKN/5GdeHklZLQyG5wFMa9X3R4kzmxM4dZRdmI4aGKL4H8ACak4eznzf97k4g0IeK
 70shrL7YHCvQJCqYALKN9/6z98FwMsbOlW0JFGq7ZCEMWuLHCxW/ZscZ47tssXwReywt
 L/FkAG2+hFKg+FAW8/CFvSRQWC3reCGKTwvvr9n9BQqjza8cmXWhqHDX8yDUNbWMqN6e
 VkysbbN68yNKyOJ0Mfld957006y1aET5PklArB3QTPde9NvCTw2FjKdfCXIRcXoIgvsF
 lD62T1MCxGnJp1yICfWx4ChkDrVhLiugSUSSNxT8OQ7WLh9qMuCzXYzzgbHcVM1tMjd2
 b9Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wWhvyYwynS+P4F/wWvOseRqOVfRw6DTIe5vx2xn6tdA=;
 b=NVEfxNtAINQycsC9/NHV9/yMM8k0XG48LV/nCWD943j+qulIUK8d17K+z++o0Lh5pn
 ai41Vxbwj4QzlVTpZ05st5tRUlM24XXvqeQ/tSXYX92bG7PwHggccpTm+/+hKGmDvupQ
 WAQMPGta1fJ+iw87QSPateRNSnhOmuWuMnJgPpPb7UOD5NWRVOCTwmFRxKZIBOapL4wR
 3s83lkyawfANgzdKYy9gDI9SKrK3lJeS6DOm/ezfP0APuCT2nRyFwYCNpoMsb/8S28wL
 CzbvdqbTsKar136oufI/LML2HTeuQQw0lhCxOawl0v3CWrcHBqPKA9/ORIsNkRN2ISd0
 8YJw==
X-Gm-Message-State: APjAAAXWHVz7vPK34XAobyNWBgq2u/MKIhMzfXfn7evoJ5AOvCw/s4gM
 rtfkFD0/oz6C3I/w6Tpde0xAMZu3C+reTXugDLfGwNpATpE=
X-Received: by 2002:a9d:5e11:: with SMTP id d17mr1701801oti.135.1566768802331; 
 Sun, 25 Aug 2019 14:33:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-51-richard.henderson@linaro.org>
In-Reply-To: <20190819213755.26175-51-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 Aug 2019 22:33:10 +0100
Message-ID: <CAFEAcA-ECSXb=FufY1haKDAVBqE92WaOOO6spKTWNMXEedzLNA@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH v2 50/68] target/arm: Convert T16 add/sub (3
 low, 2 low and imm)
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
X-TUID: M+Zk8gPMBraa

On Mon, 19 Aug 2019 at 22:38, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 26 ++------------------------
>  target/arm/t16.decode  | 16 ++++++++++++++++
>  2 files changed, 18 insertions(+), 24 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
