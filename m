Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2110584lfo;
        Fri, 5 Feb 2021 07:33:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxb99NcOYQTCeaSgKZM+FoOg6u/OW6QxpCZw7IxTqR+mT3NJ+3VWKtXynCyy4TqDNhsZ3Ky
X-Received: by 2002:a25:6d8a:: with SMTP id i132mr7196249ybc.337.1612539228481;
        Fri, 05 Feb 2021 07:33:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612539228; cv=none;
        d=google.com; s=arc-20160816;
        b=jHu3Q5vj53RtzZ/hmw5NiFUEOE18SldPHL7GuT857Z5O7uxUocU47a6UKRn/GQQg/u
         DG90YftFdomYWLcyKuhxxtX5/L1/P++6gZuSH8A1vnp2urVRCc3VgvcB01N8SNoUzhAs
         eUYZTJSFpaxue7Gt+jhuht7HH/eI61Kgq2f7+RAXkKVwdRiKfEayz4N7QkxMQdpOf8H0
         2PQhS5J4A6/Ozy5yKG5SA4be2brEAUBIvAyn2GSTnPYUXoQHADwsSEOZ4FtfmaY6b54F
         zF3UdpghfoEcGqVKvXBajXAk1HcDtRJ11MdQhaiM7QBKMHnPF8kyaHWhTH5yhBH+uIt8
         Ns4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=j4o0LEcJJQdmqJawD0zvnFopZOSp2j3LU3S8PxCkLaM=;
        b=HMIeEh7ME8U5dvz4J0ZcNfWW3Wk0y3py+4/QiCWKoTxd4rd1QxNFJwF35ea1Ic7IM/
         uFIw3T3pDB9cfGDUBMYKF41mYUwKKJtREu23WfK54pJXMCChFpMaUuaJCZ5hlkkHLrs6
         Tp1aJPWhjLKxQ5JDfNZXgO2KLI00W9rSWKbDBYrbQ3jxoF/2HPZCLhxkCToAxVSLZURi
         XO3Ka7x668M1In0ylRqqwXxPHTZHXa0ZaokPYdHxbww9VDEeUNPKB85jy9rbk6xUNl9P
         LMWUzEtby2kA2qacM/eDsqGNOl/E7rpJlZR0OvfHzIktBYk3VAEIo+PGbrxEzkzHVbE6
         tujg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t5ezDEcN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u3si9472094ybg.40.2021.02.05.07.33.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 07:33:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=t5ezDEcN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:59820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l837D-0004Or-Ry
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 10:33:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l833w-0002XO-Sf; Fri, 05 Feb 2021 10:30:24 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:38840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l833r-0005Zu-FB; Fri, 05 Feb 2021 10:30:24 -0500
Received: by mail-ej1-x632.google.com with SMTP id bl23so12535881ejb.5;
 Fri, 05 Feb 2021 07:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j4o0LEcJJQdmqJawD0zvnFopZOSp2j3LU3S8PxCkLaM=;
 b=t5ezDEcN3cUtmwGeMzVvPekjld4MT14JKeF74f28nULLxkbVcJDZPylMpfnzqtMnmt
 8XpDDM6UzgUfABc7g7liYm5aMiWMFnF9ZCFvS8LHeFfJ/mgU39EOYElBb5zzzyhve3xw
 8sbIJdV14+rONlScVd5RyHZPaYr71sS+cbMq6+o/LeZTyAPG6csk0yEjLs4DrDSgDURG
 jfcOMVfyEw9XqcF7duIPDdly0IThD+Ffr3KdiyBvetOTPeGPvLaLwpVwVNS9zAF0ND9T
 RDaVGTx6MkfKv3iWuit/x7q2fiUHya6iPhR9zi1ITGMt8XXENqk29gwlzdQwhpYy16le
 v5iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j4o0LEcJJQdmqJawD0zvnFopZOSp2j3LU3S8PxCkLaM=;
 b=LMGkVcBZmqwESgnsBO8nCZkYS6vmKRHRqVLXp96+K2qoDh4L1R5v/HOsc3PZuXoB0P
 XTyIs/Zpl+uXuKPOt34rFqU+w5KP37uDXDidwlt8gwH9voCKFIXflu/5wP2Z9F/BtNLf
 DxkTmhDoz+jVNqWRyULhhqAOfrykaux6cRKL2OzCLIkqb0s/NtV1B0k/yrTiYmBJTHjK
 kda9O2mD3/Vzf8q0TN8ljO1iNFohanTr27ovFxUU4XZuyf8Kplh1kM/su8P+T+77VTNb
 UiL3GdXDYPoLr1S+d3Kt3+A74BGxZ+x2tXZOEMkUnx8YkKkHg101m4xMbJxvOQJTSZKk
 IRcw==
