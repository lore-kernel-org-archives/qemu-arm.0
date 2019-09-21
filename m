Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp731535wrp;
        Sat, 21 Sep 2019 08:27:50 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyny4n1hxhpIiAZmcLYzVLhBgeJfHEEHuQFuOjFfnz0yskjnqlNirzCvPDrNpMnARJQe89Y
X-Received: by 2002:a37:83c7:: with SMTP id f190mr8361025qkd.221.1569079670384;
        Sat, 21 Sep 2019 08:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569079670; cv=none;
        d=google.com; s=arc-20160816;
        b=O4KbnrCEEWKDiGr5kvwGOhi2jyKY/L7HOwG1cOQpZ48MNW4mmSS380FICbY17934Yg
         9qV084nRitIFx4hB5SFCgqn7YTz1CfaOWeobw2xA6Zy7FEqZIvFvZIYdmv7FHkEybRq3
         uDEejoxmhfhz2S+lCSi6JWFLTJRKMN2slwgR+WEOEQYsY0rAfBuCkBmQhzfo0BD6efgF
         5kcRbfdAp5CmdpTW0M35PpqLxpEQGiaRLcTWTDeMhkzQELr8IBiDhdvzkhIGJ75qWOn2
         FoGGtil0sE7Aw9+uwLZY5kV6e8miDU4aH32qgEgFMG4ZxnV39XhKGthsHwlO92W4CfJi
         HUgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=54rGvRC2DHDrzSXA4F9r+xIfJe2KBhX8HqaGRlC98Us=;
        b=ex5zBApjnUy8TYoqq5vE4FQ6qq0lb+04aPSv6a8xsrwgT4glxZozy+sgeVT2pzz36L
         6XfcieF3tq14/QmfBPg2057arYIBvi/9TryTHaiul8KP2Auh/HHinq8/fZgH3pRdE875
         tFXg/OF4xHAi7m2gVSulminxrmDGO0QRZ8rVufVn8L2AFGRptSM7AXVvjPKPmjkeVK6+
         tm62vByOggHoe+LbcKGEsew2bSCX574hxZ/qaNzbVj4r5o+Ow3jwVdAL1p1dUz3Af8cr
         dlWeHSX7APIZz28Niluw2EqzvZA523pku8vu9Vy6ePy1KcaD6wR1VXbpsvYz8VIUCqR8
         +DOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WGV7AXzr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11si4583753qtk.198.2019.09.21.08.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Sep 2019 08:27:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WGV7AXzr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iBhIb-00071F-Nw
	for alex.bennee@linaro.org; Sat, 21 Sep 2019 11:27:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41492)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iBhHg-0006QW-0R
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 11:26:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iBhHf-00043l-3b
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 11:26:51 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:37520)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iBhHe-00043N-RN
 for qemu-devel@nongnu.org; Sat, 21 Sep 2019 11:26:50 -0400
Received: by mail-pf1-x441.google.com with SMTP id y5so6470228pfo.4
 for <qemu-devel@nongnu.org>; Sat, 21 Sep 2019 08:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=54rGvRC2DHDrzSXA4F9r+xIfJe2KBhX8HqaGRlC98Us=;
 b=WGV7AXzrPrHjbY72MWE3HQOyxMXk9Uv/QHqSWTx3J1wsWtTeXI3+i8G8Ybkm0PX5Oj
 wgA83b8J0ksXgdHT6du76U6IOfna6gOZltatny2qMiW1RT8dnGJGmIhza8hFiGQ055uZ
 dwjXc66SohjbF190q13QHPB+7WZRBjToSx77lpdgQJ11CEBbBayFl5NTh1/Y9CfEy+eT
 0mHXdPrtKgAAYpbqtxEJxu8aswq2BE5YJ888lPbhznq/+H1XTR7pHI6H+rBqKIoIsMuT
 pOXhCf18QK72sg05A5BLprWQp/WMgPxri1+hOCLMXsUSoKMbJt+5d/vaSlw0rLVZwzgq
 uwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=54rGvRC2DHDrzSXA4F9r+xIfJe2KBhX8HqaGRlC98Us=;
 b=faQiZFMiOiaH7381fooHBApnM/vij9AZiGXnWxfAprF4cbEvHazGsJ905SvC3KYwPN
 Ws8Xing1hFZnETDhBqM71LXMe9SEWxPf/H2KRNWQ1/ZzBhXQ7vMdmjVMfFuSk5jXqSwm
 GWxNltlR38NcdzmBcEmKSN+dVXqVn4vDpsTeQeJvL5PZoZFzj2rpmXMj3UGgvf4WWV6N
 rcFYG6Vm4McSdEdSvNC3lZoNY6JAFrO5ColD4RWlbR5tqxdD6hVXpgfJonFG4RUkBYk/
 8IKnz1GOCcpzqdtETFCXhD+FDVEbL7T6oYiTwJOM39x93MvJc1sFLl4IRav4bHL2pme+
 YkfA==
X-Gm-Message-State: APjAAAWH/b+hAaimzOKZ7MERkoeVfZnjLc+WL20aw5Yrx7sn6J1z3d19
 kvL2zWQoEyOkfQ+p5Qy1wKx5IA==
X-Received: by 2002:a65:6254:: with SMTP id q20mr21209552pgv.423.1569079609657; 
 Sat, 21 Sep 2019 08:26:49 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id v18sm6083361pff.32.2019.09.21.08.26.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 21 Sep 2019 08:26:48 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/boot: Use the IEC binary prefix definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20190921103405.19623-1-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <089a9b68-b1bf-66a4-f696-9e7e28bf6c4e@linaro.org>
Date: Sat, 21 Sep 2019 08:26:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190921103405.19623-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vy6EH+ueIRtL

On 9/21/19 3:34 AM, Philippe Mathieu-Daudé wrote:
> IEC binary prefixes ease code review: the unit is explicit.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/arm/boot.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
