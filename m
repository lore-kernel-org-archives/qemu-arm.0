Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp776983wrx;
        Fri, 22 Mar 2019 07:26:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxFou8xn1+xQAqNxVIsU3zrFuPuOpVzpCgty96bUpKBkH/PFhfY4zzkmF5fPl8+Rqj1/lde
X-Received: by 2002:a25:d10a:: with SMTP id i10mr8533633ybg.215.1553264763658;
        Fri, 22 Mar 2019 07:26:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553264763; cv=none;
        d=google.com; s=arc-20160816;
        b=xJ41e4t0rkcWJkEtSBtH15UPltVR+d9s9CVmONEno9HaOJ5h0Zo4p+xIe97MJXaoGa
         1Orpb1kk8DKMxKQzMsW9Z7fO7MRBpl07FJDvjoGMkziAIvD47oTxvnuDTu0i23jj56VI
         9U6WhFu0lnQLsEXOcfiCRSXt/rN2u+SuLXXfAEEu3U6AUxXoI0st5NJqXzxvdTde09fx
         XvqZ7PPBPyGdbqN70DBCCpO4AQWX98nz+rXP+2LkSpqyueaQV803HrRRyVg5DVzDewvr
         EbNHNXqRpGolzpDNeJ5yoBeGp9LbvfTFTDfz8OjZi87VTjL09BZdhpYSOcTz/uAG8vmc
         mFDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=1BYssimgAV3JF/0ksqw5C+JxpDLW5rOChAdM1AxfYSI=;
        b=kNPO2LXmW5aVIsi+UjhuTCq306atEKgcD6JKV/9cZQ+zMGvCl46apO/mZ994VqpKAQ
         T+j99iKZlyk+BaaD+W6H/QaVbWHgsVkts6z+2vD9dVlcLIFhG5lEqvOTohNXSACyKBHu
         H8++KEwiIyREA8D6JggLumUa4DOr6s/r4vwdtF1S2iloWE8+KXdnr0HdYrqvcs0ZSdpJ
         +FhXBvMbWKD9LgL77JLBA6JO+l5R1sF+S/vCrCKfZ4pHk3p6shsr03G/Hukajzi0Av3e
         CMm4ztHKPjUfn2yQwMdbc7pi3Wt4EiXHJzyfqEIbkUrMhgqmPw5n2Wov0zCSdWpouAaQ
         pZqw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8si4966556ybp.151.2019.03.22.07.26.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Mar 2019 07:26:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:58147 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h7L7T-0006zT-3K
	for alex.bennee@linaro.org; Fri, 22 Mar 2019 10:26:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1h7L3s-00047S-3n
	for qemu-arm@nongnu.org; Fri, 22 Mar 2019 10:22:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1h7L1P-000624-Gj
	for qemu-arm@nongnu.org; Fri, 22 Mar 2019 10:19:48 -0400
Received: from goliath.siemens.de ([192.35.17.28]:42676)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jan.kiszka@siemens.com>)
	id 1h7L1P-0005ro-0y; Fri, 22 Mar 2019 10:19:47 -0400
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x2MEJbmj031881
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Fri, 22 Mar 2019 15:19:37 +0100
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may
	be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x2MEJQYj012266;
	Fri, 22 Mar 2019 15:19:27 +0100
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org,
	Lucien Anti-Spam <lucienmp_antispam@yahoo.com>
References: <20181207090135.7651-1-luc.michel@greensocs.com>
	<20181207090135.7651-6-luc.michel@greensocs.com>
	<9dbafcdb-75f1-b52b-b62d-f36e3a13404b@siemens.com>
	<a4e14ea5-dbbc-c970-ccfd-bed51ad2bf58@greensocs.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <bf74bada-a877-6c06-7f5e-e2038e10196a@siemens.com>
Date: Fri, 22 Mar 2019 15:19:27 +0100
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <a4e14ea5-dbbc-c970-ccfd-bed51ad2bf58@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by goliath.siemens.de id
	x2MEJbmj031881
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 192.35.17.28
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
X-TUID: HZZ5GP4UYzrU

