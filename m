Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC70F01829
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 11:25:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyTIc-00067Z-OU; Fri, 06 Mar 2026 06:24:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vyTIb-00067F-Ai
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 06:24:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vyTIZ-00087Z-Ey
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 06:24:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772796290;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8J+rNbFQAx5jX5lfY9+v3Pzc65niXB7ws+uQZtwz7WM=;
 b=A53+CQN+FNK4VCordtsR9/danURjfdjqYFiCs7bqXYlAgUwqfV5e2CeSO92rtKI3Y61YwG
 jpYrjq0s0QvAByezYE+Ug0ycZ3wo0JSrV9aBt8rZeFaI92ZH4GEpmKk7cCogNUU0xRwoin
 YB14mjxZ/Z0/dkdqgp/7Va+bEdBtO1s=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-8VZlw9E0OsCElQRzm7T1nQ-1; Fri, 06 Mar 2026 06:24:49 -0500
X-MC-Unique: 8VZlw9E0OsCElQRzm7T1nQ-1
X-Mimecast-MFC-AGG-ID: 8VZlw9E0OsCElQRzm7T1nQ_1772796288
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4837cee2e9bso72534015e9.3
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 03:24:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772796288; x=1773401088;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8J+rNbFQAx5jX5lfY9+v3Pzc65niXB7ws+uQZtwz7WM=;
 b=i/qvspzG28BaVWCeR/W0bu8lvLQpy3RCo/UKD9NaspbOzvXoPtOlRVMx7uSRNsweNa
 Nr2PwJy/ynPHNLH/7uko/+9VQsEMf+E97rxGRzWIEP/xAtjjJW0y4wW7rFRdGiXjQ6nt
 V6I/OlFS8sTE4jwHoG53UnbEMvCKoldi/JC5SNYsdVWfe5LSVtMrApmO4U851nQDAnb9
 OedOfQIW600JvELmBw2RvSbHIYH4xHKj160QNvPdmJFRISWJZGlrvwb8PS4UmBVHKMtg
 RX1TX/aIHEc0h72sSxSAqJwzwJ9v2jR8jjV8sBK4dErh1fiSFDWAfAnGlTM4zYa9wCz4
 s2rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUrQHwi0o+wpoD6t/6Pssc+j0XxBgLPBQW/p0sepNQY9qnGK5xG7KgZk9/1smGe3hInBTLLAppwA==@nongnu.org
X-Gm-Message-State: AOJu0YxqtWZ/bQynenxpqqqCp4zh7KFlfl+UyXscTCiLgDNvQeAyhQuz
 BeIoEHPnkwvI/2JRGyUhKM1JWNO3ijlnuDp2ArX3DdkK3jmFxxDGWkUawlgb+ZoBlx0EI5lCd4E
 8WFz+wYuRoz2VvZ+1whgmLEWbiu+uKXuRU8eZqzfEL09KIUktVB1Gjw==
X-Gm-Gg: ATEYQzw6CkNSw5nmPaSeWvNhVa0LcTWeGsZqSivRRAomO6uyPWJB4PtOpzakKalh2qp
 kIlsfHSgwvPOUDCrp0dSOfCmNj5bahmIkzEnxsGFC/G5ZIbdHAO8ziaxQSfC4eW3i3pB7IMERZp
 c8zPZkHHHiv2TZuCTNUk2q2NOdhXZt+OA4wsPg0WfvwKzjHIdYHygFtTtea86T5Ls/foGoR69Gb
 D/9xr4OaAqUeWVh7j3NPA4tJ4MGn9RNQHQokyfRxN1RHheTqyfk6f80G6f5lgR/kh0I2J8OS7Jl
 oTxL9AsRufsZCNLN46q6hsrQfwGU5L15Jw9UvXJfkcvQwJC3QSrtlY59HTDcA2tPYQloQGFUFs0
 C+K07o1+Eyvc4KC579sdBvcVKRrELP+GgS1AMR3Qs7xRo+fPPEZXY8tAF6YnPZx/La0ISlg==
X-Received: by 2002:a05:600c:350f:b0:459:db7b:988e with SMTP id
 5b1f17b1804b1-4852693a59amr29421965e9.13.1772796288398; 
 Fri, 06 Mar 2026 03:24:48 -0800 (PST)
X-Received: by 2002:a05:600c:350f:b0:459:db7b:988e with SMTP id
 5b1f17b1804b1-4852693a59amr29421495e9.13.1772796287970; 
 Fri, 06 Mar 2026 03:24:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb277e3sm100102965e9.10.2026.03.06.03.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 03:24:47 -0800 (PST)
Message-ID: <e60def83-cfeb-4c65-a4c8-44b20f8f17ca@redhat.com>
Date: Fri, 6 Mar 2026 12:24:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] target/arm/machine: Take account cpreg mig
 tolerances in case of mismatch
To: Sebastian Ott <sebott@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, cohuck@redhat.com, peterx@redhat.com,
 philmd@linaro.org, alex.bennee@linaro.org
