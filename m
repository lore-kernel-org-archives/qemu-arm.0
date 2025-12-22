Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45EDE674A9
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Dec 2025 13:23:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vXfsE-0001PJ-0X; Mon, 22 Dec 2025 08:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1vXfsB-0001Or-EU
 for qemu-arm@nongnu.org; Mon, 22 Dec 2025 08:22:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1vXfs9-0006Zp-RE
 for qemu-arm@nongnu.org; Mon, 22 Dec 2025 08:22:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1766409768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vsN2ky6v8cWwIdyRQRPpTxLIkdJ4PWbC9SoOHO18Y14=;
 b=YDqzvVe5TG5v5IZViWYRW/WiuXHwDiJTOkifoxxwF8w7Du8aHjeZCILbRVB6V+3UU/vnJN
 WtFh+fuvj6E7DPqEB4utc0RJvCQS6eAJ7qeM+Dc7VIDhOVtt3XMqGFU4rUU0zZDulvubM6
 /fJtCyL5eGXPo3pLr7bg53Cqp3Y/g84=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-oUnWZFNIOcesEnuUGp6u_Q-1; Mon, 22 Dec 2025 08:21:40 -0500
X-MC-Unique: oUnWZFNIOcesEnuUGp6u_Q-1
X-Mimecast-MFC-AGG-ID: oUnWZFNIOcesEnuUGp6u_Q_1766409699
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4775f51ce36so39971055e9.1
 for <qemu-arm@nongnu.org>; Mon, 22 Dec 2025 05:21:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766409699; x=1767014499;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vsN2ky6v8cWwIdyRQRPpTxLIkdJ4PWbC9SoOHO18Y14=;
 b=lzZciqcIKhX0Y6EkihzsnwwYVoOVSqSK5MFOWgyo/UT1k9sW86GqAi9AVRZ+VC5aCv
 d5x3oVuBFGc1oJhwQWRoKty4+WwjxExGH0PIjLtTaMR3/l4pqcmbpnR8kYypj1CjLAbA
 fqvDKeEmaoAJ9iwZzC/p8rHrly33lU/TCZtJ6siUk0Qa7qPJmtA0gThVSPVoiGaOHEYH
 EM4/5FfRXDu1fX30oJLBDwrAd2U9I6KHtPxHucr0eEtwZ7vTeWGG6NZFs0boMw2xJg4h
 46ksYDjo45C2qFLvviV3FMNfagcB7BHRmbx3pgVeNxoBpvbMXomPFoUi7JhHW8usFiwx
 p2oA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKApYAgHbh+Vuvo2wzWzvjNgSCGPEyAMLOha9nnmoeBM5Wr9Fozii5I0/TVhMExHvzwjHwE7aGGQ==@nongnu.org
X-Gm-Message-State: AOJu0YxSQIEj0ChrtozpQkX1VBje9+W/oCvlKAdVC355QahnO4uV79u7
 I9adbA0amJm7SZDOPjGaWdvX4aRyiXP16deXIAVjaW4M/whe+GdFV2A3hdG7jARghRfQaBoXcjZ
 ayK5yyNGcXEJiK6LIGUwVww7BPeYzpnG/pFhDdm64FZ0Oo1W2JmTv+w==
X-Gm-Gg: AY/fxX7wyuVNA+wj9JADaptJ92z26e95LF5i69i9lp49wfAw5swoSkS++/w0DEq3y14
 WYTEDf1TFcYlSdL8CjEKUC8XkBwfzzNUXLWqPvRMd1h/UN6yhuiKL/jVdaatJDm71k+p/QuVeqn
 49+igM/ssfijEAZI5yjUOxls5DHqczOfeOCtW5HWVh+3ovJPKCBqOS/CFAUinfpzgRXXG+yC7Wk
 dWKeqxMfRhU71fKoHfFzqydCD6vjWCT0lsekuy1V/1ESVdDsH/EiKQbaXSMvcKKkrXlGM2uIXaV
 efvOFJmZPcFdN4IVX8UhAKI9bFah4iNXe6A2plakHoRLCfFXIx97CFl2KWvBZZjj1xIUjcqYeqN
 uaNquCyyrIHjR2Vx5aI8detlH63J2U8bBkyzN9g9BkDnzxXjbsFLK
