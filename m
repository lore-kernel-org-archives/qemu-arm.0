Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4638400lfa;
        Tue, 8 Jun 2021 10:20:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCEyeCI4G7AzUlz0fiIj3u9nHzxsiIpEyWDz/8BNbQnXUhUpET5Cqa/pwzis4cxBkCca+W
X-Received: by 2002:adf:ba07:: with SMTP id o7mr20135206wrg.160.1623172837008;
        Tue, 08 Jun 2021 10:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623172837; cv=none;
        d=google.com; s=arc-20160816;
        b=YKcwL2A1ldMJuGEfhTBMbCWPG+FWZKvge+0wpwuc975K9qdzMe6qTh/XenExtJm3DM
         ZpymSf08tP9xrpdbjKwPGaz8v547vIFqMEbjbS3GrIZtbNtDaMFvX1DPTT5gtd5J+h6m
         mUgGs0RYAslZGjOFHOcpQWsvvMni6vxFbjSEOXsr8rHz+TyFsGAx/olxdvq8uI8A1Bug
         zhEzKvNl3HxAG817XObYdLCaowyFNXP/hFHq/A6v5lQss0Eb5F1TcBeH5SOhKLgMG+nh
         SUX3rR+ZJ9D4aHcXeINurJaMYpKet5uuijPV2quSEpL3VHiZbDVeVdxEQdIgc69y+6vB
         tXKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:dkim-signature:dkim-signature:dkim-signature;
        bh=E0wjZp6qwOdS0AS0uCZsELS10rs5SxlujA4M04dPb0M=;
        b=njZ6+kpiKWzzdwlA5ZY8VEnweXcqFxTIFhX49PZW6c94j777GR1Jy33ZlAVamdBVZU
         08ApORRbpf0dLoMsOh+xnEsKTuvvU+Ujlu0VA9U3go65SlSELmgKrYbYtufMlKe2Adht
         a3Xk5gjlkxSXSg+zITewydYYjy6Xid8GfbGVT+0cZNcfFci9KtIoQg0lpTQk9/8b2eOr
         WLuNH2OwlGTLMwqx+F1gXC1eHtr/6h0g6d+HM1JN+CRUm8XY2jfX05gWJPGT2wDMHxRI
         +etTJm3HZEL/6mYvCGbo+ci+afxKpawMUtOlJwz5K/mH4BreD+0ukKgmW66IdLoevIpE
         sb9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=MZGjq7iw;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=bQTAFPOh;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=MZGjq7iw;
       dkim=neutral (no key) header.i=@suse.de header.b=bQTAFPOh;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=cfontana@suse.de
Return-Path: <cfontana@suse.de>
Received: from smtp-out2.suse.de (smtp-out2.suse.de. [195.135.220.29])
        by mx.google.com with ESMTPS id 6si3453202wmo.51.2021.06.08.10.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 10:20:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) client-ip=195.135.220.29;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=MZGjq7iw;
       dkim=neutral (no key) header.i=@suse.de header.s=susede2_ed25519 header.b=bQTAFPOh;
       dkim=pass header.i=@suse.de header.s=susede2_rsa header.b=MZGjq7iw;
       dkim=neutral (no key) header.i=@suse.de header.b=bQTAFPOh;
       spf=pass (google.com: domain of cfontana@suse.de designates 195.135.220.29 as permitted sender) smtp.mailfrom=cfontana@suse.de
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 731651FD33;
	Tue,  8 Jun 2021 17:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1623172836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E0wjZp6qwOdS0AS0uCZsELS10rs5SxlujA4M04dPb0M=;
	b=MZGjq7iwCfQ1JUXL6vt/hjgEyuB2s0JYElHnlO5BnoSTCzBgq1687NyoqkQEv793OkTcJJ
	F7bZWwXZoZfJ2tzSuq4wXOanlIMZtixvsyFdXzdE9eWmdQDDSRffG/VZIq5Cl9aAFV7XiQ
	0O+/nfQpSCQfAJhnZlryYxW0ELFXuAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1623172836;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E0wjZp6qwOdS0AS0uCZsELS10rs5SxlujA4M04dPb0M=;
	b=bQTAFPOh/nrEtX+C7JYAzw/FphmifLUtLJKYNwKoQh5CuXPbi484Z0NdqN75ScxU6ktWAU
	hu6fJVmTKre9ZHAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
	by imap.suse.de (Postfix) with ESMTP id 13217118DD;
	Tue,  8 Jun 2021 17:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1623172836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E0wjZp6qwOdS0AS0uCZsELS10rs5SxlujA4M04dPb0M=;
	b=MZGjq7iwCfQ1JUXL6vt/hjgEyuB2s0JYElHnlO5BnoSTCzBgq1687NyoqkQEv793OkTcJJ
	F7bZWwXZoZfJ2tzSuq4wXOanlIMZtixvsyFdXzdE9eWmdQDDSRffG/VZIq5Cl9aAFV7XiQ
	0O+/nfQpSCQfAJhnZlryYxW0ELFXuAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1623172836;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E0wjZp6qwOdS0AS0uCZsELS10rs5SxlujA4M04dPb0M=;
	b=bQTAFPOh/nrEtX+C7JYAzw/FphmifLUtLJKYNwKoQh5CuXPbi484Z0NdqN75ScxU6ktWAU
	hu6fJVmTKre9ZHAg==
