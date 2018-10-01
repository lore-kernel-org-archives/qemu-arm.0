Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp4051514wrt;
        Mon, 1 Oct 2018 09:46:53 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61PGL9wgaueJsfghfe7ptqFbiS7DeShYf1jozX4hqIblmP8sD+PbFLF0L33+PJk1KFpzE0Y
X-Received: by 2002:a37:cc1b:: with SMTP id r27-v6mr9075685qki.272.1538412412962;
        Mon, 01 Oct 2018 09:46:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538412412; cv=none;
        d=google.com; s=arc-20160816;
        b=cBsXKro5H+fU5tF/9u7pJLbZJnrtNRwFkbmuH90LXs+/8sUO4rG0VRj4Rropnxc/5A
         6Hg8hL+o8zrkCqoLS+94tPJBJyOuqDW7i0e2rLp5triLCfW5tfRSixCCKTVSDyF+k+2B
         hp6whMVPZyLBzA1sk2ll15BEP/kVhDZQAJRCB9DfyHNY8tyWINF8sJC4BUcXDEtfD9fH
         NDj9eEx6qzw3IsCW5Er08zb5aFUOmb58lbzMMnJkpxnrp5jW5DlhcBr8plWFCzL2j7vP
         SPxCsOdpOV9tUeAkXFIYCPO429rNFFMIkCusstEVmFm4rvdfdM3Q+T2GVDr8Wu+ZA6CP
         VbRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=ZBVoqT88MG5rZXTo3Ez0DSg01lMPGIbyPAC24fq/+m8=;
        b=nWYj5ZYIZfirFsMJfzjVH9VmqjbRW1bXiQaY26hcZ5Gs5aVs0DJu9EbWqn9E/0yC8n
         lG0VdVE9vfGqPnHn//JNVkMW9YiSfGmP/Fd88YeAtpypDI6gnhpjyDLFLIw0rZOqwxQ2
         FGNrGYcoK1tCZaGTPZWoIXnXHsXUL2IEtdvBVPUZBb/wIki6UfVKUfCW/6LeNrEAajTP
         jopDeCtCecY9ZLRL6pL2ysBC/NASsBpVb3nHFoytNbJzyPIowK0s1cgwXvogH774qHZH
         q/UzvrECLrm1HHUuSCtTWPXVOQK5JuJDSsyHhz9d4hEsJjp1jJ1/dcR4qQMTpwrsUMTq
         z1rA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v9-v6si4255530qvi.24.2018.10.01.09.46.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 01 Oct 2018 09:46:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39667 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g71LQ-0003iu-Ia
	for alex.bennee@linaro.org; Mon, 01 Oct 2018 12:46:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g71K9-0003Pj-UN
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 12:45:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g71K4-00050I-Td
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 12:45:33 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37550)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g71K4-000508-MJ
	for qemu-devel@nongnu.org; Mon, 01 Oct 2018 12:45:28 -0400
Received: by mail-wm1-f68.google.com with SMTP id 185-v6so3996594wmt.2
	for <qemu-devel@nongnu.org>; Mon, 01 Oct 2018 09:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ZBVoqT88MG5rZXTo3Ez0DSg01lMPGIbyPAC24fq/+m8=;
	b=Ki3IV4+THemESTHImIdSO3Tz2gQDk3NorHfxiy6MXBpBALHets22sCvmsQ8/Nct0Cb
	Ju7WxbZPfAbr1UdguJ5Vu7TQV5uPW07WEvHQ99z9euyxnWkrry6cF3V11fCaE7VRX3d7
	B0AV+2YegymIpmxKLDjJyA8YpGn8OM07+C8m6v7xj1Vp9x0fgiS8AkeiWSsAYyummXcH
	zAzyuUozpYeprj7OQd9tjSju9+DAD7r8N3gkPb2tesiqYEeT7eenVTdx3pI97C4q64RA
	vS3TIu0nh3VLErvw90SdDTh065IKjiWIMPdFwP6j9f83VRvOTi48ukiiU2oNjMp3XMFq
	WTYg==
X-Gm-Message-State: ABuFfoiQ7sqkMp4SDDrToY4f23mvHmLX8HBWlMBh7JwsKx6ntwzKDt6U
	cjUHc3AWXn980PgxsrR6D4VoOA==
X-Received: by 2002:a7b:c096:: with SMTP id
	r22-v6mr9816923wmh.40.1538412327608; 
	Mon, 01 Oct 2018 09:45:27 -0700 (PDT)
Received: from [192.168.2.71] ([80.31.72.241])
	by smtp.gmail.com with ESMTPSA id
	f69-v6sm8573794wmf.34.2018.10.01.09.45.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Oct 2018 09:45:26 -0700 (PDT)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-12-luc.michel@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <285be5d2-8bb1-8fc4-9a8e-03078f59dd73@redhat.com>
Date: Mon, 1 Oct 2018 18:45:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181001115704.701-12-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PATCH v2 11/15] gdbstub: add support for vAttach
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alistair@alistair23.me,
	mark.burton@greensocs.com,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	saipava@xilinx.com, edgari@xilinx.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nDUS4TMBIKLb

Hi Luc,

On 01/10/2018 13:57, Luc Michel wrote:
> Add support for the vAttach packets. In multiprocess mode, GDB sends
> them to attach to additional processes.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---
>  gdbstub.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index d372972dd3..b6de821025 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1326,10 +1326,42 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>                      break;
>                  }
>                  goto unknown_command;
>              }
>              break;
> +        } else if (strncmp(p, "Attach", 6) == 0) {

Shouldn't this be strncmp("Attach;", 7)?

> +            unsigned long pid;
> +
> +            p += 7;
> +
> +            qemu_strtoul(p, &p, 16, &pid);

You should check for EINVAL/ERANGE here.

Rest of the patch is OK.

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
