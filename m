Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp750553wrx;
        Fri, 22 Mar 2019 07:02:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyxLkPGI6630KFyUmDFDjYNH/r2H9cnFsKRUGlRtablxUzob9/OA5vl+cC5wb/921+b5rGR
X-Received: by 2002:aed:3aaa:: with SMTP id o39mr8361828qte.109.1553263323071;
        Fri, 22 Mar 2019 07:02:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553263323; cv=none;
        d=google.com; s=arc-20160816;
        b=S0CgGUzO7ELNdA1mhEtpySsZBNoNKXagOhcTKd0wOfLEJhcD+fecD7xZhB18qAtKVs
         AKXyf9ZhfFGAaX7DCLl0oGB0XdiP95L3BW6iMxpC8tOrge/MlkZs9895DM0SIP1C+ZRc
         BlruEBdv+rwSFuFqvmZGnxXgwU2lS+Jc8OzCrRTs9x8nkWo71L08dBhfQEKkqDv53cXV
         RmnNpj0UqZsmTaEM7cL44PGs50rN27AHhI5urdo5yah2y/+yZWgBwDvyTtTYQs1dIa04
         MT2ECQoxlLpOWB+LtxWFWqrjNsBNuXuEYXHHZphrY5Phds50r9BmYrjgCYRcaNJvXLA8
         F4JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:dkim-signature:dkim-signature;
        bh=6mJAI3Xd6LLwL3buIHr4dKXdhAMpkqaoCYzL0EqE1RE=;
        b=dn1vc4ykAJAuZLF0muZPxdhPk2iwyL3Lbytq6jNe1AxGJCSgT2H0w/KGdrPSpGJ6JY
         l3+/gL+xKUdb9u4A98LtuBP87MJQwiX2PEJwe/ZAsibJrcGkxrTb9uNLcb/QDx/qQaB0
         qcfQRCGA9aDg6hwXdKDY6yzsVJlP65YfYcFAg/zzDp25ep2MgaYJcuTT8Jezqac9cZQ0
         RXFhn63ZRvxIidCMmJYLyiQBa/X7uitY0/mAGnOL3wjF2bPqu2H+eFfv3sHb3dIK0vOt
         u8afZ0fhsf/5m3DW+lN3UdgTJkz01aa/ANyId2f1RsbrNmWjISrg8q8uinIO2qNgUYje
         uQ/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=JW0tAZHG;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=mZo2FV40;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=mZo2FV40;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l32si2074615qve.83.2019.03.22.07.02.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Mar 2019 07:02:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=JW0tAZHG;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=mZo2FV40;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=mZo2FV40;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:57913 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h7KkE-0008BD-Dc
	for alex.bennee@linaro.org; Fri, 22 Mar 2019 10:02:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1h7Kk0-00089l-0c
	for qemu-arm@nongnu.org; Fri, 22 Mar 2019 10:01:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1h7Kjx-0000P0-VI
	for qemu-arm@nongnu.org; Fri, 22 Mar 2019 10:01:47 -0400
Received: from greensocs.com ([193.104.36.180]:42686)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1h7Kjt-0000AW-Uh; Fri, 22 Mar 2019 10:01:44 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 710E17D7886;
	Fri, 22 Mar 2019 15:01:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553263292;
	bh=KaKg+Rw1ptM3k9PEAtgLnabm7vkkcZIX1+3XuIH+T2I=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=JW0tAZHG3At39phrXs7RZymlv0copNn7+WduKx1PR6YDjFaCoG3AeZAYiCaErqeOC
	4yhXIdUkyXid7hZa5VSJgrRQiScHSf05ekCHqFQgUvmymUUZtNX0EGCv0bZWEwc82L
	WzQ+I+3hgjqoiNIKDTsm5EAkijgt9HH/2gXEb4mI=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=mZo2FV40;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=mZo2FV40
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vW-QRU4GlIiR; Fri, 22 Mar 2019 15:01:31 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id EE9007D7887; Fri, 22 Mar 2019 15:01:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553263290;
	bh=KaKg+Rw1ptM3k9PEAtgLnabm7vkkcZIX1+3XuIH+T2I=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=mZo2FV40fbyY5z6G6nJpbu8jkfab10nUbYmu2oQ95uzE5QHV7gCgaCUdATOT33/WC
	NLwR03KOvRsWUQkLQPosSOHW+xTRP+EAlGKAe5Y+mhFZvSXvhl4Q8lgXWNoTnRv6zN
	WXpQVHS9zlIVColV9mVS2AkYDDoLR50SPohrdPB4=
