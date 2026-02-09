Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1DCE81BC4
	for <qemu-arm@archiver.kernel.org>; Mon,  9 Feb 2026 13:43:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpRXS-0006t3-J2; Mon, 09 Feb 2026 08:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vpRXN-0006sL-8q
 for qemu-arm@nongnu.org; Mon, 09 Feb 2026 08:42:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vpRXK-0000PQ-Aq
 for qemu-arm@nongnu.org; Mon, 09 Feb 2026 08:42:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770644564;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FFV+4zM/+75D5D0pn17t2xOXo9mQBa2p4jqWIyIv230=;
 b=Hnn0KlZaHFLB6fGzUCprRqWYF/uIgB6+t9CplSIcYFw11al5DC6mYYz8/Koxm2BVLZqN5e
 GrtJHFKtS5X6NKKeSlXV2LgQlXyylmHXPX4EBzPHbXAPiYYVHiGtAByBsIrbQvhYtIMiQK
 Ecu8JM/MyTn3+abq7/Aj3DXpVGTtq8Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-wA66X75YPJGjMKMe7IrwNQ-1; Mon, 09 Feb 2026 08:42:43 -0500
X-MC-Unique: wA66X75YPJGjMKMe7IrwNQ-1
X-Mimecast-MFC-AGG-ID: wA66X75YPJGjMKMe7IrwNQ_1770644563
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4832c4621c2so21103965e9.3
 for <qemu-arm@nongnu.org>; Mon, 09 Feb 2026 05:42:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770644563; x=1771249363;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FFV+4zM/+75D5D0pn17t2xOXo9mQBa2p4jqWIyIv230=;
 b=TjNTOgbn0FEyNTmtiWLNFiBrA8tvmWHmcSrcMdbo7VW9toW9AB23PkNOBcMXk031jR
 WqiBfoXyyKxZB8rHJaZRYMoY75isltWioQgKt/ocD9so47ctyuF21tb1sZ6zTXm0Sq8j
 pUIt0FPLNJxV8b4hp93aUYl5ZBmbl5xZvIEbz9tIxRvQj3Asc18BmrRiim+3roDwg7+C
 Cek+PvmW7idMFPX0Hc8yw82a6kZaKy6idEZgbIk2a/kqkIlRkbW85iBk99Rx4Sgvhbi7
 NS/1oHvzUQquFF/cbY0nWSnoUQEOLi6xhzbrQ9N5f4LknmQ95X3ezFArBvvVprugi9Gv
 oYcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyoFEGeILj8rDrFTryHx38AKjNgKKXk7qxw09FDHBvyMwOG/1mtfNCo7mQC6HA1lt0MJBPlqBgBA==@nongnu.org
X-Gm-Message-State: AOJu0YyDEbEy7cmyB+d8BvO8dKC+eR7q7MvFbGk/zRoDP773c+w9vDgG
 yoI1FUhrcnpSTcIAQjFcREQxo6KAKab8brq9xaY2JBHUJAY00ee5ZmpoNL16PN9HDnKTZ/cEbht
 aFSGO0QWDaeWFlZxbwjdMMmCxaR0gUkdOaq4zHa49jvZuf6UpNs+hQQ==
X-Gm-Gg: AZuq6aL5AUDiRUmyl1xypZwmmqLfP/n1GDh7m6+OKg5ae8eOkpK6iDofCZc8nlqoNZ6
 BxNeKvZiLn727/mg1PxWZ6UPgzJxiWzK6/tLiJeAeOLxMWO+DeKHYxx/KCU1VjJur5QT9w2o6df
 5it1XiZM8ZA1ym6znU13njHfrZIivreftXoHW1qpIZ3BpFAtMyzJhZ+GDh/HklAX2qjprCj6XY+
 aaw7HlECQr3WtSoL1O749NoNPiJ60C5odx62nS9PG5eajh9gvLc1yL8jUvuR9oWpP03gO/McCJN
 sr1/lAeIehyA867FuwdPEMR9hwl5FPkw9VXQ6oV5boj5XdvUrn8lgWo15/iwLph8Bhj+skta4sw
 7+bRPkPhmxcSb/w0Hl1UCSK8Wvi2tWOaXO+UGDXU5DUxEsv2UXlzUTr91Jg==
X-Received: by 2002:a05:600c:c11c:b0:483:2c98:4368 with SMTP id
 5b1f17b1804b1-4832c98458bmr91956015e9.18.1770644562529; 
 Mon, 09 Feb 2026 05:42:42 -0800 (PST)
X-Received: by 2002:a05:600c:c11c:b0:483:2c98:4368 with SMTP id
 5b1f17b1804b1-4832c98458bmr91955765e9.18.1770644562062; 
 Mon, 09 Feb 2026 05:42:42 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48317d7a924sm491063325e9.10.2026.02.09.05.42.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Feb 2026 05:42:41 -0800 (PST)
Message-ID: <f05da8d8-2134-4551-81bc-7c77b2769d5a@redhat.com>
Date: Mon, 9 Feb 2026 14:42:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 02/11] target/arm/machine: Improve traces on register
 mismatch during migration
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 cohuck@redhat.com, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, gshan@redhat.com, ddutile@redhat.com, peterx@redhat.com,
 philmd@linaro.org, pbonzini@redhat.com
