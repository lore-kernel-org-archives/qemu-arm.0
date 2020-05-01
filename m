Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp215205lfm;
        Thu, 30 Apr 2020 21:14:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypJh4LcJx5TZG7B1u6RtELoF+4CDC5/ip1AcDMkJR3BpASzVON07Lry/qjaAM+hbl/8B3o5o
X-Received: by 2002:a37:9105:: with SMTP id t5mr1930796qkd.202.1588306480981;
        Thu, 30 Apr 2020 21:14:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588306480; cv=none;
        d=google.com; s=arc-20160816;
        b=qHTVPfVquyO8nM48TTaWBIH25mSbXRe2vTW9nlM3JY8mc5Vv/pQujx1ExMOz3sU0Uf
         q/YoYU8OgMbPTiQ/vg39qT4lRg64SD+cli9eD0DbOMoXDrQ79TapMGI1bME8J7FKxEOn
         Fk0XFjglIo0DqJnJvAuAQWuZeMeFfGvtg65LYH/ejusFePQzKIKbSF5ByAcuJd2iUtLG
         a+bgJABvfZjoRCnLOjEuMTD02RO7T7gYMs1UhLtfzJbUtomnk17HYr1tQlU8fLH7RBkl
         tM032ysWpGIFVssm3cK4Qs4GCrlNhKTr7rpvsXxTqFEh4fSY7tSBF63E8o9JNsBPyBwT
         cb3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=yIR2wTWAisCdXRI939a1h78Nt3JYWA/jxRybsJBIBFk=;
        b=BBqlZbzo2dR/jD4SpcH9Rw/GgRUpMtUG4SAP07Gu2dK5mMH2R+WHz05UDl54dwkutz
         m3qdaX5HvnFB25Ek8GC4xNrd8klEsZElGTSpZrVpXqszPNkV1h22QPPjH/npTvbCZNxY
         O4y4Kja8AiWp6FvwV5PbBieRqFcQ0chmTRR8R2wNnb1JJ2GP9YbR0G52CW6lOXzORZbi
         joHW954Vt72H05Y68efNuC0f6+MsioBgtSSQ8dSmweKEdkonXGy8dL2BXg+5Q0HJrRVB
         rUr+96DwPtiAC+O/1+jxmKsy1Hv6bzNCncCKcjWpm9h+TCVdqsL1IbdUyqb8yDH1Elmr
         pUvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uhC4H83S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id w74si1051643qka.53.2020.04.30.21.14.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 21:14:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uhC4H83S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUN4S-0002xV-Ee
	for alex.bennee@linaro.org; Fri, 01 May 2020 00:14:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49750)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUN4I-0002va-E3
 for qemu-arm@nongnu.org; Fri, 01 May 2020 00:14:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUN4H-0007kR-Jm
 for qemu-arm@nongnu.org; Fri, 01 May 2020 00:14:30 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:56029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUN4G-0007h7-Qw
 for qemu-arm@nongnu.org; Fri, 01 May 2020 00:14:29 -0400
Received: by mail-pj1-x1044.google.com with SMTP id a32so1880293pje.5
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 21:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yIR2wTWAisCdXRI939a1h78Nt3JYWA/jxRybsJBIBFk=;
 b=uhC4H83SEZk6mJURCrpIaR+mF1WpvyICNUEEotyO0droQ2ODCDS3YajgGFbDdkUiag
 sQg/90vpTnb0IiZXEFSZzC3sKKKhYLSiUHxYtDWXI1eYSGE/LemRswJ2Gt/8bsikXVsF
 KeFlBMJN2GFEY1Mc4Y90iwWETS456cOna8gKua5PFI7Mh9PBRRoHYumu2vXADsdRx+V8
 UUmEJGJqb8o5qAomqgX4Tp2ZtRuaqx80VrKA9B+HnHXjA/W3zBRWx+msp5VntkWFJWlg
 /7v+mYp//kjvX7uKbNkgZZkL+5qBciYYBkcYKxUr+Fe4t5twj5d2Y1ITqeZgON0YyfaW
 uy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yIR2wTWAisCdXRI939a1h78Nt3JYWA/jxRybsJBIBFk=;
 b=OvyfRQGvixhpm9TJy9Hrp4TXXYtcVdp6d8u9KQF/skWOci6XnNY2mhF9RoE938Zu1s
 fXuo3wLHpTqatZ8qZgnYHp2YM97MO3GBUHVTVZCwqbJllaA/RHc6TsaxzyV2I5lytDeu
 600rGzlkjEd1jBgGwA3lLNxKBRWRtXYpr9Bg7KGbFnp0xDEOxyiU0pobei0KBRdRoHJ9
 Ojj8s2XUDZSsMpViq1XS7AuO9ES4vl5TR4cQP6efrDtW3oj8y0jCXFubeF+2Z86zgOjo
 Z+sPmdd6o/mxtqNPgXuX9RjfWNVokKjQogCTzNRraGfPVV2cFMQzGI9m1NvpPb4Vzcru
 6Z6A==
X-Gm-Message-State: AGi0Publ82oq4m0nWFjwvcCVHx9PQu6XMqUs7y3e9+7knlriYgMcOYgk
 UQGxrxxqasafUrBlJdbYaA/1GA==
X-Received: by 2002:a17:90a:2b8f:: with SMTP id
 u15mr2555910pjd.137.1588306466388; 
 Thu, 30 Apr 2020 21:14:26 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id j13sm1003345pje.1.2020.04.30.21.14.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 21:14:25 -0700 (PDT)
Subject: Re: [PATCH 36/36] target/arm: Convert NEON VFMA, VFMS 3-reg-same
 insns to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-37-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <08b16323-2901-9624-d538-ae64ee089c33@linaro.org>
Date: Thu, 30 Apr 2020 21:14:23 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-37-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1044
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
X-TUID: RKZyD68SJeUO

On 4/30/20 11:10 AM, Peter Maydell wrote:
> Convert the Neon floating point VFMA and VFMS insn to decodetree.
> These are the last insns in the 3-reg-same group so we can
> remove all the support/loop code from the old decoder.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c |  41 ++++++++
>  target/arm/translate.c          | 176 +-------------------------------
>  target/arm/neon-dp.decode       |   3 +
>  3 files changed, 46 insertions(+), 174 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
