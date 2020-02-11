Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5418770lfp;
        Tue, 11 Feb 2020 10:46:23 -0800 (PST)
X-Google-Smtp-Source: APXvYqypavNSAs5pxDnZHOYfQj7oAJiVPsZjqoU+ElSibO85O7ZHhRV0FGZ8cVG6G681Vp5ELYEg
X-Received: by 2002:ac8:71cf:: with SMTP id i15mr3764133qtp.383.1581446782897;
        Tue, 11 Feb 2020 10:46:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581446782; cv=none;
        d=google.com; s=arc-20160816;
        b=Ms2eCG4eSEPcdjzWXMtiZ/0eWQOjBBUrAL4JcT0V+3D+D4tWPiOlXVpyv8ggmEchO0
         8ckVL+p8QfBVdxf3f2MTNL3OJHI/LhfI3i4hbJhPTOQI/06z1C+G2akwHFj/kFCUV2mQ
         O8/MVMOJW7cT9CrbzQrGIZh6seJzqfviZPiaQ2H4DWDk5slVjEab4IXXWNTcBXhbxiMu
         PV5a84eoM8PxAQzrflamyfonbLKkqTKxKcVN2lfVVTs90T4V1dFWS74yu4niO8FZ6tg2
         3dk4F18qkwVeGrPPNv47X3jHC6c75MWnF4dL2q6S5LUANGnIkN32FrDae/9ChQYnJEVN
         ggZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=r6gPWX3/g+6vIoFJxQ/lWlYIH4Sk+YSoh5tuSdn3GfE=;
        b=dmW9Iztqa+kkUR5kQz1mwfVsRrMxVT8j4f+ejNn8P+JVMmi2Y5aXTPvyIrVrqXyUpJ
         3chcBUCQPgS2MF4Jij7PsvcnBg4HmE40DGhV1hj8iJwTqp2XIbyJrwshjJVMBAB4qP4D
         D5Swwv5oIWLyS0uqzv5hlUHUlHy6cZ6xAWdHFd1ITNopXn+nXpbI7eqDjgJV2Z52YUdm
         SvwbOl7iFOSl2W8BBz17O5ZRTel3zkQhE3offtoeOxqgpQ7dM1qjdStGvg7XIfSsaAVO
         QmnMANvtewSWKpUHZ3nK2L9KYKyh+Dfzbs/o9n8ffTEFKMIj1/BbyOkOM3qzCJvPbHTw
         CxmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OC2po4AY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h17si132481qtm.150.2020.02.11.10.46.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 10:46:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OC2po4AY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1aYA-0005ul-BY
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 13:46:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48862)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1aXr-0005u4-P3
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:46:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1aXp-0002sp-Rk
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:46:03 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:43455)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1aXp-0002q1-Hm
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:46:01 -0500
Received: by mail-pg1-x543.google.com with SMTP id u131so6171061pgc.10
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 10:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=r6gPWX3/g+6vIoFJxQ/lWlYIH4Sk+YSoh5tuSdn3GfE=;
 b=OC2po4AYaDMOeO6PtX5B9e++ZvKbOJIgkJp/UWGWw+WM5ja9APJ9UIECk2KYHWvB+b
 YyFKiBhRtCc6p7X45LembX7AzSI0BAqwFhaP8HX74A0w2LFJ4bMmKFYIyKJ6nVfRrGNF
 sjVeAwWrqXfX8Mh0pa4AHSkiCrAt7LmeCaVQTpEwCbIXopJ6E3PIOOapflm7uqCYeSsF
 i6qZ+CqEuth/m8zfMyRZAzRZqT2B81ewkW0IkzNnRVu/2tlLxqbMLyzaaV/wTkxKohzw
 Hb4q0GUNiSvbQDWFvaySoAxZYp8yDyXbi5054qkKO1TVNWmUW7fykY3RQRvJgytk++Uw
 9GDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r6gPWX3/g+6vIoFJxQ/lWlYIH4Sk+YSoh5tuSdn3GfE=;
 b=uFdS2FpSfGwc1tbbpw/TNTIQbi9SIkRgihupeGQea8a+qCYM9IyhGjk7mkrnr2gGlA
 XGWWbK1kzICB3jhPNlIMXbNZN4nWZ2fM883GWISCZLBntiUivADyDgy/nA2M4LOMHhdd
 DFWQu91qrf8gT+zB1vCI+ZTTwICYLRsLdG6QULfcQqXR9O5LThlAwhz2O25rhzBBh7n9
 dBfWrTiCR3F28nL/uR7vOQ8VqPzNJlfyAJm2FzIjivwDJN9Y2u2wjou2Qa93ptQwXQ3K
 D8U44m6Mi/Pvps89LqelRfhgzoogmzRfQxxbDt1zHb5pu1FrDYqWGKCMYBDG/VXe5mb/
 QaYw==
X-Gm-Message-State: APjAAAXqMDvbwArcjF5P+bCqx3yo0s8vpyOBkmA06fuWdK1IK5hahdDF
 BjyYhb+2otlLV7mzIQyDETOXAQ==
X-Received: by 2002:a63:1c4:: with SMTP id 187mr8340628pgb.121.1581446758007; 
 Tue, 11 Feb 2020 10:45:58 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 g7sm5199218pfq.33.2020.02.11.10.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 10:45:57 -0800 (PST)
Subject: Re: [PATCH 09/13] target/arm: Implement ARMv8.1-PMU extension
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-10-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9fb5335e-c8ae-1f3a-4f1d-c4cc87369968@linaro.org>
Date: Tue, 11 Feb 2020 10:45:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-10-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::543
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
X-TUID: 1H/RO3uLAMoK

On 2/11/20 9:37 AM, Peter Maydell wrote:
> The ARMv8.1-PMU extension requires:
>  * the evtCount field in PMETYPER<n>_EL0 is 16 bits, not 10
>  * MDCR_EL2.HPMD allows event counting to be disabled at EL2
>  * two new required events, STALL_FRONTEND and STALL_BACKEND
>  * ID register bits in ID_AA64DFR0_EL1 and ID_DFR0
> 
> We already implement the 16-bit evtCount field and the
> HPMD bit, so all that is missing is the two new events:
>   STALL_FRONTEND
>    "counts every cycle counted by the CPU_CYCLES event on which no
>     operation was issued because there are no operations available
>     to issue to this PE from the frontend"
>   STALL_BACKEND
>    "counts every cycle counted by the CPU_CYCLES event on which no
>     operation was issued because the backend is unable to accept
>     any available operations from the frontend"
> 
> QEMU never stalls in this sense, so our implementation is trivial:
> always return a zero count.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 32 ++++++++++++++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

