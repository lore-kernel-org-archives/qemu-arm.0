Received: by 2002:a05:7022:ef03:b0:7c:9548:a19d with SMTP id qy3csp1883960dlb;
        Tue, 7 May 2024 02:02:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWzGscuwtwpwSnLROHym1EejDTGznfuEEIN9dJbf7XUKO0q1xb4lU+fnsNP9Sonlmk4k7IdX24fT/HGQeuNADlKxq7p/zMn
X-Received: by 2002:a17:906:57da:b0:a59:ef1f:83e4 with SMTP id u26-20020a17090657da00b00a59ef1f83e4mr697904ejr.59.1715072569952;
        Tue, 07 May 2024 02:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715072569; cv=none;
        d=google.com; s=arc-20160816;
        b=D/XCtQo0tXR21/tjR+/Cx+0mJ5fztCdnz33zAgaaA5+Q7Jm0EmaV//FzPaYw4jx2ch
         ilo+yeMbORn6uLkvk+Ccc98694ExVYUN13hglNOeEe8KEJLhPQvpncdVa2+GoDxAc4f5
         4FehMV/Zj9pwYKvO21YS4GUj3a/JH211YuJBYkExEHSbz4cD4/P1piH1DMI0r7ZqORVx
         R/ul2+oEdcka6PcKQpIdMr4LPJvG1xQSt1IbBYMJaxA9g4Pt115/SegGmam6pqnZlOQ9
         ap689cPAVLPss21QxB/OpDJysLlvyMAHKr0TKU7yjZA7CQ9GFmbc8BtrW9opaI5Aa+Wx
         ke/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z2jE5qDfx8bS3LJas2UapfjwL3dy12JCUJWy1N4nJtY=;
        fh=cJMZ7VTsUd8ltzlYbtMmpx1bJhnyFbjesr8XPxiVfpg=;
        b=BGXRaMMT7RET0jim9ozqjdvk4yUGrUX4Cx5RcZDHJZxesPBLEZm7bPIsUym5Pf4n4J
         yzsSwavN0MUgB4NHJhLSJTkxohJjtXTn+5V++u44KDQLM9MGTh0Zipo9vSLBb/xOIOjS
         YdXDTh+cFoK7h84mCxc45h6NzQPeTnfr91JLAAOKsUOJDB5gP1vXfZbRAuB/NNmQLDvj
         Izy1GagjZ30XqznUZhH+2wZR/IUWBVWwa9J2OisCXApKmBwpntyTuJlYRP9OPXUB5oRw
         HQPdeGz2sCxYWJbrvcYErooTfbyuoh0CUQtgfrE07unCekzEtbnvgoT50iNPRSz66hsi
         NWlQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eHPI7/AD";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m18-20020a170906235200b00a59ab5af9adsor1645743eja.0.2024.05.07.02.02.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 07 May 2024 02:02:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eHPI7/AD";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715072569; x=1715677369; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z2jE5qDfx8bS3LJas2UapfjwL3dy12JCUJWy1N4nJtY=;
        b=eHPI7/ADFoHlpQD4Z60MyoTB+A0E6Gm/g6S3wD7xHfwatGDafTjHnPHKN2fv5Xj9T8
         P7PAV/NfacWgEcKoCpf7HR/QxHXNpNUm56ai1+etCcSuAUXqud77+L0644FJZcG6OmZ4
         42ojiOK9XDXEt2+etagYphCcoykDQdkavUKOQOrCHJObwXP3AAHVHhEHAHPy6GCNHeyQ
         ZhOl09DKUvo/X+6LzqQpMQu/TWsyAYnjUiOBpPcVCNJqMpyKKr9lq2CTOy7/fc4x9SrZ
         UbUbJ+W9aXJAXH+jN5JeBK1hf2vlydzTXSxEukDVhYmJmDN6mtyN6V/0eMIvfmAgIRpf
         XDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715072569; x=1715677369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2jE5qDfx8bS3LJas2UapfjwL3dy12JCUJWy1N4nJtY=;
        b=TsO3sHqhfMDNmCetGRWfGhvVcBL9hSiEbF/WM0YEXZ5lbMvRSIYuvQ9lmfOY6Vn2IV
         12xUM5Rfifb9fuis3Thx3EjCsNE9xDjLpUwvEXOGZ9YRbhxsUUIsfgPSS9FarT88G1zW
         PrgHuyAmeSd6jve3p9mrq6Q7hyAYFtKFouEhZvJ2HCmrCs092Q1Sx3iNuqUeE+txp8P7
         mo2/fSFIar3qW7L0KPkNZRrbBhGScai8hI0tJSUjnIBJNWd12InUSRoCwOZ5IpOvqKm6
         hiHT0ttlbxbC6QY4Kmc1DB5Ioo3LTj0KjiG3DkPwrZoCyx0GdjdKrWOiLqBeB5kqgAjv
         niwg==
X-Forwarded-Encrypted: i=1; AJvYcCWUb3z999eoTOhjYW7FYr39zMuWj4tlPkxuuplqzhiyZmcUWvKYJyrycVbD7VG9lLJfwABEA5EKqXtx/+oektwyvTWelvEI
X-Gm-Message-State: AOJu0YwKj7prdX6jZ2x2qpKIkA7YvN9W08/ql3EunsN4emk9x7lIIj9l
	YDxnNp9i1FDIPtmrCByFleR6Txh8S13pdHvVNBO8rR8I1SsW/R/Wbi0ODLAjRSIPSckUhrS1Ntt
	uTDl3Tbq1FeOk8EiU0oC6H2Psgr3/RP8T6cjYyyO8
