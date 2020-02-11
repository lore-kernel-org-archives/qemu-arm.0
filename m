Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5412722lfp;
        Tue, 11 Feb 2020 10:39:18 -0800 (PST)
X-Google-Smtp-Source: APXvYqwVeIyYBOLzRLEZInwjBrFNa4T1zgNDzOu1IM/zpG12MFTnLKnR+Ni5W6c1h+wV9FPcwwKz
X-Received: by 2002:a37:9407:: with SMTP id w7mr2262934qkd.55.1581446357955;
        Tue, 11 Feb 2020 10:39:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581446357; cv=none;
        d=google.com; s=arc-20160816;
        b=Y+Yv+HQ4+FwBd1GF4iTMLfgM9F2I12AetGQnHPTiKhDKgUezdTO7GIjWLWZQfybuGi
         eARVjBcJUC7Ajb96XiVd/SFQU2qURGYtn4Ka56RbsUMa+xfUplyI/AUlKH9eKlK47pd7
         SMNKtjKA30HPh8fp8kgY7pVZlPAHdxYDRNwOySr8WpWWj9j13fD8chzE6n1PgzF50wmg
         tgwxKTg7Gn4QYx+lHRGs2uRmotlaM4nDCjFPJ36EBloafe0ll78ElwDkQHw/RYb6RHvK
         NqkCbYWUw6x44jYou6oolffNa1m0eoX/pDfHkb+EnFgiP4SMAQI88olcmHglo/smhgt7
         lIyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bgRe39UrkcomXY7L1G7morRvB0wlq0CEf4d3hqQT3SM=;
        b=GHgBojy8OMB0v5FvF/NEcnjzb3JJtsGezOSQJ+w2OHJOP2tzquapoefm8wMcPkyKAQ
         H9SG4dV6/v0D+SFwMgejkP+Sel69HA+uXLQc94VWV1eyxvwDQP16NtRv4Vb6Bu4kjVry
         Lg0XT3/+HRmHpfbI6ZiQ+x/qcMWxEvfbW16lnWLmZTHoMxz5TIe0vVLky1CkKnDpZ5e0
         8THjBb0bHexqUIyO1UBelfxJFHAkn9hfDi5g9SOIZ6OhQnuge0dPXZrzZcrZsNSOhBp/
         tZGhpFO0z7v018mOvMdvKp4ewULthkojJmbQIRktgUxqzXUBnmfRmqpjQuCI9kTYuvZ0
         bd+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fPxw2c5l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r24si2206456qtt.184.2020.02.11.10.39.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 10:39:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fPxw2c5l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1aRJ-0000HW-0B
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 13:39:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37899)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1aQu-0000Fl-Jt
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:38:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1aQs-0007bM-5b
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:38:52 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:45271)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1aQj-0007UO-7T
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:38:45 -0500
Received: by mail-pl1-x644.google.com with SMTP id b22so4593317pls.12
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 10:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bgRe39UrkcomXY7L1G7morRvB0wlq0CEf4d3hqQT3SM=;
 b=fPxw2c5lGZAyzveefWmZxHefL+dty2md53xGCW1WYhSmfgT+sgxcF8NH0GPVL9tWhR
 T/VSenqLMI07/f4/AN7cR71g2y9UqpJLpSi3ixMbuhBEDdiAMrJSkbv0It+TaDE7mPKq
 KPnNhEFrqiVA5aOGPJAOiAySeoGFEoin3TB5rsTaGJdNbqIGc2gZXBYCQancYeJ6ZDEi
 /Lwa7lTMz6JsQI+m1gly5QvdUq4SZt36Tc9qHfwKoloEkgvzl9WHooINCKu/UAfOGi6B
 tu78hFJ46YDYyiCpYOo33nlfWf0q/jxFu/IvWNvj2pzJ3phbecwCHLbw+uvOEBES0mDq
 civg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bgRe39UrkcomXY7L1G7morRvB0wlq0CEf4d3hqQT3SM=;
 b=rlhX5SzJbr0xtwCMKJnZPrjzm9V4Y4IlCwY7vkCxjIaM78oX8ALwdQTCrdvdOndGAY
 gS7Zf6YJqUO1k+c4vFzcFglPheGpNy09+jPUudi54x1wfv0D2T6Xi+7sp2UG2jbxLiuh
 F1Vbcsew5m/mK00898c0sMbW37OYzgDmPOhF6z2h/dKAAgQxdG9N1Hs1tBRDVFEweJms
 uyFHrUWRfjfqTpmt3pwspsw0PtAEjQEgzrPovMi/Y14SbF2GJObeeYFYjuA4HDPvdprm
 mZltr5Ze2VIKia6OB4NZYz/Mqs4cC/tw28aUYYQv7V2ZdXwl6HebFJQDV/qVwdab7p3M
 XR6A==
X-Gm-Message-State: APjAAAVwZd7xpEexkCC7PDagSyFzTu4eBPUnh2PLN/zjBpMFva/0sUNA
 qXJL5hKoApVCeAS0SkcLQMjtIA==
X-Received: by 2002:a17:90a:e397:: with SMTP id
 b23mr5032255pjz.135.1581446319768; 
 Tue, 11 Feb 2020 10:38:39 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 z10sm5133184pgz.88.2020.02.11.10.38.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 10:38:39 -0800 (PST)
Subject: Re: [PATCH 07/13] target/arm: Define an aa32_pmu_8_1 isar feature
 test function
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a95c4d3a-792d-4725-25b8-88967aedcc55@linaro.org>
Date: Tue, 11 Feb 2020 10:38:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D3CpuipJyGgv

On 2/11/20 9:37 AM, Peter Maydell wrote:
> Instead of open-coding a check on the ID_DFR0 PerfMon ID register
> field, create a standardly-named isar_feature for "does AArch32 have
> a v8.1 PMUv3" and use it.
> 
> This entails moving the id_dfr0 field into the ARMISARegisters struct.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      |  9 ++++++++-
>  hw/intc/armv7m_nvic.c |  2 +-
>  target/arm/cpu.c      | 28 ++++++++++++++--------------
>  target/arm/cpu64.c    |  6 +++---
>  target/arm/helper.c   |  5 ++---
>  5 files changed, 28 insertions(+), 22 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

