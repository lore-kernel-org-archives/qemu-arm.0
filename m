Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49CAFFAD3E7
	for <qemu-arm@archiver.kernel.org>; Thu, 23 Apr 2026 02:34:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wFjtY-0006dw-LP; Wed, 22 Apr 2026 22:34:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFjtS-0006cx-9B
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 22:34:19 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wFjtP-0003w6-RX
 for qemu-arm@nongnu.org; Wed, 22 Apr 2026 22:34:18 -0400
Received: by mail-qk1-x731.google.com with SMTP id
 af79cd13be357-8d65f4073bfso831195285a.3
 for <qemu-arm@nongnu.org>; Wed, 22 Apr 2026 19:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776911655; x=1777516455; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7N1yxP0ugoI/czZkRB+lq8izLlAsBvpk267EVYHGkSM=;
 b=jwvLzf0nzFz9zZ9eHsQi7g6qWdj6UTg7iwoYLnCrqEkro+zsdSuVRsO2lH6HBD+bD3
 XF/wX5ppczXTuCWcONeoxbi2VHU7Z1QEYM2KftSnOtLGWm/DcHrHOeJeozfoodUhgNM0
 ACJDBS5mH3TNvFvF5EfIYjU2rAg7frJUNc1Ag0NgW/c5Z4rMbIU3nM2ey6ZhnRNy4wdY
 qcY0oqT3l2ZTCNIHJu2EbDCJ09JnPnMN9UkdmpWMqZf4XkYJbpsS2bF2ww7TVc9T732C
 1sURx/ANzkR//XpU0OVa6DHabtiLpAw2dV7JMmlxNA15N/ALsUT0Rf2pMf1JlBv+WxGN
 5BNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776911655; x=1777516455;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7N1yxP0ugoI/czZkRB+lq8izLlAsBvpk267EVYHGkSM=;
 b=CJp1Jo13Izn5JImVm9h31/yv6KeHPf9QKHlFTt6EvcnVWxCSVRvsWFrFvYIwDjxqgL
 RR7Lu3YrcY5HD9CcrVwwNqqKa2skqNEbKLzPD7Ng1WmRaCPBj52HpXmYyRNi6GZH/13B
 44ixot03ks4mFvncxr8zBhadtF3MaYVEVoGWLtbBleOdGl5ODoqNJsLqfsPSpJKZ5mFK
 joV6Q2d/yicAJ3WCgWunsVZ5Q4iPBDaOgGryEbVid2ybWCpCZsNQnOcoFv5dHaITbFE7
 84/MDltcdGbVsYwqPjQWz4sBR+s83m5Jqy6snA4y85rIlITLN152Irm/2za/Y70UPM3h
 6jbA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9TyLK+3y2rQaWhEw7rmIQv7uCUzogb/wa8oTXPx+RWBJr2paxhrJUnlbIyLzIoNodUYtg1Lkshnw==@nongnu.org
X-Gm-Message-State: AOJu0YzARX5YZEsNGIE09p6RMUIF/m4O6nKzQDgJ5oI3j5ji7UZQ8H3i
 /pE1p5cpZic3HUbEBkNT3rcvGp9nXI1p4YCYB04TNY4IAy1a1/2gGm6ox7/CApN3DrE=
X-Gm-Gg: AeBDiesQLl0erx0dM4o9QdGaNP6xgvAk8pCCAPU6cIfwBbYE33eRvuQRdB8GDK+FYzy
 zcyDCZukgWpY/fctQcqM9NW2tQ0rWE+CnOHXIVNbSVyiLpwPp6QE/UIXPQLs4yOeyR0YgA9DzxU
 xcrLxFODtB9dBQHmyn6TXRQ3JvGWFcy5q/NTFJasLAhi/0J/zBykS0Z5HqO92oXnDXoZNq77yeJ
 5AjLXkdk9k5IBreH61BGNg/odGwCkYh8HHVXJy29TneJXKyxUUzite/1g9fuJkHaAVniDhVegzq
 U+xtRSljaE0un/hfB4yoXzc7YBLvKo4Hl0kuhEt8c00slo0nWc9rtnHQlqoj8ml7mpGe1Cj+5t4
 LZSl2QMPFxsJCn74VTDVtDrN/Zcg+vlcFFhPWVkw28Sot6bNvYbGDpIGj6VxamVOy2A+G/+gXG5
 N73yZkuU9IX79KTGS3ibJHOSO0mj8ZnlDTz3+oljTadplMpa0aS5Mg/XJyBzpQoRWssgRbYEdq+
 bBv/eeu3JzV9HpIUCkbBT1nuQeWHkPA7GusFPY=
X-Received: by 2002:a05:620a:7102:b0:8bb:ac44:bd3c with SMTP id
 af79cd13be357-8e791d89af1mr3530398785a.52.1776911654668; 
 Wed, 22 Apr 2026 19:34:14 -0700 (PDT)
Received: from [10.72.56.227] ([172.59.184.224])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8e7d98c15a9sm1695571185a.43.2026.04.22.19.34.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2026 19:34:12 -0700 (PDT)
Message-ID: <11414183-9725-400a-8e49-cc7c3a559842@linaro.org>
Date: Thu, 23 Apr 2026 12:34:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/17] target: Rename cpu_get_phys_page_{,attrs_}debug
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260417173105.1648172-1-peter.maydell@linaro.org>
 <20260417173105.1648172-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260417173105.1648172-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 4/18/26 03:30, Peter Maydell wrote:
> Rename cpu_phys_page_debug() and cpu_phys_page_attrs_debug() to
> cpu_phys_addr_debug() and cpu_phys_addr_attrs_debug().
> 
> Commit created with:
>   sed -i -e 's/cpu_get_phys_page_debug/cpu_get_phys_addr_debug/g;s/cpu_get_phys_page_attrs_debug/cpu_get_phys_addr_attrs_debug/g' $(git grep -l cpu_get_phys_page)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/core/cpu-system.c        | 6 +++---
>   hw/i386/vapic.c             | 4 ++--
>   hw/xtensa/sim.c             | 2 +-
>   hw/xtensa/xtfpga.c          | 2 +-
>   include/hw/core/cpu.h       | 8 ++++----
>   monitor/hmp-cmds.c          | 2 +-
>   plugins/api.c               | 2 +-
>   system/physmem.c            | 2 +-
>   target/sparc/mmu_helper.c   | 6 +++---
>   target/xtensa/xtensa-semi.c | 2 +-
>   10 files changed, 18 insertions(+), 18 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

