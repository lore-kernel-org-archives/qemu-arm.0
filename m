Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp7634363wrq;
        Thu, 28 Jun 2018 09:41:07 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcBl78MWpZ8o0SekRhzD/YEvyc6CivasRgyrRVydDun0KDp7hV7yRcxtmoFbFfyEqzAQXSW
X-Received: by 2002:a0c:b155:: with SMTP id r21-v6mr4225392qvc.97.1530204067707;
        Thu, 28 Jun 2018 09:41:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530204067; cv=none;
        d=google.com; s=arc-20160816;
        b=f2thRiw3+oVJ+wTn+9ehz6aFpDmP6j13xNsOBudDb/2gcQ5eeaqY0At7NPAroEdHTF
         0vAZJKBweD0R+uzvFgd8JcJ7Ry2aDLa4mIzvdF9Chhoh9o7XUJeYBgtcgJ4RSKAmPcG/
         QKweI1B7j70erQGDGNfnD0atmnDUOJSYRk9XPsvJCxvEH295YR8B0ddcuXs6qbksAMie
         J8GJCqmijkPVK5KhgpZA4eTPNy1D3A47prdsbUZubgXHTNyyvq9l/FvWi4DAqUboNHCp
         edM7wgsFEq8V1zA6p1YiUWLNXJGJ5GeCBqYGDzTl4ezFOR/uvQuXosC9pJJGnJjwiy5c
         0pXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=cGyL/th5OyzyqmxGMRQ0n/xaisBa/JMy4+/3SssHoG8=;
        b=Y1RFEHeCJEY+Qgi6o1P0EhDOiJEyWqMzuUn4MDbc7bDGqphz1pxa1sf02IPRY6dLPX
         rIwMnWiAcI51DzeLSdTTv9IeokcZWdO/BQgr3Ua5TIpfAuY5ZxYJPbYWQUAVwy+/EGgk
         NwKmY3/H6C0Kf84SRaSsh6cuyp9l4GVavmCfmmf1AZIkd1ieZVhSdofZ7eGmY7ArCWIY
         WNucnCfLSB6jxOM36SawlI0CIf0N3PaHhxRXMC80AWfNjzN09YgB4sWMTJFYziO3E+rY
         Ud62jJ6QCi1o6NN+0J47ne0RKmzdmwdhN5t2mp1d4kM2jOzxxorefB/pw4nPSVUKPmFl
         2U7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VzeK8WHl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x16-v6si30869qtp.76.2018.06.28.09.41.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Jun 2018 09:41:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VzeK8WHl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37572 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYZyl-0004b5-8U
	for alex.bennee@linaro.org; Thu, 28 Jun 2018 12:41:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYZyZ-0004ZT-J0
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:40:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fYZyY-0004HM-DI
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:40:55 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:45043)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fYZyX-0004Gc-W6
	for qemu-arm@nongnu.org; Thu, 28 Jun 2018 12:40:54 -0400
Received: by mail-oi0-x241.google.com with SMTP id s198-v6so1922276oih.11
	for <qemu-arm@nongnu.org>; Thu, 28 Jun 2018 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cGyL/th5OyzyqmxGMRQ0n/xaisBa/JMy4+/3SssHoG8=;
	b=VzeK8WHlHi8mtzaexZiW0t/4MKwRd11skWMRZFf5WkZ3Oji5YZM2xfQBklZN3H9aUT
	vaT2tuzYwxQKGTr71G4y+BkJFQh4ayu3nyAX9GpOVp4OPURrEMGik7XwqXzRIl1Ee3ao
	08bFm1WfxCtBiHm9yfLrz+QfpktF3ATAo0yJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cGyL/th5OyzyqmxGMRQ0n/xaisBa/JMy4+/3SssHoG8=;
	b=dfbfd1cyBZjeD3nVFMFrlFr/Hl9epPbN960dL7oA9K/tJ7IVeO5UKFmKJk1Keq89bp
	SpjI8XpVoppyX6zjtH2xh5DAfSZmIvK8lx+Nl1NjQcW+LHF+HTG9Hh60yDUPP2uxI/xm
	Dc0assP8uaac6+C6dBTNefcFYhgMQEA/+wIOhMUV4uOJL9hrH+fi8xufUjoqrF7nd/0n
	HAXLibzgUj6gASKvpdgNZSjCCv/LQf64XIqJpdPnvEh0sxBAZvuJflNSYLOhsxnEUsFK
	S4+qoXFW8leP+1RmHisJq+oT6E53wN4Ie7emXsogjGSBGn75SzFaoEs6ajF97PieP/eZ
	4B5g==
