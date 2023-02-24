Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1674853ejc;
        Fri, 24 Feb 2023 03:24:06 -0800 (PST)
X-Received: by 2002:aa7:96ee:0:b0:5aa:9ef7:4f7f with SMTP id i14-20020aa796ee000000b005aa9ef74f7fmr13179085pfq.9.1677237846287;
        Fri, 24 Feb 2023 03:24:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677237846; cv=none;
        d=google.com; s=arc-20160816;
        b=RtzKJUP+zmXW5CfAe7JPYdp2W2xmSYW4hMorln1Mmd+xahshghkfZOHiFC6d6fD0g1
         9i2w5aqopsdXhcTGeCCcFd2V9JgFg4n7PETT1IOFuQymQYwQM6CHevLF41tPBpCg2d0N
         Eeq1vbFn28ag8V1r0peHQ2SiOeuliCubzWlb9xTmm18rWAkrm3NgGmaiCYnni/4Sns3t
         cIKrdQeSm2Rsc5QCdTvPqXai6LGUt1J5rQ6iVnrMF35VPCJXdv0PUCI4ztaCDj1H8ggL
         N3bgRAcvyhMKU8F1RDxqKJOyymKXto+cZeNQk9n38YFz/gSk81WNmpSTMvyqe2hcQY9R
         GE9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6J+E/BDUi0vbJWCId2Ueel5lv5wUONtEXQKRxXY918I=;
        b=DNZk8zmyRMUtSHY9TL+BSLnYCKh1uz54FWk956nwxQdsZWQ1tv+dwwfCiPD45Klcsy
         OWebQdA6hNIs5RWPo1RKzltRscdhQZHhtNc/MKZWlSpNIiqcVHR9SPRIpQSaiW4krobx
         iEI+d9Gxey2WVH0I2Qbhu50eaG/oaQMf3H22eo9aDhna6EqhoGDqWOu+/8jQbZWFdSRP
         5ZPAJNPuti8shOoEVfWMeHRNtXmsMPnJ2xCDqGZk/RIIb835C+F64nnze6cqwbM8+TVN
         DwjbmOX0a4KPV2zoU7j23PZMtkS9cldo9GXC/OSn1q4iY34z3mpmx4miezDYno9YBc9z
         sKDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XnrSYuAW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b26-20020a62a11a000000b005d6814dcfe8sor2807242pff.73.2023.02.24.03.24.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 24 Feb 2023 03:24:06 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XnrSYuAW;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6J+E/BDUi0vbJWCId2Ueel5lv5wUONtEXQKRxXY918I=;
        b=XnrSYuAWrlBBHnV3rObG4ACwf1EBkyv5ZlBzos4nZrKiM0ydFc2O8tlB0SJrqtOfu4
         AX5u3W9BGKsl8Uzl07torPgoBqZodHRoH3yV4tTRbx+TCj4oZSc8bgpE6gRo2BO/K4Sp
         rAaGqCSQh6ajpwAKJHeN+M/dC4wK1ADg4KPZPQ1zcmX2jAKat2ENn/o7xaCPXGVbQZ1h
         2QspyUPReaTlCohYbG3c2fqqVTAhkhFtdmjZ0UfUdJBW/TLg1evZIrGoYKO1jPRGg980
         s/BD26lRbEkC336rKDVj7VFCQ8bBieExPY6804SQ6Yr/ieIi9631x3gGStn+dogU9Q0H
         3pAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6J+E/BDUi0vbJWCId2Ueel5lv5wUONtEXQKRxXY918I=;
        b=6ICu/56JPzDdXhuF1EQ+NOYqnh9lH0YQTsDJXvBM4gosPjxk1p1VYFLtkAmPcj70fC
         N0Vxf/KUvZrJWw9xghy4ZX9YN/myeAElH3i3xsAIbToTDk/j+kfKRdZ7VWQkij8vY9fn
         UPv7E5SnAkt0Pvy8HEOwH10eewhp4ml3xa3Fi8fM9Grsx0qeAw1rWyajyQwB73Q5X+Sl
         0ObPzNHiWm+YDuHbyuqyWBdRPC5hfXbnqDhJYMREVMQeJUbIU3m8eUhRf9h/jy4/h3t4
         vPnYhBDI35ybhOohFWn11Vx9CX+0xZHDfL6FmSCufK88ZHjTGE3oo4aqcL+fbZsJtqgQ
         EigQ==
X-Gm-Message-State: AO0yUKUipHoCzIffHg0pJnns/vMZyNawv2Y+8V+d4bExccBR00fQAm/7
	RzrqMOLCYj1qaJCqSAKjAufgEypbr0gWyeYN+dVQ4VEaYh3nWWUw
X-Google-Smtp-Source: AK7set/4bp8xqhyi3H0DP43FR8nb78Rh2gX5ctCtE0Tl8bH72KEtzZZjIYZvgA36y1WCyOlPNFsMfUX3/bmEvTTToSU=
X-Received: by 2002:a62:ce47:0:b0:5db:b9b9:ba05 with SMTP id
 y68-20020a62ce47000000b005dbb9b9ba05mr1601002pfg.5.1677237845782; Fri, 24 Feb
 2023 03:24:05 -0800 (PST)
MIME-Version: 1.0
References: <20230222193544.3392713-1-aaron@os.amperecomputing.com>
 <20230222193544.3392713-8-aaron@os.amperecomputing.com> <c79aa318-0fa9-e93e-56dc-c084de47f645@linaro.org>
In-Reply-To: <c79aa318-0fa9-e93e-56dc-c084de47f645@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 11:23:54 +0000
Message-ID: <CAFEAcA-==sYd-icB3Yu3LvJOocrrwXc1Yzzy9m0upn3r05JKgA@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] target/arm: Add CPU properties for most v8.3 PAC features
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, Vincent Dehors <vincent.dehors@smile.fr>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 9GdLl3Jh5kKq

On Wed, 22 Feb 2023 at 22:14, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/22/23 09:35, Aaron Lindsay wrote:
> > Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>
> > ---

> > +static Property arm_cpu_pauth2_property =
> > +    DEFINE_PROP_BOOL("pauth2", ARMCPU, prop_pauth2, false);
> > +static Property arm_cpu_pauth_fpac_property =
> > +    DEFINE_PROP_BOOL("pauth-fpac", ARMCPU, prop_pauth_fpac, false);
> > +static Property arm_cpu_pauth_fpac_combine_property =
> > +    DEFINE_PROP_BOOL("pauth-fpac-combine", ARMCPU, prop_pauth_fpac_combine, false);
>
> For -cpu max, I would expect these to default on.
> Or perhaps not expose these or epac as properties at all.

Yes; unless there's a reason why we want the properties, we
shouldn't bother defining them. As Richard says, having
a 'pauth' property is a special case where we needed to be
able to avoid the massive extra emulation overhead of doing
it per the architected algorithm.

thanks
-- PMM
