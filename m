Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5408780lfp;
        Tue, 11 Feb 2020 10:34:49 -0800 (PST)
X-Google-Smtp-Source: APXvYqwnih3S3jS4uaFNy25cj99g7ZZZkOJg4hqb/tlT8s8Vs0WrUH1GZhbnUElmCsb+WKTBqeKB
X-Received: by 2002:a37:4c81:: with SMTP id z123mr3957453qka.320.1581446089338;
        Tue, 11 Feb 2020 10:34:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581446089; cv=none;
        d=google.com; s=arc-20160816;
        b=Yui3Xoa95IgtT7E4BeGyM39UcbIs2FPzq4Y3Th1fwqyqPPqzdJdKAf/vuM8SMXMsKo
         eo/oOKGi3vDv1RZ+VhkJjNMfZT8xZ2zYzbPy6rW5vofC3gfJu8/4Yd0uDnQQL+SIamCR
         gCy6Hks3ZaMLjNhFqzKcU1hMJ+sA+0rzDbCqCvmcztTEvn+XkdcXTKUFzxQ44ptfxAFK
         RSZlFvQW/rnUH4CNqEItkZn8tG0axtYpNtMglICWOxh6V76zdCtmz6xys9kH4MFLx2E9
         0bECGk041U59D8OQAmqpQwlr7CccBPeQSrBm5+Tv5/qXCJgd4dTOFFGX87mvA3/yu2sB
         fvDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=n4m+epJYNb0ai4smVW5s9ALgRfzKmsG8W7U/CC+sWfo=;
        b=RzP80OjtOMJiL4oOr8uGR9nGY7JjEcoNYf6mV75SL8vg8fG5Z44zjpK9REV2TqWqRR
         T8eRKf/05xRI5Px1JWD5EQM3lwT1gVw6gWhzmxDVwJdw39LRiy1OmkClJlfld5ipXCXb
         7YW9aYZrZW4sCjSxNrqxBJdTkL97QsECOb6FfBPVz03HzN5AQTGCLqjfjHgt5DTa9/jM
         W1gFeauGwrxvDJLr0GYb3UphzLvNyroNm/qDhRxeOCxZUpcr2KVRK3l1sMmcuTy3xHkb
         Ehgjryj1EEW5CQIsn5zwgZrYfLeOGumCV+kxaDv4P7T9ws3RpI0IBQmU0sifGURpr35l
         8Uiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qjv/canZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v16si2470316qvw.20.2020.02.11.10.34.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 10:34:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Qjv/canZ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1aMy-0004oV-Mt
	for alex.bennee@linaro.org; Tue, 11 Feb 2020 13:34:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57213)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j1aMr-0004mZ-6g
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:34:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j1aMq-0008Dy-96
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:34:41 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:33995)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j1aMq-0008Ar-1h
 for qemu-arm@nongnu.org; Tue, 11 Feb 2020 13:34:40 -0500
Received: by mail-pl1-x644.google.com with SMTP id j7so4612794plt.1
 for <qemu-arm@nongnu.org>; Tue, 11 Feb 2020 10:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=n4m+epJYNb0ai4smVW5s9ALgRfzKmsG8W7U/CC+sWfo=;
 b=Qjv/canZctlDmlw8InLEI6KTj1dK/yh4f3AZmZN5SSbiZk53GD6Cq7pDpNpfTKAxss
 o5I+PHNWZIqRRDKMCq3f7jcy843dBCuD5J77/r5TmLV9Wv5h4SCa34bRei7QVK6igqq0
 cfbMgyjSmTiyJjQnK5HY2wbFAqED6hYaSEaqXRfz+vSLYyGC93TgM4lfF0lQ0xAx3BJd
 j1UYWZEAYc6r555qUkVOj8N3FBtQ2NM2e8NzzJTdYLj4nKVbe8M2trRrYT7Zhl9ayn3V
 KFblrhiPxh6ptYHUGuXNZnL6Ii9XW1bcjYHnGXNhgOotkzB1RMz8ikiGPe7i9vazVvm4
 AA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=n4m+epJYNb0ai4smVW5s9ALgRfzKmsG8W7U/CC+sWfo=;
 b=IKyHYqXSRKIw3bf/92eIswJLwcJT1z7HTvnLHGfy8Pt+iA3krvujyUAELazDM2OWVl
 WHQh/jJQg05MIyo0zXLKnp09UJU6+AU/ODbxGCi/T5uN2fUilAk8KGr2+cL5UhptgzGE
 BmDo9gneVnLFa4WFDH0CRVnQ91GXfHzJ/WwWWI2KRUBCskS+jSBSXJxiPRng+9zwj6Oc
 9RNbd9h/ixrfit65rliePwK0kLKe63qLOyueZdF2Od20i495OgCIk73WzsPoy80SyVCe
 t8mCL+MoxRuDF5cmIbLIs9lbd442Cclr/lykIRZSKRK0qXGYCQjMCGgSFxz61zRSqPjd
 2PbA==
X-Gm-Message-State: APjAAAXByH16pmrAjvFzurOz+Agxv47ALs+83ZAXg+AKtwUEW4YgG+Y4
 lrmRC1DGJn2cl0sQbLiUHEKG7g==
X-Received: by 2002:a17:90a:cb96:: with SMTP id
 a22mr5119541pju.96.1581446078867; 
 Tue, 11 Feb 2020 10:34:38 -0800 (PST)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 s14sm4743221pgv.74.2020.02.11.10.34.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2020 10:34:37 -0800 (PST)
Subject: Re: [PATCH 06/13] target/arm: Use FIELD macros for clearing ID_DFR0
 PERFMON field
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-7-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1125c0a0-aac7-2edd-1cd5-b122f3c3a609@linaro.org>
Date: Tue, 11 Feb 2020 10:34:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211173726.22541-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-TUID: 7YLwqjb6oBX3

On 2/11/20 9:37 AM, Peter Maydell wrote:
> We already define FIELD macros for ID_DFR0, so use them in the
> one place where we're doing direct bit value manipulation.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> We have lots of this non-FIELD style in the code, of course;
> I change this one purely because it otherwise looks a bit odd
> sat next to the ID_AA64DFR0 line that was changed in the previous
> patch...
> ---
>  target/arm/cpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

