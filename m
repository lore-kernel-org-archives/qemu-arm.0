Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp799597lfr;
        Thu, 8 Apr 2021 12:02:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwhyl7fUo7XgmiTXFhruWewPJXsOP15eu658iWneXYSONAeksk+ELTvN7crR/XxMicajYr3
X-Received: by 2002:a92:da81:: with SMTP id u1mr5770318iln.277.1617908567903;
        Thu, 08 Apr 2021 12:02:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617908567; cv=none;
        d=google.com; s=arc-20160816;
        b=dNL9iqeHKVFECrEKEUvCy7HLSwuV9yYkW1hQwMEZNHTMFD7UezqO+TqlOgIaTj0nNK
         sbEy9I9Ua9Vy2Y0ejA53fTJ46bQE6FtwviHoWmfCpXgLFKuyfxJGOCrer2QdrPctw9tt
         ULR503AmTbmkR4drl9Q85xYi8rg2jVd+PvImzPb+DVXtzr8SRE3MmItRRj2tJ1yCPNoL
         sVdRlhAnxPC42XnnBp3ii2EBhEwEMnGmuWELprSgUiyOTNvnqbpHTsYnyPswEK3t7sDj
         2OA8Wh43zrH1Anh7zLyYx4EInBvb4wgdhoWGNQrEnr9ab9UInn/XjcheN4RnMigql1ev
         Rl5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=/RC2woicAhT9BeFgGt8wkGTSLl8M2IlnXee/9V1qwgg=;
        b=kFipWxvYqb5Mc4WXC2mZJA/KoZzLj7fm1covt8JWvnLzFgZkwbmXZqx8gok/K6LOuV
         ngSN4JfibC+AHLRjoIaFio/WiZLoV1q1ssNJ/84SOLIQPN89fO/rPmH8cU0HDNAH83V7
         RQ6KN3LD1epA4eid+nUT0WhnPOVNzwK03BeIH8s35LOOCXPeev3SRNjwHuPniUcBUDmU
         g/w8qEOveQROgNWtOkPhKJjRLqv8kxFBxOPejVO5Vit4EdNJXPbh/GxTJag32vwoSTZv
         qdAQRL0Cm4vhBABEH22+JEcnLEWVw9/J2HKvjDJwufr4zenv3JLzTG8gWUqjIclyypR0
         rpZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cb1cvbIg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r7si134254jad.72.2021.04.08.12.02.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Apr 2021 12:02:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cb1cvbIg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUZvR-0003in-Pp
	for alex.bennee@linaro.org; Thu, 08 Apr 2021 15:02:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUZv5-0003iQ-Pu
 for qemu-arm@nongnu.org; Thu, 08 Apr 2021 15:02:23 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:39882)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUZv3-00015T-Fj
 for qemu-arm@nongnu.org; Thu, 08 Apr 2021 15:02:23 -0400
Received: by mail-pg1-x52f.google.com with SMTP id l76so2066943pga.6
 for <qemu-arm@nongnu.org>; Thu, 08 Apr 2021 12:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/RC2woicAhT9BeFgGt8wkGTSLl8M2IlnXee/9V1qwgg=;
 b=cb1cvbIgP3K5xjK+nWLFaet4GCziKVElnHcDQzBzOGgEQHKeUDSugN10Iqi6etfqp9
 0TkgrmcRXGPFaKMZXYQxi/peo9iXlqVIAGj5tZQXSEOHfQqNTpnjA6wXhDhZKhxIIGqO
 ogs/zrTXsouAdPEcgwkB7jEPDnQ85rO040wWaBFhBcqUhXL75gnyCsAf0d8zd9be6otb
 GeevuZWDzO0g+HfhB9LCV6cGulS84/Iql7LMshFBl9ithwqRDLy5oe2KKOYK8e3/E3T3
 lJ9JjCScW4eHIc66CY5iBFnVKpUtIKtRuVjw9qXDXG6IKHXoDyB3sIoNBGLSZKCXrCKt
 gs9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/RC2woicAhT9BeFgGt8wkGTSLl8M2IlnXee/9V1qwgg=;
 b=JsI6s6ou335daSCSjxQJLLI9PF9Ct4GO4Agl7AXUrgsMFSM9lBS58uoMBHWaWggbyW
 7NK0ASzU1d3OPie8/UlErxmR6C3e7ZWfx6kAcYWcMQ1UKCFcYDJ7+EhuFE08u+vLK/eX
 plRjmuO7E7Xv0+w7KhE5cJsA13JXRJBVV4yLA5R+G2G0EWK+MoY2b1qqBapt3NFXWC5+
 47YBadEyK5VauKrBfamym1pcljkD3m7bk3iuYceMNED2JygTw1uW5CS8GzpY+qaVfWST
 GsHK2ePSBAiK0Zi4t06EOb0ITtAu9sdIAaWmMERCNb4lv/MIe1pbNKhtghIRFnQmhRIk
 iD+w==
X-Gm-Message-State: AOAM530KHiNh36kfH/A+f9fwNx517CPg5yxxip0sEc6kKKkh1ZK9swU5
 JyNMmGg6d3W0yYAlHR8q/++pkA==
X-Received: by 2002:a63:ed49:: with SMTP id m9mr9427606pgk.323.1617908539679; 
 Thu, 08 Apr 2021 12:02:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id j13sm199211pfn.103.2021.04.08.12.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Apr 2021 12:02:19 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Make Thumb store insns UNDEF for Rn==1111
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210408162402.5822-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <547fbc49-7dbd-e250-69e9-1188b85f668a@linaro.org>
Date: Thu, 8 Apr 2021 12:02:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210408162402.5822-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CdIGIExmRDZ3

On 4/8/21 9:24 AM, Peter Maydell wrote:
> The Arm ARM specifies that for Thumb encodings of the various plain
> store insns, if the Rn field is 1111 then we must UNDEF.  This is
> different from the Arm encodings, where this case is either
> UNPREDICTABLE or has well-defined behaviour.  The exclusive stores,
> store-release and STRD do not have this UNDEF case for any encoding.
> 
> Enforce the UNDEF for this case in the Thumb plain store insns.
> 
> Fixes:https://bugs.launchpad.net/qemu/+bug/1922887
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
