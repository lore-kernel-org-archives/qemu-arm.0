Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AC0CAC587
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Sep 2025 16:29:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uwkAg-00058A-5G; Thu, 11 Sep 2025 12:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1uwkAc-00056k-Vv
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 12:29:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1uwkAb-000177-0z
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 12:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1757608151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6IfJq0PeXXpJnmQfIgkF/V+uc6bP+zPZYW7h5in2crk=;
 b=L2uiqsWKpWVnqrNIFkXTJqAjtRmX1IpWAmhBjrf6s/61OrVIAgL0XztBvMX6+RE1YmpPuy
 hdpAZ3T4mjfujk/BnX7HQqrluH6/4/EMSkM6SxBYtl558RQtuRIw9VwF6Bc5sO8H+5ugIt
 aB3z0hBvyhMJSEBu9yZw83hgH3Si374=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-r-ZnbrCLMlis4Pu3Kx136A-1; Thu, 11 Sep 2025 12:29:09 -0400
X-MC-Unique: r-ZnbrCLMlis4Pu3Kx136A-1
X-Mimecast-MFC-AGG-ID: r-ZnbrCLMlis4Pu3Kx136A_1757608148
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45cb604427fso6384725e9.1
 for <qemu-arm@nongnu.org>; Thu, 11 Sep 2025 09:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757608148; x=1758212948;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6IfJq0PeXXpJnmQfIgkF/V+uc6bP+zPZYW7h5in2crk=;
 b=AhPxC80cLkFeLFllqblVwMoGXdf+s8oWbr/o4SLFHZJW5rEteW98yYWAs6hdoVEqJh
 5+V1RrhwOoq7ZaPojaSPIXc3S983Aj++mJN+LOXhsZA2rYjZaI/0lIMlxQJOwOJ//zMe
 qFIWL9IGI1BStf+xvqpzqmjV+AETxu9L78EiUf6JUprdQYoAK22d8Ehio/RR8wfoI6gg
 AgSZopCLOdsXQir6G/B7GGmmj9R3QahwF99cwu+tMvK1EEHq5zF5r/H+SgLPEyd4aweA
 biMK8lvdp3kODOx2tB4OLydrASe9hHQLsnsJhyz7nmtmNnRkepFOHRxsdB/w5vRicaYJ
 PCgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsXoiJM+ChF5wXrMdYIX+Swm5m/Jmd2/bnxjIOgOrWjwIEvdaCep6LXvqSfe8PMtCEH7rNHVjl0g==@nongnu.org
X-Gm-Message-State: AOJu0Yy+0PjJxnzMMQ6ehxq7/4rq/nMikX6nMUEssF2GhtXMCOkDkw1+
 ERV5PZpl+hEj7MjPRgAPPaK7AIFb4Ow7Wu4SOCuw/EbcXLme4Xe0abdAD4YYlZiYSPwddRgRF0x
 iAWTr8FYw/lOr8HJ0BfkRwbTOw2lDrvHplqut72KAHkYZUoCPjMTZ/g==
X-Gm-Gg: ASbGncvuxjAblGJQSrmduPSwfW4rSeUEkLippIKW6hcwyCDD/X1hZbcD7PDQBnC4X6D
 6oapK425qWft73dEj9VtqQzaT+UnkLA/k+SBJP42wgIZ71zAl0/FE6fj5b83MZbM4EV49a0H+1B
 bxm3mDBNljYoy2JZ5KYV9MOpTYV+hkt6IGtQF8Tu3uz8R7+8JkgWjJOPjVe1LLoM6k7S4Z/CcvZ
 f3Wgq/mZNUGSaf6w/VVyHesfHQD6kOC9A7PMq4O+LAlPAY9lxWErSBUWkhonTSx+spJclzB31OG
 iLUltT18cDvoGqVzikXoLPdJpuyi82ZzoUwU0OE3HlAGxZlDVADOJ3syd+bQy7R0Elrp3V14CYi
 qdLItlbm1Kc2zuw==
