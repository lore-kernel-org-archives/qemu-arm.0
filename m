Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4300137lfa;
        Tue, 8 Jun 2021 03:49:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJytQu7biwPbAEkW0eRPVY0jpUTehGiKe04PH7ArRVFrqAdpNzvYRSBZJXlg0anQpABDTUPI
X-Received: by 2002:a05:6402:1d06:: with SMTP id dg6mr23983283edb.132.1623149374123;
        Tue, 08 Jun 2021 03:49:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623149374; cv=none;
        d=google.com; s=arc-20160816;
        b=oc3SbAejsdiMSLz9NYyLPS3hkKTYp4AmwEbDpCUwa/izo+tMFs0XX7FL5L8XQ4o0vd
         /qqy/sY84Oez6VIumBYIfkAZ3OrzXXZLHTRE3gCapK36N9iN8/DtwNeJMJbw2JU12X/W
         8l4ZroryhT2DVDNN4FKF2kXgq4+/gCMVIdha7kiOtolQ2NYHBouHPZjNmoLmWWB4TOSa
         rlYzrbYmtNF5J6L08PBv6N4HLVKSZMiw/ugjg4r17GKKGpGD+DgRYWzD/StYoFxv0/oh
         17OD9CYAWMmVptzHM5zrTc/46U6JSHsE4J8Wrg8tHIk4zCVtb4tQbyDuPPsFRnGIsoBF
         hTuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject
         :dkim-signature;
        bh=4UnEbZoB48/Zk90/ghH7aPTObjTukiLHu2UBAiU6Fcs=;
        b=zcU1Cv9hQ2II9zRxcAPCsCCvR/0HwbVadmSdtKJ75r1cD5rPf3dqQFiCcw3q40T4t2
         kHiphLj6YWvocjmHmcPLtk9kxgNdarKqx4wW3oHaV+BaQt6/+nrNzQU9iyNcLF37n7Sx
         2yXJDcJ+cLZCYg5ukM2G3B1riCDFOLEPDjZu+4nzsCuZR0AX3NVc91aOiXf1FGzPWJta
         DaLHLUujjRYmp+Ds5Fuy2ncHvdCTW5qzUqxA7YCRRlpY+eKC6VszN1lGqewD2EaUDlsO
         TDuuzDt/v5rxSGXQv+RFYdK7Zrj4iQLELrryD5MjXt4K2AqhXuWeR1xNIHQZVl9awSEU
         fMvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gTeNIfS2;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id m25si15558539edr.588.2021.06.08.03.49.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 03:49:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gTeNIfS2;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623149373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4UnEbZoB48/Zk90/ghH7aPTObjTukiLHu2UBAiU6Fcs=;
	b=gTeNIfS2q4fQatUGsDEXvD6wyxsB4F2VMxT6rzQMr7vAhuWqoFdSzNvkJNCHvf1FF4hBqn
	9UMlSLmtkQZ/Ebdgz9zR+x6Gem+7MeZatwdt2xwGzj9PXZ4sTQ5XdfSR/zKRLJ3gsgZbUh
	Z+nFWLVTFBv8k1nKlA2UgprNRNVJD7I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-xiFu5sGgM-SRH0DIu3zJQA-1; Tue, 08 Jun 2021 06:49:31 -0400
X-MC-Unique: xiFu5sGgM-SRH0DIu3zJQA-1
Received: by mail-wm1-f69.google.com with SMTP id a25-20020a7bc1d90000b029019dd2ac7025so591799wmj.1
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 03:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4UnEbZoB48/Zk90/ghH7aPTObjTukiLHu2UBAiU6Fcs=;
        b=m1QbC2EWuff59VdrRlxQ010XSWWD4tsHHem+l0Hs0n7FEYswwVj3cFJ3U/6kyDRBK6
         fqwyv4Cz9dT4tTq9epHjMfjpL5R+mqcdcchLPuvlfra9HfC7uwdiy8DYvM/A9h2gCL2q
         gcXOCS4ZqtTqMGnVJ9DQJ/Z6Jznr761ZK7L5I4KknQBGqvt/wT4S18VjYJRxIHs6QN+v
         VKB2ntdmwRQSg9hNhq1xC/Jwcw63aVuFO0IJICl3BuNF1kI4hvOByuJVdD4a7XcGoqkY
         Ro6wtLErXtDfsW80xDEYzEUVG4SGSAlAgwjt0R+Zxh6dRjzDYMEB55qEuCJHVCV544Ir
         eDOQ==
X-Gm-Message-State: AOAM533UFRG3MXA1ZpPQRoFIF6Br8NuQkMgrOAboUjruG88bC6E7nO20
	x5rzDyKBwQSPh3XEn9KJiNqcAyN+XSgkimZL9iUFh/M8aEJK4yS0UvDPovI/mztQyW27Qn3B1ng
	GKzEMlf9/e3ecTcFM
