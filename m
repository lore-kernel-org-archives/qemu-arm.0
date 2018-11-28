Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1142811wrt;
        Wed, 28 Nov 2018 07:01:26 -0800 (PST)
X-Google-Smtp-Source: AJdET5esHUITvE9GK3Z+a3kct/uzaGJjVzmbTu1PY/JEYG8G3st9Rvlg8ECC1N/vJ7iWSN0MQMKC
X-Received: by 2002:a81:b615:: with SMTP id u21mr39297660ywh.174.1543417286718;
        Wed, 28 Nov 2018 07:01:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543417286; cv=none;
        d=google.com; s=arc-20160816;
        b=ihFOMG70KrBVnZ4C+uKITHJQ5w7Vv8tKvEaXmLEb2pZd6vA8BqcRN0XCaqv61tUSWf
         63gH4ATF2cxkmI1FJEkDWKqgQep1EUZXdwConmtqZCdn/7We4tAi3jFHPEb6X180MqYp
         /kO6905mbktzsHoMCEo1Jg7ikZftlXsnIUgpUaQZzj/W9tAdNvIa8x7c21OFOK6S4bQi
         tdnR3GVV2jODVmStbjVv+GEaJPI9XjdMkbZqNNbNUbvx1epHy4KdKk+aR2VoZgAmWVGs
         bi7842QlODRhfoiDtULMmwdCWnYcgrH8l7i2Q9TGWJW+EzFQ8QwfXapXEIhbpZhorGyp
         ZnUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=DJQ8jr+fnoPSOY6+JMYmml0XUu9FKsOanaRdaaCMJJo=;
        b=N/7WWvdJ4K9sK/ckv7eg7XIA21ujClXyw24hxPDDWnQIhjXKBDAthkzO8BWeDj1uKO
         kccecV4aDfPbGhF/Jo9qlFkUIvgrumR7mMwhNqjxeD679NM3tBjfdps/By24HFVAGuMT
         MiOMxZCmvNf17PG1UVuzFDbahmTtOD1DJlAhWc/1F7KKbPVM1MjQ+Z1052GW/8tn5BQx
         g9Znv1JjSFclfpqTZ6xV+liRtFz7wycyC3bjxp33wAjSdFdU/zm/1o2NBhy6URWdqrhO
         iKLCttgbBUQoV9hARPuUZC51N/NEn69aGHYRvXUXXdSVbwRVDibHqoiBPJVLfLCZZ9fM
         85dg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r132-v6si5242197ybc.409.2018.11.28.07.01.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 07:01:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:48184 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gS1LC-0003Ve-4d
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 10:01:26 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gS1Kw-0003RO-G7
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 10:01:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gS1Kr-0006lp-KW
	for qemu-arm@nongnu.org; Wed, 28 Nov 2018 10:01:10 -0500
Received: from mga01.intel.com ([192.55.52.88]:23271)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gS1Kb-0006Zv-Oa; Wed, 28 Nov 2018 10:00:50 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Nov 2018 07:00:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,290,1539673200"; d="scan'208";a="114151624"
Received: from bdoyle2-mobl.ger.corp.intel.com (HELO caravaggio)
	([10.251.86.101])
	by fmsmga004.fm.intel.com with ESMTP; 28 Nov 2018 07:00:46 -0800
Date: Wed, 28 Nov 2018 16:00:16 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20181128150016.GA25839@caravaggio>
References: <20181113165247.4806-1-sameo@linux.intel.com>
	<20181113165247.4806-5-sameo@linux.intel.com>
	<CAFEAcA9wvrnshOTYz-jZ0n6m7SfusYY+bnB-iPnQuVNqqdg5Ww@mail.gmail.com>
	<20181127153551.GC4393@caravaggio>
	<CAFEAcA9B5DPeot26-oGtR-h+xdfg+tmUPrYpKhaneaT1tr1yqQ@mail.gmail.com>
	<20181128104024.GD4393@caravaggio>
	<CAFEAcA-G3_uhH134_n8yobkJQJ7pOvu-vpLe9MkwVp5DmJOeag@mail.gmail.com>
	<20181128135719.GE4393@caravaggio>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181128135719.GE4393@caravaggio>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 04/13] target: arm: Move all
 interrupt and exception handlers into their own file
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5YVIFAvMnDH7

On Wed, Nov 28, 2018 at 02:57:19PM +0100, Samuel Ortiz wrote:
> On Wed, Nov 28, 2018 at 11:39:57AM +0000, Peter Maydell wrote:
> > On Wed, 28 Nov 2018 at 10:40, Samuel Ortiz <sameo@linux.intel.com> wrote:
> > > Given that this piece of code effectively builds a dependency to TCG
> > > from the KVM code, I see a few solutions but I need your input here. We
> > > could:
> > >
> > > - Decide we don't want to support --disable-tcg for ARM. We'd then carry
> > >   this patch serie from the NEMU code repo. Worst case scenario, at
> > >   least for us.
> > > - Manage to implement exception injection from userspace without TCG.
> > >   Would it even be possible?
> > > - Offload exception injections back to the kernel in those cases. I feel
> > >   this would be the cleanest solution but may need kernel changes.
> > 
> > The kernel folk were firmly against 3, IIRC, but you can go
> > and have the discussion if you like.
> > 
> > I don't really see what the problem is. This is just a bit
> > of code that's used by both TCG and KVM. Therefore it goes
> > in the binary whether TCG is enabled or not. Other functions
> > and bits of code are TCG only and therefore don't go in a
> > KVM-only binary.
> Keeping this code with --disable-tcg means:
> 
> Keep arm_cpu_do_interrupt -> Keep check_for_semihosting -> Keep the arm
> instruction loading code -> Keep a large chunk of the TCG core code
> itself. Does that dependency chain looks fine to you?
A simplified, aarch64 specific arm_cpu_do_interrupt() implementation
would not pull the TCG code in. Something like:

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index 0a502091e7..eba7ced564 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -1034,7 +1034,6 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
 {
     int hsr_ec = syn_get_ec(debug_exit->hsr);
     ARMCPU *cpu = ARM_CPU(cs);
-    CPUClass *cc = CPU_GET_CLASS(cs);
     CPUARMState *env = &cpu->env;
 
     /* Ensure PC is synchronised */
@@ -1088,7 +1087,22 @@ bool kvm_arm_handle_debug(CPUState *cs, struct kvm_debug_exit_arch *debug_exit)
     env->exception.vaddress = debug_exit->far;
     env->exception.target_el = 1;
     qemu_mutex_lock_iothread();
-    cc->do_interrupt(cs);
+
+    /* Hooks may change global state so BQL should be held, also the
+     * BQL needs to be held for any modification of
+     * cs->interrupt_request.
+     */
+    g_assert(qemu_mutex_iothread_locked());
+
+    arm_call_pre_el_change_hook(cpu);
+
+    assert(!excp_is_internal(cs->exception_index));
+    arm_cpu_do_interrupt_aarch64(cs);
+
+    arm_call_el_change_hook(cpu);
+
+    cs->interrupt_request |= CPU_INTERRUPT_EXITTB;
+
     qemu_mutex_unlock_iothread();
 
     return false;

