Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp4207072wrd;
        Tue, 4 Sep 2018 17:02:30 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZHRMzbvoXElbokBupPBnSpOZ6Dz4jeWWpF+A5A2YYau/bPxZ+apkhmC/fs0bwZOVWcr/UV
X-Received: by 2002:a37:1be4:: with SMTP id m97-v6mr30745571qkh.12.1536105749892;
        Tue, 04 Sep 2018 17:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1536105749; cv=none;
        d=google.com; s=arc-20160816;
        b=NG0VrGkwXkQHKkDEM32lzKGhbwXeV9dhBQRiIqlH8kinX7WB+AjoO1+k1fisZ6yPp5
         XcCgXEvjZCO0g9+yQndjLYfCyrq5AGhPtacRLQQazULahEb2cR5hzyVJ43PivxbtFXoU
         6xcTkmt92M2wsoJK/+eXnnupe0uLGS6Ya7HMmQIb3vS7uUD7E4uMu/wMvLqfkCzVRFnZ
         6fiDQa5gXuZ0Umr9GjJ+uov2Rc2bMGTOs2YtdgLsI2gRvl+6YoBQCoFr74mwxFeTLMR0
         A6dgAT4jZBT9yACsIN6rNN6XZEmR5W/oShkyGzhpMDs1zsRBkeWYe0qxMS6nD+8XU9u/
         +EJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=4uxcn8TUTmFEtvu9IrQ4YpgUfEsl2L+kZxOPLZpuZL4=;
        b=pP+8CgUuTMmreDH+GyrmqrkGwnKVU2Sms6Je8Uc2p2Bl7/pMj5fsal7SSIisW8VHia
         uZxGBSlfr5Z6zBFZpzSvwMg15VD9Ubi/1aTS9dPtY87QQK2snUDJxfRAuvSwj5oAW3Oq
         a/x0PNNN639plj1OftUMRVl9BDswIc9yUu+ZywQrAI1xW12cdlewzC9TQSwzi0l6mS5h
         MynFuf2h//Poa+VjgICnHYedG1XeINjd2CBq1GdoLbEpHSZN0xk92r4VtJQDRt4xbSso
         LK+zPchowj778EDSgY8Trx9zNKVoFOknl46XmvHV45jnKqrp7D+ln8tbyIR32kOLasGo
         YjiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XAUecHr9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 84-v6si196699qks.296.2018.09.04.17.02.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Sep 2018 17:02:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XAUecHr9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:53085 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fxLHB-0006WS-Dv
	for alex.bennee@linaro.org; Tue, 04 Sep 2018 20:02:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fxLH3-0006ND-2h
	for qemu-arm@nongnu.org; Tue, 04 Sep 2018 20:02:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1fxLH2-0000iM-22
	for qemu-arm@nongnu.org; Tue, 04 Sep 2018 20:02:20 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:46147)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1fxLGz-0000eZ-JL; Tue, 04 Sep 2018 20:02:17 -0400
Received: by mail-lj1-x243.google.com with SMTP id 203-v6so4620679ljj.13;
	Tue, 04 Sep 2018 17:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4uxcn8TUTmFEtvu9IrQ4YpgUfEsl2L+kZxOPLZpuZL4=;
	b=XAUecHr9UJtwF9ed5e8WHKYCKcA8wVhqjF/hAB3F7vRSnMUQLowgZCTX2at8ZWQ9FQ
	omA683o4fo5c1uFVFNS4NxvSo4sc4wnLOCSZ3k01rO9X91j7gyri/6dxY+OUR0mFOcCn
	jNt5p0AOOQks53uk6LjAmjk90QHqAJGSrerNVaNCAGpXqvxoEXUyNmZpzYfGeN0sZRw5
	mPN1w9lYBcUPGhtD7Tf93bK0BRBipT4ZfsYp8B35wV6W/Pfg7hya0/4YQLrPtJozg5N3
	siAVHyAFFM5w6HoFKPFncwQEfjoNwpJlpR3GOhb3ylvSEuYC1/jLDE53xxmNvV+0YRcD
	vakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4uxcn8TUTmFEtvu9IrQ4YpgUfEsl2L+kZxOPLZpuZL4=;
	b=HnGC3nVXB1ziqCt6gvqK9jtruk4G2mD8LAPosEm4rBqjDYb+yu8IMfhoMoOt/fEZSA
	VbVjSoL6g7+ugTL2/OEr3bG6c8ZccVzHqNzBRqHeLz/Tg5BqiypoKK/hp+rLO5eRCKdc
	eAlhMsvsMMfjH32ihI7z852316gc6Y7UdzRgWvw2l+sCPYL/5DOgsE0RT06jId9U1bJf
	eFysdi4aG9tq77mJ4HxJdgqShkip4autTWO8T+0UqsXHAS2SjjDCiBXK0UFdXoLEsTgx
	aPkwkp3WwTLymHwg6zUogi68AxGRwuhMf6mU4A+P6WQlicyJcn/oPK0IGXs0DbylLmrY
	VVwA==
