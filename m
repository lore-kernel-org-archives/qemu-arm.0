Received: by 2002:a05:7022:6a3:b0:92:a90b:6588 with SMTP id y35csp3714630dly;
        Tue, 28 Jan 2025 23:37:33 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWrrNAuclYhQbjSgMDY/lUZ7IXov5i/824Fr4fmon9s6OyHAfSFvjE42hm08mmEWGBzoWDrLSif+s0xpg==@linaro.org
X-Google-Smtp-Source: AGHT+IFFOWioEyySKLXUIeSohe2X7RA8MWLpcHUGLT7BcBDWAma+J9N/3jeQ7vGeaLn5suBmdDLT
X-Received: by 2002:ac8:57cf:0:b0:467:79b4:a103 with SMTP id d75a77b69052e-46fd0bda01emr29094281cf.51.1738136253680;
        Tue, 28 Jan 2025 23:37:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738136253; cv=none;
        d=google.com; s=arc-20240605;
        b=G4xVXsqHvyh58FE+wdcl0gcYbEIxZcr4MhteGbJc5+RkBiFt44u5XgFlYTMKcG34rE
         cPrQryXvUIkck/TTvOlOv3RvjN8WknZqtNJ6VIms9CsiFi8KaKHRLiRKAXQKX38gvY4H
         0buQGjzriP0kmW0w5hh382kfzuGSlhlM6Mh91dvssMo6BSfGjIWUdMt96DuUoS4pSvJi
         Jh+2zusK3L5LV9GOaJzoFedvGjpxE3WXAIZkJ/t6Pwl0NkPjssF2W2Gpybcpb32IhOQU
         YCHpCdgwNEI/KkPo0ZAb8xfCaSO8vZ/aucg7In6WBFCbvtoymiyXxsIgumzGeOr3EaNu
         fTdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/vGaMm1E5Xy7WsML1MCY3mqlHDi6fi4haF/kV5UQOqA=;
        fh=UFpL0LYzzVso8waoS46SaHaLaOH8G5gTeikqhvkA0j4=;
        b=ggnImgsopxHXLXEMSOCUmPNdqmNsvPRDd8lCTGxRnnrd/ng+n+UwFRNhkEJyKt422u
         Z4XnXmfrgPl7Bt6e+IDFCoSlIRpU8OQbwd5nCs9r0vgaJ+Q6ueC6PfL3IJCjbQGpUFrJ
         8y153+araY08Eu4cgBf0RW4mMJr1UcYqRXQ1bHIrgVgA2GaYPLBaHfSKi1uyft0TAX9r
         m0rfCisrWKxRdrodZSLjShJbDa1fM6SW/VFyOJ2AvAOrW4abQuKdFj5T9W+jrNbt/KIU
         MHbE1FF5fjitzmiIJ3eSDWWto1dywp3rxQra8uBjhm88/Wk9pxPLUnRb9EPH8l6JE+C/
         6aoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cbHun0Sw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66bca08bsi31313961cf.641.2025.01.28.23.37.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jan 2025 23:37:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cbHun0Sw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1td2dL-0000ce-7B; Wed, 29 Jan 2025 02:37:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1td2dD-0000bq-6p
 for qemu-arm@nongnu.org; Wed, 29 Jan 2025 02:37:03 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1td2dA-0005aV-NO
 for qemu-arm@nongnu.org; Wed, 29 Jan 2025 02:37:02 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385f07cd1a4so6266124f8f.1
 for <qemu-arm@nongnu.org>; Tue, 28 Jan 2025 23:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738136219; x=1738741019; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/vGaMm1E5Xy7WsML1MCY3mqlHDi6fi4haF/kV5UQOqA=;
 b=cbHun0SwvNS8jNLkTSkYVbsxa9JgpaTdFfPczr21v96S0smxcJvPE8rQ7d7z4gkLlw
 CN+nNKqk3cXqgmWI0JGM3tTlm3RW4SKCmUCmhCFCqZ1pR+Ad7TuH/mpE+yMcJBw2GuBF
 v7v591R+ypLelB/bwWyFsIo1E5sHTSo9JxJblYiPKDImR8DYHzU0mZsbv+WR0cFPnVrA
 gmfVKyf9RuqlwJaRD+BkvaVzRTXgKHdZNcqY6zsUBHDYa2vudiBJ4M8LH3mW4rYxETzN
 AyRvbMm8db0XkSPZaTjpDUUawhTkZfeM/TpGkjkAGPNE/GE4Ttu988RWRyZB7RBgsHnU
 PaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738136219; x=1738741019;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/vGaMm1E5Xy7WsML1MCY3mqlHDi6fi4haF/kV5UQOqA=;
 b=PhOlaT1YBaPtn87NRp9mu/WG18hneDoeH4m3KHwlw4b+wxUCkeOTvmnq1U+fklA/Nh
 gkmvuyGAwjkOqGrx6H/Oj1ZmciN43fxVjllq0WZcaxX1RabITDuG6km8WAfV+XeaxGtx
 cMZQzxNqqh3fFAC4aekqqJxbrmqyH/IfYl3LXDQKh/IorX/JEryYdE7VZQn4/VghgNYG
 RD5ilLBVVR2KJwxv8oFXIQHgc7ZEO4uzQanYsVFjvFWe/itMQmGKzSVSjwuMoQcAnPHk
 NpvU3joc0lYt3gNiWGCJJUcy95axoosFRjnJK/AgQoQbAeZGxrEvVRFXZkC30CzSXFDp
 b6ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6Qq1ElymB+szzy8Jk1DOtWamDT4NM9kMpf3O15XwU+X3qRLstqZNhgekA+JG+9sbPIFZxIvxYhg==@nongnu.org
