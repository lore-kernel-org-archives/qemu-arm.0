Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958A8C55AB9
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Feb 2026 12:13:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vtPNo-0001kg-BL; Fri, 20 Feb 2026 07:13:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vtPNM-0001c4-2I
 for qemu-arm@nongnu.org; Fri, 20 Feb 2026 07:12:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vtPNJ-00083R-8p
 for qemu-arm@nongnu.org; Fri, 20 Feb 2026 07:12:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1771589567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a6WnYkUv+1p2RXUoYer9jX6Ro906Av76rOQTzY8hn48=;
 b=RQA5LcYiquEiuV3yr6KMg2yaxT3olW/TQ6RsqCFzfL8+/8NESH1zoJHjifMq+hU+k9DBCV
 mSMA/AMxEz/c+6cSpI6MZRZJZGOcsvHDdfc32nZs53+pNi4dLZwHeSY9ihuBQbriOMOk03
 Z7ydDns6Sa6ltq0LqGRVpwYJ/BsNrEM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-262-EuF25kCuNoCO8pUmMtAduw-1; Fri, 20 Feb 2026 07:12:46 -0500
X-MC-Unique: EuF25kCuNoCO8pUmMtAduw-1
X-Mimecast-MFC-AGG-ID: EuF25kCuNoCO8pUmMtAduw_1771589565
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4837a71903aso11810585e9.1
 for <qemu-arm@nongnu.org>; Fri, 20 Feb 2026 04:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771589565; x=1772194365;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a6WnYkUv+1p2RXUoYer9jX6Ro906Av76rOQTzY8hn48=;
 b=cZYo0sF+zvz8dnwKObqZksKnp8HIvSlP6MHgciRxAC9Jx6CJXvQXlnlLaAI6Ka5BHZ
 4O5sf3v8MXb+7DWKZfIrd8I7tgoaEznjA8ftMQXBlQqymvIYp0GTzHKosiw8VYUF8+u6
 DsFzlaYFxtXFpOZArmMdNiYLwm89mFANWOctJ/l+W8Tq9GI9fTw0NJ35LzkyQ4mOAR6c
 8IQN5/5sJAau0ij4VSiys90Jz86RvMfGl5KheJ2mJqgVNAltBiAQqqjvDLRlrlDHWyGd
 Yosz4FRq6jwEWXfBxHJwFY7LjYB2lLFaIVUSA1aulqLKu8YXGzIM2OpcWePneC9/DSEp
 pnQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaerfEoBnP/qL7CsMZJLJLBdWZ1LlYh0ROeHuydpFSfoFJsVeAK8YBfsEBOfVbR27z4pAE5z5u2g==@nongnu.org
X-Gm-Message-State: AOJu0YzdLLhz5/TTARYzFXJdJgtrCdPGb8cwMNrnPxcCekVfF1Opw2Kw
 RIpf7TgmZxqICfz0zpXhL/8MCkYSR9PyX94ytrnAAITZHa58IJPrCqPptS1F0jJfy2bUaEF9uqt
 cGse9JoHbjWkiFDe2C0Si522KREosq7hfxVqZtvDo8I5rigBqUnRGdA==
X-Gm-Gg: AZuq6aLLJ+adh6SGBNve4A4zeYmsYfflutWWHU2Uy3o/0O96nxCQubIdXrdY5R5Fuyb
 5xSglk/VxEr0rlbVYowCQUk9N19siyHfGJi9VOHgqXtmx9hhimaUIBwlFWYViRq8zTog1tB5Zwn
 K+JJHs/jaQNN5N9WEwZcGIuNHCbRyznk0cmIBnRpJz/LWtnYoX9oum2Ckv7YdGbe9jFcrNYVmo7
 x8lnT6n0mBeE7qUh84R2zPzxpMcs706H2jOs9AHQFam1thcMGzT6wNQWSfn5F+gGScNOwSRMBXw
 IHq79qbXAdIv0YMX8ZelXjLR65mbk+LmTFB5fSmO4iKARy3KP8dqrE41ZQbu366RFnu0VG4YZk7
 9oriDByh6aOxXLJ+GIG4JpBqkoX+bFM0oXLKkryz8DfvXo3pfK0QEqyuuioEOpmtqggvNHB0=
X-Received: by 2002:a05:600c:5491:b0:480:1c2f:b003 with SMTP id
 5b1f17b1804b1-48379bfd732mr370818675e9.20.1771589564990; 
 Fri, 20 Feb 2026 04:12:44 -0800 (PST)
X-Received: by 2002:a05:600c:5491:b0:480:1c2f:b003 with SMTP id
 5b1f17b1804b1-48379bfd732mr370818155e9.20.1771589564568; 
 Fri, 20 Feb 2026 04:12:44 -0800 (PST)
