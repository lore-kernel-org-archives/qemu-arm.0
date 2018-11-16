Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp907878wrw;
        Fri, 16 Nov 2018 14:04:22 -0800 (PST)
X-Google-Smtp-Source: AJdET5ecCj9kTCBa5tu0qqs6tW4B+HEXzyBFyxefFr91mM9QgHnqvMcSV8AWpxdhLSKxZE+z4uh4
X-Received: by 2002:a0c:db04:: with SMTP id d4mr12138470qvk.114.1542405861933;
        Fri, 16 Nov 2018 14:04:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542405861; cv=none;
        d=google.com; s=arc-20160816;
        b=s5xL2tZfTFz5OsVNgHNon/0kVdLARpfS8np8ibNl5cfK7hUOt+4U5eNj0m2WxqTCP8
         O4+8tsC3XIvsy2UpDEnq+IXRJZ3aNXDjihZqfs0JoO9nWx0koqxVYkeKAS9966M/wdKu
         ZgFi3V1F22ZiZCjOZ1tl3daQYjAcJFh/WtFIFPmsjdY6nkFTRtqCCh1kfZfkLCb/QKsd
         JPdNnw4uR4Ph4M9Zpy6+oEEn+Pto+cIzmMgRaOb2eJZ8nNMz1pKzGeA7TINJGbc9n5Qr
         AyfHhwfKJ2RPG2FWYxpnhtNcLwrTh7zJuiaqdrMqYwNJWowS8Yiwy5XzI3vwxFEb8sku
         51ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=GbhqAdeDDlTaQrm3YWP4+jCfUMDWV9zzQCTqsK3c2OM=;
        b=Iuy0Y7npjh2TihVZCtPm+PEuOZ1d9owgKYYsnJ/SBbRE0qhdBkAyf3U/spN5ZLlWsq
         +8rVraypLVTaz9Z+r0+DTVdledyyAvqslcDUzLM8Kf0UlVp7nnMkMmjbsP7ypPY65QTP
         uvmwutqvuVLDPtNUYjuvY/YCIc/CAAbfPcU+y2EIC6cFydtQj/QgnV7g8+Y9TpRACA5e
         MDRSaREj8aOzhdFDFcI+I85XfIKHJlatvF5W02aCzHPMlKTUgYQ/evTEcye8AvUIr0In
         hJoHb/DlievtyiXB8Qt13Mnntk88s8PfLK29C476+G/pvQifGnDK5eNUQxPvderS0vM5
         hPrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=d07cmAVW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b3si701318qtj.219.2018.11.16.14.04.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 14:04:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=d07cmAVW;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47182 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNmDt-0007bu-AN
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 17:04:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gNmDV-0007al-Hy
	for qemu-devel@nongnu.org; Fri, 16 Nov 2018 17:03:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gNmDU-0004qz-MJ
	for qemu-devel@nongnu.org; Fri, 16 Nov 2018 17:03:57 -0500
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:35349)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gNmDQ-0003rX-B4; Fri, 16 Nov 2018 17:03:52 -0500
Received: by mail-pl1-x643.google.com with SMTP id v1-v6so4617191plo.2;
	Fri, 16 Nov 2018 14:03:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=GbhqAdeDDlTaQrm3YWP4+jCfUMDWV9zzQCTqsK3c2OM=;
	b=d07cmAVWen3znYR8WE74Yjur2Ts/YFuyS605ZidCih49uf2Utr4FOjHqYhgpddoVWf
	uEPschDyVCDvdy8cgHGc7QP2luGVN3y5+VNTVwRj/Gna4RCrud8mnLpYXcQLoGpFy7pr
	9q+70iHPOTJIs7HmXEVz20pzP1biStY+B7X01FSXB4xFTtfa9z253XGlztQydMRFSuXk
	eBU22iWztwFcwJzXfxaZIdsJ2nVvUCtMHF4b6Iyxs3TPao7eb7ifUJbOUCsAJ2kFSMEe
	zVobVu2SMeq6Js0/BHr8p9mtoDVVdA+ZXNWxs6O1nSaa9L8a5WM7P+MZWn4w6rUpFaTA
	GC/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GbhqAdeDDlTaQrm3YWP4+jCfUMDWV9zzQCTqsK3c2OM=;
	b=uJd8YmZoeHSpp5Ob8drCo3i5k8SSGRMn2u32rcYMESAMLWPpw0HyFGpt1r+EQwM+TT
	3IJFB1uzfwIMZ1+J9xoEBeIKiuqDEkoMxqOXOWYvilv2Av6vyBFYWD256m0GYF3D3YE2
	fz2lEHoMCK0bqutmNUoh5ZZgv3SYCrEBFlr3QI9G127nCXK2k6AkfwXXdUOq8fBtKiRz
	qCsRO0JU3xUhguN8SjfALLU9o7SK0XVWRZd/eiII3W/u5pw5/vZCwz5AGVL19k5m2pam
	h1x+2GXuXQPsuNpwR1WQJBcjeOdeaW6TTVyw04eslu+FqfA4MniC7QvdmAlurBxKTc8M
	3BgA==
X-Gm-Message-State: AGRZ1gK1Cg0jaYFhu0S25lx0x4LsxAGyHQ5ALAd9LlM75pcDuCMCY5tA
	53Nz9bmmwbm7ogi9fxQTuq+Bl7++
X-Received: by 2002:a17:902:e01:: with SMTP id
	1-v6mr12244673plw.251.1542405819758; 
	Fri, 16 Nov 2018 14:03:39 -0800 (PST)
Received: from [10.86.55.164] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	s144sm30619411pgs.87.2018.11.16.14.03.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 14:03:38 -0800 (PST)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-13-luc.michel@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Message-ID: <a672dcbd-a56c-4216-5143-6d02767d52a9@gmail.com>
Date: Fri, 16 Nov 2018 14:03:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181115094207.22846-13-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::643
Subject: Re: [Qemu-devel] [PATCH v6 12/16] gdbstub: add support for vAttach
 packets
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
X-TUID: +OOnmQmWaQnv

On 15/11/2018 1:42 am, Luc Michel wrote:
> Add support for the vAttach packets. In multiprocess mode, GDB sends
> them to attach to additional processes.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   gdbstub.c | 35 +++++++++++++++++++++++++++++++++++
>   1 file changed, 35 insertions(+)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index ada53ac559..0427d1c4f0 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1340,10 +1340,45 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>                       break;
>                   }
>                   goto unknown_command;
>               }
>               break;
> +        } else if (strncmp(p, "Attach;", 7) == 0) {
> +            unsigned long pid;
> +
> +            p += 7;
> +
> +            if (qemu_strtoul(p, &p, 16, &pid)) {
> +                put_packet(s, "E22");
> +                break;
> +            }
> +
> +            process = gdb_get_process(s, pid);
> +
> +            if (process == NULL) {
> +                put_packet(s, "E22");
> +                break;
> +            }
> +
> +            cpu = get_first_cpu_in_process(s, process);
> +
> +            if (cpu == NULL) {
> +                /* Refuse to attach an empty process */
> +                put_packet(s, "E22");
> +                break;
> +            }
> +
> +            process->attached = true;
> +
> +            s->g_cpu = cpu;
> +            s->c_cpu = cpu;
> +
> +            snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP,
> +                     gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_id)));
> +
> +            put_packet(s, buf);
> +            break;
>           } else {
>               goto unknown_command;
>           }
>       case 'k':
>           /* Kill the target */
> 

