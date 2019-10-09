Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp330937wrm;
        Tue, 8 Oct 2019 18:48:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwwUkyb5PJVxjtrHpovYSo/TTpJdlC5ZNFNmikrmpjAElqpcFavUQVkGemSCTBm7CNz9nOU
X-Received: by 2002:a17:906:a294:: with SMTP id i20mr594702ejz.165.1570585714976;
        Tue, 08 Oct 2019 18:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570585714; cv=none;
        d=google.com; s=arc-20160816;
        b=JfE8y1mx7Jm+m3uCetwPq4tgOywUPZwKraXnf4K6sw07Kqnr+tSal6AsADyk/yJZYJ
         68pCsEiNs8ZZG4TNA+ieJ2Xxel9ndbbHR4R1B6FTDjUWNpaJM4kPQVMtZwOgZjfw7P6h
         FI5x2jAkkVVJrLdFm3i3Eg7XsDxXWfHuqANToaDqZOWowBo+YYSpX+gO/NUL8XJBPJRI
         ccUNqrBzITb035daasgro9ulRIK1rydjGGbQ9a2yA1rRee3bQbZbwGKosJPHsAoxFwHd
         uYO1dhnWNJ6dTWyugPBmNF/Oo+9EHAx3IFLAwtQdDMSSH+VfvzoLiaIQmh5yFg99RCyG
         v/nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=VNDAkVsTwUnuIZghDZOLRxF38RbItL8I5pyWWyyoipk=;
        b=TyXCLTJ5qRyknrC1tmsnkBk3MqRM3Fsa3KJlQr30Vb7kalneaRtrud4ePkhZD4A+fV
         3yz+OZxK4MKnqr2RZ1DJ8rJR1bcJ7GCabR/w8HrSoYvOLsGKN9PWRNbd+Q9Uz9sUS4ec
         5f48z76QyDhWTYIjU0taSgh9z2FWn0Q1YOI4oGIDwIe3dTRW+EfqSozliwSoc6wuYGXZ
         WVjYBbbswYZB/DI44q2kp8XNAje0Z29zPYIa8V8+t5VYYbfjYgpTHbHm8qltWHCWAftW
         ST2Chl4iPg9F4Z79do6r6Nay9X1x3Jy303k/0urCWFhlzHfrr2Ch0+n/WN2TklcWT58Z
         9cxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="m/eccXb4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3si422522edu.432.2019.10.08.18.48.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Oct 2019 18:48:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="m/eccXb4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iI15d-0007rj-HQ
	for alex.bennee@linaro.org; Tue, 08 Oct 2019 21:48:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42312)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI15O-0007ob-8g
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:48:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI15N-0007Sf-0h
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:48:18 -0400
Received: from mail-yw1-xc43.google.com ([2607:f8b0:4864:20::c43]:32803)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI15M-0007SV-QD
 for qemu-arm@nongnu.org; Tue, 08 Oct 2019 21:48:16 -0400
Received: by mail-yw1-xc43.google.com with SMTP id w140so242262ywd.0
 for <qemu-arm@nongnu.org>; Tue, 08 Oct 2019 18:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VNDAkVsTwUnuIZghDZOLRxF38RbItL8I5pyWWyyoipk=;
 b=m/eccXb4nzRViAeBQKZTQMDAvclE+ZKdMo734zjkcmsO4veeWdQkkn/uncGGlElxlM
 UnFq/PFmhpD480cq9X+cbu648Pwx9bPr9e5LwsdzLW9vbccFqNSknO6noVq2Ub/Do0Ws
 xvLWYNpHVpUSRH3QBP5ck7ENTKJGWDGajEofvMVNSUa8s5pwzoGJf9DDlznqW3/r3aNx
 mIXuJ7nF0T31KWQIhWLjf8W/RhmyCAWmaA/lyq6/gLyzvx6qObL2dsWa9pNkKDDrd3ey
 4O/xrdQJ4niRFRkRcjFwmlgNtnmFMq61LSlh/oj3Lene2XlIWA87tgq/AyfVdX+2DRc1
 5hNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VNDAkVsTwUnuIZghDZOLRxF38RbItL8I5pyWWyyoipk=;
 b=ZYGrgDqw/Ui+Ssm8Uvrfnse6acxciZdWYofSCiaLjJ/OzemRfRwg9+LxfuyPNVaant
 /YkZhpSmHkGux995QDhiMUBUdeYYRquT7TfkIdEqmK7GYhETHzlgTxHlSJro3z0uuTOc
 nQApjWkhghiMPE3s4HnbrRQkAxiYT9xDTWXJyRFuiOtNMH4EHnbXcrcVZf6P/0r7Bwvc
 +Qz3nIWmM92LehbDnjWvsOkHPb8Vn1Yu0f3/j/v5KRMVFDhia7PAkvPYAN8ZCNQ7oATz
 fmXCXBuvKz+BsuPUYS1wHhmfWR8sGWsTW0kjMsF9U6hGN/XqS2+ftmvRVxUne0vnmfnt
 lgPw==
X-Gm-Message-State: APjAAAXlK5Abp+2NPlERhp4q1UgHDGHc9hUbIoccsyZ+2d5YmQp92hr2
 5yV5rmPkdWqTUrZeLCZMEnFRnQ==
X-Received: by 2002:a81:284d:: with SMTP id o74mr979995ywo.45.1570585696067;
 Tue, 08 Oct 2019 18:48:16 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id t82sm216076ywc.26.2019.10.08.18.48.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 18:48:15 -0700 (PDT)
Subject: Re: [PATCH v2 04/21] hw/timer/arm_timer.c: Switch to
 transaction-based ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9540c7bc-b394-fc61-d59c-7273d726c3d0@linaro.org>
Date: Tue, 8 Oct 2019 21:47:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c43
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 47YextK9txtz

On 10/8/19 1:17 PM, Peter Maydell wrote:
> Switch the arm_timer.c code away from bottom-half based ptimers
> to the new transaction-based ptimer API. This just requires
> adding begin/commit calls around the various arms of
> arm_timer_write() that modify the ptimer state, and using the
> new ptimer_init() function to create the timer.
> 
> Fixes: https://bugs.launchpad.net/qemu/+bug/1777777
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/arm_timer.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
