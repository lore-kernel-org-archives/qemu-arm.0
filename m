Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp641203lfg;
        Mon, 24 Feb 2020 10:31:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqxhWLQnyW9sqNxK5ZfLx1Ezgk5X1yyhMZvaaU+vWY5sTK35fJnDnj+ddObIDkg9Cb9cDQM6
X-Received: by 2002:ac8:1c65:: with SMTP id j34mr50857125qtk.366.1582569096741;
        Mon, 24 Feb 2020 10:31:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582569096; cv=none;
        d=google.com; s=arc-20160816;
        b=F6m1v+AjhVZ+x/jVBZ/yzfle08UWVEcOS9VT/Kkw9reyPZ3MEp/hMyYeFXjA+ztg3P
         a4zcF2eAdpzJknreaoDtpx4ucmg8s6fsXousoyKHVdmHgwz+fDtbGZCvMV35vIbZQ98J
         n3n/uIs8nAe4y6yEL/OJLkuazOonhdZkbcj1ZcJV/Vxr2BiBerI92BRdMSB2CW6zcs3G
         AnI9QrkZX8x8JZblEeLz71tNmNCFtrbkLrE+I279PGQAZtspFrerCrTv7+bKbR9ODT/0
         meEvEWeqQ12pO7/5u8qyhdObXabzMIhbcn6TYF3ZwC3FRGw5s6MT3CSUnTFYUufiwZzt
         h45A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=GSCcYlKRE/PP6lBbkvmuft18cUfg2SNmB9vLMQhcdo0=;
        b=bboW1JC1mYBd0zr+86ehLVmEikIwFQlk4cI9O3VgD37Z0MpJ4O6UN3TyTFMBMER9Ik
         OECCiVISW/xQSqByblZHRm4GCZULo1EjFDBlT/AOukNdgAMhsvdf6UYRYSmHzjVRKTYn
         7jGMkHkccPZJddMCRRdQGc3I5ucTvGALl7Quj2c73lQ4t2IaFFW3TEgWCBMwiF+SbYcU
         6Nk17x5yXZvRuemPxhKxxkXoHCuH2pK/erl4x/RPeh0p8AraodG+l2Tjf0iESNk2tb3V
         6K6NTkAa4yceOzModR0wUZT67Gz2M8+IjBqy4hPuZIiAfdDHJF10zaY/SDuc/+xQlSII
         /l+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KiKjM8Yc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w1si6371668qki.363.2020.02.24.10.31.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2020 10:31:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KiKjM8Yc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j6IW0-0006R2-6O
	for alex.bennee@linaro.org; Mon, 24 Feb 2020 13:31:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58106)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j6IVo-0006Oj-GZ
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 13:31:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j6IVm-0008Oz-Ky
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 13:31:23 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37096)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j6IVm-0008NV-D0
 for qemu-arm@nongnu.org; Mon, 24 Feb 2020 13:31:22 -0500
Received: by mail-pg1-x541.google.com with SMTP id z12so5580020pgl.4
 for <qemu-arm@nongnu.org>; Mon, 24 Feb 2020 10:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=GSCcYlKRE/PP6lBbkvmuft18cUfg2SNmB9vLMQhcdo0=;
 b=KiKjM8Yc4YBChmVTWGw1RmmxPAgU0kUVPk+icdnTu/kCHPuBk8q9xmBMi+09YxTOHv
 ZhQugOl7x5wYuoxwU0yT4Js+EV+m7e36w3xmvJsIyWy/dv8Tb9r4t4QEOlcu3fZrNmIQ
 4xo9q2U8HTfXIUzaxC/Ztq0Non6udLpb48DZIzC8J4c6FYRAx6uSZQ5r+l/Kene5wEdJ
 jEhfV/1BFiqUF4gu4NcTFiD8CAI9RpQda2neTXooPIzbBQ7VVrYlDWHSpROIfO34HFNF
 uh8Cs3eCjTuc4bjuc0URtQnT/psg0OTYQRFlgVnMD13og3K89tJ1eF0QVJD/BFPlMh+X
 tf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GSCcYlKRE/PP6lBbkvmuft18cUfg2SNmB9vLMQhcdo0=;
 b=SUN3pUpAOkjKumGmJbYpXTrSvY5v3pOXb36od6AaDtCeG7xtubrKKVQvzoV9gHpCSv
 oOchnwkW99TUAaTpsDniEcJCa4U5a8CQzE5U3iSfyIok35Lt1l4OzMfk4Hp0ie/zp10c
 t2Kq1fTWh6AfQ7p2UFcJl4E+qU2mpE0dX7VczOIGer2qayuqaGFpN0KZ4qHXnKtI+rNv
 pR7BKVNCt2HEBq3xr8CLaSTrgFDEyDl2IhQ0WjNej3vMmc8Ynbr3rtZ274L3iqQJLicI
 0l57t/HDr+g/0gePlTTTkueU9OlZRXGLvE32SDtLtio7a8pYu+DnFTQUjs/Mf8xpxDwh
 AueQ==
X-Gm-Message-State: APjAAAVQUpNmtLT1kyRb8nwaAHw5zWubaM4/7nWa+tC3eeZgCMAQrXp4
 x50qfWJHEYaV8q8N82YiP0vyDQ==
X-Received: by 2002:a63:5826:: with SMTP id m38mr55797916pgb.191.1582569081200; 
 Mon, 24 Feb 2020 10:31:21 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 x197sm13893526pfc.1.2020.02.24.10.31.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Feb 2020 10:31:20 -0800 (PST)
Subject: Re: [PATCH 2/3] target/arm: Implement v8.3-RCPC
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200224172846.13053-1-peter.maydell@linaro.org>
 <20200224172846.13053-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f04c5aa6-0a6d-72d0-5033-4676777322b9@linaro.org>
Date: Mon, 24 Feb 2020 10:31:18 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200224172846.13053-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SH9uf2NO+3Uk

On 2/24/20 9:28 AM, Peter Maydell wrote:
> The v8.3-RCPC extension implements three new load instructions
> which provide slightly weaker consistency guarantees than the
> existing load-acquire operations. For QEMU we choose to simply
> implement them with a full LDAQ barrier.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h           |  5 +++++
>  linux-user/elfload.c       |  1 +
>  target/arm/cpu64.c         |  1 +
>  target/arm/translate-a64.c | 24 ++++++++++++++++++++++++
>  4 files changed, 31 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