Received: from rh (p200300f6af2d8700b4c2d356c3fafe63.dip0.t-ipconnect.de.
 [2003:f6:af2d:8700:b4c2:d356:c3fa:fe63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483a316eb08sm77575655e9.0.2026.02.20.04.12.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 04:12:44 -0800 (PST)
Date: Fri, 20 Feb 2026 13:12:43 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
cc: Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 kvmarm@lists.linux.dev
Subject: Re: [PATCH v4 2/2] target/arm/kvm: add kvm-psci-version vcpu property
In-Reply-To: <CAFEAcA8V9bjQUzUYAW7qj5fEn_f9xaPJAYpTRgvdaFq0cY3pRA@mail.gmail.com>
Message-ID: <a4fffa2d-119a-cd78-44b6-b0c53d873833@redhat.com>
References: <20251202160853.22560-1-sebott@redhat.com>
 <20251202160853.22560-3-sebott@redhat.com>
 <CAFEAcA8oi1Xs2kv66dFV9NZore+Q2vHUsgMikveVdN1c+3SBJQ@mail.gmail.com>
 <9b04a20f-b708-208d-1e4e-466ec30b7bb9@redhat.com>
 <CAFEAcA-A+zW=QFdCY7z==+Z=xXfhJvPeyHhbG_MpEmpkQfrmaw@mail.gmail.com>
 <4e9470d5-ef3e-cf5c-4117-fb589d56323c@redhat.com>
 <CAFEAcA8V9bjQUzUYAW7qj5fEn_f9xaPJAYpTRgvdaFq0cY3pRA@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EGPEOcKJX3zoMeeZAx4TyCe0vLuGlCrHCKVfWO6htUM_1771589565
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Mon, 16 Feb 2026, Peter Maydell wrote:
> On Wed, 11 Feb 2026 at 16:04, Sebastian Ott <sebott@redhat.com> wrote:
>>
>> On Wed, 11 Feb 2026, Peter Maydell wrote:
>>> On Wed, 11 Feb 2026 at 15:37, Sebastian Ott <sebott@redhat.com> wrote:
>>>>
>>>> On Fri, 6 Feb 2026, Peter Maydell wrote:
>>>>> On Tue, 2 Dec 2025 at 16:09, Sebastian Ott <sebott@redhat.com> wrote:
>>>
>>>>>> +static char *kvm_get_psci_version(Object *obj, Error **errp)
>>>>>> +{
>>>>>> +    ARMCPU *cpu = ARM_CPU(obj);
>>>>>> +    const struct psci_version *ver;
>>>>>> +
>>>>>> +    for (ver = psci_versions; ver->number != -1; ver++) {
>>>> [...]
>>>>>> +        if (ver->number == cpu->psci_version)
>>>>>> +            return g_strdup(ver->str);
>>>>>> +    }
>>>>>> +
>>>>>> +    return g_strdup_printf("Unknown PSCI-version: %x", cpu->psci_version);
>>>>>
>>>>> Is this ever possible?
>>>>
>>>> Hm, not sure actually - what if there's a new kernel/qemu implementing
>>>> psci version 1.4 and then you migrate to a qemu that doesn't know about
>>>> 1.4?
>>>
>>> Oh, I see -- we're reporting back cpu->psci_version here, which
>>> indeed could be the value set by KVM. I misread and assumed
>>> this was just reading back the field that the setter sets,
>>> which is kvm_prop_psci_version (and which I think will only
>>> be set via the setter and so isn't ever a value the setter
>>> doesn't know about).
>>>
>>> That does flag up a bug in this patch, though: if I set
>>> a QOM property via the setter function and then read its
>>> value via the getter function I ought to get back what
>>> I just wrote.
>>>
>>
>> Meaning this should be something like below?
>>
>> static char *kvm_get_psci_version(Object *obj, Error **errp)
>> {
>>      ARMCPU *cpu = ARM_CPU(obj);
>>
>>      return g_strdup_printf("%d.%d",
>>         (int) PSCI_VERSION_MAJOR(cpu->kvm_prop_psci_version),
>>         (int) PSCI_VERSION_MINOR(cpu->kvm_prop_psci_version));
>
> I guess we need to define what we want. Things we need:
>
> - user/QMP/etc setting a value and reading it back should
>   get back what they set
> - QEMU needs to keep working on a new kernel that defines a
>   new PSCI version in the future
> - user reading the default value and then writing it back
>   should succeed
>
> Things we might like:
> - ideally the setter would fail if the user picks a version
>   KVM can't support, but I don't think we can conveniently
>   determine this, so "fail vcpu init" may be as good as we
>   can get without unnecessarily large amounts of effort
>
> I think this probably adds up to:
> - setter should accept any a.b value (for a,b fitting in [0,65535])
> - getter can handle any value and turn it into a.b
> - make sure that setting it to an invalid value gives a helpful
>   error on vcpu start
>
> Doing it this way, do we need a separate cpu->kvm_prop_psci_version,
> or could we directly read and write cpu_>psci_version ?
>

Thanks for your suggestions! I've implemented them all and sent out a V6.

Sebastian


