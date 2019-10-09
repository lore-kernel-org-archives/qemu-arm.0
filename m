Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1115828wrm;
        Wed, 9 Oct 2019 09:03:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqweQtyrCxu7vRzvmQDJNeDHhYFCYl2SsCDKd2X6nrwPAJR1rhaEDcS4xp01JQbRo9GhZFtL
X-Received: by 2002:a37:9202:: with SMTP id u2mr4446733qkd.8.1570637037192;
        Wed, 09 Oct 2019 09:03:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570637037; cv=none;
        d=google.com; s=arc-20160816;
        b=KPNtyQXVW78CzS079vdKdi2JroWvI9rUxbcungqxIadFBDTgLSnDqilk5goBGdHJ36
         wflhRxNuLkI/v8Id12kG62h2plq74dlvrERCUuQru/B7oWL/gKPUQq/NS8qWVerWAW3g
         ltRVbkMYO3XhccfHhOngE4e6opiqcfwM1DGHfMZQoUrWTlGi8hIln3w2lcnYa38sUO0Q
         5uR2aI68gE588mXt8/XsN2QcPy0L03HGXYiaa1qiarIEiEfRUWcUF8Dabq7bFStFjKiu
         UgoUeUDnN0KKJICUTv4CLi5A0e9OlcYabaIsSU+gWDc1/dkAM9GLHsJH5W0C1lIbKPrY
         0qaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:references:to:from:subject:dkim-signature;
        bh=kLjxtmfzmglbrExGmBtYEiAkfZ47H/12eqRlwI8tbCc=;
        b=bkN1tlnONctycHCF2V7uZAKPhKOK+G+uMnrGe2xWRRshaPcO5ZjaUrEyPn0QWeTfJt
         iw3LE0cAdbu56QMo81cpVXyq6VUovc8THLra/UGAybm0VvyOhi1MsPASUsF5XXmULpG3
         qq4YZ/xcg9wviajS+uyH1ZwXRgbPUWjordgPgdp3mwxHkmK6RWD43CwB46j452rlBAuh
         jCB3SQau4MV0Uak04RB23glDlzd9R5v4M119dW18SWev5wFulz6fSS86xRlCaz1iTlpy
         FCw4NSpC/RiAhbcKs+XmLg/RIBj79ZFseRDmYUBCNrZ56QP43Ih9AG2NXfZCoqXxQZXX
         1Dsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aOTlWRPj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2si2536885qtc.132.2019.10.09.09.03.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 09:03:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=aOTlWRPj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIERQ-0002dT-0c
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 12:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1ta-0001lf-Sa
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:40:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1F2-0004Kj-ER
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:58:17 -0400
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44]:35401)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI1F2-0004HR-5z
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:58:16 -0400
Received: by mail-yw1-xc44.google.com with SMTP id r134so244061ywg.2
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 18:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kLjxtmfzmglbrExGmBtYEiAkfZ47H/12eqRlwI8tbCc=;
 b=aOTlWRPj9JfFxjNmQkAzGOri1pg9kxaaxnV7jotbDhH258Xs0H6rFja7AVOxACnG/h
 0Apx4KPMF6xPIBmfzzDQpVFaE+WuvA9n62AfyJ8hA4Rp2h26O85AdXiWXBCPzqrJfe/1
 2XnRHw32GhuJuEpfvtm4RqzzgUGAJo+7m8cz5m0lvib7200ezhUOijGcL36RW7LznZwt
 pDy20wK5CBov+5comGRtPRr3D5lv8wasEg7UAtHdOWtwg8Q5lArs6YNJAono7oh4p5Bn
 yK3n5cLkEoigUvyow7sEGftCRG3wFg1rOJEzj+cYfVH50sWGkT6G8YcGEW2n/kM5Y+11
 Jh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kLjxtmfzmglbrExGmBtYEiAkfZ47H/12eqRlwI8tbCc=;
 b=KVeIheAheL15xzuKcqv/3dh1skUV6pxppx4cJWwklIMRdCthiqmeT+QbplpxlgGIs3
 kge0LhIRQye4AaDQCdn9OqnS9fVpKyxrDKBO8rKPlieKNPi+fQekyuI8VGu8fYv5wzaa
 rcVNL+wx71kflSeD23LEE3Suoz5CPCvqwkeWVhTDt6KPQFJkg6S01u+EndsTMhP1Gl5H
 OpxxYpC8fNayqWTjb7E+9fDZ3dW6qJVpXN/3XNtJ8Na1lm4jP8OlM1BfoFWaxq+fZhTL
 20gsGwk0iao7lVIfGRWAJ7CCQ/9j/5mSnAaV6CAoQgKeAZriq4t8eAfRRk0vIiw9lt7q
 kN9Q==
X-Gm-Message-State: APjAAAXZ9TDTefMskFVoD12gLLUckZtBgL8V3XblN33RkWnIhBcBU89o
 oZZJd7M9qGwYKHoQYf6dGuwmAg==
X-Received: by 2002:a81:784e:: with SMTP id t75mr1067252ywc.328.1570586291821; 
 Tue, 08 Oct 2019 18:58:11 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id e82sm254783ywc.43.2019.10.08.18.58.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 18:58:11 -0700 (PDT)
Subject: Re: [PATCH v2 11/21] hw/timer/exynos4210_mct.c: Switch GFRC to
 transaction-based ptimer API
From: Richard Henderson <richard.henderson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-12-peter.maydell@linaro.org>
 <09f5a1b0-8750-eaa4-c6a3-c395ded3167c@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <4fb18f38-eef3-281b-f414-d257e3dfa2b1@linaro.org>
Date: Tue, 8 Oct 2019 21:58:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <09f5a1b0-8750-eaa4-c6a3-c395ded3167c@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c44
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bs+OdWOUVQyl

On 10/8/19 9:56 PM, Richard Henderson wrote:
> On 10/8/19 1:17 PM, Peter Maydell wrote:
>> @@ -945,7 +977,7 @@ static void exynos4210_mct_update_freq(Exynos4210MCTState *s)
>>          DPRINTF("freq=%dHz\n", s->freq);
>>  
>>          /* global timer */
>> -        ptimer_set_freq(s->g_timer.ptimer_frc, s->freq);
>> +        tx_ptimer_set_freq(s->g_timer.ptimer_frc, s->freq);
>>  
>>          /* local timer */
>>          ptimer_set_freq(s->l_timer[0].tick_timer.ptimer_tick, s->freq);
> 
> Failed to update them all, it would appear.

Ho hum.  Done in a subsequent patch.
I didn't realize that you weren't converting the entire file at once.


r~
