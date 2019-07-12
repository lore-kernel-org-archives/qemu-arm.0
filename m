Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp936484wrv;
        Fri, 12 Jul 2019 06:58:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzuujVsfTIVrLfKxCw8uAwl2dTYC8iJGgoxVUoCSFz6dyEbiUIOq/1ydaYFVDCBRYKIU6KN
X-Received: by 2002:a17:906:4d19:: with SMTP id r25mr8238218eju.125.1562939935680;
        Fri, 12 Jul 2019 06:58:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562939935; cv=none;
        d=google.com; s=arc-20160816;
        b=JcsD0NOD5gCf8NJEzGo9ho1I23iiRCOCkBURLqcBQ3VdQWb5I/p0D72ot6YE9N+Pe8
         75uVlP1VirvimQ+Pgrs2LGcVFLhHZw0MrkmARkdEnEMHUqhqPbKaT2FoW0IzIyEC5Bto
         aN6dW1lMkB6mBKfLKOj0lZeNkwQqmu3QNCeKVuK/AiH/lCzEl9Q9/3T1owT3+9CmxP1a
         /1ljATFhzuUzmoZaRHjUKGDNzH14fgtud8/q055H857dDBYPU7+uOazPyGvyZvn0/OlJ
         V139SUKADOR4rD6dPhEhMPG0VaUvU7ReiKyylkD/gZ5Am86DqO100cft/KUmlWkxAz/L
         9sFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=rNwCNC+10yBlH4kZSa0yz2zQiOhFu6g5HiGNj7NQhQI=;
        b=WrWdBMEXWd79VWKF0L9Y8vY4KNk9wYMu3yeA9BFXQpKuLnwIynnzLmOsXtvD08Fd/m
         OnjEDkL0qiQ470wRYGefx2GY5c+Ip17wK9mSUFrAK8gdYxiqYbxkMppCRZDy2lNGCtvb
         Tsv/hrBrttQRGKDFI/vCvlTgZB1Vsc2EyBRRVY8+KS8aOmIy6J3i/WK7publqegRLmcZ
         RXDU0uKYf/oAhLfK4ht5ancows9NnapZlySCcBojBL67yenTBDpLgPCExDQXzV2MpcFg
         1sX10G49kZJp6A+F/6J385/3Rm2yXIWUhlDt0ARYxwLI3nGTLIn2b0VPpbdOggzZUUOq
         Aq0A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e26si5274365edq.401.2019.07.12.06.58.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2019 06:58:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlw4c-0000nL-Al
	for alex.bennee@linaro.org; Fri, 12 Jul 2019 09:58:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34147)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hlw4X-0000gq-Jk
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 09:58:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hlw4V-0006cn-La
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 09:58:48 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39651)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hlw4T-0006ZP-IE
 for qemu-arm@nongnu.org; Fri, 12 Jul 2019 09:58:45 -0400
Received: by mail-wm1-f67.google.com with SMTP id z23so4863599wma.4
 for <qemu-arm@nongnu.org>; Fri, 12 Jul 2019 06:58:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rNwCNC+10yBlH4kZSa0yz2zQiOhFu6g5HiGNj7NQhQI=;
 b=NZnMhLn2C0mShvLJI3pWsjEgfINdotJcTN6sKgeqm3CUiwQT98Z7/OE15GS6cScNGL
 OJv0nXYLZTdrGpSu5I7dAR0ij3RAbBXxM8xn0RkpU6B8exmbZUkINg94PPgOm8RsWmkm
 uK2Hi/EzEsVmSvgS2+Ji8nwuRlipLfi7LjJDJddMNCuiZN1KX5oPVVuYLuNk8xkRWuiR
 Basd5ur2/eHTcw4FLnRE2Tb1OIkzoFBUqOlUEp8UODK4skMp181pL72/KwyEH4zScuoW
 rajDg0a9PV0u01EqMfON1cgwNy1IMeUOQ58rt0EHL4cO7S0FYxtYiex0I7a5kuYwEu0Q
 HzoQ==
X-Gm-Message-State: APjAAAVsZUeEnUH9nKgRENKJLsg362CUoQvmtlU/ho/eyUqsS4ohPoUc
 OXIHiRbPC0BVTyM3nRWEMEqQzg==
X-Received: by 2002:a1c:a8d7:: with SMTP id r206mr10025266wme.47.1562939923853; 
 Fri, 12 Jul 2019 06:58:43 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d066:6881:ec69:75ab?
 ([2001:b07:6468:f312:d066:6881:ec69:75ab])
 by smtp.gmail.com with ESMTPSA id a84sm9230592wmf.29.2019.07.12.06.58.42
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Jul 2019 06:58:43 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190712133928.21394-1-philmd@redhat.com>
 <20190712133928.21394-3-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <64a41af4-e635-06e3-05a2-d2cddaf02af0@redhat.com>
Date: Fri, 12 Jul 2019 15:58:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712133928.21394-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [PATCH-for-4.1 2/7] hw/usb: Bluetooth HCI USB
 depends on USB & BLUETOOTH
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
Cc: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Miroslav Rezanina <mrezanin@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BfwB5qnNefEk

On 12/07/19 15:39, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/usb/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/usb/Kconfig b/hw/usb/Kconfig
> index 564305e283..1b435ec002 100644
> --- a/hw/usb/Kconfig
> +++ b/hw/usb/Kconfig
> @@ -82,7 +82,7 @@ config USB_NETWORK
>  config USB_BLUETOOTH
>      bool
>      default y
> -    depends on USB
> +    depends on USB && BLUETOOTH
>  
>  config USB_SMARTCARD
>      bool
> 

Shouldn't it select BLUETOOTH instead?

Paolo
