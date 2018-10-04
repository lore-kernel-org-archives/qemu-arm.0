Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1178136wrt;
        Thu, 4 Oct 2018 10:42:45 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62XDFv6/h8nhU3mbgYJ/pAys/DnyodLd8zlFrcwFnaviD0O2vLEIPA08wBD8cmzoY6hOKXf
X-Received: by 2002:a37:2b12:: with SMTP id r18-v6mr5820465qkh.343.1538674965045;
        Thu, 04 Oct 2018 10:42:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538674965; cv=none;
        d=google.com; s=arc-20160816;
        b=m1wJeALV1/mQlS3CyMpvTz+h8g0Dme6jI5iOmq0x/sE1Za8bNaoS+hmg22O2ntI21S
         WKW7BZ07KZLLYY7OekKPBrPM4tuAZuf7vpYif9hNKIyY35fxknAz5H7GYa3es/RNjIsN
         ZfzQaWPPUigHpoe82YJ5vqWVUoyoim1pO0GNTtmi0qfAElZqBiRmzvbJ80krNl55QrEB
         ulNp9tgDDx+fxsKcEJ7cTzs7y9/lc464rIEvcalhcJuPtxVWGJVZPqSHeLsjhTfhjea0
         vJhChiZezhKD4cZgazFPY+H3fzChW9JGjbCQyjt6a5T1OwZtquDuIq4AsP98IIMOPXnN
         Plhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U/rYHtuotHGLFpDaydXlNe5S3hPZSHiJr2YaLkqa9jo=;
        b=b96fupxyMVE2E9RByyfDzyewWQxC1XuNXIrpMEk1mLrVKlenSWyR2VUeZIaxGexU5C
         b7yQMNyO/UWC7Dj2Ml1XyTW785ehrFNSJVL8pP5CrrazkXiPEpVmT+2j6MAMbL3DZ8v7
         4ZOco52jQAZXoCXjMTrwgzgd6DBQN9sWvGzueoyoDYQwq5l55PncbCpuPkKNYPuNXQsb
         /DQmK5TZGtOl8fG6EVmoDeQB/0jqrvXyW8mNr/fUmDZ+QK5Q3xGfP1iIuVl9RD8x0vZ3
         mlyIXGKpGaiezsmyvAoSpMZoezZQvHMrvorEYNYhkx08puhvTTmtmGfD2WVgAfMlU9oJ
         nLog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tHqI30L3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n40-v6si3542795qvg.141.2018.10.04.10.42.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Oct 2018 10:42:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=tHqI30L3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58021 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g87e8-0002QT-I8
	for alex.bennee@linaro.org; Thu, 04 Oct 2018 13:42:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g87dx-0002P4-VK
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 13:42:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g87dx-0001WG-4Y
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 13:42:33 -0400
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d]:42900)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1g87dv-0001VD-6N; Thu, 04 Oct 2018 13:42:31 -0400
Received: by mail-lf1-x12d.google.com with SMTP id s10-v6so7420551lfc.9;
	Thu, 04 Oct 2018 10:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=U/rYHtuotHGLFpDaydXlNe5S3hPZSHiJr2YaLkqa9jo=;
	b=tHqI30L3Ff7ItIrU/yJMhrIPdB+//05njt8bfbX07W1NVu+3w2vJfy7LCLHZmEEGLw
	dooGlbbRjZgAswnGNgtifr2h3cqRa4fjihY8rUZbLoo4Ft+wylISOcTi5B2U1Q3SmKgq
	pygTM25Us5TvDlGC9hrN0G4T51sXX681JM87j+yXq8CNmj1T56IUc+NGfCGtwYhqwM0I
	gDnBonDk1P7nGjHwWcC7+lMg91zCnnsBEzfY8bVSj4JjX9yKxl6HcTrFMr965XV4aeYO
	1ok48lZmGUoSW6sJPAEv03nHKyffNF/xHDC4s2Jsbk8kwNbhGaMdzsCIImSbz3CcDZT/
	GnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=U/rYHtuotHGLFpDaydXlNe5S3hPZSHiJr2YaLkqa9jo=;
	b=LiQQTK0//DClVlqHWFynbfQvAKK7/W05G79fNY/sDk1sXW1QaCsmLPJhZi8ntpSBPX
	ebpRstrA1y9cMN75S+XsSrC8lgZAs6QMTSb5zbwHotNpHv22QhKMX7pzX2gPURbEhHi8
	QjrLXjV5PWYieMbEz05slJP3CwKSc4EYUlwP700aySR0buTCPGwhHqOCoAjYlrGxXvpo
	Wc3e7JRl6GGxbYnof/jl5soLMGmBIY/MtkYBMSuXk8w7TdAQRbj1FHJ0CcLlf7f4ZEau
	xEiG3cP4CDzMEyuVYkTXMn7iHK6zMAqR6nB0A9o5ILtF4wfsBo2GSkEY372lG1Lyio9R
	TO9A==
X-Gm-Message-State: ABuFfogjOTR3U674BZQQY7YjSc5Jrx8/ndq7pVc6aDzf7fu3PRsWi3hk
	soZQB91aa/mRPRMn/5Ab2o08npmLx/H3HoqeDLw=
X-Received: by 2002:a19:98c1:: with SMTP id
	a184-v6mr4374968lfe.94.1538674949589; 
	Thu, 04 Oct 2018 10:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-13-luc.michel@greensocs.com>
In-Reply-To: <20181001115704.701-13-luc.michel@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Oct 2018 10:42:02 -0700
Message-ID: <CAKmqyKPt2EL+BZNey3YOm5TsCK0B01v4wWZtcaR93p3yVJfkig@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::12d
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 12/15] gdbstub: processes
 initialization on new peer connection
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
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YqcCfH1WhOlI

On Mon, Oct 1, 2018 at 5:07 AM Luc Michel <luc.michel@greensocs.com> wrote:
>
> When a new connection is established, we set the first process to be
> attached, and the others detached. The first CPU of the first process
> is selected as the current CPU.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  gdbstub.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index b6de821025..c27a3edf1d 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -2221,13 +2221,14 @@ static bool gdb_accept(void)
>          close(fd);
>          return false;
>      }
>
>      s = g_malloc0(sizeof(GDBState));
> -    s->c_cpu = first_cpu;
> -    s->g_cpu = first_cpu;
>      create_unique_process(s);
> +    s->processes[0].attached = true;
> +    s->c_cpu = gdb_first_cpu(s);
> +    s->g_cpu = s->c_cpu;
>      s->fd = fd;
>      gdb_has_xml = false;
>
>      gdbserver_state = s;
>      return true;
> @@ -2309,12 +2310,23 @@ static void gdb_chr_receive(void *opaque, const uint8_t *buf, int size)
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
> +        s->c_cpu = gdb_first_cpu(s);
> +        s->g_cpu = s->c_cpu;
> +
>          vm_stop(RUN_STATE_PAUSED);
>          gdb_has_xml = false;
>          break;
>      default:
>          break;
> @@ -2474,19 +2486,17 @@ int gdbserver_start(const char *device)
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
> --
> 2.19.0
>
>
