Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp82578wro;
        Wed, 31 Oct 2018 16:50:56 -0700 (PDT)
X-Google-Smtp-Source: AJdET5fFToysvjGZUy/4f6g5q83upcAsmyU/f9IQtugVt9c+RSMpMzxuEIVclcp5MrJjDF/sCxOs
X-Received: by 2002:a0c:8322:: with SMTP id j31mr4774881qva.56.1541029855938;
        Wed, 31 Oct 2018 16:50:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541029855; cv=none;
        d=google.com; s=arc-20160816;
        b=AJWJqozPG0E5hgQJnknkjffbuhNGYwBATGqRW2fxJYkdnoe4VgnLnBFAC/UiZ2JWGD
         sdl/N72HZVEzWfECw9lsxw72UcImzkHgg2HT1DVrBtm6x4gf1kSw+IUpe/DUb7V1cH4q
         h2joYs8w33B1OgUhHuR0LaNgs0ZPpibLiQeQ3+46GaNfKggifftC7p3TBs5JyM/3iqDQ
         WRtMtL/e68F3SdSPJ0CkCk5zbu5FM+OjjrNQqv5L9PjhvmCJN698USFw57lQCaaXYNQX
         jXo56LoXueY9ALXX2itlyaRaGmYhnD8pjnUpnVL35hbu875ZcqAzM6Z35adNecAh7MBy
         av8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=XK5CUEuS5ooslUHI7Ccj2SHs77D7MtxsmJO3/2iVkX0=;
        b=BZ0TB+xIWMk3Lw9Qd4o509YX3jzuo4HoppYpSfyiim8AAOJ2t9H2jXIR28ivFthOdw
         RgIPfJCVYj1s63nkP9ztWVkAqulHdjRnjM9MjJLR65Aw3yFF6IDa0LazCNF4/WjP822S
         VSQxYWFiTNowS403pjA9Hrp1z0gm1A6mL/o+H61wfIHRxB3CDSGwKXSk6Im0OwGzO9d8
         j1ENuiERf8QEDnWvtJL3pgsWFtq2Ng0tuvi5qKFMfVPo6PN5PzO5aJHuFV2/pQk97+v8
         R+eitiQPlex8nffU/rUlAYq+LFYPZtGYIVX2bkYYuluzUbT8PLN4JhJSAqO93BmrU6cs
         33zA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pDR0F0KP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z17si911932qta.58.2018.10.31.16.50.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 31 Oct 2018 16:50:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pDR0F0KP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gI0GF-0005xh-GY
	for alex.bennee@linaro.org; Wed, 31 Oct 2018 19:50:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54906)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gI0G6-0005xZ-MH
	for qemu-arm@nongnu.org; Wed, 31 Oct 2018 19:50:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gI0G2-0007tX-LD
	for qemu-arm@nongnu.org; Wed, 31 Oct 2018 19:50:46 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:44748)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gI0Fu-0007jr-Sg; Wed, 31 Oct 2018 19:50:38 -0400
Received: by mail-pf1-x444.google.com with SMTP id j13-v6so4882921pff.11;
	Wed, 31 Oct 2018 16:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=XK5CUEuS5ooslUHI7Ccj2SHs77D7MtxsmJO3/2iVkX0=;
	b=pDR0F0KPlWJDj0zqLrE89p/9SXJgQcrDbWYnRUkJ+PEdGhq99UcuMXSZsVyNf/JXw9
	Jb6g51FqVy8yxBeNP2ZdcW7SRYORP0bqxYVCBAqafHYwDOqiUJ0SfbpZJDZeQ1xMKich
	z67oQC1V9/8u2d4caIZ+TG/Bur3beDfvdaVJnPj1ArqYfnVGbnhGfXdaHOBEKk+TY4gA
	t3cDMq5FdCK3t6JISlONpilgnlS3UupP3M2lG00krno85cWCN+g9CXmN3iPLkal/gWeQ
	LUvZbuUehGCkgY0/rvkMZTofb8Lyd96FAy69fk0BdNE0CjfXou2rF2rHUZ+qdE9Sn5rN
	BGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=XK5CUEuS5ooslUHI7Ccj2SHs77D7MtxsmJO3/2iVkX0=;
	b=nQTCDhAUJty4Z+WR8nhyGjQalA3xkWwh7QbTBOjQnDIy/QCi2r4RTET6hwVdSPMI1x
	VkYkLVyTqPvMI/ADoRLtYSf21an9wOENRjVtr9T8kqGBf77d4qdD2Sc+dG5els6wNlZW
	W4X6XkF59Jdgh/LMGeFotEke3qI+LewOKlR2g1TDlI1TeInxN+acmx+rhBL0UjsxjzbP
	LflYIbYmPmk0xvSXh47pq/eACVof+HTwOC2tshAnQnuHa0L7m5oGJoKWDO40PasvnpkA
	MMW8iWUqCatYL9p089uFCJiW7t6/wOE8gQ3Omb5qbYVmuuSNS6GV3bKgCCQlMOaFIa6B
	iSoQ==
X-Gm-Message-State: AGRZ1gIBUrjxxrlgINxrCQDjraCGc10m+mJggFe3FpXrGoO8FgUHYt5/
	PVVQ4p8i4/u/j2GeRiDKtzH9hp8O
X-Received: by 2002:a63:7f0e:: with SMTP id
	a14-v6mr5064657pgd.296.1541029824918; 
	Wed, 31 Oct 2018 16:50:24 -0700 (PDT)
Received: from [10.196.159.185] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	u7-v6sm34890444pfl.34.2018.10.31.16.50.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Oct 2018 16:50:23 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181026081653.24602-1-luc.michel@greensocs.com>
	<20181026081653.24602-15-luc.michel@greensocs.com>
From: Alistair <alistair23@gmail.com>
Message-ID: <794aaf4d-b3a4-692a-8f41-e74f5b0d4936@gmail.com>
Date: Wed, 31 Oct 2018 16:50:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181026081653.24602-15-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 14/16] gdbstub:
 gdb_set_stop_cpu: ignore request when process is not attached
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
X-TUID: 3TVZzTAc98zQ



On 10/26/18 1:16 AM, Luc Michel wrote:
> When gdb_set_stop_cpu() is called with a CPU associated to a process
> currently not attached by the GDB client, return without modifying the
> stop CPU. Otherwise, GDB get confused if it receives packets with a

s/get/gets/g

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> thread-id it does not know about.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>   gdbstub.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index b3461eff9e..09480df2bf 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1784,10 +1784,19 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>       return RS_IDLE;
>   }
>   
>   void gdb_set_stop_cpu(CPUState *cpu)
>   {
> +    GDBProcess *p = gdb_get_cpu_process(gdbserver_state, cpu);
> +
> +    if (!p->attached) {
> +        /* Having a stop CPU corresponding to a process that is not attached
> +         * confuses GDB. So we ignore the request.
> +         */
> +        return;
> +    }
> +
>       gdbserver_state->c_cpu = cpu;
>       gdbserver_state->g_cpu = cpu;
>   }
>   
>   #ifndef CONFIG_USER_ONLY
> 
