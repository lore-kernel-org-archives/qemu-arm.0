Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27338C5DF85
	for <qemu-arm@archiver.kernel.org>; Thu, 20 Aug 2026 16:02:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wx5CT-0000ru-Dz; Thu, 20 Aug 2026 12:01:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wx5CR-0000o3-VE
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 12:01:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wx5CP-0001TK-Qa
 for qemu-arm@nongnu.org; Thu, 20 Aug 2026 12:01:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1787241660;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bfcVWwh/y440qFMJt0bsGIXtJnzC4KlT0imLo1y60K4=;
 b=hlRN+GTOBkUulDRwHr9vj2tb2Fe5hR315Ism3m0jeguzmHLPB/02yJFqkOt9IDOGSceXJP
 ojsqOsbSmS51gNZVigUkUOqisuJQxuBNNur8oZUZuiQTOaEiHm16Yi6nKu3mb1inNZPDcz
 bb7qTi5Cn+NAYEY+2ew5LQC6nFfGrlk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-1c2fUw0yPtSw3O60L69OnQ-1; Thu, 20 Aug 2026 12:00:59 -0400
X-MC-Unique: 1c2fUw0yPtSw3O60L69OnQ-1
X-Mimecast-MFC-AGG-ID: 1c2fUw0yPtSw3O60L69OnQ_1787241658
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4997b060af8so13972775e9.1
 for <qemu-arm@nongnu.org>; Thu, 20 Aug 2026 09:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787241658; x=1787846458;
 h=content-transfer-encoding:content-type:in-reply-to:from:references
 :cc:to:content-language:subject:reply-to:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=bfcVWwh/y440qFMJt0bsGIXtJnzC4KlT0imLo1y60K4=;
 b=CSfgiLTb3S3Gmj55Ujxf8S/6BxhBhbhreo88OlSVRPNb7JEqFQGGWZU9Z3BwelSomU
 NY1ThNFDQmx3fFDMw6SZGkNFL401NeQkyw2qpaQ1Vt/rWprOOSqbLR3hnQGslt2DMtr/
 /kis9w7Jkkk2YO9TtX09ftZ8irWsx0YUxNXISJzq4sPwv5rBBHk9MfWNpIbIoEwzGius
 WueUqvufKzln6MtcaiGYdQa5d7vnuNFB1CMgzPiWj5LTG0UoQb5V1ABTPVdVQ984bafK
 ZgEYNq1Y3mPgphgX1c4FXeZlf7BBvqutKu4bwptWrh+2kRufhnH8MiX8ZKS+slqwFC65
 sFtA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrTijZZUB3lwMHp497jTp/gUrSsWg6QoWW7Uo4/2Y21yrOFNRcNtLzvloH0uNNjh4oEt+fZG8khNg==@nongnu.org
X-Gm-Message-State: AOJu0YzSuXM88AnjO4twk9reAoJgKIPQvpCcj/wKD9P7lX9zVGUANe2z
 ehCZTMiA50n4/d4VD2dRwch9AQ4VY2Q8Ul0jSKN9uUEV9dPlKTazI6kwJR6HUArbXiusGJNKT+m
 ApGDJSPwEAnVcbCnfR1GgbIu7z3bmT/UBkSjv9DY4eYJgnMh3l2nLAQ==
X-Gm-Gg: AR+sD10/iyNrlvDViK/mlPBMALOcY8ttHe9NPaMtCJ252MNGYhu5OUvj+/+tPuIe1ci
 +5XiLgpKaOacFjwUAB3mIqFoopHICrpS/dlpraUxiqqGNpFa6KtsblToR09OZRPPLuC0u8DPRgk
 csn2oEQykFOxTsZzQvNBVW9bCVotH/hSQ6yv167q/arihqxE2TfxobnlH0H0ys267O+pkNrwseO
 djXIW27ZIondNcGnNa0YeKC2Tjn3g2qJtQ8GLezDbZHw9zm3/rdMqGvS5Yozy5SBaRkAaRUkvqA
 MboAh87a4xdzzKPC2MBvKCYmPoGe6tD6VnqJZzKs1mTPaSblaHEvWhr1cbjBWcFK33lJaAFWsdX
 hSVhIxhq6Pw6rSVsE+oaBYUE5/dNeK3oe4pNjPttKPBX9qFng
X-Received: by 2002:a05:600c:8b62:b0:499:a6ae:20a1 with SMTP id
 5b1f17b1804b1-499aa1dc5b6mr266872235e9.14.1787241657715; 
 Thu, 20 Aug 2026 09:00:57 -0700 (PDT)
X-Received: by 2002:a05:600c:8b62:b0:499:a6ae:20a1 with SMTP id
 5b1f17b1804b1-499aa1dc5b6mr266870255e9.14.1787241657090; 
 Thu, 20 Aug 2026 09:00:57 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa0fda98sm231359415e9.1.2026.08.20.09.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2026 09:00:56 -0700 (PDT)
