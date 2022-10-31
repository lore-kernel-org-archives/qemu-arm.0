Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp952723ejc;
        Mon, 31 Oct 2022 06:03:29 -0700 (PDT)
X-Received: by 2002:aa7:9e1c:0:b0:56c:78fa:2a2 with SMTP id y28-20020aa79e1c000000b0056c78fa02a2mr14663107pfq.65.1667221408853;
        Mon, 31 Oct 2022 06:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667221408; cv=none;
        d=google.com; s=arc-20160816;
        b=x5B//99U3YNnP5Tcyfimim7rmJXPAn+jGGKqnEzG/sWQ6PDIJYXOiuOkfkTv92t/I2
         069sSqyGyj5M7wc/l02rbUSxL9hLgOj/JLfVbTjFoVejiO0OjtxT/GahRuaENIthNCbA
         oqUlF7KpQUfXkTT+599cJE3l97DZLWI0q8OuX9kHno+h2S0F3g73eUU4lKFjEL4olfrv
         yfkaEKLUSRlxUpD04hbEj3LrH8e9+vGAMm1tCaMX4OURicx2ME5lvgIl6fRRnjV5Dcv/
         FIjmm8K07k/H7hFXkbqQnzWI1/dSykDHUd4Dftri0WYhTmb/NmIZZfcsk6WWutcB1jFc
         ujww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rTj3OCdOh9GHTQq3zH5hk6i5H6mbJ+iR7eoNOh181ww=;
        b=fQpxl8Rk4ITf+6F4He/ln5Lr//zdaVhm2VJD7u0+K/bXmxH6rOvQHnaLbEFu5miWwT
         HHMwNkFvK3N6WU3RHUNcAvvubMBVnGB+uGP3yt+GkgtZ54hIBRGEtXNs7w+pNlDNL8s2
         EQqvriJGDw8Ch2lzpBTZpxRb8JU0TT+DfjtOVQYa8w1wLCQrkD5ow0mOMWmQqWmnNkal
         kBarIs7t9l+aofbDKN58Y6YpQKbmiVYr8+enEFeTHdwtCZILWTFMN1mqxMq1jwrwRRKF
         5bJz9sj6AHmQcQS/6gbGpGpbJf9hxVxsrS/vEslJxkCboiAsm/LucfVUNwNQx4ZjTH3E
         Bqqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XfQ3MauK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e11-20020a170902e0cb00b00186831e191fsor2155793pla.56.2022.10.31.06.03.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Oct 2022 06:03:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XfQ3MauK;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTj3OCdOh9GHTQq3zH5hk6i5H6mbJ+iR7eoNOh181ww=;
        b=XfQ3MauK5C4Q7W7LVK+1IxkCwtIjLz7WQB1IO+eU250PjUF0NlFT8cZ/pja43DGPqj
         UEaLDy/ejaca7WT5yyyqghud+3fpvozGOoOkkq+SRebxvHewjLUZoL8uE4A53kE/ODpn
         0KwkzQpIrznhTtFlQ+hajWpqhyu1E086bNnRc8677QrYhgmXHUWUA1nZZYefgcIDBE8y
         DlXR5bvNoBJuLbTyIXjRzsfvyELnL/972R8cUnonAKgglP1rBxj3zlpi6NVe3LJo//Y2
         agiRn/Vx3knTt+tP4yZcamvIpWOTAka7XXwGCuGCraVyXjtqxgymbtscj0F6NV/YETwI
         B+Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTj3OCdOh9GHTQq3zH5hk6i5H6mbJ+iR7eoNOh181ww=;
        b=v3eDfGEBSKpxWW9OfLUT2KhVfdOs4PgMOX/9vq4Hsxzxu5Tc+w+ly2CtxIYun47Fdr
         NK6vj64T0OI8xgXsBedKqt7WM4/uVJJKpV6h8nmFTdCCX54ONRUkEFG2vXN0ON+2eOFB
         Mo7kO+2r9aNa9OPHl1n5oUHG1Upaak3w5JXM1Ht9gf6JrqAi7KyI1N46JiD4kihI4uRy
         4hfyxNrPUuguBpuxOw7FXb8mVO8mRuB6jCRf3Xho0fFu1CdUMYGYDYpXcmolD36c5vIY
         eD2/v+FZATFKSvvJVPCsdpB8o1VLGix2n/T/fGuCGGB0JpuQY9YZATxKVSqglQVqGD5p
         yRqw==
