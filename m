Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2616FCCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 11:03:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDhTW-00086x-NK; Tue, 28 Oct 2025 07:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vDhT6-00083b-8e
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:02:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vDhSy-0007Zs-Du
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761649329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nxmOHwHxmZMLpzf1uqdrSlEJ/+f2PvodAb00eauIdqA=;
 b=f4h9Be+pZWvQ8Qn3g80hCJDVQNL0+yZY7+AQmFDiFqRqsZkeQ74K90q8pmaeniQUz+NnZw
 mQuhhs5vx225NBy8QKHUfw+zUC0tsks2B211DyhE2Ze9LtSshx8GVumbIXjJcVVH3x0gMP
 kF35tSXjD9kLJP/1Z+5167bi6bWhV2E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-wUtiq4fpM_KwOoY8t_Fqdg-1; Tue, 28 Oct 2025 07:00:57 -0400
X-MC-Unique: wUtiq4fpM_KwOoY8t_Fqdg-1
X-Mimecast-MFC-AGG-ID: wUtiq4fpM_KwOoY8t_Fqdg_1761649256
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-475ddf7e925so4355415e9.2
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 04:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761649255; x=1762254055;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nxmOHwHxmZMLpzf1uqdrSlEJ/+f2PvodAb00eauIdqA=;
 b=ejjDMLtsL379nf2ggL/tKGLnS9R8rIRcn9QCLEwivhHXaEs/HekIS7kXgAvDtXgrYR
 CZnaNz9a4BNSmBd2znk4kleK2m0Qj9zjON03+8Bkt21gx+GtfCjmQ9h9Y+QBNWs3XmPd
 iVUxSXS/9P4hSyCMyAi6QiSDmcl+dOperoEXCr77OF3rvVTVGyy/DXcWOax4hPg+RJzT
 K0Ib4tqrrAPSDccjKmbYmJfaiOPY+sfsqON5rCtQdvBVtW8qVG0h/BvjTSma8fFnXB6S
 +EwHfbNgrtteUvuDsY4SdlGNqAOjC7a1mboxA4N11o4NdOufFF5HE2DBt2wLsIjeBoIW
 AYuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTTuUw25Yz30fpij3yQ7UunqcAJAxkZ3EBNucLYlISFmLIZbEnHDceWDRF3kH9GOxbcsi3XLEBDw==@nongnu.org
X-Gm-Message-State: AOJu0Yy7av2X724MpH49ThHKd9VuC/nvMrzT7akQEwbMYKiQIMz9Dncx
 04P2/jspmfgd5olPKGZaLPzGXfyQ8v1RiJlBW4lXjwK/TaFB1bqiFKwAro/7wZZKizNjLdihfFr
 9LuqSS4eXIeY6z9K2mGGV6y/1SQow031oCpLidbm4cYHVWOxn/tn4vA==
X-Gm-Gg: ASbGncs7Cn0s5q36+nIsFv4ESazlCn7eMC2bs0uxhPGdY1NAI9kaXlsJG+CyVijJTT5
 xcAlolOyLwiN+ylCdgxu29kaCW+xGBqj29gMOLne7icbEPeXMVO5VUmcvL+XGvfhXyUIbHU+VKZ
 l1FpfzBypC1L4th28TssG8eCWq/Ye2S8o/OEmiZzE96D3hZDbap+QdEe9nzPmlcdj9vSJthU51+
 ZgHq9pcuBAru3EdGDhkSxNFNjEER4AoiPBgNSI7LihIIrfkzko+RCB6silDOmwxrMrWjUO79QLi
 HTQ/ke0SSvFlz9vUjPZFXL0HUVFAPMXG+M5zZjXccWgpyirQ5aub2T/LikbT26Q4Mebvne7uYD/
 tYGLl2vCzLtCz9paULCUruhE43qvhXWMVmpKn9SEHJ+K7PhVZ
X-Received: by 2002:a05:600c:3493:b0:46f:b42e:edce with SMTP id
 5b1f17b1804b1-47717e67cd3mr23267005e9.39.1761649255552; 
 Tue, 28 Oct 2025 04:00:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFVAEQZBrj6XxR1esAB3vvNknSrAGxc5wuX0loLWB2sKQiYoi+ajmuIkxNcYXcTJ8iSZx7ug==
X-Received: by 2002:a05:600c:3493:b0:46f:b42e:edce with SMTP id
 5b1f17b1804b1-47717e67cd3mr23266575e9.39.1761649255026; 
 Tue, 28 Oct 2025 04:00:55 -0700 (PDT)
Received: from rh (p200300f6af131a0027bd20bfc18c447d.dip0.t-ipconnect.de.
 [2003:f6:af13:1a00:27bd:20bf:c18c:447d])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd48942dsm192647185e9.4.2025.10.28.04.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 04:00:54 -0700 (PDT)
