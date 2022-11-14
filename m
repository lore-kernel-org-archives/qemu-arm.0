Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp2683690ejx;
        Mon, 14 Nov 2022 02:06:27 -0800 (PST)
X-Received: by 2002:a17:90a:9d8a:b0:212:de1a:355b with SMTP id k10-20020a17090a9d8a00b00212de1a355bmr13362954pjp.1.1668420387419;
        Mon, 14 Nov 2022 02:06:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668420387; cv=none;
        d=google.com; s=arc-20160816;
        b=ezwD7zV+slNDn4hg/lWlsAejiN1WidPbtQxrnDyTPrTJMhBqploXjyI+ntrR/ZL02e
         A0dTmoOYrNX9jgrGW+7Is8You4D4rFLgxANbRH3h4czui9r1Brf7c0mRhcPa4g/qTtFi
         AH2UqG5fDxG3FRGJ1KCrbM5rNLW+iAq82OjgM3Rahm23mem8arlPSJTB8lm6GeQGXAMw
         P05BC1g3wmXvqnUIJlKP1IcklHK0JltPfa3BoRsJThw/8hUL7VWzu+kfmXGYZ5K9YKbA
         jOku6sJGPbA+mZLDcJWLhP91UKC5RzQhQdiERLv8F+AEy8YQi4qKraPwK730iinnbPa4
         EpWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LbXul+PU6pL42Fsl6Wyc78F8fuex80+WE1jwHDJ7FzE=;
        b=XzRWUpdwEf+hGqX8dvuSNNTdyBRJPlQ7mZ2mwhnbbn6idHj65SY4CfPE4DW74HE7II
         LgxAhWQOQRu23dDSGNb/uy+2SgTZknH5ZmhPamp63+11puaxzMYa7yhukIYbDdQKUMpZ
         2qFBfQ40C2xtElJXPBmn+ek62DJ3k+2Vzl9AlzcNv0Kj2XViSCo1ptSVHh/WxJtNo+ZI
         hgXMBChqAE28zqGIpLCvw18vt7YycyNPKuqypa0nUWprPwN3/yO4/xlwZX+k2hBxbH5V
         Kxi/PY/QX+qQUvN5uBDx1HnfX8y6csjHCbZmhvvshS7k8f60GGQvUWSquR4iOhNSaM6R
         0EcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dpryn6k2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f4-20020a17090274c400b0018422d1d1f1sor3578165plt.21.2022.11.14.02.06.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 14 Nov 2022 02:06:27 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Dpryn6k2;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LbXul+PU6pL42Fsl6Wyc78F8fuex80+WE1jwHDJ7FzE=;
        b=Dpryn6k2jDcveKKccFLX0XGqb680Rnrn5CTRbe6BFixECtQJH4X7ZP7pcWuriRulKN
         441EVhrowSuu3zoeo97LvpqZnzH5K//cdXIml9m8gGmXJpUi5vdb/dXVwa69maY8FSxx
         Mv/2If0vX+HR6o8JD/7U+CViXP+j7Hee+0bUBgBYJZxJvi9Rit/rBSHFQFHsbzyuuzBK
         gxxU+0FNhxSIUysno31K0MIRwu8RBoW/lY12WKkN3bmiLdKMq5PqN2utuEBS+w1PA2bm
         Lx0zRDt1vPEvJB/nknMSkWo3oYQk2WvqNaTfYhZ2l3KFbEsnU0Skgi8NBpQ+6f9i0NjU
         mUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LbXul+PU6pL42Fsl6Wyc78F8fuex80+WE1jwHDJ7FzE=;
        b=N549vQWvw0FWsepByZqt85dVaKa+/sWhIRaQRYVOQ0UJjGjt/yS0t11IcuTWjDnNMU
         5c5xuNOyrDzrOqWhCPf0nRGwXM7N3MPjh/PxHrbBuIS/sQJHg97qObYHuHgIQBFJWZd1
         7SxUUi2nVfMTjm+comakWMnkMLjA2/PYdVHeQicRnms/QSYborW3lQPKt8YKgcNe+EZW
         +Vm2uf6uU99Vtv6Doizajb0OqU+NySS0ZIAjijjg2GvBu7F2LI0AFm0prVeYMwLEuq2Y
         YZUAe8I6THD0EL/0sxNtcetxywuHQBKsRigvdVDMtIhVj+6RRpyyeLfuP74Lg8SUxrI5
         fx1g==
X-Gm-Message-State: ANoB5pkqjCzgwKuyYNsPn/TtGw955hhkVYGbcXjWMMsr3lE6IoMs200O
	WiAWOkYlj4SlSRxITjmqfoNqD0eAud5UjjpJtrhJDDNC
