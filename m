Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4722994wrt;
        Sun, 25 Nov 2018 13:11:55 -0800 (PST)
X-Google-Smtp-Source: AJdET5fvacnsW6YUwq3RRGf/uq7zH4PeqgOyzTEDj/baV+kmltOjnqFp46cSsV7qCsZ6AEyL8o/T
X-Received: by 2002:a81:b382:: with SMTP id r124mr25889285ywh.102.1543180315337;
        Sun, 25 Nov 2018 13:11:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543180315; cv=none;
        d=google.com; s=arc-20160816;
        b=DTLLEg3+LnTcow8eC0L3ZwIakvSL+HyTF/GIfY45Tlo31ne+Z2PFiGQw32JrTVFUyL
         GVNFu7IQAUSb1nhH2jHO/CvYRtXs3WmAxq97rj0Ttq2zBXGq7ZlFBn5XBl2PzVVOlciM
         IRis2JLUq5V/rOb3HYh9vMlWmHTeB3CsmFrsVQWPLWMmXlg7mPwyncVNAuWzlYCuqcJO
         4CdWXJJGeC5GNiaGKu+rzK331ViBgkLHswGcYL5OnShVINEX4owxH9gPPnBxDwRFIHQP
         XB1blEk+YloC0DN5/s39TOxa5zSpD850mNvYi8Eetrz0nV/EelnDJ9i524587lbByhcv
         eRgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=snL8V8mQ7ancl3qokMj+u6yKU7RsH30T8nKdx5IH4s8=;
        b=VnPM7bUooPSW8F0f/d6MwT1Kn+YvxoXHVfqgvKQSBlQw+sFetlAwQqluCD45K4eFD6
         hOU7Ay8CWhlAvDVpZsu9FuCYaOl1ZjDtgHkVwUExZ+aAxlf/Kb7aFKHhgzT/hgmVoPUb
         ivWQ/+6NZ/wRhDsknPGqvvLZBwMP+CCg2hiBKP9jbGOuiozaTU8IWT3YrSmE18CsDA8s
         XM5hcQrZDb3/9UB0GoMp3oGgBPmOx2i0mqwEurWoBoWLja+erUVj34KPGa0btQtNkL6t
         337dndHx1vNLCX0JJh51ZqsrcbYTNroXz3ZDr2r+fm6WM7Gd6CXEc7rNpG2mACZBtUSH
         0f4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d66-v6si13457110ybd.362.2018.11.25.13.11.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 25 Nov 2018 13:11:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33070 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gR1h4-00021X-NJ
	for alex.bennee@linaro.org; Sun, 25 Nov 2018 16:11:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1Xj-0001yZ-Fw
	for qemu-devel@nongnu.org; Sun, 25 Nov 2018 16:02:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1Xf-0004IE-7J
	for qemu-devel@nongnu.org; Sun, 25 Nov 2018 16:02:15 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:40412)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gR1Xd-0004H5-6u
	for qemu-devel@nongnu.org; Sun, 25 Nov 2018 16:02:09 -0500
Received: by mail-wm1-f67.google.com with SMTP id q26so16282932wmf.5
	for <qemu-devel@nongnu.org>; Sun, 25 Nov 2018 13:02:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=snL8V8mQ7ancl3qokMj+u6yKU7RsH30T8nKdx5IH4s8=;
	b=AgumxExlYYRGPfVl6N8JLof5FLB8AuImKsIhWYLvs5UuruyWnrXe/4PEUSqLrODKUI
	gPy2tolRnzNpTp2hkdgiLa4pqNDPOw56UFQd/ylg3oKnl/J/R4dxOgjqgPW0pgbgb2BU
	ArfuHYyZ/kVh5E6Wvw4CzvhErF9taCfGrR6iKckSN1b6EE459dijD7PXPGiG/y9XiMDH
	6o75qArqw8R7aHaieyR4I8+OFYo+oCMuBloOPBII9xWlh0cM/J8eUkbKRFfyaY4TxhHk
	7SmAWdryIwMd4bNljAfRPG51Ag6FV9m0MP6sQ8chg6yjpJcRHRoo1rrsy4Vmvoph3LYC
	Olmw==
X-Gm-Message-State: AA+aEWbQLewwzdhIcrO6OXczu2jxoA0TuVG8AR8n8KnuNJTjV6app9IO
	ebYdI1KCzV0EUKtedW8l8Se+FLcisyI=
X-Received: by 2002:a1c:a9d6:: with SMTP id
	s205mr17097983wme.131.1543179727410; 
	Sun, 25 Nov 2018 13:02:07 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id
	t5sm18877075wmd.15.2018.11.25.13.02.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Nov 2018 13:02:06 -0800 (PST)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-14-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <775700ee-1c92-34e4-0a19-1fc2ec466d86@redhat.com>
Date: Sun, 25 Nov 2018 22:02:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181123091729.29921-14-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-devel] [PATCH v7 13/16] gdbstub: processes initialization
 on new peer connection
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CHMu536JcIti

On 23/11/18 10:17, Luc Michel wrote:
> When a new connection is established, we set the first process to be
> attached, and the others detached. The first CPU of the first process
> is selected as the current CPU.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  gdbstub.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 69471ea914..6518324d46 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -2249,13 +2249,14 @@ static bool gdb_accept(void)
>          close(fd);
>          return false;
>      }
>  
>      s = g_malloc0(sizeof(GDBState));
> -    s->c_cpu = first_cpu;
> -    s->g_cpu = first_cpu;
>      create_unique_process(s);
> +    s->processes[0].attached = true;
> +    s->c_cpu = gdb_first_attached_cpu(s);
> +    s->g_cpu = s->c_cpu;
>      s->fd = fd;
>      gdb_has_xml = false;
>  
>      gdbserver_state = s;
>      return true;
> @@ -2337,12 +2338,23 @@ static void gdb_chr_receive(void *opaque, const uint8_t *buf, int size)
>      }
>  }
>  
>  static void gdb_chr_event(void *opaque, int event)
>  {
> +    int i;
> +    GDBState *s = (GDBState *) opaque;
> +
>      switch (event) {
>      case CHR_EVENT_OPENED:
> +        /* Start with first process attached, others detached */
> +        for (i = 0; i < s->process_num; i++) {
> +            s->processes[i].attached = !i;
> +        }
> +
> +        s->c_cpu = gdb_first_attached_cpu(s);
> +        s->g_cpu = s->c_cpu;
> +
>          vm_stop(RUN_STATE_PAUSED);
>          gdb_has_xml = false;
>          break;
>      default:
>          break;
> @@ -2528,19 +2540,17 @@ int gdbserver_start(const char *device)
>          mon_chr = s->mon_chr;
>          cleanup_processes(s);
>          memset(s, 0, sizeof(GDBState));
>          s->mon_chr = mon_chr;
>      }
> -    s->c_cpu = first_cpu;
> -    s->g_cpu = first_cpu;
>  
>      create_processes(s);
>  
>      if (chr) {
>          qemu_chr_fe_init(&s->chr, chr, &error_abort);
>          qemu_chr_fe_set_handlers(&s->chr, gdb_chr_can_receive, gdb_chr_receive,
> -                                 gdb_chr_event, NULL, NULL, NULL, true);
> +                                 gdb_chr_event, NULL, s, NULL, true);
>      }
>      s->state = chr ? RS_IDLE : RS_INACTIVE;
>      s->mon_chr = mon_chr;
>      s->current_syscall_cb = NULL;
>  
> 
