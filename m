Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1632452lfc;
        Mon, 9 Mar 2020 15:01:49 -0700 (PDT)
X-Received: by 2002:aca:534d:: with SMTP id h74mr901180oib.173.1583791309089;
        Mon, 09 Mar 2020 15:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583791309; cv=none;
        d=google.com; s=arc-20160816;
        b=qKTp6CioFBiqmQqHFRy1MlAHcb9TL537Cc3x8kIaGxAiFjjdT3QYRMiQtrhv+coCMA
         0341a0kvNl69uRnM3umWske1VJTKPShGgbTSFw5rVhK/qlhwEfbS1w3mDBoZ04XRY27W
         jtJ+nLyaSYRvcknD1GRDvrqQDndlMgfzV+5rd5ULcFcei8dLaoCrHf3K8H3e9Cmc5O3Y
         Pq6zRlkPkn7GzHcZ2Og7acShTzI784artFsFHc3GsBkDjfzR8nSAAftPPUdyXtdURHW/
         53fKQdU31rR+DMKDyRYons2V3c9nU7eaoXxm/Yv+ObxCnIugHxd+IXborfy72TMtv4uw
         9qvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3D5R0ByUMwnpIn847TV33cL0I9HbhgiAN2Aan/suScM=;
        b=IP8ENUvMn7ebL8d0GPBpOJF2828LddXuWByngQIgtgcSJsq2aUXsz6Eok1RTQg492z
         BvBuN0ZNiyv+np7naWvugWiGJ3m11m914A0Oy5a5jxmDr/IAuLEs+0ewAjEDlB7Rhz/5
         bFCVbPS3Rf6TuaMGOwoJMHnwtUYKoTpOEFi3w6jQhl7UcTozm/XSAy0WwIPqpCpgTzmh
         WKXYFovvsrrHv6fgIN1X+AjHkW9O1W6be5LaneqlJI7zhGDwK3PtEXdU4KvXwJ0AoqDG
         3zq1is0o1UFsj34kQCqygg74Hrv34olyZvI0ccQgCaRhNY8jRNegewdYAybajDF89CiH
         ifcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ry/FyWth";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l18sor6651526otd.80.2020.03.09.15.01.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 09 Mar 2020 15:01:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ry/FyWth";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3D5R0ByUMwnpIn847TV33cL0I9HbhgiAN2Aan/suScM=;
        b=ry/FyWthWse39bybxdnEG99rkuMhdOLa5GMlrOblPoLE9hjofdNwoLojVN6/T3xg2D
         DWx3ssd2rjPJ10A5dVGQszGfoXTbsuyNC4tPxEQtcYwUvsmBJ8E18CZ8ntaJdNNBOZ5s
         rwVN6tu71h4xyR0LtRPO78mL1cjmaBWTNqHypIZIiIK+AOEWA6DSThT+bU87QmjdvZMn
         jttkiDvSczzmWEoWGS5/F0KFPwSCFC7MlBoPi6AVxnexcs5jcjX5ldsSb4qcY8vJxnYG
         5g8t1el57eJUu5ZWfSq4HdSGP3fMnXDINDVFqxtIqLV81q5JvuptiHO3feHlRlgrR2TX
         0p4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3D5R0ByUMwnpIn847TV33cL0I9HbhgiAN2Aan/suScM=;
        b=HIHjU1mUX1Cua7tLOJmTrVVz0lQW6k9HIc/ugOG1xh99cpDwdO5r9w997ptLivJeAC
         VTqfEYoCfVVlL7wJ52+Ej63t1PK2elrgAZz+5aqwzoklExtb0RGKDLm+Rg8uXg1+OF6R
         Fz8RGX3E9Fy5eUd6HJSncCRLoVjnw3Gss/b84lK2FZPiv3Wf+E/tdjbxzZ8uQpB/zK9z
         4Dg0IAEWGNv5Nm2TZ1/OD/K33IWqITpxPEwDUh4CFyuXWDtY6RoIqy+Ox7JipbDiWVyv
         Wxm4kj9cn1BHuftbJN8EOPQyI/YfZkT099nd8L7x05wbPo7qhKAGXPFlbRI3QNGc5rG2
         PQ+w==
X-Gm-Message-State: ANhLgQ0kaMGaytv6o4wNjFLrwPM8Hz7zRraHR/sHtsHktwl2uwlHEdlu
	8+mlCunFtUh0FXH453C8YrYEnxEVGJImA4mZMNcQnhbg
X-Google-Smtp-Source: ADFU+vsOPsYBcEuBVILDzLeVArfQdLdefbUjXFSF0jilPRltyA4UBnMuIW45MdPVbg4LnuXXVSWM4s00rfXvCCOvqjo=
X-Received: by 2002:a9d:1920:: with SMTP id j32mr5938639ota.221.1583791308605;
 Mon, 09 Mar 2020 15:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200301215029.15196-1-nieklinnenbank@gmail.com>
 <20200301215029.15196-19-nieklinnenbank@gmail.com> <871rq876h3.fsf@linaro.org>
 <CAPan3WrNnrnngwE4pGeYpR9HS7Vr936-ojPZZovNo8ZdoAA0sg@mail.gmail.com>
 <CAFEAcA_6Lm-JwbXFLWeetc7+fhnrc5m2+YU28ymFw0MSoKOhwg@mail.gmail.com>
 <CAPan3Wo2Nf_d4AxsV5=sfOxv66rmQNfN==rpMn9=FtM5cZG9rw@mail.gmail.com>
 <CAFEAcA-2-tz7F1vmbggpLnc1SSX+_W5pij-w8Vgjx+vqr-LRUA@mail.gmail.com>
 <CAPan3Wr-oS-QRxmCDPXLRBG81yqjnp56B2WNuxtBMOxr2b9D6A@mail.gmail.com> <CAFEAcA_rY1hXNbzsj6EJvKzODX_EWdTOK1Gfxi2Jbv+UsYxRtQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_rY1hXNbzsj6EJvKzODX_EWdTOK1Gfxi2Jbv+UsYxRtQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2020 22:01:37 +0000
Message-ID: <CAFEAcA-m2GJ01=-aEW0VLrY-nJgOpAMFOBF8+0jXeW+H7wkM-A@mail.gmail.com>
Subject: Re: [PATCH v6 18/18] docs: add Orange Pi PC document
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: OBRysDe7HR2H

On Mon, 9 Mar 2020 at 20:12, Peter Maydell <peter.maydell@linaro.org> wrote:
> If you're ready to send out the next version before that,
> then leave it with the include:: directive and we can
> fix it up to the new structure later.

PS: in case you weren't aware, softfreeze for the 5.0 release
is 17th March, so if this series is going to go in for 5.0
then (a) people interested in reviewing it should hurry up
and review patches 9..18 and (b) the final version would
need to be on the list sometime this week so it can go into
a pull request by the 17th.

It's no big deal if it goes into 5.1 instead I guess,
but it feels like the series is nearly ready so I figured
I'd set out the timeline if people want to push to get it
into 5.0.

thanks
-- PMM
