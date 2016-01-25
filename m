Received: by 10.25.159.19 with SMTP id i19csp1286541lfe;
        Mon, 25 Jan 2016 06:43:51 -0800 (PST)
X-Received: by 10.31.9.72 with SMTP id 69mr9523268vkj.126.1453733031811;
        Mon, 25 Jan 2016 06:43:51 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x232.google.com (mail-vk0-x232.google.com. [2607:f8b0:400c:c05::232])
        by mx.google.com with ESMTPS id d124si18304684vka.142.2016.01.25.06.43.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jan 2016 06:43:51 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::232 as permitted sender) client-ip=2607:f8b0:400c:c05::232;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::232 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x232.google.com with SMTP id e64so75385952vkg.0
        for <alex.bennee@linaro.org>; Mon, 25 Jan 2016 06:43:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=DpIHLJxcZWrqpuY0HTeepk581k29yRSa0KtHYW7TMbA=;
        b=g5RVIRlzoPuB8b8OpJJis5SDgTTQHRiIdzUSwgfToOsA1mCf5l8YEIbFe7hjorynch
         QONqV9l839teOOZ2HdnD8xGytwS8+QQlVN77kzvHsoTj+p2AyxuwenPhKj2O7001vf25
         4i9gx+kkA/L3KDdIQ3cL2J4Uh41qaIJF3364A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=DpIHLJxcZWrqpuY0HTeepk581k29yRSa0KtHYW7TMbA=;
        b=gWqIpEHhYeDqZ+HIcVFZ1PietSp0duSmabqjlAB/l62jjNIXyNAyr3qElikHfn3RC3
         mP/bLQBFAkrDXQaxJ06TuWk/c/wvteMgzz5Kc8ZHaOWGwV3fZCQ7rQUqXtRt4D91+MCY
         hZzbjGnvHx3a9CazEXVz7qU1uLecGoHUYja4rL6FVcKUdg/f9uA75T+nLP0WszKwwrqr
         v4Ka2KZ0bJCp+8GEaDeNsbEAibX2QYKS7hS6MevHFKfy6Ue7/DO0cqDurvE8jleBJmeZ
         LI2MM+NGeooPzHvqwVJTiGfFO60HTjSQ7ei2mR1nSPP3ZbO71p9NCGRQHanNhhXbDBLD
         lBhg==
X-Gm-Message-State: AG10YOQ25Sf11IDUSN5BkwBknSpWrw4K7x7nHHV81G1zmT2gBBL2fRy1WkoSTkFU1lSmHGcJ0XNQB7OxblwXFPGhb1A=
X-Received: by 10.31.52.147 with SMTP id b141mr10862695vka.82.1453733031520;
 Mon, 25 Jan 2016 06:43:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 25 Jan 2016 06:43:32 -0800 (PST)
In-Reply-To: <CAFEAcA9+31D4yGnYr6DgQQLfSmp3wMiLLhuX07sje0oBRiLEFg@mail.gmail.com>
References: <1453130204-655-1-git-send-email-eric.auger@linaro.org>
 <1453130204-655-7-git-send-email-eric.auger@linaro.org> <CAFEAcA9ZximjpaZ_rSdfM1JRyhW9dz1DZfcRRqQR+03heSPg2A@mail.gmail.com>
 <56A62CAD.50405@linaro.org> <CAFEAcA9+31D4yGnYr6DgQQLfSmp3wMiLLhuX07sje0oBRiLEFg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jan 2016 14:43:32 +0000
Message-ID: <CAFEAcA-ByZWz0mpbVJTTsSzyn24M_DnREptu73w=UUtiHK69Hg@mail.gmail.com>
Subject: Re: [PATCH v5 6/8] hw/arm/sysbus-fdt: helpers for clock node generation
To: Eric Auger <eric.auger@linaro.org>
Cc: eric.auger@st.com, QEMU Developers <qemu-devel@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, David Gibson <david@gibson.dropbear.id.au>, 
	Alex Williamson <alex.williamson@redhat.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Peter Crosthwaite <crosthwaitepeter@gmail.com>, 
	Patch Tracking <patches@linaro.org>, Christoffer Dall <christoffer.dall@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Baptiste Reynal <b.reynal@virtualopensystems.com>, 
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, thomas.lendacky@amd.com
Content-Type: text/plain; charset=UTF-8
X-TUID: nKLySTLFZps4

On 25 January 2016 at 14:34, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 25 January 2016 at 14:09, Eric Auger <eric.auger@linaro.org> wrote:
>> Hi Peter,
>> On 01/25/2016 03:05 PM, Peter Maydell wrote:
>>> On 18 January 2016 at 15:16, Eric Auger <eric.auger@linaro.org> wrote:
>
>>> Don't we want to return here, rather than continuing with the
>>> rest of the function? ("goto err;" with an err: label before
>>> the g_free() at the bottom of the function probably best since
>>> some of the error paths need to free that.)
>> due to the &error_fatal, we are going to exit here. I thought it is not
>> worth going further if we can't find the clock node.
>
> Yes, sorry, I didn't notice the error_fatal til I got to about
> the last patch I reviewed. You can ignore similar comments
> I made about some of the other patches.

...so if you fix the 'asserts' comment thing, you can have
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
