Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp5529280wrw;
        Wed, 14 Nov 2018 02:15:00 -0800 (PST)
X-Google-Smtp-Source: AJdET5et0cqGn2/czkl2oBlKUiP3UoR0extO4AiqCSpt6LSz4Ht44bKzRnVA+8LPkXndjPSCb5zc
X-Received: by 2002:a37:7dc4:: with SMTP id y187-v6mr1082030qkc.211.1542190500280;
        Wed, 14 Nov 2018 02:15:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542190500; cv=none;
        d=google.com; s=arc-20160816;
        b=Zy5z2pQ5mBqE8xBfH8DWFwCGn/xlP3soWy3JtHiqBN3g0H9MQECHcFa1+OcfFHYTVU
         XUW/AfIMXxpjbMQvM/y+feWPL8gX92DC0U00R7yFhqMPTy8f2kEwq7m2QZpBHGm5cb1l
         E3JphaO7CMi4Ypwp5+jmCApANSxVHKKJfDLKIo3nJTipaq32q70rICIzyF+pVIqsCvdJ
         5CVTaDnx5rgnTvk6SwtHwMhx/DariV89Z4j9ylElp2dwspCSYb9VKvKm6S1CH2XwSk/z
         FkntJZcSWQvUv8MOP0KQNroaBMqIhTbGmvkTAly/7GH8L/YRQqDMuEMlrX3/w8ef7VP6
         lubg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:dkim-signature:dkim-signature;
        bh=YnKHklxiE6nz4aiwvxXhNXTU1GHq3L6M3gTcM5bLh2k=;
        b=OeOzV4EnXFak0bGVFtNXQhIlbA53zJbLPOzVjDXADPa9mOcDTmQIRGsC2PEjn+Wreu
         dgWJc7gP7Uq/18cYbZxvOyoDmYz1/altZoi3pqSn9mwvUISpp66w2mwwQp9XpVZ54cGT
         AU3IGM00WV+vDwuiXAqO/WfsnMX7tdvpjLpaWCfVJ0kEp/PmHLPDG7oGh51AW66gTQZW
         6SNY47pRIlA08/HAjP+q5cWDW4hCyrx7qliOnn2HWV3ES8pK3SQtr6jheqHGXvAINOwR
         bQYXINLTFWGmiUhfZal2Uydd20lH2LSRj6qGI+r+sqtOvASXqWolVUBLIPgJYg5r7ymV
         T7jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="EQPg5P/H";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=vcvNlGzR;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=vcvNlGzR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r65si4009889qtd.350.2018.11.14.02.15.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Nov 2018 02:15:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="EQPg5P/H";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=vcvNlGzR;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=vcvNlGzR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMsCJ-0004OC-EG
	for alex.bennee@linaro.org; Wed, 14 Nov 2018 05:14:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gMsCA-0004O6-Fd
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 05:14:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gMsC7-0000sH-8Q
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 05:14:50 -0500
Received: from greensocs.com ([193.104.36.180]:53796)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gMsC4-0000po-45; Wed, 14 Nov 2018 05:14:45 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 3CB055BD182;
	Wed, 14 Nov 2018 11:14:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542190473;
	bh=Hn5OUfepE9pw+DeiODmSny4juu8kDuzZ+8u/XaPgIII=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=EQPg5P/H8uza3lGKH27/Wc0WfC6S6Y0UZcQlHwDOQ1Xa9CV/AserO+ypH5Ur1y26L
	GfaaAPBaRb3/NrACrwKxIXRlmue1ID5tx1YmL4VGysOfIFhrnieZLWZZ6L4ypy0a9k
	m7s0KOZxnG1EIrPytc0kXWG7cYZ7IVeWlk+iBXtQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=vcvNlGzR;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=vcvNlGzR
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gtul-acDv6dB; Wed, 14 Nov 2018 11:14:32 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 392425BD183; Wed, 14 Nov 2018 11:14:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542190472;
	bh=Hn5OUfepE9pw+DeiODmSny4juu8kDuzZ+8u/XaPgIII=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=vcvNlGzRdom91OZ1ab9Y8kTPlLcJv9N/xdfUhE7tMfOvCh/7Rru7sGeIhJGE10EA+
	PauDJL7NyQxhEOyCL8OLtAKRPwaHBspk6OJFIr3CNi8JyfnDKly9pw9m90B/NLhrW2
	LFCvPntUBMcc3PqGTNdjCEbKvtyFQbg0aX5vdoGE=
