Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp904617wrw;
        Fri, 16 Nov 2018 14:01:07 -0800 (PST)
X-Google-Smtp-Source: AJdET5eXkJMGUMBNGX/NZWhDLy1w/Z+ihdnwQWUvkPCR7MLhzboeISI6zsBdZlLC9brHy3B4qo6d
X-Received: by 2002:a0c:cdd1:: with SMTP id a17mr11925771qvn.152.1542405667641;
        Fri, 16 Nov 2018 14:01:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542405667; cv=none;
        d=google.com; s=arc-20160816;
        b=qI1X2l1e7MkiwOxHZcmH3tHj4chj+/IFsqhk1lVzi6RFXPza4w7tc2Qe6sh6AAHXH6
         p+ljRlyCCkkSQ8BO+UhcKCPFf4bNRON1LMCCWvrXp5ooAfgYe0LSEq1LApe1HhVxF8TC
         5VQ6WQMSz00R+YwbNjtIb4ueolvanGFUWiDrBauroXutl9RJ2mAHff5xKVfmkBY9iYpu
         DtYcXM0XCEPBQ2rNvND6CR+g8+aHGaQgLCqKRM/o67hffptEIoHcgQe9VnHUo5lKl5JE
         xQHyR2JMQekt/RRVwKAeMUu64AGVuEsCZ+ONwdO1WEbJafxNhF99MQvAospB/un6yyeB
         /SFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=DfHR946JnC3h+I6bP28zg4Z+t/WxAqBTOqbPSUFBylU=;
        b=UfkDb51Wtb0/rlrxOPJGFfpv8hWLgQuVNBY0CfVsIg6f6YUXsq22BC6abvHeGD2tJl
         qAKooNgs3hzFdKuHCMiZPgGgMZFwt7NXYhoNjCVV/EdY3S34c5lwi2bEyqwJFRKWYHKg
         qVGJhYiHSkifiPl6vGqOJj/Vk7kThdkeBZMMUjybIShKftYr7g6UdfhVd+9OVQAbCftq
         7oZztkO80rgXPq4qdwWII2A1Z+cOdsb5Q0Oho/tpGJE9PRBx4p5HrG0FP13LW6DiWVlm
         9kz460JkSqis8KI7O/Xok+2nCCM05Pl1M386LkaZQF3W9x20PGZ1R22vysgWf+v1frNd
         cv2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dXGSWWnk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x192si1238020qkb.222.2018.11.16.14.01.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 14:01:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dXGSWWnk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47169 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNmAk-0005W1-W1
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 17:01:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gNmAY-0005UY-Hs
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 17:00:55 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gNmAX-0000Ag-Be
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 17:00:54 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:41536)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gNmAV-0008Qn-Bm; Fri, 16 Nov 2018 17:00:53 -0500
Received: by mail-pf1-x441.google.com with SMTP id e22-v6so12002839pfn.8;
	Fri, 16 Nov 2018 14:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=DfHR946JnC3h+I6bP28zg4Z+t/WxAqBTOqbPSUFBylU=;
	b=dXGSWWnkCB2FFqjoE3C5h/ckcRJTDnKneucpgVfvaMyNayMliX37PfD7lQOPAYhNLW
	leAUGj9X07CZHekguPRHWP1YAOvOoAwI61WRD7DFrDoyeFvg0W4wrfkeu44q8wPGPNAA
	yJBNcmk8XjDO3waQ5MlLkfxXyo+OTdxWBBVJr4nHZt1M8W9HLbiET5S8IwJZN2zEQy+h
	T3kgbrz+m/emrbArh7QY6TM9N8Bz+RTnvO2qwzipAjBdbbfBjNQd+yyzPhXWstUqkF7a
	VYjHKWOnpCztbl52khhWGQ/vTCBPWwiux/FAHC304lGwzC7KCr504DNgUMkdFSTvMuUM
	86tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=DfHR946JnC3h+I6bP28zg4Z+t/WxAqBTOqbPSUFBylU=;
	b=p376u7BzgNGJz13Fg6i7h5iDvMEgwZc9TuicV+fIIQGb+e7ydiaZEiez6QzONGb+dM
	o9tCvteZx5PYmkoKF7hbYHiYOQEIGSzVnSodIgPllAPaBC+dnYvZhnDZCi6bvEMQZyo0
	7DeY1UV4Xq1SzuF3fhNMxEIqndQR4Ol+VWJIexHREHJSv2E7I931rnU6Not6Yw4SOuhx
	bzzrHBbF3gm2A9IzuX/e+cFbYPGnX/rYfp7GPex5AldwU79fJZfcB1PAavAFs39Iw5qs
	ffzY20ylx4Ptabis1lGv8Xcx/ddw7dAWBGB4UggjUB7OmUDD2bHql3F5hDhuAcDs6Qmz
	hzlw==
X-Gm-Message-State: AGRZ1gItQbXzrge33327FkDZHuZhWthjk1AddWq3pwUJSlUayWitKL1P
	lZZTjt7QSHbPq2lsu5zvpkJ9ABWk
X-Received: by 2002:aa7:804e:: with SMTP id
	y14-v6mr12688743pfm.73.1542405649547; 
	Fri, 16 Nov 2018 14:00:49 -0800 (PST)
Received: from [10.86.55.164] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	128-v6sm34725988pfd.64.2018.11.16.14.00.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 14:00:48 -0800 (PST)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-12-luc.michel@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Message-ID: <fd647af4-7131-2484-d6ce-f70b5a1fee8d@gmail.com>
Date: Fri, 16 Nov 2018 14:00:44 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181115094207.22846-12-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 11/16] gdbstub: add support
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xsja+kvoVMvP

On 15/11/2018 1:42 am, Luc Michel wrote:
> Add support for the '!' extended mode packet. This is required for the
> multiprocess extension.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   gdbstub.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index eec1cf0d09..ada53ac559 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1294,10 +1294,13 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>       trace_gdbstub_io_command(line_buf);
>   
>       p = line_buf;
>       ch = *p++;
>       switch(ch) {
> +    case '!':
> +        put_packet(s, "OK");
> +        break;
>       case '?':
>           /* TODO: Make this return the correct value for user-mode.  */
>           snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP,
>                    gdb_fmt_thread_id(s, s->c_cpu, thread_id, sizeof(thread_id)));
>           put_packet(s, buf);
> 

