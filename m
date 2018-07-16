Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1971422wru;
        Mon, 16 Jul 2018 15:07:38 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcwo3EW4dS+DyAXvypu4OgEe6t+M9cUZMSoxT1vnWkOA3CFNqVPyo7Tb9uQETtcRhEqssaF
X-Received: by 2002:a0c:85a3:: with SMTP id o32-v6mr20383246qva.62.1531778858113;
        Mon, 16 Jul 2018 15:07:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531778858; cv=none;
        d=google.com; s=arc-20160816;
        b=IW9fb+0TdzgxgrV0IbP8cMrPp4GjpWvver8Q8n1U4su2YnvZv6LSEknUYuFUjkfNTS
         3+PyO0ZO5o9FovGSfpj09x0FvuzA5gphivvXcxbJmYttDqKHXpMv6Z3GtTM5pONWTEqE
         bmI6FLY9a+MeqZonW3ym9SQibfvLRhP5iSPAstWHO7Wmw5m2BYOYj+rUPfF5+GacvXiF
         kx9rx4WXr9BJ0Nier7s7SOhB2KmByUcZWQmkA86pG9N9cPIDM4nKsNYF+ZcxXoDvY1U7
         LOygqe+QA7QZaxoR00zBkiFymiQ8VmiHL8d/Xc7YpNta+WaoPvgBRBmLBukn1CUDaTZh
         rmlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=lNWN+4n6bUlyK/txmx+VjR/gvDU29PyWZZG3XLRZgEs=;
        b=TtkVYHyIyMqdQPqKBiwdU1FSUFrmIg66VrTb6qUl5R65oI04hWrcUGXDbziW0yEvKP
         ZIW7RQkxUN4T5QafnQbO/UijLnoBs0GmvZThcKXkb8bTnKybo2GUzlnS6Lsm/BmqK0QQ
         NIcYEEjWFaC3HpEhiYDYseCMuWJ2Zm5nRwvVTK1XrBySpVkPPdJj0rDS6ankXOx8BGiI
         7cwhkPe2Et67RJ4GV+3InOWf/1+jAhPJngX5PM6ezwhPvGPOuYuLVxjyLoAjgaSJfyfM
         mNUCliPPILBMzJWNSkPcXihlTwUr2/EDJBvZgdaHYf5tpF7j2GWx4i8GdudS74YoBgRG
         9wpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="b5I/cyxS";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x67-v6si1994637qka.168.2018.07.16.15.07.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 15:07:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b="b5I/cyxS";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:54198 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffBeb-0005pk-JN
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 18:07:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ffBeA-0005oZ-5O
	for qemu-devel@nongnu.org; Mon, 16 Jul 2018 18:07:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ffBe9-0005Nb-3U
	for qemu-devel@nongnu.org; Mon, 16 Jul 2018 18:07:10 -0400
Received: from mail-lf0-x231.google.com ([2a00:1450:4010:c07::231]:43179)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ffBe8-0005Mu-Qy; Mon, 16 Jul 2018 18:07:09 -0400
Received: by mail-lf0-x231.google.com with SMTP id m12-v6so33333193lfc.10;
	Mon, 16 Jul 2018 15:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lNWN+4n6bUlyK/txmx+VjR/gvDU29PyWZZG3XLRZgEs=;
	b=b5I/cyxS56M9bEoIMe811clMSZKzGAAMwUBg4b5cs2i7rI4rpJc4jQyuDMUFDr/Ofu
	zshZ2cK7Yjl5yGjifJpNDxuIsw5QferxesgD/mkO0+RAZeB3UerFDnbXZ+5tm04FRKH4
	PqbOzJSpfJ3GFK8DTloE/07bSvrQkFvleCxOeVVpIOLBfUx4vju1e+KTitbcq7KqDyU6
	R0ppNiOLJFCz7YDTFQOGRkl5+ppamCvBnIEk9Cn59AVJYyb55jVuHeeEBqogv4a8/JNB
	bNS8MUC7f+hfVB0wwXsjJDTj9Srp3pnQOZd4DolgLEKM8YywDhqR7U0dtoeWKvxzR4fY
	K0cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lNWN+4n6bUlyK/txmx+VjR/gvDU29PyWZZG3XLRZgEs=;
	b=eQ3In67MRJVkjuRiglThl4FoV0w4nNpva8KpotQsgmT2UlfBo4XBS8bMRPMIRs9hCU
	EjPCHRyV/ve/gHUcryJUjt4sb3Xn9rZXEeyH+OQBiQYhkXNPu6otZSnPPIqAOQ8P5XOt
	g2OPQ4MUDBLaU1F6/R7su3oNYCT4T2AVTHmLYyoNP6RJmv28Xm9uIuSEbJDt4o0nao+a
	EAJChCg/hlyPFlaDiFNWBr74MSt6P0/G0mO+2hXactHrDXpLAjVFANvwRVBWOgWlbUD0
	ME144CnARb2ZIT8ZdhEGOarcmQpLLmURwBuX1HcK+Ve/zchtUElniSM8D7oK+xfGbgUw
	A3OQ==