Received: from director2.suse.de ([192.168.254.72])
	by imap3-int with ESMTPSA
	id TAeyAuSmv2AwbgAALh3uQQ
	(envelope-from <cfontana@suse.de>); Tue, 08 Jun 2021 17:20:36 +0000
Subject: Re: [PATCH v16 04/99] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, =?UTF-8?Q?Jos=c3=a9_Ricardo_Ziviani?=
 <jose.ziviani@suse.com>, Jim Fehlig <jfehlig@suse.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-5-alex.bennee@linaro.org>
 <d5162188-bea4-24ed-189b-198f9d3ed55d@redhat.com>
 <92071d16-3ff1-0274-2e45-59ed7624f358@redhat.com>
 <e30516ff-a5f8-6785-3988-daae26dc5151@redhat.com>
 <976d1acf-8536-1baa-b5da-c156b0830724@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <7a261d08-b9f2-4caf-1a66-3d9e01488ff5@suse.de>
Date: Tue, 8 Jun 2021 19:20:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <976d1acf-8536-1baa-b5da-c156b0830724@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: HVnw7YoIp6Ta

On 6/8/21 2:39 PM, Philippe Mathieu-Daudé wrote:
> On 6/8/21 12:49 PM, Philippe Mathieu-Daudé wrote:
>> On 6/8/21 10:22 AM, Philippe Mathieu-Daudé wrote:
>>> On 6/7/21 3:22 PM, Thomas Huth wrote:
>>>> On 04/06/2021 17.51, Alex Bennée wrote:
>>>>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>>
>>>>> Use the recently added generic qtest_has_accel() method to
>>>>> check if KVM is available.
>>>>>
>>>>> Suggested-by: Claudio Fontana <cfontana@suse.de>
>>>>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> Message-Id: <20210505125806.1263441-5-philmd@redhat.com>
>>>>> ---
>>>>>   tests/qtest/arm-cpu-features.c | 25 +------------------------
>>>>>   1 file changed, 1 insertion(+), 24 deletions(-)
>>>>>
>>>>> diff --git a/tests/qtest/arm-cpu-features.c
>>>>> b/tests/qtest/arm-cpu-features.c
>>>>> index 8252b85bb8..7f4b252127 100644
>>>>> --- a/tests/qtest/arm-cpu-features.c
>>>>> +++ b/tests/qtest/arm-cpu-features.c
>>>>> @@ -26,21 +26,6 @@
>>>>>                       "  'arguments': { 'type': 'full', "
>>>>>   #define QUERY_TAIL  "}}"
>>>>>   -static bool kvm_enabled(QTestState *qts)
>>>>> -{
>>>>> -    QDict *resp, *qdict;
>>>>> -    bool enabled;
>>>>> -
>>>>> -    resp = qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
>>>>> -    g_assert(qdict_haskey(resp, "return"));
>>>>> -    qdict = qdict_get_qdict(resp, "return");
>>>>> -    g_assert(qdict_haskey(qdict, "enabled"));
>>>>> -    enabled = qdict_get_bool(qdict, "enabled");
>>>>> -    qobject_unref(resp);
>>>>> -
>>>>> -    return enabled;
>>>>> -}
>>>>> -
>>>>>   static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
>>>>>   {
>>>>>       return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
>>>>> @@ -493,14 +478,6 @@ static void
>>>>> test_query_cpu_model_expansion_kvm(const void *data)
>>>>>         qts = qtest_init(MACHINE_KVM "-cpu max");
>>>>>   -    /*
>>>>> -     * These tests target the 'host' CPU type, so KVM must be enabled.
>>>>> -     */
>>>>> -    if (!kvm_enabled(qts)) {
>>>>> -        qtest_quit(qts);
>>>>> -        return;
>>>>> -    }
>>>>> -
>>>>>       /* Enabling and disabling kvm-no-adjvtime should always work. */
>>>>>       assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
>>>>>       assert_set_feature(qts, "host", "kvm-no-adjvtime", true);
>>>>> @@ -624,7 +601,7 @@ int main(int argc, char **argv)
>>>>>        * order avoid attempting to run an AArch32 QEMU with KVM on
>>>>>        * AArch64 hosts. That won't work and isn't easy to detect.
>>>>>        */
>>>>> -    if (g_str_equal(qtest_get_arch(), "aarch64")) {
>>>>> +    if (g_str_equal(qtest_get_arch(), "aarch64") &&
>>>>> qtest_has_accel("kvm")) {
>>>>>           qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
>>>>>                               NULL, test_query_cpu_model_expansion_kvm);
>>>>
>>>> I think this is wrong: query-kvm checks whether kvm is *enabled*, while
>>>> your new function only checks whether kvm has been built into the
>>>> binary. There is still the possibility that kvm has been built into the
>>>> binary, but is not available on the host, so in that case the test will
>>>> fail now.
>>
>> Not enough coffee earlier. I think this is a documentation problem,
>> query-kvm returns a list of *runtime* accelerators:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg811144.html
>>
>> IIUC what Paolo said, if something asks for an accelerator that
>> is not present at build-time, then this is a configuration problem,
>> not relevant for the management interface.
> 
> Argh no... sigh. So we have 4 cases:
> 
> 1- accelerator not built
> 2- accelerator built in as module but not loaded
> 3- accelerator built in & loaded but not usable
> 4- accelerator built in & loaded and usable
> 
> QMP query-accels returns "accelerator built in & loaded"
> without precising it is usable.
> 
> qtest kvm_enabled() checks if the accelerator is enabled
> without checking it is built-in.
> 
> QMP query-kvm returns 'present' as in built-in (so case 1),
> and 'enabled' (a.k.a. 'allowed') updated once init_machine()
> succeeded (so case 4).
> 
> So, again, IIUC Paolo, what he said is for the management layer
> 1 and 2 are the same, the accelerator is not present.
> 
> For qtests, we want the 'usable' case (4) right? Whether the
> accelerator is builtin / loaded is irrelevant.
> 
> Could we improve the terminology here? Maybe is_present() and
> is_usable()? Suggestions?


Let me try some terms:

1 - bool accelerator_built()      ->   accelerator has been part of this QEMU build.
2 - bool accelerator_loaded()     ->   accelerator has been loaded, either because it is built-in, or because its code has been dynamically loaded

and probably the management layers do not care about the distinction between 1, 2.

Maybe instead of "usable", "available" is better?

3 - bool accelerator_available()

Then we have the accelerator that is actually active, selected or chosen.

4 - bool accelerator_enabled()? bool accelerator_active()? bool accelerator_chosen()? bool accelerator_used()?

We already use the term "allowed", with different meaning and implementations depending on --enable-xxx,
which is quite confusing I think..


Ciao,

Claudoi


> 
> Do we need to add both query-present-accels query-usable-accels
> commands? Is it actually possible to return an array of 'usable'
> accelerators?
> 
> Maybe simply add query-present-accels() -> [] and
> query-usable-accel(accel) -> bool.
> 
>>
>>>>
>>>> Thus please drop / rework this patch.
>>>
>>> Indeed, this is unfortunate :(
>>>
> 
