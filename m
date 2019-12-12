Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp1388996lff;
        Wed, 11 Dec 2019 16:36:27 -0800 (PST)
X-Received: by 2002:a65:488f:: with SMTP id n15mr7691842pgs.61.1576110987566;
        Wed, 11 Dec 2019 16:36:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576110987; cv=none;
        d=google.com; s=arc-20160816;
        b=uptfnca7XU6yIBoWO/sXeDK1nJzp/4zrCc69y0YAfgqM8U6o22u272urfP7ykNxfQ8
         yDTGA9/tzSCwxrUQZeOk5nzvD5TXYftHVcCySTDzj57PaqlfudphSmiqq9VOFesKTGIm
         n4Z+X/8Uu4bW1iW01XOpQjyjX8fSOuQieMbpMLWueExhzbX8rnOKhLG/ByRgGh4rWZ+S
         I7Jm07iPu530c1QNUpGacSIlS8DXZ6eD+/a9Wm/LKIV85mpedbaM7RZd85Zk3gBSk66p
         XCsdwapSMAc3phEa0fPj6+rt8NjE52kRu2oQsSxnbLsrG15g2XgSfFC3xMQCncsDCjgf
         c3gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=EBXWGM+EyE3h+YSrNPASzXIjTgAbTF+CJziNTgPQOdo=;
        b=X+J+8jm11E1Wcj3MhrkUtdMns6GTtblE0ClEmE0DsdpKgveS/Xg+SPExAqlY222og5
         F02WzEAAkqPFbOlazV2qsGzZL288HpGGCRNlVI6omW8U7J5cd2ef07c+oxh9xuD0yJlq
         1Er/lr3oWO1+8pkYC+SPNE89EJnJI1dJw4WNoAWlJkoUfC/wksvbaKMakSSuK03GE7yt
         +8N27zQb/5J49Uz+Nz9PPiEPmGQv7tM6FHRi3RGJfuyHhojKzbhHIBuHgMBkwyD8IG+H
         miUS2QLi/XLBoMcpmP/Wha419itZ4h9RkV/pkjpwz8iywJBCZBrWvanoO2P26vOyxgwg
         3h/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rom8Njni;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l12sor4745053pff.55.2019.12.11.16.36.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 11 Dec 2019 16:36:27 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Rom8Njni;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EBXWGM+EyE3h+YSrNPASzXIjTgAbTF+CJziNTgPQOdo=;
        b=Rom8Njnibqlg71eElLdJ/4Tum17IzXEg9p0+k72itPKxD9n3qpUiPVNbHgdrwfG4kv
         9jBr/dEJ9ayyrpTaeTO0YqF3ZX8sC/9Q2jjy3onxueYM5j23eTCOjfT5gKDoMzVPeUU6
         xInVMsynMypPVSEYqZmS8J5vzHExhBnTScCnoWxE2h6Z9S5AEOAlfBzgh+YUOprfk9DY
         W3+cR6PVQNJTSPYL+MfOczw4YxWquCHxIMDXyRVQ/NekD/Jq+cM3mhGnm6UGDkJMnvmc
         VPP9X/j2IZlWiaGMAxYgfJFZ5frXTnDdqqS/HICUmNUBD4f2RUyNJy93HLnP6przGlLR
         Jtlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EBXWGM+EyE3h+YSrNPASzXIjTgAbTF+CJziNTgPQOdo=;
        b=oZWQN0t5nQnx+ghRIfkXxaq4mc2H6eFSHm8L3Ze8RfmOCXrxrcMPZQwhxMXkrgTane
         iHGnPoenjfz3MPUYIvxKnxvTN9tcWEXhudMuMjc2bchp9Nu+ZxVFoyzSMMRq8AKuJl9O
         ki3aTE3O7GrVr0VMC4XFcZWsDSGe3CytHKf/csgBi8EN7gfmEHhtKLgM4A/YQ1UMMeCL
         uDzttoeCIyDzRSH7jiPZEY/rgchraDr2J3L/Ryv8LaOQGdjohReCAkNQNV+zZLCQ8ekt
         OdAc/EGqCLN8I8c1/ZALi4BZWn6EXybz6N370YJJdT59EG4db16hMaTj9VXsLjYYp3ud
         yvsg==
X-Gm-Message-State: APjAAAVLQ/n7fyqQea0vYdCrx19n/kw69Xt3jJBtJIwzOCbGyga7j17+
	S0OmDsk/JVYZF02Kx5k1hjCvONew
X-Google-Smtp-Source: APXvYqwPrYv5D14beVLe9QF1KTYggoi6brCUqnoLQX7mZLrMqhFCB1W9EUwdv4iCCoHOj5Zi6fRsiA==
X-Received: by 2002:a62:aa13:: with SMTP id e19mr6853409pff.36.1576110986855;
        Wed, 11 Dec 2019 16:36:26 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q6sm4683307pfq.27.2019.12.11.16.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 16:36:26 -0800 (PST)
Subject: Re: [PATCH] target/arm: Display helpful message when hflags mismatch
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org
References: <20191209134552.27733-1-philmd@redhat.com>
 <87d0cx32vv.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1d51109a-ae9f-7bfe-66d4-0e1e1266df64@linaro.org>
Date: Wed, 11 Dec 2019 16:36:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <87d0cx32vv.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: BlGSTCBTc9Qv

On 12/9/19 8:00 AM, Alex Bennée wrote:
>> -#ifdef CONFIG_DEBUG_TCG
>> -    assert(flags == rebuild_hflags_internal(env));
>> -#endif
>> +    assert_hflags_rebuild_correctly(env);
> 
> I'm trying to recall why we don't just use:
> 
>   g_assert_cmphex(flags, =, rebuild_hflags_internal(env))
> 
> I think it came up in one of the reviews.

checkpatch.pl.

Because, I believe, there is an environment variable that causes this to *not*
abort on mismatch.


r~
