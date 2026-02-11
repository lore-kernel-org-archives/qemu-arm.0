Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1460ECD6C4
	for <qemu-arm@archiver.kernel.org>; Wed, 11 Feb 2026 16:04:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqChg-0001nt-BB; Wed, 11 Feb 2026 11:04:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vqChe-0001mm-1u
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 11:04:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vqChb-0005si-Tc
 for qemu-arm@nongnu.org; Wed, 11 Feb 2026 11:04:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770825870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5KpC7yaqnmPgfObvDWEmIArdNjIVjuTr6fFxuFr8Hdk=;
 b=FVQus8uqgehpxXP2IYKnvBMGDF4XTCcAP8/TKS2qmaaNsAqxKjJys3OxMYn8GQfGduQ4wj
 uDZn/u7SCVer1Ld4BOfHT5oAr4uVOgeQadZjULcrzblRFtcS45OdIaAcRX+xyANAw7a5ZM
 qFH6Wl0Jn2UKWr1x/BEQXIv0BNoaGFU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-b5HcESU2M8-pcE73OY03jw-1; Wed, 11 Feb 2026 11:04:29 -0500
X-MC-Unique: b5HcESU2M8-pcE73OY03jw-1
X-Mimecast-MFC-AGG-ID: b5HcESU2M8-pcE73OY03jw_1770825868
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-435add03f12so3645497f8f.3
 for <qemu-arm@nongnu.org>; Wed, 11 Feb 2026 08:04:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770825868; x=1771430668;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5KpC7yaqnmPgfObvDWEmIArdNjIVjuTr6fFxuFr8Hdk=;
 b=qz3I4DyiIOadoZrgaqneYex7OOzp3eMMnfKRuxAdooqvnuJvu1OqcBQi4mbL5nKfdO
 xJKWrFrWmiZOeVr4xLEoCxyTZ3K90PdbFXefANCnPSyaxDaitBXGLhLFKn1ysr+X8go4
 HVZnaVCHfnMVrbyLI12BMIFZV6BsKrlGf3EB9uYyyU00yMJYmpebkumDjibl+dYt0LUo
 SDZgxaaB7z8U0s3ZmglI9OIy8+fqmQkvedh+p6MkaWzBJhc1lD7B0M8YzAalvOF3vzDR
 I7lOSLFYfh/8qmV/AMDgEam2eR5klqMWoq9FY6SVKozyNuM1u2qXYtUqSSFOkIHE1+5E
 FDbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSDSyYmvPBYt6ydEcMIC5YdoToEsNLV0tC4I1y1YjhteC6HNPYMBGbZYiaiyl9T9zdi/7SUaFyZQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx1PTAZ32nx7EIhWRRUEWQPiUcme/Lm4EEWLW6WMiyTzwS2i2II
 WEi3+GA9qpl3OdAbGsQ5cIPmHmRPqUxliynFsopzFDPOIvnIZ5L8ujjOx2gwiWHGeILmlZKFJt2
 vzOv8YJ4jsf+UyUg63B+rHuxGTQStN7PvdBIA3v1INRd1FzhLJuB18g==
X-Gm-Gg: AZuq6aINegGGvppu7kWeMbljA5LIo7JobkHF96DXXrxVXpM7TR7NGLdDBqzWvsaoSzK
 GD8WlF9zf+ynzpglDzjMUOG27EfpbUzXXNckMGswSvmiElUiu+wRKGym8LUZreRMYMPEI5EbGKc
 DcNeRraSWUxx3derTDP3BF6SFQQyKrxFBB6Lg9O/f5VSwmcl6mVY5d52qhMYsYI6TmjZk0bEKIl
 /ptJ2b5jBvYdo+ztkSJ3n6ZAKbY4gi7rWL+Vt1fY/nwYLRc8VqP5KE0VMoAsm8FZQB6oCuM6Ezt
 DGhzK4xoH3l0ZMIOxSAHJYzIu+I2vyPOH2WgqJcG+dQ4kbgUxbKm1z0tGH9AunSGmhtK8eRuC2v
 wTWfQy2n53pu6J4lHZb2lGemNlAYgtRDv1mH3mvIFGv2iZwAHc7uVi2dyCF+6mzwT5SrE4Ks=
