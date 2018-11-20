Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp680325wrt;
        Tue, 20 Nov 2018 07:15:50 -0800 (PST)
X-Google-Smtp-Source: AFSGD/U7+AKSn015kYF0V1kqGS7/Mz8WnzbVw89cX1TSjFwOMD0fZqvCYYfmg1//HVbgqomCFQNZ
X-Received: by 2002:a17:902:201:: with SMTP id 1mr1855954plc.62.1542726950208;
        Tue, 20 Nov 2018 07:15:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542726950; cv=none;
        d=google.com; s=arc-20160816;
        b=Ehz0nwIojvD9RJ9ufmE8l4Tj+FbJiK+aQfJJvbH7BGT/lE4eBNzm3N7qsK6ktRr5+f
         fp7lnpR9LTmzsK3GN0w0r6HTSTQcDxnQjzgpMtpcWdr9z5zcJqpJ+Ij3beApQRMsoR17
         6AcvPQmEIQ+m5wOS8Ur7QHEX0cG0FCob4wLvb/LH/JHA0VnfYDHY1Rtl3yCRPlfROJ1p
         /XHXemYR7FyfXBmqks5XP3Y2ZS0P/OdbIohEdzxbm6jdsUH86UDS/bkQRH4fSzxptBqe
         M9e5R0bA4sz6b/OOQWAre5exw55/e+KohB6v2sr9bL2IISQZBFXmcWm1Ol0HPkaS1ns0
         epJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=nYn0eSkygK3POJn29s57zRpQ7lasw9cwgc4bQS5emXY=;
        b=cIyLiat3UIcK3BnHjTue98tVjBe3WskozPzJv/FeR8IIh/p4LI20qc2DfvleTbP2yI
         9Es90gy3EQMz7P9LwsWkYJHJNibmQ0yxJpr6Lq33Bs7yFS2HAsekm8dfr4UtwG8p9bpK
         /2ENK5XVfIfSu8c0ItUTk0dYuzJ/czqWo1pa4cS9PELjyCWWsRYTPQpNyyRPO342fJQ4
         Z3cpAW6xbKZOIqJK7Qj4l7kDrjU91SFfXDuxqJmZyijwOVR53a24E8o5L4W2VmwK0qNS
         ukuSyqtS9LCiloaKM66JuF8++yp+8ua13bpA0hEjhDwPArICKKE59rvRLhBx3Xjxo1mm
         corA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UtXRehYD;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id c16si12504689plo.270.2018.11.20.07.15.49;
        Tue, 20 Nov 2018 07:15:50 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UtXRehYD;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726600AbeKUBpZ (ORCPT <rfc822;francois.ozog@linaro.org>
        + 4 others); Tue, 20 Nov 2018 20:45:25 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:41457 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbeKUBpZ (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 20 Nov 2018 20:45:25 -0500
Received: by mail-oi1-f194.google.com with SMTP id j21so1750679oii.8
        for <kvm@vger.kernel.org>; Tue, 20 Nov 2018 07:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=nYn0eSkygK3POJn29s57zRpQ7lasw9cwgc4bQS5emXY=;
        b=UtXRehYD9r3kMZ97i0GhFVv1stpBl5grV8ojYsaFK4huTPQ3yk1IK12kKl5QuCOiPp
         BG0Go5UKGaPJ5EETOdPEPN8/qOkvoBTdkb2yR4RHK8poUKOgj4xTjEtGN2WX88oDYspU
         NEdeD7VW7+Ds9/S/kD3FbiOzdUszHWDOwmo7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=nYn0eSkygK3POJn29s57zRpQ7lasw9cwgc4bQS5emXY=;
        b=rUBQ8m/C/4J5QAnIa3eJzj+BvjGEUO5vt84CsWSlyAm4sanplWgLttnQ0+jD+zxgaP
         AoeDdpwcCwo2mcCEg2YsvcypkVFyeDHuJFc/zFWx2FGqBa1LHNl10dke4RKvpQWPNEnd
         oO8upYXNhpB4tn7QzvZC7Nf52bHMbNKAocRnciKk+2BJUMikNSNEhA+Kz3OLuZuHQrfM
         yjHpeRPI/a3wLX5cXcy+fauia5+F/2/eVO2R5txnKtD08gjBuMi4E0/Rq5bznIyQaxNF
         pUNvTtbJtT4OhLs3thOSw2/1bFhtKv/vLwtiwoU60pypCNyieez1W6c/9czsKjFzUA8E
         U6gQ==
X-Gm-Message-State: AGRZ1gJK/iOzSntSFWMmW/Eqr87+FX+gdDEGF0lJkGTuGILukysPThK+
        yWwFVndGiZ+RQC2e211tyCGbIX61sPKl8V/xVQA0HQ==
X-Received: by 2002:aca:ed92:: with SMTP id l140mr1219154oih.112.1542726947183;
 Tue, 20 Nov 2018 07:15:47 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Tue, 20 Nov 2018 07:15:26
 -0800 (PST)
In-Reply-To: <1541672989-15967-11-git-send-email-gengdongjiu@huawei.com>
References: <1541672989-15967-1-git-send-email-gengdongjiu@huawei.com> <1541672989-15967-11-git-send-email-gengdongjiu@huawei.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 20 Nov 2018 15:15:26 +0000
Message-ID: <CAFEAcA-6UKk-WF+M+z0=AN-X7q0XRFLo2RG_yBadDeCas4A5wQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v15 10/10] target-arm: kvm64: handle SIGBUS signal
 from kernel or KVM
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     Igor Mammedov <imammedo@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Laszlo Ersek <lersek@redhat.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        James Morse <james.morse@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Zheng Xiang <zhengxiang9@huawei.com>,
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
X-TUID: TQ7I9B+AM2EO

