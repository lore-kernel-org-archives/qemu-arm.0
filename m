Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9C7F4368A
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Apr 2026 10:28:20 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDgQi-0003dw-Sy; Fri, 17 Apr 2026 06:28:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wDgQg-0003dP-RQ
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 06:28:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wDgQd-0003jx-MS
 for qemu-arm@nongnu.org; Fri, 17 Apr 2026 06:28:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1776421682;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OYq8bQvFtWbNZOMLNispktNnkq9gxWfBHipo4BG3gMw=;
 b=G/kr4yJyWzVTpJSBofH0uEwJVVqQbOXNMF7hPp9Wo3utjdg0VL7t1cMpyblhQKSTSkgAaQ
 wh7HY4SQk9mjdu3ZtMeZjywvGUQJ60uRUQu0mwqtWlVGgzHoKEafwXBOtG3jFxP/Cqw/HT
 4Dw21nzuOpNW6ZIVGo9IOl5EzcRCFj4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-iz3-G5sQNdSzExsrrEMM9Q-1; Fri, 17 Apr 2026 06:28:00 -0400
X-MC-Unique: iz3-G5sQNdSzExsrrEMM9Q-1
X-Mimecast-MFC-AGG-ID: iz3-G5sQNdSzExsrrEMM9Q_1776421680
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-43d1dea12aaso568138f8f.1
 for <qemu-arm@nongnu.org>; Fri, 17 Apr 2026 03:28:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776421679; x=1777026479;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OYq8bQvFtWbNZOMLNispktNnkq9gxWfBHipo4BG3gMw=;
 b=kcDH9ka1lNZn+nNJ+iYT30XnFX10ZcQLX0a9ElesNNBcVrZ8SIIpuCzilheY3XakW6
 cdkeS+3L3dqkbTat/2uBm4iDtCg2+L7cBD2Q8bgFISOhmYGW8t68IFNeXGLuK0M9il44
 ZRNLgLVRQ1U7/ZZ8ouM1n0OsjmJkUEBzsAH3Jbi6iouUlLK0XjBTSE0K4b13hwUK9o3W
 S3yJOHyt9kYzaHmsvfyXG+k/z0QUjNHNAhRlAQCkay1VGJ3GfRL3eJ6WNkjwwbqoH1Yi
 XZ8CfiWc3JzScV6HN5kGwtzCv6hk6c3uNyC3CO35MDhpyBuPTmgGnU1PVWsAwvanloLW
 uaVQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+eJdYBiCntkefLgJJQteLw7X99NEZNTgHPFvyj3AT5Dbyayug/6+rcL0tGJbFVdddZ7mIlBi3Baw==@nongnu.org
X-Gm-Message-State: AOJu0YyEz40MtltwnA8/qjZSVAQjYIGTUBCJwLQlA5alb8gNF2c1UtlF
 8eAb8yzSztjRx5CF9Gy6KvyDERTJc5uf/PH4ufG0q3IEF0hhRswg+tp4kbbrfJnA/TOUKiOFlix
 PoQTtSx+EJFEt5N1cSVPHrpeahIFg+JRzch03OgcOuYcCU6dqN3PAQQ==
X-Gm-Gg: AeBDieuFE4XE86+CzeqXkGozbcM1aGD64P6VUau1Fe92aJErrLXvY9J4wDI1I6S1+ed
 hBT7anBiamzk2thaIMLUUvKgJQYs6rUiTQkV12R/ShoK3jEEB02HFwbgT5QGn+0uaqnqUhWXDCv
 cATZEGsCqwXy2nF+jMVZKeIUVn31QRl+tlrt4YZGJdG8/QJzaCXc47f6J8L+qZ2iRcdkGmZEpl8
 L/s4sS9YNogannHxMFXOIOi0ttl3XoYVPc6vxQC1Prw3yJQi7Go1o8l5+3VZ1IoJtww5hBRq8L0
 PsjEa51KrtkFGwvMpl77FLGo8EFuUSep09hn2YCycw3eGLZf+xWfnflv9icr2X3CdEeyudbi4kb
 jtdgpiA7+Sc6aghRuV5ntfWRfRGsZ7D5ORWAMhJqzpzk7GGS3/DuIeXBpBZMjZUSK8yjS8EP/+2
 k4ZLnc
X-Received: by 2002:a05:600c:a411:b0:488:bfc3:ef3 with SMTP id
 5b1f17b1804b1-488fb6e6f1fmr26415125e9.0.1776421679556; 
 Fri, 17 Apr 2026 03:27:59 -0700 (PDT)
X-Received: by 2002:a05:600c:a411:b0:488:bfc3:ef3 with SMTP id
 5b1f17b1804b1-488fb6e6f1fmr26414735e9.0.1776421679087; 
 Fri, 17 Apr 2026 03:27:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc140c82sm31627945e9.12.2026.04.17.03.27.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Apr 2026 03:27:58 -0700 (PDT)
Message-ID: <9639e97f-7ac3-45a2-87de-3228f534b248@redhat.com>
Date: Fri, 17 Apr 2026 12:27:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/6] target/arm/cpu64: Define cpreg migration tolerance
 for KVM_REG_ARM_VENDOR_HYP_BMAP_2
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 cohuck@redhat.com, sebott@redhat.com, peterx@redhat.com, philmd@linaro.org,
 alex.bennee@linaro.org