X-Received: by 2002:a05:600c:450e:b0:46e:4b79:551 with SMTP id
 5b1f17b1804b1-47d195bdffdmr124793395e9.31.1766409698808; 
 Mon, 22 Dec 2025 05:21:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGk4gABJm0kYs/03DjxIfHp5ZtGlpI0pFZPigwXL0rMSMHE7rAN50MclLDU52wytNZgUrbnuA==
X-Received: by 2002:a05:600c:450e:b0:46e:4b79:551 with SMTP id
 5b1f17b1804b1-47d195bdffdmr124793155e9.31.1766409698384; 
 Mon, 22 Dec 2025 05:21:38 -0800 (PST)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be395d9cfsm100738605e9.0.2025.12.22.05.21.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 05:21:37 -0800 (PST)
Message-ID: <f38ee951-35fa-4db6-9c3c-ea4e26f65b00@redhat.com>
Date: Mon, 22 Dec 2025 14:21:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/11] target/arm/cpu: Allow registers to be hidden
To: eric.auger@redhat.com, Cornelia Huck <cohuck@redhat.com>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, gshan@redhat.com, ddutile@redhat.com, peterx@redhat.com,
 philmd@linaro.org, pbonzini@redhat.com
References: <20251125100859.506228-1-eric.auger@redhat.com>
 <20251125100859.506228-4-eric.auger@redhat.com> <87ms4aoxg9.fsf@redhat.com>
 <6bbc1612-389c-4fa1-9fbf-354209fb6b1c@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <6bbc1612-389c-4fa1-9fbf-354209fb6b1c@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: T7D7XUaD1MRPBdO2uQfTpfZzcTH7UmyhaDbbz_vPMiw_1766409699
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Connie

On 12/22/25 2:17 PM, Eric Auger wrote:
> 
> 
> On 11/25/25 6:04 PM, Cornelia Huck wrote:
>> On Tue, Nov 25 2025, Eric Auger <eric.auger@redhat.com> wrote:
>>
>>> More recent kernels sometimes expose new registers in an
>>> unconditionnal manner. This situation breaks backward migration
>>> as qemu notices there are more registers in the input stream
>>> than supported on the destination host. This leads to a
>>> "failed to load cpu:cpreg_vmstate_array_len" error.
>>>
>>> A good example is the introduction of KVM_REG_ARM_VENDOR_HYP_BMAP_2
>>> pseudo FW register in v6.16 by commit C0000e58c74e (“KVM: arm64:
>>> Introduce KVM_REG_ARM_VENDOR_HYP_BMAP_2”). Trying to do backward
>>> migration from a host kernel that features the commit to a destination
>>> host that doesn't, fail with above error.
>>>
>>> Currently QEMU is not using that feature so ignoring this latter
>>> is not a problem. An easy way to fix the migration issue is to teach
>>> qemu we don't care about that register and we can simply ignore it
>>> when syncing its state during migration.
>>>
>>> This patch introduces an array of such hidden registers. Soon it will
>>> be settable through an array property.
>>>
>>> If hidden, the register is moved out of the array of cpreg which is
>>> built in kvm_arm_init_cpreg_list(). That way their state won't be
>>> synced.
>> I'm wondering whether the patch description should also mention non-KVM
>> cases (e.g. the bogus reg that was exposed). It might also make sense to
>> merge patch 5 here?
> 
> Actually the AArch32 DBGDTRTX is not "hidden" on destination but rather
> marked as safe to ignore in the incoming stream (so the other category).
> So I don't have any example of TCG usage for this category.
> 
> wrt potiential merge I agree they could. 2nd patch is an enforcement of
> non access so I prefer to keep them separate but will put them
> contiguously in the series. 
Sorry I mixed up with 6/11. I will squash 5/11 in this patch.

Thanks!

Eric>
> Eric 
>>
>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Otherwise, LGTM.
>>
> 