On 8 November 2018 at 10:29, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> Add SIGBUS signal handler. In this handler, it checks the SIGBUS type,
> translates the host VA delivered by host to guest PA, then fill this PA
> to guest APEI GHES memory, then notify guest according to the SIGBUS type.
> There are two kinds of SIGBUS that QEMU needs to handle, which are
> BUS_MCEERR_AO and BUS_MCEERR_AR.
>
> If guest accesses the poisoned memory, it generates Synchronous External
> Abort(SEA). Then host kernel gets an APEI notification and call memory_failure()
> to unmapped the affected page from the guest's stage 2, finally return
> to guest.
>
> Guest continues to access PG_hwpoison page, it will trap to KVM as stage2 fault,
> then a SIGBUS_MCEERR_AR synchronous signal is delivered to Qemu, Qemu record this
> error into guest APEI GHES memory and notify guest using Synchronous-External-Abort(SEA).
>
> Suggested-by: James Morse <james.morse@arm.com>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
> Address James's comments to record CPER and notify guest for SIGBUS signal handling.
> Shown some discussion in [1].
>
> [1]:
> https://lkml.org/lkml/2017/2/27/246
> https://lkml.org/lkml/2017/9/14/241
> https://lkml.org/lkml/2017/9/22/499
> ---

>
> +void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
> +{
> +    ram_addr_t ram_addr;
> +    hwaddr paddr;
> +
> +    assert(code == BUS_MCEERR_AR || code == BUS_MCEERR_AO);
> +    if (addr) {
> +        ram_addr = qemu_ram_addr_from_host(addr);
> +        if (ram_addr != RAM_ADDR_INVALID &&
> +            kvm_physical_memory_addr_from_host(c->kvm_state, addr, &paddr)) {
> +            kvm_hwpoison_page_add(ram_addr);
> +            if (code == BUS_MCEERR_AR) {
> +                kvm_cpu_synchronize_state(c);
> +                if (ghes_record_errors(ACPI_HEST_NOTIFY_SEA, paddr)) {
> +                    kvm_inject_arm_sea(c);
> +                } else {
> +                    fprintf(stderr, "failed to record the error\n");
> +                }

Shouldn't there be something in here to say "only report this
error to the guest if we are actually reporting RAS errors
to the guest" ?

> +            }
> +            return;
> +        }
> +        fprintf(stderr, "Hardware memory error for memory used by "
> +                "QEMU itself instead of guest system!\n");
> +    }
> +
> +    if (code == BUS_MCEERR_AR) {
> +        fprintf(stderr, "Hardware memory error!\n");
> +        exit(1);
> +    }
> +}
> +
>  /* C6.6.29 BRK instruction */
>  static const uint32_t brk_insn = 0xd4200000;

thanks
-- PMM