X-Received: by 2002:a05:600c:5248:b0:45d:d9ab:b85a with SMTP id
 5b1f17b1804b1-45f211e520bmr865645e9.7.1757608148304; 
 Thu, 11 Sep 2025 09:29:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGY6150HoCh3FfRYfRTEKIcW5EuOXujbRibT3SZGb6KEdyz/nOArM0wpiCpufKuF5ucxLYIpw==
X-Received: by 2002:a05:600c:5248:b0:45d:d9ab:b85a with SMTP id
 5b1f17b1804b1-45f211e520bmr865075e9.7.1757608147817; 
 Thu, 11 Sep 2025 09:29:07 -0700 (PDT)
Received: from rh (p200300f6af131a0027bd20bfc18c447d.dip0.t-ipconnect.de.
 [2003:f6:af13:1a00:27bd:20bf:c18c:447d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45e037b9ebbsm31717955e9.11.2025.09.11.09.29.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 09:29:07 -0700 (PDT)
Date: Thu, 11 Sep 2025 18:29:06 +0200 (CEST)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH 0/2] arm: add kvm-psci-version vcpu property
In-Reply-To: <CAFEAcA8hUiQkYsyLOHFQqexzY3u4ZZZBXvi+DuueExGdJi_HVQ@mail.gmail.com>
Message-ID: <3176813f-77c0-4c39-b363-11af3b181217@redhat.com>
References: <20250911144923.24259-1-sebott@redhat.com>
 <CAFEAcA8EDJT1+ayyWNsfdOvNoGzczzWV-JSyiP1c1jbxmcBshQ@mail.gmail.com>
 <8bca09f1-48fe-0868-f82f-cdb0362699e1@redhat.com>
 <CAFEAcA8hUiQkYsyLOHFQqexzY3u4ZZZBXvi+DuueExGdJi_HVQ@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4i5ZXU1GhX_u5Ds-c7lITtjxUfQHNd4REAnfPNksB4U_1757608148
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
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
> On Thu, 11 Sept 2025 at 16:59, Sebastian Ott <sebott@redhat.com> wrote:
>>
>> On Thu, 11 Sep 2025, Peter Maydell wrote:
>>> On Thu, 11 Sept 2025 at 15:49, Sebastian Ott <sebott@redhat.com> wrote:
>>>>
>>>> This series adds a vcpu knob to request a specific PSCI version
>>>> from KVM via the KVM_REG_ARM_PSCI_VERSION FW register.
>>>>
>>>> Note: in order to support PSCI v0.1 we need to drop vcpu
>>>> initialization with KVM_CAP_ARM_PSCI_0_2 in that case.
>>>> Alternatively we could limit support to versions >=0.2 .
>>>>
>>>> Sebastian Ott (2):
>>>>   target/arm/kvm: add constants for new PSCI versions
>>>>   target/arm/kvm: add kvm-psci-version vcpu property
>>>
>>> Could we have some rationale, please? What's the use case
>>> where you might need to specify a particular PSCI version?
>>
>> The use case is migrating between different host kernel versions.
>> Per default the kernel reports the latest PSCI version in the
>> KVM_REG_ARM_PSCI_VERSION register (for KVM_CAP_ARM_PSCI_0_2) -
>> when that differs between source and target a migration will fail.
>>
>> This property allows to request a PSCI version that is supported by
>> both sides. Specifically I want to support migration between host
>> kernels with and without the following Linux commit:
>>         8be82d536a9f KVM: arm64: Add support for PSCI v1.2 and v1.3
>
> So if the destination kernel is post that commit and the
> source kernel pre-dates it, do we fail migration?

This case works with current qemu without any changes, since on
target qemu would write the register value it has stored from
the source side (QEMU_PSCI_VERSION_1_1) and thus requests kvm
on target to emulate that version.

> Or is
> this only a migration failure when the destination doesn't
> support the PSCI version we defaulted to at the source end?

Yes, this doesn't work with current qemu. On target qemu would
write QEMU_PSCI_VERSION_1_3 to the KVM_REG_ARM_PSCI_VERSION
register but that kernel doesn't know this version and the
migration will fail.

With this series you could request QEMU_PSCI_VERSION_1_1 on
the source kernel to allow a migration.

(For RHEL we have distro specific machine types that will
use this property to handle that via compats.)

Sebastian


