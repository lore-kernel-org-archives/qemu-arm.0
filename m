Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp2051754wrh;
        Fri, 10 May 2019 06:52:21 -0700 (PDT)
X-Received: by 2002:a63:61cf:: with SMTP id v198mr13782545pgb.29.1557496341729;
        Fri, 10 May 2019 06:52:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557496341; cv=none;
        d=google.com; s=arc-20160816;
        b=IOcDJ+0B2LhsafG90pzRXHaNzlZcblNCAFJ4Nar17cy9/q3es6M6W8nXqrFOhohTW1
         zmnlgEBSBw14lZm2kVN4TusUEy0i5qPvSv3QdRfOHedgF8qcS+IhgeMxiAsiQgWovJFh
         IoyUFpUwv0APySDa78XTJy2U6MOzTMrZD3Dr0nSqgM/1WfUUdsHTN/Xr/N6xWKvFUa5h
         keW+fZoAAp/CfTxE5c7lPsyl3R5aST3qJVxv8FaKbmDxnshWe6h5v7JPrfPp0Eih7Eue
         ZgWaMGV/YrbWlsKB7T5DRkkQG0IEFZfT7eyfZ5XhWxNdGO3W68AtftxP4xaMRyFtryRl
         aFUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=s1yaS2qGTV4sFX3OmBTZVcWIBIRwYq/Ko7F++b45xJA=;
        b=zlpX7mlw0aTvj3WXd4emE2AzLt+lqYwnZ000ud58BUvZgq5Q8lzoRb+IvueP+3MZJs
         hTaZE8Za3aJm6yXag3DplByv/bDIvuk7MYMPLPV/DNLSkWwXS+e482wC30Ku1O0fx06X
         v7E+HggtZLoba8VLWSTkSSHpnNG1aZk2dyGo4uAvysp5c2+zPJTKuG0QXBwirBqo8Mfz
         PPZgh/a2Gxs7ntBRuXv/BC6Ai/ie+ODslmRL08gN9FEtTruFOWKXwF3stvuph9qlAThI
         cvD1ODAxFem6nYNqyS+6ndsXuwIVBMTaVmPNDfrGAY6TU6faJMGvYRa13Dx1iXgdYZnz
         FgEg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KVwEgMkA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k14sor6360705pls.61.2019.05.10.06.52.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 May 2019 06:52:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KVwEgMkA;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=s1yaS2qGTV4sFX3OmBTZVcWIBIRwYq/Ko7F++b45xJA=;
        b=KVwEgMkAYDQKzfbC+ziU6h/Gt/ghZG1ZJRfUwbOlQymhKG2Pp39Get/jRl6Uh78n9y
         6k0WWW6Fwkf+7x8o+mO9BuYNwqHFmik00glNEACElytyHe5Fv+sgo1jUzeAQcLa+NgYb
         jggBc0rfEFQjID30Hp5Zn/4rOTcTDzPf/DNsp1s4We6+WiIlHhPKVeKX71bwAZRVxwfl
         ig0KkNu2PKEON4Dr5woT5vdmaOaD7mo8mvjpgzKoZxjWdoqwkJP3S2fD0YWcdbDArHje
         pd5+HRTOVOLRlB7xsUoPnbFGw/DdvmzkJP9meaS1y8Z84Or76wmWPYSW4pVY0YsB7U8g
         ozxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s1yaS2qGTV4sFX3OmBTZVcWIBIRwYq/Ko7F++b45xJA=;
        b=bLpE+oW78ngHSH2m5h4z5HRzWhPsvb+frffFry4AHSzOhNssKscWcUpvzHfgxI8YgO
         OlQMZjUhF+cFJ0p1RirY4vPRI4EmmjTPGRybFUPcaagP0FXDYgRMaxeam8jGUVWzCAWg
         e30yrI8/N5BjuY9kfTPVHTqiBKhwaQQbE+mVgklvP/dydjFFdjsfvodOJY/5FBGBXOD+
         urmd3Q9NFm+iX2KTebzRMjEshLtHqiTG+PyQjsGwmS2XpBQ6wtqA+6Nx0HGQ9PHbMuNv
         NrKbCkTctpoaL6KshYL7A7ecPQ2kuQITlLYCpeFr8lwxbtyaulf+VLyLcGKlTzjfONFD
         OkJA==
X-Gm-Message-State: APjAAAWRzltnzLWcDHKWSPHSeNS42J4FEFlNBRGvXiw11WxvM2pb3rCb
	rlUzeuTuaW+XgiHS/AcXLHjaDYTL
X-Google-Smtp-Source: APXvYqySsVUoEK7Io4a111Hi3tAzTa5C3/4hMUQfPx7j6EQ7VMAoK+VpXeOUQEyD3IeezaSZG51bKg==
X-Received: by 2002:a17:902:a988:: with SMTP id bh8mr13015640plb.243.1557496341246;
        Fri, 10 May 2019 06:52:21 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
        by smtp.gmail.com with ESMTPSA id b18sm8931662pfp.32.2019.05.10.06.52.19
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 06:52:20 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v1 05/23] semihosting: enable chardev backed
 output
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20190509165912.10512-1-alex.bennee@linaro.org>
 <20190509165912.10512-6-alex.bennee@linaro.org>
 <252a5c4b-6ba7-6fa7-8792-fe597e766757@linaro.org>
 <87pnoq4x4o.fsf@zen.linaroharston>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <f6abf67c-94af-22a6-c648-2fdbfe73974d@linaro.org>
Date: Fri, 10 May 2019 06:52:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87pnoq4x4o.fsf@zen.linaroharston>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: IVwGh5Libz0O

On 5/9/19 11:55 PM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> On 5/9/19 9:58 AM, Alex Bennée wrote:
>>> @@ -51,12 +51,18 @@ static inline const char *semihosting_get_cmdline(void)
>>>  {
>>>      return NULL;
>>>  }
>>> +
>>> +static inline Chardev *semihosting_get_chardev(void)
>>> +{
>>> +    return NULL;
>>> +}
>>
>> Isn't the point of this function to avoid...
> 
> Yes... but...
> 
>>
>>> -                return write(STDERR_FILENO, &c, 1);
>>> +#ifdef CONFIG_SOFTMMU
>>> +              Chardev *chardev = semihosting_get_chardev();
>>> +              if (chardev) {
>>> +                  return qemu_chr_write_all(chardev, (uint8_t *) &c,
>> 1);
> 
> The qemu_chr device stuff doesn't have such stubs and is softmmu only as
> well. *sigh*

Ah, I see.  Yes that's a problem.

Well at least you don't need the "else\n#endif\n{" ugliness.  You have the
return out of the then block.


r~
