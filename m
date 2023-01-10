Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3321779ejc;
        Tue, 10 Jan 2023 08:52:32 -0800 (PST)
X-Received: by 2002:a17:902:7087:b0:189:101d:9bad with SMTP id z7-20020a170902708700b00189101d9badmr65630403plk.59.1673369552045;
        Tue, 10 Jan 2023 08:52:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369552; cv=none;
        d=google.com; s=arc-20160816;
        b=xHJ82sTDr0wKO1bzG9Xf4NYSO1qd095856d3dgKsiTQwmWegw/suR9e0iXAhExd1XF
         XRwHBzgfpFA/DWyaJnsOxbaXlU+ojKZRApIDMb89iZnX+FBlNMCl0fzedO+gYsZdnXpG
         PnISiXOdM7itWkG3aiX6bY/AcCki50wHwYMDmEUOARG1GSsGVclrU/6U1aOzXM4CfS+5
         BbT89RKRgJkca4XOuXVOfzfe75M36oy/TzfOhHgS+y7b7aiu9zAsMXjLFbQKHWaWXWMs
         LrioVJ78q6li1mS5x7Q7A5QSj1hN+jPXzSdhUDftarg7r0s3ablD87RiBAUs8V1NMzNw
         5RIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nBzC//auYZ61cV9tHFKe8ZLwWLqDNW5VCqZt4Tcj6d4=;
        b=QWw2KEDclfsAuu1gslT/L+4XIvb5Vs19lHskUuFJgLfuECAK9kYoiIzb9IkPSop7uB
         lHHhaj9SfaR4SI30rbwUX3EGYCFmrNVUPwbhfttanYyHkpuPPguOqUhFSXi9vShJAOPH
         jQ+LbDfDtVXUPcOVY1sjtuYxvrW7VvxdWV01DMtrPz52KMD5tputtKAWYnjDffrDJtxd
         Q2F0B/gz0D9iOaCBQ01SIscUW50q8dlgDs31/Yb3Xo7JRdFDyPcs79Oq6279iVj6CyDP
         cpe13vb943y5+EJ69cjq3CvHBMxPihOXFNVHC5RY+Jp9rXdGSMWHeuRZG0pWJd9Jiw3B
         HbsQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YPPLDhYq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id j1-20020a170902c3c100b0018907fbba6csor5952732plj.55.2023.01.10.08.52.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Jan 2023 08:52:32 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YPPLDhYq;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBzC//auYZ61cV9tHFKe8ZLwWLqDNW5VCqZt4Tcj6d4=;
        b=YPPLDhYqU/h/fMQgH1lJSUUyXbqnKSFJt+jCCkOBCuP7Yst8D8EmXzLybuYMj9ORFD
         VU2BsxSSJaPKU0DjMyaZUk+Jssw/THA8EHG+lGDxkb+2F1r1KbslmF04OFsU2TmM8Uvm
         cYYZ8LW+crpsOc1I6aPqkLBbl2VXfGFiic+8f5x7yWaMQT3dsjVAUz2uEC4z8gtT3Ig3
         Mcd4CSEnTCbxzTQGY6X3ReZQVx0HmVuygLzSj47/Dnoulg5ZRfhU01maI0gDphTqR90p
         oLKcTflyNEH3H4yUqc6eCpAWIWg7fP/5ZANDVpWfS5qDarjV6fDGq5kdDKRPuGxTPA6T
         uNyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBzC//auYZ61cV9tHFKe8ZLwWLqDNW5VCqZt4Tcj6d4=;
        b=WG3BF0YJenhHEcuxq86dv7LCCL/mNQOJG+iQ/eJC1xq8OnQtLW4S2cSN8/h156nxBD
         vIS/NWYnN3i30Qp8fUAn5Wd3OEPudmWyF/Rz402pbhZ6OrE2wnBKFJXaWdvdS6pKu+Tb
         L8KqLLMrBB1EBWYOYMRltI9yLhc4iEQBmwx1s2VKWOGD7ufDHvTxrBceV5iRu2zmjbHG
         KOs0/HqpcK2mHA/Oa/eWGIZ056Fqw1xcwZSnCFtJoP9wuJhIgySQJyUD6UFy4+L+GZ8A
         58jfPu/DAHjBYx4GvK3agQPPjMlYYb7rIHHlB5fAnba9ZukaVSAvClY7BkNLdMNunZtS
         e5vw==
X-Gm-Message-State: AFqh2kp+W4e7IOKqrfrZbKUZ5JvS37rMkkUrlxEWYLBIRfnU70VTv0E4
	iwauoZO1CgZ08Refsi0Vu19c0eLrBfjDOYEg95nbuzBP
X-Google-Smtp-Source: AMrXdXvw8FeMTAkEAg2W/hrgGMpJaeHRA+v2nrgotuElDzJSzEhjz/IsaCtwoLs3vE391NfTYRixdO5bHfbtblV8s1w=
X-Received: by 2002:a17:902:efcf:b0:192:ea33:5092 with SMTP id
 ja15-20020a170902efcf00b00192ea335092mr2036953plb.19.1673369551590; Tue, 10
 Jan 2023 08:52:31 -0800 (PST)
MIME-Version: 1.0
References: <20230110164406.94366-1-philmd@linaro.org> <20230110164406.94366-13-philmd@linaro.org>
In-Reply-To: <20230110164406.94366-13-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jan 2023 16:52:20 +0000
Message-ID: <CAFEAcA-yEN3F3p6W16vfML4dAHzdwSnOS=759MkqQ0qDpArnaw@mail.gmail.com>
Subject: Re: [PATCH 12/18] hw/arm/digic: Replace object_initialize(ARMCPU) by object_new(ARMCPU)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, ale@rev.ng, 
	Andrey Smirnov <andrew.smirnov@gmail.com>, Thomas Huth <thuth@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org, 
	Niek Linnenbank <nieklinnenbank@gmail.com>, Jean-Christophe Dubois <jcd@tribudubois.net>, 
	Antonio Caggiano <antonio.caggiano@collabora.com>, Rob Herring <robh@kernel.org>, 
	Antony Pavlov <antonynpavlov@gmail.com>, Jan Kiszka <jan.kiszka@web.de>, 
	Beniamino Galvani <b.galvani@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Q41+7lbO/JtM

On Tue, 10 Jan 2023 at 16:45, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Replace the ARMCPU field in DigicState by a reference to
> an allocated ARMCPU. Instead of initializing the field
> with object_initialize(), allocate it with object_new().
>
> As we don't access ARMCPU internal fields or size, we can
> move digic.c from arm_ss[] to the more generic softmmu_ss[].

I'm not really a fan of this, because it moves away
from a standard coding pattern we've been using for
new QOM 'container' devices, where all the sub-components
of the device are structs embedded in the device's own
struct. This is as opposed to the old style which tended
to use "allocate memory for the sub-component and have
pointers to it". It means the CPU object is now being
treated differently from all the timers, UARTs, etc.

thanks
-- PMM
