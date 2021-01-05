Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp16265068lfq;
        Tue, 5 Jan 2021 01:27:47 -0800 (PST)
X-Received: by 2002:a5b:eca:: with SMTP id a10mr110364661ybs.447.1609838867562;
        Tue, 05 Jan 2021 01:27:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609838867; cv=none;
        d=google.com; s=arc-20160816;
        b=Rr1jBGmOJ6u5gH84X8EdbbH3qe4WW7dfYdnMM7HA/NuPetsun5IeNNpw+ibL38BYvZ
         wLmGKUBG4bwDukt31TfSnFr07IHSVogTNYrLvfjk8YZMzLfnDpJbZN7SiFEU2rnjVRH1
         qfCNjmPbDTY0Rv5iuU+QBSdCDrDdoG2e4R8YBcv+mLm9OT3SXFaAY79dMnv3/hEoxRft
         VrkGXWuDavBeaLRDaBRVbFDH1gl3iCQxJfDIwdQozeg3IEfl0oSP4ywMcOXF7X4boj13
         JqOdTCIwBwioOESS6O0ZAZva0WunN0a0VWhOV7MK22jIacOE/+lu76qBQ8IvFl0rfx6X
         Y/eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=byKgXZAveVpGlvN1y8RqU8Pv1Mo+mr9U+5WKhQwPZDo=;
        b=mGuHmRPXBY7aD77MLdcmnOhR+Cnn4mQkNBrjHsgiAATq9woD+zfVfboESvl27FEw7l
         vLoaZH7oYtF9isd00wC5DVt/3oJTE/BWRt3Qvxh/F4iJES/MK12wNXItrTgqpIRRVp9y
         h5h/2w28bW98LO1RXZaTnhekvXu+ZHnsPJONl2cdCbEMZqVTaVUbWRvAJ4cGzG3jbuVz
         eIdMfFmV7rsthVR4tRBuxtSO/UEh9yRd67JmcVh8eaclDlUagNE3xZIzH9FmsF5sTSCo
         m5/G4iUo1l5J8fBZuwrQX2upFzYwa5dI/gMUL4BsKEhUKfYON86WPzwozAi/H4D+yKQR
         NJeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=exqvpJ4Z;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <bmeng.cn@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x10sor14772193ybk.150.2021.01.05.01.27.47
        (Google Transport Security);
        Tue, 05 Jan 2021 01:27:47 -0800 (PST)
Received-SPF: pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=exqvpJ4Z;
       spf=pass (google.com: domain of bmeng.cn@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=bmeng.cn@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=byKgXZAveVpGlvN1y8RqU8Pv1Mo+mr9U+5WKhQwPZDo=;
        b=exqvpJ4ZWZtlhHMGufQsm34Nbj3EtqAMfX/YnHuaJI0iPOu+LzpymD7XzKHdOumP0U
         k+Zq9CTPOkshgZBKaJPh8bYN84hymhWcGJEddVrUHF43uNzOlPdDq957blhqkp/HzuVk
         Qo/CcUUx8WQNGVqv5oD3ig6yjO2otHEtawnX22ZVzClORJyXEidcYTMaiNNXQ3Ofc6Ak
         JQd7p1a/Ut3V0PL5cL3N2key0zIpfUOtpjNvjezQc902NhEW8f7PoUL/wnRADaAyBavB
         qFZTiSoWbM7L4FNAqb4i/q0DCm9JyJRUfmSXsIjZmklB0M9zqxasRART3WYcMH2dCoHD
         cFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=byKgXZAveVpGlvN1y8RqU8Pv1Mo+mr9U+5WKhQwPZDo=;
        b=W75ZTNvjCfC3jv21E5gqAEwYtGgWURYoDPhYb/xBzkvieMRyFFvtrRNpRGpA5hq7sk
         v07m/+7QcYkj8y0BwY+I1fFXix84XBpiWAJlxAJJy1yyMt2io/0DGajwLeVTpgAQ/dB7
         YSigPB49HefL3yJTREWFlbALEoD1O1QQJMueNCxlo7WU0ttkogjhTVEctoPR8el4ZM4U
         CibbV0xi3b5gpwWB3/4MvC+sB6s12P9/f3yLwKI6eHs7N68ijHI4FR7RSdP4AlFHHjzc
         BDPx986GQu5piFImNE701XZtzzHwb1Ls9dnZlSP3kQTsrZFYuYI7o/+3vJ//4uAsavGI
         B6hA==
X-Gm-Message-State: AOAM532rFhmGSMz5x3PUTpJLIeynNUFgMyp4G9e3LOTkCtWZZ31c+h+/
	1/inLlJOHcR+ryieXh/jXdk+EyHD8xm55xKYEfiv0c6E
X-Google-Smtp-Source: ABdhPJypCQEtYsxgj+yQ61ZOb1oC0D/z1+2/ALfbrTbG1TCYRNyxQ0RJWdd5nZiBWEXOlaW+iAR/Akr0sfTnsS9Mang=
X-Received: by 2002:a25:aaee:: with SMTP id t101mr105435222ybi.517.1609838866984;
 Tue, 05 Jan 2021 01:27:46 -0800 (PST)
MIME-Version: 1.0
References: <1608704767-9317-1-git-send-email-bmeng.cn@gmail.com>
 <1608704767-9317-2-git-send-email-bmeng.cn@gmail.com> <CAEUhbmURMNzT5T_LOVvi+m0658jVZhXrEuP=JhJL+pVCbDFuLg@mail.gmail.com>
 <87lfd73fcr.fsf@linaro.org>
In-Reply-To: <87lfd73fcr.fsf@linaro.org>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 5 Jan 2021 17:27:35 +0800
Message-ID: <CAEUhbmUciFPsbQJWQy-72n9cQbPyRMcP6HYaL5imo7=pXhJ=JA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] hw/misc: imx6_ccm: Update PMU_MISC0 reset value
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>, Peter Maydell <peter.maydell@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, 
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Bin Meng <bin.meng@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: JOhomTUWe6sD

Hi Alex,

On Tue, Jan 5, 2021 at 5:25 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
>
> Bin Meng <bmeng.cn@gmail.com> writes:
>
> > On Wed, Dec 23, 2020 at 2:26 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> From: Bin Meng <bin.meng@windriver.com>
> >>
> <snip>
> >>
> >> (no changes since v1)
> >>
> >>  hw/misc/imx6_ccm.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >
> > Ping?
>
> Looks good to me - Peter should be able to pull it into his tree soon.

Thank you for the review.

Regards,
Bin
