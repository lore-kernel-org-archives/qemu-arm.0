Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4396094wrm;
        Mon, 14 Oct 2019 05:52:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJzOpJ+kvv3l9uuxqDoIPb+hQMVyGFXZZlIQPnDayDwaUKz3lY2OWdCXrDyAhZNiAXE+pN
X-Received: by 2002:a0c:95a5:: with SMTP id s34mr13061555qvs.72.1571057522437;
        Mon, 14 Oct 2019 05:52:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571057522; cv=none;
        d=google.com; s=arc-20160816;
        b=aHUqDRY9Wj1HWbfpvZhhsXhZ2Sgso2OIcwVhdJlfbtHJdwq1ycT9YYGGd8RLZCgGvg
         OsiV/Ne8A7i8hcWFgfm8hMR4/CfLrhWw3QsEsX49Ler8/2k7zT0VOPZ/0OYfsfQyqj6U
         g8aCnSglanQ1oeD0N6BlwFn7Eu8v8eNEKGIlVuPshx4Ao2WPvECKGzD7smOMtjw+LXLU
         hVs+l1lCKycN8KAB/GLwRCMzNxzAVp8HDT1lcLQaz7diHafcbfl7svg9xPCQY2X0eIZD
         TC5rWmtO6ceQyYfJI87aNxzFAbx/DZ5l3cZAR01fk3cR+TAmbQu2hTrG60+RQ3tYYB5Y
         9quA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gJCveQWwdmN+Z1ZK4WHcVke3NOyYamcJHyo0B2XOHio=;
        b=EzASrINf7fMJaoO4vDCaHW7cfd+rmWpzh5DeGuSDSrkiBpz76A0Bn+XxIjIkfGmpY3
         6xhhyngci6QIgbJrkKxoW52ys22/C21/SLvAN/17M/72hAjTCHqI8uo+dZv0JMsmrwJu
         kAXKTvJzlT0kszSltdRb3ga5QL1rEt9gVNcm/IbNGiZ9U00mig883LTXFpj/OI84WwLL
         qcEaBhbKsYIhw37wirkY7LAVGJg9tz6F5JAbdfl4ufNFiv2UO2i2EVnwEx6lz4MeJlm0
         qx7D0lwzBV75kJUkfFkrIL8D04GVR6tqrOKmmByWL0NqEQse6+7F6+VebIJXCx3juZ0F
         WIBQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=usPKIRpw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e27si17414998qvd.28.2019.10.14.05.52.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2019 05:52:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=usPKIRpw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iJzpR-00028r-Tf
	for alex.bennee@linaro.org; Mon, 14 Oct 2019 08:52:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32866)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iJzpI-000270-P0
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 08:51:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iJzpH-0000dc-He
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 08:51:52 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39881)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iJzpH-0000d4-Bh
 for qemu-arm@nongnu.org; Mon, 14 Oct 2019 08:51:51 -0400
