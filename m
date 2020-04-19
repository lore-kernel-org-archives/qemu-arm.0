Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp3002173lfm;
        Sun, 19 Apr 2020 11:49:10 -0700 (PDT)
X-Google-Smtp-Source: APiQypLd/DN/ihULoot/mzTGCItARPXuQcgN/H+3R6Iyps3B4ypwULJwSVPHvwpQM7DNbSKP9aEP
X-Received: by 2002:a37:a046:: with SMTP id j67mr12915484qke.286.1587322150456;
        Sun, 19 Apr 2020 11:49:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587322150; cv=none;
        d=google.com; s=arc-20160816;
        b=w+0bbY4WgCgLeJysrrHeQ1br/YbEkK+hawj4N5nfvNEaZ2mzlpzuvAxjS9CPfpXh3W
         ZMIllua5rjRPINsiw5k1Y7Ivc5UZoEb89KgXapkcr/MZO+OByCVo1VajqTudj9zd1qUG
         NtQwAqSnfjejI13tlrMkSu3A1w4Q4F9Ev9TRaQWScjXsoqLKj2xNAi/Jf6sbLerq9ojz
         Z2gz2ljYZHreTHFtMfMXwYB8LObJha02OeFW217iWOhMt1Qxef89ndBKR+HZQ02fUH1a
         9/pWxBrGJdsIFDTcVoaeiAZV/+yNOMmvuZYQTz9+xQ4+Jio6GX2tXoP142gNDqBZuoMm
         CNgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=OyeBkGtIkoGRqPrAYvVf7h8+XBsXT41Qh6d2p1IQw7c=;
        b=IGVvI53rvF8NwjVbUR/mWRyw7S4jwLEm1Rk8gyeh4KmmsJlI0zNmb8UVjTxHBIcYGS
         Bhb1n6/XcUedgRDtd3FZlesejVv+WeH5YGrw2HzjhpSBflH+cQpT8QOHryetNYgvCSYB
         8mk+WfOA5HPBI7zFbIbCAOaxwGeW9g/dLVVf3blNNZTb3Qq52WBBKHnzgkcZ9AVA4L0b
         vRjPQVcng1PbruIM7J2UgUm+7Fur/wVMT8RRGOlTeeY55/EIdprQglMsJupTdZN7O3dO
         szAHB6nYPhmKc2t12AZJ60o5Qwm1xltUoaUROYJyolXeiGJHnGPuwDB2qFp57hMm+ui1
         jK8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v4XFt+P1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11si15747419qvi.52.2020.04.19.11.49.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 Apr 2020 11:49:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v4XFt+P1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jQF09-0006Qk-TC
	for alex.bennee@linaro.org; Sun, 19 Apr 2020 14:49:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40606 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jQEzH-0005x5-6A
 for qemu-devel@nongnu.org; Sun, 19 Apr 2020 14:48:15 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jQEzG-0005nq-GA
 for qemu-devel@nongnu.org; Sun, 19 Apr 2020 14:48:14 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:45249)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jQEzF-0005bD-Vc
 for qemu-devel@nongnu.org; Sun, 19 Apr 2020 14:48:14 -0400
Received: by mail-pg1-x544.google.com with SMTP id w11so3910777pga.12
 for <qemu-devel@nongnu.org>; Sun, 19 Apr 2020 11:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=OyeBkGtIkoGRqPrAYvVf7h8+XBsXT41Qh6d2p1IQw7c=;
 b=v4XFt+P1Qi0nmdnnsQJROQpOUoX1c8pP6yqHyutBzuCr0rJB14egCmr9173I8ICtQH
 ekFBBCTTG9aj3wnY14xef8HjvHw3tBWx1w584cJm8kHkl0JVAFIG8s0MWuwZjyTtTRqe
 8XUxt3LNT5AQ6c6fMmx2oUB54wRpDl+34m2wNUcrK7mJWXRyOGF6/lsMkAKGXMMBfwog
 c8xuhZEu/8NKXew2/kKucyc0b5RiMacpznFtWbRvAmjfJdc2ck+bIupeyu9gqGKkpDNt
 JCIvwF//aOLKx9drkJHPesIcsULCF3sAOpviC5Zq0dgAtQbKkj5XizYqDwPMK5B/BHtV
 F12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OyeBkGtIkoGRqPrAYvVf7h8+XBsXT41Qh6d2p1IQw7c=;
 b=nPbTxGdEU2HPuYzp0yLoIUknyCJQw3RWoHKp+1e9G15e5gfATnHcYG5RbtdM+cEFak
 bOB4cT3mBHAYsbRUlZF7WehSLlo7AHq6siRV1RNwudcYbqE5D1KyImK5qPsw8KOYKcka
 ivSjCfx0Q7JrmLSpwiKV5qq0z4/baQjif4sGoSPu8LQZkAirRnOUosQaxPmeczyQ98dq
 GetScTF9RH+aygq4hFekBiZsg+8H16eBd9AeoiEJuLHIjIPeBFDhRekmT058O1kmvSB5
 rL1nTgR+q33Tou+UCZlw+8OmZjaWDcXoXEhb+jFBVnZHFtRyjK5opW8R6azCf+MsrjpJ
 s50A==
X-Gm-Message-State: AGi0PuYebJz3pJ1kY+0KW5p5VEfWrzimt6QKrlf/7bUaZaRmccHup5BB
 JRVR3cujZJ7KBtvCF8XevR/r9w==
X-Received: by 2002:a63:6bc4:: with SMTP id g187mr6233581pgc.75.1587322091844; 
 Sun, 19 Apr 2020 11:48:11 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id w75sm17531018pfc.156.2020.04.19.11.48.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 19 Apr 2020 11:48:10 -0700 (PDT)
Subject: Re: [PATCH RFC v5] target/arm: Implement SVE2 HISTCNT, HISTSEG
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200416173109.8856-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <258026b9-a001-bdef-68ad-14da75e152e0@linaro.org>
Date: Sun, 19 Apr 2020 11:48:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416173109.8856-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs1p.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mdean1WqqoBp

On 4/16/20 10:31 AM, Stephen Long wrote:
> Signed-off-by: Stephen Long <steplong@quicinc.com>
> ---
> Made the fixes Richard noted.
> 
>  target/arm/helper-sve.h    |   7 +++
>  target/arm/sve.decode      |   6 +++
>  target/arm/sve_helper.c    | 104 +++++++++++++++++++++++++++++++++++++
>  target/arm/translate-sve.c |  29 +++++++++++
>  4 files changed, 146 insertions(+)

Applied to my SVE2 branch.  Thanks!


r~
