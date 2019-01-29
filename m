Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4049074wrt;
        Mon, 28 Jan 2019 20:56:54 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5p1rLbjZ9or6ftQUb/lBYyPZhvxN6wbBA6yntb76V4+st3PcAicfykw0u46DPgEk1wOPe6
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr20188848wmh.40.1548737814354;
        Mon, 28 Jan 2019 20:56:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548737814; cv=none;
        d=google.com; s=arc-20160816;
        b=fGPOUyl1GwCqRuYEQTM/9wLLNQ5Oj+V0i0PCKMrtT4BiAx4ax3QAJGfLgrynle5qRV
         lb5nR7o84i0SsQEempZmlKBVT5BxgBOn9N8LfbBHsV+ZzvolyYpK25B9RzMiVQlwcl1W
         hm3LdCkHlOQwdYkj0v15XxS3c+HsftPt1BHjuB7aF0qgYnXW65FQBOu/NxOFGi42Z3Op
         vWaG1+VvlpRK17JBkXwYJmlHNtH43g58mAoc0/PBtUN9djxnwi6Dh9CP3rAnowFdGgRY
         Y3YrBggY3w7ql58p3VFAGEbS9c5gLCWDfp2uGQp+AtltB32r0gSKks5Q4Gc9k00JEhO7
         FlhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=rHfRfNjGMmyI8rX0COX28OfXam7jJakmwP+qNDeJowQ=;
        b=WH3num98xlLnOqBnNHubUXI42G51dnVOiSQWbzEI5REBPzIvICdL+C0uEp0BuBBgsq
         KHmDCinFOlIi9l3mr8SbnHmxKsqAEDxMSREvDWgV6fXFgjKYoGJeSudWwLylFeE1tsay
         bnLGNY7JSXjTLeg/fVC4zXA6chWXb0hhhQeXJWXHGCyFQH+Csi1JxVI5/C9ctLVZMGoL
         rCQUJBI3kynwaYAsB4xsjNf7dJTMMY05Ld8wVvaWXSBGzaTy33kgXdSf2XzP9Qytiirz
         XFpHflo/NqREDz5P1CbbGbDnCkPk45WRajGl4WR9hO32akGcHovVTMyQwF6BGnT9E7UY
         4i/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=h2PUgK+9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w18si85586094wrv.315.2019.01.28.20.56.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 28 Jan 2019 20:56:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=h2PUgK+9;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:43258 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1goLS9-0000RU-Dt
	for alex.bennee@linaro.org; Mon, 28 Jan 2019 23:56:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1goLRu-0000RM-Nq
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 23:56:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1goLRn-0000tH-Ck
	for qemu-devel@nongnu.org; Mon, 28 Jan 2019 23:56:35 -0500
Received: from mail-yb1-xb41.google.com ([2607:f8b0:4864:20::b41]:43301)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1goLRh-0000rA-LW; Mon, 28 Jan 2019 23:56:26 -0500
Received: by mail-yb1-xb41.google.com with SMTP id e12so7688531ybn.10;
	Mon, 28 Jan 2019 20:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rHfRfNjGMmyI8rX0COX28OfXam7jJakmwP+qNDeJowQ=;
	b=h2PUgK+9KeSb6DuoTQJHhqyM8EiKic32sji+YJRx8uEwbHfcJv/8+aZrf1pZ+/9mdV
	VBzoGAjaRjM6RzxaaqTH5J/07F2HiBmSQ5bVeoeafuPfHL5+GVChZH3PdUygcekGyBeg
	x9HTMlnmDcc9Pt+2GoidUWkhkCS13WYdmZ3NSEPabaM2eeKOXfT1umyuoKbDXTkD16qM
	6rmkeYsItXDIQH2KTGiPr2+eWeQHAeVq0EiReInNHiR/QaZo8ZrXe+1CbZ47BJphZzJd
	5sILKajqiBq8PRSv/7732BMTWMqgc6dowSJfAszQwZnTDDyHyuOAYHBWyMXhfFxQIehb
	89lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rHfRfNjGMmyI8rX0COX28OfXam7jJakmwP+qNDeJowQ=;
	b=NommIrury0ROT8g06VWOfujIKkf9G/Jec3HZfVm6bhNCsCbhLovrhALPJYh39E+U/H
	+ezdKeKpeB2bet3ZmmZYHeU2wkaaq/2uu10nyPBNBabh+MaOKyCpbby98FHjpBjBGakr
	WZ/QVC9Lfwrx3mWOUcJPi+/h2drOoBfhQtau2OY/SBfVddFcREHD6QcvskwbOo01T5fq
	RQJJ86sOLWHkN6kO0qse6WYx4bQ7qxLEeAgBcsanDU+8Lsurf/paGLQdww6FnuNQZyz6
	ryFwkUzmNzxkGPKRITzOJHrTJMTSqLgt9lQs3+0HpWBQM6W/O00OYAP7z0BDbVbtjfQ5
	JWUg==
X-Gm-Message-State: AJcUukf+1U5qRAuyvthx1ljseN4ITaVX8crZLlqWVzy0vw5SEyp6NmUJ
	GdmmDydCMG65EzeuqMkPJ+RNVBMarbkcUVHqgRE=
