Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp31765ejr;
        Tue, 10 Oct 2023 03:37:37 -0700 (PDT)
X-Received: by 2002:a05:6512:2824:b0:506:8d2a:565a with SMTP id cf36-20020a056512282400b005068d2a565amr9318883lfb.69.1696934257322;
        Tue, 10 Oct 2023 03:37:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696934257; cv=none;
        d=google.com; s=arc-20160816;
        b=i9O1m9yIDNOdYW7ogAGFOKQXfgsvNq6TpCWlY+QFEhitUlrUG9LO4nQuLhMnmxiVpV
         ZKJ89oWdHlH5jIzWr0w6E8eYqYWQ1/CaGUpSzrvD0S38TL41ctHyp1w8D/q9K1krCi4v
         Q6t22TW3EZ6ie0YMKoSKShDqRBdopIxSMOfJpjOaJAIRRvhfYo+0qye4OPzNenLPXEhE
         obIlnISMcZsX+SBHE9PK5Vx5z6p4+QO6JsLEozLVGXpIcm6u9EkEkbk/oS5l/QbJi/lg
         RxE0NJHc/COORCG2xiobDDrehTWmzu8r0OhwOtgl5QOsA4nO1dWNSmmBZdu07gzcPyqW
         +ZCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=tg7P1EztHNIkMXzSPhcAdvWMO8kYwgQvGwMi6seBK6Q=;
        fh=oVR2DZSNFT0tHWDuqDyZBxV0O6XhlDDmQvwEpq3ZUUo=;
        b=NRHHiXvvLqsSkcE786Lx4XcPyiMx10f36EFcua4GvPYXtL7K8MLD1Tuckc5hjnJFFB
         GXcwWrreFpaXMC2qBTrfJ1Kw6GEf5/HZB6jfve3WXrIYSbnAkxS8nIzsR3YHX0Ix4Aoy
         NiZSYIf1fOCe9jeN3jfSRb0iWX1rHHhLdse82bo44F8BHxHt71L9c0Q9EtxL3OgGIfWm
         5eDaVn1vNaSG2SLY9TNoaSFYoyEDpzXThMGqlK0FVTY9T/4smqKS/Scxub29FyTLnL2T
         9qdtkxlNeiWctltZtQwJxuW+EHZw9Eo93X9mS9JLxCTeWA8Dcei2+9Y6QbTo32AxRqI5
         pdCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eGiIvoIv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s2-20020a195e02000000b0050335b323b0sor1969229lfb.13.2023.10.10.03.37.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Oct 2023 03:37:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eGiIvoIv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696934257; x=1697539057; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tg7P1EztHNIkMXzSPhcAdvWMO8kYwgQvGwMi6seBK6Q=;
        b=eGiIvoIvLey7698W6Msap7DXjiSyMldlnwP58/ZP5iuTLCyd4WRfoT95RETBhF95bs
         omh6iV7D8/GW1hsH6JPZAdqbXS/PmaXbp6ZVgA6az/zeJOT/21ZrmwmscY/lDZ41DwXQ
         kRBjm7TgGUPwpqQjLVxHIB45dO9ZOA7y+ylq7Yo9JAepoyDuIl6jrhdDWn0B1A/9b2xH
         H+0BUFq7HmheZSQI3f766M9QzMhMH2qU5Mplxbq8RDvZu250vnFGAObiOtEftoza4hp4
         NeXJDgl4lw+jEO4DYbHUza7ld1ONVztFQi4hlcDUZf3+Hmt189Fr2zDJwDYmDsTI8G1l
         o8Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696934257; x=1697539057;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tg7P1EztHNIkMXzSPhcAdvWMO8kYwgQvGwMi6seBK6Q=;
        b=dxRYe+MwoTMiryAKG3llfDwDdcDj9CvdPAgb+okv75KxGO+nY6mqa342X5Kkb0t8Mv
         /0Cuc/HopR5gQaf1gn3zCYTNEAsAJ6tIrl5Mn4WLYW7ae+I/ZxuooeiTBGLxjJIPEqam
         hK+4uXmpjvBfD22b2+Tx7+Etc8CqFbF38ZjaUrUOeJ8S/KPwlPxh9R5NHFctjoieAFQ9
         MasvvOf+E02En5HweFbCZtLCi8LLRo7JPrIsNok1j0yydspHmQ8ZuMLO4d26UPlW/1Ui
         QpFQ0l9OrixQ1wGnJM/5pIgeh9IQs+hD4gj9FZGihfAC6I+UFvuoSTmESh9Nvaueehi8
         SCNg==
