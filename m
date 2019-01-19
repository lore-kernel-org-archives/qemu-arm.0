Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4439872wrt;
        Sat, 19 Jan 2019 12:38:47 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6XbtsY5xJG4fqrEpiDSj2kJ3R/VtDAm8unCHAbcWZjuAg95MA+1yXA6DYI07tJ90+TmRGQ
X-Received: by 2002:adf:91a3:: with SMTP id 32mr19634011wri.99.1547930327201;
        Sat, 19 Jan 2019 12:38:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547930327; cv=none;
        d=google.com; s=arc-20160816;
        b=NXg95LC9m6aEc4UlhkCTGtM7wBJsLg2FwcvPC+on5rwH9sw90BVj1YUNVxIokkW5/Z
         Jq2Vo4O4R8ckxxtdgmxTWD0OBaNHQqMH7MFyWyjYZY49gosdlhu/5+LLivP7oG4CVHxv
         d/t/O8++7tSOT8a0XVHtRkkM5fVPyoytrFX6iIIskQUVFqfJ4y7f2S993AoCOcoarp/l
         GZ1cOkiDs60WfqgPEYNaTCgu7ZQqXPA7R8cN5vu7C+mnzfhK27sGM2d/i7dR2yJpZQqU
         +tuJyOZZt9I9w7aT3ToHqaUstv2YtA1Rzu26+HhO4j/2VxKj+1hPIvd1LHD0mFiVmksb
         vrlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=JKt1ehX2FN3uyD52w5ysPmrhv+cigWu/uFGSAtmrmY8=;
        b=Kmtev97WsGtDbOBsXBsfM3sdE2UUDoG3l6JNdYYQpQkP3vkJToOlWzOFgXkm4EZrB0
         926+EFiUlbziH8sygRBSl+PiIE/rjcDX1tHv8qdgdztKjqE69PAvuWjFf4vP2Vhmum/P
         GrgUwDn/lbv7wNdRvvh1fQvqt7C2kKYB2jF0hNIdU5UWbjfWyUrPJOX8GG3H/P3AqJKu
         h1/gADlxrwwpSCyr3z/XNVFmUjm/7iTDyyvvfIBbcw6AHol/hsii1L4F1IhP3BNyn5BC
         iDvTE1wmAnWxg18qYoEkEQ7VVHTFD5ZcjhYN0u/d64WI9JqShRPx01wGZYvt77exsW6X
         tC6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K24oaJ8P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6si60615025wrw.334.2019.01.19.12.38.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Jan 2019 12:38:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K24oaJ8P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:59588 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gkxOA-00024z-9R
	for alex.bennee@linaro.org; Sat, 19 Jan 2019 15:38:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54423)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gkxNt-00024j-Ey
	for qemu-arm@nongnu.org; Sat, 19 Jan 2019 15:38:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gkxNs-00087W-A9
	for qemu-arm@nongnu.org; Sat, 19 Jan 2019 15:38:29 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:46086)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gkxNr-00083j-23
	for qemu-arm@nongnu.org; Sat, 19 Jan 2019 15:38:27 -0500
Received: by mail-pl1-x641.google.com with SMTP id t13so7875836ply.13
	for <qemu-arm@nongnu.org>; Sat, 19 Jan 2019 12:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=JKt1ehX2FN3uyD52w5ysPmrhv+cigWu/uFGSAtmrmY8=;
	b=K24oaJ8PcTvMhsIbxAEwhQMd1CIWMddlIosGPwYH9QhSMzaR7RAbOP9MVcFOLr70Mf
	jaNS9dK6+KIsx4h225tZPUJrVAs0ItkRz6NNv07QmlTH/+zhnB53KXCp+iXqWnke/LfO
	YjQfrzLdkjHSTciG1oO8ajBHNhXqBzxjrAfZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=JKt1ehX2FN3uyD52w5ysPmrhv+cigWu/uFGSAtmrmY8=;
	b=spnXXPPaOgG8Dx9HU3lGdITO7mZrZTGOVtY20HS9XRI0fmqojHvJT18CMW9Taa/ixf
	tc3+sHjdPhWqkiV8eu/RESCfMftzLIgnSmaKY7mmVUIDdu0LUclibsixn9O2PCkFP63e
	egQIbUkL129oQEUTkKj+6DVqb+gDRO6+4bxQHNRmCnH7kW7ZMMtkAyI075sVc9PJxXdt
	2gmYZKDu8Ll7lYwOBwPYXFMsnc11QVeHy1/hH3LYufMBicgOF3PJb4XV9qtSiGN6xSYH
	i/Eie+YWcbRQ+m+J8OxwS+5j06frijP8zAgywZIip4P4k0BFmKP4i1zd9JAtQuk1m+bX
	XHqg==
X-Gm-Message-State: AJcUukdq1BOcHJcc/Sh/+qmJzWoNPitshbp77NWSqnQBOWiPmrX56Ajf
	YBF7RP06F0s/DsTKCcG6u1L0pQ==
X-Received: by 2002:a17:902:6946:: with SMTP id
	k6mr24437946plt.101.1547930304809; 
	Sat, 19 Jan 2019 12:38:24 -0800 (PST)
Received: from cloudburst.twiddle.net
	([2001:8000:10e0:a000:c673:a6b6:fdef:1933])
	by smtp.gmail.com with ESMTPSA id
	h74sm13014053pfd.35.2019.01.19.12.38.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Jan 2019 12:38:23 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190108180014.32386-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5ef47526-1794-df32-1bbe-fa29f8cd028c@linaro.org>
Date: Sun, 20 Jan 2019 07:38:18 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190108180014.32386-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-arm] [PATCH] accel/tcg/user-exec: Don't parse aarch64
 insns to test for read vs write
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Riku Voipio <riku.voipio@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fr5QyAlSowA/

On 1/9/19 5:00 AM, Peter Maydell wrote:
> In cpu_signal_handler() for aarch64 hosts, currently we parse
> the faulting instruction to see if it is a load or a store.
> Since the 3.16 kernel (~2014), the kernel has provided us with
> the syndrome register for a fault, which includes the WnR bit.
> Use this instead if it is present, only falling back to
> instruction parsing if not.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Since I originally asked the kernel folks to add the ESR context
> so we could use it in QEMU, I figured that it was about time
> (five years later...) to write the code to make use of it.
> 
> I wanted to say "everybody surely has at least a 3.16
> kernel for aarch64 machines" and delete the fallback code,
> but it turns out that the gcc compile farm box has 3.13.0...
> ---
>  accel/tcg/user-exec.c | 66 ++++++++++++++++++++++++++++++++++---------
>  1 file changed, 52 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

I should note that we fail to generate esr_context from aarch64-linux-user.


r~
