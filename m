Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1608CCCD184
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 13:32:14 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8f8F-0000yc-PP; Tue, 14 Oct 2025 09:32:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v8f84-0000ta-Hc
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 09:31:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1v8f7u-0000A9-0i
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 09:31:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760448695;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x7z+Q1MrsXnEpu6472ut1hHzrIO5rIkg06XaWor6rQY=;
 b=D5uEaHg6m4mb9E/2FYlbKRnyc17LK5htBsZzP9OK6JsMzddHFq6IXO62cBu6FRLUg7vvl8
 JvpRF4LbteAI6qOdfl132h9/7+cJ7KrskBy4PCjvDMvmZzX/Je2ssJ3fNohMRjK87X5lQz
 3b0I2sbGuUm49fYZS9aia2th7t4AVH8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-qvUB1FAmOJKuerkkTSTbEQ-1; Tue, 14 Oct 2025 09:31:34 -0400
X-MC-Unique: qvUB1FAmOJKuerkkTSTbEQ-1
X-Mimecast-MFC-AGG-ID: qvUB1FAmOJKuerkkTSTbEQ_1760448693
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3ecdb10a612so269970f8f.2
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 06:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760448693; x=1761053493;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x7z+Q1MrsXnEpu6472ut1hHzrIO5rIkg06XaWor6rQY=;
 b=HTwoC4DCewBsPGWkLRcbdJid+0qks5Ax5I8lCzihWXh3djCJpvyONhdiLpmX9Zc953
 fqJVvWyjDIItYrO1etimroMOUpccB0aVXesrwKncLGdOqwZGIIZeOkjOrYToZbPy4SSB
 6gQ9vrdKyOzBBlppu0lQNmZvfmI9Msi0GMhAbPjscuLiIiF5W8DUPcqsctbEDp1EwfZs
 BG+hNZ8v7OWElVXVcsQ0Y7O3NMQEDlA4FSjeQttwLr9/zLmgY2seVT02TpC0zT6vJKgt
 HUxfFONHYJrElZVjkqVFaYTjjU6SF6zMKiNXsJD0XZ9F5J8EE6Kh0lfKHXYEYdrA8QGH
 gJgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwQLmaviazgw2lAOzllw8CQ2rZH96MCmCdlF3kqptpg1hHrJNSVz50dtRkql6w6+EIMW5LPdi4RQ==@nongnu.org
X-Gm-Message-State: AOJu0YyCZXPbq59BVP1w/wKKx8nwkvnjIgN/FXBPQSP9Uf0ptw1OJQPH
 dOnePL3Xtp7BiEGHXyIX6Z+oV6xVfq/Fr8jjQLBXfMBoJgSkrBSuMXdJrD9HSbvsF/isGbNCQGO
 blbF3nreAWedLfa4YDHr7jnFqtBG23vi2Ug2Bvp8Tor3MG7FRoDzXRQ==
X-Gm-Gg: ASbGncsEkNrYi9Vj/0ZEAXMX4jUZ/S8bfXKmnWJHIt5xBpi4Kjx6QzMrNfY9eALegqQ
 Yq7uoQ8xCpy5xP6jBrU/dNvkZGMerx0SSE1hr6/IPiGh4xjN3KK1IIgBeeM1LcUpbyfGrmRHuWZ
 0HkgVA+6RivlsrQPSu2KvZKOVJzNEI3aBtn+cNQ+/uP8UOc1gkfWjkA6Tn8N7iwsINML57df6UJ
 C+Kbb4d2Xu+KmAL3ocqpzfBn0uMxcXQeCF41WcDEnE5UZ+p9UO7MnRaOpclwJw0Xl2UgrRL+sdc
 sOpsCEVDjtZ7G4gJLk2gul2G85hha2/ZN3LEGQ8Fvpy2Ppro+fUzjJz0TKPCYwrHn+0WxMoqQ3C
 JaR87nhfkkWg=