X-Gm-Message-State: AOJu0YyQRrI+mekxYEnGjD4Ai7u/P/t9ctCtIlxxpY9hDiQ9Xi9G107/
	LAiiG8rlCcGWoSNRmUcGYA0SyZO6
X-Google-Smtp-Source: AGHT+IH7exa3XOZS70jR7zFie2DJ6Q9QERoMYvJEgWM979mOYX62e/xkJdGewqRYeq32iRY3abLUfg==
X-Received: by 2002:a19:7917:0:b0:503:c51:74d7 with SMTP id u23-20020a197917000000b005030c5174d7mr12299260lfc.17.1696934256789;
        Tue, 10 Oct 2023 03:37:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr. [176.172.113.148])
        by smtp.gmail.com with ESMTPSA id c12-20020a05600c0acc00b00402f713c56esm13766767wmr.2.2023.10.10.03.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 03:37:36 -0700 (PDT)
Message-ID: <7e3e43ec-8b97-cd63-ce50-6859b78ca5f7@linaro.org>
Date: Tue, 10 Oct 2023 12:37:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 4/4] tests/qtest: Use qtest_get_base_arch()
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Fam Zheng <fam@euphon.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Nicholas Piggin
 <npiggin@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>, Jeuk Kim
 <jeuk20.kim@samsung.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Amit Shah <amit@kernel.org>
References: <20231010074952.79165-1-philmd@linaro.org>
 <20231010074952.79165-5-philmd@linaro.org>
 <a3ff5135-2fd1-b3dd-f576-129ef08b47be@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <a3ff5135-2fd1-b3dd-f576-129ef08b47be@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: UX7droG3uYcp

On 10/10/23 11:58, Thomas Huth wrote:
> On 10/10/2023 09.49, Philippe Mathieu-Daudé wrote:
>> Additionally use qtest_get_arch_bits() when relevant.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   tests/qtest/ahci-test.c           |  5 ++---
>>   tests/qtest/am53c974-test.c       |  4 +---
>>   tests/qtest/bios-tables-test.c    |  6 +++---
>>   tests/qtest/boot-sector.c         |  6 +++---
>>   tests/qtest/device-plug-test.c    |  6 ++----
>>   tests/qtest/drive_del-test.c      | 16 ++++++----------


>> @@ -1867,8 +1867,7 @@ int main(int argc, char **argv)
>>       }
>>       /* Check architecture */
>> -    arch = qtest_get_arch();
>> -    if (strcmp(arch, "i386") && strcmp(arch, "x86_64")) {
>> +    if (strcmp(qtest_get_base_arch(), "x86")) {
>>           g_test_message("Skipping test for non-x86");
>>           return 0;
>>       }
> 
> While this change makes sense (unifying two checks into one) ...
> 
>> diff --git a/tests/qtest/am53c974-test.c b/tests/qtest/am53c974-test.c
>> index ed3ac7db20..dc41182a38 100644
>> --- a/tests/qtest/am53c974-test.c
>> +++ b/tests/qtest/am53c974-test.c
>> @@ -253,11 +253,9 @@ static void test_reset_before_transfer_ok(void)
>>   int main(int argc, char **argv)
>>   {
>> -    const char *arch = qtest_get_arch();
>> -
>>       g_test_init(&argc, &argv, NULL);
>> -    if (strcmp(arch, "i386") == 0) {
>> +    if (!strcmp(qtest_get_base_arch(), "x86") && 
>> qtest_get_arch_bits() == 32) {
> 
> ... this change looks more cumbersome now (doing two checks now instead 
> of one), at least at the current point in time. Do you urgently need 
> this for your refactoring? If not, I'd maybe postpone such changes that 
> make the checks more compilcated to a later point in time.

I wanted to replace qtest_get_arch() completely, but not that simple :(
