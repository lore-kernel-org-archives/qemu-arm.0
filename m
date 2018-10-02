Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4827492wrt;
        Tue, 2 Oct 2018 02:27:08 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61jd+k64blRzhW/yxJZFZBNxXEXPEyAYuS6wJMD8jmLCkkqaEub3gxnmPmITD6uoPq8B2ey
X-Received: by 2002:a37:5a06:: with SMTP id o6-v6mr11585027qkb.44.1538472428173;
        Tue, 02 Oct 2018 02:27:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538472428; cv=none;
        d=google.com; s=arc-20160816;
        b=r3/983zFntgHhgb+VgajaEHLaQNZxdp0JHVzeOZ2W4FShX2NMAqq4Ehq5CaCKpwvfM
         4OTgfUdZ9h+sRPrm19+v5feuxonXNF3uWbbWYndtbGEy9uBlccRCDR/TddL+JQmbF7eZ
         VHVX7jzTGdfvFytUStqVra43Dwp6sTd0eUeLQC5mw8EiLb8Axz/cvH+5XWQDCMAW9ENr
         yO08VK5O4bQ/AzL7bxl7Bo0h5ns3kniXgmem2Al1wH9/RoWP4YsIA9G6//8zCpHKeLyD
         7j3V07uPzO3BtQV86S+wG4yhLKIi3XP0467emA/ZHG0LQ0+xC7i9O9VDU4zSzmxhIsqy
         pxBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:dkim-signature:dkim-signature;
        bh=FoKVr/O82TM1UDZq4khJrpdZYKSmXcgdTuUggJbVxTc=;
        b=iX/XqNJQzo5RUVA+XpzRpTtOwU+A7/7DgtNvTH3SNEFhaooTmlQXXWSCC7uztH7ECb
         pDpCJ4cnmmUlgGix27kznqmJQ4EJDsUQWYLq2yQONe7pyr1BJpgBQFZc6r8Ha61YAUt2
         0Nk3WvnA9o/Hn0MlaFqN9dS0sF+IMKFFbPOX3CkrxOYNTsnTvE7WrRvVUy3rP0R4d7YF
         uiTBzlpSG/BUo0WLlVqMgY6f5YTvp1QVlppW3WrGEI+o01d62fdWusDTDIJmwbosdOiT
         SnoJdIcRFApE6qreCGZviIEwNa/eDsaptIji00naq4g4Y+XFa/AVuXhyF86ixur3wZgG
         BTxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="UnX/m2yV";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Q9GKs6fh;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Q9GKs6fh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w3-v6si3678695qkc.326.2018.10.02.02.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 02:27:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="UnX/m2yV";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Q9GKs6fh;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=Q9GKs6fh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7GxP-00026o-MD
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 05:27:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48176)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g7Gx7-00020t-77
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 05:26:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>) id 1g7Gx1-0003yS-BC
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 05:26:47 -0400
Received: from greensocs.com ([193.104.36.180]:40258)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <luc.michel@greensocs.com>)
	id 1g7Gwy-0003vw-Jy; Tue, 02 Oct 2018 05:26:42 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id E039C442AF5;
	Tue,  2 Oct 2018 11:26:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538472389;
	bh=wGaOTEthcdWepSuEjWbOwMRyYcWQHPY+Kr4sDiUN7eY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=UnX/m2yV39Zx+knmOFtutdiLUrN4QwisXSwlESMB/XeJaB8Sf5CG47HzfOvpdD8YA
	5eGMvf10d5o9+s4OkGvxif8H77RIfsoWY4dJuMVlD5ftyq2DnxCPQJ1Kk6BS3G+OW9
	Ex1raXo+z3zZubaa4LYkQXYFvjOyLq4VBHZupDhY=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Q9GKs6fh;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=Q9GKs6fh
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZaD9wLEbHh8D; Tue,  2 Oct 2018 11:26:29 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id EAD6D442AE2; Tue,  2 Oct 2018 11:26:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538472388;
	bh=wGaOTEthcdWepSuEjWbOwMRyYcWQHPY+Kr4sDiUN7eY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=Q9GKs6fhcpm8wqVweugHupzsfeRO/7tWrmfu9z3bavJKTDNZ8SuI/Hb3tn0PVRZJ/
	SxrvzFKMIKJXV7WQQU/SUbEhj1ntyAhWGx02G+UTl0+DX/MKPqK0CLaYtHFqWeVXqp
	jb6m6bP6an+i53B9v/ZOsQ199N6mRrtqZq3zNmcs=