X-Gm-Message-State: APzg51A/hV6lwGuZt9A68cFva9SsUccB42blicFkRR5njyeOciX/3PB7
	1EheDaw6ljz0+DpLzSPF0CQgz9VPzNxORTPCrBc=
X-Received: by 2002:a2e:89c5:: with SMTP id
	c5-v6mr16544210ljk.19.1536105736076; 
	Tue, 04 Sep 2018 17:02:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:5649:0:0:0:0:0 with HTTP;
	Tue, 4 Sep 2018 17:01:45 -0700 (PDT)
In-Reply-To: <20180901124639.19735-3-luc.michel@greensocs.com>
References: <20180901124639.19735-1-luc.michel@greensocs.com>
	<20180901124639.19735-3-luc.michel@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 4 Sep 2018 17:01:45 -0700
Message-ID: <CAKmqyKPdwm4TPXCaigh6wH+EH0beaQfMFA9Qi_fdECK0w1ss3w@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 02/15] gdbstub: add multiprocess
 support to '?' packets
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
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ktcNaxIzcaU5

On Sat, Sep 1, 2018 at 5:46 AM, Luc Michel <luc.michel@greensocs.com> wrote:
> The gdb_get_cpu_pid() function does the PID lookup for the given CPU. It
> checks if the CPU is in a QOM container named after the
> GDB_CPU_GROUP_NAME macro. If found, it returns the correponding PID,
> which is the group ID plus one (group IDs start at 0, GDB PIDs at 1).
> When the CPU is not a child of such a container, PID 1 is returned.
>
> The get_thread_id() function generates the string to be used to identify
> a given thread, in a response packet for the peer. This function
> supports generating thread IDs when multiprocess mode is enabled (in the
> form `p<pid>.<tid>').
>
> Use it in the reply to a '?' request.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  gdbstub.c | 46 ++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 44 insertions(+), 2 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index 5c86218f49..ec3105dbc1 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -640,10 +640,37 @@ static int memtox(char *buf, const char *mem, int len)
>          }
>      }
>      return p - buf;
>  }
>
> +static uint32_t gdb_get_cpu_pid(const GDBState *s, CPUState *cpu)
> +{
> +    gchar *path;
> +    gchar *cont;
> +    const char *left;
> +    unsigned long pid;
> +
> +    if (!s->multiprocess || (s->process_num == 1)) {
> +        return 1;
> +    }
> +
> +    path = object_get_canonical_path(OBJECT(cpu));
> +    cont = g_strrstr(path, "/" GDB_CPU_GROUP_NAME "[");
> +
> +    if (cont == NULL) {
> +        return 1;
> +    }
> +
> +    cont += strlen("/" GDB_CPU_GROUP_NAME "[");
> +
> +    if (qemu_strtoul(cont, &left, 10, &pid)) {
> +        return 1;
> +    }
> +
> +    return pid + 1;
> +}
> +
>  static const char *get_feature_xml(const char *p, const char **newp,
>                                     CPUClass *cc)
>  {
>      size_t len;
>      int i;
> @@ -909,10 +936,24 @@ static CPUState *find_cpu(uint32_t thread_id)
>      }
>
>      return NULL;
>  }
>
> +static char *get_thread_id(const GDBState *s, CPUState *cpu,
> +                           char *buf, size_t buf_size)
> +{
> +    if (s->multiprocess) {
> +        snprintf(buf, buf_size, "p%02x.%02x",
> +                 gdb_get_cpu_pid(s, cpu), cpu_gdb_index(cpu));
> +    } else {
> +        snprintf(buf, buf_size, "%02x", cpu_gdb_index(cpu));
> +
> +    }
> +
> +    return buf;
> +}
> +
>  static int is_query_packet(const char *p, const char *query, char separator)
>  {
>      unsigned int query_len = strlen(query);
>
>      return strncmp(p, query, query_len) == 0 &&
> @@ -1020,22 +1061,23 @@ static int gdb_handle_packet(GDBState *s, const char *line_buf)
>      const char *p;
>      uint32_t thread;
>      int ch, reg_size, type, res;
>      uint8_t mem_buf[MAX_PACKET_LENGTH];
>      char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
> +    char thread_id[16];
>      uint8_t *registers;
>      target_ulong addr, len;
>
>      trace_gdbstub_io_command(line_buf);
>
>      p = line_buf;
>      ch = *p++;
>      switch(ch) {
>      case '?':
>          /* TODO: Make this return the correct value for user-mode.  */
> -        snprintf(buf, sizeof(buf), "T%02xthread:%02x;", GDB_SIGNAL_TRAP,
> -                 cpu_gdb_index(s->c_cpu));
> +        snprintf(buf, sizeof(buf), "T%02xthread:%s;", GDB_SIGNAL_TRAP,
> +                 get_thread_id(s, s->c_cpu, thread_id, sizeof(thread_id)));
>          put_packet(s, buf);
>          /* Remove all the breakpoints when this query is issued,
>           * because gdb is doing and initial connect and the state
>           * should be cleaned up.
>           */
> --
> 2.18.0
>
>
