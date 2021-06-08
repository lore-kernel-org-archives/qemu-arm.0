Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4381868lfa;
        Tue, 8 Jun 2021 05:39:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLLTkm/Wt1y62ugHLRkGgfSCHV4q262ohVWD3vyattxivwr4RfU5BtpeaNDZcuG10ChK9v
X-Received: by 2002:a05:6402:3444:: with SMTP id l4mr25969367edc.259.1623155948564;
        Tue, 08 Jun 2021 05:39:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623155948; cv=none;
        d=google.com; s=arc-20160816;
        b=bjBMJR23pjxzToG/IO6oL52DccTzrvgxBJ0s21yL3w39AG1J7G0W6TBA5hm0vrNkyc
         3imAvpfopS0xleNO5nme66DiVLYDKuYyyBToCOi8efbHNXYZmqKG8hASt7E9rDTEcAQK
         sbhMGQrgJ0895glRiAPAByCWsuNLLJfM965HygEiAEG558p8FSCAsS71oOHN1tw3T2LZ
         VpHEKZhtMb/E/GC+BA8Kcr5zZbb5XZc07ATjOmwdRVNx4uzSOWDEpGtfsGhTJNBPEAt3
         b/xlz87H+LOALqmDnfF/bbu3FqXjOyHadm6V+qUvFHVR2tIAUFkOadlLsAXUaKarmP5h
         gj8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=C/Ha0P0JDciacdBK8Vz1Sw31PaRlPh4mfk8EdEBGVEI=;
        b=dn7AB0/U+vqOZlitPc8rUzhnAd+lvc1mRXFR8vsyhkIH1RktiDyyVBaE2khpI2KP99
         kfOvQSQKAJ6J4BZapVvDAHJQ7THGAWJ1VpvemBr5KNx3X3WgxlYOmGdJkEy8+9Ta78Ty
         ygTZLnL0lLn/mKBQzIbjYROMN97YRN8cggg5zhBS/9G7q38ssloGFeYnbd0fECXHYMzR
         fvzq19rvvbZHmW/uaw32PTpg50th85/ahr0sJtLT85YQhtek7FbUQPX9es+Q5srMzHPd
         A7adNdKCHs6GCBnIHqK0uIrLsfuCHaPzpnq36V4N/KF/qm3+OudjLfc8zm6oHRavtu3A
         dolQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d7YhzrCC;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id p3si15435995edq.76.2021.06.08.05.39.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 05:39:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d7YhzrCC;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623155947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C/Ha0P0JDciacdBK8Vz1Sw31PaRlPh4mfk8EdEBGVEI=;
	b=d7YhzrCCPAh/2EFSBRbTnE9YkE6ZTtt5kYoReDwXNr8HdzVkhXGYAjvQIh65qtSp31UcRR
	ygJcIZTly/Tp+KjtbXff8mcdzbUABk/tdABPfplYJ62WVKUaB4I3/43PWtrDB0Ju7vahSk
	E0Pf5NrMjKRwMltGjJ0Tsy2FfpTDXiI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-zgxoYLDrNRuQPcyCbKNzdA-1; Tue, 08 Jun 2021 08:39:05 -0400
X-MC-Unique: zgxoYLDrNRuQPcyCbKNzdA-1
Received: by mail-wm1-f70.google.com with SMTP id f22-20020a1c6a160000b029018f49a7efb7so1195399wmc.1
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 05:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C/Ha0P0JDciacdBK8Vz1Sw31PaRlPh4mfk8EdEBGVEI=;
        b=o7cUmPXf4JUDaGhIVjjmWF0gC83xtESpOBg2m+/vkytVKmbeKjZxRyAasHrG7W9OmU
         MzJC3WvLhf6Jvmq+ftQ0uT4hEbmPh1AuxjMrkpRIm6s9SOSmUhmk6ZzPQ5HhZ4BTVusJ
         aSrktJCMrcxZ4Pu5lSNyCqBNh5p7XbGB69/lFoCz7goebzLS8Sbc5PUK0WutXfx8lGBv
         iWM8OKQcREUM+QsCv5vXD0M+cPBD/hRVvZTOfMINk0lAqIr5gOlgJQ1OzjLQzgjPbLRY
         UkxKFjdnHEmwUXXXJhx7Oo7XZO8NQF5DMdWm/nZYzUHXfG/hZ87oq47xkBQc6Y6DjKFE
         mqpw==
X-Gm-Message-State: AOAM532K3Y4bvWiZyEDKtkqLDpImkBogm3wCnlvcZx3fhDKehPTxkvQj
	U5i3Ki1a4ttezeFVKn0jxGzlnYL5clYL+mBWPZYrqsyISm8vMmZCt9ZjEumUjzzaRij3DwIDrJT
	jm64mgcYHHt8ZCEGn
X-Received: by 2002:adf:ba02:: with SMTP id o2mr3044917wrg.234.1623155944768;
        Tue, 08 Jun 2021 05:39:04 -0700 (PDT)
X-Received: by 2002:adf:ba02:: with SMTP id o2mr3044899wrg.234.1623155944602;
        Tue, 08 Jun 2021 05:39:04 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
        by smtp.gmail.com with ESMTPSA id j34sm12516576wms.7.2021.06.08.05.39.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 05:39:04 -0700 (PDT)
