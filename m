Received: by 10.25.77.65 with SMTP id a62csp541209lfb;
        Fri, 3 Feb 2017 02:15:33 -0800 (PST)
X-Received: by 10.28.186.197 with SMTP id k188mr676438wmf.25.1486116933319;
        Fri, 03 Feb 2017 02:15:33 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wm0-x22c.google.com (mail-wm0-x22c.google.com. [2a00:1450:400c:c09::22c])
        by mx.google.com with ESMTPS id q73si31977466wrb.323.2017.02.03.02.15.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Feb 2017 02:15:33 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22c as permitted sender) client-ip=2a00:1450:400c:c09::22c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c09::22c as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x22c.google.com with SMTP id c85so21066774wmi.1
        for <alex.bennee@linaro.org>; Fri, 03 Feb 2017 02:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+d7vyeqXoJo5Y4ropFuwdaFzyPsCPUaAJj809y1ZEno=;
        b=f6MmtbFXjmF9Rvz6o6xYKh0/INJXV+4k5FsFbdL08pbc5+wJAycY1Pm1NxmrMCgbX+
         YDhWILKh1SsQnulU0qfrZG6NVGHWQhJ8oRVtj0AJQT3JvyqcSsCFmFGbgKvdYNJ/39nG
         apVUY79OsOqrT/aWCmVFjU/yODYOBw4lJS7Ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+d7vyeqXoJo5Y4ropFuwdaFzyPsCPUaAJj809y1ZEno=;
        b=iQwr3+LwIIf+vHN7SPJD87TJa2M3d/U0t9wDukOUzz/Q+1PQ/wzrYEfkgvjN/CREO/
         HDxKuY31vXawQj1MfDSkHXbmuFGAfflVD8NKsXVqBDbC8InB9etZ7+6ePxpVrf8NRp4c
         X5Y7td8cv76PkAOfNAmTuel8Wiw0I3ilJjBvDGY1ACKNZ09cf/tjm64BqEPxOMnI3g95
         OFN+hvpWGZJZWG6AgLGV23UqXAL65rHlVFQpTE8Hd/3DDtw9bB17tAZFmkbwtNZvbDXD
         uo0h4YH9vQDkyeD8NPUYcchu58pmHnqy/GFfrvBKlzDI0gZdHWIov6t7mJD0rME2HFyQ
         +d9A==
X-Gm-Message-State: AMke39mTcyc7gENEN3eiKyVLvFcKXLlOplWNoXSISYW/0wtjsJHE8Fk9Dn+4qIXW/vBoSUZ70q6oFqTmjWYJNMdv468=
X-Received: by 10.28.16.70 with SMTP id 67mr722472wmq.142.1486116932837; Fri,
 03 Feb 2017 02:15:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Fri, 3 Feb 2017 02:15:12 -0800 (PST)
In-Reply-To: <20170201150553.9381-17-alex.bennee@linaro.org>
References: <20170201150553.9381-1-alex.bennee@linaro.org> <20170201150553.9381-17-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Feb 2017 10:15:12 +0000
Message-ID: <CAFEAcA8pNB3HAFAeh8vjbD7KMD6d4MtHTASsKYazRuq_oaQtnQ@mail.gmail.com>
Subject: Re: [PATCH v9 16/25] cputlb and arm/sparc targets: convert mmuidx
 flushes from varg to bitmap
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: MTTCG Devel <mttcg@listserver.greensocs.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>, 
	Alvise Rigo <a.rigo@virtualopensystems.com>, "Emilio G. Cota" <cota@braap.org>, 
	Pranith Kumar <bobby.prani@gmail.com>, Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>, 
	Mark Burton <mark.burton@greensocs.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jan Kiszka <jan.kiszka@siemens.com>, Fedorov Sergey <serge.fdrv@gmail.com>, 
	Richard Henderson <rth@twiddle.net>, Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>, 
	Peter Crosthwaite <crosthwaite.peter@gmail.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>, 
	"open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TUID: W4IOb3wGbX96

On 1 February 2017 at 15:05, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> While the vargs approach was flexible the original MTTCG ended up
> having munge the bits to a bitmap so the data could be used in
> deferred work helpers. Instead of hiding that in cputlb we push the
> change to the API to make it take a bitmap of MMU indexes instead.
>
> For ARM some the resulting flushes end up being quite long so to aid
> readability I've tended to move the index shifting to a new line so
> all the bits being or-ed together line up nicely, for example:
>
>     tlb_flush_page_by_mmuidx(other_cs, pageaddr,
>                              (1 << ARMMMUIdx_S1SE1) |
>                              (1 << ARMMMUIdx_S1SE0));
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> [AT: SPARC part only]
> Reviewed-by: Artyom Tarasenko <atar4qemu@gmail.com>

ARM parts:
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
