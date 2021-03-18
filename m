Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp708866lfg;
        Thu, 18 Mar 2021 13:56:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+y9rOcIEgIighz6B5sIviUjXu/W9iVJ4V5l9pfu3YxmNc/SqJ+iMjYZ6Igan/lP1OJiXN
X-Received: by 2002:a92:c052:: with SMTP id o18mr383140ilf.84.1616100989276;
        Thu, 18 Mar 2021 13:56:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616100989; cv=none;
        d=google.com; s=arc-20160816;
        b=BLaxceY/ZBrwhNGEvcMG2vG9pqJuJYJUBgauqbVzqX2aisJgODrEhRo1aYjU4eHMtP
         rT84SLU9P231ZI52U+z7JDIbC1M6TdI2wnR3NYg6AcFsJ9r+xonmrwUvhLguOXSaQalO
         WP2ckuHkovemVQ7Y1MS/eSwjAlCCy6OH5hPG1PzRWwxrpZTPYlN+PqpiBgYfHacZ2us4
         cYkl8pIoOnpt4tpbe4Rzx5euCQbIQ8wtc0Dh7RO2xiQNAWCxlQxXYjAnyvZDXRbNgPq9
         dQUPVwluqLMh+/+zjmZAmyT6tJck8bI9lx+PuUweLJUiuHUXhqQPkU/ZJwReXzQE6qrO
         sXZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=bTGxLX88MTsNLg3QcVMKyNWSsxqwx4ycSD0y7a6wLKs=;
        b=BZjFpgTES6g9j+UV3oLxXZqtRl5MctLB1bMJPG5kBUAy3I7V/FNvjEUl1WzklSp6aS
         AA/qRNCI/2BJ3fUqfbktd8RccI1qlY5WXlqBM//8yMuguHOq9g/NLjq1HzOwpnd64nrW
         jlEuJILJ9FpO78cI63U6YTveuCmAf5ekgehnaE3uJD7nBeAbSbGhw6SIIkFoEAhIp8TE
         OKk0CJWGYP3BG5A52UUWPVMH0lAAv58tk5WiQb7A+hzNuCakLrkYVBKuFO8kAvhQjcea
         DjuAC89UkfTctdtqRAaK8UDWaa86rTf50AqSX5FKZGlk+DGmi53oATpH7S/gLC/6I72k
         0N5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ixd0o1ET;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10si2120810ilq.74.2021.03.18.13.56.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Mar 2021 13:56:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ixd0o1ET;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:54178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMzgy-0006mc-KW
	for alex.bennee@linaro.org; Thu, 18 Mar 2021 16:56:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMzg9-0006Ha-6i; Thu, 18 Mar 2021 16:55:37 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lMzg7-0006eB-L3; Thu, 18 Mar 2021 16:55:36 -0400
Received: by mail-wm1-x329.google.com with SMTP id p19so4367416wmq.1;
 Thu, 18 Mar 2021 13:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bTGxLX88MTsNLg3QcVMKyNWSsxqwx4ycSD0y7a6wLKs=;
 b=ixd0o1ETvj5xfhsECg/+SDJ88vCaHmp/eayFotUFOIQ9X/+MQ2Usnvb1Tl9hwUHRip
 HDb3fd7cVJOovTMuViBqhbXCpeZCemb9IemC2VJncbKmIr1KVTE1oPXXKvgXj8m+NZGI
 ne43NM7j7uREONfbMKrgMfmCbAZQjZgVAOtNBN+JVBago6nYHoxO4+uHn0NrdYRprHdr
 TLLZjiG64xKQxhIyPBcZ/kQo5Zl58n4mvB+1C411CeBZsTbyYASYkahrB5QHuvfPxV7Z
 aStD05uPt6pAoKHEZPhFJDePi8Dd5TmBnOmhS+iHvgp75r35X/UX4u2o+3gsgUW45Tuf
 qaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bTGxLX88MTsNLg3QcVMKyNWSsxqwx4ycSD0y7a6wLKs=;
 b=sC+UBR6LnAkk9g6IjgijC2XK6GyC3G/6RctebxuNBAGxDPcMf06KkgBRAsmwREEUfX
 jUxC3qa66/4AeNbXnHDaH2Yu2oLpq8w/8dbFTLYJVJmPEVoJdQljHYIHnpGr+WQClANm
 7wDh55PMm/fUKoB76/5cJdno55px3M+Ok8JvWnYSlI0Q9+CUduBjoN4e3zugDQGt1vbR
 FDAzng1KrrWMQJXDXzbBQKhAnUvUUIPmJVewQypJ1UoPvi71eKYU1zDMebkX/IQEf3Gf
 IbB0NLXk1taBsLuvXxQ4kUmJDRX/4v9BgTKyvHs3YQzfjgOdq8IvfQIe0W6Oh2vZdj7z
 1OgA==
X-Gm-Message-State: AOAM530rT2W/wlOJkPnh+j/BeKg7CeR288L0ZqzvpInAxJ/RvfUKwkRx
 FIw5IZleirpxGqHY5UbyGzHAXs1iqVYCNg==
X-Received: by 2002:a1c:2587:: with SMTP id l129mr827141wml.135.1616100933077; 
 Thu, 18 Mar 2021 13:55:33 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id x11sm3417577wmi.3.2021.03.18.13.55.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 13:55:32 -0700 (PDT)
Subject: Re: [PATCH for-6.0 v2 1/5] memory: Make flatview_cb return bool, not
 int
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210318174823.18066-1-peter.maydell@linaro.org>
 <20210318174823.18066-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <928da1e2-22b7-b811-f81f-606f1e4b05c7@amsat.org>
Date: Thu, 18 Mar 2021 21:55:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210318174823.18066-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ash9KZYIubpO

On 3/18/21 6:48 PM, Peter Maydell wrote:
> The return value of the flatview_cb callback passed to the
> flatview_for_each_range() function is zero if the iteration through
> the ranges should continue, or non-zero to break out of it.  Use a
> bool for this rather than int.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/exec/memory.h           | 6 +++---
>  tests/qtest/fuzz/generic_fuzz.c | 8 ++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