References: <20260306150302.203112-1-eric.auger@redhat.com>
 <20260306150302.203112-5-eric.auger@redhat.com>
 <CAFEAcA_Vd8Uw+Ptdbt+MhYVejcxfcQLGVS_nkJiaACTtftuepg@mail.gmail.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <CAFEAcA_Vd8Uw+Ptdbt+MhYVejcxfcQLGVS_nkJiaACTtftuepg@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: I4fooTZ-q-y3-wgBvyzIQwwMYsF58-1HBllAtW0dgCk_1776421680
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.54,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Peter,

On 4/10/26 2:22 PM, Peter Maydell wrote:
> On Fri, 6 Mar 2026 at 15:03, Eric Auger <eric.auger@redhat.com> wrote:
>> KVM_REG_ARM_VENDOR_HYP_BMAP_2 pseudo FW register is exposed
>> from v6.15 onwards. Backward migration from a >= v6.15 to an older
>> kernel would fail without cpreg migration tolerance definition
>> for this register.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Reviewed-by: Sebastian Ott <sebott@redhat.com>
>> ---
>>  target/arm/cpu64.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index 4cfddc6e8c0..abc6b78ef7d 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -833,6 +833,14 @@ static void kvm_arm_set_cpreg_mig_tolerances(ARMCPU *cpu)
>>                                       0, 0, ToleranceNotOnBothEnds);
>>      arm_register_cpreg_mig_tolerance(cpu, ARM64_SYS_REG(3, 0, 10, 2, 3),
>>                                       0, 0, ToleranceNotOnBothEnds);
>> +
>> +    /*
>> +     * KVM_REG_ARM_VENDOR_HYP_BMAP_2 pseudo FW register is exposed
>> +     * from v6.15 onwards. Backward migration from a >= v6.15 to an older
>> +     * kernel would fail without cpreg migration tolerance definition
>> +     */
>> +    arm_register_cpreg_mig_tolerance(cpu, KVM_REG_ARM_FW_FEAT_BMAP_REG(3),
>> +                                     0, 0, ToleranceNotOnBothEnds);
>>  }
> If I understand the intention of this pseudoregister correctly, it's
> for userspace control of what firmware features KVM exposes to the
> guest. In that regard it's a bit like the KVM_REG_ARM_PSCI_VERSION
correct. 
> register, and as with that register I don't think the right
> approach is "disregard any differences on migration". If we
> exposed firmware feature X to the guest on the source then we
> need to also expose it to the guest on the destination, because
> it might be relying on it, and we shouldn't permit migration to
> a destination kernel that can't implement X.
Effectively if the source enabled those BMAP_2 features and we migrate
to a dest that does not support those services, it looks wrong.
>
> But I'm also not entirely sure what the nature of the mismatch
> here is: https://docs.kernel.org/virt/kvm/arm/fw-pseudo-registers.html
> says both
> "By default, these registers are set with the upper limit of the
> features that are supported"
> but also that for the BMAP_2 bits that
> "This is reset to 0".
Looking at kernel's arch/arm64/kvm/hypercalls.c

void kvm_arm_init_hypercalls(struct kvm *kvm)
{
        struct kvm_smccc_features *smccc_feat = &kvm->arch.smccc_feat;

        smccc_feat->std_bmap = KVM_ARM_SMCCC_STD_FEATURES;
        smccc_feat->std_hyp_bmap = KVM_ARM_SMCCC_STD_HYP_FEATURES;
        smccc_feat->vendor_hyp_bmap = KVM_ARM_SMCCC_VENDOR_HYP_FEATURES;

        mt_init(&kvm->arch.smccc_filter);
}

so effectively the reset value is 0 for smccc_feat->vendor_hyp_bmap_2
(BMAP_2) while for original BMAP it is set to 
#define KVM_ARM_SMCCC_VENDOR_HYP_FEATURES                       \
        GENMASK(KVM_REG_ARM_VENDOR_HYP_BMAP_BIT_COUNT - 1, 0)

So the right version is: 

"This is reset to 0"


>
> So does the register reset to 0 such that all we need to handle
> is "allow a source without the register as if it is zero, and
> allow a source with the register even if the destination doesn't
> have the register as long as the value is zero" ? Or is the
Yes that looks the right statement: 
- allow a source without the register as if it is zero
- allow a source with the register even if the destination doesn't have
the register as long as the value is zero This would require another
type of MigTolerance then.
My previous reasoning was that qemu currently does not mangle with
BMAP_2 settings yet,
this will come with Shameer's series: 

[RFC PATCH RESEND 0/4] hw/arm/virt: Add support for Target
Implementation CPUs <https://lore.kernel.org/qemu-devel/20250801074730.28329-1-shameerkolothum@gmail.com/#r>
https://lore.kernel.org/qemu-devel/20250801074730.28329-1-shameerkolothum@gmail.com/#r

But I agree this is not future proof.

Thank you for the detailed review!

Eric


> "reset to 0" bit wrong, and in fact the kernel defaults to
> these bits being set, so we need something like the handling
> of kvm-psci-version where the user can suppress the features
> they need to give a "lowest common denominator" among the
> kernels they want to migrate between ?
>
> thanks
> -- PMM
>