X-Gm-Message-State: APt69E0kavNIXUCItSaKpjIpRrtwZfKYPES78O86C1ujoHZKwLp6PMbu
	BugqOfUZ0ctgkRwvXG9ichqSbCglBX2tSTRTtR9ENQ==
X-Received: by 2002:aca:a846:: with SMTP id
	r67-v6mr6339542oie.12.1530204053209; 
	Thu, 28 Jun 2018 09:40:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:902:0:0:0:0:0 with HTTP;
	Thu, 28 Jun 2018 09:40:32 -0700 (PDT)
In-Reply-To: <1529699547-17044-2-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
	<1529699547-17044-2-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 17:40:32 +0100
Message-ID: <CAFEAcA8601LbuOOARb0KoNLjJep3-ND=Kf44OqW6NXdVtnNocw@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v5 01/13] target/arm: Reorganize PMCCNTR
 accesses
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LRqim5gdRHm1

On 22 June 2018 at 21:32, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> pmccntr_read and pmccntr_write contained duplicate code that was already
> being handled by pmccntr_sync. Consolidate the duplicated code into two
> functions: pmccntr_op_start and pmccntr_op_finish. Add a companion to
> c15_ccnt in CPUARMState so that we can simultaneously save both the
> architectural register value and the last underlying cycle count - this
> ensure time isn't lost and will also allow us to access the 'old'
> architectural register value in order to detect overflows in later
> patches.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/cpu.h    |  28 ++++++++++-----
>  target/arm/helper.c | 100 ++++++++++++++++++++++++++++------------------------
>  2 files changed, 73 insertions(+), 55 deletions(-)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 8488273..ba2c876 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -467,10 +467,20 @@ typedef struct CPUARMState {
>          uint64_t oslsr_el1; /* OS Lock Status */
>          uint64_t mdcr_el2;
>          uint64_t mdcr_el3;
> -        /* If the counter is enabled, this stores the last time the counter
> -         * was reset. Otherwise it stores the counter value
> +        /* Stores the architectural value of the counter *the last time it was
> +         * updated* by pmccntr_op_start. Accesses should always be surrounded
> +         * by pmccntr_op_start/pmccntr_op_finish to guarantee the latest
> +         * architecturally-corect value is being read/set.

"correct"

>           */
>          uint64_t c15_ccnt;
> +        /* Stores the delta between the architectural value and the underlying
> +         * cycle count during normal operation. It is used to update c15_ccnt
> +         * to be the correct architectural value before accesses. During
> +         * accesses, c15_ccnt_delta contains the underlying count being used
> +         * for the access, after which it reverts to the delta value in
> +         * pmccntr_op_finish.
> +         */
> +        uint64_t c15_ccnt_delta;

I had a look through the patchset, and I still can't see
anything here which indicates how we're handling migration.

If this field is only ever used as a temporary while we're
between op_start and op_finish, then we can just return it from
start and take it as an argument to finish, and we're fine
(migration of the PMCCNTR_EL0 register will be done by calling
its readfn on the source and its writefn on the destination).

If there's a reason for having this be a field in the state struct
(I think you said counter overflow)? then we need to be sure that
migration is going to do the right thing and that we don't for instance
lose overflow indications during a migration.

>          uint64_t pmccfiltr_el0; /* Performance Monitor Filter Register */
>          uint64_t vpidr_el2; /* Virtualization Processor ID Register */
>          uint64_t vmpidr_el2; /* Virtualization Multiprocessor ID Register */
> @@ -924,15 +934,17 @@ int cpu_arm_signal_handler(int host_signum, void *pinfo,
>                             void *puc);
>
>  /**
> - * pmccntr_sync
> + * pmccntr_op_start/finish
>   * @env: CPUARMState
>   *
> - * Synchronises the counter in the PMCCNTR. This must always be called twice,
> - * once before any action that might affect the timer and again afterwards.
> - * The function is used to swap the state of the register if required.
> - * This only happens when not in user mode (!CONFIG_USER_ONLY)
> + * Convert the counter in the PMCCNTR between its delta form (the typical mode
> + * when it's enabled) and the guest-visible value. These two calls must always
> + * surround any action which might affect the counter, and the return value
> + * from pmccntr_op_start must be supplied as the second argument to
> + * pmccntr_op_finish.
>   */
> -void pmccntr_sync(CPUARMState *env);
> +void pmccntr_op_start(CPUARMState *env);
> +void pmccntr_op_finish(CPUARMState *env);

The comment says pmccntr_op_start() returns a value but the
prototype says it doesn't...

thanks
-- PMM