References: <20260304102249.1963784-1-eric.auger@redhat.com>
 <20260304102249.1963784-3-eric.auger@redhat.com>
 <5ddefbe2-3514-fda2-a933-e2df46b4db89@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <5ddefbe2-3514-fda2-a933-e2df46b4db89@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: an4mxCKhuBrVwzjkAdDgTSLAIU3ngSFpbGl80Yd2pTU_1772796288
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.892, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.622,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 3/6/26 11:51 AM, Sebastian Ott wrote:
> On Wed, 4 Mar 2026, Eric Auger wrote:
>> If there is a mismatch between the cpreg indexes found on both ends,
>> check whether a tolerance was registered for the given kvmidx. If any,
>> silence warning/errors.
>>
>> Create dedicated helper functions that print the name of the culprit reg
>> and analyze whether a tolerance is set. According set the level of
>> traces
>> and analyze whether the migration must eventually fail.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>> target/arm/machine.c    | 30 ++++++++++++++++++++----------
>> target/arm/trace-events |  2 ++
>> 2 files changed, 22 insertions(+), 10 deletions(-)
>>
>> diff --git a/target/arm/machine.c b/target/arm/machine.c
>> index 476dad00ee7..13b8a0b2220 100644
>> --- a/target/arm/machine.c
>> +++ b/target/arm/machine.c
>> @@ -1065,24 +1065,34 @@ static void
>> handle_cpreg_missing_in_incoming_stream(ARMCPU *cpu, uint64_t kvmidx
>> {
>>     g_autofree gchar *name = print_register_name(kvmidx);
>>
>> -    warn_report("%s: %s "
>> -                "expected by the destination but not in the incoming
>> stream: "
>> -                 "skip it", __func__, name);
>> +    if (!arm_cpu_cpreg_has_mig_tolerance(cpu, kvmidx,
>> +                                         0, 0,
>> ToleranceNotOnBothEnds)) {
>
> I don't get this. You apply a different tolerance type than the one
> (potentially) registered. This check will only fail when there was no
> tolerance registered for this kvmidx. But this can be changed by someone
> registering a different type. 

OK so we know the cpreg is missing in the input stream. If there is a
tolerance of type ToleranceNotOnBothEnds for this kvmidx, that's fine,
we just trace and do not report any warning. Otherwise we warn_report
the issue but do not fail.
Does it clarify?

Eric
>
>> +        warn_report("%s: %s "
>> +                    "expected by the destination but not in the
>> incoming stream: "
>> +                     "skip it", __func__, name);
>> +    } else {
>> +        trace_tolerate_cpreg_missing_in_incoming_stream(name);
>> +    }
>> }
>>
>> /*
>> - * Handle the situation where @kvmidx is in the incoming stream
>> - * but not on destination. This currently fails the migration but
>> - * we plan to accomodate some exceptions, hence the boolean returned
>> value.
>> + * Handle the situation where @kvmidx is in the incoming
>> + * stream but not on destination. This fails the migration if
>> + * no cpreg mig tolerance is set for this @kvmidx
>>  */
>> static bool handle_cpreg_only_in_incoming_stream(ARMCPU *cpu,
>> uint64_t kvmidx)
>> {
>>     g_autofree gchar *name = print_register_name(kvmidx);
>> -    bool fail = true;
>> -
>> -    error_report("%s: %s in the incoming stream but unknown on the "
>> -                 "destination: fail migration", __func__, name);
>> +    bool fail = false;
>>
>> +    if (!arm_cpu_cpreg_has_mig_tolerance(cpu, kvmidx,
>> +                                        0, 0,
>> ToleranceNotOnBothEnds)) {
>> +        error_report("%s: %s in the incoming stream but unknown on
>> the "
>> +                     "destination: fail migration", __func__, name);
>> +        fail = true;
>> +    } else {
>> +        trace_tolerate_cpreg_only_in_incoming_stream(name);
>> +    }
>>     return fail;
>> }
>>
>> diff --git a/target/arm/trace-events b/target/arm/trace-events
>> index 2de0406f784..8502fb3265c 100644
>> --- a/target/arm/trace-events
>> +++ b/target/arm/trace-events
>> @@ -29,3 +29,5 @@ arm_psci_call(uint64_t x0, uint64_t x1, uint64_t
>> x2, uint64_t x3, uint32_t cpuid
>>
>> # machine.c
>> cpu_post_load(uint32_t cpreg_vmstate_array_len, uint32_t
>> cpreg_array_len) "cpreg_vmstate_array_len=%d cpreg_array_len=%d"
>> +tolerate_cpreg_missing_in_incoming_stream(char *name) "%s is missing
>> in incoming stream but this is explicitly tolerated"
>> +tolerate_cpreg_only_in_incoming_stream(char *name) "%s is in
>> incoming stream but not on destination but this is explicitly tolerated"
>> -- 
>> 2.53.0
>>
>>
>


