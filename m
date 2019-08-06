Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5041713wrv;
        Tue, 6 Aug 2019 02:55:21 -0700 (PDT)
X-Received: by 2002:aca:5106:: with SMTP id f6mr1200574oib.69.1565085321849;
        Tue, 06 Aug 2019 02:55:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565085321; cv=none;
        d=google.com; s=arc-20160816;
        b=jcUVyaWiOL3Cnx0NS9becYBt0j8VUavQsiLXO1sopPZW7G8iH0vdeS7hwG723RJOrc
         DHV94iRzLciefpqxPFJhjZdaWPqD4+Fi/F3ANCnzQznqdl590wGndkUuf6VSwwel87PT
         9hlfxzJD1RRBaNn42figmjilGiaPmPlboT0wDtsF6AenEQIOJZoYorKWh0PYsj6UMYpz
         Eon+IW0Kh21Ro9k987n9UGTBJyox7HQijLrmn0qsUIT55yaL0PCQlIM7rFxes+qPJz4y
         Py1WTtHBHNaP+BteUCAocpvAX44Qm4jv7H7Ze33VAdiAnfE4K6OO/g4/gtrqZdHUeGYo
         DoKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bPXYZJMTNoLajk96h5a6B0Oeqlu3okr2ghnhZP4/sgo=;
        b=sLIcI/7TXYeadRzYozX3GVJQmeRo1bpXmL57W0Qns6JlWZavoZwRd0Lch6Z8km7FmB
         zzqAiYIOPe+F8UETkDYDScGKgrgDt4Vv4XWwiyR4JLYjVnrH3gcYsh6owrpShYVT8JGU
         E69U80TLy3lwLYVhGFp5EEzBa5a6cXWO+u0IxSNt9SMRCDVX3+bYnp49aYbufG5tAIsf
         Y7AwZjIv8xv9d4jq+qwnQbPhs4IuXrK0OYtGPxpGaMxI5m20u7P/fJiLpiq84/q2lkxS
         ISR20+Nj6KJv2ZWC3Tz0UKtZeRb1EwdXUQ5ARpbFauxKoBf+aaQjADmjvT2f65jNRjlK
         NsUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TGS0x2on;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id q11sor44180278otf.29.2019.08.06.02.55.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 06 Aug 2019 02:55:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TGS0x2on;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bPXYZJMTNoLajk96h5a6B0Oeqlu3okr2ghnhZP4/sgo=;
        b=TGS0x2onOOLm9F82P2Dy2vI58pxs0x0+O1VabogPfM3WLV3QtGYMZSaNtRVs7+8zs2
         WueVyR7iwRGEKq83GKXgKxNtAenE7SlTtER8GLlNtY3vGFP5tuplGEZKrDMYC5HduK9l
         xiLrkl4+sBJHhtVExPe18N86K0PFgBWx7HKw4BJTxCGwrfg7psngllQUNiPr5ps67jWb
         di6aV7XoY62EqfnnMf12rU4LrmiYYnWRkNVD2wRVtgAN44X5dCRkfTdsFJr3OAfa1+wr
         TGAz1DCVd1i7UGF0ilt531RbMyWsFDpxAc8DqEpXcC1ZEQsIWQfvv6jgK7ywfvTXTzDZ
         +ZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bPXYZJMTNoLajk96h5a6B0Oeqlu3okr2ghnhZP4/sgo=;
        b=uDSfZJx7q987kuAjX1WyVfw/e+FvHLAZmrXYuGzffsir/bMEAJ++UHGztvVI4cAjMo
         OlmLmYr8yUfsHFoZMN1ds7WSm32kL6szTKKbqyts7/TSZfUj8ZFBkpsToTIvuN22soBs
         tAXTGoIIeKwaCW0WWoJpJundIK+yguhe1J6272ka4BM3favY2x7CzLhwB5wizbn45YtM
         9JnPBWOrEGH3eq4uzD2VoyoQXAgIzvZYSDHVFWkMBHfaGCU2rPvn3oj44EE2wgwA2zuD
         AKbuzc9uVdz3DlfLpHd3W5sCv9r1kXogSzJ4K7g5spZs7H2PoaCPlGY4SMBGcXKNkDPy
         dVDw==
X-Gm-Message-State: APjAAAV5JY9haqaZGoqOkW0fGpron0GmKBsQw+ZGe2j9Vr9M1D7sPjjJ
	GAVFXkJ/ZcwanGq125sPstTa0L4cZUVpTkd4mc+RwoVaziw=
X-Google-Smtp-Source: APXvYqzWZa1qsZqm+JYfZ5jXQWKLp/g48frTeyVJ7+fafdVZM3hKs+Bvm2JND1PMykpXrX19zEJrGGHWnP441N5X6Yc=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr2477235oti.91.1565085321445;
 Tue, 06 Aug 2019 02:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org>
 <20190726175032.6769-5-richard.henderson@linaro.org> <CAFEAcA-W7idBRdD-DHxrVqfnBsKmAOPZoQAJkaUVOcjnLnGugw@mail.gmail.com>
 <c7a3ef78-d541-aa0a-21a5-8b4f48db1fd7@linaro.org>
In-Reply-To: <c7a3ef78-d541-aa0a-21a5-8b4f48db1fd7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Aug 2019 10:55:10 +0100
Message-ID: <CAFEAcA-QzmZ8aaKU_qYbTtphgQNmNNTPH_C7YMF0-yJ0ZxeUiA@mail.gmail.com>
Subject: Re: [PATCH 04/67] target/arm: Remove offset argument to gen_exception_internal_insn
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: YOYAY5eEKl+X

On Tue, 30 Jul 2019 at 03:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/29/19 6:52 AM, Peter Maydell wrote:
> > I'm not so convinced about this one -- gen_exception_insn()
> > and gen_exception_internal_insn() shouldn't have the
> > same pattern of function prototype but different semantics
> > like this, it's confusing. It happens that both the cases
> > of wanting to generate an "internal" exception happen to want
> > it to be taken with the PC being for the following insn,
> > not the current one, but that seems more coincidence to
> > me than anything else.
>
> I don't like "offsets", because they don't work as expected between different
> modes.  Would you prefer the pc in full be passed in?  Would you prefer that
> the previous patches also pass in a pc, instead of implicitly using
> base.pc_next (you had rationale vs patch 2 for why it was ok as-is).
>
> Shall we shuffle these patches later, after the Great Renaming of Things Named
> PC, as discussed wrt patch 6 (pc_read and friends), so that the "offset"
> parameter immediately becomes the Right Sort of PC, rather than some
> intermediary confusion?

I think what we're really trying to distinguish here is two
orthogonal sets of possibilities:
 * take an exception, with the PC pointing to the following insn
 * take an exception, with the PC pointing to the current insn
and also
 * take an "internal" exception
 * take a guest-visible exception

(of which we happen to only want 2 of the 4 possible flavours at
the moment). I don't particularly mind what API we use as long
as the naming/parameter setup cleanly separates out the two
orthogonal concerns such that you could have all four without
having to rename anything. Possibilities:
 * have gen_exception{_internal,}_insn and
   gen_exception{_internal,}_next_insn
 * have the functions take a bool for "exception on this insn
   or on next insn?" (not ideal because 'bool' parameters are
   a bit opaque in meaning at the callsites)
 * pass in the specific PC to use

PS: the "_insn" part of the function name isn't sacrosanct:
it sort of makes sense I think but if better names occur that
don't include it that's fine.

thanks
-- PMM
