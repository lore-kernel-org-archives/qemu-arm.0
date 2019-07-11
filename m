Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp692304wrv;
        Thu, 11 Jul 2019 05:46:58 -0700 (PDT)
X-Received: by 2002:aca:6706:: with SMTP id z6mr2110826oix.43.1562849218286;
        Thu, 11 Jul 2019 05:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562849218; cv=none;
        d=google.com; s=arc-20160816;
        b=NSd41Yz/U034EUQ56fGPqZWvRPKZYFS8f2LGBiKlrz1iQXN0FJgz/Zb0dvQ56zwoxn
         JckYIrUotI6jMS95Ibu98/74dxrBiTJxvqxnaDKzcjUXipxLTnznlBkCqaj5wbohCUPp
         T59xc6jjIPzWfiLbC6/GpdxWaWJ8RSpRqOFnepwU4X5+QTjcmHBeKcTJEXrdG67NfcMB
         AHipuONCOdwsLGhRCGZmlLA1rN+qEbwksLH8FWf203TyXZPVyrOhwKt7RSQ9htJU3yAI
         Wvq7TbnJXPXPLGnnkSU8I08BpJArRRaWOcl2Q4cz+jp66Vsa2620LiD9VBE2/doRLbDr
         fbmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p97YX3IoJy94wJq9tTL1wuf0ASRWpNpZgfBlTY7Zy78=;
        b=zemUcq79C+hlhnZuPaTc5b6JJ9YlxW9EytUMLPbLEppJuQ8n6hQnkAf/CCpVldffTx
         TQwheL3SPNu8qmejQsVmOmglbA8XM0QKjL8IlZv9gcdaKlJf4Db1VpZbByBd/iGgsSbW
         YOmeWkGEYBEmb0LCRzzociF0TCqugd/yh+/ws9MoeFEbocjF/hFaZALkG8jQyvCjCMJ+
         dpdCrAKCcdgQ0TvRfA85JfMbtvOH+6ySyIrkFlTQ/o2MY+2QQQ+OaLFY4vqnQ4vGvpLx
         8llAwltDAqwO+48iD0Ty37qa3JZmI8bYK21akH8flCWuzLdhZhKb13zLWDv6Gy0NeIIk
         /I8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zVNe892c;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id j24sor2872167otk.32.2019.07.11.05.46.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Jul 2019 05:46:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zVNe892c;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p97YX3IoJy94wJq9tTL1wuf0ASRWpNpZgfBlTY7Zy78=;
        b=zVNe892cf8T64t9Poweuxia2hTaNBG0dcRus7B/4/adsYiq/mJlZJEIP8XCxKc+Apr
         cf4OCyI3HspQ/SphiawqlaKfVKSnaZ3kK8pFSy7mLWLCsjOzo3K5RBH7jnvUkUapQtHa
         FDwONXmh7vTfQg0+w47JjfR6OSgQpg297Q9HLjcujrw3yogd+vwF8vEiRKuAXL9dTHer
         8R3GTxfIDZykwX7Zm8ck0EGnfhtZJ/foiNF0563FfDgmx+r4/zepfvEyC8BanR3kzCE3
         inpXIz3lXAnMPBhZDQCamCypBTdw+zQAwiAFHgwCZQY8iUkPvM4cPh806C7LLQ86TcwK
         q9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p97YX3IoJy94wJq9tTL1wuf0ASRWpNpZgfBlTY7Zy78=;
        b=U9rcKuLtIT7u2y669HEAXd3jer7YWaECySUZPnlxbBEFaI7Q3fyTuj2OHZ2M7Binsy
         qYcxNnoSOVyCgr8JLbujxKEcWrByAy7Dvpb6m/xcG0h/A9nKJm+vYXRy34v4cqp1ljmk
         QlV3JSAlkyFuCQS93TzH/VXfD8JjtZZ3C8mxwX9wRtrMaYc6oNM7QutYkROfFyz4pQfc
         FC5ZcG9ngrs68hmxWrtU2yo8bTL3o63VmoLw88Sn4/qQvwx22fzQ97MD25zyM6Mz3Om0
         fkjNh+ordFYMrlXdN9vj61TVQ35LHK/cNppw+NvWDLyQbdOsTlgC9wTjoJffVm8Ymcnc
         ES2Q==
X-Gm-Message-State: APjAAAU/Ql6jEDhDvULJZuyGvPZMoFo1bvs1jqzkguL/zIcDbwynW5QG
	O00VXXQb4yUTPo2CGx38zkQXEO7MgPsG5Yq0zAYtt2VT
X-Google-Smtp-Source: APXvYqwIuUVnErABgjVY5ASG37fqqVeG7zVNobq/ht3B+tVjL4E39+AYZKLw3JJnxAF+WuLWHzw+0OYnhSHhW96cPVU=
X-Received: by 2002:a9d:711e:: with SMTP id n30mr3036913otj.97.1562849217964;
 Thu, 11 Jul 2019 05:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190711121231.3601-1-peter.maydell@linaro.org> <21ffce4e-72cf-2c5f-71b1-cb53367dccda@linaro.org>
In-Reply-To: <21ffce4e-72cf-2c5f-71b1-cb53367dccda@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jul 2019 13:46:47 +0100
Message-ID: <CAFEAcA_3RMV1vMk5CQf1Wjk1SJUjhEFxaevn6hupp9+ZjDktAQ@mail.gmail.com>
Subject: Re: [PATCH for-4.1] target/arm: Set VFP-related MVFR0 fields for
 arm926 and arm1026
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Christophe Lyon <christophe.lyon@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: AYpoOfeT3gvt

On Thu, 11 Jul 2019 at 13:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/11/19 2:12 PM, Peter Maydell wrote:
> > @@ -1713,6 +1719,12 @@ static void arm1026_initfn(Object *obj)
> >          };
> >          define_one_arm_cp_reg(cpu, &ifar);
> >      }
> > +    /*
> > +     * Similarly, we need to set MVFR0 fields to enable double precision
> > +     * and short vector support even though ARMv5 doesn't have this register.
> > +     */
> > +    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPSHVEC, 1);
> > +    cpu->isar.mvfr0 = FIELD_DP32(cpu->isar.mvfr0, MVFR0, FPDP, 1);
> >  }
>
> I would have placed this immediately after the Jazelle isar setup, so that the
> "Similarly" comment had the proper referent.  But, no biggie.

Yes, I'll move it. I'd misread the chunk of code that sets the custom
IFAR as "ISAR" and assumed it was all of a piece with the Jazelle ISAR
setup.

thanks
-- PMM
