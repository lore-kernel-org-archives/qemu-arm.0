Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCD25CD5BDE
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Nov 2025 12:12:23 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJWBQ-00028d-AD; Thu, 13 Nov 2025 07:12:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vJW5F-0004re-PO
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 07:05:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sebott@redhat.com>) id 1vJW5B-0000hF-CF
 for qemu-arm@nongnu.org; Thu, 13 Nov 2025 07:05:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763035544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XXe30AvAgod46okaWpXEOT8NCg0lGaJYsjemG6fav+k=;
 b=B8N3GJZ3nbzZEMBzGdyrrlX4daH/hQuh2II95d5HD0zbn6zPEOVl7Cmrs3GW7MWGPrFthY
 ZLLoIv7GeO4GwH7uZEB5K4w9SKFaE5OmfcjFJSVdChaJJ4bRDYnb3keJjUDqRQ3BZltXrL
 tnA+Em5Jkr37LlxzHgypCG3cvle0pKc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-E8kf0eaFOna68WLuhiccug-1; Thu, 13 Nov 2025 07:05:42 -0500
X-MC-Unique: E8kf0eaFOna68WLuhiccug-1
X-Mimecast-MFC-AGG-ID: E8kf0eaFOna68WLuhiccug_1763035541
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-429c76c8a1bso557160f8f.0
 for <qemu-arm@nongnu.org>; Thu, 13 Nov 2025 04:05:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763035541; x=1763640341;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tI2/OYtW6mgwxijeu2yFHVnaEg8ys2MTvM8mvkzh7dM=;
 b=L+23UKNOCvnt105m3O0X3Y58ZKBaYoL74A69J+SEpJD27APkjB1fcC5PKOkSCbU/En
 D5aHcjE2e3dABhyupp2t4crtQGMLJi/UkWPStJplxyiy035uLnizpmULiCLmkmOTMo2U
 hqboQ4nIYKaxl5Ard5HRKh6jLIoW9xpF8xFxPLLTMz1qmxYe5qxpGDDnO7XXvrrXvLdQ
 IX7Jh1nlbgcrKFvQfO6V0BT1Wv5kZGyc/m/3oJklRG1Q9/KiCuXtoCj2u6nggMapkJaw
 h5YXBGWIW9N51NLRq1QiqjU3qliuxaWwg7RGSQ5pWzXI3yZ9lrsCpQgCo5moqADjeGoX
 zf9A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKl2BzzezLnTLKeku/cLEnKX5/v1ly1YC0mogkWU56DlSBm62UPycTa8tr8QPo5XiSl9fvo4tnUw==@nongnu.org
X-Gm-Message-State: AOJu0YxO37OVief4PMGN4mCY7ARK81Ds4FRh8fw8v+0x4lTqIy6RXNGe
 7AKq8NzB2JvL+AHg4gDWCwlU8v0nfsUzqqHcK34K+tzDzPFTwllKqkdvzBs4Emdh0f/i6nr5TBv
 FXjUUbZwmrpvtXEopM+3DOqpuvy/Iyh/3Rp7BeQa1PV/i3Cfzi7KIFg==
X-Gm-Gg: ASbGncsxEe40pi7hWyEwAPW6FIz47uR7P8TNAZxLM6H3l/iCrxoMdvC1xy/O0ZWdfzb
 hJJhjtq3bIZXsrynWVL2GqYQro7sHSvy4u+wrF799d5Ip5S7IPq9faQL1oAs8ovXRBemwjCGyrE
 H27C9+DxZ++nWe2DOD+X2odSgIVqwlrennW8K4Yyvsh833pcbMwxyxDLRsPQ7Eij3oUaGtD8oUa
 uv0AM08aUpx2gKglJRnoMsimP94CABIcumwnLhq8iognJmVN8Bv/HstSrTw74NkpUf+bOUEY/bN
 NfMFt7ZB/ltmXoJ/BqCcPaezd2BMvsdKKM5t9pAYxgosOgysMWbxS2Ig5iCpTIuzX+KSBgZL0ek
 A7D2xaL/q5ifY69y88ObnqQXTvhuOf7UVGOSx7hIfbeUIEE1E
X-Received: by 2002:a05:6000:1885:b0:42b:3680:3567 with SMTP id
 ffacd0b85a97d-42b4bb91b2cmr5895242f8f.18.1763035541153; 
 Thu, 13 Nov 2025 04:05:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE3IIBIBt8q03GbcoIy980NO1o7f47Eyz3eGrQw/lEHfvAJ2mJpS0tJ8SI1nFL6EYhPZo1J9g==
X-Received: by 2002:a05:6000:1885:b0:42b:3680:3567 with SMTP id
 ffacd0b85a97d-42b4bb91b2cmr5895217f8f.18.1763035540713; 
 Thu, 13 Nov 2025 04:05:40 -0800 (PST)