X-Gm-Message-State: ACrzQf21nqJ1y6WGnYpAa98uyeyASsyia2jo/vbuRQFtsrw6uyV4cp8u
	Iq5y+BBrAvHetequjfjjg79F2NCJiCSEezzd9HNRWguH
X-Google-Smtp-Source: AMsMyM7QB6V3d0KPpypcwyxjQGMri5u0GXcwgs7VVMu6On1hK1l2EZZXn/XVnodRVPqC2MF/0p8wr4xyQl+1RWyAS1Q=
X-Received: by 2002:a17:903:4d7:b0:178:8564:f754 with SMTP id
 jm23-20020a17090304d700b001788564f754mr14366795plb.60.1667221408392; Mon, 31
 Oct 2022 06:03:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-2-alex.bennee@linaro.org> <769e0e8a-7787-b02b-9e26-87eca955666b@linaro.org>
 <CAFEAcA-0zoNS0nWrYu6hM1=8tG4i4GkjHLL2v4OMmJv5GaDAMg@mail.gmail.com>
 <87r0znlnmm.fsf@linaro.org> <CAFEAcA8Ft_YAC2TRCSErUJxY8_kZOQdF7Qa6oM6VF2RpAeHrBA@mail.gmail.com>
 <b1a845ca-0972-1800-0c58-03f68d0c94a0@linaro.org>
In-Reply-To: <b1a845ca-0972-1800-0c58-03f68d0c94a0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Oct 2022 13:03:16 +0000
Message-ID: <CAFEAcA-jvg4t1O-wE+19rJgzdiSZqF+X-XmEDLnrJYZCo233Sw@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] hw: encode accessing CPU index in MemTxAttrs
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, 
	Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: NNra6XjTeapc

On Mon, 31 Oct 2022 at 12:08, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 4/10/22 16:54, Peter Maydell wrote:
> > On Tue, 4 Oct 2022 at 14:33, Alex Benn=C3=A9e <alex.bennee@linaro.org> =
wrote:
> >>
> >>
> >> Peter Maydell <peter.maydell@linaro.org> writes:
> >>> The MSC is in the address map like most other stuff, and thus there i=
s
> >>> no restriction on whether it can be accessed by other things than CPU=
s
> >>> (DMAing to it would be silly but is perfectly possible).
> >>>
> >>> The intent of the code is "pass this transaction through, but force
> >>> it to be Secure/NonSecure regardless of what it was before". That
> >>> should not involve a change of the requester type.
> >>
> >> Should we assert (or warn) when the requester_type is unspecified?
> >
> > Not in the design of MemTxAttrs that's currently in git, no:
> > in that design it's perfectly fine for something generating
> > memory transactions to use MEMTXATTRS_UNSPECIFIED (which defaults
> > to meaning a bunch of things including "not secure").
>
> In tz_mpc_handle_block():
>
> static MemTxResult tz_mpc_handle_block(TZMPC *s, hwaddr addr, MemTxAttrs
> attrs)
> {
>      /* Handle a blocked transaction: raise IRQ, capture info, etc */
>      if (!s->int_stat) {
>
>          s->int_info1 =3D addr;
>          s->int_info2 =3D 0;
>          s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, HMASTER,
>                                    attrs.requester_id & 0xffff);
>          s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, HNONSEC,
>                                    ~attrs.secure);
>          s->int_info2 =3D FIELD_DP32(s->int_info2, INT_INFO2, CFG_NS,
>                                    tz_mpc_cfg_ns(s, addr));
>
>
> Should we check whether the requester is MTRT_CPU?

That code is basically assuming that the requester_id is the AMBA AHB
'HMASTER' field (i.e. something hopefully unique to all things that
send out transactions, not necessarily limited only to CPUs), which is a
somewhat bogus assumption given that it isn't currently any such thing...

I'm not sure if/how this patchset plans to model generic "ID of transaction
generator".

-- PMM
