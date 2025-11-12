Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE4B0CD3429
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 17:22:12 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJEXf-0005oG-95; Wed, 12 Nov 2025 12:21:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vJEWe-0005Ii-NL
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 12:21:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vJEWb-0007NA-VF
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 12:20:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762968051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yMxVuvAqoApe1n3kwx4U0GfXYBdIm/dWnshoZeslIHg=;
 b=R5b6uVFWQYeR+nk0uOXuWZ1rlIXyAwvAt/L8Ygp6M1wdBQ2bkHugCqmuH+xT14iDghKNt/
 pcYGjxgXQpzu0YM1LlYTtsC7lAKuV2KXJO4/gXgM94wq8F5093g5lORaw3BV7p/kK+J3uW
 BxV8BxQbDCaFiHr/rtLFp8mOfWo4ZvM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-679-YXhoKD4LP1ONxtSBHyCvBQ-1; Wed, 12 Nov 2025 12:20:50 -0500
X-MC-Unique: YXhoKD4LP1ONxtSBHyCvBQ-1
X-Mimecast-MFC-AGG-ID: YXhoKD4LP1ONxtSBHyCvBQ_1762968049
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4775d110fabso9923955e9.1
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 09:20:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762968049; x=1763572849;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yMxVuvAqoApe1n3kwx4U0GfXYBdIm/dWnshoZeslIHg=;
 b=wmc8uqTwdQhJxrBciGqOuXB4n8wI8kYwwZHEM2lFMsgk/xfzTaFz2Rq1J9aAlstlAF
 sANwhisVGYAzcSiQa/Bf8wZBHVE+5znXAG3UppBAXHhWhyDKitdAVciyEb2IqpYUYIe4
 VqNWAhJxvZfrb9ftdfNzdv55t6xySBKCSos48yr7iJXcXGR/fX6C2kSPoumz0zC36i+O
 nUrUVXAby33EULqJ4jqq/wx4GSKqIhkWIHXCZySpmCw5/qNptxbw0dOGEHx7feOV/GRT
 Us3Pk+7PprWRighPBJUrCpVD/s5t5+Jxd87jG0rg+lb4w07eHImzRmnvb75mMjtH40Bm
 Zu9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAFZ9Chl8NbSarZedfg/NEsfD6FA9VeE2CFkz4ItLo2jwobu8FhRRwvFW/mv9r9+IWzrlDdjyZVA==@nongnu.org
X-Gm-Message-State: AOJu0YwixgTKeBbcrZmkBQCHe4MyzOim4TgfEBdBCvHggw3RWwRVeIvy
 5CV5h6Kx5CQ802dHmXCJOgMYVHttj5V/Yxykys/Hld/+Kxvf7EHg5cKpWp57Hjy4KhyxAmtcQcy
 jSAHEqhNV4O82fepgPgkN0sv/swtIL+FGLW0hriTUlcH9Y0ic+6+NWw==
X-Gm-Gg: ASbGnctw/JPDAnEC4EdQ+CO+wW2+9LApLHpB+tnL2v2IOv6TYcGOktCOJ7WPcN960MK
 9LK45GeM/iRhmEZpfkQb108yrDxNE1Bwdq1hgaukjQBV2Q58UEJKvJFGRIjhAB4BYIOSg5KD4FF
 9Zu7XLaWGlZAcu4MbCCoTan9Nz5WiBXVakMYD+1An96wMYdebT/qF4zqvR/HcS/OSd+uKLl+0eQ
 jebu6egzyLr38mf9LA7kO2ZATVVNzHIIlicrRizV4/f/0ymza8WYy/jROlg0O6UWt+kS2H2/0Y+
 r6sflpBHKiN035EdXn4PHKC7CPG+OHyRP5lDCOKQhxbHy6bHRYuVc/3oEPun3MHQFQfK225QHCL
 4Z5rcSaF9K3CnYZ+LBHla5gnuM8utx/BJmTFE/Hy9s7yK3Svh
X-Received: by 2002:a05:600c:6305:b0:477:7a95:b971 with SMTP id
 5b1f17b1804b1-477870a99d9mr38482905e9.31.1762968049300; 
 Wed, 12 Nov 2025 09:20:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEegzjrPUmLH9up7bKJ2Gnf4SouhSesuQw86AewfqbDWeqLNOhar2BDeK/AVLyrimDmRdJciA==
X-Received: by 2002:a05:600c:6305:b0:477:7a95:b971 with SMTP id
 5b1f17b1804b1-477870a99d9mr38482625e9.31.1762968048885; 
 Wed, 12 Nov 2025 09:20:48 -0800 (PST)
Received: from rh (p200300f6af131a0027bd20bfc18c447d.dip0.t-ipconnect.de.
 [2003:f6:af13:1a00:27bd:20bf:c18c:447d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e3a656sm46533675e9.2.2025.11.12.09.20.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 09:20:48 -0800 (PST)
Date: Wed, 12 Nov 2025 18:20:47 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
cc: Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH v2 2/2] target/arm/kvm: add kvm-psci-version vcpu property
In-Reply-To: <0795ff4a-50d1-4b2d-84bf-e1bc9da11ba6@redhat.com>
Message-ID: <cff8ff25-f4a6-6b90-8b90-10b8da7972ac@redhat.com>
References: <20251030165905.73295-1-sebott@redhat.com>
 <20251030165905.73295-3-sebott@redhat.com>
 <0795ff4a-50d1-4b2d-84bf-e1bc9da11ba6@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3OFBVh00JwWZijlPAr11_tu6DQHM4EXQZ6V2O4ZjmxI_1762968049
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

On Tue, 11 Nov 2025, Eric Auger wrote:
> On 10/30/25 5:59 PM, Sebastian Ott wrote:
>> Provide a kvm specific vcpu property to override the default
>> (as of kernel v6.13 that would be PSCI v1.3) PSCI version emulated
>> by kvm. Current valid values are: 0.1, 0.2, 1.0, 1.1, 1.2, and 1.3
>>
>> Signed-off-by: Sebastian Ott <sebott@redhat.com>
>> ---
[...]
>> +static char *kvm_get_psci_version(Object *obj, Error **errp)
>> +{
>> +    ARMCPU *cpu = ARM_CPU(obj);
>> +    const struct psci_version *ver;
>> +
>> +    for (ver = psci_versions; ver->number != -1; ver++) {
>> +        if (ver->number == cpu->prop_psci_version)
> I still have the same question/comment as on v1. In case the end user
> does not override the psci version I think you want to return the
> default value, retrieved from KVM through KVM_REG_ARM_PSCI_VERSION and
> which populates cpu->psci_version. So to me you should use
> cpu->psci_version instead

Sry, I didn't get your question the first time and double checked that the
VM uses the default/most recent version when the property is not set.

I just found out how to actually call this function (via qom-get) and
you're right: the VM uses the correct version but we report something
different here - and in this version even trigger the assertion. Ouch.

[...]
>> @@ -1959,7 +2008,8 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>      if (cs->start_powered_off) {
>>          cpu->kvm_init_features[0] |= 1 << KVM_ARM_VCPU_POWER_OFF;
>>      }
>> -    if (kvm_check_extension(cs->kvm_state, KVM_CAP_ARM_PSCI_0_2)) {
>> +    if (cpu->prop_psci_version != QEMU_PSCI_VERSION_0_1 &&
> I don't understand what this change stands for. Please document it
> through both a comment and a commit msg explanation

The explanation is in the cover letter - I'll move it to this patch.

Thanks,
Sebastian


