Received: by 2002:a05:7022:43a6:b0:92:a90b:6588 with SMTP id bo38csp1355056dlb;
        Thu, 9 Jan 2025 04:11:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVdms6HlUbQvtWGUN2NTsGeSMQ1tVvzM0O5nGagKOD/zdUDPrEiR69a2itydUPmvtPCcbC1N2KcN/hLfA==@linaro.org
X-Google-Smtp-Source: AGHT+IEXCrUELb1L1jRuAF/nx2K3vgvo/OqBHQQbsamFa+XAgO/yZWnx8kG00w7LkRAY3Hg6dLT+
X-Received: by 2002:a05:620a:46a1:b0:7b6:d9d2:d279 with SMTP id af79cd13be357-7bcd9762246mr893525885a.45.1736424686647;
        Thu, 09 Jan 2025 04:11:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736424686; cv=none;
        d=google.com; s=arc-20240605;
        b=fr/2oEEzTTAE8XZz15mdQ6QZ7rUbwquN12BFlK971K5ftu0rRgmtLLWGngnVtqT9DW
         qtKkXQ+tc2TXcJIZoVhXGOg2roPiLTDcwsP5rjYg0n4pNEcInTlPTXP3gU4T8cwKadvK
         u5pTtGjFeAcHcrslraHPDGNGobUCgLRPuUGda2LKLVJCPQ6X7aC7ob3i/wfxPRXyyH3J
         r5vOAfIfm4HyLqXoERlL1JiIHbTtOonQXXEGJtv3a0LhcS+Pp14OGGrkcwV8TRpScmgh
         RJh9tHkHwkRDrJO/oQYOx6WyaEYSwiQJjZf8z6CRax9i0Hh8VDjvoOgpkrKLfPxPy6ru
         TPwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Dgo9yBapRcAllbwTcnu2QtKf5J2bG+P2y6fDUr50e7c=;
        fh=Ysa7JLwZ1tpmNJSyYoLi2nyrbscZISU8SDyxxL78a/k=;
        b=U70SzYKy4oGqXcU477PR+vwsHELs6VVHLlIuwbqLzAgUeqDCMhVQtoex1s2Zkmdth3
         GsuBGjlRija205Wz8Wq5atzLXYSZUUqXHSr536fKLfzXnnklg2k0zJPLil4+OyFbPNvk
         11To5i85CIwpoQE6BNxaYBlO65WW82HN+Y7kpPNrvvl4EJB0eOYrwR70V5w2XFqIDcdT
         oYVvnjKdYJOAzdqlUbqgVGZFSzDp7cdG8gwxGlAjLVYBLMlZ5vZGkdCsPwOVrFcw87bY
         Q8izkfQAVI8/OwCslr6Vkx2gXhmKOcrGikzWgV1+9Xi5JijrKKm0ovYxYTqEymGMEoW5
         m9fg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G/hMN0B9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7bce350995bsi143455585a.551.2025.01.09.04.11.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jan 2025 04:11:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="G/hMN0B9";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tVrNW-0006uR-E0; Thu, 09 Jan 2025 07:11:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVrND-0006sI-UW
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 07:10:52 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tVrNB-0005vr-G0
 for qemu-arm@nongnu.org; Thu, 09 Jan 2025 07:10:51 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43626213fffso12385115e9.1
 for <qemu-arm@nongnu.org>; Thu, 09 Jan 2025 04:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736424647; x=1737029447; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Dgo9yBapRcAllbwTcnu2QtKf5J2bG+P2y6fDUr50e7c=;
 b=G/hMN0B9FTxrwJ5Ee1L9vJINVBCOLgNb/8Uvnajb1v5MHxgyNuAlgGUq95Rp+bIKIk
 ZLqRjrsSUK8dhM9aiZeT8pTwy/WP0GKWkQVuftsAZLH3aVB7tkbXyOaCk1mYVTWNTU4/
 4TLgwb8SmKPCMwzMMCXUwbmqGoBRswLQb5CT/QpRGdbBKWOETwC3tpiTqWAYu+Nz2pXD
 ghlteENcVpvhAfYM4nqa7fVBl8H7i34cRhYS1yPMvPiLZXew0j8L/Fzto+QM4j33oLBz
 s/npTr3ZFevrdlrEaTrLxYfKs13o3wuo9CYr+xJXSyxhSEXJeJOJQjhvNTdNeJ1DNaED
 yICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736424647; x=1737029447;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dgo9yBapRcAllbwTcnu2QtKf5J2bG+P2y6fDUr50e7c=;
 b=Bs3pro62WYiDcy6V9vbC08t3tUKLoE10g7C2os0pqOxJLgc1mNohWSH1TMJiDGbpT3
 fRPuYU5bxlsgjtPgLWTRNd36sVQKz0q6hRzTYwS+UFxl/2nTZ0hTr07vOWhRLhQYG/YY
 EZtVTkS2m80WQzAgh8u3FRoLePGTHZPxusdqvlI/uLug1MN3WIjVczFqujuVYWnQvex2
 1dqAhqyQ9tViUkoPsB65+FFGyifnLocgITMYiUukAweunZay86k1i7h9+nFC8EH1JmCr
 M3wtl/t8gL6gxvBqJg85YFKkeXxynFfmA+bRx2tYIVlFL4reBO4m7Ny0fq7J3DDWTAIv
 hPsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW82d36qk6SuYrqaxkW9xezcENPhQcXMHIhI5VoTPQ6WlNJcJGqpT8W5y7j051oa3EGqA59pw/SPg==@nongnu.org
