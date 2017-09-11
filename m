Received: by 10.223.172.38 with SMTP id v35csp5784108wrc;
        Mon, 11 Sep 2017 09:39:30 -0700 (PDT)
X-Received: by 10.36.184.129 with SMTP id m123mr13548604ite.137.1505147969859;
        Mon, 11 Sep 2017 09:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505147969; cv=none;
        d=google.com; s=arc-20160816;
        b=f2tL6pf7MVgOpaGyhdpEqmOtuOSkF/9pxg2KjLafbfufUVBwrrf0UfykZBzdk0xkEd
         QXNrcK+fIzHBqH5RfYYKIB5qPhhtibxkZ4751mwqRmNGGqiia84Mu+xf/i4S7xWgg9pz
         eZ1dNs5XaQ9M/H6FCrjRH3gwGaTLFJE17KEnFRLiGNkkJpcBseBoGInnaF2sYYJuEWKe
         FWef0XMGHOMgJuASA30JmobWrag8qQonnxQryqTJ8cA0xPgyLTmluPr4qTaVOeItOE/Z
         oo2UMW1fhOdzI+C9DwQAb39d62qkNwZKAxpvYHntEE2njXdPjIS5kpCBb2khbm/1zABH
         4sqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Qvoxh9FFb2Risv+2sw+uH2KhFeFoWhgjod38Ag7t/eQ=;
        b=i21r7iqRPoGw+/WIMQjbULfn9135uK9ahND5U2TQ36wFapNI9R/GltH/xTOsjGLXlE
         RCesG8NoShgYleXXFt43h/kVUJzUXCaOZ752eJo87G12Lh67aa86znWtRTM/rb5JiRkz
         BzTzEHdZ1Hs1q+ddJtzMhJTJ7zHFk3GrZCk/oAUdxMiYJKX0tBbwbzLMIZyQdqd1FbCa
         IV9Tn7R/bjQ4r2wXDTXzXZl6mhBt+ADRT+Yq32yowyR31PQUWfXcIE6bAp45GAx/pUx3
         phV8g+uUpzPD+9DxepVDXbfVybTKlwQmav55swwS4MmO6eqTGO0RbN8/9kd1Wtj9qtH0
         f0Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ANAx2AAZ;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <linux-kernel-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id f1si9192402ith.33.2017.09.11.09.39.29;
        Mon, 11 Sep 2017 09:39:29 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ANAx2AAZ;
       spf=pass (google.com: best guess record for domain of linux-kernel-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=linux-kernel-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752192AbdIKQj1 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 26 others); Mon, 11 Sep 2017 12:39:27 -0400
