Received: by 10.182.158.201 with SMTP id ww9csp2581097obb;
        Tue, 15 Dec 2015 09:32:03 -0800 (PST)
X-Received: by 10.140.102.244 with SMTP id w107mr54596062qge.90.1450200723481;
        Tue, 15 Dec 2015 09:32:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t186si2034043qhc.13.2015.12.15.09.32.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Dec 2015 09:32:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:38408 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a8tSF-00011I-5a
	for alex.bennee@linaro.org; Tue, 15 Dec 2015 12:32:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8tSC-0000yP-Bb
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 12:32:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8tSB-0007gD-Br
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 12:32:00 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:35875)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a8tSB-0007g7-69
	for qemu-arm@nongnu.org; Tue, 15 Dec 2015 12:31:59 -0500
Received: by mail-vk0-x22f.google.com with SMTP id y187so10221561vka.3
	for <qemu-arm@nongnu.org>; Tue, 15 Dec 2015 09:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YPo3sFMjLZJ3xALcC04tgXaZKC58B58uUPXGQF7NpLA=;
	b=TjU89H5jFojR5eJYuAkpBaQv3PQgB7VILuhvn3WdFFvcIgCwlCjdlq1hvpIDPD7ceF
	f68xNsqq+BM9FVB2/0WZnTJHzyFUWQ3PSSg5UiDUTeZf0DYZdfMkRxSjsTeLiSiaUaPy
	RIZoYocc40h10iQ7qXo+nxaqEDJ23hjRj0TK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YPo3sFMjLZJ3xALcC04tgXaZKC58B58uUPXGQF7NpLA=;
	b=Oj+/7DzfBe7UoTtNYJY6beonHknoesG7hMJB9FRqBJEG4bRA26siQST5hN3A8P9oGh
	e4BlsBk8wGaf4Bd7HOSUa9RdSKUOE/hdreNzW6wVnmuMHo+7JRAwr6BMfOWQHmM5mrcs
	NL4TjcZMwz79xdxRrJuMcqov2BxtXCvJdZJgGUQxM8GjIQl+teOZUiNw1BgLQgbDNpyG
	LlIRN638eWtFEwU0lWR9BLc7ndJaAU9MdMElQ/Xx0gAE/ub9oxUrkqfUZCUhRPmTr+JR
	Uzd6Lt05/7BHNQiaADlpHgrWC10fUx4tkKbcqBUX2KAXCMzHgth9Bwn6Y+0pYrui4kTz
	Tm8g==
X-Gm-Message-State: ALoCoQnYcyT9ExBQgw35kHYQdhajyMKgAM02M4JiofpxtQ9B8JAZLtEeh5QhtAG0R6AAHxN6I6Ejk7kffuN7OIlCmHVWpWhxEkkCFeiIM+4Zo5k8kk/VnPM=
X-Received: by 10.31.47.197 with SMTP id v188mr29743842vkv.6.1450200718661;
	Tue, 15 Dec 2015 09:31:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 15 Dec 2015 09:31:39 -0800 (PST)
In-Reply-To: <1449167808-5656-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1449167808-5656-1-git-send-email-Andrew.Baumann@microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Dec 2015 17:31:39 +0000
Message-ID: <CAFEAcA922pjJBa7otZxZBazO2P09MpQSnwyywAbfMdNwCoqYbA@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2] target-arm: raise exception on misaligned
	LDREX operands
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
X-TUID: Ay1lZ5tuommN

On 3 December 2015 at 18:36, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Qemu does not generally perform alignment checks. However, the ARM ARM
> requires implementation of alignment exceptions for a number of cases
> including LDREX, and Windows-on-ARM relies on this.
>
> This change adds plumbing to enable alignment checks on loads using
> MO_ALIGN, a do_unaligned_access hook to raise the exception (data
> abort), and uses the new aligned loads in LDREX (for all but
> single-byte loads).
>
> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
> Thanks for the feedback on v1! I wish I had known about (or gone
> looking for) MO_ALIGN sooner...
>
> arm_regime_using_lpae_format() is a no-op wrapper I added to export
> regime_using_lpae_format (which is a static inline). Would it be
> preferable to simply export the existing function, and rename it? If
> so, is this still the correct name to use for the function?

The way you have it seems OK to me.

> +/* Raise a data fault alignment exception for the specified virtual address */
> +void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr, int is_write,
> +                                 int is_user, uintptr_t retaddr)
> +{
> +    ARMCPU *cpu = ARM_CPU(cs);
> +    CPUARMState *env = &cpu->env;
> +    int target_el;
> +    bool same_el;
> +
> +    if (retaddr) {
> +        /* now we have a real cpu fault */
> +        cpu_restore_state(cs, retaddr);
> +    }
> +
> +    target_el = exception_target_el(env);
> +    same_el = (arm_current_el(env) == target_el);
> +
> +    env->exception.vaddress = vaddr;
> +
> +    /* the DFSR for an alignment fault depends on whether we're using
> +     * the LPAE long descriptor format, or the short descriptor format */
> +    if (arm_regime_using_lpae_format(env, cpu_mmu_index(env, false))) {
> +        env->exception.fsr = 0x21;
> +    } else {
> +        env->exception.fsr = 0x1;
> +    }
> +
> +    raise_exception(env, EXCP_DATA_ABORT,
> +                    syn_data_abort(same_el, 0, 0, 0, 0, 0x21),
> +                    target_el);
> +}

This isn't propagating the 'read or write' information
from is_write into the syndrome and DFSR. You need this minor
tweak:

diff --git a/target-arm/op_helper.c b/target-arm/op_helper.c
index c6995ca..3e5e0d3 100644
--- a/target-arm/op_helper.c
+++ b/target-arm/op_helper.c
@@ -154,8 +154,12 @@ void arm_cpu_do_unaligned_access(CPUState *cs,
vaddr vaddr, int is_write,
         env->exception.fsr = 0x1;
     }

+    if (is_write == 1 && arm_feature(env, ARM_FEATURE_V6)) {
+        env->exception.fsr |= (1 << 11);
+    }
+
     raise_exception(env, EXCP_DATA_ABORT,
-                    syn_data_abort(same_el, 0, 0, 0, 0, 0x21),
+                    syn_data_abort(same_el, 0, 0, 0, is_write == 1, 0x21),
                     target_el);
 }

(compare the similar code in tlb_fill()).

I'm just going to squash that in when I apply this to target-arm.next,
to save you having to respin.

thanks
-- PMM
