Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2890381wrv;
        Sun, 14 Jul 2019 04:04:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5k7d9B/ZYImlFDbStEQ8O1Sgc8xP2112yvkLZD/xFefCtf0fl+tr5YbRTnI/rJLai6N7a
X-Received: by 2002:a50:97ac:: with SMTP id e41mr17932294edb.27.1563102263108;
        Sun, 14 Jul 2019 04:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563102263; cv=none;
        d=google.com; s=arc-20160816;
        b=d4F1xge7Fy6o6dp58AMW1sCKyvt28UgvTZlI/2jJqpd/kB9tH2d6fAvHcRFZWqvpBR
         XwxZxa5vk6c8fOIvXxCeaj8hHUghwlvhA/WwpFUsV/7OvbdP7EVlz3Rksr9TBJ3AP6f/
         0wuu28kYK0O9bGKuJ2zuJ4EYcHXkPLFvs/wes6V/Lb8cC1MUxJlrhTxu0p1tkmNFyRTJ
         njbapW1bvo/F1wZs7Bv5EgVTzh1nVmLePOwORzuilwQ5FR76qbTZVNMMVhV97LSOcw0U
         OHCNp97l6n9T0ffF5Tv9yQ0RiPnkdPU40RZAgRwXJchW69EBJRa5zNAXafXK+RloOiwc
         5RQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=IJCgDVhxiseY7XWwBmZ27J/5fYQgLDVWtvomA/EQ0K0=;
        b=YrAe5fiKP0gpHNIA/1ioVMFvov2rF/mxPiEUL/QYYg5LblM7pYrd1WBJQ9hICaKoqe
         UDBQCjIMb411n+45+EMV3P+VlEC7woeQCYwnjR2bI/6eT6p0bQKFTum+t4PuxsxkQ8Mr
         LqD9KhBnncfpjb/+W5IQE9E3KT8EMfMpgzeSfsF9YWWpoWahZWk499Bd0Ph3boctGe8K
         6o1wTMDfmp1RsxOsFoos7eMLMyvHbhbM3m87c/0zeCQdlAUConVUJEECFV6B/Ln124/P
         9wlrneLyAxZNnEzEAE4yxI1aZZlnBTQSsl5PWcFxappaGg+kWvE3GKQ/7UtMtqcDNSix
         5W+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YeOtU6cA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d33si9095041edb.194.2019.07.14.04.04.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 Jul 2019 04:04:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YeOtU6cA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hmcIn-0003PL-W7
	for alex.bennee@linaro.org; Sun, 14 Jul 2019 07:04:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58455)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hmcIj-0003N9-PY
 for qemu-arm@nongnu.org; Sun, 14 Jul 2019 07:04:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hmcIh-0001lw-Ph
 for qemu-arm@nongnu.org; Sun, 14 Jul 2019 07:04:17 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:40182)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hmcIg-0001jo-60
 for qemu-arm@nongnu.org; Sun, 14 Jul 2019 07:04:15 -0400
Received: by mail-wm1-x32b.google.com with SMTP id v19so12500064wmj.5
 for <qemu-arm@nongnu.org>; Sun, 14 Jul 2019 04:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=IJCgDVhxiseY7XWwBmZ27J/5fYQgLDVWtvomA/EQ0K0=;
 b=YeOtU6cA2y2JOd/+5MFMZ3OiSvWVSWFClQCuY60sLh5KeS7uiHiABJiNwFzKVJm27c
 eEtcINWdkx3KbFLwbLXeDsMQ54oPnCVlkZgNTOvMHuJ4ViA0/kJ7kmVMPZP5Fo98612c
 I6Z5UNmmobSJl2odHYx42hiuyBReYvb4nTzIYYzNRz2lu9qwLldinTcEX4QmzgZwqkPs
 eBGoS4IGgMK+tcncsi2/27X+fAnGlarcHazK8YOmH/idwp08ZcXOsgCv+425+chc8aT9
 5XuvuH2u+ItyeIzG2xEhA2tFD/tvHK9EBAdJr8asxPXC5o2qtIJcOfCkWyLVUufKXO6K
 yVsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=IJCgDVhxiseY7XWwBmZ27J/5fYQgLDVWtvomA/EQ0K0=;
 b=oXU3QdTpRIUUBRZLGEAKw9mDzz0KMXyuyPaUQZJzBzC01OKFZpEB0YOBULiEaksjCn
 NdOcbaPFTHJUCMrdQvk3NkJckXBm+mAAI21L6gvXrcWe1J9gg4rwSWezDj6sDAW9fkaC
 WO9fKgHj+yLNYINWcV8/1Qu5TcfBw8TRKWsTaAAx8e3Cb2hA3mf59zNpFUZ0iRjFscqI
 b7qK3JLRemz0z04jqcKTA8cfdpMG9cLqZDtYTbbTx12FCLvlSgP6l/MJEssQaamJQWMQ
 0hfHh1zBAuEKS8FAWwsL3gl9hW2XNE1RnNwCBMtyp2aJ3eZjEfNVMdOs7A0JaRpBGPm+
 oVyg==
X-Gm-Message-State: APjAAAX8HdTta6+fMegfw1t3QHvjJzhk2CurWoFCLoSNA6VxHUG6Mdz7
 jNcVWEvFzM15BqFZ5dXHt94RZQ==
X-Received: by 2002:a7b:cbcb:: with SMTP id n11mr18496347wmi.54.1563102251955; 
 Sun, 14 Jul 2019 04:04:11 -0700 (PDT)
Received: from [10.0.7.42] ([194.144.248.241])
 by smtp.gmail.com with ESMTPSA id z19sm9925584wmi.7.2019.07.14.04.04.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Jul 2019 04:04:11 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190712133928.21394-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <65921981-c235-d8ca-ce26-27e7ef03585e@linaro.org>
Date: Sun, 14 Jul 2019 13:04:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190712133928.21394-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32b
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH-for-4.1? 0/7] vl: Allow building
 with CONFIG_BLUETOOTH disabled
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Miroslav Rezanina <mrezanin@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jf7hXDXwsDD9

On 7/12/19 3:39 PM, Philippe Mathieu-Daudé wrote:
> A series of obvious patches to build without the deprecated
> bluetooth devices. Still worth for 4.1 or too late?
> It is clearly not a bugfix.
> 
> Regards,
> 
> Phil.
> 
> Philippe Mathieu-Daudé (7):
>   hw/arm: Nokia N-series tablet requires Bluetooth
>   hw/usb: Bluetooth HCI USB depends on USB & BLUETOOTH
>   MAINTAINERS: Add a Bluetooth entry
>   vl: Fix 'braces' coding style issues
>   vl: Use qemu_strtoi() instead of strtol()
>   vl: Extract bt_parse() into its own file
>   hw/bt: Allow building with CONFIG_BLUETOOTH disabled

All of this looks plausible to me to go along with the 4.1 deprecation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
