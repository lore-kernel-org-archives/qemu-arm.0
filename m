Received: by 10.182.158.201 with SMTP id ww9csp6411141obb;
        Sun, 27 Dec 2015 12:44:05 -0800 (PST)
X-Received: by 10.55.41.138 with SMTP id p10mr65620001qkp.18.1451249045193;
        Sun, 27 Dec 2015 12:44:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g189si61396121qhd.50.2015.12.27.12.44.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 27 Dec 2015 12:44:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aDIAe-0005fp-Lk
	for alex.bennee@linaro.org; Sun, 27 Dec 2015 15:44:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1aDIAc-0005fi-La
	for qemu-arm@nongnu.org; Sun, 27 Dec 2015 15:44:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1aDIAZ-0005FC-GW
	for qemu-arm@nongnu.org; Sun, 27 Dec 2015 15:44:02 -0500
Received: from mail-qg0-x234.google.com ([2607:f8b0:400d:c04::234]:33603)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1aDIAZ-0005F8-CH; Sun, 27 Dec 2015 15:43:59 -0500
Received: by mail-qg0-x234.google.com with SMTP id b35so6966475qge.0;
	Sun, 27 Dec 2015 12:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=QKy7xuxlR7kuAOsZsGVS8Etc995Vk9XmnBgku/dgS5I=;
	b=R79gMMkRoNWOueOiwNCaUp3EoTtxo6uHw5FhVzqWf+UfGuoepxppr17e4mkKNY1qAD
	UyoGOccG0QTQfZes4eLl8gSGXKPQy18vKE/WsBEnREzZ1JXtT9miFfVrBqZV3cTso5Tf
	w/RZvZT5XFdul0fVXEEe5nDaAz0WIE7t23pQohIDmWw5vjlLvYggGxnOS8dcgSJ9nzU0
	uL4ZN2GpmoAa2eo2B0WC30TptoGs0/S+3zpIERAEIWc4fxixPLNHb3J78+dLm3/gFtBc
	UNPuVUM1BTPxyvSjQKy3aNRozNIFeSrnyyqY+EV8l8DczkWqewT14QawDbEoCVb4Yjaw
	zsqA==
X-Received: by 10.140.44.8 with SMTP id f8mr65723664qga.106.1451249039011;
	Sun, 27 Dec 2015 12:43:59 -0800 (PST)
Received: from [10.0.1.200] (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	x76sm25925999qhb.48.2015.12.27.12.43.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Dec 2015 12:43:58 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-4-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA--3_zaVHzhF5e5SEJ2avcOKVdwitu0iBXLwb9B6z073g@mail.gmail.com>
From: Michael Davidsaver <mdavidsaver@gmail.com>
Message-ID: <56804D8E.3020509@gmail.com>
Date: Sun, 27 Dec 2015 15:43:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA--3_zaVHzhF5e5SEJ2avcOKVdwitu0iBXLwb9B6z073g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::234
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 03/26] armv7m: Explicit error for bad
	vector table
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
X-TUID: gbAMxBuoab8T

On 12/17/2015 08:25 AM, Peter Maydell wrote:
> On 3 December 2015 at 00:18, Michael Davidsaver <mdavidsaver@gmail.com> wrote:
>> ...
>> +static
>> +uint32_t arm_v7m_load_vector(ARMCPU *cpu)
>> +
>> +{
>> +    CPUState *cs = &cpu->parent_obj;
> This isn't the right way to cast to the base class of a QOM object.
> You want:
>    CPUState *cs = CPU(cpu);

from cpu.h

> /* Since this macro is used a lot in hot code paths and in conjunction
> with
>  * FooCPU *foo_env_get_cpu(), we deviate from usual QOM practice by using
>  * an unchecked cast.
>  */
> #define CPU(obj) ((CPUState *)(obj))

Given the present definition of CPU() this change seems like a step
backwards in terms of safety as mis-use won't be caught at compile or
runtime.  I'll change it anyway.


>
>> +    CPUARMState *env = &cpu->env;
>> +    MemTxResult result;
>> +    hwaddr vec = env->v7m.vecbase + env->v7m.exception * 4;
>> +    uint32_t addr;
>> +
>> +    addr = address_space_ldl(cs->as, vec,
>> +                             MEMTXATTRS_UNSPECIFIED, &result);
>> +    if (result != MEMTX_OK) {
> We could use a comment here:
>    /* Architecturally this should cause a HardFault setting HSFR.VECTTBL,
>     * which would then be immediately followed by our failing to load
>     * the entry vector for that HardFault, which is a Lockup case.
>     * Since we don't model Lockup, we just report this guest error
>     * via cpu_abort().
>     */

Added.

