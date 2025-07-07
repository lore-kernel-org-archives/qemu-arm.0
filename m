Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp2653544dyc;
        Mon, 7 Jul 2025 02:31:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+ybFZ7+RlZhiSfCySJNSzBU7s0KDRJPbnkN9Shu+kalmO2AvTMDwe+e8Uij0fpCEnJN4DYygH0NrZYw==@linaro.org
X-Google-Smtp-Source: AGHT+IFsR0AyKDC3qIn/EOj3d+nIFHGo3B4nHJthqMQaJRekUJt5uQnnA2+Jk7ilw+ARdr42oi0W
X-Received: by 2002:a05:620a:27cc:b0:7d4:3c05:6306 with SMTP id af79cd13be357-7d5dcd24396mr1715758485a.57.1751880660720;
        Mon, 07 Jul 2025 02:31:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751880660; cv=none;
        d=google.com; s=arc-20240605;
        b=K8kyT63wue3VEs7qoowDh+UVK+zT5CB+1JdqO7H24nkXqMYsgODD1er0OHxPVFkCEk
         AJaWpQCJFtmkKihPPsaHE9J/sESYO3TqGVyrrf1HeO61HKHvfeX8aJPa5e2aqYGJzeph
         HXKirzJgVmva4NVE6TpTgzMhO5LZMSbyUIfJu4lPd2XmWqvgD2cf1vy6l4svZS69aXYq
         5S+JcMUJ+XQ6tg174Y2be7l/3dTCVmiYhAW3DfeG33AAyMkl608I4X5qWp+iXegK6yNS
         s1epyYTq2R44tB4ZGscAphz2wG692jEwII/jblJZ2cUiF7mHpXKaBotDUL/28PUvQmw2
         WPMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=1bEVeAiJoPDALZpo/EPEPCbrdt1HWzqoldkLgwyBifY=;
        fh=NGRRQZ1nkpFgo6xssoW6LVmbG6mfrZsfNnXJNrv19SI=;
        b=R5deeT9JFYE55sTPtxhIhUxsw5IbeTNxjcl+ze1dnCx/kUeTHLmv1QdqqjNxm7PBbW
         UBuA5Qd6Tv+2CpROtWRgmc32lknJ0wRsofqH1CTgZaa50b/x8C/O6gk2WSeyZYiD5GV+
         8Pj9uVwB2m0BdH6W+ItbhWMHBLZaluz73JDQlbz3Al9SRWUfWZ7/LJJal/B3G3q5KgPa
         j2CtVRJxXJAp0LaCXz/D3a/WSSi+yjZHqZAkzxWpMojQxIZjtI5iqn2LIFy0uLv3V4YL
         ZMhSR0geoIat7zoTD0fWe+3ofayvZoDY1nEJ+yCzakFHcBa2Oh+MclBml/evJFRmKkMS
         4/Ow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iL0AEVNX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d5dbeb9599si780046285a.324.2025.07.07.02.31.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jul 2025 02:31:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iL0AEVNX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1uYiBU-0007oO-WA; Mon, 07 Jul 2025 05:30:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uYiBQ-0007n1-Ij
 for qemu-devel@nongnu.org; Mon, 07 Jul 2025 05:30:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uYiBN-0005au-0U
 for qemu-devel@nongnu.org; Mon, 07 Jul 2025 05:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751880638;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1bEVeAiJoPDALZpo/EPEPCbrdt1HWzqoldkLgwyBifY=;
 b=iL0AEVNXwerJFDCByZnOqw7QuEMypf/SA+D+RCnx3gyHkUKnQdIolPHH5JL6Xv55qYr451
 BA5M5oIW2xycZypMHoEMeX9Lt7hUk52Qxx1lIDA+zmt68CbG7gMf5ECW3QUP0wQVmuTaQl
 mLmP+oswaDta7QIYC3KEnee9f8m2W94=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-dLpzCy5yOECtZJHcEefv5g-1; Mon, 07 Jul 2025 05:30:36 -0400
X-MC-Unique: dLpzCy5yOECtZJHcEefv5g-1
X-Mimecast-MFC-AGG-ID: dLpzCy5yOECtZJHcEefv5g_1751880635
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3b39cb4ca2eso1096797f8f.3
 for <qemu-devel@nongnu.org>; Mon, 07 Jul 2025 02:30:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751880635; x=1752485435;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1bEVeAiJoPDALZpo/EPEPCbrdt1HWzqoldkLgwyBifY=;
 b=tTggea50o91R9hQGeEIcXey9OgkrsU5kKlKyUDneGIP2bp5RjYi8QLgPHFEfJaNxNb
 BewnrOe2ejERCX94R8Zr5U4gcWUg/8bXQQYreDY8YavuOGrKFK+XAd7iNb0SSullfmik
 N8KT8I1ueiSs6hHIOFOn4FeI+Euvg9m/xUTYb89/WSecMLKV4iipnatllTWk9sidPIyn
 mWwSjhvogxw/v8R2o2yw0jTLyLGCCTwBhChGEB38kad2TEo9q43y54qQYDg+p+Rty2uS
 1iSdGkeC8sD0MWwofnwUpop1Lu1/P8Q9oQBPvkgCh8p3z+AVfgjcOx30/zWv3non0iRO
 B24Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEXoJGrNnPhlzJGiG4YVbyWoeBpl9NnxyG9kFoUV1V+X1CLm8n/D0XXlq3gWZuIuIjgnUPyJMNq2Sf@nongnu.org
