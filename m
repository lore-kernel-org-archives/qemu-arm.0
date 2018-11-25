Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4728185wrt;
        Sun, 25 Nov 2018 13:18:31 -0800 (PST)
X-Google-Smtp-Source: AJdET5due3bfidR06Jov9627jL6roWTF6+dGMKUTA5I2PCvastDgnTHQPWY/DvxHpXF7Lsvp8sHn
X-Received: by 2002:a81:2890:: with SMTP id o138mr26722369ywo.168.1543180711406;
        Sun, 25 Nov 2018 13:18:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543180711; cv=none;
        d=google.com; s=arc-20160816;
        b=PBHzQ8k+2VKpr8KPTqNkAEmGRf2CNTZCG+ATZX95yl9Dlw6JhNErMDxGNyfXMXyryb
         ClCVxDJWek+xlYzfA7GSyqh2VIEXghAkSPPwpitYBn+0ucy8RmGQWlAPb7fwbl+VOSsf
         UFcAyi2/G3QbKM0IWHgHsZsiZw/Y8WS87QfNEYDX5vah1ojpeGVtLh4tlURnZj+kGdS7
         GsaFenT3h7ZzN7qPDGGGfEtR+eTa6bBkYgBw29aNR5i1OwiwtfOHX3TLjVnGc6S3wcNI
         S36eqYqbsG21ZORfQTUX2ybCTvMifSzaAshdiV+bGOwuWnUJKOaJUd3eC4V9/zpnCy+5
         NXiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=4DShahf0SiXLX9WuRR71Hfxh/fpCic8L9V2+SH08v3E=;
        b=U/7A2DokBWhoep7rHgTrGPtWyHUVmz9QHgf4ZwyCjhVE06VttauHZLVWfflhagvD5Y
         Arw3TvTy3aEbsH2Crldau0EM3ghKprjC5g93xI5EaIx2SH1Uxeq4gjNcj5TMRso6cUOz
         agC+33b6w4t+bvnpdZ4PtByglZ74prYOZny3JiMVCjhevrQ3oNyqhA2VlfuvvCp+r97R
         /pyQI9iYhMx25NF0X+WcieIbUblBT1or77oZrM4ISkuR6i3+AN/EVgjqM89DlK9dONXB
         GbIyc0sXoIYUtuCabX7ExIMPXZQUGAPm6Kz/SsCqUFnP14K+5GMOu4iXIVSQF8kDzeA2
         OnvA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c10-v6si38283845ybm.200.2018.11.25.13.18.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 25 Nov 2018 13:18:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33117 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gR1nS-0008Ti-O9
	for alex.bennee@linaro.org; Sun, 25 Nov 2018 16:18:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44381)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1Vt-0000Xl-2u
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 16:00:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gR1Vo-0003D9-TV
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 16:00:21 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:50710)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gR1Vo-0003Cp-O3
	for qemu-arm@nongnu.org; Sun, 25 Nov 2018 16:00:16 -0500
Received: by mail-wm1-f67.google.com with SMTP id 125so16310491wmh.0
	for <qemu-arm@nongnu.org>; Sun, 25 Nov 2018 13:00:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4DShahf0SiXLX9WuRR71Hfxh/fpCic8L9V2+SH08v3E=;
	b=BeUg3o/oxJFjhB8SflEFoC7bkU0BA+369RALitB1veKc83OvWz6KmNYJVhIQDX7qb6
	b0b07kuH35c4/gOnFLRnS3Gk+qnCzR+svWzGxAfMaU4pRa1B+SBO+kDJEOi05H7pmQ59
	eZ9aIDrANMHW1+PgnCIu3vW0YeEmVmWkOiQrxxtaRO6RIWdX/W75aTvACRJ3NkhJGh1N
	AqE4328UfG3IoNcEW1GFA/OyTeDPhVy24FFnCfF76JwjMEysMKJ7ZqeIDdJdlj2ZkNdh
	PptHwL9cnxJq0XTH0L1b3MlXfTA2opJ9ki1OU4wKZ15PpseDT79Z3d1vyoM52ZbelGrF
	UB5g==
X-Gm-Message-State: AA+aEWbd7fbhVSQKVZV84lYnuvOHueWksva0ZFVqMnxC5dEK491RLozx
	8UB6Wcrz0att0J8kKTLka9RBb5EPxP8=
X-Received: by 2002:a1c:9803:: with SMTP id a3mr9518591wme.69.1543179615440;
	Sun, 25 Nov 2018 13:00:15 -0800 (PST)
Received: from ?IPv6:2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9?
	([2a01:e35:8a1f:dc10:bc9e:f614:2d6b:7cc9])
	by smtp.gmail.com with ESMTPSA id
	x79sm39522341wmd.42.2018.11.25.13.00.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Nov 2018 13:00:14 -0800 (PST)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181123091729.29921-1-luc.michel@greensocs.com>
	<20181123091729.29921-13-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <ea8b9cf8-7112-2bca-46a8-17c60f517542@redhat.com>
Date: Sun, 25 Nov 2018 22:00:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181123091729.29921-13-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.67
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 12/16] gdbstub: add support
 for vAttach packets
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
X-TUID: tdh9yvtqDaRk

On 23/11/18 10:17, Luc Michel wrote:
> Add support for the vAttach packets. In multiprocess mode, GDB sends
> them to attach to additional processes.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> Acked-by: Alistair Francis <alistair.francis@wdc.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  gdbstub.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 5cc643b9e0..69471ea914 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1342,10 +1342,45 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>                      break;
>                  }
>                  goto unknown_command;
>              }
>              break;
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
>          } else {
>              goto unknown_command;
>          }
>      case 'k':
>          /* Kill the target */
> 
