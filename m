Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1118537wrm;
        Wed, 9 Oct 2019 09:05:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZDyFMAYobxWqdjUwhn0Q57ynOFiyXUZqVZfYjqUkLWzMScTwnyBF/KXIrq4IPxj6Q9ArK
X-Received: by 2002:ac8:2653:: with SMTP id v19mr4594096qtv.278.1570637156947;
        Wed, 09 Oct 2019 09:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570637156; cv=none;
        d=google.com; s=arc-20160816;
        b=oJ2+eTwjSjwJEASrEc0RWdFk9FZ3PR8o/Espr3YEsBf88R5uKK8HZjHR0b7DigrJwn
         eyjrPF1x/+F7l8bEVUvVlYv4N8fiAtUCReragVZq8iNh3XUL3yY/RL3QiuZ4iLQ/huMt
         KKfSoPybyxmLF343lKYPWeJQjv3YKe0kRCD6KUW0vi6dBHYkci7+00WN+ck9ptRPmarc
         3O+ru9n3pP5B2qymGuzkYFtEGWjhA0RGT691FCAPS+jE4NyNOdM2FiSElL7noGgxVaqt
         ToMF0P0NK2ruUBxXZ8cY6uhGVjeKWJMUrZ0W2TNviTv6Zs7Uy1+rFK00/R7rRGlxxtu1
         Sekg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=rmP8vxN+KLwyGlOUXl0rLTwAlmu5jw6i0lzFceY8tvw=;
        b=FLr0YiylBpqcQjbk15Lza5nDiGAILhSmzgiongnT7ICOGfzGsMNNCB/NmxGzhKfGvn
         ye6+rQAOtzQTGqVCKCu1xOK/uGLUaa9FA/W1iEbRJIzkhWejXxdp/8RrydMFAJli0voi
         7zF+UGW0tKdrMfdsY9+RKEgBg3i22iWHWLFKdm3IW5hrKk018mjeyeV0YBAOfJo5FYlT
         2rADyDEoAfQqKsSDArwVh4VHLcrgcT842KT8+iHXJ4ndIC6d16k8X1FCbsb4LGAh6Sg8
         +Si/k3D8YrkBZZAUOyIPAI1GSFcWGvIGZNyZvAh1F37j/QJ0iIyKq8CuP0beDpHCoTvE
         eIKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nQx6yMzn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x1si2467891qkn.8.2019.10.09.09.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 09:05:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nQx6yMzn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIETM-0005TZ-3k
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 12:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45794)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1td-0001nN-9x
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 22:40:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1DT-0003c4-H2
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:56:40 -0400
Received: from mail-yw1-xc29.google.com ([2607:f8b0:4864:20::c29]:33212)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI1DT-0003bN-Bs
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:56:39 -0400
Received: by mail-yw1-xc29.google.com with SMTP id w140so247894ywd.0
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 18:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rmP8vxN+KLwyGlOUXl0rLTwAlmu5jw6i0lzFceY8tvw=;
 b=nQx6yMzngvzZ7wTeenASObYb3YbPs6jsngEShRiHnx285/UZeN6tJ2ibSxel5WDPJz
 Xy2tRi6DMs/TOCSjtWASRhBD0hTvcAuQx6/8EkJRQong9Z+y3Fz6s6C1zs7tEjhddcGj
 LdxIeQoIghCBDIaL8Ouqij6rxP4dSvNKsLl4wOf5oU460efhjK7FH/vxiWBnPrPCMXIG
 zyRNABQDCFnVXGR86bwmuiUSAlgIdrguvBeWSEuGGgvtF1neOmbyrsMu0TPHS6PmTVuD
 a8k6jfbJN+aNd8hQjELRRD1EC0dqmRh23iAZZsJncTVoHJ3aM7f/cTA39AqCXjEUWQhO
 mY+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rmP8vxN+KLwyGlOUXl0rLTwAlmu5jw6i0lzFceY8tvw=;
 b=qo8lGxUTt0vY7YTuG3b6NDT5E8IIVVju66o4v+HnDNOyORsXZ+3VSQefEogXVXQ3aq
 4hsTr/pscn7G8QKnpkAnGIaBrenBezKvaW8KR7pZ91Vlpgqr7qUNAA9QzcKoKdrhc1YF
 pmZf8FS8WB2mc4DcshjzYU5UlMcn1yXGbwE/ENWlYibJsuu/MCFNS74FiwOctpvFM8DB
 nGAFHuWz3Lx7qhg1pEV2wxAmNbz7e0ZbgaOtr56sMngk70xdF0uJimC8rWQkXIPtWljf
 WM1dcl+k6/9eC/IH1iZpWqXQNR0mMotMu/0PbTsl0hB+jo0sxPhRKeDFeRDD2838mmCS
 e97g==
X-Gm-Message-State: APjAAAVBfUEs0LOMkcJYAWic39yIe/kCiqORBUAMj/C1uLeqwx3FxlCJ
 37ql8Hvtc6Bs8RTy/ivb1kV0fw==
X-Received: by 2002:a0d:c144:: with SMTP id c65mr991281ywd.218.1570586198422; 
 Tue, 08 Oct 2019 18:56:38 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id n185sm210648ywf.86.2019.10.08.18.56.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 18:56:37 -0700 (PDT)
Subject: Re: [PATCH v2 11/21] hw/timer/exynos4210_mct.c: Switch GFRC to
 transaction-based ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <09f5a1b0-8750-eaa4-c6a3-c395ded3167c@linaro.org>
Date: Tue, 8 Oct 2019 21:56:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c29
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4XH430aMfibD

On 10/8/19 1:17 PM, Peter Maydell wrote:
> @@ -945,7 +977,7 @@ static void exynos4210_mct_update_freq(Exynos4210MCTState *s)
>          DPRINTF("freq=%dHz\n", s->freq);
>  
>          /* global timer */
> -        ptimer_set_freq(s->g_timer.ptimer_frc, s->freq);
> +        tx_ptimer_set_freq(s->g_timer.ptimer_frc, s->freq);
>  
>          /* local timer */
>          ptimer_set_freq(s->l_timer[0].tick_timer.ptimer_tick, s->freq);

Failed to update them all, it would appear.


r~
