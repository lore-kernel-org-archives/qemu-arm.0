Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp561151wrt;
        Mon, 19 Nov 2018 00:21:54 -0800 (PST)
X-Google-Smtp-Source: AJdET5deGY8sKV3SUMHL/lkZf0ncGHTji04OFow/hYuCxWEWiz11qVSDYZqHBxnBQpCn3dPEPfW6
X-Received: by 2002:a0c:eaca:: with SMTP id y10mr20237492qvp.176.1542615714118;
        Mon, 19 Nov 2018 00:21:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542615714; cv=none;
        d=google.com; s=arc-20160816;
        b=in8uNKB8xU3bPYNqj12sRbewT2jgb6+YoCe6MpIHuLsQm+N+XKLdCI5g0Mrq1t6OoM
         OvQlTJq3LLrOLx2ykdUqBHGNvnAsnVZXPbQjxmXa+6zmqd0FMSp4grs2dxuV1HHDlbHb
         Ym+duxqd/Ox+iNmpGHiRSjw5aER+qK1bpNFJA5wo4yRxodjUus3g2SYjJ+81ES9sd6DU
         X53NSCwDCqwwus+q0DT2P2Or4WNp5R/BzG6/Y+1VQ3xeWwhRyWiZPKIC1wZIv2rnhFRa
         jLu/OtwK8eJLjbX9xZ56TzGdd9bEUmr+YebHjup+BzSnQjQoktMnNn/FKLFEDGpi3dpl
         ShYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:dkim-signature:dkim-signature;
        bh=xpZTmtbwLYu7x0+6UTQbzxH8oKnyX87EJejKc+nSUIk=;
        b=M+cdyijFHFbF715D6MUvMDhziF2Du9ERw/swVDVLT5VbyZBjJK2WPUvetspLUrIn0M
         hhAPQPbgRy0fC9FwVRcdFmofME5dHIkzm2OPpAAr+Yqx7bHkK5zBbssXeJUOK3ugz+d6
         DKkat7LfEFanlhE8xBBN36tSWwnhFQdf0DswOg5EpXUvbe8TJs/eEuWnrBNtrubu+zft
         +oslVBNwL2sVkmFTjp8Mz4D4GH0+o0Hpom2G0MUb0F8nazlGPnhI4fdfS/BLQXaGiU5/
         KEX++5LLQ/GwdkCX0kM/uxW9KPfswMcxxIl0vsjUqyMjIbSYhqY6RMVTblKsK3Ei5eCd
         7SEA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=yNKWh13m;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=RKfjzmO8;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=RKfjzmO8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x88si410237qtd.339.2018.11.19.00.21.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Nov 2018 00:21:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=yNKWh13m;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=RKfjzmO8;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=RKfjzmO8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54719 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gOeob-0003cK-H0
	for alex.bennee@linaro.org; Mon, 19 Nov 2018 03:21:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gOeoJ-0003aB-UT
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 03:21:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gOeko-00072s-Nv
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 03:18:03 -0500
Received: from greensocs.com ([193.104.36.180]:46330)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gOeko-00071H-Ai; Mon, 19 Nov 2018 03:17:58 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 6888744325D;
	Mon, 19 Nov 2018 09:17:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542615466;
	bh=KbbffVijlTDJ8d0B402kqEQ0Re2xpSOyR7270UPNcAk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=yNKWh13me0rSMUntdMcX5AfUzGA2wCZypDZzUU9/rNXPgJiYcANCQy7jJgRwOOH9C
	XcCIDpljHvExv/RXKl+1msbLcFd3rvkuRkGBoHb51N1LEooYQ+wjEuPBCRC+ICYcvT
	DZsEKX6URHPWyfTN1q3Fuo4vBnltcF50ZLx0YnUA=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=RKfjzmO8;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=RKfjzmO8
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 70P9AIfV6TaR; Mon, 19 Nov 2018 09:17:45 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 53F1C446890; Mon, 19 Nov 2018 09:17:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542615465;
	bh=KbbffVijlTDJ8d0B402kqEQ0Re2xpSOyR7270UPNcAk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=RKfjzmO8wbEGGC7K68LacwMgc2F8j15DY483mz1WpjqQhmZesDR7EgbEaG4FEDGkG
	YYp8tA1WHKBkLa2nRfi7fTAUBAj27tvbZnVDUbGFkhCRsKTh4kBQSCsyxSpbbhTdJl
	n1GpO3V5AOm6/nX9wKDfQDB9DqPNCnKxPv8SWWcU=
