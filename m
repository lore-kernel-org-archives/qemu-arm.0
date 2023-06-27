Received: by 2002:a17:906:9417:b0:98e:baa:bd63 with SMTP id q23csp1318681ejx;
        Tue, 27 Jun 2023 01:54:00 -0700 (PDT)
X-Received: by 2002:a17:907:983:b0:96f:a935:8997 with SMTP id bf3-20020a170907098300b0096fa9358997mr27990988ejc.12.1687856040468;
        Tue, 27 Jun 2023 01:54:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687856040; cv=none;
        d=google.com; s=arc-20160816;
        b=KtfW0ZKSh1g/UQUWVtdRysLzz1kd4BbkLwitwOKM87ZwPY/kBGRcCnuGwW2qDhFUqV
         uyjkR003fhF2UGJcY7UWmylLT2QaNnDlKUYCd53LStwRmMzj+/8GXRODADP23G5j8WXC
         olPawb8TOXNJkux4ZDTCrQCiyO5aI9ZFuw1a1TYbRONXZwuuZ03gPTNYzH1+pXYz2tIh
         9f/2ql5pk04DhiOcrxOAGr3sLWSwucQSiZOpLMRUr8jX96OIrRVCH5LmAFpLaInB1qhd
         Y4VjAY5U5Y5medFyZNGgdMxVVuXNhytjrcAyRhorFC5KH6rse6hbJYl+9+DZXcpWxIix
         92ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=SP/AQ1lhPmkfo1DD1a3kRUAZr3WZGDutW0g6+VnAEE4=;
        fh=WaJ5zwmel2amiM4IZAYoklcLkNpNPD19PAd99vWOwGo=;
        b=I2zNxMv+H0COE4sALnBFJx0zMKh4pEnHhRFQO9sn1aT6WHvIdaq4NXWLc5rS4NjhLJ
         FkPvbMT0GMpb/PnwB07DMBRgq0T8tPyP/FR+YNI2z/TyU7Xq4aSVikJRJb8DtnE7QCUx
         THv4/txHfPI35Wm5Vb8qJM0NvCuWsb9oh/2++RC2JcbfnoLfc2u9/Oqq2KnFNC1R0o3j
         VIIb35AQtZoz6TG7Sh0Kj308Qfilwt36t8g79ur4wYQtZ6jkVoerM7NMpOTNUQk1XqpF
         73GUlG4ZLzCTg1QMVZJV6wOhMYuTKgAczF2f/0hh4aChlthkAtmQ8yJ1842BKnrfZUKI
         Cj6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vmGrpxkI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d5-20020a170906304500b0098d8c39b954sor2565865ejd.13.2023.06.27.01.54.00
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 27 Jun 2023 01:54:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vmGrpxkI;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687856040; x=1690448040;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SP/AQ1lhPmkfo1DD1a3kRUAZr3WZGDutW0g6+VnAEE4=;
        b=vmGrpxkIRENozf4lBJ538WXIAsBWZFnrAdiXxZLm6KUbkJAFzEmHbdLrJ4PhtUFEFB
         82m9XkinccU56YpN8VeZHOmlWNcWlzLbDF1y2LM2mGNjqKee8giQVlawWXmbHzHpRtDB
         Xj8zEQW8R1tH6fv4yZRb6MkTGpcLgFOiI+Mvj5gDDk3mJFxIlzumcK2mujE6ASHwIRoG
         uzHsLHzYbM4f4qUyoUKiHDf5fKhqof1oqWgVsdnSj0doU7cPcDYSYzpYW4p5sbiAOoNx
         yBIXPKOPe4IPcAwpfFp2P/AkeA3j8r+j7H1L6+wofgnm+qdrMt45VsfJNWxVkvwzgT27
         h4ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687856040; x=1690448040;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SP/AQ1lhPmkfo1DD1a3kRUAZr3WZGDutW0g6+VnAEE4=;
        b=bpKcv5bwufdofZBbfC3HdwlBHCTUe9YF625Zh4KtenGwDL1RrfnIZQUb7JRLHt3Q1z
         KLrxjcEMYI/sP64MzCDSZp+1KDDRI3QGbp4BsxR/HHt36HAVVI6lLjwvd9E4a9MUHIqt
         SmuDuW+QaiBYHtt1bs0bkmjTRMCpvUDctuguWAZ8Yen4hbYudGqJdpKipa95Dr4x0AZZ
         ib9DxU3lauiQR6RhvGzv+NXdMVk4vlgIE42WIXSc4dbw1LPH67NQmAMb42DHybWS8rMf
         fNyGu2ZGd6PvYSAJDtj2OpjF40ZEm0p2U1fM36GwBo/BfmB2Xj8YmxpCwVPFMqIXAJ+8
         v/Bw==
X-Gm-Message-State: AC+VfDz3a1daTZ2gj38AAVxT06tpoUW9EuuZkxzQB8o30W+6ri6chlHS
	iSKwFT5ZVijcnemuiVfF5B5xu7A/
