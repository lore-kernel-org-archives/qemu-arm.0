Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2253271lfm;
        Thu, 30 Apr 2020 12:07:30 -0700 (PDT)
X-Google-Smtp-Source: APiQypLo92JPcXj5QWylwboM9Lg6w2r2lvc0BrOGEG9E7FmKOEL1TzdGniESWsnGtI1XKxsx7G7Y
X-Received: by 2002:a37:e54:: with SMTP id 81mr4527176qko.284.1588273650104;
        Thu, 30 Apr 2020 12:07:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588273650; cv=none;
        d=google.com; s=arc-20160816;
        b=JOaTf/+eOM5O07T7wZl8N5hBvvHRN5NhTFoWVuL0HgIKHFd9q+jgg1lIkavJlEkRSj
         TCJCrGUA8bp0wWoxQqQOI/J5Lj9E3UYz07VwsCRIe8Cva0oEjpEdvHdfT0q0Xl+MMKys
         Vgf2clBG8bh4eo8H/6V8/Ojlnc23jJxD/4eJGhYKyW2d4rkgs5XhRa0StrUIQRxRcS2A
         QiWvH6ef8sypgSf1aakmvxnkLpBuTEF8eV/oq1yN2Z546pVH/2yt+xOEfoIM5eQ78uxY
         s+WxcwwTG3SmAyxomZ0kLnroTLNjM7REB+u+ofNVqG8OQ7ru9LT5lyTY7aAomq5mlcoK
         UwgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=oqn7TtR/TYqwfVJ6q6iqVey21vFfB9UmMm0+Nyk9+N8=;
        b=K+uJ2N4nmFNa9Mm2GXT56NzG6rHLLq8qULHSkGFmEclSbI0DQ0p7yEjzkdRIyqCCra
         7Zw4TYb8PGUm9/hiWsEzhzIxM/1euCNmRbpdZhoNL/paD7h5iZklWbMwl1m29ct9SP0W
         UGi2bIj7njg1jOG9GptZHojLW3lV+eUJWpvIHDCnkU5BWXAbUAGxZP69wymeScJyE7iz
         6H0cnqlEt4OKTDErSskRystPhIdo5Bsqj4Trv7lcOlf3ejj1o0KaLr99jDgW7KeG57wh
         4P6dJ519HwSLXIboek1LtTGrkAoB5o3y6oeuJWA4XxBozlAfq30uEkNylTnvgT5hh/W9
         sYwA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cm0J8cvY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id c55si344704qtb.303.2020.04.30.12.07.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 12:07:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Cm0J8cvY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUEWv-0007ft-Ex
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 15:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43128)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUEQS-0005X9-MY
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:00:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUEQR-0002pd-Ty
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:00:48 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:40353)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUEQR-0002mw-C0
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:00:47 -0400
Received: by mail-pf1-x441.google.com with SMTP id x2so279256pfx.7
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 12:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=oqn7TtR/TYqwfVJ6q6iqVey21vFfB9UmMm0+Nyk9+N8=;
 b=Cm0J8cvYGtjFHqnYtl27MIUrudtcHM2IC6BfHDrDs0jRxuhMTql/8/AqaXFhFd6Pw7
 yMIPT4pt0BLf4FzX1I6dczLvzCIeTGUYlgb0lqQOyFhxjTHUK1gCJZPOOgGnXFB0cwRj
 cOuAulXqu1lLkO0cxHVTewVPW8XjzxtbrcAUfs2vgNUSwW5+YiFoH42G6NlI1yVwQ0uD
 yBOjKULeb2vqVcHMmjHduvO51ndmVt4ViNXYG+3BCZ5ebIgSnwATmQKvBA3DnS8Go+Ps
 9N7Kei3a1OkOhxvQMSkSMCTy8Qf8hUWYE7t/fUR5yIl4DmPAmHxUM7cYKiymHKLDX5zL
 UVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oqn7TtR/TYqwfVJ6q6iqVey21vFfB9UmMm0+Nyk9+N8=;
 b=auh0Fe7AwEOTAKTIUwJodNtiAWr4oYjXSCnYY1lYz4JoTIlUZV3jmMzFGQ3HDTrO8Q
 3Awy+RGHtgCXpfpz0MT4z1xbKKpP+HfRsIcouklY8lGSnJpiYafJA/vaq6A0iXpbLb5U
 LPOFYcyehobWR6LLfndWx36jKsz3v4z4JauMJ7uOhyA83X0aopuLGK0yZ6v6blmvkSj/
 XwfOwTLrDyZgJHGhMv1C6c8X+ZN14STcXzBo5IzHISW74YkZM54oJWKLu8tBs8ioFEvU
 Jf80QUOo7dqsG4JM7+i3PTsyCBA4hrpbR9iMRw71uNFGRzle4ITwLwyF5bE+wMJtaW92
 HXgw==
X-Gm-Message-State: AGi0PuYF19UlxZ820WvxxOne4zOKx6Y/ASDhmP5p27PmZuecF03qnJb2
 9YhgdktyT2bB5UKRDBHIZ3B39w==
X-Received: by 2002:a63:e050:: with SMTP id n16mr374362pgj.93.1588273245392;
 Thu, 30 Apr 2020 12:00:45 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id r17sm433871pgn.35.2020.04.30.12.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 12:00:44 -0700 (PDT)
Subject: Re: [PATCH 08/36] target/arm: Convert VCMLA (scalar) to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1b85806b-0fad-a2b8-2e89-18124bc34dff@linaro.org>
Date: Thu, 30 Apr 2020 12:00:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::441;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::441
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
X-TUID: AE9FgdboW12y

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert VCMLA (scalar) in the 2reg-scalar-ext group to decodetree.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 40 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 26 +--------------------
>  target/arm/neon-shared.decode   |  5 +++++
>  3 files changed, 46 insertions(+), 25 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
