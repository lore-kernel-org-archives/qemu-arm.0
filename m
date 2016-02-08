Received: by 10.25.159.19 with SMTP id i19csp1401744lfe;
        Mon, 8 Feb 2016 07:42:32 -0800 (PST)
X-Received: by 10.55.52.211 with SMTP id b202mr35254380qka.27.1454946152282;
        Mon, 08 Feb 2016 07:42:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p45si11913042qgd.18.2016.02.08.07.42.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Feb 2016 07:42:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:45896 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aSnxP-0000PP-Pe
	for alex.bennee@linaro.org; Mon, 08 Feb 2016 10:42:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47798)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSnxN-0000Ou-EO
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 10:42:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSnxM-0001t8-Gh
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 10:42:29 -0500
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:35011)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aSnxM-0001sy-89
	for qemu-arm@nongnu.org; Mon, 08 Feb 2016 10:42:28 -0500
Received: by mail-vk0-x233.google.com with SMTP id e6so97440377vkh.2
	for <qemu-arm@nongnu.org>; Mon, 08 Feb 2016 07:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=5JrSKzpAWGPWgc7h1WivWKMYTWeYc5hrfhE0QSWEjGA=;
	b=D8yKKoZzqIQVRsME03nuyUQyeUNKFnPXL9hNL2yAw8PaQyFYc8D2T9PNvTgz49gzHG
	as7GFeiabrip37G8g9wjK+B0q4ZsWEFCT9C212M94IOuCOhm7uMJWfnb7aSCchGQzNSD
	G7znHhTYbwgQzT//j/Cm+BvcLNndfEsuvFbi0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5JrSKzpAWGPWgc7h1WivWKMYTWeYc5hrfhE0QSWEjGA=;
	b=JRjFHEgV0ciAsgVsvz+r9yDvuIQZuV+oUBNf47NfcGwEUMIYzttyEhf6xqlxDnqxE3
	NcqWn5zi6wZWGgjaT1h+OaGGHa4rRKJr5iwbklDg8cjb/UvQzYuXEbYjLFjk4HfZUpg9
	S/6sxeeSOTsoMAZ3XLc+uWAxqBcUeFvv5mwD60T3w2FbK6BEESD13v5tCFxz4kw/8Nra
	Dim5i11pWcwi1O9tQxxc00whbYetau2S43nfxZ0RpuvFQ53YocQscnUklh6ZT31rNMzB
	DjBirLzP4vo1FvbzaQxND/xeq7lmLBeIj0o1XxCV7hNMCLQ4p+oO7wHE5rDsOvcrh62D
	RH1A==
X-Gm-Message-State: AG10YOSGMak2qg2DZ0K1gRUXkzCLwQBc3FLbPqJqu2QRK8yzupl2vVFPgMWbiE5cFDIHB4vZq+jvztm8trzN7jJQ
X-Received: by 10.31.47.207 with SMTP id v198mr20627584vkv.6.1454946147150;
	Mon, 08 Feb 2016 07:42:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 8 Feb 2016 07:42:07 -0800 (PST)
In-Reply-To: <CAFEAcA9MXhTT2aqEvaDx4ksOMuDU15Z4Wp_4ht+dT3XufPSrbw@mail.gmail.com>
References: <1454256948-10485-1-git-send-email-serge.fdrv@gmail.com>
	<1454256948-10485-2-git-send-email-serge.fdrv@gmail.com>
	<CAFEAcA9MXhTT2aqEvaDx4ksOMuDU15Z4Wp_4ht+dT3XufPSrbw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Feb 2016 15:42:07 +0000
Message-ID: <CAFEAcA_gTqN6NWZwngezWp0HrMU_4tA9523q2UH9wBXjeNsyew@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
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
X-TUID: Fx9yOfIqAamK

Andreas -- can I nudge you to say your preferences on whether
QOM CPU methods should have wrapper functions, please?
I think this patchset is otherwise ready to apply.

thanks
-- PMM

On 2 February 2016 at 12:23, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 31 January 2016 at 16:15, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
>> When QEMU watchpoint matches, that is not definitely an architectural
>> watchpoint match yet. If it is a stop-before-access watchpoint then that
>> is hardly possible to ignore it after throwing a TCG exception.
>>
>> A special callback is introduced to check for architectural watchpoint
>> match before raising a TCG exception.
>>
>> Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>
>
> This looks OK to me, but there's one QOM CPU style question
> I'd like Andreas's view on.
>
>> @@ -2024,6 +2024,7 @@ static const MemoryRegionOps notdirty_mem_ops = {
>>  static void check_watchpoint(int offset, int len, MemTxAttrs attrs, int flags)
>>  {
>>      CPUState *cpu = current_cpu;
>> +    CPUClass *cc = CPU_GET_CLASS(cpu);
>>      CPUArchState *env = cpu->env_ptr;
>>      target_ulong pc, cs_base;
>>      target_ulong vaddr;
>> @@ -2049,6 +2050,11 @@ static void check_watchpoint(int offset, int len, MemTxAttrs attrs, int flags)
>>              wp->hitaddr = vaddr;
>>              wp->hitattrs = attrs;
>>              if (!cpu->watchpoint_hit) {
>> +                if (wp->flags & BP_CPU &&
>> +                    !cc->debug_check_watchpoint(cpu, wp)) {
>
> At least some of the QOM CPU methods have wrapper functions
> (eg cpu_set_pc(), cpu_unaligned_access()) that just bundle up
> the CPU_GET_CLASS and method invocation). Should new methods
> like the debug_check_watchpoint() introduced by this patch have
> that kind of wrapper function, or is it optional?
>
> (There also seems to be a mix of "implement default/common
> behaviour in a common method implementation" vs "implement
> it in the wrapper function if the method pointer is NULL".
> I think the former, as done in this patch, is probably nicer
> but again would defer to Andreas.)
>
> thanks
> -- PMM
