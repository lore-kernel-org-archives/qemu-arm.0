Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED7DC71130
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 16:04:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYoJw-0002TD-T1; Mon, 07 Jul 2025 12:03:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uYo63-0002wM-VD
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 11:49:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uYo61-0006Ht-Ao
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 11:49:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751903371;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u4kfDPJj48M0hWmEQ/7VvCIaZlwIKeOHROkeaDqCJO0=;
 b=SZS4Jh9l/GIfNvV9ilQcvK9rYdswedHUvoJSdLheNRpXpLMMrK7cnfpmBc6g87On4xZ5AL
 ecJMhacHmVLOIz3nuDZGffWA1ldZyqQlC9jALmRvKtlErx1RdEFgL6BsYOjAT8Ff6azCOC
 tw6aNOcFqQYDzeGTZtVq44FGVa5rv/A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-e0mgRHzSPzmEF0qbcVrYzg-1; Mon, 07 Jul 2025 11:49:29 -0400
X-MC-Unique: e0mgRHzSPzmEF0qbcVrYzg-1
X-Mimecast-MFC-AGG-ID: e0mgRHzSPzmEF0qbcVrYzg_1751903369
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a50049f8eeso1503066f8f.3
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 08:49:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751903368; x=1752508168;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u4kfDPJj48M0hWmEQ/7VvCIaZlwIKeOHROkeaDqCJO0=;
 b=iAy7kMtCAJB/ImEc8Sye48U/ZDuH30XbyWz4WcImZrPr5wpzWQwlLXbjUe9osEZVMu
 9TVeyd5MGH1Y+TpyxLcvmZAhX9lXSzx0cuUMoylKcE7NPom2pESuZW3dyoNL961fWKM5
 kZ1gQ0F14DV2orlbaRJhELZQrJxCIv2Wi1V6JDhVwSJENobADJV/a4FCV/Zdz0j+BiGD
 D80VAgWj2ZuV5VaT7iuhLy3XoOSsd/uXOADmBovpUyVOJYRNjXu5IEkgtBA9Uv5hM+qy
 vV5GEnS4/e+9pYgzWt8EqwUX9uajjQGuzVPMIE27FjRI+5AfOuaXRnLni9J+YFwJJuT3
 JGLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXR4grQN7o8dtPdS0Cg8dVC5V1Lt/+L5OH05A4fE/VPkH2ZO9+uyBbCkIp8LzjOHMzIptxZqRIgZQ==@nongnu.org
X-Gm-Message-State: AOJu0YxFABIaKRTB/a8ZEjYZcDqPTggfjHKFIvuEFQez8L7r9yeuAlyJ
 pm3kS/zjSrSXqAhoudKh/yc3WEn7+nZrY8I8Wm4kSB0Q6z/PJNzv/Gg9R+00nDPDlZahOn2d42L
 3hroMWf2t7lPQX8/Cxj1goDN3Af0yAerCb7foBWDsq0tONmnuagvJ3Q==
X-Gm-Gg: ASbGncuhQygAxWRXpBA+NreKt/vgFVgvcCdzEgUTNjka5z8mgAWBJHOd0GJnRLPa8Ks
 hKmkofbzDqYZVtyie/niGsFsuxWdR2OfB289Oq8MdP6E7hvr7PBRcfdnWRwu5Qo04R/E4/goHQU
 UwUvw2XCpwHYM28xqAN0LmKsoCzB8jFna1mUu7nsLGP4/Jkdpp/X1D4BYQrQK1VKXCoZjMKhxio
 BjzXqPuGdNwJZVRjUCASP1wOLQ8PzFkp4zZ77Hg/vHzLrlTtJT/hsGg7SXe1dDYs1gLQoBET5jb
 e6TOxzAwDX1hASQ1FPvrT8t4f9Aqu8pa/WsqgpP8KsU2oaThJe9DjlviS6R8+rKM39pxBQ==