Received: from [192.168.61.102] (lfbn-1-8165-82.w90-112.abo.wanadoo.fr
	[90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id D647E44325D;
	Mon, 19 Nov 2018 09:17:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542615465;
	bh=KbbffVijlTDJ8d0B402kqEQ0Re2xpSOyR7270UPNcAk=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=RKfjzmO8wbEGGC7K68LacwMgc2F8j15DY483mz1WpjqQhmZesDR7EgbEaG4FEDGkG
	YYp8tA1WHKBkLa2nRfi7fTAUBAj27tvbZnVDUbGFkhCRsKTh4kBQSCsyxSpbbhTdJl
	n1GpO3V5AOm6/nX9wKDfQDB9DqPNCnKxPv8SWWcU=
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-5-luc.michel@greensocs.com>
	<20181116095145.GN7447@toto>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <797bdbb4-ac82-d011-b2fc-3d4fdbef4950@greensocs.com>
Date: Mon, 19 Nov 2018 09:17:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181116095145.GN7447@toto>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH v6 04/16] gdbstub: add multiprocess support
 to 'H' and 'T' packets
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
	mark.burton@greensocs.com, qemu-devel@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XVHlN2/nNtgs



On 11/16/18 10:51 AM, Edgar E. Iglesias wrote:
> On Thu, Nov 15, 2018 at 10:41:55AM +0100, Luc Michel wrote:
>> Add a couple of helper functions to cope with GDB threads and processe=
s.
>>
>> The gdb_get_process() function looks for a process given a pid.
>>
>> The gdb_get_cpu() function returns the CPU corresponding to the (pid,
>> tid) pair given as parameters.
>>
>> The read_thread_id() function parses the thread-id sent by the peer.
>> This function supports the multiprocess extension thread-id syntax.  T=
he
>> return value specifies if the parsing failed, or if a special case was
>> encountered (all processes or all threads).
>>
>> Use them in 'H' and 'T' packets handling to support the multiprocess
>> extension.
>>
>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
>=20
> Hi Luc,
>=20
>=20
>=20
>> ---
>>  gdbstub.c | 152 +++++++++++++++++++++++++++++++++++++++++++++++------=
-
>>  1 file changed, 134 insertions(+), 18 deletions(-)
>>
>> diff --git a/gdbstub.c b/gdbstub.c
>> index 4fbc05dfe3..fa2b7077b2 100644
>> --- a/gdbstub.c
>> +++ b/gdbstub.c
>> @@ -680,10 +680,73 @@ out:
>>  #else
>>      return s->processes[0].pid;
>>  #endif
>>  }
>> =20
>> +static GDBProcess *gdb_get_process(const GDBState *s, uint32_t pid)
>> +{
>> +    int i;
>> +
>> +    if (!pid) {
>> +        /* 0 means any process, we take the first one */
>> +        return &s->processes[0];
>> +    }
>> +
>> +    for (i =3D 0; i < s->process_num; i++) {
>> +        if (s->processes[i].pid =3D=3D pid) {
>> +            return &s->processes[i];
>> +        }
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>> +static GDBProcess *gdb_get_cpu_process(const GDBState *s, CPUState *c=
pu)
>> +{
>> +    return gdb_get_process(s, gdb_get_cpu_pid(s, cpu));
>> +}
>> +
>> +static CPUState *find_cpu(uint32_t thread_id)
>> +{
>> +    CPUState *cpu;
>> +
>> +    CPU_FOREACH(cpu) {
>> +        if (cpu_gdb_index(cpu) =3D=3D thread_id) {
>> +            return cpu;
>> +        }
>> +    }
>> +
>> +    return NULL;
>> +}
>> +
>> +static CPUState *gdb_get_cpu(const GDBState *s, uint32_t pid, uint32_=
t tid)
>> +{
>> +    GDBProcess *process;
>> +    CPUState *cpu =3D find_cpu(tid);
>> +
>> +    if (!tid) {
>> +        /* 0 means any thread, we take the first one */
>> +        tid =3D 1;
>> +    }
>> +
>> +    if (cpu =3D=3D NULL) {
>> +        return NULL;
>> +    }
>=20
> Not sure about this. If tid is zero, you fix up the wildcard by setting=
 tid to one.
> Shouldn't you also retry find_cpu(tid) in that case?
>=20
> Otherwise, tid doesn't seem to be used after the wildcard fixup.
Thanks for catching this. It's a refactoring mistake. It will be fixed
in the next re-roll.

--=20
Luc

>=20
> Other than that, I think this looks good:
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>=20
>=20
>=20
>> +
>> +    process =3D gdb_get_cpu_process(s, cpu);
>> +
>> +    if (process->pid !=3D pid) {
>> +        return NULL;
>> +    }
>> +
>> +    if (!process->attached) {
>> +        return NULL;
>> +    }
>> +
>> +    return cpu;
>> +}
>> +
>>  static const char *get_feature_xml(const char *p, const char **newp,
>>                                     CPUClass *cc)
>>  {
>>      size_t len;
>>      int i;
>> @@ -936,23 +999,10 @@ static void gdb_set_cpu_pc(GDBState *s, target_u=
long pc)
>> =20
>>      cpu_synchronize_state(cpu);
>>      cpu_set_pc(cpu, pc);
>>  }
>> =20
>> -static CPUState *find_cpu(uint32_t thread_id)
>> -{
>> -    CPUState *cpu;
>> -
>> -    CPU_FOREACH(cpu) {
>> -        if (cpu_gdb_index(cpu) =3D=3D thread_id) {
>> -            return cpu;
>> -        }
>> -    }
>> -
>> -    return NULL;
>> -}
>> -
>>  static char *gdb_fmt_thread_id(const GDBState *s, CPUState *cpu,
>>                             char *buf, size_t buf_size)
>>  {
>>      if (s->multiprocess) {
>>          snprintf(buf, buf_size, "p%02x.%02x",
>> @@ -962,10 +1012,64 @@ static char *gdb_fmt_thread_id(const GDBState *=
s, CPUState *cpu,
>>      }
>> =20
>>      return buf;
>>  }
>> =20
>> +typedef enum GDBThreadIdKind {
>> +    GDB_ONE_THREAD =3D 0,
>> +    GDB_ALL_THREADS,     /* One process, all threads */
>> +    GDB_ALL_PROCESSES,
>> +    GDB_READ_THREAD_ERR
>> +} GDBThreadIdKind;
>> +
>> +static GDBThreadIdKind read_thread_id(const char *buf, const char **e=
nd_buf,
>> +                                      uint32_t *pid, uint32_t *tid)
>> +{
>> +    unsigned long p, t;
>> +    int ret;
>> +
>> +    if (*buf =3D=3D 'p') {
>> +        buf++;
>> +        ret =3D qemu_strtoul(buf, &buf, 16, &p);
>> +
>> +        if (ret) {
>> +            return GDB_READ_THREAD_ERR;
>> +        }
>> +
>> +        /* Skip '.' */
>> +        buf++;
>> +    } else {
>> +        p =3D 1;
>> +    }
>> +
>> +    ret =3D qemu_strtoul(buf, &buf, 16, &t);
>> +
>> +    if (ret) {
>> +        return GDB_READ_THREAD_ERR;
>> +    }
>> +
>> +    *end_buf =3D buf;
>> +
>> +    if (p =3D=3D -1) {
>> +        return GDB_ALL_PROCESSES;
>> +    }
>> +
>> +    if (pid) {
>> +        *pid =3D p;
>> +    }
>> +
>> +    if (t =3D=3D -1) {
>> +        return GDB_ALL_THREADS;
>> +    }
>> +
>> +    if (tid) {
>> +        *tid =3D t;
>> +    }
>> +
>> +    return GDB_ONE_THREAD;
>> +}
>> +
>>  static int is_query_packet(const char *p, const char *query, char sep=
arator)
>>  {
>>      unsigned int query_len =3D strlen(query);
>> =20
>>      return strncmp(p, query, query_len) =3D=3D 0 &&
>> @@ -1070,16 +1174,18 @@ static int gdb_handle_packet(GDBState *s, cons=
t char *line_buf)
>>  {
>>      CPUState *cpu;
>>      CPUClass *cc;
>>      const char *p;
>>      uint32_t thread;
>> +    uint32_t pid, tid;
>>      int ch, reg_size, type, res;
>>      uint8_t mem_buf[MAX_PACKET_LENGTH];
>>      char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
>>      char thread_id[16];
>>      uint8_t *registers;
>>      target_ulong addr, len;
>> +    GDBThreadIdKind thread_kind;
>> =20
>>      trace_gdbstub_io_command(line_buf);
>> =20
>>      p =3D line_buf;
>>      ch =3D *p++;
>> @@ -1283,16 +1389,22 @@ static int gdb_handle_packet(GDBState *s, cons=
t char *line_buf)
>>          else
>>              put_packet(s, "E22");
>>          break;
>>      case 'H':
>>          type =3D *p++;
>> -        thread =3D strtoull(p, (char **)&p, 16);
>> -        if (thread =3D=3D -1 || thread =3D=3D 0) {
>> +
>> +        thread_kind =3D read_thread_id(p, &p, &pid, &tid);
>> +        if (thread_kind =3D=3D GDB_READ_THREAD_ERR) {
>> +            put_packet(s, "E22");
>> +            break;
>> +        }
>> +
>> +        if (thread_kind !=3D GDB_ONE_THREAD) {
>>              put_packet(s, "OK");
>>              break;
>>          }
>> -        cpu =3D find_cpu(thread);
>> +        cpu =3D gdb_get_cpu(s, pid, tid);
>>          if (cpu =3D=3D NULL) {
>>              put_packet(s, "E22");
>>              break;
>>          }
>>          switch (type) {
>> @@ -1308,12 +1420,16 @@ static int gdb_handle_packet(GDBState *s, cons=
t char *line_buf)
>>               put_packet(s, "E22");
>>               break;
>>          }
>>          break;
>>      case 'T':
>> -        thread =3D strtoull(p, (char **)&p, 16);
>> -        cpu =3D find_cpu(thread);
>> +        thread_kind =3D read_thread_id(p, &p, &pid, &tid);
>> +        if (thread_kind =3D=3D GDB_READ_THREAD_ERR) {
>> +            put_packet(s, "E22");
>> +            break;
>> +        }
>> +        cpu =3D gdb_get_cpu(s, pid, tid);
>> =20
>>          if (cpu !=3D NULL) {
>>              put_packet(s, "OK");
>>          } else {
>>              put_packet(s, "E22");
>> --=20
>> 2.19.1
>>