Date: Tue, 28 Oct 2025 12:00:53 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Subject: Re: [PATCH 2/2] target/arm/kvm: add kvm-psci-version vcpu property
In-Reply-To: <CAFEAcA-urFX=V7kuRA3cRik7PifFQER5eoXC_CZ2jKg7OZz9iA@mail.gmail.com>
Message-ID: <ba03c952-e567-eb2b-f4c8-b1818ee127d6@redhat.com>
References: <20250911144923.24259-1-sebott@redhat.com>
 <20250911144923.24259-3-sebott@redhat.com>
 <CAFEAcA-urFX=V7kuRA3cRik7PifFQER5eoXC_CZ2jKg7OZz9iA@mail.gmail.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kXdqecddVHV74iTPo-o25NcXEcMPKbFLKj74n3PcNY8_1761649256
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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

On Mon, 27 Oct 2025, Peter Maydell wrote:
> On Thu, 11 Sept 2025 at 15:49, Sebastian Ott <sebott@redhat.com> wrote:
>>
>> Provide a kvm specific vcpu property to override the default
>> (as of kernel v6.13 that would be PSCI v1.3) PSCI version emulated
>> by kvm. Current valid values are: 0.1, 0.2, 1.0, 1.1, 1.2, and 1.3
>>
>> Signed-off-by: Sebastian Ott <sebott@redhat.com>
>> ---
>>  docs/system/arm/cpu-features.rst |  5 +++
>>  target/arm/cpu.h                 |  6 +++
>>  target/arm/kvm.c                 | 70 +++++++++++++++++++++++++++++++-
>>  3 files changed, 80 insertions(+), 1 deletion(-)
>>
>> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
>> index 37d5dfd15b..1d32ce0fee 100644
>> --- a/docs/system/arm/cpu-features.rst
>> +++ b/docs/system/arm/cpu-features.rst
>> @@ -204,6 +204,11 @@ the list of KVM VCPU features and their descriptions.
>>    the guest scheduler behavior and/or be exposed to the guest
>>    userspace.
>>
>> +``kvm-psci-version``
>> +  Override the default (as of kernel v6.13 that would be PSCI v1.3)
>> +  PSCI version emulated by the kernel. Current valid values are:
>> +  0.1, 0.2, 1.0, 1.1, 1.2, and 1.3
>> +
>>  TCG VCPU Features
>>  =================
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index c15d79a106..44292aab32 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -974,6 +974,12 @@ struct ArchCPU {
>>       */
>>      uint32_t psci_version;
>>
>> +    /*
>> +     * Intermediate value used during property parsing.
>> +     * Once finalized, the value should be read from psci_version.
>> +     */
>> +    uint32_t prop_psci_version;
>> +
>>      /* Current power state, access guarded by BQL */
>>      ARMPSCIState power_state;
>>
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index 6672344855..bc6073f395 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -483,6 +483,59 @@ static void kvm_steal_time_set(Object *obj, bool value, Error **errp)
>>      ARM_CPU(obj)->kvm_steal_time = value ? ON_OFF_AUTO_ON : ON_OFF_AUTO_OFF;
>>  }
>>
>> +static char *kvm_get_psci_version(Object *obj, Error **errp)
>> +{
>> +    ARMCPU *cpu = ARM_CPU(obj);
>> +    const char *val;
>> +
>> +    switch (cpu->prop_psci_version) {
>> +    case QEMU_PSCI_VERSION_0_1:
>> +        val = "0.1";
>> +        break;
>> +    case QEMU_PSCI_VERSION_0_2:
>> +        val = "0.2";
>> +        break;
>> +    case QEMU_PSCI_VERSION_1_0:
>> +        val = "1.0";
>> +        break;
>> +    case QEMU_PSCI_VERSION_1_1:
>> +        val = "1.1";
>> +        break;
>> +    case QEMU_PSCI_VERSION_1_2:
>> +        val = "1.2";
>> +        break;
>> +    case QEMU_PSCI_VERSION_1_3:
>> +        val = "1.3";
>> +        break;
>> +    default:
>> +        val = "0.2";
>> +        break;
>> +    }
>> +    return g_strdup(val);
>> +}
>> +
>> +static void kvm_set_psci_version(Object *obj, const char *value, Error **errp)
>> +{
>> +    ARMCPU *cpu = ARM_CPU(obj);
>> +
>> +    if (!strcmp(value, "0.1")) {
>> +        cpu->prop_psci_version = QEMU_PSCI_VERSION_0_1;
>> +    } else if (!strcmp(value, "0.2")) {
>> +        cpu->prop_psci_version = QEMU_PSCI_VERSION_0_2;
>> +    } else if (!strcmp(value, "1.0")) {
>> +        cpu->prop_psci_version = QEMU_PSCI_VERSION_1_0;
>> +    } else if (!strcmp(value, "1.1")) {
>> +        cpu->prop_psci_version = QEMU_PSCI_VERSION_1_1;
>> +    } else if (!strcmp(value, "1.2")) {
>> +        cpu->prop_psci_version = QEMU_PSCI_VERSION_1_2;
>> +    } else if (!strcmp(value, "1.3")) {
>> +        cpu->prop_psci_version = QEMU_PSCI_VERSION_1_3;
>
> We already have six values here and it's not implausible
> we might end up with more in future; maybe we should make the
> mapping between string and constant data-driven rather
> than having code written out longhand in the get and set
> functions?

Yes, sure. I'll send out a V2.

Thanks!
Sebastian


