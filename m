Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp2868183njb;
        Mon, 9 Dec 2024 12:38:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUH93kY6TjIM1fRyjsHijNodYP0l8y/CURpPMRvWcczxUDFaG8I13SD7twl93TnhbGMQ6QLBXCjaJ/Vgw==@linaro.org
X-Google-Smtp-Source: AGHT+IF1FCWFbrbXshyLG2ndKYHKvH0E6abMoWpur+bHT2I5eaXSffPX0FOiNaG11ECmXygPzJ9b
X-Received: by 2002:a05:6214:20e8:b0:6d8:a7f7:c39d with SMTP id 6a1803df08f44-6d91e422d78mr32966796d6.40.1733776737508;
        Mon, 09 Dec 2024 12:38:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733776737; cv=none;
        d=google.com; s=arc-20240605;
        b=J69qD9oSpq2F7BaSOfWbaW6DSmPkVWIsUJq2n2SDg3fZ29/RwuZXjZK0n5Xnggv07I
         3SzKJDjQXpajHTZp5Ka5YoGyhcwSRDh4znoCMR8IHmT4CMWkG/O3t8eAQy9sgGQnpw6c
         VB1wdbzumNyvxsOz93JPsBDbQcYMYvYLdDWUtL+Y0wRWWIYKMsOcNzKjqumYfOQ9UQPQ
         wVn1xaLoZOFIIhEqm7NFjBFYACzF+1+31/vb2Ccty1S2CrMzzMtGqJitiYXti1BT6qx/
         FYPsg5HH9VRIc7dzMMNwdwyopBmkU9KSSF3zSomnqAVTVQXTeO+oMg3PeUCGxdhKRPCV
         EByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=HL32HNmVKaS8JK1izJzB4B3sT8K+87Cy3mGdWM/P+IE=;
        fh=8T2pLoRJazPHIOeYT0o/B9pnKu1WNrWBFtoDCPsl2LU=;
        b=Xfv8ylaZozqrv9aTOCQ77l325Xm5its39+0c9AC9Qq8F/sbAaOmP6xODxU4aYpSGr2
         rB6iRzVc98y5p7URzBtQRINCQQIoibIomh4dhZUw3PY9CSOZTOl+R7v/raY6YcVqcAUn
         jW8IsUrdDFCw/UUeeOmsEkNhPjFpEjtUqhw9+OopF0aknKZels2y4wkCrjnVbXhjpbkz
         TRANl+cPZkDbDpHAJmUXSyTvdJyMO+yisSynqVb9v92FvkyGQAdQBszsXrKuFy7zTzMs
         DOE3MNz5djM22yarYPAc+phGBiHW8z9v2C7QU9/G5UWfGo6nktaC91CkWV65mhPlI7Al
         egcg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=zrwYbCLC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8eed7e09esi91385466d6.269.2024.12.09.12.38.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2024 12:38:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@philjordan-eu.20230601.gappssmtp.com header.s=20230601 header.b=zrwYbCLC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tKkVA-0006Fo-Li; Mon, 09 Dec 2024 15:37:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKkV6-0006DJ-NW
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 15:37:05 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <phil@philjordan.eu>)
 id 1tKkV2-0003CV-Uq
 for qemu-arm@nongnu.org; Mon, 09 Dec 2024 15:37:04 -0500
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a9a977d6cc7so696649866b.3
 for <qemu-arm@nongnu.org>; Mon, 09 Dec 2024 12:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=philjordan-eu.20230601.gappssmtp.com; s=20230601; t=1733776618; x=1734381418;
 darn=nongnu.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HL32HNmVKaS8JK1izJzB4B3sT8K+87Cy3mGdWM/P+IE=;
 b=zrwYbCLCw1P7GczfLbmxAEKCPCRIxpXMAA4RQl7OOneHTsKRjEvkCX5CewTKXaS7or
 Qe6yWG1AUz8JdsUnZS7GYxzFV41DybQusCa34bR8cK8pBG1xAYq8DNa0h1FpvXHw8zGw
 xdvTpcLH6nGTLT+p9DYyUCvd+NiBltsA0liPYfnrxsK76TLaOKGikDHkM4OiqZUYcZgw
 QBURa8ckxzPT+58ErbE/QEKu/mNCMNkDDKDIGMoWX6LWyLSsh/wRN/WRaiqXX8jJDqjy
 cuZij+s085ZLJsFHQ4DzS6BcS1rEcKmdh6++eogzZeXAGIlUNC48hKIjHYdCa1P3ojDf
 faxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733776618; x=1734381418;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HL32HNmVKaS8JK1izJzB4B3sT8K+87Cy3mGdWM/P+IE=;
 b=G2gHTFJ/bv5ZwWwndxudw7o9412JYk2XvHDJfRUfFyzP8s9PKDz2aDq3IKKeddivPv
 NK7kEJACsgAlYw9ACoWhIQd4scmG8c1b5gf6tDK/zyQJTDkR/2S+/2As5XKHKsbJK5yc
 PKpkSoeIBaGKkos5N0DjvJp/GpuIoONqsE7SM25Q3L3qswc8Q00pfHK+cn6xVwku4TVh
 0k6dSD1BMfWENYpC19APmKilSaW8WIm/GLpZQ0voRYUX4d0utzltalZxBML9jihAzgqH
 K06bODtkFkw6wpZy54jdgA3bZCa1zJYpIggEXTERGjV8KoWZsPNi/C+IxdK5EGqMnYIw
 v0Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsF5EZNxGTveDEZrPDLu13ZGf8APBaLLs4bG3mjgg4cCMtyyOEaEEbjLcmFQVTOkgCCNyyJGo8jQ==@nongnu.org
