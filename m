Received: by 2002:a17:906:9c0a:0:0:0:0 with SMTP id ff10csp1739175ejc;
        Tue, 23 Aug 2022 14:24:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7AlwCXyRPvWxel60aS1RqjdV+FGYMV2gZPKKjM5SzCMKgPgtxLugz3Bd6aFRaGjO6hxo/4
X-Received: by 2002:a05:6214:1c8c:b0:473:408f:ddd6 with SMTP id ib12-20020a0562141c8c00b00473408fddd6mr22246865qvb.74.1661289896057;
        Tue, 23 Aug 2022 14:24:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661289896; cv=none;
        d=google.com; s=arc-20160816;
        b=SLVO2ptdR16NNkuol4i4HG+FS7MBFk514pDYavg6Wf31+iRyGmqUdvRHldT5s5LsjJ
         E/fQ1ffUVQvGhtho1fIlUrvBIUYJYMQxS1kUupGbn32xQEE+PLKTz/2H6MHrQ5mm6nSe
         HRS1lutSMhm5OxNXXGu4PQFBzI1d110k3rQgs15Jdd8gaZh7Ppj10W2CxuzL7ZYydFyL
         2Xy+svZAGZYNiI41lnx2gl9K6bD9VaEe+NSVrexfJfpCg4i45fYibAx2Kh51QxYx1xuO
         rLCQfvdUah+InguUJiROPcFHZR+ran0Sa4lk8wVcvVTUtC6/c9mqIQbqJ1sp5vgcXUUV
         Lk6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BNKiuiT+PU7qCnYr7FA47mAteTxcWpxY/uiCw2amMs8=;
        b=xTjamV1rhvpt5zTubaEulaeP23CpTBKBzfvB5xtaEJtUUTvA6riacDyyQM8RZJGJTF
         k+04FcpietgKtmlbNQWL321xWYROkI6tg3AJlCDx+XZFKaRx1TYe5qKT4YXKifr2HJmk
         yWVAKp1D41SUNBhgks3RVsjIcIoODMy1f781mlBk7SC8vK7KHjf9Ezpqate2T8H7O7dv
         E45Ris5iKXlWmV4rBZ+ImctHmrEGTak0fE0o40UFT11/gUJ7q+A+0auQ8IuXphLkY8og
         zcL3+urtWSyuUq6WZAa9J/DS/hl4d3wlFzrzTiD8g+LSLyVjAUEw2n+j1cpsgvvsbGaC
         jAag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EYDb370b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fv3-20020a056214240300b004743bad6e1csi7731631qvb.371.2022.08.23.14.24.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Aug 2022 14:24:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EYDb370b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oQbOJ-0003p6-JB
	for alex.bennee@linaro.org; Tue, 23 Aug 2022 17:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbNu-0003oY-FY
 for qemu-arm@nongnu.org; Tue, 23 Aug 2022 17:24:30 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:35559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQbNt-00046B-0i
 for qemu-arm@nongnu.org; Tue, 23 Aug 2022 17:24:30 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 m10-20020a17090a730a00b001fa986fd8eeso18491274pjk.0
 for <qemu-arm@nongnu.org>; Tue, 23 Aug 2022 14:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=BNKiuiT+PU7qCnYr7FA47mAteTxcWpxY/uiCw2amMs8=;
 b=EYDb370bwesxlkUjTj1x9jCuttKygnFQb+MuBtOodnzCLufs5SqIH9yXPtFrEMowYp
 K2EW5lnjMhNPSxI1Ats2zreUa3bUWUQOQGQOC+Gfu/L0XnbY06WuTPiUBh3GwAeFbkAE
 gFcKnJyhKBpGuVXmQkggCoKL6tWByxxU3dwpPL9eF2lqQBzBeLDCi3Pjb8cZ5rFPfx1b
 3fDw1xNjq6jOn4IpZS8ZAOsdkOUsWF1L5SZCCcxY8Xsz6i5Nwh3dohfcv7MPHetKF6g1
 uUxyWADxHotCp/sW6OLKbRpbrIDWduy0uSGtyQ+w5gnlTPYu2A31H9+3Utr/PIZiXVIB
 xoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=BNKiuiT+PU7qCnYr7FA47mAteTxcWpxY/uiCw2amMs8=;
 b=lZhyrO78PAZOUhBJ2N7llAgc4SCIrLjKIwdNP6qdEIg9NGct/bkChyJ3d6+YycBdIE
 MBQppQJ8fflJg4OT+COkTZC6IpSrBJjMhKQqGjoXC1VeOuS3GGbZLkSlCGZMfc5oCb8b
 93ONdyQMibTUObgILc4IMYgdaPfRzxuWItGgGE8s0NTn7YnLvHeYEtRC04Ja5UIJjf4N
 uET+cr4HVoXVcFgE1mpVCDmkDFjjzWnMVNqxhKgoF2acBD9+lQQf+LPlUHTSX+71rsLT
 Ky3fdmEh6aoctJ/I244cUUGkut8cqg5+PTJwS4w5mcmNk5czk1qMwa8UG8wcRZdfqRBg
 rkFg==
X-Gm-Message-State: ACgBeo1qQxp0QkSa6RP6OUt1rI4QlRauh+1EpeUKcDhi48veCIY0gm5o
 3jDJnDK+i675CssZdrtLr68v3Q==
X-Received: by 2002:a17:902:8f92:b0:172:e476:f9e with SMTP id
 z18-20020a1709028f9200b00172e4760f9emr12177880plo.82.1661289867654; 
 Tue, 23 Aug 2022 14:24:27 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9?
 ([2602:47:d49d:ec01:46f9:77b4:ec0a:c2d9])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a63f905000000b003fdc16f5de2sm9584128pgi.15.2022.08.23.14.24.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 14:24:26 -0700 (PDT)
Message-ID: <6b18f51c-5594-39f3-fb40-60b2ebc8393b@linaro.org>
Date: Tue, 23 Aug 2022 14:24:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] target/arm: Make boards pass base address to
 armv7m_load_kernel()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shiny Saana <shinysaana@gmail.com>
References: <20220823160417.3858216-1-peter.maydell@linaro.org>
 <20220823160417.3858216-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220823160417.3858216-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UigrJUcacjEU

On 8/23/22 09:04, Peter Maydell wrote:
> Currently armv7m_load_kernel() takes the size of the block of memory
> where it should load the initial guest image, but assumes that it
> should always load it at address 0.  This happens to be true of all
> our M-profile boards at the moment, but it isn't guaranteed to always
> be so: M-profile CPUs can be configured (via init-svtor and
> init-nsvtor, which match equivalent hardware configuration signals)
> to have the initial vector table at any address, not just zero.  (For
> instance the Teeny board has the boot ROM at address 0x0200_0000.)
> 
> Add a base address argument to armv7m_load_kernel(), so that
> callers now pass in both base address and size. All the current
> callers pass 0, so this is not a behaviour change.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
