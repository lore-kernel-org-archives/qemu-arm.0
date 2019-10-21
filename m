Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4785871wrm;
        Mon, 21 Oct 2019 09:18:51 -0700 (PDT)
X-Received: by 2002:a05:6830:1e6a:: with SMTP id m10mr18674179otr.236.1571674731031;
        Mon, 21 Oct 2019 09:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571674731; cv=none;
        d=google.com; s=arc-20160816;
        b=F2N29ShPGzmHvpfLrvvDoENJYLaejZGDkBh140cNlfJLmgd5GJAQqD2FIvs14+ni0S
         jrtld917Y9zA8MoSkJIfAkLl6yzHQjvIXgzuWMGPBLuCHhUERtNW2/zTLof6E+FW2iu+
         0TmyDs6RRol7GH8sWasmF1gBDo2wDpO7agCtqndeVn15x0MQ49LoWNGc2xvje0PBrxcM
         xtJhy9ju0pDZqK4lRzV7WmaeqD/PHycSBJtGCwDFf5LGjZAPISkaxZF7b43lgOnCJunz
         zTQ3Tp9UZZm9+SDzuUINWP+jv1ET7/BhUAuOrfLHgknVFp2TrVBwBEo0md59uRrzn1pJ
         DaUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cEXmLrLOTGKJDPnqAGoAgVNhvpHJPDHl4lxsEKXEJLE=;
        b=WqpB76RA7VTi54Iy2nQSn90aJ3303HgGoXwGK8C4Wsrvya0mKRwlE33ovBwKJaj/Cz
         SCFQvc0C5JPsrpnkcRBR8pwu+5yOTOtloTXSQ9KPlXw2FMd6UlDk0bcnAJEvEcpzLsQ+
         6V0Td1KWFbX3WNL3OjtlCOrz3JAne6/CFUVxZJhDoV3G9cUG69iSgqYy4I9fXgoVT7aS
         DXbOtIriuhxQsK54vmmm7irG+REPGQxCiOlOvAhxAR1YjHk6Nt0UQA7G2ibZ+MpwoQuT
         VZdlPVZCH8iOt0DYy/1Wg1390D8kRpxlIIO9DLMmbsU61R0CXmaFfcAMDkUPhs9OrQgU
         Esgg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bsk8kXkK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m24sor7439328oih.146.2019.10.21.09.18.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 21 Oct 2019 09:18:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bsk8kXkK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cEXmLrLOTGKJDPnqAGoAgVNhvpHJPDHl4lxsEKXEJLE=;
        b=Bsk8kXkKD4IWxdJhd29rL+XGIAPaw7KmHu9IHgic1EKEXeNoYrbZeQeUytZM3A9XXb
         gfGG/kY8/GkZwKfXh6UbHhKtym8A9CxJbPCHwESeP05iaT4b4TVNw+nmgEsI6KooBc5N
         c9Qer6aLZ7U4IRpLBrqRVNrUINt2By0REwOg3P8SlnBu4x7O300MaE7yu3Id/iwM8xTS
         xKVAA10yQ+pKNk5GU8UwpX0oSkZediduwGEIfxFzeiStD9UO3dVY6ByREuIM2rOhcmsL
         2wYXbFhnO3gx7IIaOpG7QuwnZgi4jw0OMLoEaNfEwG8FhqC+4lWofMv5iJd3YPdYKpBZ
         Vl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cEXmLrLOTGKJDPnqAGoAgVNhvpHJPDHl4lxsEKXEJLE=;
        b=QMQoJ43Sfcmpj/pLZj5PY9q5hHtNpNwDZhhJopbmkv9XDNqLtm6bKkt/6hxt3HgmHN
         xyGRD2QAr0K4tk40YWSf6bu2Nwb2W/LsaeVvBKgMUVMTdmZz8KrUlBJMPkgdtM/zHwY8
         fmdgpsktGik5507+sK/VxeE1juCkaOh8PyFuIKjrDlJZvI0dXa5yq9jmDBzAcB6tS/lr
         HejUeX4jd9VBrFoCtJUbBCvbR0FLeXLpUU6d5xIStW0NrWouSHch8/38c7oyKt9JwVXK
         MLrkmYGRrrwQA8gySMQfTr5vRUmDqIK0n4AHG/nnFICzuPVNRaKbUc72Fzco0s2iK8l4
         +S3Q==
