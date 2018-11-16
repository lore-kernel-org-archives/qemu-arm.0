Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp901481wrw;
        Fri, 16 Nov 2018 13:56:58 -0800 (PST)
X-Google-Smtp-Source: AJdET5fYTyYUTiMsML8PpEysSaqKdFBiWn2qEtykZWkes/GaardlD9nqwB5ebbQ6I7a+ZP5uMYZd
X-Received: by 2002:ac8:27c8:: with SMTP id x8mr11626005qtx.352.1542405418324;
        Fri, 16 Nov 2018 13:56:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542405418; cv=none;
        d=google.com; s=arc-20160816;
        b=KfuK39mFHFUPzG2lDw2AJjHZMh7C1qKZy+TREpcpfFxAwUvUtplFdQjA89BrrX3N7H
         kpeIGqm88qgZrJVEC5xkijIFGrNyngVxTbCleIlyYD0+J4h6AW+YvLwmZkOLsbeTs4am
         lCTbC2us+pMX2spMx315+7r94IpKQ4BwcUxTrc+qE2bIG65A4SbFeQFBfN7KNMOa3V9U
         hTPJA996E1H4/KvrbS2pxo+/VuxKbqaXlfTW7BKHmGlJ8SIrkvqMgW3O2A5eI+DqDuIM
         +7IOBxjCd/g9/t4wLVqsGln2saE9wxaFxbdXAz16xc6PRhTpO20MsHYOyQD1WEc9Wznc
         u2ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=ovf08nLIC36l54YDb3CL/rvhurkEIPzxk6Nfnk8zdJk=;
        b=ng1zeUa4Yrf7mwNckOmcanYCz+K1hQFfmevyVzK0NGUtnrCiN50OsoFDP+NfFBsAef
         AO1YfV3oXcN5WOWsbWGYbjG9XfmvGMjekZh3ZECmRlePciwa+G4IH/s35OBhd6URzRl6
         UrZn2j6IQYjnP2qbaZecaWG9P0MmcI2Ta11xjLTKgKxEfSjoXRD+DWaM0qMjV2sTM0hz
         VNHfr+/RF+pQYtJX+I35mzXJO+uMX8M/l+pjNm0dy9Uh6O892b9HEV87ZfACmV6/18a/
         GOYu5xG/mHTsHwrn6Sy+teoMV53p233xwQosZGYUQFrcFiGcePgGImC0hVifBok5m8i5
         hsyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EYKpIHPM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m28si2745616qtf.328.2018.11.16.13.56.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 13:56:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EYKpIHPM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47153 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNm6j-0003h3-MJ
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 16:56:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37547)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gNm6X-0003fp-B3
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 16:56:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1gNm6U-00055A-40
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 16:56:45 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:40112)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1gNm6T-00053j-V1; Fri, 16 Nov 2018 16:56:42 -0500
Received: by mail-pf1-x444.google.com with SMTP id x2-v6so11996217pfm.7;
	Fri, 16 Nov 2018 13:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ovf08nLIC36l54YDb3CL/rvhurkEIPzxk6Nfnk8zdJk=;
	b=EYKpIHPM8aMnvU2HSgqCQpHZYYwmq830JvK6wJJhw1WcIRosM1QjRFxu6Mmc3GYDVJ
	e+vKEbbjFXklS5x8Ss7A8NlK42rCSNXM4Tj7Qd5LH6V5ibbRuyN5TKFq5KMDhITGAPKC
	lPyj1Ph7PpN+XJZTfkrLm5SdQegwUNbERAse2jwZEhw6dCBWfPxXAzHGc+z7XPT9VgDI
	njJEfwgiCBJsg+b2/drkkmjEVU6MnJHHNItc/63aQ8kKqk6m6DkorKjvC4XvRk3VB9h5
	hZvhJV+lSs3dASO1vPLPBgua01fOdhYXeZnNq40vNzMagIQidPEKL+dc5YfdvGWtc+sp
	tfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ovf08nLIC36l54YDb3CL/rvhurkEIPzxk6Nfnk8zdJk=;
	b=e6y2524fnS1BXdDpbGmd3IZ2XwiqTnKw+dzz/kxFOpqSAQNLpQK/qFbTjHVM02OBap
	5PP6WKs2gV4xW6VLbY3kMLHbiAAa+IzSjFwXEnTjVxbPwcY6tr7lhBKD5fca60pNvOLj
	au2+0n9kQriL/DJ0BVw4qZlcCf//zmICxxtyk2TF0b7XMKergcKif6j+lbNadA9jvp6V
	tT8fkcSiPKxTuFwXetqPb0i4ksMMYND+TsQ3bSkTiLrbC8ci3nhxs3JbrR/Or+MFtTj1
	yi711JKwKqqeUm+jTcQPgLxUwGwOWFOd6p+tZB84gk4FlOiO8Lnv2RNVpHOTE2P3MAh5
	zJAw==
