Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4695940lfg;
        Tue, 16 Mar 2021 08:54:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5uz822VCnMR+5JOb5pWa/X7hQYwYgwwVlP6ft3hpi4wIi/Hyig6GEl8ZGxC42YuJ3+tQ4
X-Received: by 2002:a37:87c4:: with SMTP id j187mr255402qkd.408.1615910076159;
        Tue, 16 Mar 2021 08:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615910076; cv=none;
        d=google.com; s=arc-20160816;
        b=XqlzKcQG9SzfSKnNq3TK+ElaWUW/LridZPw93BEtNI2ne91OlYuNj9npRUsrf+wb+U
         Zz5SaialM4bN+uYJb7gt+c8lC7FmjCAUUn32wOIgGhWpm2KzDjtiYN0TB92btQ8Ld68p
         K+q+1uFnFANPfoZPSK3QZU2EpPcCa1TtxnwAT4V1+Cy5iCipy8gDeQqyq4pATT3MkEnv
         AH0dSq8wVJ+aAJneeEOLc9SwrN2N2LyOKPZ+ZpHr+LT9B0Jq09jmjuWr6HW6ESsmtarJ
         WpQnMZWm2eo85ojQUysrT5Pcc7HxOtfgTSZLgCPrd2igjFp3kxSatOOJXMJvHWUZATu2
         BkVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hUIIJ024tvjt9xLUvTB694f6LgQ00/XZ3b954DSCF5w=;
        b=Ldlyzwa5aDodK6snUfxblUcTthbp9+HE80aGfqbsagLY3IlmiXMoctQPCqCFb6QmES
         gAbLI0SwPW5WfKBvS2qlpGERbdXshmzYb11oCg7ozRD6Oc7wL7UhXEOTlf0TCOUNFUuC
         QIwlsP/1Jv55e/1X2IOT6/4hVqc6eitTVrAfkeXhOoW7Nbb9DOHFCWoM9+Oe4of8Q6v0
         SoNtj5czk5TWVaEWI1RyDrZ+GcAROrM+jdzZm1vgVWTNXL3ViwKmf4vaXZHqq7cHZhFN
         spIp91/FwT9LaUVYIa94INEzzDekiac7AxgPLWaq1f+3+Yoy5y9zkaUcI2r+c5jV09UY
         FTFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b="g/4K8Eor";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 20si9914443qtp.111.2021.03.16.08.54.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 08:54:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b="g/4K8Eor";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMC1j-0004Ft-EK
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 11:54:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMBzF-0001qD-O1
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 11:52:01 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:45311)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lMBzD-0003zw-SE
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 11:52:01 -0400
Received: by mail-qk1-x734.google.com with SMTP id m186so19060101qke.12
 for <qemu-arm@nongnu.org>; Tue, 16 Mar 2021 08:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hUIIJ024tvjt9xLUvTB694f6LgQ00/XZ3b954DSCF5w=;
 b=g/4K8Eord8HHYZcD16H16UtYfKqXE0EX54mVgwc4MltVw9N6bclqJn2oFrBbmSz2c6
 JGLuR4eUuwr+UGHmi7NpafK440C6O9xWOQ27qAHiqGRgB+J9A57Exz+P4K0bHkunSVYa
 IIiT/PaWQw09IHIvPdndYoXzEKdhtIV4DighNwAPnqEXS4anxMTDrgxeMX1RC9K/VYhZ
 fQ/V0PeRBchmShQywhEhK6InqePYV58gW9mPImbrmwjn3aV6c2qFCriXaf1Vp/o34V5k
 zvA74+hgGGdLhy5HeoK25qwkoH6CrXXbqjh07wE7TYoasMUXGhYw6LqZF2W13yRwHzJB
 /Lcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hUIIJ024tvjt9xLUvTB694f6LgQ00/XZ3b954DSCF5w=;
 b=Y1GOFt9HcMjy1rfzczpEy7qRVVZUYcFvlJYWZ4kXOjEiyqORAV+NyXeG0SzUs96K7q
 QGk3vm2LeH8/t09+1CxZqhMx7nuYFnj6YJ92jJkeUQj1pjsi7DZ8+t7LT4CAFEevECgK
 eY15302VPscKMLuvgF3Fk48OI9OKlEh9KkDkSz2naIW7Dm/UmT0iGtEqbz4/fCcjeBlV
 luKpaxwi6ASc6RUQmM2KMkoGQhQHg9QlE1621PzC0eI+FqVNN4MuEIm/ONtNfv8IKCX0
 BqPBNAm4XRGtP5Hsd8V2yUJsu2S/41DdN2D+ebM2VXFMX+tfbXVrQ3HhPgtDoQnVEqCg
 LJSA==
X-Gm-Message-State: AOAM532qy0eTiKCPjKLtxDmuOmZHTqG6El5EuL2Ap2NksT4KEcjohqGJ
 ADLNGtFBWt79IBxCbegGNazuNA==
X-Received: by 2002:a05:620a:133b:: with SMTP id
 p27mr262957qkj.382.1615909918990; 
 Tue, 16 Mar 2021 08:51:58 -0700 (PDT)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id e15sm13966861qtp.58.2021.03.16.08.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 08:51:58 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] target/arm: Add support for FEAT_TLBIRANGE
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210310002917.8876-1-rebecca@nuviainc.com>
 <20210310002917.8876-2-rebecca@nuviainc.com>
 <3930c2d8-8972-0acf-7a48-71803072a559@linaro.org>
 <970813ec-f190-6faa-e1d6-763ba3a6ed60@nuviainc.com>
 <b57d6395-8487-6b1e-f202-856ae13614af@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <d40c4ac2-5aa0-ce3b-28bc-1b807b16c64f@nuviainc.com>
Date: Tue, 16 Mar 2021 09:51:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b57d6395-8487-6b1e-f202-856ae13614af@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=rebecca@nuviainc.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +s7vl8vABCLp

On 3/16/21 9:09 AM, Richard Henderson wrote:
> On 3/16/21 12:20 AM, Rebecca Cran wrote:
>> On 3/10/21 12:24 PM, Richard Henderson wrote:
>>> On 3/9/21 6:29 PM, Rebecca Cran wrote:
>>
>>>> +    uint64_t addr = (value & 0xFFFFFFFFFUL) << TARGET_PAGE_BITS;
>>>
>>> The manual does not explicitly say, but I'm certain that this should 
>>> be a signed address, when regime_has_2_ranges().  Otherwise it would 
>>> be impossible to flush a range of kernel addresses.
>>
>> I see other functions have
>>
>> uint64_t pageaddr = sextract(value...);
>>
>> Would that be sufficient here too, or do we need to check 
>> regime_has_2_ranges()?
> 
> We need to check the regime.

Thanks. I've just sent out a v4 patch, which I hope is closer to being 
correct.

-- 
Rebecca Cran