X-Gm-Message-State: AOJu0YxnN4V5j2KRcNplp4yEXAh2BKELTkRFRlma0tGHfIBxHcnyQTQj
 0XAx4mr38Pfm3snUamg6KaKuqUgQNFjUtzI4JMLXaw83mKq/yJj3TuYi3/xggA==
X-Gm-Gg: ASbGncvM4sObEas1IlHnSGE9mAaEqY44tV3chC0RQHLYMbVsRi2FhcbhaD5GVv3knBG
 SUmj5HSjMP0jP/cGse9C1UykSHio4zen0IRo4SPE8MD9Bzwny86esGc8BvzZSgYQBnwXGJbwcaN
 sIubQhhdqjY9S7mOmWMrbxefWuKz88fdnubDTfLLp6QirbKUepflqDHVjWl+1vgz5OXvrQp9mkf
 vb93WZDbe21LQTCO+QAKo9SrDCleLH/6HmayPnQo2OC8btf47nwk/Pc+sNrvo4ZGEgJsvC4bbYi
 18DiS4hFN1Q54BPjcgmrNuH0ffZ/hQ==
X-Received: by 2002:a05:6402:13d6:b0:5d0:cfad:f71 with SMTP id
 4fb4d7f45d1cf-5d418604995mr3231703a12.32.1733776617284; 
 Mon, 09 Dec 2024 12:36:57 -0800 (PST)
