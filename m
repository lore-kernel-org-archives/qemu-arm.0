Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp210701wrg;
        Thu, 13 Jun 2019 14:29:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyfpZSQ69l72ZPZgnm3k/EyM4b3RkzjaZhHrAabVfIxuoqUFjM006JQK3QxzTMMY5whNe3I
X-Received: by 2002:a37:634f:: with SMTP id x76mr71146801qkb.205.1560461385818;
        Thu, 13 Jun 2019 14:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560461385; cv=none;
        d=google.com; s=arc-20160816;
        b=Uce30CQVGjSiePY+++ZPqVHETZiJKr506unMbPNexclrWJEYtXw6e4quonMAOk7fzP
         E/08QG823pwIbaXOunIuW2F7AIcuBnzFtNCmJy+lKgpT8zxQ+rb8bDJhRlPnFcFXiUTq
         5tVzXjHj8Z/a2Eeu73thF2Y+4546vPvywqDO6sVPQr6+vDSkW3lk2NLl+9brnIftM5pC
         MVpftFwpDpHgusJCELh6itlUuqEf8gMkJQ2UsyycaJ+Yz91zlPYqXr8mHlkFjf2pVUhP
         jYbk85oFA9bn0Op9wNTgevDlmQTOyq5ftuuINsbprQ4htLHkGvNFHq4pi+I7m4IkGXle
         OIOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=u/MeMwjBxlkKgVf/YPlRl5EN/MDgjaYvWIQ6rwKk89E=;
        b=TpzWg0dqYSU0wHsTAshL/Y/OvRdlqFi7VgL9CoDCm2n4Zxqrj/Lw0Kt/dphj2P6uHO
         3rt79O9GKu7zEVy8pEMdco+0Vpq1yM5Z8YU1df8Xd85peDDqhqas9par+VgiOh7tpUkm
         otINDmAzmC3i36MnXVdElu+PYYyXnR+/FnPBBbGCMhg07Xm4IrtKj/CLnw3OU2icMkE/
         bq77PNE5n/0Qb3qfL+nZHIYKUldszGeRZjIMFEzCfrDwm2+sNrBre9I/6MRyLEeQFnJk
         jTXk+6XJARTCOjc48Pt9wkmsjnJv0Oz1kiKh5RwAPK+On3UBK4zhsc20IYybO4KAyNGf
         Aa3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="BMKLnW4/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p29si384635qve.151.2019.06.13.14.29.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 14:29:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="BMKLnW4/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbXI1-0004kz-A7
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 17:29:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48767)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXFM-0001k6-VP
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:27:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXFM-0007v3-2O
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:27:00 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41867)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hbXFL-0007ui-TQ
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 17:27:00 -0400
Received: by mail-pf1-x441.google.com with SMTP id m30so48427pff.8
 for <qemu-devel@nongnu.org>; Thu, 13 Jun 2019 14:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=u/MeMwjBxlkKgVf/YPlRl5EN/MDgjaYvWIQ6rwKk89E=;
 b=BMKLnW4/4hCKscGNVnrN8eTIiAKlGTD8Jb7I1Gw3iGA4hQmaEYRgWGuQQ2g57I+Lq6
 CC8uk0ewyw56WD/meJJfCBvSJayCSBSS5l5Dc54noFXLfxwnbOGM75HQbgGeSIDwjAMf
 pyfSdza6JxICzf1cAFfVfjD0/QiLLsLYOtR9yiXvPM0TCqdqoBgaVCSny8Rt13m/ryeh
 d/1u/ihxASKRSmElKHsOKDrbTO0niB87bjf0HlmdEdKbkQTBpks60/Lv1S57tdEOd/vL
 iyT+aLGMxqLpdJxKGTgKUxvqB5JksIWXlTRS9Oo3Fe/AbVUF69I4OMFBq897sW+DDuV/
 VQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u/MeMwjBxlkKgVf/YPlRl5EN/MDgjaYvWIQ6rwKk89E=;
 b=GxeZE5o20hbqaQ1ucSSxMog+h/hu/ME5TCOsEZ5EPloFmig43+1/7ubiH3xMueGxCe
 U5d+mYGLI3jIK8yS09VZ1dAT3ApCpi5/+9rwDB9C5AvRT0hSUPbJFBEdvPD497dfc0mA
 ckjVLsbpC4aR+xfN8Cp2fR4XNrFv7vRg9aVnMpG33Ge0Tzh2YDV8dhab/bD4JHoMIrJt
 UWUlAOnmMo6Bb73auqKH4mLhEzVHKOVFO6RhGpJ0IzrSnobUK4N69o1QJm8qwN8Ca7mD
 BI3cploYJGo3ta7v5LXVq55PzNMqcAud1bT2ou9Dwmbf4yRoGhG35ahYCSvXIWyAazTv
 oRCg==
X-Gm-Message-State: APjAAAW1IjlAYD0iXDe8NM17xlfcz9kUqy4EHkZ6FURQEJNaUOOPqMFl
 hfqzmYTef1q+zxgwOmkl851SG+uUZ9A=
X-Received: by 2002:a17:90a:a00d:: with SMTP id
 q13mr7484491pjp.80.1560461218772; 
 Thu, 13 Jun 2019 14:26:58 -0700 (PDT)
Received: from [10.10.150.239] ([149.199.65.200])
 by smtp.gmail.com with ESMTPSA id k11sm562702pfi.168.2019.06.13.14.26.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 14:26:57 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190613163917.28589-1-peter.maydell@linaro.org>
 <20190613163917.28589-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d2c4799f-9659-e818-ca96-6a4065f19ae0@linaro.org>
Date: Thu, 13 Jun 2019 14:26:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613163917.28589-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-devel] [PATCH 05/12] target/arm: Stop using cpu_F0s for
 NEON_2RM_VRINT*
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RXE3ktUn7xwk

On 6/13/19 9:39 AM, Peter Maydell wrote:
> Switch NEON_2RM_VRINT* away from using cpu_F0s.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

