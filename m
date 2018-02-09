Received: by 10.28.71.27 with SMTP id u27csp1387685wma;
        Fri, 9 Feb 2018 12:59:40 -0800 (PST)
X-Google-Smtp-Source: AH8x226VE0PZMXHO21tj/jcIF7snZGe0gJys/VYSM6pTqexXfsp+wRJeCL2X+T2UEsN6JpjnhWQR
X-Received: by 10.129.238.6 with SMTP id l6mr2974406ywm.218.1518209980773;
        Fri, 09 Feb 2018 12:59:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518209980; cv=none;
        d=google.com; s=arc-20160816;
        b=V8RUQiDQxf/qrDWUl/pPFiLjXgVb6S4y0pdmvwiVMULgf92Hv7DQFo3dbshUARRFzt
         CD6MJopzQkygYj2z9k0AdW+FdsAI39W8Ys7Hp6FYD6bW3GH0QJwHm1PUjcCAdnnV6TPd
         x+yaAThJqctmhJPW1i8VYbs7xenG0Znlr/9sqILMcW5q+R2H0pU+6VBrkJP+ifhBt/J6
         xzYCsLTBdknIF6duWmKGpqq/cM8yyLDvMwgsRscvI0760Q2dH7P01ugl83eZe+Dn90la
         lKcaZSTRXGy4naaVH7knIdv06VUN5wCX2LNcWlxcqaRoekt7w+jvj/e9wJXpqeydPzG8
         wP9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=mdCI7Dth5gS/DXCe2bcppWIKpGqEedWZU6nDwhAAdvY=;
        b=KTZAYHXArVjymXnKQYfXVAyFjVAJabF9DxgYRBtEcNHqDLiC+ZKA8qIvGNoAiu00Yb
         W5gIxL1q9tgftMTEuAkYifyb0yn+Iu5oIA9WOgzs4v5B80oZRZfwa9+6zDeHpDonv8A5
         oblotinj+Rs2VH1KwJvfRngyTOdzny52p6D3DW2SHoeYjRKeu2xmhrc3+FhOe4Fybx5b
         618NcOjAbqVYOB3PRZcH9Th2ZfB6OIeVddJuKuLbzJdjg/TCW/+V/RudmKOv7ngIZiF6
         TzZoEhmmyIaK1fzCD5qohEVqCMtMTZV1d2uD5z2wZ6+hYCQIFfl+xIxsJkkYpmhPID6f
         0PZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UrPpP2+o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z63si542420ywb.746.2018.02.09.12.59.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 09 Feb 2018 12:59:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UrPpP2+o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekFlk-000789-4x
	for alex.bennee@linaro.org; Fri, 09 Feb 2018 15:59:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43268)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekFlZ-00076t-Pe
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 15:59:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekFlV-0007Rn-SF
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 15:59:29 -0500
Received: from mail-it0-x243.google.com ([2607:f8b0:4001:c0b::243]:38976)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekFlV-0007Qm-MU
	for qemu-arm@nongnu.org; Fri, 09 Feb 2018 15:59:25 -0500
Received: by mail-it0-x243.google.com with SMTP id c80so12254077itb.4
	for <qemu-arm@nongnu.org>; Fri, 09 Feb 2018 12:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=mdCI7Dth5gS/DXCe2bcppWIKpGqEedWZU6nDwhAAdvY=;
	b=UrPpP2+oBcHKOtIMvv3Lo4Z1bjSqBQzpVe0tGEAEXtlli+HqkzWFdc3LBbENOCWQpd
	G4L3BI/w2IZc8Gi5KGRm1AQ8CJRiQhTRmuUBvhjSW9I4k6SkW8XG341T7XM2oDw/QL0s
	szc6YPB+Lw1lgmZbmHskMbIZwBpUxx3XHS+ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mdCI7Dth5gS/DXCe2bcppWIKpGqEedWZU6nDwhAAdvY=;
	b=lNcb/tksf5TM/F03MUIVnPXogIzeY7ZaCtcBd1tUyUoL+oOmEYB5FYUTGNOGuPYAm7
	jrXbDOWI/sxUfxUoi2cCrup5d5KE3enwy/P0O6V2Cnh/5JtpvqW0aG9dCRAd3vhb7T+f
	hcj/gQewKqrpmLJSRGrssoyJ7d+NIgSg2AcMMI2PhNOj/kQFuRD2VPjbIkOScZq2i8ag
	gjch7a2gTodsLjMe0gwHFRLZzpyKn6fJ4oatLxK/Dgr7cR3rurqseQRqhx5ITBJYJIHo
	dziGwRHdriSPFAuOMXBZH8ZEfV7RoFqEYmhniZZommA5h+KCkfKfcsGwC35kqnMM2+Ml
	KgLA==
X-Gm-Message-State: APf1xPBwOOOWRXeBu8DZoiI1C1TBKJtZ/z7UqgvY8j/dh53AmjK1UfMg
	TP4kGcVrjuxUs/RRi7Eq4UJV9w==
X-Received: by 10.36.157.195 with SMTP id f186mr5121279itd.67.1518209964763;
	Fri, 09 Feb 2018 12:59:24 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	x82sm4221266itb.36.2018.02.09.12.59.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Feb 2018 12:59:23 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180209165810.6668-1-peter.maydell@linaro.org>
	<20180209165810.6668-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0982d2ff-9a74-3c96-7048-220bcfad241f@linaro.org>
Date: Fri, 9 Feb 2018 12:59:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180209165810.6668-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 05/11] hw/intc/armv7m_nvic:
 Implement cache ID registers
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
X-TUID: 0F0WFd0IyHpb

On 02/09/2018 08:58 AM, Peter Maydell wrote:
> M profile cores have a similar setup for cache ID registers
> to A profile:
>  * Cache Level ID Register (CLIDR) is a fixed value
>  * Cache Type Register (CTR) is a fixed value
>  * Cache Size ID Registers (CCSIDR) are a bank of registers;
>    which one you see is selected by the Cache Size Selection
>    Register (CSSELR)
> 
> The only difference is that they're in the NVIC memory mapped
> register space rather than being coprocessor registers.
> Implement the M profile view of them.
> 
> Since neither Cortex-M3 nor Cortex-M4 implement caches,
> we don't need to update their init functions and can leave
> the ctr/clidr/ccsidr[] fields in their ARMCPU structs at zero.
> Newer cores (like the Cortex-M33) will want to be able to
> set these ID registers to non-zero values, though.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2 changes: use FIELD() to define some constants;
> add compile-time assert that we won't index outside cssidr[]
> ---
>  target/arm/cpu.h      | 26 ++++++++++++++++++++++++++
>  hw/intc/armv7m_nvic.c | 16 ++++++++++++++++
>  target/arm/machine.c  | 36 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 78 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

