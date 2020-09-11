Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp344161lfq;
        Fri, 11 Sep 2020 15:37:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwk5tUxVCqbN+ydmLtJQGzsA2j/ryE5mTMMGtS6LJ1w8OnVxGrIlbREVA5vBZtJD8lYGCOv
X-Received: by 2002:a0c:8e4c:: with SMTP id w12mr4268519qvb.3.1599863846830;
        Fri, 11 Sep 2020 15:37:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599863846; cv=none;
        d=google.com; s=arc-20160816;
        b=bTw2Raxiey0ltI7BjD9QY87I7FYnUJhj3S4l90W3U/bMdb+rzqwSSE5rx49tsqvzKa
         eC+3cpfzQE9dBn907lUbxclQOATudP2DSI+iGSi+KWVxW0slGg/ouKFdjZV9uLezlnQN
         0C/dmVCDR0Jmlh0DiDYivtgS56qWqB182KwLaKDuzgHDHtm4dPRKqjuKDpDMdm11Pmcm
         nCCGkzGXO9KyZiT7M7Q0wK5QH0oYLsXdHn7QSd4hJYCt1iatMFjgJQFd5jZe386B8III
         sOtVVsFK3NSTexgq9LQwQe1E8jlGFu2UA+3hJPHjeIt7AdqHMIsax50GY50+62qPjGLr
         Dbtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ssd1nqFLH4rM+Rj0wUSn3hf5Knthje/+o2KirR/A3VM=;
        b=q7+i7U0KUWpfaB9acl1RPP8ovnElJFUtwD/j1sjexOhgUIFlmhAA6TrOLCMhYyZ/TH
         EW1g3LAcrUkHifBju7LrgO9uuiDtI7/yhVfEc9QAYHkbSjhb/3o1k7tNHJUx4GriT9Gc
         DOpk/50dDJPoH45nfvhn5Iwal1lSOj1ft0UC1gBqwLS+dJMyeB2aWSNcVtJGZuHQeh98
         GeCP1gkY8PKXvpd8Fr+P0Y6lb4OVwhIwv5l+qJvYzI9aak1Dh0LyrwZMfXs1RlxuA7FT
         eOGHBffV3l6ACH4yB8zRpcQjDKVhYBiwGkMo4EzsakHdhNsLJLc8ZpP4aNGVxCcrcS7C
         XEfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TnHjl7S6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o31si2246384qtf.206.2020.09.11.15.37.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Sep 2020 15:37:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TnHjl7S6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kGrfa-00008p-8Q
	for alex.bennee@linaro.org; Fri, 11 Sep 2020 18:37:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGrfH-00008F-2F
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 18:37:07 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:45466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kGrfE-0008AZ-IA
 for qemu-arm@nongnu.org; Fri, 11 Sep 2020 18:37:05 -0400
Received: by mail-pf1-x444.google.com with SMTP id k15so8359216pfc.12
 for <qemu-arm@nongnu.org>; Fri, 11 Sep 2020 15:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ssd1nqFLH4rM+Rj0wUSn3hf5Knthje/+o2KirR/A3VM=;
 b=TnHjl7S6zriP8jCdI1VFBwmeTPLaK7fuO/AF1FXxNqpKtdp6ZZH5BJkVUsuN4E7BWx
 oFABRCyO4lotkrzJIFGU4NRZKOKsp8FGqOzJo8kDRUYMpcL/nw6PEsTedTHzyGwnUVmH
 nD+ZQRCtlad2K6nczs6WHchjXWuTnypCIjZCMzBKeS4Ajf+QKIBnmwLzpX6UHdqE9lhv
 sQzhmD1Ack6XKmlPmuLd1E0x0Ez9BF+mmydX8mOltpcQnomYmFmitGvleUB2EFKrCay0
 QGyHmB/cRlWSl9Frec1sEy9485IZureC8emRqznZXlhgPpPGc2gQXOyDz3/VpzoOzC6J
 yDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ssd1nqFLH4rM+Rj0wUSn3hf5Knthje/+o2KirR/A3VM=;
 b=IBoYgP550PTxseIemhTDv7BbUy9nA6vi1EANGvFRoE5+iLo3qb/U0VypCxtnUg5F+8
 ruhmupw5uSjWtRoJ9UzAOfUlyWEoDFp6v2qsQe5f4moKW+G+iCrCXdVwXJnbSVXGCbun
 wyjPjZU6Dnf57REF0Mx7pJB5fmRTNSL1KCeIa8QItqq/2vm2KIa9CmsMUphTXk5F1D7H
 kB/wrJMoxi2BqHSvIarcu+H9U8btC2ftQ1Vm0vs5pp331Yk42VztyWxTAl4w++Yhveq7
 YCbTef/kCsNUzV6woAYVx8M7oBbA0s+11lV8w3AVgB6nBuerqubSKii6AQ0Ktxn+bsOG
 ghJg==
X-Gm-Message-State: AOAM532N+HiisDWQ59Wusr3A4NZF5vbWJHCDBkG/KQaLq5MKT+1eU9Et
 NCqEuqjzhHDBt013vSPLTyKpxg==
X-Received: by 2002:aa7:8bd8:: with SMTP id s24mr4150600pfd.80.1599863822692; 
 Fri, 11 Sep 2020 15:37:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id 72sm3181961pfx.79.2020.09.11.15.37.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 15:37:02 -0700 (PDT)
Subject: Re: [PATCH v5 1/7] hw/misc/led: Add a LED device
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200910205429.727766-1-f4bug@amsat.org>
 <20200910205429.727766-2-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0af3da18-e71a-4659-fa6a-568ad493e4b0@linaro.org>
Date: Fri, 11 Sep 2020 15:37:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200910205429.727766-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.469,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +7H19gfi/GxC

On 9/10/20 1:54 PM, Philippe Mathieu-Daudé wrote:
> +static const char *led_color_name[] = {

const char * const

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
