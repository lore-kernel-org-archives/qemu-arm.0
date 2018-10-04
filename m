Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp1169794wrt;
        Thu, 4 Oct 2018 10:34:25 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63Fo84C5pX9nrGe2V2a0gWnkPTqdtidB7BhcfSLCQzC9AxCh+5l6uCDj001aChv6yfAxxKv
X-Received: by 2002:a37:28c7:: with SMTP id o68-v6mr6070261qko.350.1538674465203;
        Thu, 04 Oct 2018 10:34:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538674465; cv=none;
        d=google.com; s=arc-20160816;
        b=DahYoKdCJQ53/bSO1Gi5KUXL5lQ02zh3dJMGCTn7ZFCPmpA3Sl8I8atuUnwGj3jQ1J
         C6ChncHTmJL84WoWUuFxgdjt7gFC2DvOvbepFiI70E8TIxX+LUGHboGUvh+Hmfxbz19b
         PGucbe44GGBHR9UdOVIt2xjTG89GjjU18PBJoBOnLzp4bjO/rc9mOoApvLwbjXqrRUT+
         X8eO4iFJ5Ab3UJnyty41om9VmihM+1kP3BgdcI+08ugRpctmhrouTFHuWXN8WZrRK3Hh
         R2BwjgjhF7CGaQgW+cXUAb7dA4tFN5x5KkymDfCNeno5/icIseMM4Tg0rzZs2NzbJJ6U
         hgnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=ozCz8kVxfjs5wlusyVqB0oxEGEm3NZjFeNktUbH2YYw=;
        b=tdci2sB2vHDsQoPTpW5CQO39dbBWzj8C4WcrcNy5jiQQEthooI2R4I4dtaK/AqtYwW
         kTDRbT2zzCoDnV9cn3bhqdZyawfFzVkRVVfGxuNH+qenVGruo2UpnQj8TJGCZyagdEof
         3gfVup5/Px+dOtoNjrt/wo3Vq4Np+WOYvlr90KrfccR9V8gp0HGdueUjPoY6VMpqgc/k
         GWovb1ec3+VbTQMuLNhqwjteZ6X/Jta4fsE1coy0HcHhoZdYmXOGLJvbeB/DToQIe9hU
         PUmlvNChWC9jrB5KI2Lh+HUZjka9WGN8b1D4slWEo1OPwQQG23cXOSulYseuqMHR30VH
         2DGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eGQnZqMj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 55-v6si3618060qtt.40.2018.10.04.10.34.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Oct 2018 10:34:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=eGQnZqMj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:57983 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g87W4-0001ga-Nw
	for alex.bennee@linaro.org; Thu, 04 Oct 2018 13:34:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g87Vs-0001cK-Oa
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 13:34:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1g87Vr-0001oo-0S
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 13:34:11 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:41932)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1g87Vo-0001lc-SH; Thu, 04 Oct 2018 13:34:09 -0400
Received: by mail-lf1-x142.google.com with SMTP id q39-v6so7395302lfi.8;
	Thu, 04 Oct 2018 10:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ozCz8kVxfjs5wlusyVqB0oxEGEm3NZjFeNktUbH2YYw=;
	b=eGQnZqMjTIfw89qvpb5sZkTmzOETOwaGvtjbuA5y1vDx3FZ2pPw5Dy/dEtWgzXdgNV
	3GSmGdU2lF+fPnVWKQc9rZLnj40HmR2U9W+2bpbKa4XkWlrHu992z4WjqhmPtM2vY1J7
	eYGglY4A3OCHlbDi5a3cD+to+o4B0hijik+l4vBmnNaE17b/9glNTKHDlf4KLoGvIA5Y
	4/j5Mw7/zV2Kht6xT1CEsEwf4rd9E/9SJDphOvLcQJt1wJ58IGepLj6yGpUa/ZJ6dQdD
	gI9h1wPrXFQqXxxQoFOd0LDBGN03aTtuUcowEGmJXT/mx4liLuNg2f5+TSSoDBpck2uo
	WHRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ozCz8kVxfjs5wlusyVqB0oxEGEm3NZjFeNktUbH2YYw=;
	b=tkb5eTQxALaZExlJRCwE8g6llF/4n6zIHffanEApZMEsx+Sfh8OBb5rwrLnhQzAY/z
	EKIjXlO4Wn0WzGu4+imQGyTQYJzkRh1ac5Hf08CHT+STLuY+nfzDxjiQy6HQtQnTUKeh
	NCMQbcBt5kHwh4w/4jpRlopV6YlbHOVY6XcbHFe8oF+0BOc6/Z0nlQJKgdTb6IqmM/AE
	4ExBSO93JLCPSGvs1uKRj3Am7as0oq7kwzAg5PGpTtDiq505vpDaesIOIXfBPt2N3684
	JaNDddSCjs1Kr7d6My6/BJk5gqu2Jf2fYPt2SOX0iWILX+U9WP6H4Y/AuTDd4W/hNmEe
	b9xw==
X-Gm-Message-State: ABuFfoiYj8KYB2/TegutQCLkIGddZrh38yTfYZmNJ3FP7IJDVmcbWHuq
	vcEdiYYg63Sgex5XIx3wC8kzJPS/r27Tx8RS1ek=
X-Received: by 2002:a19:9b12:: with SMTP id
	d18-v6mr4651142lfe.132.1538674447272; 
	Thu, 04 Oct 2018 10:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20181001115704.701-1-luc.michel@greensocs.com>
	<20181001115704.701-6-luc.michel@greensocs.com>
In-Reply-To: <20181001115704.701-6-luc.michel@greensocs.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 4 Oct 2018 10:33:40 -0700
Message-ID: <CAKmqyKPbBMWvpGm1L6nCPDpHqB2hW_iHfuXO7HjVRdWPD5tuGg@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 05/15] gdbstub: add
 multiprocess support to 'sC' packets
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
X-TUID: u/ikbtreK9kM

On Mon, Oct 1, 2018 at 4:57 AM Luc Michel <luc.michel@greensocs.com> wrote:
>
> Change the sC packet handling to support the multiprocess extension.
> Instead of returning the first thread, we return the first thread of the
> current process.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  gdbstub.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/gdbstub.c b/gdbstub.c
> index 779cc8b241..3242f0d261 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -1530,13 +1530,18 @@ static int gdb_handle_packet(GDBState *s, const c=
har *line_buf)
>              type =3D strtoul(p, (char **)&p, 16);
>              sstep_flags =3D type;
>              put_packet(s, "OK");
>              break;
>          } else if (strcmp(p,"C") =3D=3D 0) {
> -            /* "Current thread" remains vague in the spec, so always ret=
urn
> -             *  the first CPU (gdb returns the first thread). */
> -            put_packet(s, "QC1");
> +            /* "Current thread" remains vague in the spec, so always ret=
urn the
> +             * first thread of the current process (gdb returns the firs=
t
> +             * thread).
> +             */
> +            cpu =3D get_first_cpu_in_process(s, gdb_get_cpu_process(s, s=
->g_cpu));
> +            snprintf(buf, sizeof(buf), "QC%s",
> +                     gdb_fmt_thread_id(s, cpu, thread_id, sizeof(thread_=
id)));
> +            put_packet(s, buf);
>              break;
>          } else if (strcmp(p,"fThreadInfo") =3D=3D 0) {
>              s->query_cpu =3D first_cpu;
>              goto report_cpuinfo;
>          } else if (strcmp(p,"sThreadInfo") =3D=3D 0) {
> --
> 2.19.0
>
>
