Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5183327lfm;
        Tue, 14 Apr 2020 09:33:47 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ1BsQHtY36vMMpdTpQngk6tlPJI3r+TKdoTBQoZrw/UWojETE4dK6MpwJhIgCEil8nJ+eI
X-Received: by 2002:a37:dd5:: with SMTP id 204mr12833410qkn.321.1586882026861;
        Tue, 14 Apr 2020 09:33:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586882026; cv=none;
        d=google.com; s=arc-20160816;
        b=jVa8V4xAz8xaG7JyYQGe+5J/TRKa5cQNO2eh/p6Cls2GHqMgdMEu8G2zBIwwHQlqh0
         jX7xW+uc8g6ePT0E5V53xapNe10WOOOiy9A/CRabk6lCDvGO/jey1j5vSunipxJiJdqF
         811rQ/AzpiCvryPoM0m+W1tMWp5ZQJ12uoNw5DSmg3fOyr4Ec1AbLLMuof+WP9W7aiuy
         kdyw84lUwJAC9lZ63UZIyQ7a79yvnu1A/b5d9XGJfE2vf8Ci+1IaKZI5N/uOTjoFQFOL
         RRj2UhAiQ/LZVTFBorcEFGrbopg4P90EHjr+BelGVTImxUwYti0Iaklh+08fNOd9NqaM
         4/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=5RQ2wSpsjJpzp7+16tdJJpRXhZ+KgD3tAKq0P8YKk4c=;
        b=yzPpqZrTpwAf9UPispZz05MDw5WutSVhcuS1VvSvdzzuY+VQwEgTxh65j2VWinyf9W
         rqFQg8RdCCn1m9Zh+urp9HfskUS4UaATuV4VmN/8myArLZVsVwZxwOAsN88xtYJpVELB
         Dp9FV8DyLXAaT8XPKa2zyOxwUnrZI546lt4aJdnSFfLQ5s4XMmfamATXczfmo+jYWNbX
         BJTTgDYn5Gdt4Y55NGvSX9fPKRuOYzwJvl2ISmWDTPzWy1+7s78djU7r36zUsjWCbe6c
         3/BwSLroHRdaZ6QfoNc4EEakpntaId2g8klmZaNq39QcCjNNYi0EYOR4oV2qblq+jOeb
         BDoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oviq4tQk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p45si3716781qtc.179.2020.04.14.09.33.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Apr 2020 09:33:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oviq4tQk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jOOVO-0001da-3d
	for alex.bennee@linaro.org; Tue, 14 Apr 2020 12:33:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52380)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jOORF-0003HW-IP
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 12:29:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jOORA-0008VO-0J
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 12:29:29 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:42303)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jOOR9-0008Uw-QV
 for qemu-arm@nongnu.org; Tue, 14 Apr 2020 12:29:23 -0400
Received: by mail-pg1-x543.google.com with SMTP id g6so103611pgs.9
 for <qemu-arm@nongnu.org>; Tue, 14 Apr 2020 09:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=5RQ2wSpsjJpzp7+16tdJJpRXhZ+KgD3tAKq0P8YKk4c=;
 b=Oviq4tQkcduoMSH0vwqoGkfkLL/gchTHIcCcSG/EoYi0HA1smeA9/6tf1deSzaM0Zt
 LBaBRX/GYKre/3tfvkSkN9C9aOmPveg7nbJHK1+iGcWSz3hnleW71ZHUkUuvqzbK3hvv
 g6wybJu7VZry3HQcBkKVa4pRApdFcffPNLoglTg+i8wcpU8d6SuSWl6dzO9QUfHdMSu2
 u24Q49WgL5NjHdX68HxMpUeAf6+wCgjOxW3moPTWOJjMdlELE9OHSl/1Ec6uhUwWLSAT
 ibltO+tA0SSVnct2jrvATCxp+/uxih8FfJ3DDLxb9jAjeWePVuPnlKdH95Stv6Xd3Hj9
 cgWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5RQ2wSpsjJpzp7+16tdJJpRXhZ+KgD3tAKq0P8YKk4c=;
 b=cQVdly+DPXu4Mnx6dtZ5pwIEU6DUfkNEc+/fI8joH62gGF0PseVgU6PPSiLRwsH2Xh
 x0Cd0hASRp78rKbPXxaiNoRTovPK9s1vWy41cVBk1sttcqHt9YDh5yHIJY3bbtHZF/Ay
 7+mdfZTml7VR5Ax/ro+rBsAxiYfncp0MtLsONv3dQzgaxdgMW0qWtOi2pZC1lSAKr4kd
 JHCtodbfoFwKBwm1EIdMqTW5Pnkxc4J+U5aotSi3rCvt+hvSNBIjYGeouQRGFj8PSks6
 KJtZS5grwl8sWONjmHguAOx86BVrDKOmMVU7kC30FbpNaE6YoD8+/kB1j52AiXvh6aqc
 eRcQ==
X-Gm-Message-State: AGi0PuatX1Cy0KCk5b/i6kaAJzTpOc+i0guepOMcJg108INttht9hb2t
 XGNLCsxlprweUDGtn5OXRLaEYA==
X-Received: by 2002:a63:e80b:: with SMTP id s11mr22175390pgh.350.1586881762325; 
 Tue, 14 Apr 2020 09:29:22 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id c59sm12634846pje.10.2020.04.14.09.29.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Apr 2020 09:29:21 -0700 (PDT)
Subject: Re: [for-5.0] Deprecate KVM support for AArch32
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200414120935.12719-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <6bb58601-5614-b01e-5ac5-5d3331aaeac9@linaro.org>
Date: Tue, 14 Apr 2020 09:29:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200414120935.12719-1-peter.maydell@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T+90ggYCR9rY

On 4/14/20 5:09 AM, Peter Maydell wrote:
> The Linux kernel has dropped support for allowing 32-bit Arm systems
> to host KVM guests (kernel commit 541ad0150ca4aa663a2, which just
> landed upstream in the 5.7 merge window).  Mark QEMU's support for
> this configuration as deprecated, so that we can delete that support
> code in 5.2.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I was reading the 5.7 merge window writeup on LWN this weekend
> and saw that the dropping of 32-bit support had gone in; just
> enough time to squeeze our deprecation warning into 5.0 so we
> can drop the code in 5.2 rather than 6.0...
> 
>  docs/system/deprecated.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
