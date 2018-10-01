Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4043951wrt;
        Mon, 1 Oct 2018 09:39:34 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61KedowGtLXZzuq1jKZzvRcVicEYPhWSo7QgAP8nbneEu/GuY6NWnYfo6Hfpc5QdRpC5K7t
X-Received: by 2002:ac8:70b:: with SMTP id g11-v6mr3358797qth.219.1538411974789;
        Mon, 01 Oct 2018 09:39:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538411974; cv=none;
        d=google.com; s=arc-20160816;
        b=Czg+q09QOcuQwmAqldqjBw/QauHRRV6uX1MYsWNeIv7RbkUoIX5g0AtlRLCQ0HN5T8
         vVx3qwBFG3spbXvblZ7pDX7YlmTbbuJjnF2t6KU5E6ydqqXFZDamQM+mwcPU8SpF+bWq
         HB3PHYx8JrKCgtE4txrmHffQY1lqR3UcGjzhG59ElA1W33a8qCexClIfHAUJ63NG+qlq
         cl8KfTcxduyv6KhBUzzs0Af0tAamFLHan2i4Ut2cVtz0sCEO4KQ1nNWxfhyQIeIYJExK
         vQckkcTE97hUQDtT9OsBMTHUV4dZbjXP+bi7i6abAiWIAkwywrp00h1Jj2VcThNijBaX
         jbaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=32OjFSIfS9A5VGb2s2xsQ6w4CpwHu0udmf9lkWR2J/A=;
        b=ycB/4OclNjkqaF9SB2vvP+APItwGkADqz7WUhcCHjoxh5hgxAy+rvrJws0cxZ1hCg/
         E4uxOY8O8cTSSYFmXqqQf+ymsStDlWJUS4GNn2ijrNKPh4vHXXQVeCGhu+1tPd2bKLMN
         GdaCKKcA7af7UJRQ0nZ5wEiqdU79n2hKYrKeXxWIihTCNO8yd93n5pAYnd2hrxF0CWiO
         ayhRAiMyPek1OGCJ65cm9naUhIHN0U7DC7QYPiyjukVBbZztPEv+wfqNmqrMUg3rKkzL
         OEgaHRDG7a58hSAf0UAp+5whCL90aNZoa6f3eDoeOVP643IobUrpMuJD071StzZqrWIT
         jXMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e6-v6si2416810qtq.299.2018.10.01.09.39.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 09:39:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39594 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g71EM-0002Aq-D0
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 12:39:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47548)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g71Du-0002Ag-MC
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 12:39:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g71Dr-0001RR-G9
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 12:39:06 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53952)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g71Dr-0001R6-8j
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 12:39:03 -0400
Received: by mail-wm1-f68.google.com with SMTP id b19-v6so9482209wme.3
	for <qemu-devel@nongnu.org>; Mon, 01 Oct 2018 09:39:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=32OjFSIfS9A5VGb2s2xsQ6w4CpwHu0udmf9lkWR2J/A=;
	b=rcyWg0ux/Vojlzae/Ds1jN2Py5ygQxN2GbN0bzsSG/X5NlTMBIVYSt7HWWNe2VofvD
	oFGZWJ/bZZiaeMfyQhfn5OGLUvhVqrsFUlnvz05ciJ5u0dzQ2WkgCkFN39c4LunudLRL
	E3AMQ+FmhSUcIjzyjbl6auOl3GWTZGJPUBBRi1TKfn71rq11qr1L3V0bV4F0tjLFggZy
	jpQMQA8wuyvb17X9ZCCq1u6Y28z5IMpwn9O25yJuR/oWUQdMSWiGqkIM5g9sx6vY9ng6
	1S83ZjQlVAx1O3x3LVVtk68SJADLY+MQqQMrwbr6ok3enIN5ryJngcmlGdrp29G8/+yz
	qFzQ==
X-Gm-Message-State: ABuFfogf2iy3SERUIkZt+sFjMw5THhbmN9irIEbnL/rjNB/adceOAr1/
	lN41ddUYu4TcYgUeQ+iSyTY8YA==
X-Received: by 2002:a1c:48d:: with SMTP id
	135-v6mr9226538wme.102.1538411942251; 
	Mon, 01 Oct 2018 09:39:02 -0700 (PDT)
Received: from [192.168.2.71] ([80.31.72.241])
	by smtp.gmail.com with ESMTPSA id
	o7-v6sm3807259wma.17.2018.10.01.09.39.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Oct 2018 09:39:01 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-11-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <c81c6345-df29-f7e9-77ea-2682d7e02585@redhat.com>
Date: Mon, 1 Oct 2018 18:39:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181001115704.701-11-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PATCH v2 10/15] gdbstub: add support for extended
 mode packet
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2ljDrHyuJuvp

Hi Luc,

On 01/10/2018 13:56, Luc Michel wrote:
> Add support for the '!' extended mode packet. This is required for the
> multiprocess extension.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  gdbstub.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 299783b3b8..d372972dd3 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1280,10 +1280,13 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>      trace_gdbstub_io_command(line_buf);
>  
>      p = line_buf;
>      ch = *p++;
>      switch(ch) {
> +    case '!':
> +        put_packet(s, "OK");

Don't we want to also support the 'R' packet?

> +        break;
>      case '?':
>          /* TODO: Make this return the correct value for user-mode.  */
>          snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP,
>                   gdb_fmt_thread_id(s, s->c_cpu, thread_id, sizeof(thread_id)));
>          put_packet(s, buf);
> 
