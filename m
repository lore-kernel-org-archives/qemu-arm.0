Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp5453297wrw;
        Wed, 14 Nov 2018 00:44:04 -0800 (PST)
X-Google-Smtp-Source: AJdET5eyRngk1RlycwhiANrQ/MfNYWpx97WOmbglmoH4wN20NAZRf+FC1FwXv4lh2xJRkzEoRzNx
X-Received: by 2002:aed:2407:: with SMTP id r7mr893754qtc.128.1542185044764;
        Wed, 14 Nov 2018 00:44:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542185044; cv=none;
        d=google.com; s=arc-20160816;
        b=NOkEeD1WS+5HLWJzfdYivjEyYvruAVx356jzusAbkF/TlOAgDnXvFLK8NLqTHnrfnG
         CyVyBlgkCeeY6N5fbCP0+rx2Hss9hCM+uQq/+usOgtNpgq94w5J02A2OhaBv05F6udzC
         rMqrDt/CQHJYFHdGy1Fy97etbVgrsh9mRncyTpYA2vouYDqSY2Udmd/0RQ8l3IYsj6j2
         ZV01Lt9ZYjJv8ufiy1VkXI0ABt0C2rNfH804xvAGdHIbwbivjIyt4MfdbCUsC6qsHvEg
         6MrNjdsw/ILjNlbOjZXDkLB3+qSklm4VErqX69feueJCKmASHNUrcdZJD0dGnzAY0OHS
         0jkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:dkim-signature:dkim-signature;
        bh=GjnpfjC/mwmgUVwrnX0omjYUwjG5JJPCftaI+DRuYls=;
        b=meqtgRC7ZrhRNOAZisTsaCOxi9CnKvB/TsZddW+kVdUMJYjmELVWX5TL1yPKJQIE7T
         n6/njOcD0l7AyDkEeh65OzyHyM2VtKO5rMRqfjfydxu8l8zJbEedj/HtvBtfdHBAG4w0
         zucvG/FT6MDTvZEYUB3jhirygfVHZRNEROAHHYSUFEaCcXF6cfc9UKkp/8pdqza80vZm
         l9tGQjgmezgEt1Yi0vDw9PIcw3n8lTn5G+7KWjzrzgUwt7SHh/xRw9xte3xLii2kFzQW
         BnfiTsuecYf4j08LG/pUAK/Ovq7PiU6PS4QyYMqw4Tf9Zx0zrk8iPEXSp9VGXYR9Thfm
         LFRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=cCKEt868;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LpfmYB1q;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LpfmYB1q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z202si1925030qkz.83.2018.11.14.00.44.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 14 Nov 2018 00:44:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=cCKEt868;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LpfmYB1q;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LpfmYB1q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58928 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMqmJ-00040G-Vc
	for alex.bennee@linaro.org; Wed, 14 Nov 2018 03:44:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gMqm8-0003yT-Bi
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 03:43:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1gMqm5-0006jV-4g
	for qemu-arm@nongnu.org; Wed, 14 Nov 2018 03:43:52 -0500
Received: from greensocs.com ([193.104.36.180]:43071)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1gMqlx-0006eu-H6; Wed, 14 Nov 2018 03:43:43 -0500
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 5139F6FD8D;
	Wed, 14 Nov 2018 09:43:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542185009;
	bh=QbTUIJcl7908p+tvIIURKP3BJGkxcPaETmp1kcDd2is=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=cCKEt868xULh/+HOFPKJr5GJ4ASxpIGwrNQ/LwQ6Cc58iUdGZeOD633nS9aamw4W8
	WQe5t/WFU9I+60JNbMyA2z8/G4aeFTod7Zw9eSU4az0Ljfqe70Flf1dGkMoWZb/IqK
	+XMI7My4Egc3Y3SInePqeivEfH3r6lx4LWYaCY+0=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=LpfmYB1q;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=LpfmYB1q
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UrAK3tahsyVI; Wed, 14 Nov 2018 09:43:28 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 737296FD98; Wed, 14 Nov 2018 09:43:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542185008;
	bh=QbTUIJcl7908p+tvIIURKP3BJGkxcPaETmp1kcDd2is=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=LpfmYB1qtefecxDpMACY138o00r8JZXjnUbkufj0jrA2ISA8iZB3LVge0lGRtzzqt
	ZlotNWHjib87Vw1kFHJupCzUldExB+JiWkDhqtLoIPrStWF+IoTvniC/Wv7Bhxk+wb
	xtI6IsPVQDT6hwCHHp5ktaQs2DrkiYK8MkrPcarw=