Received: from localhost.localdomain (h082218084190.host.wavenet.at.
 [82.218.84.190]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa692e4e9d5sm141783566b.129.2024.12.09.12.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 12:36:56 -0800 (PST)
From: phil@philjordan.eu
To: qemu-devel@nongnu.org
Cc: Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexander Graf <agraf@csgraf.de>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>
Subject: [PATCH 00/11] hvf and APIC fixes, improvements, and optimisations
Date: Mon,  9 Dec 2024 21:36:18 +0100
Message-Id: <20241209203629.74436-1-phil@philjordan.eu>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: neutral client-ip=2a00:1450:4864:20::62a;
 envelope-from=phil@philjordan.eu; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XW4gkLO2ucYx

From: Phil Dennis-Jordan <phil@philjordan.eu>

These patches are a loosely related series of changes that I've
collected while working on the VMApple/PVG patch set and my
doomed project of integrating Hypervisor.framework's APIC
implementation. (The latter turns out to suffer from a number of
serious bugs which prevent it from being usable with
level-triggered interrupts, at least as of macOS 15.1.)

The motivations behind the patches are:

 * Correctness. A bunch of these fix bugs or improve compliance
   with the appropriate specification.
 * Performance. The biggest performance problem on macOS hosts
   and the hvf accel is BQL contention. Depending on workload
   and configuration, busy vCPU threads seem to spend between
   10% and 30% of their time in bql_lock(). A number of these
   patches either reduce total work done, or move work out of
   the BQL in certain configurations.
 * Code hygiene. I've encountered a few instances of incorrect
   types used, outdated comments, magic numbers, etc. which
   were easy to fix.

There are some dependencies between the patches:

 * Patch 1 is required for both patches 2 and 7. This is why
   I have not split the aarch64 (patch 2) and the x86 (3-10)
   specific changes into separate patch sets.
 * Patch 6 will not apply cleanly without 5 in its current state
   but can be modified to work.
 * Patches 6 and 7 are only useful in combination.

Beyond that, we can mix and match - i.e. pull
reviewed-and-approved patches while further iterating on any
that might need refinement or dropping unwanted ones entirely.

The patches, in brief:

 1. Adds a function for architecture-specific vCPU setup
    before the vCPU's first VM entry, but after QEMU init has
    concluded. This is useful for correctly setting the aarch64
    GIC flag (patch 2) and for telling Hypervisor.framework the
    initial APICBASE address. (patch 7)
 2. Set the GICv3 flag in the PFR0_EL1 system register after
    the GIC has actually been set up. Previously the flag was
    computed before the GIC was ready, and thus always 0.
 3. Don't send signal to thread when kicking. cpus_kick_thread
    calls pthread_kill() to send a SIG_IPI to the target vCPU's
    thread. There does not appear to be any need to do this
    with HVF, so let's not call cpus_kick_thread() when kicking
    a vCPU there.
 4. Prefetch all bytes of an instruction when emulating it in
    software. The x86_decode system in the HVF accel read guest
    memory in 1-, 2-, 4-, or 8-byte parcels when decoding
    instructions. The VM exit tells us how big the instruction
    is, so let's read all of it in one go for efficiency.
 5. x86 instruction decoding is somewhat expensive, and if we
    know that it must definitely be done before we acquire the
    BQL, we can actually move decoding to before the lock. The
    simplest case for this are APIC accesses, so we start with
    those.
 6. APIC access fast paths. EPT faults are somewhat expensive
    to process. This includes xAPIC MMIO. We can skip walking
    the memory graph and fully software-emulating the faulting
    instruction by obtaining the access type and MMIO offset
    provided by VMX/HVF's virtualised APIC access feature, and
    detecting common MOV instructions to call the APIC register
    read/write functions directly.
 7. To enable the APIC_ACCESS VM exit type, both the APIC base
    and the relevant ctl must be set in the VMCS; this change
    implements the former and toggles the latter according to
    APIC state, thus enabling the fast path implemented in patch
    6 and also adding better support for APIC relocation.
 8. This fixes a technically incorrect variable type. No change
    in functionality.
 9. The HVF "failed to decode instruction" error prints
    instruction bytes in variable-length hex; it's easier to
    read when the hex digits are always paired, even if the
    first one is 0.
10. This APIC change replaces a magic number with a symbolic
    constant and removes a comment which is no longer accurate.
11. This change causes the software APIC to raise an exception
    when the guest attempts to write to the reserved bits of the
    APICBASE MSR.


In combination, the patches improve QEMU/hvf's relevant
kvm-unit-tests results in the APIC/xAPIC/x2APIC suites (after
disabling the crashing test_pv_ipi test) from:

FAIL apic-split (56 tests, 9 unexpected failures, 2 skipped)
FAIL x2apic (56 tests, 9 unexpected failures, 2 skipped)
FAIL xapic (45 tests, 7 unexpected failures, 3 skipped)

To:

FAIL apic-split (56 tests, 2 unexpected failures, 2 skipped)
FAIL x2apic (56 tests, 2 unexpected failures, 2 skipped)
FAIL xapic (45 tests, 2 unexpected failures, 3 skipped)

The remaining test failures are, in each case:

FAIL: multiple nmi (received: 1)
FAIL: TMCCT should stay at zero

These are not regressions, they were part of the original
test failures; APIC logic relevant to them was not touched
in this patch set.


Performance improvements vary a lot depending on workload.
MMIO-based APIC accesses are most affected, so APIC-heavy
loads with x2apic disabled benefit most.

macOS guests seem to use the APIC very heavily, so it comes
as no surprise that the improvement is noticeable, with
the guest OS booting in about 33 seconds with xAPIC, down
from about 43 with unmodified QEMU 9.2-rc3. Even with x2APIC
enabled, the changes shaved about 1-2 seconds off boot times.

"Warm" builds of QEMU 9.2-rc3 with
make clean ; time ( ./configure --target-list=x86_64-softmmu ; make -j4)
inside an OpenSUSE 15.6 VM with -smp 4 and -cpu host,-x2apic
on my 8-core MacBook Pro 2019 with macOS 14 repeatably went from
  2m 58s (+/- 1.2s) real, 8m 39s (+/- 2s) user, 1m 14s (+/- <1s) sys
with 9.2-rc3 to
  2m 56s (+/- 1.2s) real, 8m 32s (+/- 2s) user, 1m 13s (+/- <1s) sys
with this patch set applied. It's not a huge improvement
(>1% for real/user times, 2% for sys) but the runs are very
consistently in favour of the modifications.

My wall-clock measurements with boot times for Windows 10,
Linux, and FreeBSD guests were all within margin of error,
though profiling the QEMU process did indicate a reduction of
vCPU thread time spent in bql_lock().

I did not spot any performance regressions, but I can't
entirely rule them out either.

There is scope for similar optimisations that yield more widely
applicable improvements. In particular EPT fault MMIO handling
can be split into non-BQL and BQL portions. I measured around 1-2%
additional improvement with a naive implementation of this, but the
hvf memory slot data structure needs to be made RCU-safe before such
an optimisation can be upstreamed.


I have done my best to do a reasonable amount of testing with
these patches, in particular I have tested Linux, FreeBSD,
macOS, Windows 10, and Windows XP guests on x86-64, each with
x2APIC alternately enabled and disabled. On aarch64, I have
checked Linux and macOS (VMApple) guests. All of this on
macOS hosts.

Phil Dennis-Jordan (11):
  hvf: Add facility for initialisation code prior to first vCPU run
  arm/hvf: Initialise GICv3 state just before first vCPU run
  i386/hvf: Don't send signal to thread when kicking
  i386/hvf: Pre-fetch emulated instructions
  i386/hvf: Decode APIC access x86 instruction outside BQL
  i386/hvf: APIC access exit with fast-path for common mov cases
  i386/hvf: Enables APIC_ACCESS VM exits by setting APICBASE
  i386/hvf: Variable type fixup in decoder
  i386/hvf: Print hex pairs for each opcode byte in decode error
  hw/intc/apic: Fixes magic number use, removes outdated comment
  hw/intc/apic: Raise exception when setting reserved APICBASE bits

 accel/hvf/hvf-accel-ops.c    |   5 ++
 hw/intc/apic.c               |  12 +++--
 include/hw/i386/apic.h       |   2 +
 include/sysemu/hvf_int.h     |   1 +
 meson.build                  |   1 +
 target/arm/hvf/hvf.c         |  21 +++++---
 target/i386/hvf/hvf.c        |  50 +++++++++++++----
 target/i386/hvf/trace-events |   9 ++++
 target/i386/hvf/trace.h      |   1 +
 target/i386/hvf/x86_decode.c |  24 ++++++---
 target/i386/hvf/x86_decode.h |   5 +-
 target/i386/hvf/x86_emu.c    | 102 +++++++++++++++++++++++++++++++++++
 target/i386/hvf/x86_emu.h    |   2 +
 13 files changed, 206 insertions(+), 29 deletions(-)
 create mode 100644 target/i386/hvf/trace-events
 create mode 100644 target/i386/hvf/trace.h

-- 
2.39.3 (Apple Git-146)

