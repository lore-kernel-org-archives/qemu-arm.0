Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp500694wrt;
        Thu, 22 Nov 2018 02:29:19 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WJf6ygB3licEQBvVBX2QDNNqjEeXZrKWeRyY4IGE+j4ZuRyIfyp1gseaDfMS7EXM1EjSpY
X-Received: by 2002:a62:9913:: with SMTP id d19mr5673477pfe.107.1542882559758;
        Thu, 22 Nov 2018 02:29:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542882559; cv=none;
        d=google.com; s=arc-20160816;
        b=OLxv7sNV41ZXxaaXtETZOsOe1IZgFLF4FGIoUJGIhHP8e2MQNQwn0hB9HNX8gxjPhY
         sQRURowbgurPxff4i213V7VBK65kbDVfbYlvjn1E3pbjC2+UL6H0cBr5POBG1f2cgnEV
         U1jNy5FgZQKwPaooEwGxbcPV2ApTSaapX6lf7l0LOaR+4556jlv9+OTSKJpnrUKKwcQM
         4YGnqxSYPR3WBrcvdQ94JrZwMDgKRmA7Kf5MF+ofHg9v79uXF8d71ECyMcpDZ0/h6Run
         998E+JT9lHSDxzrLSJVE3VxGebMim9VYB4MD1utMqxKI55OUpBj3It+w6/LSXOwIvy/a
         J51w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=U7+YoIwQQDvIAKT/wdJu6PWtji967X/BWXglUk/QfHQ=;
        b=CRkN3/ahTs2ogyQ1SUU4g97Au/ZPqDwOoOp/6+eOo96egnBviwnL/Dl0nO+oYDc2Us
         FmmKoAzjU4w9D0JOFlR7nllZ9I5nDCbvV3YjxWEMdtcfGvxIGynRSAe4dhcnbLGuzfPY
         /38fsB6DeleTsAN399QRW8rUQkbWdi7Lqy/j5g06c5r+TlFDrEgJemOdBLEyZmEF0WjI
         R21aEUpZC9EVbAoBjvcZcSf/H7TUQzONfdi+59PORmJPz4YMTxN5DTsxXCMbdFC54Xdr
         N6Au0nSRI+GMX7K0IHJEhPN2eOJPt1asU3UfoSZXB6OwGKuOK4khDnhwHrcyNHyjlyPh
         Zy3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EKwRro8g;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id f34-v6si53057621ple.218.2018.11.22.02.29.19;
        Thu, 22 Nov 2018 02:29:19 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EKwRro8g;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394359AbeKVVIG (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Thu, 22 Nov 2018 16:08:06 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:44752 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390677AbeKVVIG (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 22 Nov 2018 16:08:06 -0500
Received: by mail-ot1-f65.google.com with SMTP id f18so6054975otl.11
        for <kvm@vger.kernel.org>; Thu, 22 Nov 2018 02:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=U7+YoIwQQDvIAKT/wdJu6PWtji967X/BWXglUk/QfHQ=;
        b=EKwRro8gHH8zxSAojq4sb3aTH35kgdlAUL1MzcoQ4sqweSiXP9W0WRfER98ZiPXnh7
         6SsBJwGoXcptM+Ux3ZsWlsYNN+0/LUG1UttiR9ZciXhIqAQwN2QB0bgZzBK39/27Zcv6
         Ka5DTn4aHDkBRsSuL1dRfsX67OD4SATrthOaM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=U7+YoIwQQDvIAKT/wdJu6PWtji967X/BWXglUk/QfHQ=;
        b=NCsgaauxrIWxs1AOrXhHaRxZUHdblY8WU6h+ZZI3jRHZ2G7hXCEbDU21IvXLDbHB00
         Unz/FbUEk8lTPn69/DfXnYJJiAnK9bpBHNj8FDK9R/X6p5CB3Alr8P+JdgQJJ1T0Tov6
         ZEtolJwnXoxyJ+lRqkZplSV1BlphycFr9/vr22nB+dClGTMH/YShks6usLCF3iMD1cfd
         cBQuQ6TLcgmvd38CVRb/+G0UidA59RpaFcWllu9huS5T0gRZ9reuCP8fkkDQsAca6tze
         BK04peBAiGrBvYJtWyXreaaiMFW8cR3ogu2P4CwWrsNxOD0Q4GFw3y2vRl/LjcVEni7h
         fHkQ==
X-Gm-Message-State: AA+aEWYNq8O/J214CpAU1xFieJno5bdMnTYO82X+E+1n1aWAicB8kH/R
        WoYy2Qt8XS4Cvj5wAPCooClc9PkCYLIljXxGX3vfNA==
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr6320379oth.317.1542882556791;
 Thu, 22 Nov 2018 02:29:16 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Thu, 22 Nov 2018 02:28:56
 -0800 (PST)
In-Reply-To: <0184EA26B2509940AA629AE1405DD7F201F7D7EB@DGGEMA503-MBX.china.huawei.com>
References: <1541672989-15967-1-git-send-email-gengdongjiu@huawei.com>
 <1541672989-15967-11-git-send-email-gengdongjiu@huawei.com>
 <CAFEAcA-6UKk-WF+M+z0=AN-X7q0XRFLo2RG_yBadDeCas4A5wQ@mail.gmail.com> <0184EA26B2509940AA629AE1405DD7F201F7D7EB@DGGEMA503-MBX.china.huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Thu, 22 Nov 2018 10:28:56 +0000
Message-ID: <CAFEAcA_P9d=hOH6sAfdqdBEAwF_am6+Qq9XgAafxbzGfWLEhHg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=E7=AD=94=E5=A4=8D=3A_=5BPATCH_RESEND_v15_10=2F10=5D_target=2Darm=3A_kvm?=
        =?UTF-8?Q?64=3A_handle_SIGBUS_signal_from_kernel_or_KVM?=
To:     gengdongjiu <gengdongjiu@huawei.com>
Cc:     Igor Mammedov <imammedo@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Laszlo Ersek <lersek@redhat.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        James Morse <james.morse@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        "zhengxiang (A)" <zhengxiang9@huawei.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: DFa1eToewje+

On 22 November 2018 at 03:05, gengdongjiu <gengdongjiu@huawei.com> wrote:
>> >
>> > +void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr) {
>> > +    ram_addr_t ram_addr;
>> > +    hwaddr paddr;
>> > +
>> > +    assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
>> > +    if (addr) {
>> > +        ram_addr = qemu_ram_addr_from_host(addr);
>> > +        if (ram_addr != RAM_ADDR_INVALID &&
>> > +            kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
>> > +            kvm_hwpoison_page_add(ram_addr);
>> > +            if (code == BUS_MCEERR_AR) {
>> > +                kvm_cpu_synchronize_state(c);
>> > +                if (ghes_record_errors(ACPI_HEST_NOTIFY_SEA, paddr)) {
>> > +                    kvm_inject_arm_sea(c);
>> > +                } else {
>> > +                    fprintf(stderr, "failed to record the error\n");
>> > +                }
>>
>> Shouldn't there be something in here to say "only report this error to the guest if we are actually reporting RAS errors to the guest" ?
>
> Yes, We can say something that such as "report this error to the guest", because this error is indeed triggered by guest, which is guest error.

I'm afraid I don't really understand what you mean. Could you
try rephrasing it?

My understanding was:
 * we get this signal if there is a RAS error in the host memory
 * if we are exposing RAS errors to the guest (ie we have
   told it that in the ACPI table we passed it at startup)
   then we should pass on this error to the guest

but that these are two different conditions.

If the host hardware detects a RAS error in memory used
by the guest but the guest is not being told about RAS
errors, then we cannot report the error: we have no mechanism
to do so, and the guest is not expecting it.

thanks
-- PMM