X-Gm-Message-State: AOJu0YzlIr3BvLPkmSj7C8Wpr7y5U28Q6Jzja9501CKKFA5Uz4cbwdfF
 3tS9kl5VaqsYubMMGxneNNjWWdR3qSERpV45aQb4Eewcn1JupUUxVf8uGcgMfOsbm4DsIWuSdIh
 ys89PZ335sWVZWYU60QW8dqaKIluSFr9LzFb/AyRNjSD/vwxkJ/tMDHV6
X-Gm-Gg: ASbGncvPzocXPcfzw3JpXyT1h+984Z6PH3KDncLZJWUONQFjWKsH0KoSL+0eLOxK7gP
 PusqX/82IexwaeWQmpAHwTKpzR9fUWMHZYUJMFsMIEtdnulNCZ+5JUOUuLi4Op2lrnlXfabUeFW
 uvVFAkvXCMQldJTtp+Z9O5RZYxXrU6MPCmKV20RI9zgeZdYg+lzPv9eLUB/Oy9MZTDVnvPLvUmZ
 g6eeN6EvxXuYyp7d0gYN0lmOtfWSpZEhtMEugqB0ycqTJK9Fig/tv6U5l/224P1UtwiSFLFlOP6
 WzUj3EkMaLuK8+dboTnyDSHmFywJQUTd0WvE3Bsmy8a/oh2jv+cAKZWMsrbvIJW8hqzcNQ==
X-Received: by 2002:a05:6000:40df:b0:3a3:7987:945f with SMTP id
 ffacd0b85a97d-3b4964ee23emr9838554f8f.57.1751880635125; 
 Mon, 07 Jul 2025 02:30:35 -0700 (PDT)
X-Received: by 2002:a05:6000:40df:b0:3a3:7987:945f with SMTP id
 ffacd0b85a97d-3b4964ee23emr9838524f8f.57.1751880634661; 
 Mon, 07 Jul 2025 02:30:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b161e8fcsm108249795e9.7.2025.07.07.02.30.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jul 2025 02:30:33 -0700 (PDT)
Message-ID: <9c78f7c0-88ce-4c4d-b6c0-5b77b4d83367@redhat.com>
Date: Mon, 7 Jul 2025 11:30:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/4] hw/arm/virt: Allow virt extensions with KVM
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 miguel.luis@oracle.com, richard.henderson@linaro.org, maz@kernel.org,
 gkulkarni@amperecomputing.com, gankulkarni@os.amperecomputing.com,
 hi@alyssa.is
References: <20250702163115.251445-1-eric.auger@redhat.com>
 <20250702163115.251445-5-eric.auger@redhat.com>
 <CAFEAcA9hhdwHNrBfEqO4GD6kSb3Efcw-Rztq=CqvcOGMG3+z6A@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA9hhdwHNrBfEqO4GD6kSb3Efcw-Rztq=CqvcOGMG3+z6A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mAVbmWtXwiLb

Hi Peter, Marc,

On 7/4/25 2:22 PM, Peter Maydell wrote:
> On Wed, 2 Jul 2025 at 17:31, Eric Auger <eric.auger@redhat.com> wrote:
>> From: Haibo Xu <haibo.xu@linaro.org>
>>
>> Up to now virt support on guest has been only supported with TCG.
>> Now it becomes feasible to use it with KVM acceleration.
>>
>> Also check only in-kernel GICv3 is used along with KVM EL2.
>>
>> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
>> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>
>> ---
>> v6 -> v7:
>> - rebase on top of "hw/arm/virt: Make EL2 accelerator check an
>>   accept-list". I dared to keep Richard's R-b though.
>>
>> v2 -> v3:
>> - check gic version/in-kernel implementation when kvm el2 is set (Peter)
>>
>> v1 -> v2:
>> - fixed test ordering: virt && ((kvm && !kvm_el2) || hvf) [Richard]
>> - tweeked the commit title & message
>> ---
>>  hw/arm/virt.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>> index 550a272fbb..1c0a2c43c4 100644
>> --- a/hw/arm/virt.c
>> +++ b/hw/arm/virt.c
>> @@ -792,6 +792,13 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
>>      default:
>>          g_assert_not_reached();
>>      }
>> +
>> +    if (kvm_enabled() && vms->virt &&
>> +        (revision != 3 || !kvm_irqchip_in_kernel())) {
>> +        error_report("KVM EL2 only is supported with in-kernel GICv3");
> "is only supported"
OK
>
>> +        exit(1);
>> +    }
>> +
>>      vms->gic = qdev_new(gictype);
>>      qdev_prop_set_uint32(vms->gic, "revision", revision);
>>      qdev_prop_set_uint32(vms->gic, "num-cpu", smp_cpus);
>> @@ -2211,7 +2218,8 @@ static void machvirt_init(MachineState *machine)
>>          exit(1);
>>      }
>>
>> -    if (vms->virt && !tcg_enabled() && !qtest_enabled()) {
>> +    if (vms->virt && !(kvm_enabled() && kvm_arm_el2_supported()) &&
>> +                     !tcg_enabled() && !qtest_enabled()) {
>>          error_report("mach-virt: %s does not support providing "
>>                       "Virtualization extensions to the guest CPU",
>>                       current_accel_name());
> Have you tested doing a VM migration of a KVM with EL2 setup?
Yes I did. Marc fixed some save/restore bugs in the past and I was able
to migrate after this fix.

Now I would lie if I'd tell you it works well. It is extremely slow to
converge. Usually you get rcu stalls in the L2 guest on source too.


> I suppose the system registers probably generally Just Work
> via the sysreg GET/SET_ONE_REG API, but won't the in-kernel
> GICv3 have extra state that we need to migrate in
> hw/intc/arm_gicv3_kvm.c ?
Do you see some specific registers/resources that would need attention?

Otherwise I can put a migration blocker until we spend more time
analyzing migration slowness

What do you think?

Eric
>
> thanks
> -- PMM
>

