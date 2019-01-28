Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3126622wrt;
        Mon, 28 Jan 2019 02:43:34 -0800 (PST)
X-Received: by 2002:aca:51c6:: with SMTP id f189mr5469642oib.281.1548672214466;
        Mon, 28 Jan 2019 02:43:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548672214; cv=none;
        d=google.com; s=arc-20160816;
        b=IIUo5MoFidbksVFujyR+TVc9ApHM9loQG4RUtnoLXsdiGg4qKNztvgKlhBuZ+dkkVu
         8V6cijIYym0la0FdBy7+8FDcHkM5rMaO5KzBk140WGIXQrBWX44L8hKiSqwLzM/Q/t1Q
         /KBEJN/xgRgH4lHn+GP4ZwZYw+ITdGu1/ipsDOmfUuDmW9cqaOTbyUJUEafvK2d5fpwb
         xHn+MJ78xqMuIr3RzU5L206hbNJsZe8Oj+sbp/2gMhS8mgpYApD9DWKVoPzgj3AO3p4p
         m2VmEvh9TLVAdCMLOGwAi8kp2//SBdJCCuVwF2O3ZpDMrm1GVoeE99ZYMT6f9zRk+TlO
         XwGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bPvhoLmLBNupsuL9osXGmBB5uQ/L0FlSR/LIITXqwNE=;
        b=TUwBF2jeaE8BW6DhFpAOynxwncJYIgSv1WyxEgDszXu/GGgdU7XlMLz43uQp5DfNqt
         t0L7WqP+mxpfg+dFruOa5aNX50RXWLNprfmmH7oUvgWiPIzNLUzkSXiejseUEy6ZkGIg
         EtpnkS9oGBtlnR1bSFLzlNFEJE3EzuhHYKezDdkJWAirvWjqjNgo9JkLYYbhPR0hv2PM
         806QyTIGOpYMxFN4sRrkcGdG/IpOvsFtKQlIun6LkcvOovZ8ht/PzpHWRiJqvVFjg702
         QFhMcdCRFRSOY2b2PvN6lVLiS5+IOJ+vA64GBEMP2Uxs+E/PVTsBzp/igD3bOilrlpBt
         Qv1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TEAmlXCq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 89sor5410109ots.170.2019.01.28.02.43.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Jan 2019 02:43:34 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TEAmlXCq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bPvhoLmLBNupsuL9osXGmBB5uQ/L0FlSR/LIITXqwNE=;
        b=TEAmlXCqy7P3HhaL+UXYisgrxqafadlEkifUMDyeqIYht9xBSwdLv7u7cZlGGUPOo5
         Rk5tXU0fg8Qg2bXMjtzIw9XChWuEmnNdz4uy4f9ovfAv2Vla3uvUEqjs7863XeNns7+F
         xZm0Jt7u+UixdqzIuR0bUUBLiSTzcvSn3xUrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bPvhoLmLBNupsuL9osXGmBB5uQ/L0FlSR/LIITXqwNE=;
        b=l7TW127eqFopF+CdiIVlT5wBWHUNE7uIyx2ai2uGVyoiCEF7IGnCu/mN+gsLrtpvhj
         aWKm5qWsikFMDpHoMeGnvyZ+xwlvK73NgkGKhZtFfR/p4sDK92e5rs0rdFcZLRjtko9e
         JYvKOzlVqN75hYgEQCXAlkFuhqxvJcQkKyiuK0YR0yQm6IzQ5L0ed3pq5Ry+6LoOrokS
         QoYKZaZhfBCLatjxYeULOYBvxONZqAYMEGUwbO+y3qJ0YWixJHcSCGL7bNIVgPGIASrr
         0zUnMahfmaH5UGxjAWTPjor0II6RLXD4AROHDY5l50piLDSGJKmTTvUpgg/Yt0KbY0wW
         Uq/g==
X-Gm-Message-State: AJcUukcOj24L8+9H5mQwhcdPNHKg/0T/jf9FNbCoDCYwudFZRN+IDoGB
	pDF1DDjOr0C5LzEfLA7ocq9gfl12WVUnIqsDEqMVB7mq
X-Google-Smtp-Source: ALg8bN55Hhu2kS2keTuzYE2VSi2qBYCRoVyWOr5RCnFG9zoIkzeode4TDKTYw8va3rXOkgJOKV0lz6gX8St8pz+kE28=
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr16662941oth.317.1548672214159;
 Mon, 28 Jan 2019 02:43:34 -0800 (PST)
MIME-Version: 1.0
References: <1544173675-14217-1-git-send-email-hongbo.zhang@linaro.org>
 <1544173675-14217-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA8WF1nKfgQWZ11GgMzgLxOtGwoJS9zyeFQkm5ii5GLrpw@mail.gmail.com> <CAHmQWvD-gqxR+7dOG3BKA-5cGA-JBb4SAfJWpRAtqrOkfRw-kw@mail.gmail.com>
In-Reply-To: <CAHmQWvD-gqxR+7dOG3BKA-5cGA-JBb4SAfJWpRAtqrOkfRw-kw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Jan 2019 10:43:23 +0000
Message-ID: <CAFEAcA-=g6SeFwchRqo-+BaqH+def5DTcEXo3n3CZbMp_zr_bA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] hw/arm: Add arm SBSA reference machine, skeleton part
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Ard Biesheuvel <ard.biesheuvel@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: LM19tSkCSDT4

On Mon, 28 Jan 2019 at 10:16, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>
> On Tue, 22 Jan 2019 at 19:42, Peter Maydell <peter.maydell@linaro.org> wrote:
> > Comment says 256M but the size field says it's larger...
> >
> I calculated, 256M should be 0x10000000, 7 zeros.

Yes, you're right, this was my mistake.

PS: sorry about the other blank mail, the gmail interface seems
to have changed somehow and is making it easier to accidentally
send a no-new-content email :-(

thanks
-- PMM