References: <20260126165445.3033335-1-eric.auger@redhat.com>
 <20260126165445.3033335-3-eric.auger@redhat.com>
 <CAFEAcA8dVLEa9gJ6y=hP94ZZtcNQemRawpfyWo1kLusBdy25kw@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA8dVLEa9gJ6y=hP94ZZtcNQemRawpfyWo1kLusBdy25kw@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _rgp3eMzqPRYOu0pw_zNvmTbMm8HNHjp4qzcwhgcSkY_1770644563
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Peter,

On 2/6/26 3:31 PM, Peter Maydell wrote:
> On Mon, 26 Jan 2026 at 16:55, Eric Auger <eric.auger@redhat.com> wrote:
>> Currently when the number of KVM registers exposed by the source is
>> larger than the one exposed on the destination, the migration fails
>> with: "failed to load cpu:cpreg_vmstate_array_len"
>>
>> This gives no information about which registers are causing the trouble.
>>
>> This patch reworks the target/arm/machine code so that it becomes
>> able to handle an input stream with a larger set of registers than
>> the destination and print useful information about which registers
>> are causing the trouble. The migration outcome is unchanged:
>> - unexpected registers still will fail the migration
>> - missing ones are printed but will not fail the migration, as done today.
> Improving the diagnostics here is a great idea.
>
>> The input stream can contain MAX_CPREG_VMSTATE_ANOMALIES(10) extra
>> registers compared to what exists on the target.
>>
>> If there are more registers we will still hit the previous
>> "load cpu:cpreg_vmstate_array_len" error.
>>
>> At most, MAX_CPREG_VMSTATE_ANOMALIES missing registers
>> and MAX_CPREG_VMSTATE_ANOMALIES unexpected registers are printed.
>>
>> Example:
>>
>> qemu-system-aarch64: kvm_arm_cpu_post_load Missing register in input stream: 0 0x6030000000160003 fw feat reg 3
>> qemu-system-aarch64: kvm_arm_cpu_post_load Unexpected register in input stream: 0 0x603000000013c103 op0:3 op1:0 crn:2 crm:0 op2:3
>> qemu-system-aarch64: kvm_arm_cpu_post_load Unexpected register in input stream: 1 0x603000000013c512 op0:3 op1:0 crn:10 crm:2 op2:2
>> qemu-system-aarch64: kvm_arm_cpu_post_load Unexpected register in input stream: 2 0x603000000013c513 op0:3 op1:0 crn:10 crm:2 op2:3
>> qemu-system-aarch64: error while loading state for instance 0x0 of device 'cpu'
>> qemu-system-aarch64: load of migration failed: Operation not permitted
>>
>> With TCG there is no user friendly formatting of the faulting
>> register indexes as with KVM. However the 2 added trace points
>> help to identify the culprit indexes.
> Could we move kvm_print_register_name() out of kvm.c and into
> somewhere that the TCG code can use it? (I did think when I
> was reviewing the patch that added that that we might want it
> for TCG too eventually.)
>
>> @@ -990,7 +991,13 @@ static int cpu_pre_load(void *opaque)
>>  {
>>      ARMCPU *cpu = opaque;
>>      CPUARMState *env = &cpu->env;
>> +    int arraylen = cpu->cpreg_vmstate_array_len + MAX_CPREG_VMSTATE_ANOMALIES;
>>
>> +    cpu->cpreg_vmstate_indexes = g_renew(uint64_t, cpu->cpreg_vmstate_indexes,
>> +                                         arraylen);
>> +    cpu->cpreg_vmstate_values = g_renew(uint64_t, cpu->cpreg_vmstate_values,
>> +                                        arraylen);
>> +    cpu->cpreg_vmstate_array_len = arraylen;
> It seems a bit odd to extend these on cpu_pre_load, especially
> since it means we'll do so on every cpu_pre_load call, which I
> think can happen if you try an inbound migration, it fails, and
> then you retry it.
yes in that case g_renew would be called several times with
cpu->cpreg_vmstate_array_len increased each time I guess. However with
the current way cpreg_vmstate_indexes/values arrays were statically
allocated I did not have other solution than using pre_load() I think.

>
> I think it ought to be possible to both avoid this reallocation
> and the problem noted in the commit message where more than 10
> extra registers results in an unhelpful message, if we can
> convert the vmstate fields from VMSTATE_VARRAY_INT32 to
> VMSTATE_VARRAY_INT32_ALLOC. (That latter doesn't exist yet but
> will be the INT32 equivalent of VMSTATE_VARRAY_UINT32_ALLOC.)

VMSTATE_VARRAY_INT32_ALLOC sounds a great idea indeed. I was not aware of its existence. I will try this out.

>
> If I have read the code correctly, these should work by
> having the inbound migration code allocate the buffer for the
> array data instead of expecting it to be pre-allocated -- that
> means our post_load function can look at all the data it got
> without imposing a length limitation.
>
> I think (but we should check :-)) that the data in the migration
> stream is the same in both cases, so this will not be a compat break.

OK I will test this.

Thank you for the review!

Eric
>
> (Some existing code will need adjustment to avoid a memory leak,
> e.g. g_free any existing array in pre_load.)
>
> thanks
> -- PMM
>


