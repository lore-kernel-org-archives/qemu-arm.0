Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp492255wrg;
        Fri, 7 Jun 2019 11:19:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwpAwVQT7lF/qu06z9S/0jZxD6eVijqxXBJZFuoJ1D9HaiK2gsQ0YyNpmvEXmZSrzGUSYgD
X-Received: by 2002:ac8:c0e:: with SMTP id k14mr5225739qti.72.1559931587093;
        Fri, 07 Jun 2019 11:19:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559931587; cv=none;
        d=google.com; s=arc-20160816;
        b=aCw+hWyq8FQazenPLU3BJbPGBbanWf1LHPvmVULJzgWS66nJYb2WJ6AMAaANPPfk15
         t6/0ykUQI+qh3L37gvE9txmH6mgbDdJjjAAFHAOPHp3TBykLpEQQdtJeq/JGopwIhHWU
         40KFNLxzbZgp7BjwT7lriyPW84/tWmg+Ecu09/5q+6RWSJYc0EP89awNJuO1ht/lfE5F
         frZLDgLNttg2Aie6wz8GT1OKeROKwoy66C5JVLIzTOPO/Mja7aDpoNl2Y0h5JduAhl/Z
         97tCXmuB9PTo+rAzFYPfxPA5HkMKMj6Ftg80QKzPU2w4s/sO5JEvuFt12m/KOTfyQ87J
         5/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=jUGCXopUqagwavwf6nXHRMMQXU0j12H1RCQMa4QmlHM=;
        b=Jdu2jAUIqov8XGFZAwMwU3/21FAVrk6iNDplpENSXJJXGE9cpA1PyrqWR89brxFBTO
         ujCHbY0IR3rqrgKv216UsEOjzhiaqPrbrdhIF0PySeTdoKFL+Bt+nPsKX5SajYX94YWh
         Qzx+O13nV5LV+ZcRguzvJgUIPy7d7nIDG8eX5qDvSdoPVK3+cDtg6YZy6MFrJHWkQtEt
         K+u/sFrBOynaTklrCAPRg9m3OEfg4SUWtkP8eusRoOUg3PwRIGBhrheGib8Pw4CttLRd
         C2r4jyzM0u8psc9boYu3BJLH47bP3F6F6IHcwO0egGXF1V+3JJAbMsU6Mi2+x2E5rXnf
         DXog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ceqOtyql;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l22si109470qtr.84.2019.06.07.11.19.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 11:19:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ceqOtyql;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50152 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZJSs-0003yj-Kr
	for alex.bennee@linaro.org; Fri, 07 Jun 2019 14:19:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58510)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hZHBK-00028z-F9
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 11:53:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hZHBJ-0007iQ-JA
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 11:53:30 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:35864)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hZHBJ-0007h0-CP
 for qemu-arm@nongnu.org; Fri, 07 Jun 2019 11:53:29 -0400
Received: by mail-oi1-x244.google.com with SMTP id w7so1774753oic.3
 for <qemu-arm@nongnu.org>; Fri, 07 Jun 2019 08:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jUGCXopUqagwavwf6nXHRMMQXU0j12H1RCQMa4QmlHM=;
 b=ceqOtyqlf+sEIKxkR3Dd7LYDTwX+eVf5igHVNxHt8c6Q11CQMkQ5fdXj4WKxiNsr7g
 ESuZO/zAsE9FVMa+c/TuVKu0DnL3nth7NAYSChvYv66tgeAaNcz7mO1wZrBvxpkcAEAW
 TJ57XTEsmQOmWO/W/iAq7Jepz0LaQZO8kkGSPy4Tl/dzGd2lndwLEAtfgJ4QfcbFJ4Ue
 7Bp3Epeip+l7Z+WXlcKdMFft+zIdgYcWHz7sg65Udt6vB8Di1PBu6oC4ALR5n96tv2OC
 0Lk0Q4onJPwJVnQ3Th782/+TUb+Sq0LdguoLPw+hPuOEwnDvQUPt+3jX+GNBd6a4GaM9
 /hDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jUGCXopUqagwavwf6nXHRMMQXU0j12H1RCQMa4QmlHM=;
 b=uS4/+u5AGP3BcB2IM4Cfha5058fcPu2KNvGgTJVEd5tmQOJhmNtdlov1GqfgAzaNC9
 2CzPEjCD4BcoUh4dCF2NBaTAo9xW+Z0moDLBELjFHJKg7ggUHApl/V5yDT8slVDErSqw
 wK/xpvZHNqtXjkyh8S7noVu6n1qh/IX6zk2W/A1diPXr02EU3jzmqW8Lnn7bG2UyopfU
 G6wb3KJV0vpVHqcSkNRb+fLNG4jm8qxWf8y2EMtonnQjo7YoCNOCWEhpNErxZbxpg8or
 m9IvmbH0eCm0tZ/ALLau3KDYoUDoAQ95AJ+3593Fa/bRrNEzGZ5W4fC+3wdGr3YdRLoO
 HCIg==
X-Gm-Message-State: APjAAAX5QocmnOjc2w4Z6EYMniM8E2gYixHkvgSeJEksrvgWMKvEL56Z
 ENaAjXbKZaMvGs+V4I8f2Bv4/A==
X-Received: by 2002:a54:4686:: with SMTP id k6mr4301232oic.112.1559922808328; 
 Fri, 07 Jun 2019 08:53:28 -0700 (PDT)
Received: from [192.168.3.43] (200-56-192-86-cable.cybercable.net.mx.
 [200.56.192.86])
 by smtp.gmail.com with ESMTPSA id e4sm860962oti.64.2019.06.07.08.53.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 08:53:27 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190606174609.20487-1-peter.maydell@linaro.org>
 <20190606174609.20487-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <d18a03bb-e1c7-dacc-df52-45db40044eb6@linaro.org>
Date: Fri, 7 Jun 2019 10:53:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606174609.20487-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH 10/42] target/arm: Move the VFP trans_*
 functions to translate-vfp.inc.c
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
X-TUID: FRpeoc/TkaWN

On 6/6/19 12:45 PM, Peter Maydell wrote:
> Move the trans_*() functions we've just created from translate.c
> to translate-vfp.inc.c. This is pure code motion with no textual
> changes (this can be checked with 'git show --color-moved').
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-vfp.inc.c | 337 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c         | 337 ---------------------------------
>  2 files changed, 337 insertions(+), 337 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


