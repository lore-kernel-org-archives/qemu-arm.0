Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp8142ejr;
        Tue, 10 Oct 2023 02:51:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcW6yKJOLBJ4OCXWhuTN6wyuv/nF5ia1YP59UZ80Uj4vzUXttvVl5EMLoVSgoXuuZma/BA
X-Received: by 2002:a05:6214:301b:b0:65b:1594:264e with SMTP id ke27-20020a056214301b00b0065b1594264emr18811897qvb.51.1696931470505;
        Tue, 10 Oct 2023 02:51:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696931470; cv=none;
        d=google.com; s=arc-20160816;
        b=bGIF2TMvyIx8MjirC8/SRbJR6vraiNVArARrtOzR0qbYXzTsShog8m9SKhWZ4dzJwF
         Ae0t3pLwOmA8scpPY0wDsMHAlJ6QtY40aEnnqeEHhe7npUZqjBz2jYudP3z7Dng9k3Yc
         yrtWxk3EijIncnc8eMs9/rnWdJ3LNIvlqwJSa1OzFzoPc+i/FxMktrQ0yAvHGcbGjjcA
         YAoCnUFim9ZTvSgcb3BHJwLTkCSXJmh66Y9CjPmxMLju8lhX9aQ72bRNWUCcYd5cI+Oo
         pZlQ+CcM4f5W1abztgUdKAPW/e/JZsgl8X3WuGfg4ZMmhkRsSJShmm0yEeB5LeLM81E8
         FgQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=P2Q/YWBsCpx2xy/0EQhZzEhe2g3WyDk5e5sPtL7OVlA=;
        fh=hyxXIb91MvxytttQZYdVhu4uFcxr7kYt6LcMz8vEYEs=;
        b=DnHXPYNRaQkofM0fNYyBHO/SJTnfNtR1jirDuUY+VXkBQL0MVnQc+W36Z2SfMntW04
         /Vk72ZM7XffWXqhvgouuJErIvyxH9gTJ6LbQMrdzZkUxfkoLDCmZ3u6own97Xvrrelxv
         Cd07Ot9nnrcb3u/U2fXZR5BeE4RLFRGiErIxPoxeVknXvuhLMt7J0mJ9ACYCEUFY9F0i
         gMSwv0Z3Kje+FL/o+UwHB0pDICQfAZHqD+ptHA1sw6ty/6XBBJqwUEUoEgWeVlsuJrdN
         GLhjS3AdZ3ZUUkHBQYU2vOci+LJ8UeF9EM6OVEVYdUQFJVH0TjQPHKIPrddNrYDHhSE1
         rrgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PkPAi0r8;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id x19-20020a0cb213000000b0063d4907b605si7284194qvd.129.2023.10.10.02.51.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 02:51:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PkPAi0r8;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696931470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2Q/YWBsCpx2xy/0EQhZzEhe2g3WyDk5e5sPtL7OVlA=;
	b=PkPAi0r8UqM1M2EUKb+dembTQaK3uJ9IGhok2U3VUY21IZ8r6LytzaXeLQYJQkughZ3R9p
	7BCzAo1+tMqS7jKYn3q0mlmaNrs91DYyGop4uNMdEfSbHBdsFvIxXh889pukRY1pvqLpUd
	2acs02zHtl80Z1t7G0vxOQ3NpmoqNZ8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-MKWqOtUuOQm2s6rx_D687g-1; Tue, 10 Oct 2023 05:51:04 -0400
X-MC-Unique: MKWqOtUuOQm2s6rx_D687g-1
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-77435bbb71dso579843485a.1
        for <alex.bennee@linaro.org>; Tue, 10 Oct 2023 02:51:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696931463; x=1697536263;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P2Q/YWBsCpx2xy/0EQhZzEhe2g3WyDk5e5sPtL7OVlA=;
        b=D8/u3ncte1Kx0Az/yUQXkjWrWEzerASBKhbxobwde7pyfJAv7EdgJ2Q/X7WAb+R7J9
         KRWs9AZQkxa58/4sWiNLESHpjIsZPAbKcxQjttRDEPLjWRelgp9CRU8VBeolwQtbwpCe
         lKW7MgfjRCUer78fuJyYumA3HXd81z1x0FZ5HQlap3SRMpY+8Kc4DjuzRxDtAUVHmBfF
         1A63OrQ0VuoKyiZwfue6CGqgGtcyZ396dTu/8dnY3iy2UdEmpTD2ZHcScFerrTcZ84zY
         P/8tBfUwoPd6Dc8/SgsBm8Q3sv0CLoYVlVF3dl+GvR15/4wH8B+A4PsZXEk+liH68cq/
         evgA==