X-Received: by 2002:adf:9031:: with SMTP id h46mr22436164wrh.125.1623149369879;
        Tue, 08 Jun 2021 03:49:29 -0700 (PDT)
X-Received: by 2002:adf:9031:: with SMTP id h46mr22436151wrh.125.1623149369741;
        Tue, 08 Jun 2021 03:49:29 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
        by smtp.gmail.com with ESMTPSA id x7sm21605130wre.8.2021.06.08.03.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 03:49:29 -0700 (PDT)
Subject: Re: [PATCH v16 04/99] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Andrew Jones <drjones@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-5-alex.bennee@linaro.org>
 <d5162188-bea4-24ed-189b-198f9d3ed55d@redhat.com>
 <92071d16-3ff1-0274-2e45-59ed7624f358@redhat.com>
Message-ID: <e30516ff-a5f8-6785-3988-daae26dc5151@redhat.com>
Date: Tue, 8 Jun 2021 12:49:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <92071d16-3ff1-0274-2e45-59ed7624f358@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: SeREE7xywu/U

On 6/8/21 10:22 AM, Philippe Mathieu-Daudé wrote:
> On 6/7/21 3:22 PM, Thomas Huth wrote:
>> On 04/06/2021 17.51, Alex Bennée wrote:
>>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>
>>> Use the recently added generic qtest_has_accel() method to
>>> check if KVM is available.
>>>
>>> Suggested-by: Claudio Fontana <cfontana@suse.de>
>>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>> Message-Id: <20210505125806.1263441-5-philmd@redhat.com>
>>> ---
>>>   tests/qtest/arm-cpu-features.c | 25 +------------------------
>>>   1 file changed, 1 insertion(+), 24 deletions(-)
>>>
>>> diff --git a/tests/qtest/arm-cpu-features.c
>>> b/tests/qtest/arm-cpu-features.c
>>> index 8252b85bb8..7f4b252127 100644
>>> --- a/tests/qtest/arm-cpu-features.c
>>> +++ b/tests/qtest/arm-cpu-features.c
>>> @@ -26,21 +26,6 @@
>>>                       "  'arguments': { 'type': 'full', "
>>>   #define QUERY_TAIL  "}}"
>>>   -static bool kvm_enabled(QTestState *qts)
>>> -{
>>> -    QDict *resp, *qdict;
>>> -    bool enabled;
>>> -
>>> -    resp = qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
>>> -    g_assert(qdict_haskey(resp, "return"));
>>> -    qdict = qdict_get_qdict(resp, "return");
>>> -    g_assert(qdict_haskey(qdict, "enabled"));
>>> -    enabled = qdict_get_bool(qdict, "enabled");
>>> -    qobject_unref(resp);
>>> -
>>> -    return enabled;
>>> -}
>>> -
>>>   static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
>>>   {
>>>       return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
>>> @@ -493,14 +478,6 @@ static void
>>> test_query_cpu_model_expansion_kvm(const void *data)
>>>         qts = qtest_init(MACHINE_KVM "-cpu max");
>>>   -    /*
>>> -     * These tests target the 'host' CPU type, so KVM must be enabled.
>>> -     */
>>> -    if (!kvm_enabled(qts)) {
>>> -        qtest_quit(qts);
>>> -        return;
>>> -    }
>>> -
>>>       /* Enabling and disabling kvm-no-adjvtime should always work. */
>>>       assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
>>>       assert_set_feature(qts, "host", "kvm-no-adjvtime", true);
>>> @@ -624,7 +601,7 @@ int main(int argc, char **argv)
>>>        * order avoid attempting to run an AArch32 QEMU with KVM on
>>>        * AArch64 hosts. That won't work and isn't easy to detect.
>>>        */
>>> -    if (g_str_equal(qtest_get_arch(), "aarch64")) {
>>> +    if (g_str_equal(qtest_get_arch(), "aarch64") &&
>>> qtest_has_accel("kvm")) {
>>>           qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
>>>                               NULL, test_query_cpu_model_expansion_kvm);
>>
>> I think this is wrong: query-kvm checks whether kvm is *enabled*, while
>> your new function only checks whether kvm has been built into the
>> binary. There is still the possibility that kvm has been built into the
>> binary, but is not available on the host, so in that case the test will
>> fail now.

Not enough coffee earlier. I think this is a documentation problem,
query-kvm returns a list of *runtime* accelerators:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg811144.html

IIUC what Paolo said, if something asks for an accelerator that
is not present at build-time, then this is a configuration problem,
not relevant for the management interface.

>>
>> Thus please drop / rework this patch.
> 
> Indeed, this is unfortunate :(
>