X-Gm-Message-State: AGRZ1gLwJhhsL6gz55YxLymlQX5DUYidSXUi5MQl8PhkMk8+jSnQVuQP
	eePfJBRqiPPTY50GC9MRsAUx2Uga
X-Received: by 2002:a63:7219:: with SMTP id n25mr11643941pgc.324.1542405400158;
	Fri, 16 Nov 2018 13:56:40 -0800 (PST)
Received: from [10.86.55.164] (rap-us.hgst.com. [199.255.44.250])
	by smtp.gmail.com with ESMTPSA id
	v12-v6sm42074898pfa.167.2018.11.16.13.56.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Nov 2018 13:56:39 -0800 (PST)
To: Luc Michel <luc.michel@greensocs.com>, qemu-devel@nongnu.org
References: <20181115094207.22846-1-luc.michel@greensocs.com>
	<20181115094207.22846-10-luc.michel@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Message-ID: <9d480a87-efd8-a984-218f-cb8ee48fcc43@gmail.com>
Date: Fri, 16 Nov 2018 13:56:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20181115094207.22846-10-luc.michel@greensocs.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 09/16] gdbstub: add
 multiprocess support to gdb_vm_state_change()
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
X-TUID: HKrYptm9amR0

On 15/11/2018 1:42 am, Luc Michel wrote:
> Add support for multiprocess extension in gdb_vm_state_change()
> function.
> 
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Acked-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>   gdbstub.c | 15 ++++++++++++---
>   1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/gdbstub.c b/gdbstub.c
> index 4cbc81ae5b..5df9929f92 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1713,10 +1713,11 @@ void gdb_set_stop_cpu(CPUState *cpu)
>   static void gdb_vm_state_change(void *opaque, int running, RunState state)
>   {
>       GDBState *s = gdbserver_state;
>       CPUState *cpu = s->c_cpu;
>       char buf[256];
> +    char thread_id[16];
>       const char *type;
>       int ret;
>   
>       if (running || s->state == RS_INACTIVE) {
>           return;
> @@ -1724,10 +1725,18 @@ static void gdb_vm_state_change(void *opaque, int running, RunState state)
>       /* Is there a GDB syscall waiting to be sent?  */
>       if (s->current_syscall_cb) {
>           put_packet(s, s->syscall_buf);
>           return;
>       }
> +
> +    if (cpu == NULL) {
> +        /* No process attached */
> +        return;
> +    }
> +
> +    gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_id));
> +
>       switch (state) {
>       case RUN_STATE_DEBUG:
>           if (cpu->watchpoint_hit) {
>               switch (cpu->watchpoint_hit->flags & BP_MEM_ACCESS) {
>               case BP_MEM_READ:
> @@ -1741,12 +1750,12 @@ static void gdb_vm_state_change(void *opaque, int running, RunState state)
>                   break;
>               }
>               trace_gdbstub_hit_watchpoint(type, cpu_gdb_index(cpu),
>                       (target_ulong)cpu->watchpoint_hit->vaddr);
>               snprintf(buf, sizeof(buf),
> -                     "T%02xthread:%02x;%swatch:" TARGET_FMT_lx ";",
> -                     GDB_SIGNAL_TRAP, cpu_gdb_index(cpu), type,
> +                     "T%02xthread:%s;%swatch:" TARGET_FMT_lx ";",
> +                     GDB_SIGNAL_TRAP, thread_id, type,
>                        (target_ulong)cpu->watchpoint_hit->vaddr);
>               cpu->watchpoint_hit = NULL;
>               goto send_packet;
>           } else {
>               trace_gdbstub_hit_break();
> @@ -1784,11 +1793,11 @@ static void gdb_vm_state_change(void *opaque, int running, RunState state)
>           trace_gdbstub_hit_unknown(state);
>           ret = GDB_SIGNAL_UNKNOWN;
>           break;
>       }
>       gdb_set_stop_cpu(cpu);
> -    snprintf(buf, sizeof(buf), "T%02xthread:%02x;", ret, cpu_gdb_index(cpu));
> +    snprintf(buf, sizeof(buf), "T%02xthread:%s;", ret, thread_id);
>   
>   send_packet:
>       put_packet(s, buf);
>   
>       /* disable single step if it was enabled */
> 