Received: from [192.168.61.102] (lfbn-1-8165-82.w90-112.abo.wanadoo.fr
	[90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id CA3DC5BD182;
	Wed, 14 Nov 2018 11:14:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542190472;
	bh=Hn5OUfepE9pw+DeiODmSny4juu8kDuzZ+8u/XaPgIII=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=vcvNlGzRdom91OZ1ab9Y8kTPlLcJv9N/xdfUhE7tMfOvCh/7Rru7sGeIhJGE10EA+
	PauDJL7NyQxhEOyCL8OLtAKRPwaHBspk6OJFIr3CNi8JyfnDKly9pw9m90B/NLhrW2
	LFCvPntUBMcc3PqGTNdjCEbKvtyFQbg0aX5vdoGE=
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
	<20181110081147.4027-3-luc.michel@greensocs.com>
	<20181113105216.GG1148@toto>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <2785510b-5db5-7ded-2404-7d5653a98764@greensocs.com>
Date: Wed, 14 Nov 2018 11:14:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181113105216.GG1148@toto>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH v5 02/16] gdbstub: introduce GDB processes
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
	qemu-devel@nongnu.org, saipava@xilinx.com, edgari@xilinx.com,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PNP3IO7/1B2K

Hi Edgar,

On 11/13/18 11:52 AM, Edgar E. Iglesias wrote:
> On Sat, Nov 10, 2018 at 09:11:33AM +0100, Luc Michel wrote:
>> Add a structure GDBProcess that represent processes from the GDB
>> semantic point of view.
>>
>> CPUs can be split into different processes, by grouping them under
>> different cpu-cluster objects.  Each occurrence of a cpu-cluster objec=
t
>> implies the existence of the corresponding process in the GDB stub. Th=
e
>> GDB process ID is derived from the corresponding cluster ID as follows=
:
>>
>>   GDB PID =3D cluster ID + 1
>>
>> This is because PIDs -1 and 0 are reserved in GDB and cannot be used b=
y
>> processes.
>>
>> When no such container are found, all the CPUs are put in a unique GDB
>> process (create_unique_process()). This is also the case when compiled
>> in user mode, where multi-processes do not make much sense for now.
>>
>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>> ---
>>  gdbstub.c | 76 ++++++++++++++++++++++++++++++++++++++++++++++++++++++=
+
>>  1 file changed, 76 insertions(+)
>>
>> diff --git a/gdbstub.c b/gdbstub.c
>> index c4e4f9f082..0d70b89598 100644
>> --- a/gdbstub.c
>> +++ b/gdbstub.c
>> @@ -27,10 +27,11 @@
>>  #include "monitor/monitor.h"
>>  #include "chardev/char.h"
>>  #include "chardev/char-fe.h"
>>  #include "sysemu/sysemu.h"
>>  #include "exec/gdbstub.h"
>> +#include "hw/cpu/cluster.h"
>>  #endif
>> =20
>>  #define MAX_PACKET_LENGTH 4096
>> =20
>>  #include "qemu/sockets.h"
>> @@ -294,10 +295,15 @@ typedef struct GDBRegisterState {
>>      gdb_reg_cb set_reg;
>>      const char *xml;
>>      struct GDBRegisterState *next;
>>  } GDBRegisterState;
>> =20
>> +typedef struct GDBProcess {
>> +    uint32_t pid;
>> +    bool attached;
>> +} GDBProcess;
>> +
>>  enum RSState {
>>      RS_INACTIVE,
>>      RS_IDLE,
>>      RS_GETLINE,
>>      RS_GETLINE_ESC,
>> @@ -322,10 +328,13 @@ typedef struct GDBState {
>>      int running_state;
>>  #else
>>      CharBackend chr;
>>      Chardev *mon_chr;
>>  #endif
>> +    bool multiprocess;
>> +    GDBProcess *processes;
>> +    int process_num;
>>      char syscall_buf[256];
>>      gdb_syscall_complete_cb current_syscall_cb;
>>  } GDBState;
>> =20
>>  /* By default use no IRQs and no timers while single stepping so as t=
o
>> @@ -1749,10 +1758,24 @@ void gdb_exit(CPUArchState *env, int code)
>>  #ifndef CONFIG_USER_ONLY
>>    qemu_chr_fe_deinit(&s->chr, true);
>>  #endif
>>  }
>> =20
>> +/*
>> + * Create a unique process containing all the CPUs.
>> + */
>> +static void create_unique_process(GDBState *s)
>> +{
>> +    GDBProcess *process;
>> +
>> +    s->processes =3D g_malloc0(sizeof(GDBProcess));
>> +    s->process_num =3D 1;
>> +    process =3D &s->processes[0];
>> +
>> +    process->pid =3D 1;
>> +}
>> +
>>  #ifdef CONFIG_USER_ONLY
>>  int
>>  gdb_handlesig(CPUState *cpu, int sig)
>>  {
>>      GDBState *s;
>> @@ -1846,10 +1869,11 @@ static bool gdb_accept(void)
>>      }
>> =20
>>      s =3D g_malloc0(sizeof(GDBState));
>>      s->c_cpu =3D first_cpu;
>>      s->g_cpu =3D first_cpu;
>> +    create_unique_process(s);
>>      s->fd =3D fd;
>>      gdb_has_xml =3D false;
>> =20
>>      gdbserver_state =3D s;
>>      return true;
>> @@ -2002,10 +2026,58 @@ static const TypeInfo char_gdb_type_info =3D {
>>      .name =3D TYPE_CHARDEV_GDB,
>>      .parent =3D TYPE_CHARDEV,
>>      .class_init =3D char_gdb_class_init,
>>  };
>> =20
>> +static int find_cpu_clusters(Object *child, void *opaque)
>> +{
>> +    if (object_dynamic_cast(child, TYPE_CPU_CLUSTER)) {
>> +        GDBState *s =3D (GDBState *) opaque;
>> +        CPUClusterState *cluster =3D CPU_CLUSTER(child);
>> +        GDBProcess *process;
>> +
>> +        s->processes =3D g_renew(GDBProcess, s->processes, ++s->proce=
ss_num);
>> +
>> +        process =3D &s->processes[s->process_num - 1];
>> +
>> +        /* GDB process IDs -1 and 0 are reserved */
>> +        process->pid =3D cluster->cluster_id + 1;
>=20
> This may be theoretical but since both pid and cluster_id are uint32_t
> you may end up with 0 here.
>=20
> You may want to limit cluster_id's to something like the range 0 - INT3=
2_MAX.
That would be an efficient solution to workaround this problem. However
it seems a bit artificial to limit the cluster_id range in the "generic"
CPU_CLUSTER class, just for the GDB stub code to work correctly.

Another solution could be to add a `gdb_pid' property to the CPU_CLUSTER
type, that would automatically be set to `cpu_cluster + 1' during
realization (and customized by the platform if needed). That way, value
0 could be explicitly forbidden in the CPU_CLUSTER API. However, Peter
was not a big fan of having explicit GDB stuff in the platform.

If somebody comes with a good compromise, I can change this. Otherwise
if we want to be extra safe, maybe we can simply assert that cluster_id
UINT32_MAX is not used in GDB stub.

(snip)
>> +static int pid_order(const void *a, const void *b)
>> +{
>> +    GDBProcess *pa =3D (GDBProcess *) a;
>> +    GDBProcess *pb =3D (GDBProcess *) b;
>> +
>> +    return pa->pid - pb->pid;
>=20
> Similarly here, is this safe?
> e.g:
> pa->pid =3D 1
> pb->pid =3D 0x80000002
To make it safe, I think we can do explicit comparisons:

if (pa->pid < pb->pid) {
    return -1;
} else if (pa->pid > pb->pid) {
    return 1;
} else {
    return 0;
}


Thanks,
Luc

>=20
>=20
> Otherwise:
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>=20
>=20
>=20
>> +}
>> +
>> +static void create_processes(GDBState *s)
>> +{
>> +    object_child_foreach(object_get_root(), find_cpu_clusters, s);
>> +
>> +    if (!s->processes) {
>> +        /* No CPU cluster specified by the machine */
>> +        create_unique_process(s);
>> +    } else {
>> +        /* Sort by PID */
>> +        qsort(s->processes, s->process_num, sizeof(s->processes[0]), =
pid_order);
>> +    }
>> +}
>> +
>> +static void cleanup_processes(GDBState *s)
>> +{
>> +    g_free(s->processes);
>> +    s->process_num =3D 0;
>> +    s->processes =3D NULL;
>> +}
>> +
>>  int gdbserver_start(const char *device)
>>  {
>>      trace_gdbstub_op_start(device);
>> =20
>>      GDBState *s;
>> @@ -2058,15 +2130,19 @@ int gdbserver_start(const char *device)
>>                                     NULL, &error_abort);
>>          monitor_init(mon_chr, 0);
>>      } else {
>>          qemu_chr_fe_deinit(&s->chr, true);
>>          mon_chr =3D s->mon_chr;
>> +        cleanup_processes(s);
>>          memset(s, 0, sizeof(GDBState));
>>          s->mon_chr =3D mon_chr;
>>      }
>>      s->c_cpu =3D first_cpu;
>>      s->g_cpu =3D first_cpu;
>> +
>> +    create_processes(s);
>> +
>>      if (chr) {
>>          qemu_chr_fe_init(&s->chr, chr, &error_abort);
>>          qemu_chr_fe_set_handlers(&s->chr, gdb_chr_can_receive, gdb_ch=
r_receive,
>>                                   gdb_chr_event, NULL, NULL, NULL, tru=
e);
>>      }
>> --=20
>> 2.19.1
>>
>>