X-Received: by 2002:a25:3504:: with SMTP id c4mr23485480yba.252.1548737780494; 
	Mon, 28 Jan 2019 20:56:20 -0800 (PST)
MIME-Version: 1.0
References: <20181207090135.7651-1-luc.michel@greensocs.com>
	<20181207090135.7651-8-luc.michel@greensocs.com>
In-Reply-To: <20181207090135.7651-8-luc.michel@greensocs.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 28 Jan 2019 20:56:09 -0800
Message-ID: <CAMo8Bf+siB=vdjK+WPKvRCqKS59OVGOcAoH0HtN6VSvFyOc9gQ@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::b41
Subject: Re: [Qemu-devel] [PATCH v8 07/16] gdbstub: add multiprocess support
 to (f|s)ThreadInfo and ThreadExtraInfo
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
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel <qemu-devel@nongnu.org>, saipava@xilinx.com,
	Edgar Iglesias <edgari@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7B3I6QEEjLwf

Hello,

On Fri, Dec 7, 2018 at 1:04 AM Luc Michel <luc.michel@greensocs.com> wrote:
>
> Change the thread info related packets handling to support multiprocess
> extension.
>
> Add the CPUs class name in the extra info to help differentiate
> them in multiprocess mode.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  gdbstub.c | 37 +++++++++++++++++++++++++++----------
>  1 file changed, 27 insertions(+), 10 deletions(-)

Starting with this commit it is no longer possible to kill QEMU
with the 'kill' command from the gdb. This was a nice feature,
was this removal intentional, or is it just an implementation
bug?

> diff --git a/gdbstub.c b/gdbstub.c
> index bea0215f30..770915446a 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1267,11 +1267,10 @@ out:
>  static int gdb_handle_packet(GDBState *s, const char *line_buf)
>  {
>      CPUState *cpu;
>      CPUClass *cc;
>      const char *p;
> -    uint32_t thread;
>      uint32_t pid, tid;
>      int ch, reg_size, type, res;
>      uint8_t mem_buf[MAX_PACKET_LENGTH];
>      char buf[sizeof(mem_buf) + 1 /* trailing NUL */];
>      char thread_id[16];
> @@ -1563,30 +1562,48 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
>              snprintf(buf, sizeof(buf), "QC%s",
>                       gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_=
id)));
>              put_packet(s, buf);
>              break;
>          } else if (strcmp(p,"fThreadInfo") =3D=3D 0) {
> -            s->query_cpu =3D first_cpu;
> +            s->query_cpu =3D gdb_first_attached_cpu(s);
>              goto report_cpuinfo;
>          } else if (strcmp(p,"sThreadInfo") =3D=3D 0) {
>          report_cpuinfo:
>              if (s->query_cpu) {
> -                snprintf(buf, sizeof(buf), "m%x", cpu_gdb_index(s->query=
_cpu));
> +                snprintf(buf, sizeof(buf), "m%s",
> +                         gdb_fmt_thread_id(s, s->query_cpu,
> +                                       thread_id, sizeof(thread_id)));
>                  put_packet(s, buf);
> -                s->query_cpu =3D CPU_NEXT(s->query_cpu);
> +                s->query_cpu =3D gdb_next_attached_cpu(s, s->query_cpu);
>              } else
>                  put_packet(s, "l");
>              break;
>          } else if (strncmp(p,"ThreadExtraInfo,", 16) =3D=3D 0) {
> -            thread =3D strtoull(p+16, (char **)&p, 16);
> -            cpu =3D find_cpu(thread);
> +            if (read_thread_id(p + 16, &p, &pid, &tid) =3D=3D GDB_READ_T=
HREAD_ERR) {
> +                put_packet(s, "E22");
> +                break;
> +            }
> +            cpu =3D gdb_get_cpu(s, pid, tid);
>              if (cpu !=3D NULL) {
>                  cpu_synchronize_state(cpu);
> -                /* memtohex() doubles the required space */
> -                len =3D snprintf((char *)mem_buf, sizeof(buf) / 2,
> -                               "CPU#%d [%s]", cpu->cpu_index,
> -                               cpu->halted ? "halted " : "running");
> +
> +                if (s->multiprocess && (s->process_num > 1)) {
> +                    /* Print the CPU model and name in multiprocess mode=
 */
> +                    ObjectClass *oc =3D object_get_class(OBJECT(cpu));
> +                    const char *cpu_model =3D object_class_get_name(oc);
> +                    char *cpu_name =3D
> +                        object_get_canonical_path_component(OBJECT(cpu))=
;
> +                    len =3D snprintf((char *)mem_buf, sizeof(buf) / 2,
> +                                   "%s %s [%s]", cpu_model, cpu_name,
> +                                   cpu->halted ? "halted " : "running");
> +                    g_free(cpu_name);
> +                } else {
> +                    /* memtohex() doubles the required space */
> +                    len =3D snprintf((char *)mem_buf, sizeof(buf) / 2,
> +                                   "CPU#%d [%s]", cpu->cpu_index,
> +                                   cpu->halted ? "halted " : "running");
> +                }
>                  trace_gdbstub_op_extra_info((char *)mem_buf);
>                  memtohex(buf, mem_buf, len);
>                  put_packet(s, buf);
>              }
>              break;
> --
> 2.19.2
>
>


--=20
Thanks.
-- Max
