Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4209268lfa;
        Tue, 8 Jun 2021 01:22:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbRpNvYr5rj3WDqatqegzrFn5mOEIEk2GsH7/XQm/eNU2T8NWcJ+qsGfA4iAPRQKCt98lz
X-Received: by 2002:a05:6402:42d2:: with SMTP id i18mr24142276edc.168.1623140574807;
        Tue, 08 Jun 2021 01:22:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623140574; cv=none;
        d=google.com; s=arc-20160816;
        b=gmo6rY1ruC3fkgtdxZUfKkC+Ac9FVXokqcDgY861fuXiPAJly4BUFIMe/ZopbepCDW
         ZHp7WCvzTuza2+HTZcMOzX+0fPbrDXP4tG6xIC5AEyXz6jeZwshOZqdC9Df0dTnI3TdX
         jGTCNBz3jOQhPmWcnN42Np1jScvqmQq2UmJMhb0nIGtm3Qm5zXF80PIHrRl7FrjqkHIt
         7GcfdNJaoMHV4exR7C5GCGsx19lHearsuyecxdeD9LDMf0V5cOdxoygSsxXxi8jen3zs
         jXk5ZNF51kvaXEXA07nZlcd8LGMtOGaIO6rEKtR740uv/HjyRzeLAggZTA/Hyjl6WYJP
         Xbxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=EpMpsjqP1j0QTUJCB+E11mmO7+81oKA7pBeilziXJdo=;
        b=GhBrhjf50L68asonmQn+mSoTTO6D+Mpp2zy3cAqluORNk2Hmb7CLO/lcAduzcd9Fko
         izeTcL7eX97fjT0/tAdQnSSKrM6nlLISxUT93vQBl2Em2rAeIAoK8PKlmhlT6K++HyoA
         e3+Anf619+sugxlGnN7WRwAS9O3KhgYLbgY8gxL0fevjS/Ug+aRTBuAqIBmByE4WW3vh
         VGh/PN85EY7PeSxxUSzS/sAWL1Dj6pyFe2nqmJyGdVholkHfxpe9En6oIngsPK4esVyE
         hKsMnvaGRsfOy5n6JYLBzI4jXfBx7bWlndCAKlVlx63fWwb6UcD1utKnC4M5mJDW2Jq8
         Jf8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SvD03tdV;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id o20si15068530ejm.286.2021.06.08.01.22.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 01:22:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SvD03tdV;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623140573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EpMpsjqP1j0QTUJCB+E11mmO7+81oKA7pBeilziXJdo=;
	b=SvD03tdV5vVkiplTbqXXb1+NhrMN5E0Xbh7EJu8a31xSSb6uStTXZ3Futebg8zBG6nvAQH
	NuTqWBlYiAgXk/Vz5Bwig6oP7wyrJjkEIXxC//iVktyXNsXLBINdJFVFsZvzBdW334Lzs5
	NG6kT+JX2nZnLsPX2siR/69ggufo76o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-gL_FXBKCPUOOabk1NHyPoQ-1; Tue, 08 Jun 2021 04:22:52 -0400
X-MC-Unique: gL_FXBKCPUOOabk1NHyPoQ-1
Received: by mail-wr1-f69.google.com with SMTP id l13-20020adfe9cd0000b0290119a0645c8fso6120484wrn.8
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 01:22:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EpMpsjqP1j0QTUJCB+E11mmO7+81oKA7pBeilziXJdo=;
        b=M+5+YRugKpTauk6dT8RaPzQw/csCWPMOJzU5jxccM9s6m9YF/MHqAW1LrHqmUpzvXe
         2ijp0oRZvbOdqhSuUyRmRiMYJJN3QetV98O0QY4ZmI0f3npz+lplGtXwkwF5/Oh8ZTxD
         gh43xTtZDlkzpwvSM8N/iwut8sGi/6TCGowH3DT9+UbfM/jrO+a0pOLBPvKseJs60yJU
         UQR+wQ8hoXPGwDt8bCCLAaorc32UI3xw9/bfeWvGZ7isfxOjRr9AtV5n/jENX2I1HSVr
         hR/xLzYnwLlkwlnKHPNjl2qO5o8FcPf2vQ8DOfxKOFIgYeoFnXsa52Ch7wtq16pXZtvd
         673A==
