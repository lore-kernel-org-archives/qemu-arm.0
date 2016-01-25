Received: by 10.25.159.19 with SMTP id i19csp1281850lfe;
        Mon, 25 Jan 2016 06:34:53 -0800 (PST)
X-Received: by 10.31.54.12 with SMTP id d12mr11022086vka.34.1453732493721;
        Mon, 25 Jan 2016 06:34:53 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x233.google.com (mail-vk0-x233.google.com. [2607:f8b0:400c:c05::233])
        by mx.google.com with ESMTPS id k63si18230760vki.44.2016.01.25.06.34.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jan 2016 06:34:53 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::233 as permitted sender) client-ip=2607:f8b0:400c:c05::233;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::233 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro.org
Received: by mail-vk0-x233.google.com with SMTP id k1so74505759vkb.2
        for <alex.bennee@linaro.org>; Mon, 25 Jan 2016 06:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=7u+gd63TLrngMca4mVhDcC1i4CBE2qAZzHMyR67dINo=;
        b=PmYAuAZSugpBGkdT/s4MLUBZiFNgJFl7i2bhcmEyORsv0w0bYMgpQfV975rqFwa0+q
         QqeIbSKjEiLEXhoFf4X1SZl4G4JCX0pWjZtUE/YIiS1iFb/EsgNbwGzv0o7J/0OYUKqg
         k3eRaT9sdPLl+9ROBrgQoVkLCFh+ogUxV1+Uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=7u+gd63TLrngMca4mVhDcC1i4CBE2qAZzHMyR67dINo=;
        b=aqtsHqZl0l3UCk1kl++0BMQ5NpuPYr48ZHToa04O+VGoUlNjB5SzlE+4FISbwJCaiq
         n5zfTzyvUsX6u1NxzHamPpWUBcmep9fLU4epgL5jH0nQ5c4jkwKT32k7Y+d2FfV6RXif
         O3tX/xfevDvSnQGeq+66gkWv778kjjTG7yUQ9hu/NDJhFwfWD9lXB2KLeYQoLvx+Hzh+
         0/mVi3jLm/C4ah3BLAZkCvNJWWK3sw5A44YBF99xwwkU9HAxX4CIXG5IFRBzNZh2JTXy
         6QH4QURuVR9gMPRNP/FQQwHouVRsr5QIuJyZzUO06MhB8B16HtLu01egxCbgF4EYiGby
         gRyw==
X-Gm-Message-State: AG10YOTY2xW3jnG3fggLcJU9fOS6jF6ZVFBcYPR6j3ee7d7/Q27CPtYUuNC4oYxKlbbo1A8myibpOq1yqHCzWTc7pOM=
X-Received: by 10.31.131.199 with SMTP id f190mr3975340vkd.90.1453732493419;
 Mon, 25 Jan 2016 06:34:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Mon, 25 Jan 2016 06:34:34 -0800 (PST)
In-Reply-To: <56A62CAD.50405@linaro.org>
References: <1453130204-655-1-git-send-email-eric.auger@linaro.org>
 <1453130204-655-7-git-send-email-eric.auger@linaro.org> <CAFEAcA9ZximjpaZ_rSdfM1JRyhW9dz1DZfcRRqQR+03heSPg2A@mail.gmail.com>
 <56A62CAD.50405@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jan 2016 14:34:34 +0000
Message-ID: <CAFEAcA9+31D4yGnYr6DgQQLfSmp3wMiLLhuX07sje0oBRiLEFg@mail.gmail.com>
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
X-TUID: Y1qdUTZ6A1j0

On 25 January 2016 at 14:09, Eric Auger <eric.auger@linaro.org> wrote:
> Hi Peter,
> On 01/25/2016 03:05 PM, Peter Maydell wrote:
>> On 18 January 2016 at 15:16, Eric Auger <eric.auger@linaro.org> wrote:

>> Don't we want to return here, rather than continuing with the
>> rest of the function? ("goto err;" with an err: label before
>> the g_free() at the bottom of the function probably best since
>> some of the error paths need to free that.)
> due to the &error_fatal, we are going to exit here. I thought it is not
> worth going further if we can't find the clock node.

Yes, sorry, I didn't notice the error_fatal til I got to about
the last patch I reviewed. You can ignore similar comments
I made about some of the other patches.

thanks
-- PMM