Received: from [192.168.61.102] (LFbn-1-8165-82.w90-112.abo.wanadoo.fr
	[90.112.74.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: luc.michel@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 7C0F3442ADA;
	Tue,  2 Oct 2018 11:26:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538472388;
	bh=wGaOTEthcdWepSuEjWbOwMRyYcWQHPY+Kr4sDiUN7eY=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=Q9GKs6fhcpm8wqVweugHupzsfeRO/7tWrmfu9z3bavJKTDNZ8SuI/Hb3tn0PVRZJ/
	SxrvzFKMIKJXV7WQQU/SUbEhj1ntyAhWGx02G+UTl0+DX/MKPqK0CLaYtHFqWeVXqp
	jb6m6bP6an+i53B9v/ZOsQ199N6mRrtqZq3zNmcs=
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-11-luc.michel@greensocs.com>
	<c81c6345-df29-f7e9-77ea-2682d7e02585@redhat.com>
From: Luc Michel <luc.michel@greensocs.com>
Openpgp: preference=signencrypt
Autocrypt: addr=luc.michel@greensocs.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <84ef6d2d-a4a2-e140-3125-b8ae0e7d45b4@greensocs.com>
Date: Tue, 2 Oct 2018 11:26:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <c81c6345-df29-f7e9-77ea-2682d7e02585@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 10/15] gdbstub: add support
 for extended mode packet
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /hAKJ0YOUxgk



On 10/1/18 6:39 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> Hi Luc,
>=20
> On 01/10/2018 13:56, Luc Michel wrote:
>> Add support for the '!' extended mode packet. This is required for the
>> multiprocess extension.
>>
>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>> ---
>>  gdbstub.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/gdbstub.c b/gdbstub.c
>> index 299783b3b8..d372972dd3 100644
>> --- a/gdbstub.c
>> +++ b/gdbstub.c
>> @@ -1280,10 +1280,13 @@ static int gdb_handle_packet(GDBState *s, cons=
t char *line_buf)
>>      trace_gdbstub_io_command(line_buf);
>> =20
>>      p =3D line_buf;
>>      ch =3D *p++;
>>      switch(ch) {
>> +    case '!':
>> +        put_packet(s, "OK");
>=20
> Don't we want to also support the 'R' packet?
Hi Philippe,

Thank you for all you reviews!

I'm not sure about this one:
  - do you think calling qemu_system_reset() is the right thing to do?
  - what should we do in user mode? Is there a way to restart the
emulated binary?
  - Looking at the GDB sources, GDB seems to send an 'R' packet on the
"run" command. It starts by a "vKill;pid" packet, then a "vRun". If
"vRun" is not supported by the remote, it falls back to "R". So it seems
that if we want to support "run", we must also implement "vKill;pid",
which probably doesn't make much sense for QEMU. One possible
implementation that would probably work for system mode would be to:
      - do nothing on 'vKill;pid' packet
      - do not implement the 'vRun' packet
      - call qemu_system_reset() on 'R' packet
But it does not align well with the current 'k' packet behaviour, which
simply do an exit(0). Do you have an opinion on this?

Thanks.

Luc.

>=20
>> +        break;
>>      case '?':
>>          /* TODO: Make this return the correct value for user-mode.  *=
/
>>          snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP=
,
>>                   gdb_fmt_thread_id(s, s->c_cpu, thread_id, sizeof(thr=
ead_id)));
>>          put_packet(s, buf);
>>
