Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0AEF357C5
	for <qemu-arm@archiver.kernel.org>; Wed, 25 Feb 2026 07:17:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vv98T-00077y-KT; Wed, 25 Feb 2026 02:16:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vv98H-00073O-UU
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 02:16:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vv98F-0001tU-NP
 for qemu-arm@nongnu.org; Wed, 25 Feb 2026 02:16:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772003784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qL6dea3nPOVHlv2oBcUsVZrWZwNNBBgQt3IQvJSqORw=;
 b=W5EutY1o0Xw2DKHzrU3GtvbN50aVCikTMLFtp2qQ1nw+N93gBeScg5Z8Xg05gdbZrMpRGA
 l61wl9/Hf68qhJSM+qhfUewhr4SL7qXolgGz11HZp9li/4fPYHZKnUSchVyZOKo0M/4S2J
 L+dHI4IxEwSlMdC9+HVjaeYcISsqTFY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-WQ-QJAsGOsO5DBCYKOVOrA-1; Wed, 25 Feb 2026 02:16:22 -0500
X-MC-Unique: WQ-QJAsGOsO5DBCYKOVOrA-1
X-Mimecast-MFC-AGG-ID: WQ-QJAsGOsO5DBCYKOVOrA_1772003782
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-483a24db6ecso68502845e9.1
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 23:16:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772003781; x=1772608581;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qL6dea3nPOVHlv2oBcUsVZrWZwNNBBgQt3IQvJSqORw=;
 b=vrUUvo0CTZZd4MbASG1iBEL+qSry+2e9qlTkJ/5YXT5ssuTQpmXCCQmtmLJoDaR1w0
 uJufv9SzoFPCwYJxTscnV3K7AmI9kCURrkCIl9JiUtQN20BgcYwkt8o/M9luSTxRqdXY
 AYsxlIECM0pMUA0BeReXDm/i3KgG+24zxyDqt8z2OMs2cyiv9KssHpLykPC28T+ouQ+3
 IeCWfo+xnBHlz9VnvAVXMI78EWHgy7YxUldQLIrU2ZAX8z36Xyr975Xa329D1zbrI3bp
 v7csWlgtrC/AOUVhUNMrrp8AiNtcYshRB2p3DlOk93DT+W3uvH5uLXLw6eQcqxMQPLPa
 BEFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9M9CXscXOEfVIHSmnHC4mAp2TkvC8uiKL8x5jpYfV1zvs2ON0eCQNYdAe1xs2oMXJhzdSHm2OoA==@nongnu.org
X-Gm-Message-State: AOJu0Yyzfwe2/eXqZGqT/g2g4rwGsVhgUL4zO77aD7iLjQgOe9bnCqz1
 Z67XQGP29+ivLQHDmCjvoBtfgXYF3uJzqyoOgUNr8iPiDiMiL0INXlMBJTOcCTDcjR7509J7Vyg
 vpu2mxA1zh3B50wnkKIrzYcdPoq++ednwal1QA5OaGvRRgeEZm/eTgg==
X-Gm-Gg: ATEYQzyFzLjTfGOJVDDBGJ2p/82sBVaKuylO075dZl0ZcSCUB47NC2gyP/yrJtVL8Bm
 JO4EaOrf1JKFPmb24jqFRIvfsAKOZ+yl5yUpk4o/PNfziCoOnGWLC3wacco4xGHRChVmJh0HLkq
 wRoXl6KVggIPhVGoF1JP5qOK5oRURxoK+dak/0veMlDYqrEccilhxu1LBoSAbn1KgbSnNqZ4jhV
 ZW7tXDq9op1GrdKR9mQCsUSPW8wGnJ+zswlYA06XLqmF7nmzjAVUtVQpLmqvoWE+F03NEQ4WjqD
 PK7ZRLysN8Frq0W3H6qbKOkM2cOMxsjiYSgqRtCuc++yT2gt4ZDqQRoXyUXJnIuZ2tlfgCdonK6
 DCN8SrXB47B5FRy/QVUjkIHbdg8KOjnO0OqlE6MVAd67o4vx1Jt6fUY6jQOWAPszQfmu5iTY=
X-Received: by 2002:a05:600c:8708:b0:477:7c7d:d9b2 with SMTP id
 5b1f17b1804b1-483a963d62amr213324435e9.32.1772003781523; 
 Tue, 24 Feb 2026 23:16:21 -0800 (PST)
X-Received: by 2002:a05:600c:8708:b0:477:7c7d:d9b2 with SMTP id
 5b1f17b1804b1-483a963d62amr213324075e9.32.1772003781071; 
 Tue, 24 Feb 2026 23:16:21 -0800 (PST)