X-Gm-Message-State: AOUpUlHb7lSvjyiGt5DZyPUqizc68h/WJHB2XRh8SOqSvxH4hDt7yDGV
	4+TL1uSb9YBLc3JF0gPE8tYesXiFlcuCfOq305A=
X-Received: by 2002:a19:674f:: with SMTP id
	e15-v6mr13210351lfj.147.1531778827646; 
	Mon, 16 Jul 2018 15:07:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:8749:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 15:06:37
	-0700 (PDT)
In-Reply-To: <1531745974-17187-13-git-send-email-thuth@redhat.com>
References: <1531745974-17187-1-git-send-email-thuth@redhat.com>
	<1531745974-17187-13-git-send-email-thuth@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 16 Jul 2018 15:06:37 -0700
Message-ID: <CAKmqyKPWwpgnCUd8z=PHreCrav5wwEkc+iSBjaYEFHk0Jj_mjA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::231
Subject: Re: [Qemu-devel] [PATCH v3 12/17] hw/cpu/arm11mpcore: Fix
 introspection problem with 'arm11mpcore_priv'
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
	Eduardo Habkost <ehabkost@redhat.com>,
	Alistair Francis <alistair@alistair23.me>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9Mk1qW+ta6ZV

On Mon, Jul 16, 2018 at 5:59 AM, Thomas Huth <thuth@redhat.com> wrote:
> Valgrind reports an error here:
>
> echo "{'execute':'qmp_capabilities'} {'execute':'device-list-properties'," \
>  "'arguments':{'typename':'arm11mpcore_priv'}}" \
>  "{'execute': 'human-monitor-command', " \
>  "'arguments': {'command-line': 'info qtree'}}" | \
>  valgrind -q aarch64-softmmu/qemu-system-aarch64 -M none,accel=qtest -qmp stdio
> [...]
> ==3145== Invalid read of size 8
> ==3145==    at 0x61873A: qdev_print (qdev-monitor.c:686)
> ==3145==    by 0x61873A: qbus_print (qdev-monitor.c:719)
> [...]
>
> Use sysbus_init_child_obj() to fix it.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/cpu/arm11mpcore.c | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)
>
> diff --git a/hw/cpu/arm11mpcore.c b/hw/cpu/arm11mpcore.c
> index eb24465..8aead37 100644
> --- a/hw/cpu/arm11mpcore.c
> +++ b/hw/cpu/arm11mpcore.c
> @@ -121,19 +121,17 @@ static void mpcore_priv_initfn(Object *obj)
>                         "mpcore-priv-container", 0x2000);
>      sysbus_init_mmio(sbd, &s->container);
>
> -    object_initialize(&s->scu, sizeof(s->scu), TYPE_ARM11_SCU);
> -    qdev_set_parent_bus(DEVICE(&s->scu), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "scu", &s->scu, sizeof(s->scu), TYPE_ARM11_SCU);
>
> -    object_initialize(&s->gic, sizeof(s->gic), TYPE_ARM_GIC);
> -    qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "gic", &s->gic, sizeof(s->gic), TYPE_ARM_GIC);
>      /* Request the legacy 11MPCore GIC behaviour: */
>      qdev_prop_set_uint32(DEVICE(&s->gic), "revision", 0);
>
> -    object_initialize(&s->mptimer, sizeof(s->mptimer), TYPE_ARM_MPTIMER);
> -    qdev_set_parent_bus(DEVICE(&s->mptimer), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "mptimer", &s->mptimer, sizeof(s->mptimer),
> +                          TYPE_ARM_MPTIMER);
>
> -    object_initialize(&s->wdtimer, sizeof(s->wdtimer), TYPE_ARM_MPTIMER);
> -    qdev_set_parent_bus(DEVICE(&s->wdtimer), sysbus_get_default());
> +    sysbus_init_child_obj(obj, "wdtimer", &s->wdtimer, sizeof(s->wdtimer),
> +                          TYPE_ARM_MPTIMER);
>  }
>
>  static Property mpcore_priv_properties[] = {
> --
> 1.8.3.1
>
>
