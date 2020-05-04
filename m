Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp654103lfb;
        Mon, 4 May 2020 10:16:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypKGSq+ucgyn8Xt7BsZPRWA5Pi0NdMae+ODenxhcqE+a1H6gSuiKY+/YolxEn3seIXdDE/Qu
X-Received: by 2002:a0c:e549:: with SMTP id n9mr124832qvm.214.1588612569525;
        Mon, 04 May 2020 10:16:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588612569; cv=none;
        d=google.com; s=arc-20160816;
        b=PThLlnmD81C2qk99EWnYdSGWsBClFjlEn+feS5wvyjGyhPlWZWb7TE3CF60CBEXYWj
         F4nv6fDuhglV1CUBKm0GQsabSkDNWEnbbChymDu+L5F9pQawbZzFGh4WDrFQVugQG/86
         /WX1Hi378Vq0FjyelhwBt8GHBgPI2DMzzx7kDewZv2t7xzqCtUG9JBJlLOVCHlUetRT/
         IO0F8Elnk9WU/RonlGOJ96+/QMJL1E/8zst78VzYRzFf+qj7+aKZ/EPuTiQIDaLaoaL7
         vJkd8bglSMRUlI4cG4oCUA482s9GHtEsRcHjKKP7EXpwUGwyA3tejH042smjgSrtdHVk
         YXKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sBLCI6nEW0dUNcKWczodpz/DiWKJZFV/uwknmjUsMqY=;
        b=ebGLCy7be2n3ge/p21Uey+riaRtJ9xhwQLpute5xXyl9oJUvl3JBm6i+Ck+jMtw46e
         D8eeYYR5bqP0YnHmYPqkaUBHhPuoGugyMVmcsgKbnGlpRmvqD8eVdpJ5tlcvUmx6dJas
         9lCFKoFp/GTjRaMjQc1UDBLNXQdLxiUrMIVE7XYU5J1hD7h/+T3HPMPa6it8DAVx7h+L
         h22Gkc+SDJVWLyYga7kKTlEyk0kScgapByWE0hh2ppTkPE6pGmIuiFOYnKlhyYKfjtN/
         kOgU3M2GBsEMGSk4VFhRBEYMI792PVjoTHjjkjnF/mX2dlT84+uNUBlCg9u+C4mwQU3N
         oQNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=esu2XEHm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id d47si6714824qtk.64.2020.05.04.10.16.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 10:16:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=esu2XEHm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVehM-00073k-Tl
	for alex.bennee@linaro.org; Mon, 04 May 2020 13:16:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVehA-000710-P5
 for qemu-arm@nongnu.org; Mon, 04 May 2020 13:15:56 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:36403)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jVeh9-0002XM-7T
 for qemu-arm@nongnu.org; Mon, 04 May 2020 13:15:56 -0400
Received: by mail-pj1-x1044.google.com with SMTP id a31so166987pje.1
 for <qemu-arm@nongnu.org>; Mon, 04 May 2020 10:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sBLCI6nEW0dUNcKWczodpz/DiWKJZFV/uwknmjUsMqY=;
 b=esu2XEHmC9aZtS6iqfRY77bVexSUArPurl4OGpJWWCyljRcdodDr+ya/P4rtbDQC+g
 ewgwd2VNCPsEApX/X/g7Fr0COqkJaXKgJTKOKrzADOSDGCIg5/YncOUxgSUGtbRzLtvI
 YyRRvjDjhlLcnGiQImtm6hiq+EJwDpoASk/cyFbY0d1L+yxJDLMrAb1AgQiqjOiSVA80
 Z+mPlsXs0rpXtpDVb6DAQXj++SY164IFT4SU4kXU+yA8E0ooCHpol/i8CCjvh7ExA1S0
 WXym/6hEMIsIJsN8docs+VNsal/J6Dxu2iUKgmxGjBfmWEvrOZJWqqqlDOvY+rDnfWpD
 W/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sBLCI6nEW0dUNcKWczodpz/DiWKJZFV/uwknmjUsMqY=;
 b=uQ8RCJNBaJdGmIRYZPeMkYiIn/YLPrxvDZ8uEhjOz5416YcY2ZMUurUe9CXu00nmWN
 jMKQ6V1zf3JR9bfsRXik9cJeHCqFFvTwH8hQYYf+mCEhsyoiVlZmkiYzw1mplA636ZhA
 ADG5rSaKIpEzsE8mJn88F7Fd8n/1r+OwHfFRUjVJN6+Q69MvE2nLFI1CC8SGktoNxVV1
 llQseJEdctKRW9GeVTx31UiPBbe+GKBrXIm+roXXsCinjcF6vRa5eCTULYfaLOKEE2PL
 apC6FSYlloq5HBbTNPeYOIjYgFcerkxYYt8MsegeFkOMqPt3QoSAcytuzkFCoIgYz4w0
 WAHg==
X-Gm-Message-State: AGi0PuYiVgC+gdIfLlqDt06iTlieOLh5t8RwFNkC3VV8aaZu0TyzcVoJ
 uQZxQZHcrFQINUQMS/ow+6SN3w==
X-Received: by 2002:a17:90a:930c:: with SMTP id p12mr16306pjo.64.1588612553565; 
 Mon, 04 May 2020 10:15:53 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id i15sm9233452pfo.195.2020.05.04.10.15.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 10:15:52 -0700 (PDT)
Subject: Re: [PATCH 3/4] hw/timer/nrf51_timer: Display timer ID in trace events
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200504072822.18799-1-f4bug@amsat.org>
 <20200504072822.18799-4-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <26cda513-a17d-3c1d-e8c0-99c1f3b0583f@linaro.org>
Date: Mon, 4 May 2020 10:15:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200504072822.18799-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
 =?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>,
 qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JopTpbabXGLN

On 5/4/20 12:28 AM, Philippe Mathieu-Daudé wrote:
> The NRF51 series SoC have 3 timer peripherals, each having
> 4 counters. To help differentiate which peripheral is accessed,
> display the timer ID in the trace events.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  include/hw/timer/nrf51_timer.h |  1 +
>  hw/arm/nrf51_soc.c             |  5 +++++
>  hw/timer/nrf51_timer.c         | 11 +++++++++--
>  hw/timer/trace-events          |  4 ++--
>  4 files changed, 17 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

