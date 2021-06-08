Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4211250lfa;
        Tue, 8 Jun 2021 01:26:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfQyj/OtV3hxFnMyyIKfTW9EUqXcfJTI3cIx2RKsqKfBwh55gqL3jHOhqaLSiLezPzoTwQ
X-Received: by 2002:a17:907:38c:: with SMTP id ss12mr11754096ejb.401.1623140814590;
        Tue, 08 Jun 2021 01:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623140814; cv=none;
        d=google.com; s=arc-20160816;
        b=q4XXi0Xo9NwOzi4R6MReuWyetMnl7tcsBibxK3B5qoYFuNuqBy9XQg2oxJuUy89hEh
         3YSk5TttX7ScWVmvoP1P8aUnSb27k2fyBClSo+iMGH7XMvj7HxUEFXlRIYHWSDl4FkQM
         lwwPfJT8THpxaOzyk2UH+6c9k1/n7ItlEJYUjRupN85aqEl8ghrIDEIq15NXkJ2hVyI9
         vKHL57n+9qY+oUTkh4cZVMPQipFC9QJ5xsrJH/tdcZ1+1UGF/CFSIT/beZOMecdKUvdV
         eXOLMIFbut2zmut21A3/KTN7PXrJF8yjcrPw7m6zzBlJg/Q9xylBQebCs0bSMY3oIymw
         45Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ynxCAyXC/DIPVtXsx4hI43RJAis9jzz0MNUWv+7fDtA=;
        b=bjQTjUto1AvTqT9k1b9bCV6AfkI0ak/bieKfC/aXV/7dFje///fB5EFdjxpS9fNk4c
         nBtOqgCJTgykxWRUQK7FxS4jVSL56bgJQYUXVDGe2OPAm6fI56IoF4bBrQYAPd7iqhuc
         Dj1Nnsc9V2sAjvQ3mH7+1wrgfoySDwHLvhbCNKOxbOch5YQwN6fB6evzPUqrbtUJQ3mM
         /Be29F3lCCjjY29ACauJKseEVor24VvQLsWfyqN/T52+ssVaTSYeHVyIL4iNuGChZLc/
         SeX/JQ8QREilEd/BHA3GEMHu2INTkXKQh3MdYOApSmQYo0Gcc9vm81pHcgRpC1B0eswo
         0wAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X0DVbWMR;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id y3si15445908edp.547.2021.06.08.01.26.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 01:26:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=X0DVbWMR;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623140813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ynxCAyXC/DIPVtXsx4hI43RJAis9jzz0MNUWv+7fDtA=;
	b=X0DVbWMRQUQDvz8kc0vA0i7/7wOo6TIp6qizZtf6x2aTuxfb0qMyuGHMEmPpQ5Nd8rUwQh
	Cp1iNeMnQg1ZvkngB1bV1JUnvUczenD4/p74S/1/I0BJ6JJM3+oI6iz4CCF/JEsIkQwMi8
	QC5PG0Ps3EXm/2h10cVALKEbutJJ8Rw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-303-2HqyK-PgOEeiRUsE6kgYaw-1; Tue, 08 Jun 2021 04:26:52 -0400
X-MC-Unique: 2HqyK-PgOEeiRUsE6kgYaw-1
Received: by mail-wr1-f70.google.com with SMTP id x9-20020adfffc90000b02901178add5f60so9114484wrs.5
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 01:26:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ynxCAyXC/DIPVtXsx4hI43RJAis9jzz0MNUWv+7fDtA=;
        b=LAu0xJ4Jd5ySJ3yTmlDSedbxbhD30t80ScPqiTQsZNtq3edgozELBTWwk4w/NpuUoG
         1MrKpNMwAwmrWXWcu//O9w2BaDVfKuSDJMU48fBD5gqWLSGjqp6Da1QnViiD4BxDueWF
         LPd0DrK5ezLwOc4qRoCPGUaKSAEu6D/DPB6KLWrcWOTZ12ozeWVxfSQnmVo7reX9AYTJ
         2tCt0JiAuXGmv2icpivzmc+loHvh7KypwNQWt1br+Ym1zjiX3YYtXw9IkOQJtBzx6KcR
         M81YvLRXudeN82XLfT/TPXI0aSIp8BP0+5s8Sf8DtitroTqIdIa9brXvVZYNVyce2Zyv
         Qzww==
X-Gm-Message-State: AOAM532aF8SLhQriUkYZC4JJ2ri2DInxjgEHKyRhsPZaNus4KwgxcdO6
	jBExbyHycDHZLOQFhivfqs7M+sLJs4AlJAt/r7UfIDh3hx0bFOuVunwvJupIx21zN8OpL0dOHSE
	Z/7iakJ1J0zL6nEC9
X-Received: by 2002:a05:6000:154e:: with SMTP id 14mr14536260wry.305.1623140811286;
        Tue, 08 Jun 2021 01:26:51 -0700 (PDT)
X-Received: by 2002:a05:6000:154e:: with SMTP id 14mr14536243wry.305.1623140811159;
        Tue, 08 Jun 2021 01:26:51 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
        by smtp.gmail.com with ESMTPSA id l10sm18739792wrm.2.2021.06.08.01.26.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 01:26:50 -0700 (PDT)
Subject: Re: [PATCH v16 08/99] qtest/migration-test: Skip tests if KVM not
 builtin on s390x/ppc64
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Greg Kurz <groug@kaod.org>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-9-alex.bennee@linaro.org>
 <115f0f77-96e9-7eb1-c22f-d7dd0114d8a8@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <6765a53a-e69a-c3bd-8059-bc530314eaa7@redhat.com>
Date: Tue, 8 Jun 2021 10:26:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <115f0f77-96e9-7eb1-c22f-d7dd0114d8a8@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: kFblCSB0rGlN

On 6/4/21 11:11 PM, Richard Henderson wrote:
> On 6/4/21 8:51 AM, Alex Bennée wrote:
>>       if (g_str_equal(qtest_get_arch(), "ppc64") &&
>>           (access("/sys/module/kvm_hv", F_OK) ||
>> -         access("/dev/kvm", R_OK | W_OK))) {
>> +         access("/dev/kvm", R_OK | W_OK) || !qtest_has_accel("kvm"))) {
>>           g_test_message("Skipping test: kvm_hv not available");
>>           return g_test_run();
>>       }
>> @@ -1398,7 +1398,7 @@ int main(int argc, char **argv)
>>        */
>>       if (g_str_equal(qtest_get_arch(), "s390x")) {
>>   #if defined(HOST_S390X)
>> -        if (access("/dev/kvm", R_OK | W_OK)) {
>> +        if (access("/dev/kvm", R_OK | W_OK) ||
>> !qtest_has_accel("kvm")) {
>>               g_test_message("Skipping test: kvm not available");
> 
> I would have sorted the kvm test first.

access() is a simple syscall from the qtest, while qtest_has_accel()
spawn a whole QEMU process to exec the QMP request.

> For s390x, we has the HOST test, but ppc doesn't.  So we're doing the
> access() on any host, e.g. x86_64, where kvm cannot true for this test.

Hmm I suppose the issue you described predate this patch?
