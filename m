Received: by 10.223.172.38 with SMTP id v35csp1308057wrc;
        Wed, 13 Sep 2017 10:25:02 -0700 (PDT)
X-Received: by 10.200.50.24 with SMTP id x24mr28519928qta.55.1505323502396;
        Wed, 13 Sep 2017 10:25:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505323502; cv=none;
        d=google.com; s=arc-20160816;
        b=qb8KVro8SEA3s0iPb3utFoVsjiWsU9sXiCb09UiijozbPABieuvypDzWjXn6lNWSlv
         Q/whcO/yrA0Cu1iaMovPfK7pw7U3uy6V+MwoBppbLaJ9kz2zhPnlcOR6scVKTKnuACA3
         n8o9WnQl/Od/Kp2XPGwOlGsIscFIl/GW6m0XKoM5MQLWySadRwAgqKGGfzo+DT2ktkcB
         oWS21kpAnXS6iqQQj1+OUJrfOS/f2rSjOJst2EwanrtFinCxEFWtxVAY/l/wKyRfusDS
         WQy38ETsmqPZu2gKCjnDt1Fs2+fgapnHXr8a4EHMTk+V4eRZCHz8WwE/FR2R0WwmY23X
         qQtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=rS0Qw9tHDIcx8mFobPbwqpsjwvzUNcttJdOzzjBZ0Fg=;
        b=dz194YVxMvWAZU+mnMdlrug1qZoU2V6r15uwwH5YwUuXHsOfAe8DjFkvVJunaQ2yTa
         lGMdWx2R1Dwg+pdpwcHIVt3YXHeFuMJZQ+4nsEgEjF+u+DZXGkcud+sLrztIGUkIacoZ
         h9F2BzITrnv6ySq7wM6oGE2l/9b4b1OM9btTm96cb6GZRn4BLc8HswEYqbtkYuOSjHF4
         WPdrL2kU7/t6GDXqZXqqC6LpuQjVxKzsynR/Sg3xTiC54yzmoayqkaSg70vkz7zcW/ET
         hJcF8Tny9psHaxUbyyUPbmA2Kz3X2EUSwb/qIF39t0PTP0QHlGw67f29GXbWtwndtS9L
         47FA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JuQK/l1n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m6si7707590qte.356.2017.09.13.10.25.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Sep 2017 10:25:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=JuQK/l1n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43794 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dsBPI-0004zJ-4u
	for alex.bennee@linaro.org; Wed, 13 Sep 2017 13:25:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37254)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dsBP5-0004z4-QV
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 13:24:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dsBP1-0004vi-MY
	for qemu-arm@nongnu.org; Wed, 13 Sep 2017 13:24:47 -0400
Received: from mail-qt0-x235.google.com ([2607:f8b0:400d:c0d::235]:48951)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dsBP1-0004vN-Hl; Wed, 13 Sep 2017 13:24:43 -0400
Received: by mail-qt0-x235.google.com with SMTP id q8so2170638qtb.5;
	Wed, 13 Sep 2017 10:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=rS0Qw9tHDIcx8mFobPbwqpsjwvzUNcttJdOzzjBZ0Fg=;
	b=JuQK/l1n+5NZvuMcODi7xAS+5fNFtnqiaVO2R0JnY+rRypNWnNTKdeQ2cz41FPulab
	mdZ/wqVLpiPHPk/gX3FNBB+8okbTez1D0rjX6cWjh8yx+pF837gdAO4ph50rdFWY3Pzt
	0WEAA6iKfepmljDxDhQkamF3qmRhDx6lRsHK/Aq13olhhYheE4Xw9Yqnvzx5gQ2uA27K
	bYHC/dwZNwoU0GDBYjmWq51FmKHdpC6zF1u043nvdYYWKGKzAvTiXQ8TM4zcbA63pfs1
	uUb81uyacxESru/tBPT82hU+8Em79X6mr4I84AkPvRW58z9S0rqKPMorsvSpnXCUKcYQ
	9zIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rS0Qw9tHDIcx8mFobPbwqpsjwvzUNcttJdOzzjBZ0Fg=;
	b=Aq+LG484lr2ZLFje4l/kG5SusfooUska6gjlQpHmY9JWNwUnLhjAfcQ1zpyG7wWOaq
	29+bpGyjtSfUFQHr33urbvZdOvPmRIJCTMo8fqlKY7HPfoEgQoNXcImBlTB1+CDn4JG5
	HgeyGtWP3p/67W6jtG1cngsS01X0BQ835OM3kFjNZjbZ9XgRqinsUgtay/cCjZxKmD9O
	62AI25X5bQy/FdyFvF5VqMR9sJhAr2cnSImttK/rZ8HnafXxYDL15QkFHOrGc5XZdL/P
	xKDQC/3qjpV4+H5VQJfVxtCvhlpk6a6d5qRnuzw8ruXm2d3ElxxMrRZj3YmGf9lrqMML
	IBJQ==
X-Gm-Message-State: AHPjjUjGyDu2HBc36iiq11ecHsWR+gu2maeteyuf0QAHEOFTLUYXwAj+
	vAR/IXWFXjXavw==
X-Google-Smtp-Source: AOwi7QCy5w6QHdlmSRQv50wD+bVeE3C9gW2MpUGNbI1lfSEdS4Vl/GURIcR7fYZw2RiKcSBGeTVCqw==
X-Received: by 10.200.54.3 with SMTP id m3mr25836671qtb.195.1505323483003;
	Wed, 13 Sep 2017 10:24:43 -0700 (PDT)
Received: from [192.168.1.10] ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	u133sm9564540qka.92.2017.09.13.10.24.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Sep 2017 10:24:42 -0700 (PDT)
To: sundeep subbaraya <sundeep.lkml@gmail.com>
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
	<1504812251-23438-5-git-send-email-sundeep.lkml@gmail.com>
	<26693abe-07a2-1744-1a8d-4d08941837c5@amsat.org>
	<CALHRZurB_6GT+KccybDgWb8bPdU89Ey1si46HnbQgsLuHYCh_w@mail.gmail.com>
	<CALHRZurVQzOX+U7OioHGiMKSoZNSOA77zqhyEGgp=H_5fKC7qg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f5ac4d0e-dc40-8ca4-c0a2-a7b34752549b@amsat.org>
Date: Wed, 13 Sep 2017 14:24:39 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CALHRZurVQzOX+U7OioHGiMKSoZNSOA77zqhyEGgp=H_5fKC7qg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::235
Subject: Re: [Qemu-arm] [Qemu devel v8 PATCH 4/5] msf2: Add Smartfusion2 SoC
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rNsElkT9Su/p

Hi Sundeep,

On 09/13/2017 06:21 AM, sundeep subbaraya wrote:
> All patches got Reviewed-by. Do you want me to change alias to remap and
> send

This is just cosmetic for the "alias MSF2.eNVM.alias":

(qemu) info mtree
address-space: cpu-memory
   0000000000000000-ffffffffffffffff (prio 0, i/o): armv7m-container
     0000000000000000-ffffffffffffffff (prio -1, i/o): system
       0000000000000000-000000000003ffff (prio 0, i/o): alias 
MSF2.eNVM.alias @MSF2.eNVM 0000000000000000-000000000003ffff
       0000000020000000-000000002000ffff (prio 0, ram): MSF2.eSRAM
       0000000060000000-000000006003ffff (prio 0, rom): MSF2.eNVM
       00000000a0000000-00000000a3ffffff (prio 0, ram): ddr-ram

 > v9 or wait so that you get time to review?

I have a draft for your patch 2, I'll send within the day.

Regards,

Phil.
