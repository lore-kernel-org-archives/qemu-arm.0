Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3200324lfg;
        Sun, 28 Feb 2021 18:54:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwTO+7g7h9g6nEemgdHMbiSoG8TG3XJuAxpGni/RB3Ye7YuWHdrGnmcncsBqOPEgSKPlMYz
X-Received: by 2002:a5e:9612:: with SMTP id a18mr11900451ioq.209.1614567243754;
        Sun, 28 Feb 2021 18:54:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614567243; cv=none;
        d=google.com; s=arc-20160816;
        b=uZiJvtKhM5MbkaHkRdcsW0kpKzDm9u6e240HbFNYraIdI/BOJGofy8hpMwCGuHPGGi
         Q8/5Vi1ye0+QgdEc+kifeNIpPOL6z/PrxuWYqcHgLRpi/nEuvRX24DguterMqWlJtbir
         3gIHVDv8nCEI9cBFc+pavKaf7jST3k4fRT3Icjd4bEQdJGQVTjh2WZxlC/1RqiDn4BlP
         RJ8OFfyOvlCdyKZ8o3ujH7XH+HXYgwzL4F6lDcHio0No9aqRvGcgutZq1MGSemotj/pi
         gTma0a5EQXxcMDTnBEtmdw1h32l3bnwV4WvHBFADYCbrqWa5IQ9h7sz/oHEEe43ln4EP
         zkOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=cypz1KHQjt6A+fyjHuZPnoMCU5MzBZVr/w5/EwPioD0=;
        b=SnhAT+m8CgfTP0R6ChCWDRlcv0HFtLJs+AX6qHgs35p6sSCarGfWqpimfbiPUJDy+6
         /hnZlpzjZVwg+9gLgZawb0ew2hHTF2FVJl/w9VGXF7PTA7fIs+kPNPdZ9aG1wfsFlzkl
         BZ+94gaSNzHQb3Zwjn4t9DBi2fxYvVPSjAWj/2OLEh3ui/EBVA5LVBI4wjeD/cSbZRq5
         OcnxBIdAYCLg6r4Tdg2QCg2qZYdPEWzPau/h8Debalx/fFO5ZB/INxYv9sy8pZAA36wE
         miD78cWNKreAchX92YRBSUAgiKI2rJCxLazmk/muaWLuSpokuQRrZ3c3y1fF6uoyk7Ag
         HE+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VTeKJqD0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b5si1141387jat.99.2021.02.28.18.54.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Feb 2021 18:54:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VTeKJqD0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lGYh9-000654-3v
	for alex.bennee@linaro.org; Sun, 28 Feb 2021 21:54:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYgp-00064a-St
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 21:53:43 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:41648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGYgo-0006eA-DQ
 for qemu-arm@nongnu.org; Sun, 28 Feb 2021 21:53:43 -0500
Received: by mail-pl1-x62b.google.com with SMTP id d11so8970082plo.8
 for <qemu-arm@nongnu.org>; Sun, 28 Feb 2021 18:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cypz1KHQjt6A+fyjHuZPnoMCU5MzBZVr/w5/EwPioD0=;
 b=VTeKJqD0sMmBStZIzNO0LdubyBABoN8dwyzDlRXBV6ZyjaEeduXoKEo5tUSfZDKinc
 pJVtvGIYWUaYugAz5CxXhP6ZI9ic5YdJ7u940e9HFIfeV7KNknSsHMPToYdCre7yvPou
 x6xiq4V+wHAfxVs+rPBvGZ5tHIrSuvNpo1jy1qP3i7Tih4qzo3SCjKsIc5+3ziD7jyG+
 LRShxNFWKp8JAOktKsa3WR5k1vYwCH1z6p4imOmiar7aFv5+uQDgtuwT+lgZsby89g0i
 AaQLzXZUTfw78N+c7iUK+4ibYzURA9fP73OKMzRg1JgC+Ci81do8FqP2o3r9xIFx8dJa
 KAsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cypz1KHQjt6A+fyjHuZPnoMCU5MzBZVr/w5/EwPioD0=;
 b=AVD/8TX2Qx7puLgBRjqmFRGjW4SNc8QCXzp0H5DF4vOKIFvTkXlL/QM8XCHGZhU8sz
 jepXwQFSYQdexhpx/dtkihoUuxALpNodq5SJrKtMpHpCOiMUF3TozVB+GNfbDNx1JwlE
 5OVIV+LlIvo4DfaKX/DwB4d7hkmHkNnv8Da7iwYNX8D++e9xkGlKWl4muwLldZA1re8M
 nJYQ3jspwRsAELcGkyXjbDmAVihqIdVsNEIVR9b0cf54vRY761xH4kOTeWy/Q72/AIzX
 cvtjK1aNmnWnG7bNmwCNHVCJK4BqvddVkGzf9aJ8WA/Es2iAgjPL1vuClPafE60wGqzF
 yClQ==
X-Gm-Message-State: AOAM533eEfNCdF7MFDVaCNEQmN7wJA+BRVTi90R1hKL2Gw6u45ryK90u
 MyCgQHZAitmSsjecNGDKX0/RGg==
X-Received: by 2002:a17:90a:8901:: with SMTP id
 u1mr14916159pjn.21.1614567220782; 
 Sun, 28 Feb 2021 18:53:40 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id r4sm15176063pjl.15.2021.02.28.18.53.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Feb 2021 18:53:40 -0800 (PST)
Subject: Re: [PATCH v2 03/24] hw/arm/mps2-tz: Correct the OSCCLK settings for
 mps2-an505 and mps2-an511
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210215115138.20465-1-peter.maydell@linaro.org>
 <20210215115138.20465-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <07e2a884-fca9-5712-f509-c6a1081f631d@linaro.org>
Date: Sun, 28 Feb 2021 18:53:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210215115138.20465-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rs2base0RF1+

On 2/15/21 3:51 AM, Peter Maydell wrote:
> We were previously using the default OSCCLK settings, which are
> correct for the older MPS2 boards (mps2-an385, mps2-an386,
> mps2-an500, mps2-an511), but wrong for the mps2-an505 and mps2-511
> implemented in mps2-tz.c.  Now we're setting the values explicitly we
> can fix them to be correct.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   hw/arm/mps2-tz.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

