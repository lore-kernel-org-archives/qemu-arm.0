Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5424027lfp;
        Tue, 11 Feb 2020 10:52:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqwPCDgPh2la0iusn0N12p9WtnrPBIG18AXVe1wIWOVM74oiXdbuuIeeTGPlRqylAzJZQTnD
X-Received: by 2002:aed:2798:: with SMTP id a24mr16209233qtd.184.1581447162275;
        Tue, 11 Feb 2020 10:52:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581447162; cv=none;
        d=google.com; s=arc-20160816;
        b=gThKUCLlD+1Pq7ZQvy32/bRP93Qs8L2eBaxhtU+LADnSxq50ErkxdHFEqYP7chFd+U
         RyOVpukqtopE6a7CveuZuorQzQgezn1ubqjqtcNJBH5yWBf27s+Ptj4t2Dmtk6jEthaa
         9dPyjCazKn+LfGB2ZKrA1Bt4n4m/1/BiY97OJK1wFzrsim8/tyUTOep8PORNa1uWxBj5
         T0yBVEC88Jz94hW6XPfjrpEHvn+la+vZct+fXDiSnQVj52iH1LEAat34Ob+gqu1uNAb9
         dr6oDpr9abTYo8qIH4f5bqlfgFYih5ebGO6RJy7fI8ckBdG9GYK+a0lpnHNyVT3TQeQn
         uKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CbZNzgjrGSjXcMZsbGNkGs/yDru9vx/NqV/8iaU0Se4=;
        b=Mx9mJiC7rcbthvA0upNrzS3+DyiYROFH+j6keTvmtXR/OrUqGOcnnSS+poWA2Zbqj3
         wd1I/syXbZy8lT2fmNeIsmTAJGJz8zSERkzgrckLLTvh9/Q8sG5L6STHnkmG7oZvtKlo
         rLEi6eI4dQPMR9XWXruM0MBNBnlpGhXamsiEqu1BUVq5Rc8fRLbhzoB9OBRBbRl6Mnl5
         35h9Fyyzt+oUS20KaWSvstmrTsbrxJetiE1ZvOVpE9vo80D1t1WmExUal6laDTxzjsTF
         xsM4plfGUXKiv+iXpXMXTBjDxSnwGarfzI1p8k+C8uZppJKGz2jr4IwmUYHTkUeXeqPK
         PvDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vCtkP7sc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w65si2369929qkb.63.2020.02.11.10.52.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 10:52:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vCtkP7sc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1aeH-0002QG-NR
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 13:52:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60386)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1ae1-0002NU-Py
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:52:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1ae0-0006D6-U3
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:52:25 -0500
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35055)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1ae0-00069m-Jr
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:52:24 -0500
Received: by mail-pg1-x541.google.com with SMTP id l24so6200815pgk.2
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 10:52:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CbZNzgjrGSjXcMZsbGNkGs/yDru9vx/NqV/8iaU0Se4=;
 b=vCtkP7scs1q1XB2DJNx2RGaUQPUxvxilT5wdGsSOc9iG5jQ+mFcemvIXyBgGAXzb70
 tOanwnHlN+pHNtgVuVanZ8+pDfJFGkOMdv01mp2jV9hkuCH0LtLq1U5Rjns6qTFA9yC2
 1ci7P6/BX4scm7uVS44EI7Scwal/SwF/GjGMCVQxMFusCEQEFVM7v9ZpD46JZZqabjEb
 z8VR1Cf4fg5z7uE1i+wfZNLpQ2RM8KVk103+9Xnq/lowFPLO63oVepJ65lGl/jXYUwMR
 aHw7W4Oh+ImBnxFt2VgrJ1G4tzEDWp5m0QIGVPGxJLsoM+nesLICTh8IwC4K65CXzj9a
 +/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CbZNzgjrGSjXcMZsbGNkGs/yDru9vx/NqV/8iaU0Se4=;
 b=UgFd9bCkGkHH65raKafdVcvGSb1lwMSpMRFZif9sX/QUB5eJ2KPbBTYe6YoZh3tZgI
 A6vew2YM9XS+nAMVsE5WMxaoJGZKM4UcXr35Coedo8z4QSvRtAhJ8dy2GpPJqKce1fo4
 3y97w3AsZEk1aS7fcRVomeCh7WAGaocWaVCu1/DuQnvIZ+2KDHrFZKSvbYba1PzELEPT
 /KibhJJn0qRsbHYg3Go3N0ZkurM1G1CXCmtx20KC40yaRfAKF3gm6TsgR83+RYx7TElc
 gbfchFLu5dBfvZc3RlERjl+QX97YvJSHSxtLWha16QYO/QLf1vTxfLnj0SrL7R5akpw4
 QIIA==
X-Gm-Message-State: APjAAAX+lFma32MRUez1WFcO89kve+ILKSplte+Px/MxgHy5C50UQYG8
 alY4s/7UbsOTTLMXfRvNOyTYCQ==
X-Received: by 2002:a63:1503:: with SMTP id v3mr4491495pgl.295.1581447141585; 
 Tue, 11 Feb 2020 10:52:21 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 144sm5479098pfc.45.2020.02.11.10.52.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 10:52:20 -0800 (PST)
Subject: Re: [PATCH 12/13] target/arm: Correct definition of PMCRDP
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-13-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5e32fd9a-e872-93ff-b3e0-0e8fff5faa4c@linaro.org>
Date: Tue, 11 Feb 2020 10:52:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-13-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H66nXG1ma3Vh

On 2/11/20 9:37 AM, Peter Maydell wrote:
> The PMCR_EL0.DP bit is bit 5, which is 0x20, not 0x10.  0x10 is 'X'.
> Correct our #define of PMCRDP and add the missing PMCRX.
> 
> We do have the correct behaviour for handling the DP bit being
> set, so this fixes a guest-visible bug.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
