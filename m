Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1110537wrm;
        Wed, 9 Oct 2019 09:00:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzle1Pbi98o6NO62BtG0zAMTyXwcoeq2gaO7MGQDtcXiZfYdE4xahb/vELNF0R/DisoC1Oh
X-Received: by 2002:aed:3c3c:: with SMTP id t57mr4399102qte.138.1570636800475;
        Wed, 09 Oct 2019 09:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570636800; cv=none;
        d=google.com; s=arc-20160816;
        b=p4yi42wqXrFJFFHWw2XjwtXm8L0ngymW1RHdLgkeW6SMVRgSzzaFylm/B3buYC9etq
         6oMj5HB+S1ewCtZTl9V3hhs3tSBg9PLlI3Pz+nVib+KBwF1AHNo4kW0miszBGY3lyOkf
         CmqjPCHwA2vEJ6GgoVSdgiUrHfmNl9YsCssPl2IJviiyFByRznOApIBWqkruCnI2jcHs
         BJTAJsnqOa7WuElbdo8OdUcN1VGjK7N5GytPo+mnsxBAsalvrX+GzOO+XDYZNhJ/+neS
         h60D+xx/PU1YbRQ6xnsIv8IpAxM2PE4E1eh/sG3EwCcmV6CwR0qnc55QtGYH0UlAFcfV
         WOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=8t7Tp0FgRe/wzs246savUN9OVacV+iRLVyeha9N2MLI=;
        b=y366lmwloYVXRAnY0HLAGb1URRMVZTlXoVah/+ue+MeV0V3zIoOmkvyNPW0E9vksG/
         nKAqlkuN9DFcvfkE98WUPLs6D4+MZe5Q8PMt8RONcHS8yzauHVE0U+m7A2cvw6I7Cmnx
         4BSVFLu5gRdPcc59BhzNvMlMGGJIjfxFTIqvO/aK67Ik/T5fR6se53nMXSZsQHajIHrl
         e0jn45ZdPB/05rFAr2e240L7Q0VU6vyRM6/U1jvtXensdty67ikdrvWR13qlG7QaLLAh
         04yptFbnE3u5hXWdcBiX/Dhmhe/c5sfedVNpWDAVoEERKZ7unidP+J2D5+Ul8Wyodcxz
         O8xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qYkgqB3p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z37si2576768qtz.50.2019.10.09.09.00.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 09:00:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qYkgqB3p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIENb-0000GY-Et
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 11:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45794)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1tW-0001nN-RZ
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 22:40:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1HP-0006yE-OV
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 22:00:44 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:42435)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI1HP-0006xr-Ij
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 22:00:43 -0400
Received: by mail-yw1-xc43.google.com with SMTP id i207so227819ywc.9
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 19:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8t7Tp0FgRe/wzs246savUN9OVacV+iRLVyeha9N2MLI=;
 b=qYkgqB3pSI08zesmoxD7JBTYJY0XZcWpHtYkh4/i3uZzfXA6wNTw2egl5uI2WEqxbs
 YkqPTTzpzQxTQ00AdwtjyNOZ+D8ztcelivXbHbQPfJou1PFuDfjh8miPEZE6DYNAAEwJ
 X7L6+QTMLEBQW/QzqpZXn1l9baqeAd7+cQH4ygO+31hA2Us7CNTI0IqZ0uvQtohuqXJs
 K5KyUpJiqS+/Nll598eehxcTaEehO9ic3NfDm6HeR6iMIbnwVTcORFDL+2mIKtwh6Q5M
 e0EIMsVx9lKJX+YXIuf0C/y5CdlQ8DoozqZbto3vc2bgp1wD3Tk39368epbnh2UrBK71
 UiaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8t7Tp0FgRe/wzs246savUN9OVacV+iRLVyeha9N2MLI=;
 b=V1DR8XoPfA7X9MiFkbgJIouvBOfwNorZ6JEFXV7pfULDpVnf4NSygWB29Ykxg7x0c9
 LoeYvLe1hohnuaaiZuL5Zcfv1RGl04WrzJRVMmcy0h47ccv36jnTGcOh47SMIsUk3+ka
 yDQGCVWUw1RqvatCQJjjk5B9euNwYFTe5XApn7+VpNSo8EcbLEgKBbD28jkkmI3KnTfg
 2zcvWKCLGPG8dYyb8AB/IBteJJwlA/RnInxmmF3xAi08JLLTDOr96fDorF8PyIF0pNWz
 F/DlPUGeJxohxxeM1d3Wdh9+tyKS6JPsv2GVDi/kFulCUxOMJfeW22VMIGKVbB9SIER8
 JN1A==
X-Gm-Message-State: APjAAAWQaaWtNBr2WwjQ1zsli0ea2BgAl25GUNRUomDeLLEwQF0mcC12
 amfi7wLjCcXxfxPIPOlSjvj5Fw==
X-Received: by 2002:a81:987:: with SMTP id 129mr972875ywj.361.1570586443031;
 Tue, 08 Oct 2019 19:00:43 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id d188sm241568ywa.88.2019.10.08.19.00.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 19:00:42 -0700 (PDT)
Subject: Re: [PATCH v2 14/21] hw/timer/exynos4210_pwm.c: Switch to
 transaction-based ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c06e1998-96a6-f1fb-1951-ebdc0f66595e@linaro.org>
Date: Tue, 8 Oct 2019 22:00:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c43
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
X-TUID: I0NFy7Kng8sn

On 10/8/19 1:17 PM, Peter Maydell wrote:
> Switch the exynos4210_pwm code away from bottom-half based ptimers to
> the new transaction-based ptimer API.  This just requires adding
> begin/commit calls around the various places that modify the ptimer
> state, and using the new ptimer_init() function to create the timer.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/exynos4210_pwm.c | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