Subject: Re: [PATCH v16 04/99] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Claudio Fontana <cfontana@suse.de>,
 Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-5-alex.bennee@linaro.org>
 <d5162188-bea4-24ed-189b-198f9d3ed55d@redhat.com>
 <92071d16-3ff1-0274-2e45-59ed7624f358@redhat.com>
 <e30516ff-a5f8-6785-3988-daae26dc5151@redhat.com>
Message-ID: <976d1acf-8536-1baa-b5da-c156b0830724@redhat.com>
Date: Tue, 8 Jun 2021 14:39:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e30516ff-a5f8-6785-3988-daae26dc5151@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: G9WHb4TYULPt

On 6/8/21 12:49 PM, Philippe Mathieu-Daudé wrote:
> On 6/8/21 10:22 AM, Philippe Mathieu-Daudé wrote:
>> On 6/7/21 3:22 PM, Thomas Huth wrote:
>>> On 04/06/2021 17.51, Alex Bennée wrote:
>>>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>
>>>> Use the recently added generic qtest_has_accel() method to
>>>> check if KVM is available.
>>>>
>>>> Suggested-by: Claudio Fontana <cfontana@suse.de>
>>>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>> Message-Id: <20210505125806.1263441-5-philmd@redhat.com>
>>>> ---
>>>>   tests/qtest/arm-cpu-features.c | 25 +------------------------
>>>>   1 file changed, 1 insertion(+), 24 deletions(-)
>>>>
>>>> diff --git a/tests/qtest/arm-cpu-features.c
>>>> b/tests/qtest/arm-cpu-features.c
>>>> index 8252b85bb8..7f4b252127 100644
>>>> --- a/tests/qtest/arm-cpu-features.c
>>>> +++ b/tests/qtest/arm-cpu-features.c
>>>> @@ -26,21 +26,6 @@
>>>>                       "  'arguments': { 'type': 'full', "
>>>>   #define QUERY_TAIL  "}}"
>>>>   -static bool kvm_enabled(QTestState *qts)
>>>> -{
>>>> -    QDict *resp, *qdict;
>>>> -    bool enabled;
>>>> -
>>>> -    resp = qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
>>>> -    g_assert(qdict_haskey(resp, "return"));
>>>> -    qdict = qdict_get_qdict(resp, "return");
>>>> -    g_assert(qdict_haskey(qdict, "enabled"));
>>>> -    enabled = qdict_get_bool(qdict, "enabled");
>>>> -    qobject_unref(resp);
>>>> -
>>>> -    return enabled;
>>>> -}
>>>> -
>>>>   static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
>>>>   {
>>>>       return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
>>>> @@ -493,14 +478,6 @@ static void
>>>> test_query_cpu_model_expansion_kvm(const void *data)
>>>>         qts = qtest_init(MACHINE_KVM "-cpu max");
>>>>   -    /*
>>>> -     * These tests target the 'host' CPU type, so KVM must be enabled.
>>>> -     */
>>>> -    if (!kvm_enabled(qts)) {
>>>> -        qtest_quit(qts);
>>>> -        return;
>>>> -    }
>>>> -
>>>>       /* Enabling and disabling kvm-no-adjvtime should always work. */
>>>>       assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
>>>>       assert_set_feature(qts, "host", "kvm-no-adjvtime", true);
>>>> @@ -624,7 +601,7 @@ int main(int argc, char **argv)
>>>>        * order avoid attempting to run an AArch32 QEMU with KVM on
>>>>        * AArch64 hosts. That won't work and isn't easy to detect.
>>>>        */
>>>> -    if (g_str_equal(qtest_get_arch(), "aarch64")) {
>>>> +    if (g_str_equal(qtest_get_arch(), "aarch64") &&
>>>> qtest_has_accel("kvm")) {
>>>>           qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
>>>>                               NULL, test_query_cpu_model_expansion_kvm);
>>>
>>> I think this is wrong: query-kvm checks whether kvm is *enabled*, while
>>> your new function only checks whether kvm has been built into the
>>> binary. There is still the possibility that kvm has been built into the
>>> binary, but is not available on the host, so in that case the test will
>>> fail now.
> 
> Not enough coffee earlier. I think this is a documentation problem,
> query-kvm returns a list of *runtime* accelerators:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg811144.html
> 
> IIUC what Paolo said, if something asks for an accelerator that
> is not present at build-time, then this is a configuration problem,
> not relevant for the management interface.

Argh no... sigh. So we have 4 cases:

1- accelerator not built
2- accelerator built in as module but not loaded
3- accelerator built in & loaded but not usable
4- accelerator built in & loaded and usable

QMP query-accels returns "accelerator built in & loaded"
without precising it is usable.

qtest kvm_enabled() checks if the accelerator is enabled
without checking it is built-in.

QMP query-kvm returns 'present' as in built-in (so case 1),
and 'enabled' (a.k.a. 'allowed') updated once init_machine()
succeeded (so case 4).

So, again, IIUC Paolo, what he said is for the management layer
1 and 2 are the same, the accelerator is not present.

For qtests, we want the 'usable' case (4) right? Whether the
accelerator is builtin / loaded is irrelevant.

Could we improve the terminology here? Maybe is_present() and
is_usable()? Suggestions?

Do we need to add both query-present-accels query-usable-accels
commands? Is it actually possible to return an array of 'usable'
accelerators?

Maybe simply add query-present-accels() -> [] and
query-usable-accel(accel) -> bool.

> 
>>>
>>> Thus please drop / rework this patch.
>>
>> Indeed, this is unfortunate :(
>>
