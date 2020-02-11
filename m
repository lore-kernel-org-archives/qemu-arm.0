Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5223775lfp;
        Tue, 11 Feb 2020 07:34:14 -0800 (PST)
X-Google-Smtp-Source: APXvYqzXIRXAiZSNJH9BgqfHGbqBHgsjSftHhmLXyctJ+QqCKr1aoGnGhC6UUrHlSAPumr7gUmN7
X-Received: by 2002:aca:f584:: with SMTP id t126mr3304114oih.132.1581435254538;
        Tue, 11 Feb 2020 07:34:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581435254; cv=none;
        d=google.com; s=arc-20160816;
        b=jIs6iiZ7Tr4f1gElYbr2PIB/u7Jab5Lh3ORLwWULB2tUX8kenLn7lasAZI5qsrVN95
         yj7yjE5C+kXuSJJn2mqezgXS3CBqQfjRH9PliRdkfod3TBZ/aElkQORx3Vs5etqRawaM
         Fv4Dv9/zhJcA7jaRdZkMhpxEMLGQJXT8j5Q+ybganpKgo53M7Cf24sc0r0xB890e/44p
         XgqaGyjriYazmWzAhtakwyV99Qbcqusdq2ZkGuuKvLU2AosT9TGuyRvrd0/Bau5c9Er+
         XltLn8rREVB9wPsGWXDr3p1DbyWcn4/wBqJ1xtJqv/s9eTTpcvOrTZRUzcH/ddypdSX7
         KVdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SC8tyGtOpHm57sc5gE2Q5QspKh0iTcK1s5Xp662IVFM=;
        b=YYxfcW8QdUApLK26GJZqPYkFjls/xjbVx1dIbxOlDwA/qurV1Xxksp7PfEG5A5pUG6
         DPN35M2mFveZnlIHsbiLIx66izyWhdsEFvMpeQKswYXOSWMVw70hB2RvfakeIJygCbiO
         75xa/4img1I1qlSEPeRdpTheOFz2ioMAO6I4+kQ7xx3240saJEYjZhZQig/4EMvvF3hm
         uPcBj/bGPqIoz564lgc9gQ3L0K4rak8YpKDmbEg9B/POXyUv2PqdLCvkMHqCEV6fBQW8
         IQNX+sdHdnkcbf9UZQVW7oF0TDLv5vdyVtw6LMI1dySO5EAGnnUsyln2/v3ovRc9mMga
         amJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TCk96Zrv;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id m17si2327662otk.109.2020.02.11.07.34.14;
        Tue, 11 Feb 2020 07:34:14 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TCk96Zrv;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729394AbgBKPeL (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 11 Feb 2020 10:34:11 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36646 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728891AbgBKPeL (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 11 Feb 2020 10:34:11 -0500
Received: by mail-ot1-f67.google.com with SMTP id j20so10490501otq.3
        for <kvm@vger.kernel.org>; Tue, 11 Feb 2020 07:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SC8tyGtOpHm57sc5gE2Q5QspKh0iTcK1s5Xp662IVFM=;
        b=TCk96ZrvyLxBaska0vmDd8zhDDHL32wBx+GpxMYTZh8GrXAN9fDOQBd1PEOty+f6T1
         vfDUvSX7ZHSIiW/dbUiu5BMA8AsYLDvPMAl3KLhhnRuE1TYR3JUUyzsXs9/FERrXgIQ0
         /h6Pefrk7ao03J/OG9iA2qBYvgOMpcFGgqXYgfHA21BfmH6nNBBSJsupWnyc35MF4cQt
         I8R7/t3gExWR92oy3Iq+GfwPHqZcUaB5OKtpOO6IHn8eA5fvKa05yhOpYh2QwK871uvQ
         /kYmRzNk5o1EnbkPGwBpLr5Rl4nVsGM4Zwf9kXtwvubhbFB1qChTuxErjCDDkSUp6RrX
         pe5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SC8tyGtOpHm57sc5gE2Q5QspKh0iTcK1s5Xp662IVFM=;
        b=qheDnWzG5vsKwecCkVmSxH+0pih1yBLlxHavhWt7E/HvQP00sS3/5cZ9TzBCog1ja2
         BQTkYaekdFO6AFE+iKxe2t1kwja1TxUY7IuZeN4ELfPSwnTimA8AGjuycCNQPtveNwuC
         +6PYhoiXv53QORg3sq3mxdE8mrEVWiS/Z7hFs+efa+DvnS7DURD2hoJrrHW4Y/A4tWcI
         vD4HSQm4GKaEPGLAn/K/E7iV9cK78auBLPqRUZkQf4ZxyoXCXaTbYYgW/MvTEW6ifTXi
         vnsEwbGBJ2WGdxN5J8Gm8iZvuUn2VtaAqqZRxYHdk9ZF1YUgmybDbdJ5udNvNAphGJfy
         vSgg==
X-Gm-Message-State: APjAAAUZd5OBJWFaE8n4IiOB3mUZbpho/v2YdtCntAJR6st5zI35Q+bt
        JFvOSOM8d5qDlYdLc2dk+VzW2qyx7H2Nho1GPU/Fgw==
X-Received: by 2002:a05:6830:184:: with SMTP id q4mr5759307ota.232.1581435250516;
 Tue, 11 Feb 2020 07:34:10 -0800 (PST)
MIME-Version: 1.0
References: <20200130112510.15154-1-eric.auger@redhat.com> <20200130112510.15154-5-eric.auger@redhat.com>
In-Reply-To: <20200130112510.15154-5-eric.auger@redhat.com>
From:   Peter Maydell <peter.maydell@linaro.org>
Date:   Tue, 11 Feb 2020 15:33:59 +0000
Message-ID: <CAFEAcA9rsncts+s4tVn4tY4zaMHKeqyJj1O4J=Ufx33fb=Nrcg@mail.gmail.com>
Subject: Re: [kvm-unit-tests PATCH v2 4/9] arm: pmu: Check Required Event Support
To:     Eric Auger <eric.auger@redhat.com>
Cc:     Eric Auger <eric.auger.pro@gmail.com>,
        Marc Zyngier <maz@kernel.org>, kvmarm@lists.cs.columbia.edu,
        kvm-devel <kvm@vger.kernel.org>,
        QEMU Developers <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>,
        Andrew Jones <drjones@redhat.com>,
        Andrew Murray <andrew.murray@arm.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: zzV9raMIZrs9

On Thu, 30 Jan 2020 at 11:25, Eric Auger <eric.auger@redhat.com> wrote:
>
> If event counters are implemented check the common events
> required by the PMUv3 are implemented.
>
> Some are unconditionally required (SW_INCR, CPU_CYCLES,
> either INST_RETIRED or INST_SPEC). Some others only are
> required if the implementation implements some other features.
>
> Check those wich are unconditionally required.
>
> This test currently fails on TCG as neither INST_RETIRED
> or INST_SPEC are supported.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>

> +static bool is_event_supported(uint32_t n, bool warn)
> +{
> +       uint64_t pmceid0 = read_sysreg(pmceid0_el0);
> +       uint64_t pmceid1 = read_sysreg_s(PMCEID1_EL0);
> +       bool supported;
> +       uint64_t reg;
> +
> +       /*
> +        * The low 32-bits of PMCEID0/1 respectly describe

"respectively"

> +        * event support for events 0-31/32-63. Their High
> +        * 32-bits describe support for extended events
> +        * starting at 0x4000, using the same split.
> +        */
> +       if (n >= 0x0  && n <= 0x3F)
> +               reg = (pmceid0 & 0xFFFFFFFF) | ((pmceid1 & 0xFFFFFFFF) << 32);
> +       else if  (n >= 0x4000 && n <= 0x403F)
> +               reg = (pmceid0 >> 32) | ((pmceid1 >> 32) << 32);
> +       else
> +               abort();
> +
> +       supported =  reg & (1UL << (n & 0x3F));
> +
> +       if (!supported && warn)
> +               report_info("event %d is not supported", n);
> +       return supported;
> +}
> +
> +static void test_event_introspection(void)
> +{
> +       bool required_events;
> +
> +       if (!pmu.nb_implemented_counters) {
> +               report_skip("No event counter, skip ...");
> +               return;
> +       }
> +
> +       /* PMUv3 requires an implementation includes some common events */
> +       required_events = is_event_supported(0x0, true) /* SW_INCR */ &&
> +                         is_event_supported(0x11, true) /* CPU_CYCLES */ &&
> +                         (is_event_supported(0x8, true) /* INST_RETIRED */ ||
> +                          is_event_supported(0x1B, true) /* INST_PREC */);
> +
> +       if (pmu.version == 0x4) {

This condition will only test for v8.1-required events if the PMU
is exactly 8.1, so you lose coverage if the implementation happens
to support ARMv8.4-PMU. Hopefully you have already bailed out
for "ID_AA64DFR0_EL1.PMUVer == 0xf" which means "non-standard IMPDEF
PMU", in which case you can just check >= 0x4.

> +               /* ARMv8.1 PMU: STALL_FRONTEND and STALL_BACKEND are required */
> +               required_events = required_events &&
> +                                 is_event_supported(0x23, true) &&
> +                                 is_event_supported(0x24, true);
> +       }
> +
> +       report(required_events, "Check required events are implemented");
> +}
> +
>  #endif

thanks
-- PMM