Received: from rh (p200300f6af25cc00b2a92b19386de96f.dip0.t-ipconnect.de.
 [2003:f6:af25:cc00:b2a9:2b19:386d:e96f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bd732eb1sm50579945e9.12.2026.02.24.23.16.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 23:16:20 -0800 (PST)
Date: Wed, 25 Feb 2026 08:16:19 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
cc: qemu-devel@nongnu.org, eric.auger@redhat.com, kvm@vger.kernel.org, 
 kvmarm@lists.linux.dev, pbonzini@redhat.com, qemu-arm@nongnu.org
Subject: Re: [PATCH v6 1/1] target/arm/kvm: add kvm-psci-version vcpu property
In-Reply-To: <CAFEAcA8O2UEKToJ+zXA6=vvgkRyPKrPwtfHnti7yyGgCGwoJeA@mail.gmail.com>
Message-ID: <0616fe7f-96b8-251e-dc0f-9e15ec8298ba@redhat.com>
References: <20260220115656.4831-1-sebott@redhat.com>
 <20260220115656.4831-2-sebott@redhat.com>
 <CAFEAcA8O2UEKToJ+zXA6=vvgkRyPKrPwtfHnti7yyGgCGwoJeA@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h-36Cdof07_LqvsEFjfkGxUFsXaaZELbQZR_C65lJcA_1772003782
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.129.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.358, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.659,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On Tue, 24 Feb 2026, Peter Maydell wrote:

> On Fri, 20 Feb 2026 at 11:57, Sebastian Ott <sebott@redhat.com> wrote:
>>
>> Provide a kvm specific vcpu property to override the default
>> (as of kernel v6.13 that would be PSCI v1.3) PSCI version emulated
>> by kvm. Current valid values are: 0.1, 0.2, 1.0, 1.1, 1.2, and 1.3
>>
>> Note: in order to support PSCI v0.1 we need to drop vcpu
>> initialization with KVM_CAP_ARM_PSCI_0_2 in that case.
>>
>> Reviewed-by: Eric Auger <eric.auger@redhat.com>
>> Tested-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Sebastian Ott <sebott@redhat.com>
>> ---
>>  docs/system/arm/cpu-features.rst | 11 ++++++++
>>  target/arm/cpu.c                 |  8 +++++-
>>  target/arm/kvm.c                 | 48 ++++++++++++++++++++++++++++++--
>>  3 files changed, 64 insertions(+), 3 deletions(-)
>>
>> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
>> index 3db1f19401..ce19ae6a04 100644
>> --- a/docs/system/arm/cpu-features.rst
>> +++ b/docs/system/arm/cpu-features.rst
>> @@ -204,6 +204,17 @@ the list of KVM VCPU features and their descriptions.
>>    the guest scheduler behavior and/or be exposed to the guest
>>    userspace.
>>
>> +``kvm-psci-version``
>> +  Set the Power State Coordination Interface (PSCI) firmware ABI version
>> +  that KVM provides to the guest. By default KVM will use the newest
>> +  version that it knows about (which is PSCI v1.3 in Linux v6.13).
>> +
>> +  You only need to set this if you want to be able to migrate this
>> +  VM to a host machine running an older kernel that does not
>> +  recognize the PSCI version that this host's kernel defaults to.
>> +
>> +  Current valid values are: 0.1, 0.2, 1.0, 1.1, 1.2, and 1.3.
>> +
>>  TCG VCPU Features
>>  =================
>>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 10f8280eef..60f391651d 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -1144,7 +1144,13 @@ static void arm_cpu_initfn(Object *obj)
>>       * picky DTB consumer will also provide a helpful error message.
>>       */
>>      cpu->dtb_compatible = "qemu,unknown";
>> -    cpu->psci_version = QEMU_PSCI_VERSION_0_1; /* By default assume PSCI v0.1 */
>> +    if (!kvm_enabled()) {
>> +        /* By default KVM will use the newest PSCI version that it knows about.
>> +         * This can be changed using the kvm-psci-version property.
>> +         * For others assume PSCI v0.1 by default.
>> +         */
>> +        cpu->psci_version = QEMU_PSCI_VERSION_0_1;
>> +    }
>>      cpu->kvm_target = QEMU_KVM_ARM_TARGET_NONE;
>>
>>      if (tcg_enabled() || hvf_enabled()) {
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index ded582e0da..5453460965 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -485,6 +485,28 @@ static void kvm_steal_time_set(Object *obj, bool value, Error **errp)
>>      ARM_CPU(obj)->kvm_steal_time = value ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
>>  }
>>
>> +static char *kvm_get_psci_version(Object *obj, Error **errp)
>> +{
>> +    ARMCPU *cpu = ARM_CPU(obj);
>> +
>> +    return g_strdup_printf("%d.%d",
>> +                           (int) PSCI_VERSION_MAJOR(cpu->psci_version),
>> +                           (int) PSCI_VERSION_MINOR(cpu->psci_version));
>> +}
>> +
>> +static void kvm_set_psci_version(Object *obj, const char *value, Error **errp)
>> +{
>> +    ARMCPU *cpu = ARM_CPU(obj);
>> +    uint16_t maj, min;
>> +
>> +    if (sscanf(value, "%hd.%hd", &maj, &min) != 2) {
>
> %hd is a signed value, so this will accept "-3.-5" I think ?
> Probably we want %hu.

Ugh, right.

> (If you agree I can just make this fix locally, no need for you to respin.)

That'd be great, Thanks!

Sebastian


