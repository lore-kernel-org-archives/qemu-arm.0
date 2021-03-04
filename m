Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5877732lfg;
        Wed, 3 Mar 2021 18:50:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyh2mtG1I1TIwzJl56Gm3Fjvg/r7wJNK5CXwBu6WaTTse4bjz2CcnqahdVNDTudz/kme5mG
X-Received: by 2002:a5d:8552:: with SMTP id b18mr1929114ios.124.1614826218752;
        Wed, 03 Mar 2021 18:50:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614826218; cv=none;
        d=google.com; s=arc-20160816;
        b=zQNvGp1st+agmHUztXretnRJZL8YzPzzMxx5ABnI3/eNv7JOfrPIohvyi/2qoOb3YT
         ElAVG2eGuH7KLLWwl8TJHEsx51WQ+4sRLMFQ7T9wlWJdn5X5Led4BOcFnLQsq4UBA8os
         oztGSqA5nzcmlqQooaxPG+d99BKPOgvRaJbr8qjSAXW1IDhixYNR1oI+CrbITypW5g7y
         V44y7f9jaXBAhj+J+sqpyKO+bftNq3eFL/VN6JCkvMe7XPyrpc/SC31b/D2ay2FxLHrf
         aiqyNlJBFFQFcoqShcxjEU0zZ5lbDre66DhaHKpowh9Ic7aCow0Hv3Erm6/UnWYrYKX1
         M+SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=adOmbQ+JsCCeqaRqw8hd2Cg/83hOgFoi1nQAgMXIr2s=;
        b=GGKwxdkXaSUMSPvv4vF1lCeNHKS0u34k4M5XOvcSmjBf5e3wP4NajVkIZ/l2MSfHTW
         SLgaYPb7KTNFP428BoWD4WC6FhGiBLMyqQsv4WuC2/V3teths1mWs65YDXj348vBeg+B
         l0zQobVIDa28EzdKUgZ8IkNgozoziCqZZ8sl15+RnaIkfI+vTPDUa7i0SL7VFxVEkw8h
         E71/g4aqkAzL8UFgnMXFZJVTZPN0QXYoaOCYmP/LUaOD+/ne0Q8P0qpycPF0v+h4Fk3p
         7NjRfCh7nib21qZzr92d+84ppM6NQaUT1c31HULlDr4QxHxc9iQKAeEvJc9aaDAf+VkX
         wwQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zIPR5cGu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v28si13376347jah.86.2021.03.03.18.50.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 18:50:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zIPR5cGu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHe4A-0001vT-2U
	for alex.bennee@linaro.org; Wed, 03 Mar 2021 21:50:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHe42-0001uI-8y
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 21:50:10 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:39119)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHe3z-0007ta-Rx
 for qemu-arm@nongnu.org; Wed, 03 Mar 2021 21:50:10 -0500
Received: by mail-pl1-x633.google.com with SMTP id j6so1725478plx.6
 for <qemu-arm@nongnu.org>; Wed, 03 Mar 2021 18:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=adOmbQ+JsCCeqaRqw8hd2Cg/83hOgFoi1nQAgMXIr2s=;
 b=zIPR5cGuxI6DYUQfpagPFWLZrm6FKLbRZMhNo5rPx1lZClWZ6OkRG1W6l/jycAHlI+
 OPJCWvrcJdMZpc3uxwcyhVnPeeudvb5n/hyayjulNPfLtnTV4XhiwMDX8IJX7A1X+CoT
 AAfLShsr+LxDobBS+VjTCvRtl+58CIdmk5okclo9rGJVBOKyDPrErVVe9O1iDgT3BnHg
 +oyf2yHCdpCGyvpLgxd2VoY7najQe6mozdh66uBx9JkIh1kNY0xPKA8A4U5TIW9rpi7t
 WcacQskGlZR/86A7kALc9iYRYG94xsmzONyRtvFbpeuw5ZIhmYFhHTop0AqmYtOswtwt
 Fx3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=adOmbQ+JsCCeqaRqw8hd2Cg/83hOgFoi1nQAgMXIr2s=;
 b=kUj5nHN9m7RlUN0neJohv3yh01KrbwE5QhRL1P+VfW/CZujQ9vjPSn8SWOLkFWN1Bs
 lTgXiy7wmALEMokPvzkYk1wVg7Db3io8pisCQK4wc8xOJlFceCwIchiaEoLw5zysLz9D
 b8PLEb2DNshPVdP5oz3GkZEwkFX0saZP4SHU27s9cFr7oiOArZIFuz2qc8g+VZlLMAuG
 HOwwa2yUaOfG1ngbb//NkmRj04N/GY/R763bZeVoeWT5vB9t6VyA8X7obVLXse5fYgzF
 gPurgkXe83pkMKvwgV+jJ6cI8b83InpnaicoBejNEjnSCrX6PHe+hPFjPR5mijdT7Utc
 9oyg==
X-Gm-Message-State: AOAM5325K8UbB2m1y0U6mCpMCY47s7YxXDoj7HF+KG4UHkeHGNMWHgpF
 fRtautrPyLn2sNsFDv/pstW09A==
X-Received: by 2002:a17:902:d346:b029:e4:c35b:dc0a with SMTP id
 l6-20020a170902d346b02900e4c35bdc0amr1982087plk.75.1614826206321; 
 Wed, 03 Mar 2021 18:50:06 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id c193sm426176pfc.180.2021.03.03.18.50.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 18:50:05 -0800 (PST)
Subject: Re: [PATCH 01/44] clock: Add ClockEvent parameter to callbacks
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210219144617.4782-1-peter.maydell@linaro.org>
 <20210219144617.4782-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <592e47e0-6148-9a73-4397-0e30e12d5409@linaro.org>
Date: Wed, 3 Mar 2021 18:50:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210219144617.4782-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fT4NzlVj2gZ5

On 2/19/21 6:45 AM, Peter Maydell wrote:
> The Clock framework allows users to specify a callback which is
> called after the clock's period has been updated.  Some users need to
> also have a callback which is called before the clock period is
> updated.
> 
> As the first step in adding support for notifying Clock users on
> pre-update events, add an argument to the ClockCallback to specify
> what event is being notified, and add an argument to the various
> functions for registering a callback to specify which events are
> of interest to that callback.
> 
> Note that the documentation update renders correct the previously
> incorrect claim in 'Adding a new clock' that callbacks "will be
> explained in a following section".
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Reviewed-by: Luc Michel<luc@lmichel.fr>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