X-Gm-Message-State: AOJu0YyDu+6iRVbI7xd/reohtB+3+il2nde02dhol8EGeHeSz7Dm1zfQ
 Pqipuqrn4c+gstPr6HX8IdE4G1XTCs6RCRUpHkW1o0mlyzsP2l0+EEbGWwY1S+g=
X-Gm-Gg: ASbGncvg3X0528nSVSD344x7JMibLZfEMT/88P7Aw8D6SEpvP5KkDH0HNhY2kLRHS9K
 K0KEmWFwnolX7ce1DD+Ew5rFgJXtO3/7voZsRNPeC9UVdCaqnvrov+R1FLxYPQtEAzkYRpFvXsl
 +t4Xs4EvjS9GM9B9RHzcOeJ7x78vZxPRZY+JoTfYxzYN7YDjtW0nQhLraQ63rPcfJddDmkB17a2
 vPY5AqpCdIld9IF+vZmiKSqIGAIPsCkHQOHguLgtrrrnKwHaQq3V2LL62OxOREI6P/c7WYreC4i
 Xeam2hCC46X0E93xsaWY+KCO
X-Received: by 2002:a5d:6daf:0:b0:385:e986:416f with SMTP id
 ffacd0b85a97d-38a8b0c7109mr2437638f8f.10.1736424647361; 
 Thu, 09 Jan 2025 04:10:47 -0800 (PST)
Received: from [192.168.69.102] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e38bf78sm1658040f8f.48.2025.01.09.04.10.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Jan 2025 04:10:46 -0800 (PST)
Message-ID: <eab5d179-a409-4fa0-af68-9f8c89d7848f@linaro.org>
Date: Thu, 9 Jan 2025 13:10:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] hw/sd/sdhci: Set SDHC_NIS_DMA bit when appropriate
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>, Fabiano Rosas <farosas@suse.de>,
 Guenter Roeck <linux@roeck-us.net>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20250108092538.11474-1-shentey@gmail.com>
 <20250108092538.11474-2-shentey@gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250108092538.11474-2-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Xcgv0o5oQbji

On 8/1/25 10:25, Bernhard Beschow wrote:
> In U-Boot, the fsl_esdhc[_imx] driver waits for both "transmit completed" and
> "DMA" bits in esdhc_send_cmd_common() by means of DATA_COMPLETE constant. QEMU
> currently misses to set the DMA bit which causes the driver to loop forever. Fix
> that by setting the DMA bit if enabled when doing DMA block transfers.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/sd/sdhci.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

