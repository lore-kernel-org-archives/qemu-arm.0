Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp2349998lfp;
        Fri, 14 Feb 2020 12:32:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqy/lNsc8WwxKJ5TVoJ6p2GEX/6vQvDN53SgVnxGHKXcxdv6BiUN9X3zb06yBEOKib52Ith3
X-Received: by 2002:a37:73c7:: with SMTP id o190mr4468955qkc.490.1581712326469;
        Fri, 14 Feb 2020 12:32:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581712326; cv=none;
        d=google.com; s=arc-20160816;
        b=kdmvMdjxnjYucqcE9Wxowj/btVWDEh5Dj1O7KzKvA3V2NmMxIlNI/vxq+5Aq1GjIz3
         S+8TRnoFBZfTHz0VweDAUaTLNFeyFQxeXx93JOxhx6bUc1/mqYbJAD96iJQk9tB8m+6p
         xcsbu6YJkoKG5i+XaXaEAj8UYJY1HhLCTMAa0nyGnq7E8EmqDI4weUUVsR21M6Bc6xuB
         mbISKIEFA0SOS+quXSGmEdYzqZiR66sfJhVlgRwY2spTw2zXNfwsA9fXwDn12PwMACU2
         3gRnFpNPoeBLXqQnhw1LdukTspDr4AYcMun1AxxCAXTAhTbpVqSAg0v5I5ZLOcAZEGeJ
         2HxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=U3vErsPz/gWhxJLENS7YwYcij3i60608UBHlEaWAIc4=;
        b=Jg5UmyrVo6/w7ZyGRJdD1gxqIlmyZe/ZsUhimlnMsK4XIaEqSY//SpW1LnIQKJ7Wmj
         KP8xJBjOb/KgFTPS0nyF98roMlCKEwA9/xut3w/r9WUZiP5l7WwsTjTyDNUSuTgUsdk4
         Ap4lKPoBfI15JSVTzGlzvs5jtBRkB92NzCkHEif2wB36QYe9+9+QbACKJjHoUvgAzR8y
         JXn5T4iZx6z0prttEDULL+KAV+/5i21oMtSLLavJa9saqFOV6Y9LdaKkAZeW3oDrL4v6
         Uvk0tAAncGpyZpepmWyjr8v8GAWlXOhL7HRLtg69dhlYPoUMZ2pZQZQJvhD7QalK4gf3
         nHAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CiPf2Q+G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10si2973352qvt.107.2020.02.14.12.32.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 12:32:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CiPf2Q+G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2hd7-0002hZ-Vi
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 15:32:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54762)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j2hbt-0002G6-Aa
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 15:30:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j2hbr-0004jv-Uf
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 15:30:49 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:39238)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j2hbr-0004iG-Nb
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 15:30:47 -0500
Received: by mail-pl1-x641.google.com with SMTP id g6so4139655plp.6
 for <qemu-devel@nongnu.org>; Fri, 14 Feb 2020 12:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U3vErsPz/gWhxJLENS7YwYcij3i60608UBHlEaWAIc4=;
 b=CiPf2Q+G9V04lqX9bzoNZkMvYxhDwuWC6G6Nxk5RZrropDbBB7YnYEAcBJMnzvIKvG
 DiBehz5c63dXNTcaCZziTowbRqUd9ndNIC9hqxyGupGXnK5BA02HcRCYnNNhOWV2nPoQ
 K4Y7HyyucjDmPU8YB8OBkKfsqpC+0aS6Dy239m3L6aFwc2GhfJiB8u/G5SjunCUUkSQJ
 PafIlbRjkqBYY2fA7tJODd1P0pDgBnxl6e+AMhVROhyneKQXQP4DZRQHNIl4nVJBk4Qi
 3XfKb53QtuysBTWA1Ug7KaLTL6e34bLLdFN/oszUoF70bnNdjJHEv51F+XfENQNauAG2
 X4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U3vErsPz/gWhxJLENS7YwYcij3i60608UBHlEaWAIc4=;
 b=aS7iLZHMlFrvLrM1IdI2jQ07sd7BklEh06JJM7UVsVWjdsfB0o05n55vuiYwX3COUY
 UhoH/eEzHDOcy/7H5d2K6YnenKPuEtvZm7elXIAmNFX4l6h8Dn5YhxGeVt+dmWStxql0
 bRCJg5C8oracrgoFY8J5YKv50K8Y/jKzgvXqwFxb2Rw7sqibO5FvPzZZkn0gHrtzIwtM
 NyMRKs4ihpBt7v3Iiaedc5jfYME/QIxMdeNy1CvJ8ZiMCEZTDN/XDjTOWn38lbsWtHuC
 TRKuUAuXBiwce+1lt8//9HU361KHdfhoO29Bs1rQog/xAN4oabgPE0jbuCq61vq7d+zb
 D2zQ==
X-Gm-Message-State: APjAAAXw/XbYbMJE8TRTQGEKrLCH+eGMWYuhD9XF1zj7YxIkzkjDS3tT
 XZG3E712lr1Yd3y83a1RohOa4Q==
X-Received: by 2002:a17:90a:fe02:: with SMTP id
 ck2mr5654121pjb.10.1581712246209; 
 Fri, 14 Feb 2020 12:30:46 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 188sm8176887pgf.24.2020.02.14.12.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 12:30:45 -0800 (PST)
Subject: Re: [PATCH v2 18/21] target/arm: Test correct register in aa32_pan
 and aa32_ats1e1 checks
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200214175116.9164-1-peter.maydell@linaro.org>
 <20200214175116.9164-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e9df303c-ba1c-1a86-3d57-1e7cc8860de3@linaro.org>
Date: Fri, 14 Feb 2020 12:30:43 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214175116.9164-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G4cRIuRjr87R

On 2/14/20 9:51 AM, Peter Maydell wrote:
> The isar_feature_aa32_pan and isar_feature_aa32_ats1e1 functions
> are supposed to be testing fields in ID_MMFR3; but a cut-and-paste
> error meant we were looking at MVFR0 instead.
> 
> Fix the functions to look at the right register; this requires
> us to move at least id_mmfr3 to the ARMISARegisters struct; we
> choose to move all the ID_MMFRn registers for consistency.
> 
> Fixes: 3d6ad6bb466f
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h      |  14 +++---
>  hw/intc/armv7m_nvic.c |   8 ++--
>  target/arm/cpu.c      | 104 +++++++++++++++++++++---------------------
>  target/arm/cpu64.c    |  28 ++++++------
>  target/arm/helper.c   |  12 ++---
>  target/arm/kvm32.c    |  17 +++++++
>  target/arm/kvm64.c    |  10 ++++
>  7 files changed, 110 insertions(+), 83 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
