Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECA9CAC587
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Sep 2025 16:47:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uwkRo-0001d6-G5; Thu, 11 Sep 2025 12:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1uwkRg-0001bv-VF
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 12:46:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1uwkRe-0003Xv-Ob
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 12:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757609208;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NfLhSbNYEBMsg+7tun6uGQtYpAPcwFglJcubTMzrz7A=;
 b=ftGUoPmpUO7cfLQ7xvpKMOTvsJOCI4a2MknQYgWWB8Cjvhr+otXWUcRarvETtpwb8P1wEW
 HYB61xRftfyahkCWDXX0PuulpTeSAtnwElBnc13PqHMMvVJKI+5pf9m6dsOjfCg8cF5cbX
 CCNAzdxfzq3sQn0J/XjfQnCgi1/12yk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-ayhv_CqZPGuLS6SAivzaWg-1; Thu, 11 Sep 2025 12:46:47 -0400
X-MC-Unique: ayhv_CqZPGuLS6SAivzaWg-1
X-Mimecast-MFC-AGG-ID: ayhv_CqZPGuLS6SAivzaWg_1757609206
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45dde353979so5949385e9.3
 for <qemu-arm@nongnu.org>; Thu, 11 Sep 2025 09:46:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757609206; x=1758214006;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NfLhSbNYEBMsg+7tun6uGQtYpAPcwFglJcubTMzrz7A=;
 b=mxo9I1NYZ0DPrvPPsqxwC1dC/HarcFT0fonji7JVHvSEYUCx9tx7aAhC0hECNOWkDg
 ++eQKQ8KKBVqrkVFMqxp4ggIfjxP5xg5Q+9eBeaD2QyeD0AUfbb+fs2N4VNpBmjGFrc1
 08nH3nbhh9u4iTKSKAvpI+sYsfbJXp3vGKB1N7tIr0mUzviJcbxibmbXgIYZjqRXeo3h
 74qxPa093oVbKUIwyG1TKz/GMqvt+rQ/6R202csioI+32E7gtrmUxqyLlbaeuWHeBAfT
 XrY5zbPVpmbtN04PkTMLWUgI1APwgfY+WUCC66i+5lJHmHpEdKUoYOQ8CDOP2mGZbvTA
 LpQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8QGgMuC0ZU7+Qc0Y2f7+ELWixTDPsJbm7hgKEAWxci4OW5E9MRnS3y6hH7WMiTf9OaJCIG7CJeQ==@nongnu.org
X-Gm-Message-State: AOJu0YyWMa1gtchRxE6FktUkJ4eE71xdjVMj8hgD+0Jh7tRKg0hJRUjL
 0TIveXcMBXXLd0BslnwAiZOCIAnnRLC034DUNgX0XMxvLzl7D8sJIbh9JBrbPBEnmrCwBGgB8sm
 1PzO6J9p8MRX1LWpZxTzNcQlnxDgUWAx33n+Qx4B3XrVFAQPhMyfkrQ==
X-Gm-Gg: ASbGncsAyCz/Jq8f0qBpkKCMmXHC2N/1iltWYWdBP0MBdloGusPkdZV9rLZ6C9FD6gm
 h4CuRJit2LMqGadKDCCqkT40z3wODH8hI/lFvnt3j+MGoblmytLC2agep2dvJwXwQ7/vF6d6fHs
 LWRchrS8wfAsIlmam/WRL99n3qY75z9eqop6SE4thLZ6IL5pesNKT1I4ZsL8rmz4Y0Iv7DEY2o7
 LDIlicjmT5ajMzjrlni6SuNZWZXLJvtxvLwF60b4s+Hlcc16Jj3i01axb16xq3ZgfuZf6jGcCVj
 5qCbcynC0nHUazFlb24ttdN1QK6RVmNRuRiOesX6sQdOTSZMxtA1Sd9u45I0T/QxbgU5YrylZKe
 MEZz+PnKeeDdZZw==
X-Received: by 2002:a05:600c:83cf:b0:45b:43cc:e558 with SMTP id
 5b1f17b1804b1-45f21207be1mr1499085e9.35.1757609206248; 
 Thu, 11 Sep 2025 09:46:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzF7xdwiuJNiKLKdPH1FNf4ped6tYssSHKKe16I6IF6tF5/rGaCdBMHdg5t+uJppxMHK84qw==
X-Received: by 2002:a05:600c:83cf:b0:45b:43cc:e558 with SMTP id
 5b1f17b1804b1-45f21207be1mr1498835e9.35.1757609205837; 
 Thu, 11 Sep 2025 09:46:45 -0700 (PDT)