Received: from [192.168.61.102] (lfbn-1-8165-82.w90-112.abo.wanadoo.fr
	[90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 0402A6FD8D;
	Wed, 14 Nov 2018 09:43:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1542185008;
	bh=QbTUIJcl7908p+tvIIURKP3BJGkxcPaETmp1kcDd2is=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=LpfmYB1qtefecxDpMACY138o00r8JZXjnUbkufj0jrA2ISA8iZB3LVge0lGRtzzqt
	ZlotNWHjib87Vw1kFHJupCzUldExB+JiWkDhqtLoIPrStWF+IoTvniC/Wv7Bhxk+wb
	xtI6IsPVQDT6hwCHHp5ktaQs2DrkiYK8MkrPcarw=
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
References: <20181110081147.4027-1-luc.michel@greensocs.com>
	<20181110081147.4027-4-luc.michel@greensocs.com>
	<20181113110636.GH1148@toto>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <a67ef945-2466-155c-0f16-0a1b3b74c9fc@greensocs.com>
Date: Wed, 14 Nov 2018 09:43:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181113110636.GH1148@toto>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [PATCH v5 03/16] gdbstub: add multiprocess support
 to '?' packets
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
X-TUID: sR33CjjvUGie

Hi Edgar,

On 11/13/18 12:06 PM, Edgar E. Iglesias wrote:
> On Sat, Nov 10, 2018 at 09:11:34AM +0100, Luc Michel wrote:
>> The gdb_get_cpu_pid() function does the PID lookup for the given CPU. =
It
>> checks if the CPU is a direct child of a CPU cluster. If it is, the
>> returned PID is the cluster ID plus one (cluster IDs start at 0, GDB
>> PIDs at 1). When the CPU is not a child of such a container, the PID o=
f
>> the first process is returned.
>>
>> The gdb_fmt_thread_id() function generates the string to be used to id=
entify
>> a given thread, in a response packet for the peer. This function
>> supports generating thread IDs when multiprocess mode is enabled (in t=
he
>> form `p<pid>.<tid>').
>>
>> Use them in the reply to a '?' request.
>>
>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>> Acked-by: Alistair Francis <alistair.francis@wdc.com>
>=20
>=20
> This is also theoretical but:
> When looking at this, it seems like you could have lazily created
> the s->processes array entries (if you find a cluster but the
> no valid entry in s->processes). Then we could perhaps eliminate the
> scan of all objects at startup and also support CPU/Cluster hotplug.
Yes you are right, this could be an improvement to this series to add
cluster hotplug support (CPU hotplug is actually supported). It's a
little bit tricky though since we would have to maintain the
s->processes array and properly signal to GDB when a process dies.

Cheers,
Luc

>=20
> Anyway, this looks good to me!
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
>=20
> Cheers,
> Edgar
>=20
>=20
>> ---
>>  gdbstub.c | 60 +++++++++++++++++++++++++++++++++++++++++++++++++++++-=
-
>>  1 file changed, 58 insertions(+), 2 deletions(-)
>>
>> diff --git a/gdbstub.c b/gdbstub.c
>> index 0d70b89598..d26bad4b67 100644
>> --- a/gdbstub.c
>> +++ b/gdbstub.c
>> @@ -638,10 +638,52 @@ static int memtox(char *buf, const char *mem, in=
t len)
>>          }
>>      }
>>      return p - buf;
>>  }
>> =20
>> +static uint32_t gdb_get_cpu_pid(const GDBState *s, CPUState *cpu)
>> +{
>> +#ifndef CONFIG_USER_ONLY
>> +    gchar *path, *name;
>> +    Object *obj;
>> +    CPUClusterState *cluster;
>> +    uint32_t ret;
>> +
>> +    path =3D object_get_canonical_path(OBJECT(cpu));
>> +    name =3D object_get_canonical_path_component(OBJECT(cpu));
>> +
>> +    if (path =3D=3D NULL) {
>> +        ret =3D s->processes[0].pid;
>> +        goto out;
>> +    }
>> +
>> +    /*
>> +     * Retrieve the CPU parent path by removing the last '/' and the =
CPU name
>> +     * from the CPU canonical path. */
>> +    path[strlen(path) - strlen(name) - 1] =3D '\0';
>> +
>> +    obj =3D object_resolve_path_type(path, TYPE_CPU_CLUSTER, NULL);
>> +
>> +    if (obj =3D=3D NULL) {
>> +        ret =3D s->processes[0].pid;
>> +        goto out;
>> +    }
>> +
>> +    cluster =3D CPU_CLUSTER(obj);
>> +    ret =3D cluster->cluster_id + 1;
>> +
>> +out:
>> +    g_free(name);
>> +    g_free(path);
>> +
>> +    return ret;
>> +
>> +#else
>> +    return s->processes[0].pid;
>> +#endif
>> +}
>> +
>>  static const char *get_feature_xml(const char *p, const char **newp,
>>                                     CPUClass *cc)
>>  {
>>      size_t len;
>>      int i;
>> @@ -907,10 +949,23 @@ static CPUState *find_cpu(uint32_t thread_id)
>>      }
>> =20
>>      return NULL;
>>  }
>> =20
>> +static char *gdb_fmt_thread_id(const GDBState *s, CPUState *cpu,
>> +                           char *buf, size_t buf_size)
>> +{
>> +    if (s->multiprocess) {
>> +        snprintf(buf, buf_size, "p%02x.%02x",
>> +                 gdb_get_cpu_pid(s, cpu), cpu_gdb_index(cpu));
>> +    } else {
>> +        snprintf(buf, buf_size, "%02x", cpu_gdb_index(cpu));
>> +    }
>> +
>> +    return buf;
>> +}
>> +
>>  static int is_query_packet(const char *p, const char *query, char sep=
arator)
>>  {
>>      unsigned int query_len =3D strlen(query);
>> =20
>>      return strncmp(p, query, query_len) =3D=3D 0 &&
>> @@ -1018,22 +1073,23 @@ static int gdb_handle_packet(GDBState *s, cons=
t char *line_buf)
>>      const char *p;
>>      uint32_t thread;
>>      int ch, reg_size, type, res;
>>      uint8_t mem_buf[MAX_PACKET_LENGTH];
>>      char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
>> +    char thread_id[16];
>>      uint8_t *registers;
>>      target_ulong addr, len;
>> =20
>>      trace_gdbstub_io_command(line_buf);
>> =20
>>      p =3D line_buf;
>>      ch =3D *p++;
>>      switch(ch) {
>>      case '?':
>>          /* TODO: Make this return the correct value for user-mode.  *=
/
>> -        snprintf(buf, sizeof(buf), "T%02xthread:%02x;", GDB_SIGNAL_TR=
AP,
>> -                 cpu_gdb_index(s->c_cpu));
>> +        snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP=
,
>> +                 gdb_fmt_thread_id(s, s->c_cpu, thread_id, sizeof(thr=
ead_id)));
>>          put_packet(s, buf);
>>          /* Remove all the breakpoints when this query is issued,
>>           * because gdb is doing and initial connect and the state
>>           * should be cleaned up.
>>           */
>> --=20
>> 2.19.1
>>
>>
