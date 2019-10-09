Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1136847wrm;
        Wed, 9 Oct 2019 09:21:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzS9veStOaPZ3OCgL7+fT8wfRoUuaHBGcCydSiLTF+GT5vDefshemvrBmz+e4H2QUO1D4K9
X-Received: by 2002:aed:230a:: with SMTP id h10mr4487560qtc.84.1570638080830;
        Wed, 09 Oct 2019 09:21:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570638080; cv=none;
        d=google.com; s=arc-20160816;
        b=r+lBjJF45p58kwzl+B/ikhorbb17pcEVk6pJeYWgswxMFeCQaUQDA+txFgd20/uDHl
         8oQ7KHCdWPShKFF/uJnKgqNoLIMpokYXML3FOjarnN2qVJX55AcAWFW7UtnHn1p6AI/B
         Kt3HtS7aIRvn2hX6UYEtPQvMcj+OolQMYzVZ/2uoNkDYww1iIH1Ju9tQG2Qqn212txBg
         Ry1M/eS/dFq6iDbIhi8rwb2to6esJpwDkCr7CehncM30B6CaCrirXwvISsDWtMvAgDlx
         0X/ZoGTs7MbaeRZsN0DrlOulaFC2VInjskYYQLtaPjCYV46/oDIGAWh/sI9CjW13tH7n
         sIYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=m6ugJ2CZVH3J/yxuQHIew2ym1NF3mlhKzBBNImuLAzM=;
        b=wkBeH00gvQ9KVIUfTtmCI63y6EyBHGQKW6FloAvQmi/N1R8Mk4XR0RDy/eBR8DK0gc
         LTy8r/0pdGENM4ErFPrRk40hr98TjB9DWMBjjZQ9DTqf5oWgqOeZwo86zlMbEKUyxGWi
         oq0FR5xkMCl53DRuBTRLCHxl8vU+y5kcFBp0d0xrNdAZZ+V9rxaSxFJD0NI5azI3xkmy
         aW3qFNS56zRoVsbO/YJy/vCcS05ZBJ0rhKrtcOgRhS4BYXYaiUrefuB1cSrMxIW8lPlS
         pn9Qg2XNkBbPk8OYG9pp6RRtNDMDbw1GWk5qic+gD5gFEfiB1GPSyIuTSbpNKq8JZOB5
         gs4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="tc/9D3/1";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g91si2535592qtd.265.2019.10.09.09.21.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 09:21:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="tc/9D3/1";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIEiF-00089B-NX
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 12:21:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45754)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1tY-0001lf-On
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 22:40:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iI1Fb-0004kC-GG
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:58:52 -0400
Received: from mail-yw1-xc41.google.com ([2607:f8b0:4864:20::c41]:44497)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iI1Fb-0004jM-9q
 for qemu-devel@nongnu.org; Tue, 08 Oct 2019 21:58:51 -0400
Received: by mail-yw1-xc41.google.com with SMTP id m13so222203ywa.11
 for <qemu-devel@nongnu.org>; Tue, 08 Oct 2019 18:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=m6ugJ2CZVH3J/yxuQHIew2ym1NF3mlhKzBBNImuLAzM=;
 b=tc/9D3/1Waw7a/DQCYges8gHFq5M9FxWxJJJYz5yyiywasadyMbwzmUyvYWkyxcZGJ
 f5XEcU5vaB11xao3hGp5hLWcBg9sHRsN49YlWKSlVvqXoUu2W9kW4usmnersGr8B/3u+
 aQ8K+xhOADdqqgAp6a6A76mKx/CO7lgw1ULaQe2F+wOiEAn9IvvEcTIymcBafNGzPSdl
 zzyOI9JrvqmZLW2nRst3uaFEEyEVDbB/05uzuMwsiz5A4xiEEsJJB28WoZU9exBRwQKe
 vIpqL7q45U+QNpEXdlMHsJhi0YWC+V8EN+aZDZHEdsCq5D6FwSTIrTw8rk1lM/ahfLqO
 UrrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m6ugJ2CZVH3J/yxuQHIew2ym1NF3mlhKzBBNImuLAzM=;
 b=LBBFlEBrPu/Vf3H1X7eYxluykxu2xFnMGYMZp5rxyIC8GtfWdlIlYyjLyImII/q1sc
 QtU0gTml7zumhCzj4olmIuZ3vkdy2ULSB7sEaTQ3RHrL5LWe7mG5zk/Nex0GGOWc/8US
 ms4vssX3TWGLogZvOFCA1nNsOm0SX3cddXf8ZgigkhJKeGC01cEng5leTqUbDe4Q+vqf
 PcHVvmspv2fCs2xbuAOYUw8CXnGX71sbpTpxGpyGvdLp9WcKzwNAiK5wXT4FBt3Pt+Ef
 FmQehSWt3Dt6bhW5Wq93k0XNFqym737eDdL2RT+59aTGVngas5togFXZIMrmKXNXXcVN
 4RGw==
X-Gm-Message-State: APjAAAWjz2Ej8cbgwXGCByBLUHGzkQLt7l5Urv4YF6w3QCilj5+rhyjn
 +CI1Zy/hRIVj+EbyLE1d/O9R94X/Afw=
X-Received: by 2002:a81:a9c1:: with SMTP id g184mr1045929ywh.320.1570586330754; 
 Tue, 08 Oct 2019 18:58:50 -0700 (PDT)
Received: from [192.168.1.44] (67.216.144.16.pool.hargray.net. [67.216.144.16])
 by smtp.gmail.com with ESMTPSA id x188sm231682ywb.94.2019.10.08.18.58.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 08 Oct 2019 18:58:50 -0700 (PDT)
Subject: Re: [PATCH v2 11/21] hw/timer/exynos4210_mct.c: Switch GFRC to
 transaction-based ptimer API
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191008171740.9679-1-peter.maydell@linaro.org>
 <20191008171740.9679-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6095be3c-921d-e6a7-16f8-78c652726a4c@linaro.org>
Date: Tue, 8 Oct 2019 21:58:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191008171740.9679-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::c41
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nNnxAk/c+r6x

On 10/8/19 1:17 PM, Peter Maydell wrote:
> We want to switch the exynos MCT code away from bottom-half based ptimers to
> the new transaction-based ptimer API. The MCT is complicated
> and uses multiple different ptimers, so it's clearer to switch
> it a piece at a time. Here we change over only the GFRC.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/timer/exynos4210_mct.c | 48 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 45 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