Received: from rh (p200300f6af131a0027bd20bfc18c447d.dip0.t-ipconnect.de.
 [2003:f6:af13:1a00:27bd:20bf:c18c:447d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e04cf2870sm13652215e9.1.2025.09.11.09.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 09:46:45 -0700 (PDT)
Date: Thu, 11 Sep 2025 18:46:44 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
 Cornelia Huck <cohuck@redhat.com>, Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 0/2] arm: add kvm-psci-version vcpu property
In-Reply-To: <CAFEAcA_ui7iyKx36fuhmOqizRWnNppb9B1iPc4nAxU2VnovMOQ@mail.gmail.com>
Message-ID: <6f1eb1b8-29d4-cdcb-f379-9869d806a116@redhat.com>
References: <20250911144923.24259-1-sebott@redhat.com>
 <CAFEAcA8EDJT1+ayyWNsfdOvNoGzczzWV-JSyiP1c1jbxmcBshQ@mail.gmail.com>
 <8bca09f1-48fe-0868-f82f-cdb0362699e1@redhat.com>
 <CAFEAcA8hUiQkYsyLOHFQqexzY3u4ZZZBXvi+DuueExGdJi_HVQ@mail.gmail.com>
 <3176813f-77c0-4c39-b363-11af3b181217@redhat.com>
 <CAFEAcA_ui7iyKx36fuhmOqizRWnNppb9B1iPc4nAxU2VnovMOQ@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w4XG_SuhULVZNDnHFwYEJsY6cVfS1BPs1r-q7GiVsuY_1757609206
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Thu, 11 Sep 2025, Peter Maydell wrote:
> On Thu, 11 Sept 2025 at 17:29, Sebastian Ott <sebott@redhat.com> wrote:
>>
>> On Thu, 11 Sep 2025, Peter Maydell wrote:
>>> On Thu, 11 Sept 2025 at 16:59, Sebastian Ott <sebott@redhat.com> wrote:
>>>>
>>>> On Thu, 11 Sep 2025, Peter Maydell wrote:
>>>>> On Thu, 11 Sept 2025 at 15:49, Sebastian Ott <sebott@redhat.com> wrote:
>>>>>>
>>>>>> This series adds a vcpu knob to request a specific PSCI version
>>>>>> from KVM via the KVM_REG_ARM_PSCI_VERSION FW register.
>>>>>>
>>>>>> Note: in order to support PSCI v0.1 we need to drop vcpu
>>>>>> initialization with KVM_CAP_ARM_PSCI_0_2 in that case.
>>>>>> Alternatively we could limit support to versions >=0.2 .
>>>>>>
>>>>>> Sebastian Ott (2):
>>>>>>   target/arm/kvm: add constants for new PSCI versions
>>>>>>   target/arm/kvm: add kvm-psci-version vcpu property
>>>>>
>>>>> Could we have some rationale, please? What's the use case
>>>>> where you might need to specify a particular PSCI version?
>>>>
>>>> The use case is migrating between different host kernel versions.
>>>> Per default the kernel reports the latest PSCI version in the
>>>> KVM_REG_ARM_PSCI_VERSION register (for KVM_CAP_ARM_PSCI_0_2) -
>>>> when that differs between source and target a migration will fail.
>>>>
>>>> This property allows to request a PSCI version that is supported by
>>>> both sides. Specifically I want to support migration between host
>>>> kernels with and without the following Linux commit:
>>>>         8be82d536a9f KVM: arm64: Add support for PSCI v1.2 and v1.3
>>>
>>> So if the destination kernel is post that commit and the
>>> source kernel pre-dates it, do we fail migration?
>>
>> This case works with current qemu without any changes, since on
>> target qemu would write the register value it has stored from
>> the source side (QEMU_PSCI_VERSION_1_1) and thus requests kvm
>> on target to emulate that version.
>>
>>> Or is
>>> this only a migration failure when the destination doesn't
>>> support the PSCI version we defaulted to at the source end?
>>
>> Yes, this doesn't work with current qemu. On target qemu would
>> write QEMU_PSCI_VERSION_1_3 to the KVM_REG_ARM_PSCI_VERSION
>> register but that kernel doesn't know this version and the
>> migration will fail.
>
> I was under the impression that trying to migrate backwards
> from a newer kernel to an older one was likely to fail
> for various reasons (notably "new kernel reports a new
> system register the old one doesn't") ?  Perhaps we should
> think about the problem in a wider scope than just the
> PSCI version...

Yes we already are ;-) See this series from Cornelia:
https://lore.kernel.org/qemu-devel/20250414163849.321857-1-cohuck@redhat.com/

And this from Eric:
https://lore.kernel.org/qemu-devel/20250911134324.3702720-1-eric.auger@redhat.com/

Both will help mitigate register differences for a backwards/downgrade
migration.

Sebastian


