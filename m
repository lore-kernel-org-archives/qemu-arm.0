Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2191796wrt;
        Thu, 10 Jan 2019 11:53:34 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5KSKrKleBxsyg1vJM5pEHDSk2QtkMYoUATBIyvihO3DuFoyJIIk4wQsjzsVajFemQS7DQ9
X-Received: by 2002:a1c:c303:: with SMTP id t3mr164014wmf.94.1547150014535;
        Thu, 10 Jan 2019 11:53:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547150014; cv=none;
        d=google.com; s=arc-20160816;
        b=xeGUcRw7xGzlghuyKePSUk8J1rgAEyk3WvkBPhdqzc605bOMg6F8BxYVSJq1x8OJD3
         FFJEggpdMVaXz/kTyqWUbSg2Flr+AMHKfOUSSTcDBVOuKX7O6bgqaWGGhsAaIGOurtLe
         z8/2NCCYBD3aZ0o7vzi9WnHLW3wIajQZ2irFN47RfshLn5DQVR8baAfa9wsbncg8HxO0
         kkab9Z8s9XHuwU0W6SzCQFHl/Tb55mTZLm7XGZIHRhQ2uA5meAIx9l9m1LMwSrrIFzKY
         i9INOniOfOFG8DyTRaplOIaadLZxnOnf8lAKPIefchwHzh4pI6kNAmH1KVpq/h4xz0Vy
         HmFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9mrcc1o5bfALS51aqe5qIitZEunlZZhGzgulM+/y1no=;
        b=ftmWKIhNXHTMyXtqre4ZHmapO7bbFaOlTRzN4WTEBOkZ7xJ3zUbCUCNwEHl9rplx1u
         SIPEA+a1iuRyw6BrEZh5A2fOfTyeTOoiPQvN8Ff2sFnlDcMs8QA6Dy+n7V1MuCiqLzJk
         k71gVN9geJ82lc5IXnWnO828DppVgIS/m+oKUDXD92qlBrZbGP/mVJsjBeLdpsDvLRwB
         LpgwuL5FigB/L1CNps0dyDjcB3Jwql7hDx72VOTxDr+ajvGy+JbM1HI8WeFMY9xhvnNA
         75/K/IicEL7q/ppaYfLfMOjwWPfn+SNQ1QMCm+3LtijcnoPzGEHk/Jqw3xgkbXBZLjRk
         2fiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VcLP8SDl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p8si43284479wro.185.2019.01.10.11.53.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 10 Jan 2019 11:53:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=VcLP8SDl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:40863 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghgOT-0005L5-MY
	for alex.bennee@linaro.org; Thu, 10 Jan 2019 14:53:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36189)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ghgON-0005Kz-5v
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 14:53:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ghgOM-0002Sn-2U
	for qemu-arm@nongnu.org; Thu, 10 Jan 2019 14:53:27 -0500
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:45424)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ghgOL-0002RD-S3; Thu, 10 Jan 2019 14:53:26 -0500
Received: by mail-lj1-x242.google.com with SMTP id s5-v6so10788356ljd.12;
	Thu, 10 Jan 2019 11:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9mrcc1o5bfALS51aqe5qIitZEunlZZhGzgulM+/y1no=;
	b=VcLP8SDlDFUAdnPNOoEgoYRzndlf9lqNajzsdlVV2sq1vo6quJzAgQElnsYDdvYmNl
	HbRXzvFxSDkG1mS8C7tQGppJWXv4vCmClpDzZCjBKBd1e3E56i1bgEJxE2UjS+9Eiu7/
	n1yyTjNkYJP3FqW+c9VYaOS66AjiVFmf+LfPayTgaT1fTMSGpqDiTQt4KbwA+Hb9AOBx
	yJsgQly62sKGbFKyI+tiT/I+5I9oe4hIB9Hhyvh9vVwUJU4vKD+a8a9OBtEyZBUjpCXz
	eK5sBlkae3nVLr6kcK/YEhppr6uXUYuOqigW7jlEiZitFhLDLUcNN267bgmdzl5NSj5I
	gkOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9mrcc1o5bfALS51aqe5qIitZEunlZZhGzgulM+/y1no=;
	b=qyjfJkqx4TNghdAHtRmswACIyP+XOtq4HC5P8QdtCYb0xfJUy+dSo3Si2gAkwhNMqq
	A4MaDD0+8McvR1m5WH0F0I417tkqm4JAVIGyfD0ctH8WwrDHsUCL7qXRGhLRilNyW1x4
	F+8akUR/ehdPJWSomGEBI0K9Eh7yq/r39sCQg7YyubXJ5PbnmkN5Hqsi5TUT+R5vYdj/
	Zg9McHgKPn6bUToI1v20nAxKGBdMM5s4oIH7DC3VxQyRCZP7JkGB74xpUDSYGJtmzIXc
	QYocLS5uAqaoQwKHRNZjdX/XAPB3zc6EVbwphV2OfM3/ZU+6rhGtU5j2VU618KpNWvT1
	P0XA==
X-Gm-Message-State: AJcUukf9lXsl7OdkoZUy2oj+4VzEZgU0NU/P4WQ+9Awoy9/PUp0ytC4l
	f2Z6UTnwg3kt4gSeW1r2g0fb62Ntw9wO2EWp6a0=
X-Received: by 2002:a2e:449b:: with SMTP id
	b27-v6mr6516882ljf.47.1547150003729; 
	Thu, 10 Jan 2019 11:53:23 -0800 (PST)
MIME-Version: 1.0
References: <20190108163008.7006-1-peter.maydell@linaro.org>
	<20190108163008.7006-2-peter.maydell@linaro.org>
In-Reply-To: <20190108163008.7006-2-peter.maydell@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 10 Jan 2019 11:52:56 -0800
Message-ID: <CAKmqyKNDXzs7qG2QvDH2+wwswn7m=SnxdzybHGM5TGO9hUzThg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/4] hw/arm/xlx-zynqmp: Realize
 cluster after putting RPUs in it
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, "Emilio G . Cota" <cota@braap.org>,
	Patch Tracking <patches@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MKycK5iTE8J8

On Tue, Jan 8, 2019 at 8:30 AM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Currently the cluster implementation doesn't have any constraints
> on the ordering of realizing the TYPE_CPU_CLUSTER and populating it
> with child objects. We want to impose a constraint that realize
> must happen only after all the child objects are added, so move
> the realize of rpu_cluster. (The apu_cluster is already
> realized after child population.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/xlnx-zynqmp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index c67ac2e64ac..370b0e44a38 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -183,8 +183,6 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
>                              &error_abort, NULL);
>      qdev_prop_set_uint32(DEVICE(&s->rpu_cluster), "cluster-id", 1);
>
> -    qdev_init_nofail(DEVICE(&s->rpu_cluster));
> -
>      for (i = 0; i < num_rpus; i++) {
>          char *name;
>
> @@ -212,6 +210,8 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
>              return;
>          }
>      }
> +
> +    qdev_init_nofail(DEVICE(&s->rpu_cluster));
>  }
>
>  static void xlnx_zynqmp_init(Object *obj)
> --
> 2.19.2
>
>