X-Gm-Message-State: AOJu0YwCPF58yDnV1lvqp4KkMXiw99q5VTmac/CbZt+AC6aAl8p8xgYe
 S9KY9woGt+knN5eIlG5/LI2lUPZnZdARcOJtTC0rQbqSI5DEzzpPEG3tvoxemoo=
X-Gm-Gg: ASbGncu97Jg8dtDguJnHTaU3Tz5XXWUEPN2SEnEQy6KmeQbUvVk+1SitaNPbSZeBoQd
 j2Y0krnNgw75foIAzrIOAaZRrtwnyQGxqWafvXCv7X4NFbgIV/Z2RWVy0AWSP8fKnuxMoAXyzC4
 0eWQyygGxqRWLJuXHcAK32LT/sHrXzsNIMxF2zE7HKwONriGEEKB9DzKygmbzcEbu6FWzYZ0Ug9
 VWSSZ/8H3/jrVOYz/O6xepb93ujnMrGBxvfYIT2oGk/nuRDXcmz8gGkzhjku2PCJhzo1bBcPQUW
 OY9Gs2/C0y+Ccykh2xfdoTpoRponhuWPWvvLtCPVBImVuelp6fBDpClFYWE=
X-Received: by 2002:a5d:6d0f:0:b0:385:d852:29ed with SMTP id
 ffacd0b85a97d-38c51e8de58mr1367157f8f.36.1738136218791; 
 Tue, 28 Jan 2025 23:36:58 -0800 (PST)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a1bb0d4sm16554121f8f.69.2025.01.28.23.36.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jan 2025 23:36:58 -0800 (PST)
Message-ID: <89f5b481-2bcb-45ec-a180-349431838fc4@linaro.org>
Date: Wed, 29 Jan 2025 08:36:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/11] hw/sd: Remove unused 'enable' method from
 SDCardClass
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Bin Meng <bmeng.cn@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
References: <20250128104519.3981448-1-peter.maydell@linaro.org>
 <20250128104519.3981448-10-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250128104519.3981448-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wIvWgH8rDdC7

On 28/1/25 11:45, Peter Maydell wrote:
> The SDCardClass has an 'enable' method, but nothing actually invokes it.
> The underlying implementation is sd_enable(), which is documented
> in sdcard_legacy.h as something that should not be used and was only
> present for the benefit of the now-removed nseries boards. Unlike
> all the other method pointers in SDCardClass, this one doesn't have
> an sdbus_foo() function wrapper in hw/sd/core.c.

See commit c759a790b67 :)

commit c759a790b672b0c5bfc50520dcc93565b55732b3
Author: Peter Maydell <peter.maydell@linaro.org>
Date:   Thu Feb 18 14:16:18 2016 +0000

     hw/sd: Add QOM bus which SD cards plug in to

     Add a QOM bus for SD cards to plug in to.

     Note that since sd_enable() is used only by one board and there
     only as part of a broken implementation, we do not provide it in
     the SDBus API (but instead add a warning comment about the old
     function). Whoever converts OMAP and the nseries boards to QOM
     will need to either implement the card switch properly or move
     the enable hack into the OMAP MMC controller model.

> 
> Remove the unused method.

Never used, indeed.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/sd/sd.h | 1 -
>   hw/sd/sd.c         | 1 -
>   2 files changed, 2 deletions(-)

