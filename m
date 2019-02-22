Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp7416380wrx;
        Fri, 22 Feb 2019 13:56:11 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbJ3dp5hGPnZkYbP1fPmTOIYy8sym7VK8I4PuMOujSMbSTb2MCU7G8cLSmAJy5wXOCs936f
X-Received: by 2002:a25:8708:: with SMTP id a8mr5174535ybl.164.1550872571352;
        Fri, 22 Feb 2019 13:56:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550872571; cv=none;
        d=google.com; s=arc-20160816;
        b=cDOLEvnZ3WAssfAyOctdUWUbpCay0Iokne/Tp4tJ2KxOsKq9hmS7y9fwj1yuOaTpNx
         m4zDXBvqZ4V+xjJnNGlGodNUwPJO9d/fZMs4LRJNh6r7X4Vclomi76mL9ocCUb7uQ7z7
         4Grk5ciHZLSY8WQgpN19yAFWBK5bZbjUvVS9emJRGAfVlykP64mmZp1sxVWgr6PuIuse
         SRcoAJFDX++1Ap8Lwf+QYkkQBhcLcEvt4e3Pkl5fCR2O/IqvB/hSLyowroB5HFF9M1PU
         ykB1FBsRh9/Nbrxc/ItHTTJRWpBCFByBfGdjjSsDWI1OOaJmRn9GL6G2F/8q11LNaF0E
         DBdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=qPHnIQqEELQm2e2DSCnb6WkbGTh0s8Vu9fpCHir+bek=;
        b=P40aKZPlc6448Ul1wL5CVxwf5+DzotyHNjQdJ3KgK3H/LcfOpQopsXEBm4mJQeOyoG
         zEM1kJts6GGM6XSxW9tR47dA7rgsQ9lDFRF3iH7wECqngnhPy5OD/vxHHAGNXoLUcUo7
         ++Q2vuR2f+GQ8DO6Zs0XEiwgEK8KxvuNRW21wSYKkfHWz26zmLszk8pjeee1B2dCmAa/
         SaC1ngnz7EQcvdIaU1aeW9V0jZb6nkQMDpzL+MJBJMtAVpnEiWybJQZ9E47YlN0d4EkM
         rNJBR1qNs6JrjVxnfHp5XpUb7Tf9ur6FyttJON1AjBF03UNgLALZ1ooGTia0pZKe4sT1
         uOlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c1mEPZY2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v199si1579296ybv.44.2019.02.22.13.56.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Feb 2019 13:56:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c1mEPZY2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:57469 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gxIni-0003bA-So
	for alex.bennee@linaro.org; Fri, 22 Feb 2019 16:56:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35509)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gxInb-0003aj-JC
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 16:56:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gxIna-0003I3-Kq
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 16:56:03 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:34002)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gxIna-0002kQ-34
	for qemu-arm@nongnu.org; Fri, 22 Feb 2019 16:56:02 -0500
Received: by mail-pg1-x543.google.com with SMTP id i130so1717293pgd.1
	for <qemu-arm@nongnu.org>; Fri, 22 Feb 2019 13:55:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=qPHnIQqEELQm2e2DSCnb6WkbGTh0s8Vu9fpCHir+bek=;
	b=c1mEPZY2CzA65vHkKv+iHr5Ieqp/SgtVur4giMYS2zy5o/ZHjZWBc/Z9OY8ReKrke0
	x1gd1parm41rGQoUWlDZb9tnNPLvznwKn/fJnNbNa2dwJCuSbfvnDX2aO1FDdbXgKal5
	o8FtiDwcRAmXsfmah6RO6hljsV8FYIFvdM0w6QUGKiN3TsGQgulcMN7OV+PAWUqzaKR3
	G7c4fnbZnBtDP0Pt3P2CRlOjZk3Lb9EmprI/eBOQCdEv/yj2CVYCUevmRxVCWPE/lCPG
	HEv8kgqpvTXdCSthyO/b5b3QwbOpju+I/j4foLvYi52Fy3m0B2CiGVGvMIr5sA/3xPOc
	Yx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=qPHnIQqEELQm2e2DSCnb6WkbGTh0s8Vu9fpCHir+bek=;
	b=kc0CaquHPhlYowa4QR9WMCPy/mqNwEgX/sw76lWQHHcET/iYDgz77X79f0gYQzYScN
	7obix6IcQZHqd6GvtLdDLTm6c652JQVvgued60xhhJ66QMuieHSehjE3A7O3hpPmJRfp
	yHnrmd6aEoIsaiZToaf6e9TPfSsoXUDERMxHUO8J+9aXcA3fxDQZcmfanEwjU8E38r4F
	lxwJGpTo067oizFd279Z46TnwxE2V5Md9GFLqoiNOfcxR8TaF85HyfPbS7Rm9Jwn9HdB
	6rGcggZNn4qgTtFekcGyorrnrigvl56PHdHMF+D630PudLHvqKau3IQ28adZ6r05ATQU
	7fyg==
X-Gm-Message-State: AHQUAuY/QH2SY4a5wNxB+zlJ7WnEOPmkSp7ogwpUTRkTGw+uFtwl55gP
	W0ntdZ448NQkPSDM22udS8Q62A==
X-Received: by 2002:a63:d70e:: with SMTP id d14mr5987552pgg.159.1550872553694; 
	Fri, 22 Feb 2019 13:55:53 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82])
	by smtp.gmail.com with ESMTPSA id s1sm3051611pgv.30.2019.02.22.13.55.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 13:55:52 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190222170936.13268-1-peter.maydell@linaro.org>
	<20190222170936.13268-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <ce67ed48-a67a-de30-944b-a793c46d2a5c@linaro.org>
Date: Fri, 22 Feb 2019 13:55:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190222170936.13268-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] target/arm: Use MVFR1
 feature bits to gate A32/T32 FP16 instructions
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TXWgqzhj8Yz+

On 2/22/19 9:09 AM, Peter Maydell wrote:
> Instead of gating the A32/T32 FP16 conversion instructions on
> the ARM_FEATURE_VFP_FP16 flag, switch to our new approach of
> looking at ID register bits. In this case MVFR1 fields FPHP
> and SIMDHP indicate the presence of these insns.
> 
> This change doesn't alter behaviour for any of our CPUs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h       | 37 ++++++++++++++++++++++++++++++++++++-
>  target/arm/cpu.c       |  2 --
>  target/arm/kvm32.c     |  3 ---
>  target/arm/translate.c | 26 ++++++++++++++++++--------
>  4 files changed, 54 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