X-Google-Smtp-Source: ACHHUZ54qxB1hHAj8YJH3HP44662OVP5oAP6U1uKuwmZa/5WIlccKWfui1myilS/Q80CbvVCfmPSqw==
X-Received: by 2002:a17:907:2d88:b0:988:56d1:10ca with SMTP id gt8-20020a1709072d8800b0098856d110camr25969298ejc.66.1687856040042;
        Tue, 27 Jun 2023 01:54:00 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.199.204])
        by smtp.gmail.com with ESMTPSA id n14-20020a170906118e00b0098ce63e36e9sm4347758eja.16.2023.06.27.01.53.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 01:53:59 -0700 (PDT)
Message-ID: <2274a813-af8f-6447-6dbd-04f2f4f2beba@linaro.org>
Date: Tue, 27 Jun 2023 10:53:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 08/26] tests/qtests: clean-up and fix leak in
 generic_fuzz
Content-Language: en-US
To: quintela@redhat.com, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Riku Voipio <riku.voipio@iki.fi>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Bandan Das <bsd@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Peter Xu <peterx@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Laurent Vivier <lvivier@redhat.com>
References: <20230626215926.2522656-1-alex.bennee@linaro.org>
 <20230626215926.2522656-9-alex.bennee@linaro.org>
 <87h6qtcpup.fsf@secure.mitica>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87h6qtcpup.fsf@secure.mitica>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: pqR0mUgQ93hw

On 27/6/23 09:43, Juan Quintela wrote:
> Alex Bennée <alex.bennee@linaro.org> wrote:
>> An update to the clang tooling detects more issues with the code
>> including a memory leak from the g_string_new() allocation. Clean up
>> the code with g_autoptr and use ARRAY_SIZE while we are at it.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   tests/qtest/fuzz/generic_fuzz.c | 11 ++++-------
>>   1 file changed, 4 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/qtest/fuzz/generic_fuzz.c b/tests/qtest/fuzz/generic_fuzz.c
>> index c525d22951..a4841181cc 100644
>> --- a/tests/qtest/fuzz/generic_fuzz.c
>> +++ b/tests/qtest/fuzz/generic_fuzz.c
>> @@ -954,17 +954,14 @@ static void register_generic_fuzz_targets(void)
>>               .crossover = generic_fuzz_crossover
>>       });
>>   
>> -    GString *name;
>> +    g_autoptr(GString) name = g_string_new("");
>>       const generic_fuzz_config *config;
>>   
>> -    for (int i = 0;
>> -         i < sizeof(predefined_configs) / sizeof(generic_fuzz_config);
>> -         i++) {
>> +    for (int i = 0; i < ARRAY_SIZE(predefined_configs); i++) {
>>           config = predefined_configs + i;
>> -        name = g_string_new("generic-fuzz");
>> -        g_string_append_printf(name, "-%s", config->name);
>> +        g_string_printf(name, "generic-fuzz-%s", config->name);
>>           fuzz_add_target(&(FuzzTarget){
>> -                .name = name->str,
>> +                .name = g_strdup(name->str),
>>                   .description = "Predefined generic-fuzz config.",
>>                   .get_init_cmdline = generic_fuzz_predefined_config_cmdline,
>>                   .pre_fuzz = generic_pre_fuzz,
> 
> Once that you are here, what about?
> (Yes, I didn't care about the ARRAY_SIZE) but you got the idea.
> 
> Reviewed-by: Juan Quintela <quintela@redhat.com>
> 
> To your proposal with/without the change that I proposse.
> 
> modified   tests/qtest/fuzz/generic_fuzz.c
> @@ -954,17 +954,14 @@ static void register_generic_fuzz_targets(void)
>               .crossover = generic_fuzz_crossover
>       });
>   
> -    GString *name;
>       const generic_fuzz_config *config;
>   
>       for (int i = 0;
>            i < sizeof(predefined_configs) / sizeof(generic_fuzz_config);
>            i++) {
>           config = predefined_configs + i;
> -        name = g_string_new("generic-fuzz");
> -        g_string_append_printf(name, "-%s", config->name);
>           fuzz_add_target(&(FuzzTarget){
> -                .name = name->str,
> +                .name = g_strdup_printf("generic-fuzz-%s", config->name),

Even simpler is g_strconcat() suggested by Richard in v1:
https://lore.kernel.org/qemu-devel/42b497a0-e234-64db-e845-1c37b67839fc@linaro.org/

-- >8 --
--- a/tests/qtest/fuzz/generic_fuzz.c
+++ b/tests/qtest/fuzz/generic_fuzz.c
@@ -956,13 +956,8 @@ static void register_generic_fuzz_targets(void)

-    GString *name;
      const generic_fuzz_config *config;

-    for (int i = 0;
-         i < sizeof(predefined_configs) / sizeof(generic_fuzz_config);
-         i++) {
-        config = predefined_configs + i;
-        name = g_string_new("generic-fuzz");
-        g_string_append_printf(name, "-%s", config->name);
+    for (int i = 0; i < ARRAY_SIZE(predefined_configs); i++) {
+        config = &predefined_configs[i];
          fuzz_add_target(&(FuzzTarget){
-                .name = name->str,
+                .name = g_strconcat("generic-fuzz-", config->name, NULL),
                  .description = "Predefined generic-fuzz config.",
---