X-Gm-Message-State: AOAM533R/cveiM4aD2izJiotQGq56giACVzxTxltv+aqduwI/zTHrJqQ
 ffhAqXJ9I36waxw4zorkA+4=
X-Received: by 2002:a17:907:98d7:: with SMTP id
 kd23mr4528373ejc.283.1612539017577; 
 Fri, 05 Feb 2021 07:30:17 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id cw21sm4086351edb.85.2021.02.05.07.30.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 07:30:16 -0800 (PST)
Subject: Re: [RFC PATCH 9/9] tests/qtest/arm-cpu-features: Restrict TCG-only
 tests
To: Claudio Fontana <cfontana@suse.de>, qemu-devel@nongnu.org
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-10-f4bug@amsat.org>
 <17a58366-a25e-1c9b-eeba-2924803a48e7@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <db67a0e1-7933-736f-9e1c-78532444afdf@amsat.org>
Date: Fri, 5 Feb 2021 16:30:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <17a58366-a25e-1c9b-eeba-2924803a48e7@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.33,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jones <drjones@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ++5vzMc49o2o

On 2/5/21 4:20 PM, Claudio Fontana wrote:
> On 2/5/21 3:43 PM, Philippe Mathieu-Daudé wrote:
>> Some tests explicitly request the TCG accelerator. As these
>> tests will obviously fails if TCG is not present, disable
>> them in such case.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> Cc: Roman Bolshakov <r.bolshakov@yadro.com>
>> Cc: Claudio Fontana <cfontana@suse.de>
>>
>> RFC because of the TODO.
>>
>> Roman posted a series to have a QMP command to query enabled
>> accelerators.
>> ---
>>  tests/qtest/arm-cpu-features.c | 33 +++++++++++++++++++++++++++++----
>>  1 file changed, 29 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
>> index c59c3cb002b..c6e86282b66 100644
>> --- a/tests/qtest/arm-cpu-features.c
>> +++ b/tests/qtest/arm-cpu-features.c
>> @@ -20,7 +20,7 @@
>>   */
>>  #define SVE_MAX_VQ 16
>>  
>> -#define MACHINE     "-machine virt,gic-version=max -accel tcg "
>> +#define MACHINE_TCG "-machine virt,gic-version=max -accel tcg "
>>  #define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
>>  #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
>>                      "  'arguments': { 'type': 'full', "
>> @@ -41,6 +41,16 @@ static bool kvm_enabled(QTestState *qts)
>>      return enabled;
>>  }
>>  
>> +static bool tcg_enabled(QTestState *qts)
>> +{
>> +    /* TODO: Implement QMP query-accel? */
>> +#ifdef CONFIG_TCG
>> +    return true;
>> +#else
>> +    return false;
>> +#endif /* CONFIG_TCG */
> 
> 
> I would not use the same name as the existing tcg_enabled(), which has different semantics, even in test code;
> 
> what you mean here is tcg_available() right?

No, I meant static tcg_enabled as the kvm_enabled() earlier method:

static bool kvm_enabled(QTestState *qts)
{
    QDict *resp, *qdict;
    bool enabled;

    resp = qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
    g_assert(qdict_haskey(resp, "return"));
    qdict = qdict_get_qdict(resp, "return");
    g_assert(qdict_haskey(qdict, "enabled"));
    enabled = qdict_get_bool(qdict, "enabled");
    qobject_unref(resp);

    return enabled;
}

This should be moved to something generic to QTest IMO,
and we need some runtime qtest_is_accelerator_enabled().