Received: by mail-ot1-x341.google.com with SMTP id s22so13663302otr.6
 for <qemu-arm@nongnu.org>; Mon, 14 Oct 2019 05:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gJCveQWwdmN+Z1ZK4WHcVke3NOyYamcJHyo0B2XOHio=;
 b=usPKIRpwGoPFE0NEVD4aezC2K3/qJwuUN1/H53Qa8lklS5RenDcaZpqnhWH3gkB/oy
 iY8Kr2TWTo05Dw+Zz+GKsj6i6YJ1g+PD/deZAPLRb67hpTnZqX133wR1k9FcQGRp0bS8
 jDcOuiS/FeMALdz0jR333B8yCO60HgB3PHg/9GcOzph0sEGDhFOzrWdKSMZs3+OpIdtG
 JGcuPvm1Jn6F83kHtlYWcnm0wH9TRbMtJusmhuKNPxhNkfeJppWNWur0q6nlKsCaBAOu
 DtXpXIAfzKpwUVW+Z16MNlTfLm1bYNkVtVU7DU9UtsRiNvfXvkmC8tlkUvATkcn7Flx1
 ObaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gJCveQWwdmN+Z1ZK4WHcVke3NOyYamcJHyo0B2XOHio=;
 b=SsP6zijDPp7pi52I17tnYueYKTvfzYFW3GdYOzpKq3rp5WROThXP/8Rnq+wWpIXYmj
 HdVREPUtmDNL1Yg4U7G5BXhUHTu2sZv1W9U3h+Jg6QaUZfgPhzK5QSJnkTbpS54+hpTZ
 b9DNDFLYepKH67RK2w9vDCfDR7lWCatinudTn3RmPkLizCHlVupOsxcuGARo6J71iQE+
 S9VONAxIJEd9a8raRCddHv7ztepzIrDp7oQoMKse3EGWAqx4I+G00b/3vOn84E4iDmRN
 N5chJeGkmTyXHIZBYpSFhap2b0PaQiklYLU+VYd9h404LNwfMVD6HJXGoW7temiZqbzT
 tm/g==
X-Gm-Message-State: APjAAAXG3ZQg17qqe8hUr0qbCH+AgQZ7/QJY1BXMXtdGVEI1ELesErqu
 qL8IgJqf0QaLUsxU5olXeL54ne9NCGJgxFLzZkK46Q==
X-Received: by 2002:a05:6830:ca:: with SMTP id
 x10mr22928697oto.221.1571057510375; 
 Mon, 14 Oct 2019 05:51:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191004025509.3012-1-david@gibson.dropbear.id.au>
In-Reply-To: <20191004025509.3012-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Oct 2019 13:51:39 +0100
Message-ID: <CAFEAcA9soWUfyfvV5Onyy0wP842Gq698_sZ+E1xGwkmnrLHnJg@mail.gmail.com>
Subject: Re: [PATCH] exynos4210_gic: Suppress gcc9 format-truncation warnings
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1CQg1uhe2mln

On Fri, 4 Oct 2019 at 04:10, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> exynos4210_gic_realize() prints the number of cpus into some temporary
> buffers, but it only allows 3 bytes space for it.  That's plenty - I'm
> pretty sure that existing machines will only ever set this value to 2
> (EXYNOS4210_NCPUS).  But the compiler can't really be expected to figure
> that out.
>
> Some[*] gcc9 versions therefore emit -Wformat-truncation warnings.  Fix
> that by allowing more space in the temporary buffers - these are on stack
> very briefly before being essentially strdup()ed inside the memory region
> code, so there's not much cost to doing so.
>
> [*] The bizarre thing here, is that I've long gotten these warnings
> compiling in a 32-bit x86 container as host - Fedora 30 with
> gcc-9.2.1-1.fc30.i686 - but it compiles just fine on my normal x86_64 host
> - Fedora 30 with and gcc-9.2.1-1.fc30.x86_64.
>
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  hw/intc/exynos4210_gic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
> index a1b699b6ba..2e5e47f9ec 100644
> --- a/hw/intc/exynos4210_gic.c
> +++ b/hw/intc/exynos4210_gic.c
> @@ -290,8 +290,8 @@ static void exynos4210_gic_realize(DeviceState *dev, Error **errp)
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>      const char cpu_prefix[] = "exynos4210-gic-alias_cpu";
>      const char dist_prefix[] = "exynos4210-gic-alias_dist";
> -    char cpu_alias_name[sizeof(cpu_prefix) + 3];
> -    char dist_alias_name[sizeof(cpu_prefix) + 3];
> +    char cpu_alias_name[sizeof(cpu_prefix) + 10];
> +    char dist_alias_name[sizeof(cpu_prefix) + 10];
>      SysBusDevice *gicbusdev;
>      uint32_t i;

If we assert() that num_cpu is always <= EXYNOS4210_NCPUS
is that sufficient to clue gcc in that the buffer can't overflow?

thanks
-- PMM
