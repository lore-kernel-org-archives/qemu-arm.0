Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp224922wrg;
        Thu, 13 Jun 2019 14:49:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxvF9Xw6YidbuEo+UfRcS4mQC7fteGawR+QTGBsp7v7Eqd6Hd388lw94+dyfnFkbBNfWfZC
X-Received: by 2002:a37:a5d5:: with SMTP id o204mr32890953qke.155.1560462582100;
        Thu, 13 Jun 2019 14:49:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560462582; cv=none;
        d=google.com; s=arc-20160816;
        b=sra7fiTGzNR4dCKTCGXasTKIHd7nun1+j/EV7Hj5x6DSXj92OUg1V0wV2jschSxHXT
         qUH/N78594vQ1ZEYuY3DbP+cZ4CD7INsAqPVDM/DSCNdDQ+fCDOHuaXr/lrlLgxgidq0
         5Nxkwp7ej+cxHyTOE2GtmyY7LW3IiTxzFn1kEf9qEqlbUPWYffEFo1D5qeXVRPPGwMxX
         dawk8kBP0ZyqwUYluqR1GGGmgC3X9Mtmm5/DrLmCiw7SdRrTnMDb5280/jDhZ1buY9XS
         MFBpRW6e3Q9gaXUBHkOPiBlNEMrL9GIy0b9T6QipI5PWaN41Ms2dFc52i9cowFtPusOv
         mN5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=n4y/JuQDvgzbZDtApL7lR7eGa7Q2dW+PtCzkJl0mpnM=;
        b=aW6yWU4JXda6T+XbzBNk3t22kra+gcjJP8bUDEwjSx3qbg63iMWtO9kUO9CR8St44L
         fyOZwQ93wQdHe8mUNTIkkV5hf3ev/PL3Rb6qJMSLRWO1lYU7dhYDFq8JHMclw/FMRkD3
         0AEDcKpIC3IOLs4mgg9WL/xVxs8icnlVo7LlqXjj40vNZ7fQoTsmA8vpGOjH/q1bMGV1
         iuFIzOUOnKgTZv5kmtrdLuIPoLmc3M4F1jkcj1BRPbfHMTIsJh4FdrfiysIDE9x47V9x
         cUSHNMk00CiMTLG8F5/U4hvHVOpWPW+O3Y7jV3AzlKMjvXCCBsGWrF+fIUM9IdZsNITj
         YHSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eMG92JBd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u38si465211qtj.272.2019.06.13.14.49.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 14:49:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eMG92JBd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45928 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hbXbJ-000523-Kn
	for alex.bennee@linaro.org; Thu, 13 Jun 2019 17:49:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52106)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXNJ-0000z9-Nt
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 17:35:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hbXNI-0003cr-D3
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 17:35:13 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:34718)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hbXNI-0003bk-13
 for qemu-arm@nongnu.org; Thu, 13 Jun 2019 17:35:12 -0400
Received: by mail-pf1-x442.google.com with SMTP id c85so75843pfc.1
 for <qemu-arm@nongnu.org>; Thu, 13 Jun 2019 14:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n4y/JuQDvgzbZDtApL7lR7eGa7Q2dW+PtCzkJl0mpnM=;
 b=eMG92JBdPblydN74EAbYU/Nzsa8ekzzWzjOmqZgVbgVQWgThCD7mipFsxZa404Uh1p
 YkT085uMubpYeyTd/Y4WNcgyNU8LTPhJaGhNwSoEPWe+ytQTezT/tRzl9bbVuBVMdAXw
 uuwGwIP1nC+YX5++Tb4GOXNwEIxu3rzdu/QLdI4Z87jRxvjQRCjLlHj+WIzhnNiURYYP
 RE3o/ifbnxFgrud+lm9KPOPJ11XIUkfF0eaq4A3c7zm3r1/e+dmS0QX/Rn/v9YUwIpl8
 6eUzLguTSHBk7r2xAFWG2oMmcU+1rKOcmir1oCOLhrU8B22oNnYzvGdDb5wnJUA7RL1m
 v9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n4y/JuQDvgzbZDtApL7lR7eGa7Q2dW+PtCzkJl0mpnM=;
 b=BJUsEYcjxIwZx5bcRYkUwx2Y8MNOZSdJ0h/eg1tKE9W7jtNPIo3+hyktm4WLvtVqLt
 N3w4qB85a7QqOSZb+0Xhg8O5is7Mx+hS3qis81L+2eiQ7GAYjk1MS1HKzhfKu+iKWPzr
 PpMkuM1vYd+xfRORv39N7c9u9SMe1u1yaUeNuDSCCTVgH2cITszCmMHCveZhv1dtRfms
 +VZ+434zqa/DRnbNZvw0tMB8Mv3YBIGJYx5iaLhiX416+AJcB+GCeF2K7RgtRFjpqdvl
 JxlZv/dpH2fQZnSLefFbKgW5NAPo7LH/eHN/maLrjZsJTj4a3ot9o8KrQ0ODAXkhTrUN
 FpyA==
X-Gm-Message-State: APjAAAXTXwThJ6GFi2zyxKx0PN88jbis2P36MqJ8N4gpMxUalbSLdF3o
 vpO4G2fn+xFlo4+0xh8XICPVTg==
X-Received: by 2002:a17:90a:9bca:: with SMTP id
 b10mr7569124pjw.90.1560461710950; 
 Thu, 13 Jun 2019 14:35:10 -0700 (PDT)
Received: from [10.10.150.239] ([149.199.65.200])
 by smtp.gmail.com with ESMTPSA id u5sm673204pgp.19.2019.06.13.14.35.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 13 Jun 2019 14:35:10 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190613163917.28589-1-peter.maydell@linaro.org>
 <20190613163917.28589-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <0a2c1c9c-6e4d-ffba-31fe-057cf394c592@linaro.org>
Date: Thu, 13 Jun 2019 14:35:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613163917.28589-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [PATCH 12/12] target/arm: Remove unused cpu_F0s,
 cpu_F0d, cpu_F1s, cpu_F1d
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
X-TUID: R0cFTbPIh44v

On 6/13/19 9:39 AM, Peter Maydell wrote:
> Remove the now unused TCG globals cpu_F0s, cpu_F0d, cpu_F1s, cpu_F1d.
> 
> cpu_M0 is still used by the iwmmxt code, and cpu_V0 and
> cpu_V1 are used by both iwmmxt and Neon.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate.c | 12 ++----------
>  1 file changed, 2 insertions(+), 10 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

