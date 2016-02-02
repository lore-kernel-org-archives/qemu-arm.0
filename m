Received: by 10.25.159.19 with SMTP id i19csp614984lfe;
        Tue, 2 Feb 2016 04:24:13 -0800 (PST)
X-Received: by 10.140.101.119 with SMTP id t110mr34810005qge.68.1454415853262;
        Tue, 02 Feb 2016 04:24:13 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u19si837386qka.36.2016.02.02.04.24.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Feb 2016 04:24:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:56585 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aQa0C-0006FR-P4
	for alex.bennee@linaro.org; Tue, 02 Feb 2016 07:24:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51714)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQa0A-0006FL-Ke
	for qemu-arm@nongnu.org; Tue, 02 Feb 2016 07:24:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQa06-0005Xj-Qv
	for qemu-arm@nongnu.org; Tue, 02 Feb 2016 07:24:10 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:34443)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aQa06-0005Xa-D7
	for qemu-arm@nongnu.org; Tue, 02 Feb 2016 07:24:06 -0500
Received: by mail-vk0-x232.google.com with SMTP id e185so95552000vkb.1
	for <qemu-arm@nongnu.org>; Tue, 02 Feb 2016 04:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=xShZouSlXSE6INdAZAPiNlEIesLEAWVDUG+mURrToGU=;
	b=Lx0hkTQMxIcCY6NhXMRrQPwTUtn9T9HOn6ZqaDnUddQUCpbNua5C7cA41NBAR3n0Iz
	3SA8fst3VR8JfOp2OMUeT3p+LN6SSy0Z3FYJcDtRkpr4F8EDV0pJH8uFHLckz4zhAf0G
	CyioIL5xAoCc+uTC/DmgKuNEStp1ZFulGTd8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xShZouSlXSE6INdAZAPiNlEIesLEAWVDUG+mURrToGU=;
	b=G3pYf1QP0tEtbgZ48KQjebSxe+lxTfToqcNkiJaitXGhA4N31Lmap80vz4Ey/gx+JS
	hXvdeGTiJkCNCCyEE2fBevVM+nq+D21IFonUGEXElVP1CAjYpZbQZRCBrfRv7Ia150ZG
	0aslg/KfOrbeEjmPCWlrRsQLZ4m1Hp3hTNDghlmRW1mEnK79Z73xtexAD8zZ51gACMGq
	9ivMXLhdra0kkNMFLNhpwt6mBM/0UBktu7lRwEOT6OIqPZZJ2c6Fhk7SxqPaQOKv/kM2
	kIPXUcEjwEU8E37nwNdtnYbhqTIw50QQT2gwYzJDQdFPHdMrzfFCthG7CceDRkYONp5k
	oaCQ==
X-Gm-Message-State: AG10YOSYwi8rgYxaNpheRgxElYULHKF+n8mcpa8mkxPTJEZoJiGbrA1j2OQeOQD47P55KFhF7aQC4kE1R6y9P81b
X-Received: by 10.31.194.130 with SMTP id s124mr19951166vkf.92.1454415845879; 
	Tue, 02 Feb 2016 04:24:05 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Tue, 2 Feb 2016 04:23:46 -0800 (PST)
In-Reply-To: <1454256948-10485-2-git-send-email-serge.fdrv@gmail.com>
References: <1454256948-10485-1-git-send-email-serge.fdrv@gmail.com>
	<1454256948-10485-2-git-send-email-serge.fdrv@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 Feb 2016 12:23:46 +0000
Message-ID: <CAFEAcA9MXhTT2aqEvaDx4ksOMuDU15Z4Wp_4ht+dT3XufPSrbw@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [PATCH v3 1/2] cpu: Add callback to check
 architectural watchpoint match
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Dj7etkeOn24p

On 31 January 2016 at 16:15, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> When QEMU watchpoint matches, that is not definitely an architectural
> watchpoint match yet. If it is a stop-before-access watchpoint then that
> is hardly possible to ignore it after throwing a TCG exception.
>
> A special callback is introduced to check for architectural watchpoint
> match before raising a TCG exception.
>
> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>

This looks OK to me, but there's one QOM CPU style question
I'd like Andreas's view on.

> @@ -2024,6 +2024,7 @@ static const MemoryRegionOps notdirty_mem_ops = {
>  static void check_watchpoint(int offset, int len, MemTxAttrs attrs, int flags)
>  {
>      CPUState *cpu = current_cpu;
> +    CPUClass *cc = CPU_GET_CLASS(cpu);
>      CPUArchState *env = cpu->env_ptr;
>      target_ulong pc, cs_base;
>      target_ulong vaddr;
> @@ -2049,6 +2050,11 @@ static void check_watchpoint(int offset, int len, MemTxAttrs attrs, int flags)
>              wp->hitaddr = vaddr;
>              wp->hitattrs = attrs;
>              if (!cpu->watchpoint_hit) {
> +                if (wp->flags & BP_CPU &&
> +                    !cc->debug_check_watchpoint(cpu, wp)) {

At least some of the QOM CPU methods have wrapper functions
(eg cpu_set_pc(), cpu_unaligned_access()) that just bundle up
the CPU_GET_CLASS and method invocation). Should new methods
like the debug_check_watchpoint() introduced by this patch have
that kind of wrapper function, or is it optional?

(There also seems to be a mix of "implement default/common
behaviour in a common method implementation" vs "implement
it in the wrapper function if the method pointer is NULL".
I think the former, as done in this patch, is probably nicer
but again would defer to Andreas.)

thanks
-- PMM