X-Google-Smtp-Source: AGHT+IGRKbUd3xCeyVnFWisL15Tu+azAc7g+Ys9aQHJHCKi0yT/uNqNOD6ylCW1UdjC1qCIAoBcMsGi2by5IjZeQDnk=
X-Received: by 2002:a50:cc96:0:b0:572:32e4:daca with SMTP id
 q22-20020a50cc96000000b0057232e4dacamr7264208edi.25.1715072569373; Tue, 07
 May 2024 02:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240312020000.12992-1-salil.mehta@huawei.com>
 <20240312020000.12992-7-salil.mehta@huawei.com> <CAFEAcA93EotG4-LXRJF034_9dWAWgZJA1VF6dB-xCsXn0T059g@mail.gmail.com>
 <10f35804a55e460a8ce6ecdb3f0c79b6@huawei.com> <CAFEAcA-w7wf9F4VVAnZR3b34ydEWq=QNw=CxhTMobsr+AP_LCg@mail.gmail.com>
 <55f942d2a3644bdaaff759014e3a4c20@huawei.com>
In-Reply-To: <55f942d2a3644bdaaff759014e3a4c20@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 May 2024 10:02:37 +0100
Message-ID: <CAFEAcA92nCPPk0Qa6XjRqRGTq_XDyRSVVaz67WgJBEZcxoEtOQ@mail.gmail.com>
Subject: Re: [PATCH V8 6/8] physmem: Add helper function to destroy CPU AddressSpace
To: Salil Mehta <salil.mehta@huawei.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
	"maz@kernel.org" <maz@kernel.org>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>, 
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com" <david@redhat.com>, 
	"philmd@linaro.org" <philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"mst@redhat.com" <mst@redhat.com>, "will@kernel.org" <will@kernel.org>, "gshan@redhat.com" <gshan@redhat.com>, 
	"rafael@kernel.org" <rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>, 
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, 
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>, 
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>, 
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>, 
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com" <miguel.luis@oracle.com>, 
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian <zhukeqian1@huawei.com>, 
	"wangxiongfeng (C)" <wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>, 
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>, Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: sXvSYrDnG2Qb

On Tue, 7 May 2024 at 01:11, Salil Mehta <salil.mehta@huawei.com> wrote:
>
> >  From: Peter Maydell <peter.maydell@linaro.org>
> >  Sent: Monday, May 6, 2024 10:29 AM
> >  To: Salil Mehta <salil.mehta@huawei.com>
> >
> >  On Mon, 6 May 2024 at 10:06, Salil Mehta <salil.mehta@huawei.com>
> >  wrote:
> >  >
> >  > Hi Peter,
> >  >
> >  > Thanks for the review.
> >  >
> >  > >  From: Peter Maydell <peter.maydell@linaro.org>  When do we need t=
o
> >  > > destroy a single address space in this way that means  we need to
> >  > > keep a count of how many ASes the CPU currently has? The  commit
> >  > > message talks about the case when we unrealize the whole CPU
> >  > > object, but in that situation you can just throw away all the ASes
> >  > > at once (eg  by calling some
> >  > >  cpu_destroy_address_spaces() function from
> >  cpu_common_unrealizefn()).
> >  >
> >  >
> >  > Yes, maybe, we can destroy all at once from common leg as well. I'd
> >  > prefer this to be done from the arch specific function for ARM to
> >  > maintain the clarity & symmetry of initialization and
> >  > un-initialization legs.  For now, all of these address space destruc=
tion is
> >  happening in context to the arm_cpu_unrealizefn().
> >  >
> >  > It=E2=80=99s a kind of trade-off between little more code and clarit=
y but I'm
> >  > open to further suggestions.
> >  >
> >  >
> >  > >
> >  > >  Also, if we're leaking stuff here by failing to destroy it, is th=
at
> >  > > a problem for  existing CPU types like x86 that we can already hot=
plug?
> >  >
> >  > No we are not. We are taking care of these in the ARM arch specific
> >  > legs within functions arm_cpu_(un)realizefn().
> >
> >  How can you be taking care of *x86* CPU types in the Arm unrealize?
>
>
> Sorry, yes, I missed to reply that clearly. There was indeed a leak with =
x86 reported
> by Phillipe/David last year. In fact, Phillipe floated a patch last year =
for this.
> I thought it was fixed already as part of cpu_common_unrealize() but I ju=
st
> checked and realized that the below proposed changed still isn=E2=80=99t =
part of the
> mainline
>
> https://lore.kernel.org/qemu-devel/20230918160257.30127-9-philmd@linaro.o=
rg/

That seems like the right way to clean these up -- Philippe, do you want
to fish that bugfix out of your big patchset and submit it separately ?

> I can definitely add a common CPU AddressSpace destruction leg as part of=
 this
> patch if in case arch specific CPU unrealize does not cleans up its CPU
> AddressSpace?

Arch-specific CPU unrealize shouldn't need to do anything -- if we
fix this similarly to Philippe's patch above then that will do
the cleanup required. Handling this kind of cleanup in common code
is more reliable because it doesn't require every target-arch
maintainer to remember it needs to be done, plus it's less code.

thanks
-- PMM
