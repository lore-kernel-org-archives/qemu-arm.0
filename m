Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3610532lfp;
        Sat, 15 Feb 2020 18:19:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqwXCN/ETlY+w2rHb9uAM3znM3sQwjeIahzRfjgIevN87TOjLkN1u7bhRNhBceqDqD15DekH
X-Received: by 2002:a37:4ed3:: with SMTP id c202mr8787080qkb.219.1581819555378;
        Sat, 15 Feb 2020 18:19:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581819555; cv=none;
        d=google.com; s=arc-20160816;
        b=p2V9aGy5C0H71cHx3xafoLGQXSrk5kjqu54RR053/rMSKXgA7LsQEwPjaTuoDCVb2O
         NBjz4QLLGPM8S1bPcebIB17QUV984Y8JSkabYIE11XI6SpmvgeGgSYo555prw70cpJY+
         NVi+RxlFjgfMiXwvrjUHSMdvOGXm4YI+v1yqWjXHV4hwap5TOQW+gZ8C/xlB6SnLy/dB
         2rKDMnglQIp6cuFHP2igYVpxilYq/sYdWzLV16/XzHYZ9rhWqls+pDHcucP38jhPaR8L
         owPNWuzGsvbqE5yyy9NwkDgzQqauf++SQ5ImHqkSPSFKx8REXsUL3FzlK54rZH+vXvFd
         aZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=RNSvFQNS6khDxcyYYx/hbK0MPNTtxC3ryau1m/kEWlA=;
        b=JzEghOujHGDW3aXeniz8w7uEmof4/CaG9xoVAMTZFPiU654kcbKbiKev0Dk6T98nbG
         KSD0Vu3EQWed1067bSS281JcyKWv58rcXjnJ8TVthdVgJPTZqxTooSnWOaNl1mMMnQ1X
         rqD6T7NgIQqZcHIJoBpiscJg2voomeY5IJrdqGNEUdp2Y9drO3FF+jgpt1hGKkZW6rAU
         sTehXO5INFnpnaWhoxxUgYgqHETCkBS4nDglS/ujY3C768yUo9v0ELOIDtIyV4OjEc8R
         RlpE5oHxv5FvZstecFQWSDCpj9lp8DwRhoWGzPHm61/rz4yisueVOaHpjtWWdAuKLPUk
         hzxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y41fwhPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si4797371qtv.139.2020.02.15.18.19.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Feb 2020 18:19:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=y41fwhPs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j39Wc-0000Jd-SK
	for alex.bennee@linaro.org; Sat, 15 Feb 2020 21:19:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44421)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j39WV-0000Iv-6r
 for qemu-arm@nongnu.org; Sat, 15 Feb 2020 21:19:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j39WU-00051Y-8X
 for qemu-arm@nongnu.org; Sat, 15 Feb 2020 21:19:07 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:35099)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j39WU-0004zf-1i
 for qemu-arm@nongnu.org; Sat, 15 Feb 2020 21:19:06 -0500
Received: by mail-pg1-x544.google.com with SMTP id v23so3785184pgk.2
 for <qemu-arm@nongnu.org>; Sat, 15 Feb 2020 18:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RNSvFQNS6khDxcyYYx/hbK0MPNTtxC3ryau1m/kEWlA=;
 b=y41fwhPsUwUW5eqG4sNA8xTpJhOf1A71K77jaehZqm+KZP9xlr6WiXHJ0jsGfHfOZ3
 Nk5WVTERORPZgTGB28FWqwoIZKOZEUm1XKvrQQdKWhexmtHejq3XK4j3vWHaUXKEkfu0
 PKP0K5ks+0nBsEl9tuGCda8ai0kqM2Hnz8xniWgXP+V+CK1iFIN1VBgVDsARbeAKfOD0
 Febykjjdz5LveVXKTnOQhvtzcHdLLhrsmKZCE7rrhBtzVvKl0vB7BSBg4raxnTAMK+yc
 9mXLVT64GK8NJcP0PX6hBdUYnz8+MoKStzcbUsb5bGa0qjjt933wbOAUBJDOGDkIcjgC
 3gig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RNSvFQNS6khDxcyYYx/hbK0MPNTtxC3ryau1m/kEWlA=;
 b=Rfa7wvpkO2q9lfG27q7nxkvPTyx1OvTqu50V+3shN3RZfCfFzr3zFWo4pDZ/Rcw00U
 DNiEP+VLXZUw+SJGaG5iPXLJvvvKQHjMSEEeiDua62arQkTEm5MvDAv24qp0AaeaCl5U
 oKNeFQX/R7Jvb2uaAluNLnehyMWS2+Kzj9p18XjkuK2AE13bP0TQl5UZ+nndqtgbsEP7
 6zvyGd7faZL/pU08BYmM2wmAbNNDKdCir59BNTcnXQoYDoUyAc2JJggRCGC8Gv9/XGbV
 EI27WNYrh0CKYsQ98Z3Btf/W7n1DtBG3yVI2EgeRgRyicYwub4Kh2B27jv2TSQiZuSAk
 49mg==
X-Gm-Message-State: APjAAAWHlyHs7BqoSBBBVhrb+KwpgovSen8vNGhGg5kQZFyRLNcmtiA0
 rfroEheJq8manRwfifjxuAKiRA==
X-Received: by 2002:a63:9313:: with SMTP id b19mr10636833pge.273.1581819545123; 
 Sat, 15 Feb 2020 18:19:05 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 f81sm11394664pfa.118.2020.02.15.18.19.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Feb 2020 18:19:04 -0800 (PST)
Subject: Re: [PATCH 02/12] hw/arm/raspi: Avoid using TypeInfo::class_data
 pointer
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200215191543.3235-1-f4bug@amsat.org>
 <20200215191543.3235-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d70ec2a2-af21-7400-c1a7-21dc872cb5f3@linaro.org>
Date: Sat, 15 Feb 2020 18:19:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200215191543.3235-3-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4+LrTickzw5i

On 2/15/20 11:15 AM, Philippe Mathieu-Daudé wrote:
> Using class_data pointer to create a MachineClass is not
> the recommended way anymore. The correct way is to open-code
> the MachineClass::fields in the class_init() method.
> 
> This partly reverts commit a03bde3674e.
> 
> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/raspi.c | 32 ++++++++++++++++++++++----------
>  1 file changed, 22 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
