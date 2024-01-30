Received: by 2002:a17:906:724b:b0:a35:eedd:80b0 with SMTP id n11csp662392ejk;
        Mon, 29 Jan 2024 23:51:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEffMULFGmzwZcCKhnto/wiLEZCUF557Ows/njFIRKDM92M3w+mfmfayuUDRfFvPW5h/aqW
X-Received: by 2002:a17:902:e5cf:b0:1d5:8aa5:d782 with SMTP id u15-20020a170902e5cf00b001d58aa5d782mr9331566plf.6.1706601088520;
        Mon, 29 Jan 2024 23:51:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706601088; cv=pass;
        d=google.com; s=arc-20160816;
        b=HmscgTYPmh7BY4NAZuCc1v94YVfsh4MapjpyAAu+ndFK9dTiLR7QdsnEOCn+5uGLzc
         e+zo7HzgnwACydZqO+MQSf4bHcNG16hoe6CGwRLBP+rXCGYJrYlLm5KxYuN+LJNtg3jj
         alTsVlInC3eKuv/flfU+mltKiwFODlDuWJqP9M1Ba/WuscOH6D5dj6KiTQdEdoqeowDf
         KcJRqH5xQnh+2W2iDfWoWOlgKqZdPQfh4NYyahZyhc7iDUemHKEB8FsqcTO4y+b0L35g
         lUsyUWrw2YHN9+fUpfiFxyOQR986jJZl2XZxPVHN3XCCsWbBnHB/Cd3Q8cWDfK45LKGq
         +Yyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=JsLkEIfJHXL56e0Gz/0no1vs5VXLmbOPVBqPvukIiU8=;
        fh=gKDeYTpE3Td8AuKkPwvifCReT2dWqUSnf/YF92lq4I8=;
        b=uUBX6z+RAftC7PtpWQj9SK+iq3/NupLY1uerg7utWDVuhrnpJmee3w80KwR+gXmygO
         OtnlTUDOkKPWI72bawsnjlpaz7IgvubRlE77Dv8w+qDpEs1knzE0IKLjamAYks6+BYRk
         sv5CBAhLLIZNscJ9W7BwFdXYikzctDCKw8gzZCh2GN0pQVOf5gyerVLioWF2jf6tMIy5
         RHda0S/4WPZLt6w2mgS+HwJJd7jgUAcyCq4yTnHP23oqnDWkmdApQ09wdFGBLTk9HRdi
         pkDzAVT4nk2Zh0gg2zqdkHR70nuSmeZl8cXtWCAgvu0yaPFGgikHVFxIFBSEwkAoFvSC
         GLFg==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bIYduWub;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7431-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-7431-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7431-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d6-20020a170902854600b001d7620ed2desi7060694plo.432.2024.01.29.23.51.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 23:51:28 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7431-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bIYduWub;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7431-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-7431-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00BC22887BF
	for <alex.bennee@linaro.org>; Tue, 30 Jan 2024 07:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0A5C53E05;
	Tue, 30 Jan 2024 07:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bIYduWub"
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A2E5380F
	for <kvm@vger.kernel.org>; Tue, 30 Jan 2024 07:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706601084; cv=none; b=Db+Re/5m/6QnpubT5pONeEbm/9jQkATXwAAYbaMDcgt7qoNT/y6An68oAcA9qkWcW/Qi7jYTVZbdOdkSBfp2RX0jv4tKmbt/NmWw/C5wRjZZA3dgxsxF9la9RIJMeO5rBs44esxy/IHeKuNhBQAg3zJzwIt49yzcl3YFglZbncs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706601084; c=relaxed/simple;
	bh=swDMFpY+FHUjENwEXtHrZsjW2RnneppcoDYj9BE9mtw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hCvV0H3giNd2gLgcog5mRgZg7K2nxDMLXK2XyHukTTFLiL1NNprW1cRXii05f2pV7ZjBbGMZEbkPyMze6XCEgSGh/BC9T4pt7yOK8lFZtsOXV3OQGSIzgojAsDhoh5p2EZ+rlRsq9rBh8s1/EPy2eT49A5RvgM9OFEIuG7RaNCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bIYduWub; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5111c9e48e8so339895e87.3
        for <kvm@vger.kernel.org>; Mon, 29 Jan 2024 23:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706601081; x=1707205881; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JsLkEIfJHXL56e0Gz/0no1vs5VXLmbOPVBqPvukIiU8=;
        b=bIYduWubBYWn7ga3HdW1rRn/+xK7ZQ/lWrUbw+A7VlumgI687NBF9au7e7tODEypzp
         I9/Yy3BfL/5Bktil0shwroxIE3Oy+2YCALrgmn/7E5L0xtDUWZWJSso/QEkgF047A7Tq
         8dMmpJYWJ9IRFldmQw5u3Hmk9PoEAOr+rIo3UuHVoS3wvTe9Oop+U7+sB6TLFYadcRi7
         SlxYtGpZTcDevZy8lBOwcxplYgsG8yrfGbec9v+o/JHL6bCJlFMZJi+dws0NhruGFz1z
         ipYVmR0jPGVy8DT1yH7uuvV4ctEuoMo71ubV9yWaxay8Xe1ffkLmXCdU/hQwJzEstsdc
         KtUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706601081; x=1707205881;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JsLkEIfJHXL56e0Gz/0no1vs5VXLmbOPVBqPvukIiU8=;
        b=Iu8isV981e9K9w6Eh4a02ZAbtkS9fvN5r9paO28gozVht/1kanoOt8V6vA9qj489q0
         9nkPoCnviHP4fc5WzL5oZrmSws3eG5RSxXBkYdkxUtDI7ssb1k4eOzPEosebd3s7ULy6
         oXOPL2GERi3619Yr6SacFY6dFUBZ8xZep6gORNDxVV5lJvUnPaCI5DJMN534f85n+ZVj
         INgyfiy39sIBcYppMiHQLBDPAY9SspbG1CIp1f3924V1v4+mGmozsQl3yR6u6ifYLcxd
         QGSx4/g9ZEzjbfCOkl27R8yDmHG7hqgTUOi2zRtQweq2vESMNwMmOmzaCWJ1s6anwKJW
         al5A==