On 22.03.19 15:01, Luc Michel wrote:
> On 3/22/19 2:29 PM, Jan Kiszka wrote:
>> On 07.12.18 10:01, Luc Michel wrote:
>>> Add the gdb_first_attached_cpu() and gdb_next_attached_cpu() to itera=
te
>>> over all the CPUs in currently attached processes.
>>>
>>> Add the gdb_first_cpu_in_process() and gdb_next_cpu_in_process() to
>>> iterate over CPUs of a given process.
>>>
>>> Use them to add multiprocess extension support to vCont packets.
>>>
>>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>>> ---
>>>    gdbstub.c | 117 +++++++++++++++++++++++++++++++++++++++++++++++---=
----
>>>    1 file changed, 102 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/gdbstub.c b/gdbstub.c
>>> index 911faa225a..77b3dbb2c8 100644
>>> --- a/gdbstub.c
>>> +++ b/gdbstub.c
>>> @@ -721,10 +721,40 @@ static CPUState *find_cpu(uint32_t thread_id)
>>>        }
>>>   =20
>>>        return NULL;
>>>    }
>>>   =20
>>> +static CPUState *get_first_cpu_in_process(const GDBState *s,
>>> +                                          GDBProcess *process)
>>> +{
>>> +    CPUState *cpu;
>>> +
>>> +    CPU_FOREACH(cpu) {
>>> +        if (gdb_get_cpu_pid(s, cpu) =3D=3D process->pid) {
>>> +            return cpu;
>>> +        }
>>> +    }
>>> +
>>> +    return NULL;
>>> +}
>>> +
>>> +static CPUState *gdb_next_cpu_in_process(const GDBState *s, CPUState=
 *cpu)