Received: from mail-wm0-f51.google.com ([74.125.82.51]:46870 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752055AbdIKQjZ (ORCPT
        <rfc822;linux-kernel@vger.kernel.org>);
        Mon, 11 Sep 2017 12:39:25 -0400
Received: by mail-wm0-f51.google.com with SMTP id i189so44221471wmf.1
        for <linux-kernel@vger.kernel.org>; Mon, 11 Sep 2017 09:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=Qvoxh9FFb2Risv+2sw+uH2KhFeFoWhgjod38Ag7t/eQ=;
        b=ANAx2AAZlgcp3RZg0cFQ5rvmyfmwtRbrV+BlOxv7VmhhfbNhay1J+6DJIHYPv7JwBL
         7jE/XOQ8gGmz/T3tHoxeHyVCwqmYGhM2nHV0AFrXzsj70sNbCCpVBBkuOPuPDH4IBm4s
         +B4XjsuRYZL7onzfCD4+qaY0A9oGarlLNpAGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=Qvoxh9FFb2Risv+2sw+uH2KhFeFoWhgjod38Ag7t/eQ=;
        b=beCPgtsA/v+1vyRc4nyxEuz1Zw0R1LADdLicPEOiKONCfwWdnqiCLdd2zn+a35i8Op
         xDwdvIVYz41ChmTQCrMDT5fshsd8bT4uj0v2Muhd1eYDFv6vqYT4r+lIAMigqhUh4mdx
         uHaL/FdZmGVOyTrVZf608DsTk2RsyBAQCjT39qZZ/tjrKNTWocjDKKUlL7YFAejjEOA/
         cU0oR2vIK/Zcuq1q77HzoqECl10bJdEYroHzHBnE+CjGCgH7YGPLifbxnx7/v6lArSVg
         4/Rz9u1B+ub/kyjR43K4sJF2bETfdDJu9oXETTbBqKSgGzo+gLR2iNBJQy+PwLM64GTF
         lAGA==
X-Gm-Message-State: AHPjjUhMR8E71pEmO3IsAD4qnoplhds4/xxJJpKKHCXfBUJYdy3DBX1M
        Ie6/siHp9CTMi09LPwts8+X55JvmRteg
X-Google-Smtp-Source: AOwi7QBOFopsbtUrC66dtVWF8gX/FKUHc73O89sAshag9wYYubPWmmX1FqvsarHeIT8qdFbSMbWQqMV9Cltaecgqp8k=
X-Received: by 10.28.52.81 with SMTP id b78mr7332050wma.11.1505147963764; Mon,
 11 Sep 2017 09:39:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.215 with HTTP; Mon, 11 Sep 2017 09:39:03 -0700 (PDT)
In-Reply-To: <0184EA26B2509940AA629AE1405DD7F2015FE17F@DGGEMA503-MBX.china.huawei.com>
References: <0184EA26B2509940AA629AE1405DD7F2015FE17F@DGGEMA503-MBX.china.huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Mon, 11 Sep 2017 17:39:03 +0100
Message-ID: <CAFEAcA8J5wZ23kQypzcbUScUResjWnN6rDG0b0idD1rv7F5Fsw@mail.gmail.com>
Subject: Re: [PATCH v11 6/6] target-arm: kvm64: Handle SError interrupt for
 the guest OS
To:     gengdongjiu <gengdongjiu@huawei.com>
Cc:     "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Zhaoshenglong <zhaoshenglong@huawei.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, kvm-devel <kvm@vger.kernel.org>,
        "edk2-devel@lists.01.org" <edk2-devel@lists.01.org>,
        Christoffer Dall <christoffer.dall@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        James Morse <james.morse@arm.com>,
        Tyler Baicar <tbaicar@codeaurora.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Ingo Molnar <mingo@kernel.org>, "bp@suse.de" <bp@suse.de>,
        Shiju Jose <shiju.jose@huawei.com>,
        "zjzhang@codeaurora.org" <zjzhang@codeaurora.org>,
        arm-mail-list <linux-arm-kernel@lists.infradead.org>,
        "kvmarm@lists.cs.columbia.edu" <kvmarm@lists.cs.columbia.edu>,
        lkml - Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
        "devel@acpica.org" <devel@acpica.org>,
        John Garry <john.garry@huawei.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Shameerali Kolothum Thodi 
        <shameerali.kolothum.thodi@huawei.com>,
        huangdaode <huangdaode@hisilicon.com>,
        "Wangzhou (B)" <wangzhou1@hisilicon.com>,
        Huangshaoyu <huangshaoyu@huawei.com>,
        Wuquanming <wuquanming@huawei.com>,
        Linuxarm <linuxarm@huawei.com>,
        "Zhengqiang (turing)" <zhengqiang10@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kernel.vger.kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
X-TUID: aCbj/y29QJ31

On 11 September 2017 at 16:17, gengdongjiu <gengdongjiu@huawei.com> wrote:
>> On 18 August 2017 at 15:23, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>> > +static int kvm_inject_arm_sei(CPUState *cs) {
>> > +    ARMCPU *cpu = ARM_CPU(cs);
>> > +    CPUARMState *env = &cpu->env;
>> > +
>> > +    unsigned long syndrome = env->exception.vaddress;
>> > +    /* set virtual SError syndrome */
>> > +    if (arm_feature(env, ARM_FEATURE_RAS_EXTENSION)) {
>> > +        syndrome = syndrome & ARM_EL_ISS_MASK;
>> > +    } else {
>> > +        syndrome = 0;
>> > +    }
>> > +
>> > +    return  kvm_vcpu_ioctl(CPU(cpu), KVM_ARM_SEI, &syndrome);
>>
>> This looks odd. If we don't have the RAS extension why do we need to do anything at all here ?
>
> This is because Qemu may need to support non-RAS extension as discussed with ARM James before.
> That is to say host hardware CPU does not support RAS, but guest supports.
> That is under discussion.
> When host hardware supports RAS, specify the syndrome to a valid value, otherwise, set it to 0.

If the guest CPU doesn't support the RAS extension then we have
no mechanism for delivering it a notification about the
memory problem at all, so setting the syndrome to anything
doesn't make sense.

I'm not sure what you should do in the case of "host
supports telling us about a memory problem and has
done so, but guest does not support being told about it",
but I'm pretty sure it shouldn't be this.

thanks
-- PMM
