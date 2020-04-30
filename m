Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2282547lfm;
        Thu, 30 Apr 2020 12:35:07 -0700 (PDT)
X-Google-Smtp-Source: APiQypKp3LE4eW7RYUd0PlhV24h+WfqGqRCqT4QPm8MFqLBGlOo/VwMzthiM+ZNRAA9YdZeEyClU
X-Received: by 2002:a05:6214:42b:: with SMTP id a11mr525718qvy.186.1588275307405;
        Thu, 30 Apr 2020 12:35:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588275307; cv=none;
        d=google.com; s=arc-20160816;
        b=gNXNRHN/K86d6A1Vwbpqug+w9Z4fDXoP14+P8BW6TWgALLnkgFpoQBMCFOowIkVfLB
         ySurYtN4W+B2009rSH3t6x/ak40T42FnFKv8+/CPbJsHSiBbbfxku4LRyRB1tlFw+08c
         AciLqdFn4WX64EYnXUTEVnueiYjKFnpgk6sTrR702iT91BvgB+5PrHuLN+LNfHcvEFsE
         6vRCyZz7SUt6/eLqhF2yY1iFap8+ivhXcxuCJTZlTwmEgrVGpNo0e9NvLOf2x+VLkLSY
         /zp+U4fKZxpkPHmtEX0ozfMdAXBCutdSbC60H2mtboXc+NfJUalwezIXw5ex6uUNn6k5
         4qKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=PFgHzcWxXXD4Rdl+GsSG30wPNWmZLE0pgZMLsUnVXBY=;
        b=nHKMYhfAay8aVgwcfZirwzAUHxbTcmtfKgKcmsKr15KCaUrxGjovpbrdbdxkC19C+F
         tBrLwcfZFo49v/JDVPpXHvjOAtQkcHBIsLxRvPZ/1Cn26/xOIypW67JbWS2QXZrKcpkd
         IkWu599V6PexVc65vqJGbloyK31wIPXPDC6zU4tnrDV6+MnqfTW2K1h7MIFWQNoIQq9Q
         ifFLNH9U3a3IwleebioATibM9X5B6EwhR5qMcbfqud2Um4YRPDUHz9+hdrLO1xC3P2jn
         GTW+Kz3OXz4yDsnxLOrLI2+pFhpkFpH+CWwse1JTLKgT0REsvvGbseRxaarllI7afLbg
         BNjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wwWZ3UDr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id a15si337884qkl.60.2020.04.30.12.35.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 12:35:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wwWZ3UDr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUExe-0006tN-Qd
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 15:35:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47570)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUEwI-0006kD-ER
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:34:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUEvT-0004J3-4N
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:33:42 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:46283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUEvS-0004Ea-ME
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 15:32:50 -0400
Received: by mail-pl1-x644.google.com with SMTP id n24so2651416plp.13
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 12:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=PFgHzcWxXXD4Rdl+GsSG30wPNWmZLE0pgZMLsUnVXBY=;
 b=wwWZ3UDr4s7WgzJuhkn2ukXgJVtRmfuOif2cwgmAEQ3CwMlkvWvoTzjqKuyLNE9Nnp
 uU5Swox2iFK5RuF+gsnUanTKKzZIOtqxgbXMLeJvXjlRXgHEBX31qlhva2WRXzhCAqGt
 kkYFzvRjTIJDOeLcpuJr5L6fHvUdboqIMTVEJTW3v1PMArW7CHa/w2noWmzCzt+6dKvm
 xAiCZtWOJ//fr8ZK4xAA5K2A/QFwrnARZTtFTDy0KAFIEgyQv/71GUXNJoL9VmbdO4AR
 nTLaF8sdPOOc6dLG/zb2C1LNKE6/hczHyvVbmLk/aPEw9uLEuvZ2sXcmrX0UA5God2pA
 D+yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PFgHzcWxXXD4Rdl+GsSG30wPNWmZLE0pgZMLsUnVXBY=;
 b=oSEIZpLujUvjQRIuQmsKubiGFcFqY7I9XVjhb0U9ABkujcc0t0q0A4AnYMPwAb/t5Y
 8p+J+2E9EMKM7Sfjw4A3Zty1afEOlbvHOPAMjJkOlhveMl8IuDwYEqzICuHwQv/rBrMI
 f3Rb5aRF2R0Sd1Mef4ShaySOqdQGMrQiQ+dz50sEaqfIwYm4R8VwAWfpRuv/y2dxiLzA
 4Iqp5DPqp3VxCSHrpHZxXnviz4SVCqIMZQvmYS5GymMaGVqiwk9k1cHUsJAh3DQGMFNu
 b/qxn/ZrrQhxlfHu/3AbWJXm4JyuVVdsLgcuvIsevrPmRxFccKCBOxr+Np9VSwgyz00w
 VVmA==
X-Gm-Message-State: AGi0PuYBvOSEdF1IcvBMReuhsnIrEY2R4RTumiy2HETdjUDKRL9emajM
 VhG4EKuwZYo78va2pNVF+XoKUw==
X-Received: by 2002:a17:902:b20e:: with SMTP id
 t14mr529804plr.223.1588275168846; 
 Thu, 30 Apr 2020 12:32:48 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id q21sm461511pgl.7.2020.04.30.12.32.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 12:32:48 -0700 (PDT)
Subject: Re: [PATCH 13/36] target/arm: Convert Neon 'load/store single
 structure' to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5fb49237-362c-120e-cd45-68645efddbc0@linaro.org>
Date: Thu, 30 Apr 2020 12:32:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 18fu75a2EPek

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Convert the Neon "load/store single structure to one lane" insns to
> decodetree.
> 
> As this is the last set of insns in the neon load/store group,
> we can remove the whole disas_neon_ls_insn() function.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c |  89 +++++++++++++++++++
>  target/arm/translate.c          | 147 --------------------------------
>  target/arm/neon-ls.decode       |  11 +++
>  3 files changed, 100 insertions(+), 147 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
