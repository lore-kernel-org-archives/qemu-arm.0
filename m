Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp660464wrt;
        Mon, 19 Nov 2018 02:24:14 -0800 (PST)
X-Google-Smtp-Source: AJdET5f9OQ70tyaEOH/IMJywtKPWKwp10OzI0UkHcqOl/zpRzirbMcvMpRlgCEwjUwXcHeN/uNCR
X-Received: by 2002:a0c:91e8:: with SMTP id r37mr20520275qvr.141.1542623054047;
        Mon, 19 Nov 2018 02:24:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542623054; cv=none;
        d=google.com; s=arc-20160816;
        b=nB7IwF5fQD8R9lwmcEc2tnl/tR5VNyf1ilod+t3xNcAIfMLF3ethNMQjL/7VPZx+7i
         7kZEsJ9q0Yo1kSn5mmwEt7Qt0Lb/D4S6MGGxIkHMEe8Ka13wR1Ise6ypPTBRdm4PQL0V
         THgA25oi2Ec4TvlPPdYV4kzfD6Xk+R3eLklRWGw6+oslgD+VHlLjiVM3MNy+7sanv3CV
         0YTBXFlUm9IcZ3/K0xF4bWR3drZMZRL1jD1XZdo+WSR27oA57831zGCATJt4R7VF7Sbt
         oB/vTCEgF8uwORTrjzp2u0EKBiHhyoaY8GabDkTM94PON+jngtSlgD5DL8pqrWnJT8xF
         BDEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:dkim-signature:dkim-signature;
        bh=dpVTpmmgwAXOY4hZj7yupcVc1ldws4b9n/9s9LQuioQ=;
        b=WdW37d49F8NaXO1Eh50gijSEhfTtOk8Clo8669yZIInAZM1chaiLKoTDk26SsqWXRu
         16PpwNQOrL5i0Zd2NW2xqXUZnaGgN6z7rQpjOCtBt7A3j1DGWlFmzIuHOk92qUsK6JlK
         hOy+fzo3VehP0yx2qw46TNZCzdWEZ+Tu8vLoyAO0bKZu/9Z1ccpCEtLE3Ai5sEAnjyhv
         zjDZGZTzAHk5XVigMGdux2zX0bgCCEnqcB6LqJ/mIhKs4G+dAmIDrSpqXZFds1TrfT0/
         u784UY24bS8M2ZTiQEVoBYKXqoKG9dBvKA1lAvLfpkl8pterLluuzP4ukIsACjhleXOS
         mILQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=0PnjKtol;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=47zyLes5;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=47zyLes5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h73si8718160qke.201.2018.11.19.02.24.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Nov 2018 02:24:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=0PnjKtol;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=47zyLes5;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=47zyLes5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gOgiz-0001eL-GN
	for alex.bennee@linaro.org; Mon, 19 Nov 2018 05:24:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47481)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gOgg1-00079f-Aw
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 05:21:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gOgY9-0003yb-Nz
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 05:13:05 -0500
Received: from greensocs.com ([193.104.36.180]:60346)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gOgY5-0003oz-U3; Mon, 19 Nov 2018 05:12:59 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id B056844325D;
	Mon, 19 Nov 2018 11:12:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542622367;
	bh=38qIJ3FVi2072qJECpS6JbWKKz1yETCxYM3Iy+Du11w=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=0PnjKtol2jnnd9+Mk97vRbYjBFbeQwQoIYTo9tk6eXUMsYawSkHkiwRWbeABJcFrb
	ZAuC/qiftb+QW5Bysgrfvsx0ooKPfD9bsffygUu25mB9Ph26buKDT9QRrTXrE94uW5
	j1cUDpDC5NqK5Y7XjgppptPWDyQ5Xv3Yp3D+NPhM=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=47zyLes5;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=47zyLes5
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dElkzqvsGzoL; Mon, 19 Nov 2018 11:12:46 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id B9C09446876; Mon, 19 Nov 2018 11:12:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542622366;
	bh=38qIJ3FVi2072qJECpS6JbWKKz1yETCxYM3Iy+Du11w=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=47zyLes5LhgK96I/4FTE1Lr4IEi92ASV/rX2elkjKmyvzHCFiB8+tnq6PByYQW4rL
	geDJybsIpT6jM15NvaavujktglM3WSqcvmLRnQMPRlXyL06sfHS1BmzL5C3oxBdXxV
	lefzQQJ3vw6vrpZ7S9xWpx7zz3ZecpeyUtXXqwqc=