X-Google-Smtp-Source: AA0mqf75OQPz2QigGhbWoizk6AC6Kovo2+MqMuwXeQgpLu68JGiWr2yZ84gAdgPUdctJEt+VTVGYb8IseWFZuFRYbwI=
X-Received: by 2002:a17:902:c702:b0:186:9295:2012 with SMTP id
 p2-20020a170902c70200b0018692952012mr12808805plp.19.1668420386964; Mon, 14
 Nov 2022 02:06:26 -0800 (PST)
MIME-Version: 1.0
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-2-alex.bennee@linaro.org> <769e0e8a-7787-b02b-9e26-87eca955666b@linaro.org>
 <CAFEAcA-0zoNS0nWrYu6hM1=8tG4i4GkjHLL2v4OMmJv5GaDAMg@mail.gmail.com>
 <87r0znlnmm.fsf@linaro.org> <CAFEAcA8Ft_YAC2TRCSErUJxY8_kZOQdF7Qa6oM6VF2RpAeHrBA@mail.gmail.com>
 <b1a845ca-0972-1800-0c58-03f68d0c94a0@linaro.org> <CAFEAcA-jvg4t1O-wE+19rJgzdiSZqF+X-XmEDLnrJYZCo233Sw@mail.gmail.com>
 <cb28a138-a82d-0604-a8cf-b302493ff286@linaro.org>
In-Reply-To: <cb28a138-a82d-0604-a8cf-b302493ff286@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Nov 2022 10:06:15 +0000
Message-ID: <CAFEAcA-Rwuh9s0EoD-B7zgQPhcgZqBOmgK46S-Vd=vRYE1a1Bg@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] hw: encode accessing CPU index in MemTxAttrs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, 
	Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 3fuM+juSLokK

On Fri, 11 Nov 2022 at 13:23, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 31/10/22 14:03, Peter Maydell wrote:
> > On Mon, 31 Oct 2022 at 12:08, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >>
> >> On 4/10/22 16:54, Peter Maydell wrote:
> >>> On Tue, 4 Oct 2022 at 14:33, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
> >>>>
> >>>>
> >>>> Peter Maydell <peter.maydell@linaro.org> writes:
> >>>>> The MSC is in the address map like most other stuff, and thus there=
 is
> >>>>> no restriction on whether it can be accessed by other things than C=
PUs
> >>>>> (DMAing to it would be silly but is perfectly possible).
> >>>>>
> >>>>> The intent of the code is "pass this transaction through, but force
> >>>>> it to be Secure/NonSecure regardless of what it was before". That
> >>>>> should not involve a change of the requester type.
> >>>>
> >>>> Should we assert (or warn) when the requester_type is unspecified?
> >>>
> >>> Not in the design of MemTxAttrs that's currently in git, no:
> >>> in that design it's perfectly fine for something generating
> >>> memory transactions to use MEMTXATTRS_UNSPECIFIED (which defaults
> >>> to meaning a bunch of things including "not secure").
> >>
> >> In tz_mpc_handle_block():
> >>
> >> static MemTxResult tz_mpc_handle_block(TZMPC *s, hwaddr addr, MemTxAtt=
rs
> >> attrs)
> >> {
> >>       /* Handle a blocked transaction: raise IRQ, capture info, etc */
> >>       if (!s->int_stat) {
> >>
> >>           s->int_info1 =3D addr;
> >>           s->int_info2 =3D 0;
> >>           s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, HMASTER=
,
> >>                                     attrs.requester_id & 0xffff);
> >>           s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, HNONSEC=
,
> >>                                     ~attrs.secure);
> >>           s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, CFG_NS,
> >>                                     tz_mpc_cfg_ns(s, addr));
> >>
> >>
> >> Should we check whether the requester is MTRT_CPU?
> >
> > That code is basically assuming that the requester_id is the AMBA AHB
> > 'HMASTER' field (i.e. something hopefully unique to all things that
> > send out transactions, not necessarily limited only to CPUs), which is =
a
> > somewhat bogus assumption given that it isn't currently any such thing.=
..
> >
> > I'm not sure if/how this patchset plans to model generic "ID of transac=
tion
> > generator".
>
> Does your 'generic "ID of transaction generator"' fit into MTRT_MACHINE
> described as "for more complex encoding":
>
>    'MACHINE indicates a machine specific encoding which needs further
>     processing to decode into its constituent parts.'
>
> ?

Not really, because "generic ID of a transaction generator" is a
superset of "ID per CPU", not something separate that sits
alongside it...

-- PMM
