Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3831022lfp;
        Mon, 10 Feb 2020 05:19:23 -0800 (PST)
X-Received: by 2002:a05:6808:658:: with SMTP id z24mr791250oih.91.1581340763138;
        Mon, 10 Feb 2020 05:19:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581340763; cv=none;
        d=google.com; s=arc-20160816;
        b=ZE1LT3OtxwQDh19AUfylrqVVxnB3sOaSOiuF3D0LSQcTXXkcCrsW9s0kJVe0Ue+Lwj
         3pqcpZoLUknRpXi2o6UEGalH4LqVlD0uVsqorzqFWWec3T+Wp782WXP++d/micn33gif
         2/h37rkz8RrYq2v8Kp7e0bvBuY+BD6TpnbM49LAoNekJHYuXlQNIytNgeEUVM0IBl9SZ
         IbJ+Fg/Iv1rVpxg2CzoFIQe8Qi6zAcw+tq+uz/L4rBeu3P8XLuEQcXBfIYPHhB7M5q/6
         FPPCnGIGVFn7HR7RTgoP/JjVJuhDnoqi0LclncSsEKkCnJvH/WSr5jJn0UGACQ2DmH1J
         A/CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5jEPFD9HPWrfJhFXIwWs+zCONNzkL7FEsU6F1yfMKrk=;
        b=CR7MYtQCBn9fKC+pdYWyKtFcO9gpes9hL4Ja1KEacTO5XmAFJhL+pwdEF9bC81lvxO
         uF7skjhpum6wqtXET2cqr+pKRE3pDqG+XXQOb0KHcvtZ31Mt8Z+GthJkILY6/ixj+QrJ
         B6b1zUumXIeY2yTkVFBUNl08ZZRjOmmogpCaR9SA5zjzKO9mGNez2c1mNdUUMB5e1G8L
         GWSBLNe7jNLtidSAxxvL0PA6KyyOO04UrBH87EsR6c16pfYxPmoeV6zFhvtImcnU+FN/
         yy0G+yzzn/QM/lXgJK9VuPfkFYspc3Xhc+QSl/5a41B2FvV2d8A0iOjO65PuHTJvpp60
         Wr6w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=il25U0+Z;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m200sor52758oig.92.2020.02.10.05.19.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 10 Feb 2020 05:19:23 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=il25U0+Z;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5jEPFD9HPWrfJhFXIwWs+zCONNzkL7FEsU6F1yfMKrk=;
        b=il25U0+ZwdnS60FU3ivI3TlWcsm/6GGbtsqAZlyDE0aUvG2gh8BcPTWm2J9wGlEsol
         KxtA1nnCbQ+wslkGShaSlxIxyAFzawffgY9LATx30iw5gJfiBlm5awoHq0gt8LTz21++
         nb0dOf+m1oZxlDtGma/xUVYeYLauQm7NEYWdrT5sUiDuTmmZHj+HrqraEmni50F86lay
         Ao4yjJc3v1f/LuHIKsY/EjcLjlI7/Gd2dn0opvZ/x7koZdZo23jVTtk+X0+St0PJ2RWi
         Z/SnLcsAU9H571FIsoGULI18UD5DWHaTIPUNlAY16k4h+rOv9yl/FXY9tD7skAQ4EMCA
         eB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5jEPFD9HPWrfJhFXIwWs+zCONNzkL7FEsU6F1yfMKrk=;
        b=LBbGSMnT0jPuXwbMjVcrKcsMWR+0ON/f/MJtjc9dTpp93pR8O/Bsw30bg7vJy3E5Sy
         J8JwzdX43e4sXzEld2XyTj2oCyUxYOhLH8U6w9G3lb5qrZZJqqhS7r2bBZuHSP5bxXYx
         dtmGQGrygEr5T2O6m9Hvx/QdfIq45dfandgdxysG58cjIxYf/3Bd82r9HpGE8jfUBc/c
         Ylis2j6stkEbDqDcu2GGpeLlrjTZSI+muVXM8DIZxtadCBkEl7NuUvHyL3VypcIA68V/
         48l2GBPEKVEvOc405uFpnjh0K0J93pwaPoHAfV5fOK8MYGelXwNzawIA/8UCpSDtXPQ0
         NUIw==
X-Gm-Message-State: APjAAAVa8DZXVEkmQPbMJiwjKoG7ETKuelhLK+Nv8dumnpB95ooqS2K/
	03Yy8rTJKoC79qyl40WFcvRTWNAJyJArSc3YQhF6hhibplQ=
X-Google-Smtp-Source: APXvYqxeewqfduFItFCrpHpSE87sqy7wmGa3Cb/A454waZTnCI30l60Ydr7i3C7H371K9x/p/ZMb0MBDDbuWGb31XUQ=
X-Received: by 2002:a54:4f16:: with SMTP id e22mr813348oiy.170.1581340762175;
 Mon, 10 Feb 2020 05:19:22 -0800 (PST)
MIME-Version: 1.0
References: <20200210120146.17631-1-peter.maydell@linaro.org> <875zge3a2b.fsf@zen.linaroharston>
In-Reply-To: <875zge3a2b.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Feb 2020 13:19:11 +0000
Message-ID: <CAFEAcA9d4XDaUQLwy4yYyTSz1nzQ49adTv9z4K8e29OsUh_21A@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Implement ARMv8.1-VMID16 extension
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: NwPHbFkgnicA

On Mon, 10 Feb 2020 at 12:23, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > The ARMv8.1-VMID16 extension extends the VMID from 8 bits to 16 bits:
> >
> >  * the ID_AA64MMFR1_EL1.VMIDBits field specifies whether the VMID is
> >    8 or 16 bits
> >  * the VMID field in VTTBR_EL2 is extended to 16 bits
> >  * VTCR_EL2.VS lets the guest specify whether to use the full 16 bits,
> >    or use the backwards-compatible 8 bits
> >
> > For QEMU implementing this is trivial:
> >  * we do not track VMIDs in TLB entries, so we never use the VMID
> > field
>
> Not currently but does the VMID allow you to have per-guest page table
> caching? Last time I chatted to rth about potential performance wins we
> discussed how easy it would be to support this in the softmmu now we
> have indirect TLB lookups anyway. Given how much time is currently spent
> expensively re-populating tables we could keep the last couple of id
> tagged tables around for faster switching between sets of tables.

Yeah, in hardware the whole point of the VMID is to have per-guest
caching of VA-to-PA mappings in the TLB so you don't have to blow
them all away when you switch VM (just as ASID does for processes).
The difficulty with QEMU has always been that adding the "and is this
the right VMID/ASID" to the softmmu fastpath code would be expensive,
AIUI. If we ever come up with a clever plan for this it should be
no different if the VMID field is 16 vs 8 bits, though.

thanks
-- PMM