X-Gm-Message-State: AOJu0YwaP23gSgXYI92Xal7sDKgYIkXe1bSHBAlGMOYU1V+ZPbu3ILmL
	J0XqwcwV5xOoZj7MriSUL2KyekBDNCKsoqf8KO0fAM0brRukV2IHg1K58Rrh6NA=
X-Received: by 2002:a05:6512:11c7:b0:511:1ed7:61b9 with SMTP id h7-20020a05651211c700b005111ed761b9mr278683lfr.39.1706601080891;
        Mon, 29 Jan 2024 23:51:20 -0800 (PST)
Received: from [192.168.69.100] ([176.187.218.134])
        by smtp.gmail.com with ESMTPSA id eo6-20020a056000428600b0033af5086c2dsm2570237wrb.58.2024.01.29.23.51.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 23:51:20 -0800 (PST)
Message-ID: <ecf81b39-0b2a-44be-a496-18557316b9b9@linaro.org>
Date: Tue, 30 Jan 2024 08:51:18 +0100
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 26/29] target/sparc: Prefer fast cpu_env() over slower
 CPU QOM cast macro
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
References: <20240129164514.73104-1-philmd@linaro.org>
 <20240129164514.73104-27-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240129164514.73104-27-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 6UZrpgNMq4xO

On 29/1/24 17:45, Philippe Mathieu-Daudé wrote:
> Mechanical patch produced running the command documented
> in scripts/coccinelle/cpu_env.cocci_template header.
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/sparc/cpu.c          | 17 +++++------------
>   target/sparc/gdbstub.c      |  3 +--
>   target/sparc/int32_helper.c |  3 +--
>   target/sparc/int64_helper.c |  3 +--
>   target/sparc/ldst_helper.c  |  6 ++----
>   target/sparc/mmu_helper.c   | 15 +++++----------
>   target/sparc/translate.c    |  9 +++------
>   7 files changed, 18 insertions(+), 38 deletions(-)

Per v2:
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

(https://lore.kernel.org/qemu-devel/140c63fc-f99c-41f3-b96c-5f9d88fa82ba@ilande.co.uk/)
