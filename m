Received: by 10.223.150.237 with SMTP id u100csp2828365wrb;
        Mon, 6 Nov 2017 08:35:20 -0800 (PST)
X-Received: by 10.223.144.71 with SMTP id h65mr13608433wrh.41.1509986120937;
        Mon, 06 Nov 2017 08:35:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1509986120; cv=none;
        d=google.com; s=arc-20160816;
        b=exLgbifTZx8xKJOi8kUE5Lp+TC01+UXN3rabP5/tqJ4E7/o60VFcCJFSlARjrRtHmr
         x1NwcqskxKj9bW/iEN4OWP8NyM36zL6oXEnZssggVXvu4MCv2KFIGttSaUgf37QTewUI
         t6PQPaATyYQtWEVg/CvsIQFT6oZ7fEJRLv++eeZwE8AnIutymjs7xoQ8ElVbCm07i4G7
         nj2CmodAchCs/dLUaZ/ogf4O0KaHjbfDL5PdqT2T68qKWKP15eKc2A7Xk7ocLYvkVRIc
         dKYcEFE2EGX+v8SOMIIpiFC81CwDjbOztV99lL/P9DYI3SNCZowzAHyPISDJmIoHYi0Q
         RFsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=9DACZTq7gQ2mlD2HwuLc6nX0LPNuhoblrOpnBFA0Gp0=;
        b=QYnJhgBFizOjOT2UJx9+DuyogKO7wr/M89snfOlRm8rqJ5IZzQXauCom3FedIwoPSx
         RFN0oDui2Ycj0P1CtA88EF/POMMQ2EEON0GPKoSB14baLjKXurGpThJokzVf/cir0F+I
         XPjxXMnkZM2vmIphOtX/j+3byLkfjXSHzedwGpZMtljJ+oFmDcKtJRu8BdJUSdg3d9te
         subyUrJrqiKYXcQ9uBL8xh4JqgzvdS6uhSOy+ps4iLtcTkD1C2wx/ni/S0B39Zie2f3c
         /wH6QWt7lT/cAYI62HsvqVj6AVkkm8Jba0aAP8MDQoM0nHQDIZ6lGvl+GanVWbDnC3Gj
         ZJiw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eDv7QQiq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q2sor2116901wma.88.2017.11.06.08.35.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 06 Nov 2017 08:35:20 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eDv7QQiq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9DACZTq7gQ2mlD2HwuLc6nX0LPNuhoblrOpnBFA0Gp0=;
        b=eDv7QQiqKEE62WvllmNWXXLBAz51eUmmlN9yeZzCZvMTCqSYeNr1xloeIE1BTkJhUk
         AJ4ECT+CLeuIA2PlDz6WiamgHgnu/65Xfw+vjNjmlR5w2q1Uwyxb4/p54x9KKIOjEg5z
         n4sMn8ueqGLFCrbnCdY6Hsz0cLufdceA7Zqo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9DACZTq7gQ2mlD2HwuLc6nX0LPNuhoblrOpnBFA0Gp0=;
        b=EHOEtX6+O2deHZPdgBqQfHBI2K3N4K+DMqLnFDQdQ17ia9Jpke2ZjSaN/Z/k6v23+E
         E9kBdoT5IG/EVRWFC/xnGu5M5mkj2IdaNbEkTjKFNcu8gDYA6Iy9SDKs3uKJ8fzq7nUD
         T06UxQeA6OL63dg07dz1CpQvTj4Vw48TJ4J5WbQ4+2IMqstICsnQyRmoPBte0BMKgC+V
         J4zag4Kas0kACW8OB0EsdnrFVy8jr9FQY0AjBTx5ogvd0NJmJEzozGmZpWJliY3hL6Ng
         4fT0fBw91maXsmOjionttT1X5ekg5hG8k1XCTKdQLZiaBGRUcWz2CdGd3NPN6KGqGxI6
         auSw==
X-Gm-Message-State: AJaThX4JPTqbFcRjQ9LHF62haV8K7IeM62cL5woaGSvKFmWLDp06mYBk
	fBfFGb2ka9ewxQ4znyBYB5xVsQzeyh1uCgPZDoQlQNlYhfA=
X-Google-Smtp-Source: ABhQp+RwdhgHv+C/W2kfFTTHjtWHKThbqY0E0VMc01l7tlOyOS442NVXnsc3HBGr5DJ1X2JZLd4CyxBDVGlT02td0KE=
X-Received: by 10.28.14.195 with SMTP id 186mr5609291wmo.56.1509986120460;
 Mon, 06 Nov 2017 08:35:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 6 Nov 2017 08:34:59 -0800 (PST)
In-Reply-To: <871slbs7iv.fsf@linaro.org>
References: <1509732813-22957-1-git-send-email-peter.maydell@linaro.org> <871slbs7iv.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Nov 2017 16:34:59 +0000
Message-ID: <CAFEAcA-02WxVWayj=ZZS9Wq+6herJm2=jdKbfDAV1iYMvLUTBA@mail.gmail.com>
Subject: Re: [Qemu-arm] [PATCH] nvic: Fix ARMv7M MPU_RBAR reads
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: yaiaKZt7Evd+

On 6 November 2017 at 16:20, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> Fix an incorrect mask expression in the handling of v7M MPU_RBAR
>> reads that meant that we would always report the ADDR field as zero.
>
> nit: you could extend that to: "..as zero because we mask it when
> written".

The ADDR field is bits [31:5], so it's true even if we don't
mask on writes.

thanks
-- PMM