X-Gm-Message-State: APjAAAVb9X6/uhOikewThTRYkjVtme/mIOJZLsKB9OI0d+MH54/0R17f
	7osc2Jjd/Mp1rX3sDsgJmKsD7v0/1QQ2RvI6knzhq+JN
X-Google-Smtp-Source: APXvYqwGTIaXASwydD//8FEXj2ivwVIWKNwFgB2xb5SNHrS5DvAB1udzm3EGH4hz4cPoyGxGN/KM0PYsa1xpepuXOFQ=
X-Received: by 2002:aca:2b08:: with SMTP id i8mr19041250oik.146.1571674730634;
 Mon, 21 Oct 2019 09:18:50 -0700 (PDT)
MIME-Version: 1.0
References: <20191016085408.24360-1-drjones@redhat.com> <CAFEAcA8pV5batrPk+J6RLU2rv9SNAmL8JS9Kd9tWP3pD-m29eA@mail.gmail.com>
 <3f54f759-9d6d-bf04-85aa-59c1cac31044@redhat.com> <20191021142336.e4xekqlmqv5txu5w@kamzik.brq.redhat.com>
 <CAFEAcA-bezS5tSVB+N223+N+xoYYYHuSJmDTaRCJgO+4Y=VjdQ@mail.gmail.com> <20191021161226.mnm6eomghb37xlby@kamzik.brq.redhat.com>
In-Reply-To: <20191021161226.mnm6eomghb37xlby@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Oct 2019 17:18:38 +0100
Message-ID: <CAFEAcA-vHmtCi3HGqpu34sAaNxGeQwS_+0yZ5Hr4SbnGm+rjYA@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] target/arm/kvm: enable SVE in guests
To: Andrew Jones <drjones@redhat.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Dave P Martin <Dave.Martin@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: unzWILn1Rj/4

On Mon, 21 Oct 2019 at 17:12, Andrew Jones <drjones@redhat.com> wrote:
>
> On Mon, Oct 21, 2019 at 04:43:22PM +0100, Peter Maydell wrote:
> > On Mon, 21 Oct 2019 at 15:23, Andrew Jones <drjones@redhat.com> wrote:
> > > Peter, would you mind running your test on the kvm32 machine with this
> > > change before I send a v7?
> >
> > Still fails:
> >
> > pm215@pm-ct:~/qemu/build/arm$
> > QTEST_QEMU_BINARY=arm-softmmu/qemu-system-arm tests/arm-cpu-features
> > /arm/arm/query-cpu-model-expansion: OK
> > /arm/arm/kvm/query-cpu-model-expansion: **
> > ERROR:/home/pm215/qemu/tests/arm-cpu-features.c:498:test_query_cpu_model_expansion_kvm:
> > assertion failed: (resp_has_props(_resp))
> > Aborted
> >
> > This is asserting on the line:
> > 498             assert_has_not_feature(qts, "host", "sve");
> >
>
> Oh, I see. It's not failing the specific absence of 'sve', but the test
> code (assert_has_not_feature()) is assuming at least one property is
> present. This isn't the case for kvm32 'host' cpus. They apparently
> have none. We need this patch too, then
>
> diff --git a/tests/arm-cpu-features.c b/tests/arm-cpu-features.c
> index 14100ebd8521..9aa728ed8469 100644
> --- a/tests/arm-cpu-features.c
> +++ b/tests/arm-cpu-features.c
> @@ -136,8 +136,8 @@ static bool resp_get_feature(QDict *resp, const char *feature)
>  ({                                                                     \
>      QDict *_resp = do_query_no_props(qts, cpu_type);                   \
>      g_assert(_resp);                                                   \
> -    g_assert(resp_has_props(_resp));                                   \
> -    g_assert(!qdict_get(resp_get_props(_resp), feature));              \
> +    g_assert(!resp_has_props(_resp) ||                                 \
> +             !qdict_get(resp_get_props(_resp), feature));              \
>      qobject_unref(_resp);                                              \
>  })

Yep, with that extra the test passes. I'm just rerunning the
full 'make check'...

thanks
-- PMM