Received: from [192.168.61.102] (lfbn-1-8165-82.w90-112.abo.wanadoo.fr
	[90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 7A33D7D7886;
	Fri, 22 Mar 2019 15:01:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553263290;
	bh=KaKg+Rw1ptM3k9PEAtgLnabm7vkkcZIX1+3XuIH+T2I=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=mZo2FV40fbyY5z6G6nJpbu8jkfab10nUbYmu2oQ95uzE5QHV7gCgaCUdATOT33/WC
	NLwR03KOvRsWUQkLQPosSOHW+xTRP+EAlGKAe5Y+mhFZvSXvhl4Q8lgXWNoTnRv6zN
	WXpQVHS9zlIVColV9mVS2AkYDDoLR50SPohrdPB4=
To: Jan Kiszka <jan.kiszka@siemens.com>, qemu-devel@nongnu.org,
	Lucien Anti-Spam <lucienmp_antispam@yahoo.com>
References: <20181207090135.7651-1-luc.michel@greensocs.com>
	<20181207090135.7651-6-luc.michel@greensocs.com>
	<9dbafcdb-75f1-b52b-b62d-f36e3a13404b@siemens.com>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <a4e14ea5-dbbc-c970-ccfd-bed51ad2bf58@greensocs.com>
Date: Fri, 22 Mar 2019 15:01:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <9dbafcdb-75f1-b52b-b62d-f36e3a13404b@siemens.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH v8 05/16] gdbstub: add multiprocess support
 to vCont packets
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Whwav4FURbPO

On 3/22/19 2:29 PM, Jan Kiszka wrote:
> On 07.12.18 10:01, Luc Michel wrote:
>> Add the gdb_first_attached_cpu() and gdb_next_attached_cpu() to iterat=
e
>> over all the CPUs in currently attached processes.
>>
>> Add the gdb_first_cpu_in_process() and gdb_next_cpu_in_process() to
>> iterate over CPUs of a given process.
>>
>> Use them to add multiprocess extension support to vCont packets.
>>
>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>   gdbstub.c | 117 +++++++++++++++++++++++++++++++++++++++++++++++-----=
--
>>   1 file changed, 102 insertions(+), 15 deletions(-)
>>
>> diff --git a/gdbstub.c b/gdbstub.c
>> index 911faa225a..77b3dbb2c8 100644
>> --- a/gdbstub.c
>> +++ b/gdbstub.c
>> @@ -721,10 +721,40 @@ static CPUState *find_cpu(uint32_t thread_id)
>>       }
>>  =20
>>       return NULL;
>>   }
>>  =20
>> +static CPUState *get_first_cpu_in_process(const GDBState *s,
>> +                                          GDBProcess *process)
>> +{
>> +    CPUState *cpu;
>> +
>> +    CPU_FOREACH(cpu) {
>> +        if (gdb_get_cpu_pid(s, cpu) =3D=3D process->pid) {
>> +            return cpu;
>> +        }
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>> +static CPUState *gdb_next_cpu_in_process(const GDBState *s, CPUState =
*cpu)
>> +{
>> +    uint32_t pid =3D gdb_get_cpu_pid(s, cpu);
>> +    cpu =3D CPU_NEXT(cpu);
>> +
>> +    while (cpu) {
>> +        if (gdb_get_cpu_pid(s, cpu) =3D=3D pid) {
>> +            break;
>> +        }
>> +
>> +        cpu =3D CPU_NEXT(cpu);
>> +    }
>> +
>> +    return cpu;
>> +}
>> +
>>   static CPUState *gdb_get_cpu(const GDBState *s, uint32_t pid, uint32=
_t tid)
>>   {
>>       GDBProcess *process;
>>       CPUState *cpu;
>>  =20
>> @@ -750,10 +780,41 @@ static CPUState *gdb_get_cpu(const GDBState *s, =
uint32_t pid, uint32_t tid)
>>       }
>>  =20
>>       return cpu;
>>   }
>>  =20
>> +/* Return the cpu following @cpu, while ignoring
>> + * unattached processes.
>> + */
>> +static CPUState *gdb_next_attached_cpu(const GDBState *s, CPUState *c=
pu)
>> +{
>> +    cpu =3D CPU_NEXT(cpu);
>> +
>> +    while (cpu) {
>> +        if (gdb_get_cpu_process(s, cpu)->attached) {
>> +            break;
>> +        }
>> +
>> +        cpu =3D CPU_NEXT(cpu);
>> +    }
>> +
>> +    return cpu;
>> +}
>> +
>> +/* Return the first attached cpu */
>> +static CPUState *gdb_first_attached_cpu(const GDBState *s)
>> +{
>> +    CPUState *cpu =3D first_cpu;
>> +    GDBProcess *process =3D gdb_get_cpu_process(s, cpu);
>> +
>> +    if (!process->attached) {
>> +        return gdb_next_attached_cpu(s, cpu);
>> +    }
>> +
>> +    return cpu;
>> +}
>> +
>>   static const char *get_feature_xml(const char *p, const char **newp,
>>                                      CPUClass *cc)
>>   {
>>       size_t len;
>>       int i;
>> @@ -1088,14 +1149,16 @@ static int is_query_packet(const char *p, cons=
t char *query, char separator)
>>    * returns -ENOTSUP if a command is unsupported, -EINVAL or -ERANGE =
if there is
>>    *         a format error, 0 on success.
>>    */
>>   static int gdb_handle_vcont(GDBState *s, const char *p)
>>   {
>> -    int res, idx, signal =3D 0;
>> +    int res, signal =3D 0;
>>       char cur_action;
>>       char *newstates;
>>       unsigned long tmp;
>> +    uint32_t pid, tid;
>> +    GDBProcess *process;
>>       CPUState *cpu;
>>   #ifdef CONFIG_USER_ONLY
>>       int max_cpus =3D 1; /* global variable max_cpus exists only in s=
ystem mode */
>>  =20
>>       CPU_FOREACH(cpu) {
>> @@ -1134,29 +1197,52 @@ static int gdb_handle_vcont(GDBState *s, const=
 char *p)
>>           } else if (cur_action !=3D 'c' && cur_action !=3D 's') {
>>               /* unknown/invalid/unsupported command */
>>               res =3D -ENOTSUP;
>>               goto out;
>>           }
>> -        /* thread specification. special values: (none), -1 =3D all; =
0 =3D any */
>> -        if ((p[0] =3D=3D ':' && p[1] =3D=3D '-' && p[2] =3D=3D '1') |=
| (p[0] !=3D ':')) {
>> -            if (*p =3D=3D ':') {
>> -                p +=3D 3;
>> -            }
>> -            for (idx =3D 0; idx < max_cpus; idx++) {
>> -                if (newstates[idx] =3D=3D 1) {
>> -                    newstates[idx] =3D cur_action;
>> +
>> +        if (*p++ !=3D ':') {
>> +            res =3D -ENOTSUP;
>> +            goto out;
>> +        }
>> +
>> +        switch (read_thread_id(p, &p, &pid, &tid)) {
>> +        case GDB_READ_THREAD_ERR:
>> +            res =3D -EINVAL;
>> +            goto out;
>> +
>> +        case GDB_ALL_PROCESSES:
>> +            cpu =3D gdb_first_attached_cpu(s);
>> +            while (cpu) {
>> +                if (newstates[cpu->cpu_index] =3D=3D 1) {
>> +                    newstates[cpu->cpu_index] =3D cur_action;
>>                   }
>> +
>> +                cpu =3D gdb_next_attached_cpu(s, cpu);
>>               }
>> -        } else if (*p =3D=3D ':') {
>> -            p++;
>> -            res =3D qemu_strtoul(p, &p, 16, &tmp);
>> -            if (res) {
>> +            break;
>> +
>> +        case GDB_ALL_THREADS:
>> +            process =3D gdb_get_process(s, pid);
>> +
>> +            if (!process->attached) {
>> +                res =3D -EINVAL;
>>                   goto out;
>>               }
>>  =20
>> -            /* 0 means any thread, so we pick the first valid CPU */
>> -            cpu =3D tmp ? find_cpu(tmp) : first_cpu;
>> +            cpu =3D get_first_cpu_in_process(s, process);
>> +            while (cpu) {
>> +                if (newstates[cpu->cpu_index] =3D=3D 1) {
>> +                    newstates[cpu->cpu_index] =3D cur_action;
>> +                }
>> +
>> +                cpu =3D gdb_next_cpu_in_process(s, cpu);
>> +            }
>> +            break;
>> +
>> +        case GDB_ONE_THREAD:
>> +            cpu =3D gdb_get_cpu(s, pid, tid);
>>  =20
>>               /* invalid CPU/thread specified */
>>               if (!cpu) {
>>                   res =3D -EINVAL;
>>                   goto out;
>> @@ -1164,10 +1250,11 @@ static int gdb_handle_vcont(GDBState *s, const=
 char *p)
>>  =20
>>               /* only use if no previous match occourred */
>>               if (newstates[cpu->cpu_index] =3D=3D 1) {
>>                   newstates[cpu->cpu_index] =3D cur_action;
>>               }
>> +            break;
>>           }
>>       }
>>       s->signal =3D signal;
>>       gdb_continue_partial(s, newstates);
>>  =20
>>
>=20
> This breaks system-level debugging with gdb, at least with version
> 7.7.50 and for x86 targets.

I think it's related to
https://www.mail-archive.com/qemu-devel@nongnu.org/msg601065.html

[snip]
> Sending packet: $vCont;s:1;c#c1...Ack
> Packet received: E22
> warning: Remote failure reply: E22
[snip]

The vCont packet does not specifies a thread-id for the last action.
This is a valid syntax, incorrectly treated as an error by the stub.

Lucien: do you plan to send a re-roll? Otherwise I'll do it on next
Monday (25/03) because I would like this bug to be fixed before it hits 4=
.0.

Thanks.

--=20
Luc



