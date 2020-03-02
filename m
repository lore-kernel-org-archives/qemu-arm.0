Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp2364895lfg;
        Mon, 2 Mar 2020 04:11:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqz7qjO+kixxJU+ygK5DT24npAIXpcx1u3CKiD17pg5ywnD0hTtB0/VFYrqC8ve5G3gUCaqA
X-Received: by 2002:ac8:2b82:: with SMTP id m2mr15127972qtm.161.1583151062282;
        Mon, 02 Mar 2020 04:11:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583151062; cv=none;
        d=google.com; s=arc-20160816;
        b=OVQy7bX0OLVd1+T2bqriqXQYop+65ToGIlxyjlSqiArN+m6WCB3tm4JRSMqj2CeNGm
         W/NwmkA0U+gWZKC8csLoCSpjd5Jyq93egDkllqIjWCYWwdbv2gKj9Y5MpbDqmhmIAXJl
         5kKAP/ERjuNXtlpWgCXIPazYjt+WuJflLw0g2DkD1mYfDkG1oyiuw7P4nMFRy+5Lox/P
         OL+LyP1QttgjyiFNM9zWDkGJKxwGGekHW5roTZU3XufzyXB4paTSyaLk0N2THgwmx9V9
         mU0/BlGP6zI7OquPINApU+JoREUQqn1hn+F9Qko+sLXYGm0rykxqwVHJwy6Z8ROBP8ph
         +VMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SCelQRkW/MNs3atRFB1eiHCWTOUYJHUrrzCTFuJ/69I=;
        b=tGDT7AZ7kTSiFVHYLDdygnrQ6tr3ZTe0063AgB8ZVtvZML0ysoN2ya5W7By7WpjzYQ
         68NwqcyrTC48Ib9Mym1gkeTm0+bD8aiw6W+6c1++yvVbhDpQq8gtnDfMrIC6SZeh459t
         fBj58OjjR9JSFGsrqbxMZ3Prt4XztnidWLIAKcFIHtSZinHoOILCctBcsL8F1nyNTSl5
         u/A6mf+460gfYbDeLQxZSBQIvT8HcuLIWl2AemVVaVmEhnGz/PTbe1DqciqZkLmn0rkB
         I/VWUpUvClNSOvohCGnR/Kiz47ue5prtf4r0LCxYgxvmotaylny6PKioZog7BNg7nRje
         kjLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PKMca0e9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9si5271139qvn.162.2020.03.02.04.11.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Mar 2020 04:11:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PKMca0e9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j8juX-0001k3-PS
	for alex.bennee@linaro.org; Mon, 02 Mar 2020 07:11:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41097)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j8juF-0001hV-K7
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 07:10:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j8juE-0008W5-MA
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 07:10:43 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:40618)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j8juE-0008Vu-IE
 for qemu-arm@nongnu.org; Mon, 02 Mar 2020 07:10:42 -0500
Received: by mail-oi1-x243.google.com with SMTP id j80so8029871oih.7
 for <qemu-arm@nongnu.org>; Mon, 02 Mar 2020 04:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SCelQRkW/MNs3atRFB1eiHCWTOUYJHUrrzCTFuJ/69I=;
 b=PKMca0e9Re/OUdl79qiey/A4PzvjTMd6eoA4oesnMMKjlWuPODR+ODVmlAS9qX54Ag
 X7ARuZPJ/k//vU3GQhtC9K36+Is0qj2zUJfSbbVTKRu6y4zEBwbL59oQ3DApbIebQ7iy
 9HLiWKUc+GoHqUxgtqdDapANawdhzBUzKWGUZzrrQ3YK2sNjFMGq1DpB7hmhyqUdKeiP
 45jqCYtVzbTa1etTyPvJlT+4EPWattYIChjZwZDfIHbeeEsxqJqMMBmz98rcGxOmOlmt
 JsWoDFWfMDRfl8IHQIynJ/3vk9SsV1d6KttYaCr14mIh+W7wNR4E2JoRnceoH1eLB6Ym
 shng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SCelQRkW/MNs3atRFB1eiHCWTOUYJHUrrzCTFuJ/69I=;
 b=t8wk1MuvRwXpIWJTcV9ctpFMHTxjobYYbfzSlALZHjvQGSJjXsXmtFAbAYIf75fFV/
 xiAOzukJCqgJLb6Nq4XZgsY+0SUe9E3H87T3nT9mULtp8Hm8hK7tvCqaecKf4h0L81jO
 3BW0yrFq6fnBwa8SE82e4/k5BM9zT2RiJYcXUaOD+Q8Y2SlDZIMnhjAIsH+Pdd9xcnCv
 Xd4oBG9cVgaHzcSUrum7oByMufLA1U5PoaN978wQuZywPptxeXwmKVRv8m1rg+m282IF
 OZtUzIOZxPxi+ShWIQ0hEdciNptTPd1rzWZpYKh4uVkbnKqmNC9iUUkm/Z6CLLoMMZ9c
 qL3A==
X-Gm-Message-State: APjAAAVtn28AyYztQTawJncFVgS3Tm2Shd1lhZjTLiMjgvW2/naTIU+K
 evrbWexfUGqvuE8+ZaufTHcCrZPhN3HyegPWTh6eyQ==
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr10896357oic.48.1583151041871; 
 Mon, 02 Mar 2020 04:10:41 -0800 (PST)
MIME-Version: 1.0
References: <20200225031222.15434-1-richard.henderson@linaro.org>
 <20200225031414.15649-1-richard.henderson@linaro.org>
 <20200225031414.15649-4-richard.henderson@linaro.org>
In-Reply-To: <20200225031414.15649-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Mar 2020 12:10:31 +0000
Message-ID: <CAFEAcA9nsymhev_+RBjhBX2zD8qNqOqJz-j0FGA1G44RGw_uGA@mail.gmail.com>
Subject: Re: [PATCH 5/8] target/arm: Use DEF_HELPER_FLAGS for helper_dc_zva
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-TUID: syCE1ffaxyX5

On Tue, 25 Feb 2020 at 03:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The function does not write registers, and only reads them by
> implication via the exception path.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-a64.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/target/arm/helper-a64.h b/target/arm/helper-a64.h
> index b1a5935f61..3df7c185aa 100644
> --- a/target/arm/helper-a64.h
> +++ b/target/arm/helper-a64.h
> @@ -90,7 +90,7 @@ DEF_HELPER_2(advsimd_f16touinth, i32, f16, ptr)
>  DEF_HELPER_2(sqrt_f16, f16, f16, ptr)
>
>  DEF_HELPER_2(exception_return, void, env, i64)
> -DEF_HELPER_2(dc_zva, void, env, i64)
> +DEF_HELPER_FLAGS_2(dc_zva, TCG_CALL_NO_WG, void, env, i64)
>
>  DEF_HELPER_FLAGS_3(pacia, TCG_CALL_NO_WG, i64, env, i64, i64)
>  DEF_HELPER_FLAGS_3(pacib, TCG_CALL_NO_WG, i64, env, i64, i64)
> --

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
