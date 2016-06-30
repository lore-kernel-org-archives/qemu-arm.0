Received: by 10.25.21.96 with SMTP id l93csp481465lfi;
        Thu, 30 Jun 2016 11:24:58 -0700 (PDT)
X-Received: by 10.55.195.131 with SMTP id r3mr15432401qkl.130.1467311098480;
        Thu, 30 Jun 2016 11:24:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y32si3331597qta.101.2016.06.30.11.24.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Jun 2016 11:24:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52020 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bIge1-00036y-SQ
	for alex.bennee@linaro.org; Thu, 30 Jun 2016 14:24:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45443)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1bIgdw-00034X-8P
	for qemu-arm@nongnu.org; Thu, 30 Jun 2016 14:24:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1bIgdt-0007RV-V0
	for qemu-arm@nongnu.org; Thu, 30 Jun 2016 14:24:51 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:36779)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>)
	id 1bIgdm-0007Pj-SD; Thu, 30 Jun 2016 14:24:42 -0400
Received: by mail-qk0-x242.google.com with SMTP id r68so15752735qka.3;
	Thu, 30 Jun 2016 11:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WwRSIzW06Pbab2itS5ZsQg/oBMvuB0+pTssk8yCRN50=;
	b=by+4L6q+i6OKgazWnOzqK7P+LAYOrfA2W1+I0we3R4iVTTpAYl2hEfmOnRJLhhlx1k
	IaSE3YZvfEMZ+NWKnvzcHo7lgBhzGiy5YLVJVexty+lU9B/JvDTSeQa8Bt0H+3vj31Cp
	FcIX4cZyTsKOlpgpmtx+Af4D2M4ygW21cwMYR9Fe9/wkBB8RjjvU3LP29pkHrORZOuVC
	pjYAzNrr7VPNxpwNxwZ4zpizcrzOf8rn5PT5fC8fSAFvTnUe86lCJi9Bg7PE1mn3xr5H
	RkVwCk1tKFMBCKP3RoEeyF+/xP7D/84n0ihL4l2P4X9dFpTc3nqz2cGW8vg1n5l3JdgC
	IErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WwRSIzW06Pbab2itS5ZsQg/oBMvuB0+pTssk8yCRN50=;
	b=NeR+I1UUYTJ+RrDRJFSg0h8Zo8zztcmmcdejreQfVS2Cu5ewusEfPOOj7F+jM9ofOm
	LmM7Um4s6vunyZKLvnHLJW6TnoZiswCMt3BDLd9jEESKMwGM+3bZmnzh9iswt00m2PE3
	sHjApogpmNXTq5o7S53iJ0H1V1thOM+EmREklE7CstXL4TmpMqTI39nBYyTIDxJfIDti
	EvDrvCL9BR6h+jFCBI1aFeDWSjkR8L3GbhMOU7g6yh17/Uu9DN//wqCpDnlW2ehAKDEZ
	7GBtTB5xZw3ocLUSEQNsGHH/yECg+dDhXqH20Ah6rJ72PjZiJ3Azg3X3HeGEJ8lb8YzM
	g7pQ==
X-Gm-Message-State: ALyK8tLXO0McrdZ3Ru+G5lmiXDz8kQkMGUe26cxw7n3JhTMJnDkqaR+qJzl9o/geXJzf7EfhbRUEuq4DsgTsFg==
X-Received: by 10.37.3.202 with SMTP id 193mr7132470ybd.130.1467311082355;
	Thu, 30 Jun 2016 11:24:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.83.35.205 with HTTP; Thu, 30 Jun 2016 11:24:41 -0700 (PDT)
In-Reply-To: <CAFEAcA8YKL5rBvYtbg22da3x6Xg3MNnHBnjetqL0kxEKqcLXqg@mail.gmail.com>
References: <1467150268-11038-1-git-send-email-andrew.smirnov@gmail.com>
	<1467150268-11038-2-git-send-email-andrew.smirnov@gmail.com>
	<CAFEAcA8YKL5rBvYtbg22da3x6Xg3MNnHBnjetqL0kxEKqcLXqg@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Thu, 30 Jun 2016 11:24:41 -0700
Message-ID: <CAHQ1cqEDf0=RpFb1kaqhPe_qzfjEYBdcsYpjEoTKd-9h=y3wUg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-arm] [RFC PATCH] exec: Support non-direct memory writes
 in cpu_memory_rw_debug
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
Cc: Alexander Graf <agraf@suse.de>, Marcelo Tosatti <mtosatti@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"open list:PReP" <qemu-ppc@nongnu.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	"open list:X86" <kvm@vger.kernel.org>,
	Cornelia Huck <cornelia.huck@de.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Luiz Capitulino <lcapitulino@redhat.com>,
	Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hBim0BQuiliP

