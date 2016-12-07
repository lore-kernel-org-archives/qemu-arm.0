Received: by 10.25.159.131 with SMTP id i125csp444374lfe;
        Wed, 7 Dec 2016 09:08:11 -0800 (PST)
X-Received: by 10.233.235.67 with SMTP id b64mr67697480qkg.156.1481130491719;
        Wed, 07 Dec 2016 09:08:11 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id o22si14936108qta.236.2016.12.07.09.08.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Dec 2016 09:08:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40277 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cEfhT-0002Sy-5E
	for alex.bennee@linaro.org; Wed, 07 Dec 2016 12:08:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35130)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cEfh0-00029Q-82
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 12:07:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vijay.kilari@gmail.com>) id 1cEfgv-0000Oi-9m
	for qemu-arm@nongnu.org; Wed, 07 Dec 2016 12:07:42 -0500
Received: from mail-pg0-f68.google.com ([74.125.83.68]:33665)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <vijay.kilari@gmail.com>)
	id 1cEfgv-0000OS-3Z; Wed, 07 Dec 2016 12:07:37 -0500
Received: by mail-pg0-f68.google.com with SMTP id 3so24047010pgd.0;
	Wed, 07 Dec 2016 09:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kEupuvbYSysoBrB93CmuNuE5et6pn2/tYM9NUGunVpc=;
	b=DU369qlJHiB+YFAb1T5yEaIrqPGpY8hTPgLPs6+Iqa1nekOQEzoar6I+HfSJthmbGx
	K5BocFLbU8/42Is6YJFxETgKdblL5x3sWB56AEKipY5TDSl5PIQ2GZoUHsy4QA8CWA83
	i914/DJJwXvIoOIkh6oTJPJCxvZqm7b3C9O16V+0LF25jMgoAgndcxFT2InR1Zcg9SA8
	KviNUHPrb6VkmKAhZXMIqw/UKrzdqSeSeHiRMxO5A6QPwXv5walrxiKvWMdsfTrfdUim
	IIHSgSe4A/OH2yzNLHoaauOl1yRwk1VnmsfJReV9TYRGKpYJ2BNmHPEyl4hRrQcNm0hF
	KHxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kEupuvbYSysoBrB93CmuNuE5et6pn2/tYM9NUGunVpc=;
	b=N6iLZEi4mHAJXZwHUAQDmQXh9naKLUTvTSnFezvEf6paGb8v0pA/WiJSolWFu5SiBw
	5NMyMgrz6b1dy5UBc9vkgsMkiPXmzL+i/Ykf/4MAUVm0CbCFKjQw47u767eUyE+/s5R3
	AdoLb9EIdeKz7gbcOWLej9Yy0sA+r3F1W4raBUbX95eCoZH6OLnFB9uNjxKBTeb3nhJC
	Qx9IhZsEmnI7o/2LtTxOYglx2tNLTMPqQ6hAlFl6k9jloB7PLLAzSO6NwEDNGzkKFqMR
	7XUPyTGbIA0LJNuMe/0xz6uf5sL4GSRxUfTEpG2b/5Hp99MYbHSg3I9Fh9oMBRjZ0VZq
	E/Iw==
X-Gm-Message-State: AKaTC00W3tyMFyM9xT+QzJOaWlgHAJo8TpyjjMu6tKisqn5/a2BYnE/aIoBvygo4QF+eNA==
X-Received: by 10.99.230.83 with SMTP id p19mr120980245pgj.138.1481130396090; 
	Wed, 07 Dec 2016 09:06:36 -0800 (PST)
Received: from localhost.localdomain
	(50-233-148-156-static.hfc.comcastbusiness.net. [50.233.148.156])
	by smtp.gmail.com with ESMTPSA id
	u23sm43898487pfg.86.2016.12.07.09.06.32
	(version=TLS1_1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Dec 2016 09:06:35 -0800 (PST)
From: vijay.kilari@gmail.com
To: qemu-arm@nongnu.org, peter.maydell@linaro.org, pbonzini@redhat.com,
	rth@twiddle.net
Date: Wed,  7 Dec 2016 22:36:10 +0530
Message-Id: <1481130374-5147-1-git-send-email-vijay.kilari@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.83.68
Subject: [Qemu-arm] [PATCH v5 0/3] Live migration optimization for Thunderx
 platform
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, vijay.kilari@gmail.com,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pt02VjNMI6T6

From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

The CPU MIDR_EL1 register is exposed to userspace for arm64
with the below patch.
https://lkml.org/lkml/2016/7/8/467

Thunderx platform requires explicit prefetch instruction to
provide prefetch hint. Using MIDR_EL1 information, provided
by above kernel patch, prefetch is executed if the platform
is Thunderx.

The results of live migration time improvement is provided
in commit message of patch 3.

Note: Check for size of while prefetching beyond page is
not added. Making this check is counter productive on
performance of live migration.

v4 => v5:
   - Compile util/aarch64-cpuid.c when CONFIG_LINUX enabled
   - Added stubs include/qemu/aarch64-cpuid.h if __aarch64__ and
     CONFIG_LINUX are not enabled.
v3 => v4:
   - Dropped allocation of memory for buf in
     qemu_read_aarch64_midr_el1()
   - Moved MIDR reg definitions to header file
   - Dropped arm64 and thunder specific code from generic
     function.

v2 => v3:
   - Rebased on top of richard's patches.
   - Consider cache line size and line number to prefetch
   - Passed optional parameters to __builtin_prefetch
v1 => v2:
   - Rename util/cpuinfo.c as util/aarch64-cpuid.c
   - Introduced header file include/qemu/aarch64-cpuid.h
   - Place all arch specific code under define __aarch64__ and
     CONFIG_LINUX.
   - Used builtin_prefetch() to add prefetch instruction.
   - Moved arch specific changes out of generic code
   - Dropped prefetching 5th cache line.

Vijaya Kumar K (3):
  cutils: Set __builtin_prefetch optional parameters
  utils: Add helper to read arm MIDR_EL1 register
  utils: Add prefetch for Thunderx platform

 include/qemu/aarch64-cpuid.h | 38 ++++++++++++++++++++++++++++++++
 util/Makefile.objs           |  1 +
 util/aarch64-cpuid.c         | 52 ++++++++++++++++++++++++++++++++++++++++++++
 util/bufferiszero.c          | 43 +++++++++++++++++++++++++++++++-----
 4 files changed, 129 insertions(+), 5 deletions(-)
 create mode 100644 include/qemu/aarch64-cpuid.h
 create mode 100644 util/aarch64-cpuid.c

-- 
1.9.1