X-Gm-Message-State: AOJu0YwD5J9vLT3iPu5g1/AfWWhxpJalWI6NqpI0NQKxPuuwT8P2Cv7F
	wby9Ff5nm4yYT7eA5McMHa7SmH4KtS4UsEQPkLQD+EMFZgRJ+KqYfa+HESPWEov2PCP004qw6St
	iVt4JKzReidqBTF64
X-Received: by 2002:a05:620a:99c:b0:774:a9b:d62e with SMTP id x28-20020a05620a099c00b007740a9bd62emr15961280qkx.46.1696931463520;
        Tue, 10 Oct 2023 02:51:03 -0700 (PDT)
X-Received: by 2002:a05:620a:99c:b0:774:a9b:d62e with SMTP id x28-20020a05620a099c00b007740a9bd62emr15961268qkx.46.1696931463236;
        Tue, 10 Oct 2023 02:51:03 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.5] (ip-109-43-176-176.web.vodafone.de. [109.43.176.176])
        by smtp.gmail.com with ESMTPSA id a12-20020a05620a102c00b007759a81d88esm4174875qkk.50.2023.10.10.02.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 02:51:02 -0700 (PDT)
Message-ID: <df3fee4b-ebc1-77d2-a436-a7baf3317a42@redhat.com>
Date: Tue, 10 Oct 2023 11:50:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 3/4] tests/libqtest: Introduce qtest_get_base_arch()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, Laurent Vivier <lvivier@redhat.com>
References: <20231010074952.79165-1-philmd@linaro.org>
 <20231010074952.79165-4-philmd@linaro.org>
 <c3b6a3a6-a320-f2f5-c200-da5b11e18c86@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <c3b6a3a6-a320-f2f5-c200-da5b11e18c86@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: yO0AUaSh/FR7

On 10/10/2023 10.42, Philippe Mathieu-Daudé wrote:
> On 10/10/23 09:49, Philippe Mathieu-Daudé wrote:
>> While qtest_get_arch() returns the target architecture name,
>> such "i386" or "x86_64", qtest_get_base_arch() return the
>> "base" (or real underlying) architecture, in this example
>> that is "x86".
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/qtest/libqtest.h |  7 +++++++
>>   tests/qtest/libqtest.c | 28 ++++++++++++++++++++++++++++
>>   2 files changed, 35 insertions(+)
>>
>> diff --git a/tests/qtest/libqtest.h b/tests/qtest/libqtest.h
>> index 1e1b42241d..54071e74ec 100644
>> --- a/tests/qtest/libqtest.h
>> +++ b/tests/qtest/libqtest.h
>> @@ -654,6 +654,13 @@ bool qtest_big_endian(QTestState *s);
>>    */
>>   const char *qtest_get_arch(void);
>> +/**
>> + * qtest_get_base_arch:
>> + *
>> + * Returns: The base architecture for the QEMU executable under test.
>> + */
>> +const char *qtest_get_base_arch(void);
>> +
>>   /**
>>    * qtest_get_arch_bits:
>>    *
>> diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
>> index a643a6309c..51cc92af21 100644
>> --- a/tests/qtest/libqtest.c
>> +++ b/tests/qtest/libqtest.c
>> @@ -925,6 +925,34 @@ const char *qtest_get_arch(void)
>>       return end + 1;
>>   }
>> +const char *qtest_get_base_arch(void)
>> +{
>> +    static const struct {
>> +        const char *const arch;
>> +        const char *const base;
>> +    } basearch[] = {
>> +        { "aarch64", "arm" },
>> +        { "i386", "x86" },
>> +        { "loongarch64", "loongarch" },
>> +        { "mipsel", "mips" },
>> +        { "mips64", "mips" },
>> +        { "mips64el", "mips" },
>> +        { "ppc64", "ppc" },
>> +        { "riscv32", "riscv" },
>> +        { "riscv64", "riscv" },
>> +        { "sparc64", "sparc" },
>> +        { "x86_64", "x86" },
>> +    };
>> +    const char *arch = qtest_get_arch();
>> +
>> +    for (unsigned i = 0; i < ARRAY_SIZE(basearch); i++) {
>> +        if (!strcmp(arch, basearch[i].arch)) {
>> +            return basearch[i].base;
>> +        }
>> +    }
>> +    g_assert_not_reached();
> 
> Sorry, I forgot to commit this change:
> 
> -- >8 --
> --- a/tests/qtest/libqtest.c
> +++ b/tests/qtest/libqtest.c
> @@ -950,7 +950,8 @@ const char *qtest_get_base_arch(void)
>               return basearch[i].base;
>           }
>       }
> -    g_assert_not_reached();
> +
> +    return arch;
>   }

I'd maybe also do a caching here, as suggested in the first patch.

  Thomas