On Thu, Jun 30, 2016 at 7:06 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 28 June 2016 at 22:44, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>> Add code to support writing to memory mapped peripherals via
>> cpu_memory_rw_debug(). The code of that function already supports
>> reading from such memory regions, so this commit makes that
>> functionality "symmetric".
>>
>> One use-case for that functionality is setting various registers of a
>> non-running CPU. A concrete example would be starting QEMU emulating
>> Cortex-M with -S, connecting with GDB and modifying the value of Vector
>> Table Offset register.
>>
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>
>>  static uint16_t vring_used_idx(VirtQueue *vq)
>> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
>> index 9f38edf..d5b4966 100644
>> --- a/include/exec/cpu-all.h
>> +++ b/include/exec/cpu-all.h
>> @@ -302,6 +302,6 @@ void dump_opcount_info(FILE *f, fprintf_function cpu_fprintf);
>>  #endif /* !CONFIG_USER_ONLY */
>>
>>  int cpu_memory_rw_debug(CPUState *cpu, target_ulong addr,
>> -                        uint8_t *buf, int len, int is_write);
>> +                        uint8_t *buf, int len, MemTxType type);
>>
>>  #endif /* CPU_ALL_H */
>> diff --git a/include/exec/memory.h b/include/exec/memory.h
>> index 4ab6800..8fbaf1b 100644
>> --- a/include/exec/memory.h
>> +++ b/include/exec/memory.h
>> @@ -14,6 +14,13 @@
>>  #ifndef MEMORY_H
>>  #define MEMORY_H
>>
>> +typedef enum {
>> +    MEMTX_READ,
>> +    MEMTX_WRITE,
>> +    MEMTX_PROGRAM,
>> +} MemTxType;
>
> We already have an enum for this: MMUAccessType.
> That is currently unhelpfully located in cpu-common.h, but there's a
> patch on list which should get applied soon which moves it to
> include/qom/cpu.h:
>  http://patchwork.ozlabs.org/patch/635235/
>
>
>> +
>>  #ifndef CONFIG_USER_ONLY
>>
>>  #define DIRTY_MEMORY_VGA       0
>> @@ -1240,6 +1247,7 @@ AddressSpace *address_space_init_shareable(MemoryRegion *root,
>>   */
>>  void address_space_destroy(AddressSpace *as);
>>
>> +
>>  /**
>>   * address_space_rw: read from or write to an address space.
>>   *
>> @@ -1251,11 +1259,11 @@ void address_space_destroy(AddressSpace *as);
>>   * @addr: address within that address space
>>   * @attrs: memory transaction attributes
>>   * @buf: buffer with the data transferred
>> - * @is_write: indicates the transfer direction
>> + * @type: indicates the transfer type
>>   */
>>  MemTxResult address_space_rw(AddressSpace *as, hwaddr addr,
>>                               MemTxAttrs attrs, uint8_t *buf,
>> -                             int len, bool is_write);
>> +                             int len, MemTxType type);
>>
>>  /**
>>   * address_space_write: write to address space.
>> @@ -1268,10 +1276,11 @@ MemTxResult address_space_rw(AddressSpace *as, hwaddr addr,
>>   * @addr: address within that address space
>>   * @attrs: memory transaction attributes
>>   * @buf: buffer with the data transferred
>> + * @force: force writing to ROM areas
>>   */
>>  MemTxResult address_space_write(AddressSpace *as, hwaddr addr,
>>                                  MemTxAttrs attrs,
>> -                                const uint8_t *buf, int len);
>> +                                const uint8_t *buf, int len, bool force);
>>
>>  /* address_space_ld*: load from an address space
>>   * address_space_st*: store to an address space
>
> I think this patch would be easier to review if it was
> split up, something like:
>  * a patch which just converts the is_write bool parameter to the
>    enum and updates all the callers, with no change in behaviour
>  * a patch which makes use of the ability to pass in something other
>    than 0 or 1
>  * a patch which adds and uses address_space_write_debug(),
>    or whatever API we go for
>
> The important bit is splitting the mechanical "convert bool
> to enum" part (which touches lots of files but makes no
> behaviour change) from the part which changes behaviour
> and doesn't touch many files.

OK, sounds good, will update in v2.

Andrey