Received: from rh (p200300f6af131a0027bd20bfc18c447d.dip0.t-ipconnect.de.
 [2003:f6:af13:1a00:27bd:20bf:c18c:447d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f23a1asm3522001f8f.45.2025.11.13.04.05.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 04:05:40 -0800 (PST)
Date: Thu, 13 Nov 2025 13:05:39 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: Peter Maydell <peter.maydell@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, 
 kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 2/2] target/arm/kvm: add kvm-psci-version vcpu property
In-Reply-To: <d4f17034-94d9-4fdb-9d9d-c027dbc1e9b3@linaro.org>
Message-ID: <c082340f-31b1-e690-8c29-c8d39edf8d35@redhat.com>
References: <20251112181357.38999-1-sebott@redhat.com>
 <20251112181357.38999-3-sebott@redhat.com>
 <d4f17034-94d9-4fdb-9d9d-c027dbc1e9b3@linaro.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iMyFRi9GOQaIjjopne3RVwL3C22-e5vI7NOT2IADt4A_1763035541
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed;
 boundary="-1463806286-853068444-1763035540=:13840"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sebott@redhat.com;
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
---1463806286-853068444-1763035540=:13840
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

Hi Philippe,

On Wed, 12 Nov 2025, Philippe Mathieu-Daudé wrote:
> On 12/11/25 19:13, Sebastian Ott wrote:
>>  Provide a kvm specific vcpu property to override the default
>>  (as of kernel v6.13 that would be PSCI v1.3) PSCI version emulated
>>  by kvm. Current valid values are: 0.1, 0.2, 1.0, 1.1, 1.2, and 1.3
>>
>>  Note: in order to support PSCI v0.1 we need to drop vcpu
>>  initialization with KVM_CAP_ARM_PSCI_0_2 in that case.
>>
>>  Signed-off-by: Sebastian Ott <sebott@redhat.com>
>>  ---
>>    docs/system/arm/cpu-features.rst |  5 +++
>>    target/arm/cpu.h                 |  6 +++
>>    target/arm/kvm.c                 | 64 +++++++++++++++++++++++++++++++-
>>    3 files changed, 74 insertions(+), 1 deletion(-)
>
>
>>  diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>>  index 0d57081e69..e91b1abfb8 100644
>>  --- a/target/arm/kvm.c
>>  +++ b/target/arm/kvm.c
>>  @@ -484,6 +484,49 @@ static void kvm_steal_time_set(Object *obj, bool
>>  value, Error **errp)
>>        ARM_CPU(obj)->kvm_steal_time = value ? ON_OFF_AUTO_ON :
>>    ON_OFF_AUTO_OFF;
>>    }
>>
>>  +struct psci_version {
>>  +    uint32_t number;
>>  +    const char *str;
>>  +};
>>  +
>>  +static const struct psci_version psci_versions[] = {
>>  +    { QEMU_PSCI_VERSION_0_1, "0.1" },
>>  +    { QEMU_PSCI_VERSION_0_2, "0.2" },
>>  +    { QEMU_PSCI_VERSION_1_0, "1.0" },
>>  +    { QEMU_PSCI_VERSION_1_1, "1.1" },
>>  +    { QEMU_PSCI_VERSION_1_2, "1.2" },
>>  +    { QEMU_PSCI_VERSION_1_3, "1.3" },
>>  +    { -1, NULL },
>>  +};
>
>
>>  @@ -505,6 +548,12 @@ void kvm_arm_add_vcpu_properties(ARMCPU *cpu)
>>                                 kvm_steal_time_set);
>>        object_property_set_description(obj, "kvm-steal-time",
>>                                        "Set off to disable KVM steal
>>  time.");
>>  +
>>  +    object_property_add_str(obj, "kvm-psci-version",
>>  kvm_get_psci_version,
>>  +                            kvm_set_psci_version);
>>  +    object_property_set_description(obj, "kvm-psci-version",
>>  +                                    "Set PSCI version. "
>>  +                                    "Valid values are 0.1, 0.2, 1.0, 1.1,
>>  1.2, 1.3");
>
> Could we enumerate from psci_versions[] here?
>

Hm, we'd need to concatenate these. Either manually:
"Valid values are " psci_versions[0].str ", " psci_versions[1].str ", " ... 
which is not pretty and still needs to be touched for a new version.

Or by a helper function that puts these in a new array and uses smth like
g_strjoinv(", ", array);
But that's quite a bit of extra code that needs to be maintained without
much gain.

Or we shy away from the issue and rephrase that to:
"Valid values include 1.0, 1.1, 1.2, 1.3"

Since the intended use case is via machine types and I don't expect a
lot of users setting the psci version manually - I vote for option 3.

Opinions?

Sebastian
---1463806286-853068444-1763035540=:13840--