Message-ID: <4d45766a-f0f5-4e59-b1ca-cf8d5b039a80@redhat.com>
Date: Thu, 20 Aug 2026 18:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 16/19] qmp: add query-cpu-props-info command
To: Khushit Shah <khushit.shah@nutanix.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>,
 "gshan@redhat.com" <gshan@redhat.com>,
 "skolothumtho@nvidia.com" <skolothumtho@nvidia.com>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "philmd@linaro.org" <philmd@linaro.org>,
 "yangjinqian1@huawei.com" <yangjinqian1@huawei.com>,
 Shaju Abraham <shaju.abraham@nutanix.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>,
 Prerna Saxena <prerna.saxena@nutanix.com>
References: <20260716213858.609699-1-khushit.shah@nutanix.com>
 <20260716213858.609699-17-khushit.shah@nutanix.com>
 <87y0f5u78t.fsf@pond.sub.org>
 <6AA3BD42-9596-476B-9F64-AB09372821B9@nutanix.com>
 <87tspa5skn.fsf@pond.sub.org>
 <FD805FA0-9323-450C-9D79-319C0883F05E@nutanix.com>
 <FDD5760F-94E6-46F4-AC62-AB0DC98322FD@nutanix.com>
 <8733wu5qfs.fsf@pond.sub.org>
 <08DA9B28-D5BD-4EC3-8182-FEE212F0C2A0@nutanix.com>
 <871pcd12bf.fsf@pond.sub.org>
 <5F6481F1-B5E1-4B30-A4D1-481D9C0731AC@nutanix.com>
 <87o6fgzopu.fsf@pond.sub.org>
 <7B2898F0-DA7A-4DFD-A2CB-997833A47A05@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <7B2898F0-DA7A-4DFD-A2CB-997833A47A05@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EHQCivuf36zz_Bs0i_k89uedL7qi1emjNHO7nPkUpPk_1787241658
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.346,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 8/6/26 11:24 AM, Khushit Shah wrote:
>
>> On 5 Aug 2026, at 6:52 PM, Markus Armbruster <armbru@redhat.com> wrote:
>>
>> !-------------------------------------------------------------------|
>>  CAUTION: External Email
>>
>> |-------------------------------------------------------------------!
>>
>> Khushit Shah <khushit.shah@nutanix.com> writes:
>>
>>>> On 5 Aug 2026, at 12:28 PM, Markus Armbruster <armbru@redhat.com> wrote:
>>>>
>>>> !-------------------------------------------------------------------|
>>>> CAUTION: External Email
>>>>
>>>> |-------------------------------------------------------------------!
>>>>
>>>> Khushit Shah <khushit.shah@nutanix.com> writes:
>>>>
>>>>>> On 4 Aug 2026, at 12:21 PM, Markus Armbruster <armbru@redhat.com> wrote:
>>>>>>
>>>>>> !-------------------------------------------------------------------|
>>>>>> CAUTION: External Email
>>>>>>
>>>>>> |-------------------------------------------------------------------!
>>>>>>
>>>>>> Khushit Shah <khushit.shah@nutanix.com> writes:
>>>>>>
>>>>>> [...]
>>>>>>
>>>>>>> Stub file was missing on arm user builds. 
>>>>>>>
>>>>>>> I have fixed this on the private branch if you want to take a look.
>>>>>> I'm willing to pull an update to v3, assuming it's a small fix.
>>>>> It is a small fix :)
>>>> Please tell me what to pull.  When you're ready, of course.
>>> It’s on the same private branch: https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_khushit-2Dshah-2Dnx_qemu_tree_upstream-2Drfc-2Dv3-2Dfixups&d=DwIFaQ&c=s883GpUCOChKOHiocYtGcg&r=PGWMyignA0NiDmTlyP7vOTHozBws_VN86yrVmSMkBp0&m=lv46ybodStjAtdapjMwLnohED9-uQST3KdkvwYej9yhiKYNrRdzDyHjeuYqUxdyg&s=7IbcSv1pGL29PTHAOxj2lZWr2tySQeQqB88qHxlTpvE&e=
>> Builds, but fails "make check" on my box *sigh*.
>>
>> tests/qtest/qmp-cmd-test.c needs an update.
> :’)
>
> Fixed it, available on: 
> https://github.com/khushit-shah-nx/qemu/tree/upstream-rfc-v3-fixups
>
> On my machine, qemu:qtest+qtest-aarch64 / qtest-aarch64/device-introspect-test
> still fails. (It will likely not fail for you if you are on (arm + kvm or any
> other Arch))
>
> I have reported this to Eric as the fail stems from the base "customizable host
> model” series.

yes my bad, this will be fixed in v8

Eric
>
> Sorry for the hiccups, and thanks for your patience, will take care from now on.
>
>
>