X-Gm-Message-State: AOAM530DILGGSfclc2/KwKssXMsbkx9Kb7m2DO/i/ceEvdiDsH50URZl
	L+JKVBiarvC2ohPgHizdHE4xwIUbKUtLCG9TXcbjEY3YMpVHSZi65JlZ40cSoOK1Ev8TtyOqJ9f
	z9OvENVvsoWoTjS9A
X-Received: by 2002:adf:c392:: with SMTP id p18mr21437282wrf.373.1623140571539;
        Tue, 08 Jun 2021 01:22:51 -0700 (PDT)
X-Received: by 2002:adf:c392:: with SMTP id p18mr21437267wrf.373.1623140571374;
        Tue, 08 Jun 2021 01:22:51 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
        by smtp.gmail.com with ESMTPSA id z12sm20851408wmc.5.2021.06.08.01.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 01:22:50 -0700 (PDT)
Subject: Re: [PATCH v16 04/99] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-5-alex.bennee@linaro.org>
 <d5162188-bea4-24ed-189b-198f9d3ed55d@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <92071d16-3ff1-0274-2e45-59ed7624f358@redhat.com>
Date: Tue, 8 Jun 2021 10:22:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <d5162188-bea4-24ed-189b-198f9d3ed55d@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: RhlCaMcTMZ68

On 6/7/21 3:22 PM, Thomas Huth wrote:
> On 04/06/2021 17.51, Alex Bennée wrote:
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Use the recently added generic qtest_has_accel() method to
>> check if KVM is available.
>>
>> Suggested-by: Claudio Fontana <cfontana@suse.de>
>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20210505125806.1263441-5-philmd@redhat.com>
>> ---
>>   tests/qtest/arm-cpu-features.c | 25 +------------------------
>>   1 file changed, 1 insertion(+), 24 deletions(-)
>>
>> diff --git a/tests/qtest/arm-cpu-features.c
>> b/tests/qtest/arm-cpu-features.c
>> index 8252b85bb8..7f4b252127 100644
>> --- a/tests/qtest/arm-cpu-features.c
>> +++ b/tests/qtest/arm-cpu-features.c
>> @@ -26,21 +26,6 @@
>>                       "  'arguments': { 'type': 'full', "
>>   #define QUERY_TAIL  "}}"
>>   -static bool kvm_enabled(QTestState *qts)
>> -{
>> -    QDict *resp, *qdict;
>> -    bool enabled;
>> -
>> -    resp = qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
>> -    g_assert(qdict_haskey(resp, "return"));
>> -    qdict = qdict_get_qdict(resp, "return");
>> -    g_assert(qdict_haskey(qdict, "enabled"));
>> -    enabled = qdict_get_bool(qdict, "enabled");
>> -    qobject_unref(resp);
>> -
>> -    return enabled;
>> -}
>> -
>>   static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
>>   {
>>       return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
>> @@ -493,14 +478,6 @@ static void
>> test_query_cpu_model_expansion_kvm(const void *data)
>>         qts = qtest_init(MACHINE_KVM "-cpu max");
>>   -    /*
>> -     * These tests target the 'host' CPU type, so KVM must be enabled.
>> -     */
>> -    if (!kvm_enabled(qts)) {
>> -        qtest_quit(qts);
>> -        return;
>> -    }
>> -
>>       /* Enabling and disabling kvm-no-adjvtime should always work. */
>>       assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
>>       assert_set_feature(qts, "host", "kvm-no-adjvtime", true);
>> @@ -624,7 +601,7 @@ int main(int argc, char **argv)
>>        * order avoid attempting to run an AArch32 QEMU with KVM on
>>        * AArch64 hosts. That won't work and isn't easy to detect.
>>        */
>> -    if (g_str_equal(qtest_get_arch(), "aarch64")) {
>> +    if (g_str_equal(qtest_get_arch(), "aarch64") &&
>> qtest_has_accel("kvm")) {
>>           qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
>>                               NULL, test_query_cpu_model_expansion_kvm);
> 
> I think this is wrong: query-kvm checks whether kvm is *enabled*, while
> your new function only checks whether kvm has been built into the
> binary. There is still the possibility that kvm has been built into the
> binary, but is not available on the host, so in that case the test will
> fail now.
> 
> Thus please drop / rework this patch.

Indeed, this is unfortunate :(