Received: from [192.168.61.102] (lfbn-1-8165-82.w90-112.abo.wanadoo.fr
	[90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 3F74F44325D;
	Mon, 19 Nov 2018 11:12:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542622366;
	bh=38qIJ3FVi2072qJECpS6JbWKKz1yETCxYM3Iy+Du11w=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=47zyLes5LhgK96I/4FTE1Lr4IEi92ASV/rX2elkjKmyvzHCFiB8+tnq6PByYQW4rL
	geDJybsIpT6jM15NvaavujktglM3WSqcvmLRnQMPRlXyL06sfHS1BmzL5C3oxBdXxV
	lefzQQJ3vw6vrpZ7S9xWpx7zz3ZecpeyUtXXqwqc=
To: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-8-luc.michel@greensocs.com>
	<20181116100407.GQ7447@toto>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <d4fc764e-f23f-0154-f6f5-29b509422b7b@greensocs.com>
Date: Mon, 19 Nov 2018 11:12:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181116100407.GQ7447@toto>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH v6 07/16] gdbstub: add multiprocess support
 to (f|s)ThreadInfo and ThreadExtraInfo
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
X-TUID: QfwcjCtDvZt1



On 11/16/18 11:04 AM, Edgar E. Iglesias wrote:
> On Thu, Nov 15, 2018 at 10:41:58AM +0100, Luc Michel wrote:
>> Change the thread info related packets handling to support multiproces=
s
>> extension.
>>
>> Add the CPUs class name in the extra info to help differentiate
>> them in multiprocess mode.
>>
>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>  gdbstub.c | 35 +++++++++++++++++++++++++----------
>>  1 file changed, 25 insertions(+), 10 deletions(-)
>>
>> diff --git a/gdbstub.c b/gdbstub.c
>> index d19b0137e8..292dee8914 100644
>> --- a/gdbstub.c
>> +++ b/gdbstub.c
>> @@ -1260,11 +1260,10 @@ out:
>>  static int gdb_handle_packet(GDBState *s, const char *line_buf)
>>  {
>>      CPUState *cpu;
>>      CPUClass *cc;
>>      const char *p;
>> -    uint32_t thread;
>>      uint32_t pid, tid;
>>      int ch, reg_size, type, res;
>>      uint8_t mem_buf[MAX_PACKET_LENGTH];
>>      char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
>>      char thread_id[16];
>> @@ -1556,30 +1555,46 @@ static int gdb_handle_packet(GDBState *s, cons=
t char *line_buf)
>>              snprintf(buf, sizeof(buf), "QC%s",
>>                       gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thre=
ad_id)));
>>              put_packet(s, buf);
>>              break;
>>          } else if (strcmp(p,"fThreadInfo") =3D=3D 0) {
>> -            s->query_cpu =3D first_cpu;
>> +            s->query_cpu =3D gdb_first_cpu(s);
>>              goto report_cpuinfo;
>>          } else if (strcmp(p,"sThreadInfo") =3D=3D 0) {
>>          report_cpuinfo:
>>              if (s->query_cpu) {
>> -                snprintf(buf, sizeof(buf), "m%x", cpu_gdb_index(s->qu=
ery_cpu));
>> +                snprintf(buf, sizeof(buf), "m%s",
>> +                         gdb_fmt_thread_id(s, s->query_cpu,
>> +                                       thread_id, sizeof(thread_id)))=
;
>>                  put_packet(s, buf);
>> -                s->query_cpu =3D CPU_NEXT(s->query_cpu);
>> +                s->query_cpu =3D gdb_next_cpu(s, s->query_cpu);
>>              } else
>>                  put_packet(s, "l");
>>              break;
>>          } else if (strncmp(p,"ThreadExtraInfo,", 16) =3D=3D 0) {
>> -            thread =3D strtoull(p+16, (char **)&p, 16);
>> -            cpu =3D find_cpu(thread);
>> +            if (read_thread_id(p + 16, &p, &pid, &tid) =3D=3D GDB_REA=
D_THREAD_ERR) {
>> +                put_packet(s, "E22");
>> +                break;
>> +            }
>> +            cpu =3D gdb_get_cpu(s, pid, tid);
>>              if (cpu !=3D NULL) {
>>                  cpu_synchronize_state(cpu);
>> -                /* memtohex() doubles the required space */
>> -                len =3D snprintf((char *)mem_buf, sizeof(buf) / 2,
>> -                               "CPU#%d [%s]", cpu->cpu_index,
>> -                               cpu->halted ? "halted " : "running");
>> +
>> +                if (s->multiprocess && (s->process_num > 1)) {
>> +                    /* Print the CPU model in multiprocess mode */
>> +                    ObjectClass *oc =3D object_get_class(OBJECT(cpu))=
;
>> +                    const char *cpu_model =3D object_class_get_name(o=
c);
>> +                    len =3D snprintf((char *)mem_buf, sizeof(buf) / 2=
,
>> +                                   "CPU#%d %s [%s]", cpu->cpu_index,
>> +                                   cpu_model,
>> +                                   cpu->halted ? "halted " : "running=
");
>=20
>=20
>=20
> I wonder if we could also print a friendly name here deducted from QOM?
> In some of our use-cases we have an array of MicroBlazes that all live
> in different HW subsystems and are named differently (e.g CSU, PMU, PMC=
,
> PSM etc).
>=20
> Instead of just seeing a list of MicroBlaze cores it may be more useful
> to see the actual core name of some sort, e.g:
>=20
> Instead of:
> CPU#0 MicroBlaze [running]
> CPU#1 MicroBlaze [running]
> CPU#2 MicroBlaze [running]
> CPU#3 MicroBlaze [running]
>=20
> Perhaps something like:
> CPU#0 MicroBlaze PMU [running]
> CPU#1 MicroBlaze PMC-PPU0 [running]
> CPU#2 MicroBlaze PMC-PPU1 [running]
> CPU#3 MicroBlaze PSM [running]
>=20
> Any thoughts on that?
I wanted to avoid the ThreadExtraInfo packet to become too much cluttered=
.

Here are some tests adding the component part of the CPU canonical name:

(gdb) info threads
  Id   Target Id         Frame
  1.1  Thread 1.1 (CPU#0 cortex-a53-arm-cpu apu-cpu[0] [running])
0x0000000000000000 in ?? ()
  1.2  Thread 1.2 (CPU#1 cortex-a53-arm-cpu apu-cpu[1] [halted ])
0x0000000000000000 in ?? ()
  1.3  Thread 1.3 (CPU#2 cortex-a53-arm-cpu apu-cpu[2] [halted ])
0x0000000000000000 in ?? ()
  1.4  Thread 1.4 (CPU#3 cortex-a53-arm-cpu apu-cpu[3] [halted ])
0x0000000000000000 in ?? ()
* 2.1  Thread 2.5 (CPU#4 cortex-r5f-arm-cpu rpu-cpu[0] [halted ])
0xffff0000 in ?? ()
  2.2  Thread 2.6 (CPU#5 cortex-r5f-arm-cpu rpu-cpu[1] [halted ])
0xffff0000 in ?? ()

The model name takes quite some room. The interesting info are `arm` and
`cortex-xxx`, but AFAIK there is no way of extracting that for a CPU
generically.

In this case, having the component part of the canonical name is ok
because self-explanatory. However we could encounter cases where the
parent name would be necessary to discriminate the CPUs, something like:
  cluster[0]/cpu[0]
            /cpu[1]
  cluster[1]/cpu[0]
            /cpu[1]
  ...

The "safest" way would be to have the whole path:

(gdb) info threads
  Id   Target Id         Frame
  1.1  Thread 1.1 (CPU#0 cortex-a53-arm-cpu
/machine/soc/apu-cluster/apu-cpu[0] [running]) 0x0000000000000000 in ?? (=
)
  1.2  Thread 1.2 (CPU#1 cortex-a53-arm-cpu
/machine/soc/apu-cluster/apu-cpu[1] [halted ]) 0x0000000000000000 in ?? (=
)
  1.3  Thread 1.3 (CPU#2 cortex-a53-arm-cpu
/machine/soc/apu-cluster/apu-cpu[2] [halted ]) 0x0000000000000000 in ?? (=
)
  1.4  Thread 1.4 (CPU#3 cortex-a53-arm-cpu
/machine/soc/apu-cluster/apu-cpu[3] [halted ]) 0x0000000000000000 in ?? (=
)
* 2.1  Thread 2.5 (CPU#4 cortex-r5f-arm-cpu
/machine/soc/rpu-cluster/rpu-cpu[0] [halted ]) 0xffff0000 in ?? ()
  2.2  Thread 2.6 (CPU#5 cortex-r5f-arm-cpu
/machine/soc/rpu-cluster/rpu-cpu[1] [halted ]) 0xffff0000 in ?? ()

But that becomes really cluttered... We could also remove the CPU model
completely.

What are your thoughts?

Thanks,
Luc

>=20
> Thanks,
> Edgar
>=20
>> +                } else {
>> +                    /* memtohex() doubles the required space */
>> +                    len =3D snprintf((char *)mem_buf, sizeof(buf) / 2=
,
>> +                                   "CPU#%d [%s]", cpu->cpu_index,
>> +                                   cpu->halted ? "halted " : "running=
");
>> +                }
>>                  trace_gdbstub_op_extra_info((char *)mem_buf);
>>                  memtohex(buf, mem_buf, len);
>>                  put_packet(s, buf);
>>              }
>>              break;
>> --=20
>> 2.19.1
>>