X-Received: by 2002:a05:600c:46d0:b0:45d:f81d:eae7 with SMTP id
 5b1f17b1804b1-4835b96ec32mr36898575e9.28.1770825867297; 
 Wed, 11 Feb 2026 08:04:27 -0800 (PST)
X-Received: by 2002:a05:600c:46d0:b0:45d:f81d:eae7 with SMTP id
 5b1f17b1804b1-4835b96ec32mr36897035e9.28.1770825865304; 
 Wed, 11 Feb 2026 08:04:25 -0800 (PST)
Received: from rh (p200300f6af2d8700b4c2d356c3fafe63.dip0.t-ipconnect.de.
 [2003:f6:af2d:8700:b4c2:d356:c3fa:fe63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4835d92267bsm70932155e9.0.2026.02.11.08.04.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 08:04:24 -0800 (PST)
Date: Wed, 11 Feb 2026 17:04:23 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 kvmarm@lists.linux.dev
Subject: Re: [PATCH v4 2/2] target/arm/kvm: add kvm-psci-version vcpu property
In-Reply-To: <CAFEAcA-A+zW=QFdCY7z==+Z=xXfhJvPeyHhbG_MpEmpkQfrmaw@mail.gmail.com>
Message-ID: <4e9470d5-ef3e-cf5c-4117-fb589d56323c@redhat.com>
References: <20251202160853.22560-1-sebott@redhat.com>
 <20251202160853.22560-3-sebott@redhat.com>
 <CAFEAcA8oi1Xs2kv66dFV9NZore+Q2vHUsgMikveVdN1c+3SBJQ@mail.gmail.com>
 <9b04a20f-b708-208d-1e4e-466ec30b7bb9@redhat.com>
 <CAFEAcA-A+zW=QFdCY7z==+Z=xXfhJvPeyHhbG_MpEmpkQfrmaw@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WQHcSBV8wZud-ntw7QLHJa5StH3Dqwu2Ue0ki_8_dEQ_1770825868
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 11 Feb 2026, Peter Maydell wrote:
> On Wed, 11 Feb 2026 at 15:37, Sebastian Ott <sebott@redhat.com> wrote:
>>
>> Hi Peter,
>>
>> On Fri, 6 Feb 2026, Peter Maydell wrote:
>>> On Tue, 2 Dec 2025 at 16:09, Sebastian Ott <sebott@redhat.com> wrote:
>
>>>> +static char *kvm_get_psci_version(Object *obj, Error **errp)
>>>> +{
>>>> +    ARMCPU *cpu = ARM_CPU(obj);
>>>> +    const struct psci_version *ver;
>>>> +
>>>> +    for (ver = psci_versions; ver->number != -1; ver++) {
>> [...]
>>>> +        if (ver->number == cpu->psci_version)
>>>> +            return g_strdup(ver->str);
>>>> +    }
>>>> +
>>>> +    return g_strdup_printf("Unknown PSCI-version: %x", cpu->psci_version);
>>>
>>> Is this ever possible?
>>
>> Hm, not sure actually - what if there's a new kernel/qemu implementing
>> psci version 1.4 and then you migrate to a qemu that doesn't know about
>> 1.4?
>
> Oh, I see -- we're reporting back cpu->psci_version here, which
> indeed could be the value set by KVM. I misread and assumed
> this was just reading back the field that the setter sets,
> which is kvm_prop_psci_version (and which I think will only
> be set via the setter and so isn't ever a value the setter
> doesn't know about).
>
> That does flag up a bug in this patch, though: if I set
> a QOM property via the setter function and then read its
> value via the getter function I ought to get back what
> I just wrote.
>

Meaning this should be something like below?

static char *kvm_get_psci_version(Object *obj, Error **errp)
{
     ARMCPU *cpu = ARM_CPU(obj);

     return g_strdup_printf("%d.%d",
 	(int) PSCI_VERSION_MAJOR(cpu->kvm_prop_psci_version),
 	(int) PSCI_VERSION_MINOR(cpu->kvm_prop_psci_version));
}


