Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1199666ejb;
        Thu, 25 Apr 2024 01:30:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVXAdp9oCcgnouVESeow/SRkcCE5Xuehpg0nALjb9LLgaZCOSHlwZ/kctMub1PlISSShiESNPS0Arwov81RPK/WvcsEaVBg
X-Received: by 2002:a17:907:7e86:b0:a55:ac7c:4321 with SMTP id qb6-20020a1709077e8600b00a55ac7c4321mr5787799ejc.49.1714033848397;
        Thu, 25 Apr 2024 01:30:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714033848; cv=none;
        d=google.com; s=arc-20160816;
        b=uLwfbbaPTz9PW1H6NRHS1CXqKGeCKYklrtZ8QpRSFbpVFQVkRPZG7oNjzGJPsZ8IyE
         5h6HzmhJKQPgIGytYtpOAhbEoxupbAKtbhJWxhZpwqkLQnQiWV7EwCF6uTM0pbt2K2EV
         90JNHYOg2tgE7Oeoa2JSpdiIphme5rP70zLU4UcE+s8UApapQo6tB8qB4R8I09vUQqHV
         QjySwGI1GJcpjsQ4pZXBl42qcnuKDHc+P764i9JvwW/bdk6mYB7MqDC3i+OIOdPDNWm2
         guasn5OQuBsaBAK7AyGCOiT7qpQK9hUe3ZTtO15oALsTrixJIXITJDAsTUpVskcq7l53
         bsfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tZ3/6YhofnYJIVLe11MJ4UpdhXlzdTRi2JtZxyvTnHI=;
        fh=6BlikwHUJLbD2wcnnZEeVp5IHQwuUVGcbrPCnwhnGyw=;
        b=OFNh408OeSTRrDpArl6tpeuPJ8xQemThAAb4ZFRqeQx+OJOJbLhaoQoaW2Nhn7NXqH
         xzmlSgwz/U5yrp39ksJ2umeMVJQcQhlG/pLq3qNfQDjFtzdXxOcfgXfn9Bew/ReSjcNJ
         ar6RTURTDVMtXZKV1JNRGoUpEWj8B00c3CbStdCxaeBnLoQ2ujb4u5iOxc0Pj9WHxDLA
         lsfK5+4SoBsDKqLsr6IRIIosjlBFEOg4cUqdjmnwUFeRTNIuB8Z4oro7EQC17+J0Z6+h
         SEbiRJurSjX8aUpJGqUeB41zph+Qgafs8HAfolmJxb44IB68DIBT787f9SqGUzoJJQiG
         mrfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AxIYJGt7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id lu14-20020a170906face00b00a58866ed965sor1266502ejb.9.2024.04.25.01.30.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 25 Apr 2024 01:30:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AxIYJGt7;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714033848; x=1714638648; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tZ3/6YhofnYJIVLe11MJ4UpdhXlzdTRi2JtZxyvTnHI=;
        b=AxIYJGt7EwbiusS1XjfIGxl1frhC7nafLMSD1BPpLsCXwX8RrLMu9Kt0f72sG3t77B
         FXLb7en8x8AgUxEEGnQRBZNXhjlgvXDAyzuir1vAZTxJLk2ZTxq6wiXbukIxMTDpSF07
         jgJm2vx2POPJMU1zW1w+GQzubiylkrhIFreBOaMpAnQqQ3pWL+OZN8fDtUT+pG1cUw71
         HVo5LZWsVYOeMGg6uitfI+uc91TaTnI1/zvWHHah8QoTQ4OP6V23aH7AM3wzhiR/JjVT
         fFKCtl9/jMgfa6NHXNgIW3NOMmU8E5WLVZKIgYLfMhVPYXZSA8Qv9KR3FuczoI20lR3o
         Ujcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714033848; x=1714638648;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tZ3/6YhofnYJIVLe11MJ4UpdhXlzdTRi2JtZxyvTnHI=;
        b=XTP1y0bcApX776/dvSgjf0qS4wzwiwcX7XkLFLu3Cw1wiWUMIxY8/EMAdNIO+GMJWc
         iVe8jpm7xhneX9JI8s6oJZVgJcVjq9qwiTTt53HRn9kr6geomgO7FZlQQ3Fa6E4WIaMJ
         hQQRWskIGdVBA6RH+IFNpCdi2u6XhmfpEET+B1EobpYyBSXo9blpXqBHjTaEqtBOqWnt
         5I5AABwu/pSoLIamOCRJU+2NSlqO2F26SeYbtRUG4RvyEP5WtNjCxMA3+KW+t4T2qaAI
         YKhWwEA9QOnTxIszbKlrS99sPh/+Un0TUvweRS1KA3bNwGwZKl6Ub0+LDJfiCO4T+soZ
         mKBA==
X-Forwarded-Encrypted: i=1; AJvYcCWS9LABkAEdhrGuNd4BcpkC50nopZ9NqeiIi8B/5QOLytbIVhDyZvtfwStpEC0RIVYWLu0NAmJGpFx/iZfSBZQYmn9WFYfw
X-Gm-Message-State: AOJu0YwMwGQKjPjEfhqL8FG7kv67kbv5Z3XzLXdB0ZYJieIu+VRYhSsR
	w22PfN8el4Hh9nl0yVwCOncp3sGu/y6xa2iXZ/T+mnbbuMSK+JKQAWNGsrUgxxR/9YZJnbIdVUF
	Ej1c=
X-Google-Smtp-Source: AGHT+IGbxmvKPuF7F+Qe1o2T+PT4u6mNxMQq2gs4ua6p8aEqwoV+d0VmlM+jfXg6mkwgsGfHemKX2Q==
X-Received: by 2002:a17:906:3b5b:b0:a55:33a5:9116 with SMTP id h27-20020a1709063b5b00b00a5533a59116mr4508604ejf.33.1714033847972;
        Thu, 25 Apr 2024 01:30:47 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.187.197.201])
        by smtp.gmail.com with ESMTPSA id i7-20020a1709061e4700b00a52244ab819sm9434096ejj.170.2024.04.25.01.30.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 01:30:47 -0700 (PDT)
Message-ID: <86326b55-3435-4ceb-8630-e44ce3b15d93@linaro.org>
Date: Thu, 25 Apr 2024 10:30:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/24] exec: Rename 'exec/user/guest-base.h' as
 'user/guest-base.h'
To: Anton Johansson <anjo@rev.ng>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Riku Voipio <riku.voipio@iki.fi>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-15-philmd@linaro.org>
 <mneadkx4ytvujstobsjifz7hoizsbbpes5opi7i2lyodl3tgs2@7jzadxaldrpi>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <mneadkx4ytvujstobsjifz7hoizsbbpes5opi7i2lyodl3tgs2@7jzadxaldrpi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: cqAMEWFoewxz

On 25/4/24 09:39, Anton Johansson wrote:
> On 18/04/24, Philippe Mathieu-Daudé wrote:
>> The include/user/ directory contains the user-emulation
>> specific headers. Move guest-base.h there too.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   include/exec/cpu-all.h               | 2 +-
>>   include/{exec => }/user/guest-base.h | 4 ++--
>>   tcg/tcg.c                            | 2 +-
>>   3 files changed, 4 insertions(+), 4 deletions(-)
>>   rename include/{exec => }/user/guest-base.h (72%)
> 
> Patch looks good, but the difference between user/ and exec/user is not
> entirely clear to me :)

Neither it is for me. In next batch (part 3) all headers are
moved to user/.

> Reviewed-by: Anton Johansson <anjo@rev.ng>

Thanks!
