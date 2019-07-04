Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp1853859wru;
        Thu, 4 Jul 2019 03:25:24 -0700 (PDT)
X-Received: by 2002:adf:f104:: with SMTP id r4mr35412662wro.140.1562235924590;
        Thu, 04 Jul 2019 03:25:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562235924; cv=none;
        d=google.com; s=arc-20160816;
        b=WZrx71l57qRe3JgBxlPpt3fmN4s1S3V2m6ojUkJ0fHo+ruk7WPhXp18zPSUfNhLGre
         BF+V95NQr310kyeexgVIFDk2jhUg69MEi3wHNHLvdCcGNWWgAFsQ1QN405uFoQ6hM4kf
         WlYponf4MZK+jAifO+RAbQVywn+Vfa4nzNx+AGE74/rN4YbxV3RliJqNocKUjIHwlEMC
         IQS3VQKmayfz0tVkP+gmsExxawG6SoleM/yac/MkwlZp2B35jCxBRhvfYEHKcJ4vEw1O
         zjaugSYrNRuYzHHR1VSdInrg4kmZp8P7DBkpR3iw6US+x5ZM0Bn0yUaAhdCEyX8XlOae
         c3KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject;
        bh=l6C3bU41/+4wwctuitgFpVuvKZkrCFZ89RMBKzl4UD4=;
        b=kBk28Dx3mF5bqz4/Mb4b/CP/ddfR42+on2mLp/RO4bipyiR/9wjWkJOQi85UlbfE2y
         Ct4EKfRHx5R8/rhGxRWTWTrLempZ2wTQmMVglEthwyGuFrBIY5cpeHgfyqj8ocRNhVt+
         GItANHpagBSbFTgRVsOjlZi0U6DezVLVTDieV30xr+COSUzZEM/Q8JEJGHC7O/Ptn+nB
         aFSx3X//y2n9s1yYCtmw/o022zQzCRSZuAe6NdGKl2D+uLuVCFE/xyw39U/4rynoDcjr
         zxGpm5xIqQgIuiiyo1Iv/jIrqgVs1zLUd1bHIdhN1Zbi4z6Qehg54IFpvVUWrNjXCgfd
         GqQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d6sor4211604wrq.39.2019.07.04.03.25.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 04 Jul 2019 03:25:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=l6C3bU41/+4wwctuitgFpVuvKZkrCFZ89RMBKzl4UD4=;
        b=TiF1+4BtZXgQ9zgB9M81zojesBEAVeLi5HAIacoJdJXpDVNVxVI7Sexy3eZ+ynUGLd
         DC3NWuVT1WiWuDsXLqz7pR2/eh7m0QvxtYE8jozPby3Lpl3aRnlGJceZWe0mEI2OpqKp
         2i3OZ8N9c33nC/QrBvUETio0nriEFQjGLQngZ/iWH7CO2gybs5mlWfmgftQf2sXvP4C0
         THiUTE53sam9o0spgxmQaGjS1nmL8VE6FPpyxxQVvFdMGGKHG4URkWHy+SzCc8ga0Df4
         IdktcfnBf/U/avTKVZakeARYMrD+pSP2KdwNrqmopvfQV6CGZgRYo2mFNdXpxAJxTmic
         +LSA==
X-Gm-Message-State: APjAAAUjaoRDtbHGtq8BfndBr3AuLxF5g/pQ/qNlmK1F/4cyocDmdBvj
	8ICNiQiY06ABI6m0amuxtjkK1Q==
X-Google-Smtp-Source: APXvYqwPbZ4LIBTWKg+W0MaiPCBQFI7pHaZP1LeEO1emcA1NJbhb9EJ6JS7MxzXNtM6Pgd/I4xLAeQ==
X-Received: by 2002:a5d:670b:: with SMTP id o11mr23703124wru.311.1562235924365;
        Thu, 04 Jul 2019 03:25:24 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.38] (56.red-88-18-140.staticip.rima-tde.net. [88.18.140.56])
        by smtp.gmail.com with ESMTPSA id t14sm3953225wrr.33.2019.07.04.03.25.23
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Jul 2019 03:25:23 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 1/4] target/arm: handle M-profile
 semihosting at translate time
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190703155244.28166-1-alex.bennee@linaro.org>
 <20190703155244.28166-2-alex.bennee@linaro.org>
 <927219a5-a56d-bbbe-26ed-ffb8be12f006@linaro.org>
 <87ef36w14t.fsf@zen.linaroharston>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <e7dcd75f-8897-1939-caf6-c879371a2f84@redhat.com>
Date: Thu, 4 Jul 2019 12:25:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <87ef36w14t.fsf@zen.linaroharston>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 9eNTxz36veL7



On 7/4/19 12:21 PM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 7/3/19 5:52 PM, Alex Bennée wrote:
>>> +static inline void gen_thumb_bkpt(DisasContext *s, int imm8)
>>> +{
>>> +    if (arm_dc_feature(s, ARM_FEATURE_M) &&
>>> +        semihosting_enabled() &&
>>> +#ifndef CONFIG_USER_ONLY
>>> +        s->current_el != 0 &&
>>> +#endif
>>> +        (imm8 == 0xab)) {
>>
>> Extra parenthesis.
> 
> The wrapping on imm8 == 0xab? Do you want that cleaned up on the other
> patches as well?

I understood this comment for "(s->current_el != 0) &&"