X-Received: by 2002:a05:6000:420a:b0:3ee:114f:f89f with SMTP id
 ffacd0b85a97d-42666ac6b77mr15425572f8f.15.1760448693411; 
 Tue, 14 Oct 2025 06:31:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIlXrA87Pjbt0WrD7qt6C/Ie6Y+bCyHggnpAu++NTvCRxyZt6iL8Dns0orhvyKE9OgAvLafg==
X-Received: by 2002:a05:6000:420a:b0:3ee:114f:f89f with SMTP id
 ffacd0b85a97d-42666ac6b77mr15425552f8f.15.1760448692985; 
 Tue, 14 Oct 2025 06:31:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce583664sm23831484f8f.22.2025.10.14.06.31.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Oct 2025 06:31:32 -0700 (PDT)
Message-ID: <b6dd73c6-e77a-43aa-b20e-54f6041b5a90@redhat.com>
Date: Tue, 14 Oct 2025 15:31:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/3] target/arm/cpu: Add new CPU property for KVM regs to
 hide
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 maz@kernel.org, oliver.upton@linux.dev, sebott@redhat.com, gshan@redhat.com
References: <20250911134324.3702720-1-eric.auger@redhat.com>
 <20250911134324.3702720-2-eric.auger@redhat.com> <87ldllv79m.fsf@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <87ldllv79m.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: FrAb3bbGXGyd31h4CnDhPtOeJ5yBDhy5mia4sE-xi20_1760448693
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 10/8/25 3:43 PM, Cornelia Huck wrote:
> On Thu, Sep 11 2025, Eric Auger <eric.auger@redhat.com> wrote:
>
>> New kernels sometimes expose new registers in an unconditionnal
>>  manner.  This situation breaks backward migration as qemu notices
>> there are more registers to store on guest than supported in the
>> destination kerenl. This leads to a "failed to load
>> cpu:cpreg_vmstate_array_len" error.
>>
>> A good example is the introduction of KVM_REG_ARM_VENDOR_HYP_BMAP_2
>> pseudo FW register in v6.16 by commit C0000e58c74e (“KVM: arm64:
>> Introduce KVM_REG_ARM_VENDOR_HYP_BMAP_2”). Trying to do backward
>> migration from a host kernel which features the commit to a destination
>> host that doesn't fail.
>>
>> Currently QEMU is not using that feature so ignoring this latter
>> is not a problem. An easy way to fix the migration issue is to teach
>> qemu we don't care about that register and we can simply ignore it,
>> including its state migration.
>>
>> This patch introduces a CPU property, under the form of an array of
>> reg indices which indicates which registers can be ignored.
>>
>> The goal then is to set this property in machine type compats such
>> as:
>> static GlobalProperty arm_virt_kernel_compat_10_1[] = {
>>     /* KVM_REG_ARM_VENDOR_HYP_BMAP_2 */
>>     { TYPE_ARM_CPU, "kvm-hidden-regs", "0x6030000000160003" },
>> }
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>  target/arm/cpu.h        |  4 ++++
>>  target/arm/kvm.c        | 36 ++++++++++++++++++++++++++++++++++--
>>  target/arm/trace-events |  2 ++
>>  3 files changed, 40 insertions(+), 2 deletions(-)
>>
> (...)
>
>> +/**
>> + * kvm_vcpu_compat_hidden_reg:
>> + * @cpu: ARMCPU
>> + * @regidx: index of the register to check
>> + *
>> + * Depending on the CPU compat returns true if @regidx must be
>> + * ignored during sync & migration
> Maybe add some more explanation, either here or at the kvm_hidden_regs[]
> def? So that people do not need to look at the introducing commit :)
>
> "This is intended for when we know that we do not use the register to be
> ignored, and want to keep compatibility."

Added here and also in next patch, in cpu.h

Thanks!

Eric
>
>> + */
>> +static inline bool
>> +kvm_vcpu_compat_hidden_reg(ARMCPU *cpu, uint64_t regidx)
>> +{
>> +    for (int i = 0; i < cpu->nr_kvm_hidden_regs; i++) {
>> +        if (cpu->kvm_hidden_regs[i] == regidx) {
>> +            trace_kvm_vcpu_compat_hidden_reg(regidx);
>> +            return true;
>> +        }
>> +    }
>> +    return false;
>> +}


