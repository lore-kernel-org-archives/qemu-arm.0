Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1084869lfg;
        Fri, 26 Feb 2021 00:56:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWlJpZPnOPhM0X2TrKuCdXlI1b85ESqcimN9T5fEQ1dlBmawPF7qn46PkO+LPn2pHURsjY
X-Received: by 2002:a25:6196:: with SMTP id v144mr2885820ybb.10.1614329816040;
        Fri, 26 Feb 2021 00:56:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614329816; cv=none;
        d=google.com; s=arc-20160816;
        b=ojH9ut/zxsK9c/lZGvkmcygml27fW2UbCA0aVi1pEFvHbgLNcvHVkO/iwfxHf5GX2b
         hvBrZqD1Uf/GIO+OnJedjn66w/JfFisH+B/8dmVCRtc3jwROncrcwsDRZoCC9Lw9QvJU
         75xbEOWVRso4Gg9CPzw1NjpjuXAhj9v8Jlw4KmUEGrCX8lPCQvzlzKnEBErz8icrWTHU
         QxKRucpHjV2Lh+oGc/WPmgoh3psE1QoNWwIYeghKOw2G0rF6ex4c9d6CWZXNc/tC4xgn
         2YnLvfoCkxYP2P1oTf5bjLNSc8RE78CLKhy4UxyvW3Y09dacOvO3vV2CdORdiRbuA5Wm
         XIRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=si2XO5gOCCeOdiq1YIZZglaFpvobFXE3CJjalPzTp/I=;
        b=wf/1refb+UEdNnmlx4MaIQrtbpbR/X8K/xUbj0NnA7jdO7ACgU9e9Y+iUAVignEThJ
         f8CKgxfil41OJTu9Fg1Ls/dGF5RvZjH8ayWFWF9y89HV2S4XhGndms428B8nK9OmlOdI
         UD8gROwjAUzpL02VPSu5C65YHisI9Wf2aqceafr5+7c3ewuwAaYd3NehYRgDQH4l2GiW
         QNY+KE/f/2U1BzfRRnA2O36EaqJbvj1XigdR+Y0umRntXlh7VfJyU9Mn6Yy9i6RCCvX4
         kHSBjxOpYikWVP2i7df529CH6QnEjJcGaam/Lei87bAIMg11Yttz/x66pdHu/kih6i1b
         y5fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Te3mDxTL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x13si7820286ybp.142.2021.02.26.00.56.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Feb 2021 00:56:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=Te3mDxTL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:47178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lFYvf-00043N-9p
	for alex.bennee@linaro.org; Fri, 26 Feb 2021 03:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFYvQ-00041k-Qr; Fri, 26 Feb 2021 03:56:40 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lFYvP-0007mL-6o; Fri, 26 Feb 2021 03:56:40 -0500
Received: by mail-ej1-x62e.google.com with SMTP id jt13so13522815ejb.0;
 Fri, 26 Feb 2021 00:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=si2XO5gOCCeOdiq1YIZZglaFpvobFXE3CJjalPzTp/I=;
 b=Te3mDxTLSn9BXWwnKnQsx/v0ZMnp2B5hT5uKlKk9d998FJjAWjnv5BvQ3KLAA9C2tM
 7qTBSofalPAXXTPLHN8P5oRpQG2b0hdek8Li6XiNquVGSbPQQbz8gafl7Sgkhp94eLKd
 uEvxyuXxnzl0RZ6k/iATgpf8ID+gwITJ788FORIIjntgbXk5a1u+d1XHOGzDGtHsQq3S
 KtNSqmgSZLvrahxwgLXki0Q6J5/swes6BUfrGp4ODDuWIzow/FbIQxOKH3+ZH2iRrqkt
 HupzElbtkq7I9/HXrli2KBw/raJivTxR3fFJq/GUvoEe2yoxbI2cNu4iYm5ml7lcZgRj
 wZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=si2XO5gOCCeOdiq1YIZZglaFpvobFXE3CJjalPzTp/I=;
 b=fbnX5hEFGN4H47Jt5QYGEtjwMm5BVSeJajvuderD6qUHofMj0M+hgmYTotnc9d0yt8
 s+xlC56pvXw0nZJ5O7WVx/rZhOGjaBGVYLhJjusUhjuYPyfxgB7rHiqBsmq1rhze0CZ1
 rQJ8UcKosBinVHFSPM+Imkw9OY8Q8enfvWegSmyWFnFM8kypyay2k40C4SL6xCwEKW42
 sGyCFw6QmdWdhj+6ZuEaJFCFVVI++evcVBObxXY17SDv5QFOHPPnPs9iEW7zByK++4qK
 IaMFcssf47xHCFYk0X8kWD+iavutHt4f/lluMqfyFzGLM++Q3YmzD/8huQZ/kfGa/eXr
 KPkg==
X-Gm-Message-State: AOAM531fe/u2ZKWsx/kciGUS+QcBFQ7+dfMV3/P5GyjHKdR/+v714C9J
 MjXCO5zuRaZ957p5FqveJnk=
X-Received: by 2002:a17:906:e0b:: with SMTP id
 l11mr2192795eji.523.1614329796498; 
 Fri, 26 Feb 2021 00:56:36 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id jj16sm3788177ejc.19.2021.02.26.00.56.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 00:56:36 -0800 (PST)
Subject: Re: [PATCH 1/4] arm: ast2600: Force a multiple of 32 of IRQs for the
 GIC
To: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org
References: <20210226065758.547824-1-andrew@aj.id.au>
 <20210226065758.547824-2-andrew@aj.id.au>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1681fdc1-2c9d-db2c-a872-c0ff156e07c4@amsat.org>
Date: Fri, 26 Feb 2021 09:56:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210226065758.547824-2-andrew@aj.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.435,
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
Cc: peter.maydell@linaro.org, ryan_chen@aspeedtech.com, minyard@acm.org,
 qemu-devel@nongnu.org, joel@jms.id.au, clg@kaod.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 98+dB/U44dvW

On 2/26/21 7:57 AM, Andrew Jeffery wrote:
> This appears to be a requirement of the GIC model.

If so this should be adjusted in the GIC or a15mp_priv_realize(),
not in each caller, isn't it?

> The AST2600 allocates
> 197 GIC IRQs, which we will adjust shortly.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  hw/arm/aspeed_ast2600.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
