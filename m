Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp201949lfo;
        Tue, 2 Feb 2021 07:15:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDCsN1JTDODaPtiee694+dgG7sex5l0As0sq7bv7dXUW2FIfoDzPm/Od/3pAE9BFw01V06
X-Received: by 2002:a25:2341:: with SMTP id j62mr17425129ybj.217.1612278945670;
        Tue, 02 Feb 2021 07:15:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612278945; cv=none;
        d=google.com; s=arc-20160816;
        b=nccrWLjzkKBjcoDKWl4tQjNhLxleqRCRODH1DGBiyR8OuCa5GYqrzKbT0H7LKeYkPS
         Bb+rLjQgYKA3CTRwLMSVPj04QFco0LClb3TdZjZV4ZuYIo8h9BGXW2LJu3+l+5D8nnFQ
         gkwvcegW4TfxKb9zgph3kJ5hmAxZS5nZmPUMsg8mf9wLBi4CemW9aUgVsXuousnVt6dv
         +csPSViIOr3OzvU0ch8q1GgSTqw4ptrKHKvX8KjMo998rLVkx+P7AMudmZG8xCeAczMr
         4ZV0jpjnT3dJ89A6eQung8sI7t0o0Cy8dtFF+w0QGOoHnhUnO1v55bbSY22+1cto2A7h
         5d6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date;
        bh=XhVARphsZ8p3fla5YPsxztOfNRHF6Stb6+aQqqYHGJM=;
        b=dbXTSeC23I23vgEQaXnFrHpt5c8kVWI4PPsPAnGM+LGT/RkK9A1vdm4Okv432hqtq2
         ljXWjuHRDOcLSYegqR2FPRHhCDp/xsUAB/Fx3dJxV1U0LQ7Wva15t40d9o2AUR68Cn9p
         TkV+d9Xh9dUpNuw6sYB4hibuqmktncklFXtWWCTZWevADh3iWkwiV5RXRLjRqdTG1yRv
         zFgS6v3GL2K1EwwRKbCrnGqFLuaqvJJ00Xj6RzhGLzRAgY8ZkByY666w3o46xCaO2PP1
         siXLBEu+l0vPpYggxSKd9hvbgPjUfe6DgrlBO0F3JuApcpxkgPDbXmsdIijbXisiWIRl
         RPSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si3979323ybl.410.2021.02.02.07.15.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Feb 2021 07:15:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6xP6-0001mF-Oa
	for alex.bennee@linaro.org; Tue, 02 Feb 2021 10:15:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1l6xLJ-0006MJ-7y; Tue, 02 Feb 2021 10:11:49 -0500
Received: from relay64.bu.edu ([128.197.228.104]:49248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>)
 id 1l6xLH-0006GF-3J; Tue, 02 Feb 2021 10:11:48 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 112FAcgJ017602
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 2 Feb 2021 10:10:42 -0500
Date: Tue, 2 Feb 2021 10:10:38 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [QEMU-SECURITY] [PATCH] hw/intc/arm_gic: Fix interrupt ID in
 GICD_SGIR register
Message-ID: <20210202151038.tk6luxvgashnrpit@mozz.bu.edu>
References: <20210131103401.217160-1-f4bug@amsat.org>
 <3a94e327-0454-bf43-552a-1c84407e1d7d@amsat.org>
 <20p82p5p-ns25-n434-37os-n55013s6313@erqung.pbz>
 <6d29aa57-2e6e-e81d-831f-803d9aae798f@amsat.org>
 <787280826.1146023.1612246917145@mail.yahoo.com>
 <3bd70da2-39ec-6e6b-d46d-6052f1b8f0b0@amsat.org>
 <CAFEAcA-Q8swS84GVd20wo4Pp41UUPdDknxbCMn=pchgi96UgRQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA-Q8swS84GVd20wo4Pp41UUPdDknxbCMn=pchgi96UgRQ@mail.gmail.com>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>, Li Qiang <liq3ea@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 QEMU Security <qemu-security@nongnu.org>, P J P <ppandit@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, P J P <pj.pandit@yahoo.co.in>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oZpvagLNuDTE

On 210202 1221, Peter Maydell wrote:
> On Tue, 2 Feb 2021 at 09:32, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> >
> > On 2/2/21 7:21 AM, P J P wrote:
> > > On Sunday, 31 January, 2021, 08:48:26 pm IST, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
> > >> Forwarding to qemu-security@ to see if this issue is worth a CVE.
> > >>
> > >> | On 1/31/21 11:34 AM, Philippe Mathieu-Daudé wrote:
> > >> | > Buglink: https://bugs.launchpad.net/qemu/+bug/1913916
> > >> | > Buglink: https://bugs.launchpad.net/qemu/+bug/1913917
> > >
> > > * Does above patch address both these bugs? For BZ#1913917 'irq' is derived from 'offset' it seems.
> > >
> > >         /* Interrupt Configuration.  */
> > >         irq = (offset - 0xc00) * 4;
> >
> > I haven't done a thorough analysis, simply tried to fixed this
> > bug ASAP as it is public so many users are exposed.
> >
> > I had the impression the first call (writel 0x8000f00 0x5affaf)
> > break the heap, so the memory is inconsistent when the second
> > call (write 0x8000eff 0x1 0x0) is done, but better have developers
> > familiar with GIC and security auditing this again.
> 
> Philippe is correct here. In both cases the overrun is on the
> first writel to 0x8000f00, but the fuzzer has for some reason not
> reported that but instead blundered on until it happens to trigger
> some other issue that resulted from the memory corruption it induced
> with the first write.
> 

It happens in the standalone reproducer build with
ASAN/--enable-sanitizers, so it seems like an oversight/bug in the
Sanitizers, rather than the fuzzer. It is strange that UBSan seemed to
detect an OOB index, but proceeded as normal. I should start paying
closer attention to those non-fatal UBSan errors.

> > >> | > Correct the irq mask to fix an undefined behavior (which eventually
> > >> | > lead to a heap-buffer-overflow, see [Buglink]):
> > >> | >
> > >> | >    $ echo 'writel 0x8000f00 0xff4affb0' | qemu-system-aarch64 -M virt,accel=qtest -qtest stdio
> > >> | >    [I 1612088147.116987] OPENED
> > >> | >  [R +0.278293] writel 0x8000f00 0xff4affb0
> > >> | >  ../hw/intc/arm_gic.c:1498:13: runtime error: index 944 out of bounds for type 'uint8_t [16][8]'
> > >> | >  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior ../hw/intc/arm_gic.c:1498:13
> > >> | >
> > >> | > Cc: qemu-stable@nongnu.org
> > >> | > Fixes: 9ee6e8bb853 ("ARMv7 support.")
> > >> |
> > >> | > ---
> > >> | > Isnt it worth a CVE to help distributions track backports?
> > >> | > ---
> > >
> > > Thank you for reporting this issue. Will process further.
> 
> On the CVE:
> 
> Since this can affect systems using KVM, this is a security bug for
> us. However, it only affects an uncommon configuration:
> you are only vulnerable if you are using "kernel-irqchip=off"
> (the default is 'on', and turning it off is an odd thing to do).
> 
> I've applied this patch to target-arm.next.
>

Ah I had a gut feeling there was a GIC in kvm. CVE or no CVE, --n_bugs
-Alex

> thanks
> -- PMM
