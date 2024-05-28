Received: by 2002:a17:906:32d0:b0:a63:3083:985b with SMTP id k16csp105480ejk;
        Tue, 28 May 2024 10:36:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVGfZ+1p7Aw1AWChpEPfErwiJHjOZn3zKY/+94QpVp8AD03RV9LYJJ2fqKVCiDiq2LOsgoG4kZKJTX0SwqmZiLWeMt0pVuN
X-Google-Smtp-Source: AGHT+IF4hDKUZKJib77F07uuDaTDS3tP7EEoeAsxRlabi0tm72bQnMFQlJEus5nZItkSCGkzPnAI
X-Received: by 2002:a05:620a:28cd:b0:792:b70a:221c with SMTP id af79cd13be357-794ab112449mr1767188385a.61.1716917817903;
        Tue, 28 May 2024 10:36:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716917817; cv=none;
        d=google.com; s=arc-20160816;
        b=LWw6LdibLOlUJskFSEH0b6hmKLqIKOTnRUv+B1SCPFKcFMenQ/z6Ukd8UhhFei5oyz
         Qb1Qi7R1hlsMVr+0sRO48IF2oa1CfBCzvEVIsamAkMTkdpjQeEd90cwwY5AOk3Ios+E9
         9whtzy46Va6awWmbqhEhti7SVq+s2A5KSvGd0gp9A6BBJr/MW7hxYid2Xt02IyhHqFzZ
         OMS7/mWhVChrHvyzx6egS+0ioNNnpLv3qtS+f2oQqYyKudnETlEkDtQ1PLvKpabva4mG
         q5rM5TtFwWTX4DdqCMIRPvmFOyNiAIMKEKgJjDb3RZco2XDfJyyw/yq+bIT+afiCPXB7
         F9lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=xCDiTt6p/0bpo1vXcLmdnlVV+ZcokWvrYX81UhRezBw=;
        fh=f3qu+puTubUhFmiNEfT7mt6YJycQqPdCSHWGx9i2+3A=;
        b=wnL98q/4myzr41JqSvEp5QO26aLRJrgNWHN16q7Txt6wDz/J7tTXuJoDVlNxWzeSjh
         r52zdNGBhcOBapF36UvlWsstWlmit2ij4EG5MZgPpp65fwRfs6w3heRsnZLe+TaOwYBC
         VAgnVQxV3BXDx2s2nwZ+z77v0+lcwsdM2R1r0lQyrX1Ze3gx4VYTqOaNyeK4sq7Ecg8X
         GVXhvOZlIT8KTKVCIPyMp3rEwE5ou1xgjj8sbHqewPg0IQKYJAoDN+e/I5AfA8eGyL5m
         Cp8AH5hbLYVq0JEAEncYQpXFZAYPCc1VjfmfOgygJc5Gef4wBvswkAq3HoUL0MAJH45B
         GSew==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=giaInYFg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-794abd0a7b8si1148995285a.290.2024.05.28.10.36.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 May 2024 10:36:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=giaInYFg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sC0kl-00080V-ND; Tue, 28 May 2024 13:36:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC0kk-00080A-5i
 for qemu-arm@nongnu.org; Tue, 28 May 2024 13:36:50 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sC0ki-0004Ia-IZ
 for qemu-arm@nongnu.org; Tue, 28 May 2024 13:36:49 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6f8eba8dcfcso868510b3a.3
 for <qemu-arm@nongnu.org>; Tue, 28 May 2024 10:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716917807; x=1717522607; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xCDiTt6p/0bpo1vXcLmdnlVV+ZcokWvrYX81UhRezBw=;
 b=giaInYFgeJYJ4oeXSXbZ0PFfdGpJ21BlTA4PvZRxrMzcNjjPYdDrAxst712xot6C0f
 Tx3NGZqHDhzuB0VB/f90AWh3IS3zC5cmWQVA+B/oU/aLeMDcQJhhbPyS2aT8RezRZwvL
 X4m52MuCpeS/A5MH/wDHtNrPfdPhB5sE8MmVeKuzJUIa3EwrRaA86+PZihbyEQIWqnoR
 xQloAui6UwuqFSFhONk1BJI54UQNlikSbGLUlahZAiNHmaT9Kf8IAxYi51H6/bJLE/1i
 qTlPL5WDsOzoEEDAFdS91eaT6r83imAQnfEheLELV7ANypFpt81xpyI8HlC5FqA8VuxH
 j6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716917807; x=1717522607;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xCDiTt6p/0bpo1vXcLmdnlVV+ZcokWvrYX81UhRezBw=;
 b=qhSAXPBw1QCalNodJZHHhe//4F3/PxqmXuEEbAwl1/C+Eepy9nTXujxX6IzMbxabc6
 1jvNL76LrjrwJgFqrA0LR6UJIOVahof63jO7Zuk4EI27yWtz5WJJXE0HT1MSFt7EgHm0
 +IFLvRk/se5UCHxCW0t05aU+zzGXqbCAuU7X2MlskNLcOTDvldaBa91OXF3YaBejecXk
 cZGezq2v2Mfl4V0uxWABQZFKx9tYs9+6z3/9D+/S1HP7hpaHKdXZbogrsez19Yh2Ykcv
 mX0JxNbe1a43L8frb1EbeFvfXsS0IvpQ19CBEUuVwW4bOMLLHhABmSVhSae4gbWx3nYl
 nbYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWITxMwjColRuE815LWKO9RyJJIPezckvf0MsJRfSvALiKFbRrm+/ekqgTUtUMQSYlQBVSYjpWzScylf3FItmMTH3fQ
X-Gm-Message-State: AOJu0YytObj04Cu0q0F2qxVrhB7Rchs/79G2VAd2mjKWSjeGoGSZE9Jx
 G6A9PlkqgiTtfL81NCoERBpRPvBbZEK4eCPZJ56CYCRwN24JTnduxvtqwkUG7SA=
X-Received: by 2002:a17:902:f686:b0:1f2:f3dc:43ee with SMTP id
 d9443c01a7336-1f4486b95d9mr150095135ad.3.1716917806748; 
 Tue, 28 May 2024 10:36:46 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f44c970058sm85279235ad.121.2024.05.28.10.36.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 10:36:46 -0700 (PDT)
Message-ID: <3f1baa61-c623-4b5b-b724-15bb68a2df3f@linaro.org>
Date: Tue, 28 May 2024 10:36:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/67] target/arm: Reject incorrect operands to PLD,
 PLDW, PLI
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20240524232121.284515-1-richard.henderson@linaro.org>
 <20240524232121.284515-4-richard.henderson@linaro.org>
 <CAFEAcA89_nWDXhXKds3gezUyXdXfO61bMNgSn=em166ufgQAbQ@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA89_nWDXhXKds3gezUyXdXfO61bMNgSn=em166ufgQAbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Ivjva6fbtZUr

On 5/28/24 06:18, Peter Maydell wrote:
> On Sat, 25 May 2024 at 00:25, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> For all, rm == 15 is invalid.
>> Prior to v8, thumb with rm == 13 is invalid.
>> For PLDW, rn == 15 is invalid.
> 
>> Fixes a RISU mismatch for the HINTSPACE pattern in t32.risu
>> compared to a neoverse-n1 host.
> 
> These are UNPREDICTABLE cases, not invalid. In general
> we don't try to match a specific implementation's
> UNPREDICTABLE choices.
> 
> I think we're better off avoiding the mismatch by improving
> the risu patterns to avoid the UNPREDICTABLE cases.

We do plenty of other treatments of UNPREDICTABLE as UNDEF (e.g. STREX).  Why is this case 
any different?


r~