X-Received: by 2002:a05:6000:4008:b0:3a4:dc32:6cbc with SMTP id
 ffacd0b85a97d-3b49aa186f4mr6743185f8f.20.1751903368500; 
 Mon, 07 Jul 2025 08:49:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFgLqmtk/PhuU0Q7kcre4CnRg/iMogk4sjW2ZIZk5tzC1rBTtW3vULQgjY1/dDM5GnfCjgHiA==
X-Received: by 2002:a05:6000:4008:b0:3a4:dc32:6cbc with SMTP id
 ffacd0b85a97d-3b49aa186f4mr6743155f8f.20.1751903368065; 
 Mon, 07 Jul 2025 08:49:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9bea4a9sm142820715e9.37.2025.07.07.08.49.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 08:49:27 -0700 (PDT)
Message-ID: <0027ad47-173e-495b-bcca-363b43851d7b@redhat.com>
Date: Mon, 7 Jul 2025 17:49:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/4] hw/arm/virt: Allow virt extensions with KVM
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 miguel.luis@oracle.com, richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com,
 hi@alyssa.is
References: <20250707131530.1141759-1-eric.auger@redhat.com>
 <20250707131530.1141759-5-eric.auger@redhat.com>
 <CAFEAcA9VxC6CXK+iFFAyktuX1jsJ=znpamkvG5TuwowLxdWSsA@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA9VxC6CXK+iFFAyktuX1jsJ=znpamkvG5TuwowLxdWSsA@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IZ4K2ccdw-1gOnWgY-1CSE2Ea76yS28mgEA_RCc7G-Y_1751903369
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Peter,

On 7/7/25 3:29 PM, Peter Maydell wrote:
> On Mon, 7 Jul 2025 at 14:16, Eric Auger <eric.auger@redhat.com> wrote:
>> From: Haibo Xu <haibo.xu@linaro.org>
>>
>> Up to now virt support on guest has been only supported with TCG.
>> Now it becomes feasible to use it with KVM acceleration.
>>
>> Check neither in-kernel GICv3 nor aarch64=off is used along with KVM
>> EL2.
>>
>> Also add a migration blocker in case KVM NV is set as some
>> GIC registers are most probably not properly saved/restored:
>> ICH_AP*R<n>_EL2, ICH_EISR_EL2, ICH_ELRSR_EL2, ICH_HCR_EL2,
>> ICH_LR<n>_EL2, etc etc.
>
>> +    if (vms->virt) {
>> +        if (!(kvm_enabled() && kvm_arm_el2_supported()) &&
>> +            !tcg_enabled() && !qtest_enabled()) {
>> +            error_report("mach-virt: %s does not support providing "
>> +                         "Virtualization extensions to the guest CPU",
>> +                         current_accel_name());
>> +            exit(1);
>> +        }
>> +        if (kvm_enabled()) {
>> +            Error *kvm_nv_migration_blocker = NULL;
>> +
>> +            error_setg(&kvm_nv_migration_blocker,
>> +                       "Live migration disabled due to KVM nested virt enabled");
>> +            if (migrate_add_blocker(&kvm_nv_migration_blocker, NULL)) {
>> +                error_free(kvm_nv_migration_blocker);
>> +                return;
>> +            }
>> +        }
>>      }
> I think a better place to set the migration blocker is in
> the GIC code itself (maybe in kvm_arm_gicv3_realize() ?) : we
> want to disable migration for any setup with a GICv3 + KVM + EL2,
> not just the virt board.
OK
>
> I also don't understand why we don't hit the assert
> in gicv3_init_cpuif() that checks that if we're not TCG
> or qtest accelerators then the CPU doesn't have EL2 or EL3.
> It looks to me from reading the code that we ought to go
> through that function in the KVM case.

with kvm gicv3 we enter
kvm_arm_gicv3_realize/arm_gicv3_common_realize

but we don't enter arm_gic_realize which calls gicv3_init_cpuif Thanks Eric
>
> The rest of the series looks OK to me.
>
> thanks
> -- PMM
>