>>> +{
>>> +    uint32_t pid =3D gdb_get_cpu_pid(s, cpu);
>>> +    cpu =3D CPU_NEXT(cpu);
>>> +
>>> +    while (cpu) {
>>> +        if (gdb_get_cpu_pid(s, cpu) =3D=3D pid) {
>>> +            break;
>>> +        }
>>> +
>>> +        cpu =3D CPU_NEXT(cpu);
>>> +    }
>>> +
>>> +    return cpu;
>>> +}
>>> +
>>>    static CPUState *gdb_get_cpu(const GDBState *s, uint32_t pid, uint=
32_t tid)
>>>    {
>>>        GDBProcess *process;
>>>        CPUState *cpu;
>>>   =20
>>> @@ -750,10 +780,41 @@ static CPUState *gdb_get_cpu(const GDBState *s,=
 uint32_t pid, uint32_t tid)
>>>        }
>>>   =20
>>>        return cpu;
>>>    }
>>>   =20
>>> +/* Return the cpu following @cpu, while ignoring
>>> + * unattached processes.
>>> + */
>>> +static CPUState *gdb_next_attached_cpu(const GDBState *s, CPUState *=
cpu)
>>> +{
>>> +    cpu =3D CPU_NEXT(cpu);
>>> +
>>> +    while (cpu) {
>>> +        if (gdb_get_cpu_process(s, cpu)->attached) {
>>> +            break;
>>> +        }
>>> +
>>> +        cpu =3D CPU_NEXT(cpu);
>>> +    }
>>> +
>>> +    return cpu;
>>> +}
>>> +
>>> +/* Return the first attached cpu */
>>> +static CPUState *gdb_first_attached_cpu(const GDBState *s)
>>> +{
>>> +    CPUState *cpu =3D first_cpu;
>>> +    GDBProcess *process =3D gdb_get_cpu_process(s, cpu);
>>> +
>>> +    if (!process->attached) {
>>> +        return gdb_next_attached_cpu(s, cpu);
>>> +    }
>>> +
>>> +    return cpu;
>>> +}
>>> +
>>>    static const char *get_feature_xml(const char *p, const char **new=
p,
>>>                                       CPUClass *cc)
>>>    {
>>>        size_t len;
>>>        int i;
>>> @@ -1088,14 +1149,16 @@ static int is_query_packet(const char *p, con=
st char *query, char separator)
>>>     * returns -ENOTSUP if a command is unsupported, -EINVAL or -ERANG=
E if there is
>>>     *         a format error, 0 on success.
>>>     */
>>>    static int gdb_handle_vcont(GDBState *s, const char *p)
>>>    {
>>> -    int res, idx, signal =3D 0;
>>> +    int res, signal =3D 0;
>>>        char cur_action;
>>>        char *newstates;
>>>        unsigned long tmp;
>>> +    uint32_t pid, tid;
>>> +    GDBProcess *process;
>>>        CPUState *cpu;
>>>    #ifdef CONFIG_USER_ONLY
>>>        int max_cpus =3D 1; /* global variable max_cpus exists only in=
 system mode */
>>>   =20
>>>        CPU_FOREACH(cpu) {
>>> @@ -1134,29 +1197,52 @@ static int gdb_handle_vcont(GDBState *s, cons=
t char *p)
>>>            } else if (cur_action !=3D 'c' && cur_action !=3D 's') {
>>>                /* unknown/invalid/unsupported command */
>>>                res =3D -ENOTSUP;
>>>                goto out;
>>>            }
>>> -        /* thread specification. special values: (none), -1 =3D all;=
 0 =3D any */
>>> -        if ((p[0] =3D=3D ':' && p[1] =3D=3D '-' && p[2] =3D=3D '1') =
|| (p[0] !=3D ':')) {
>>> -            if (*p =3D=3D ':') {
>>> -                p +=3D 3;
>>> -            }
>>> -            for (idx =3D 0; idx < max_cpus; idx++) {
>>> -                if (newstates[idx] =3D=3D 1) {
>>> -                    newstates[idx] =3D cur_action;
>>> +
>>> +        if (*p++ !=3D ':') {
>>> +            res =3D -ENOTSUP;
>>> +            goto out;
>>> +        }
>>> +
>>> +        switch (read_thread_id(p, &p, &pid, &tid)) {
>>> +        case GDB_READ_THREAD_ERR:
>>> +            res =3D -EINVAL;
>>> +            goto out;
>>> +
>>> +        case GDB_ALL_PROCESSES:
>>> +            cpu =3D gdb_first_attached_cpu(s);
>>> +            while (cpu) {
>>> +                if (newstates[cpu->cpu_index] =3D=3D 1) {
>>> +                    newstates[cpu->cpu_index] =3D cur_action;
>>>                    }
>>> +
>>> +                cpu =3D gdb_next_attached_cpu(s, cpu);
>>>                }
>>> -        } else if (*p =3D=3D ':') {
>>> -            p++;
>>> -            res =3D qemu_strtoul(p, &p, 16, &tmp);
>>> -            if (res) {
>>> +            break;
>>> +
>>> +        case GDB_ALL_THREADS:
>>> +            process =3D gdb_get_process(s, pid);
>>> +
>>> +            if (!process->attached) {
>>> +                res =3D -EINVAL;
>>>                    goto out;
>>>                }
>>>   =20
>>> -            /* 0 means any thread, so we pick the first valid CPU */
>>> -            cpu =3D tmp ? find_cpu(tmp) : first_cpu;
>>> +            cpu =3D get_first_cpu_in_process(s, process);
>>> +            while (cpu) {
>>> +                if (newstates[cpu->cpu_index] =3D=3D 1) {
>>> +                    newstates[cpu->cpu_index] =3D cur_action;
>>> +                }
>>> +
>>> +                cpu =3D gdb_next_cpu_in_process(s, cpu);
>>> +            }
>>> +            break;
>>> +
>>> +        case GDB_ONE_THREAD:
>>> +            cpu =3D gdb_get_cpu(s, pid, tid);
>>>   =20
>>>                /* invalid CPU/thread specified */
>>>                if (!cpu) {
>>>                    res =3D -EINVAL;
>>>                    goto out;
>>> @@ -1164,10 +1250,11 @@ static int gdb_handle_vcont(GDBState *s, cons=
t char *p)
>>>   =20
>>>                /* only use if no previous match occourred */
>>>                if (newstates[cpu->cpu_index] =3D=3D 1) {
>>>                    newstates[cpu->cpu_index] =3D cur_action;
>>>                }
>>> +            break;
>>>            }
>>>        }
>>>        s->signal =3D signal;
>>>        gdb_continue_partial(s, newstates);
>>>   =20
>>>
>>
>> This breaks system-level debugging with gdb, at least with version
>> 7.7.50 and for x86 targets.
>=20
> I think it's related to
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg601065.html
>=20

This fixes it, indeed.

In fact, the commit I cited was probably misleading because your patch se=
ries=20
turned out to be non-bisectable (process->attached was checked already no=
t but=20
yet set to true).

> [snip]
>> Sending packet: $vCont;s:1;c#c1...Ack
>> Packet received: E22
>> warning: Remote failure reply: E22
> [snip]
>=20
> The vCont packet does not specifies a thread-id for the last action.
> This is a valid syntax, incorrectly treated as an error by the stub.
>=20
> Lucien: do you plan to send a re-roll? Otherwise I'll do it on next
> Monday (25/03) because I would like this bug to be fixed before it hits=
 4.0.
>=20

Would be appreciated.

Thanks,
Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux
