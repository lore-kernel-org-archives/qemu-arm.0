Received: by 10.25.0.144 with SMTP id 138csp1531311lfa;
        Mon, 24 Apr 2017 11:15:25 -0700 (PDT)
X-Received: by 10.223.153.116 with SMTP id x107mr6958912wrb.55.1493057725038;
        Mon, 24 Apr 2017 11:15:25 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x229.google.com (mail-wr0-x229.google.com. [2a00:1450:400c:c0c::229])
        by mx.google.com with ESMTPS id e125si319528wmf.158.2017.04.24.11.15.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Apr 2017 11:15:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::229 as permitted sender) client-ip=2a00:1450:400c:c0c::229;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::229 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x229.google.com with SMTP id z109so96470876wrb.1
        for <alex.bennee@linaro.org>; Mon, 24 Apr 2017 11:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=MgsoJ+4MBVfFoxnR6j4xBXuRQo5yrsF3TvQBFWNEDbY=;
        b=UKtJHuQ0VBy6p5i3OgpplSPWhastutxk/3YbQ5SCwZO432bPkjU3m+u3mdM5OA1anL
         Q8q8yVzDNQM1uMyeJYGs0sLA8cVIyYdwP/MrA9Fpe3yhLfPXJH1c8puAqFog3m/DgemT
         Gg3On2uFsp2Hcny2OMByz6AS7SPfmNiOFbiLk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=MgsoJ+4MBVfFoxnR6j4xBXuRQo5yrsF3TvQBFWNEDbY=;
        b=ITioCaZB+4IXJSObV0TltgkDr2FU5xryvbmOeuzIclB0vW6aYoOGY5Ipxbe43JWa0d
         MCdeJksO/vOzSsyeSR+1s+BJQ2YC4XOgXnt106888gcXXQLvh5EG2resIqM7WIftXr+W
         xVSXIL39MutjleYLK4tf5QWNrV9GbMnmAAVnFO2JZBmta4NaLEWx288enGd9CsAoJeNl
         ELDvOx8UcLqjbp67pudIaKCVJFSJjJ0hCK9RRyma7Uytmjss1Vk58Ue2wWyoc4JDv2av
         Fo768Odj4B9mRjJX70l98TyCu3jAHtg649joN/SDT8ZfiLqMJdZzvp5qUDK0CfAoZFgb
         Ec9w==
X-Gm-Message-State: AN3rC/7zh7CigWBwvCE5w0QVhPE7M73eWSNB1k/5z19v8bDPMOAdnNSh
	qEARou1W3cUMOPAkonONeKvW9PEmccCQTVA=
X-Received: by 10.223.152.238 with SMTP id w101mr7768292wrb.151.1493057724772;
 Mon, 24 Apr 2017 11:15:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.68 with HTTP; Mon, 24 Apr 2017 11:15:04 -0700 (PDT)
In-Reply-To: <1493051615-30715-1-git-send-email-peter.maydell@linaro.org>
References: <1493051615-30715-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Apr 2017 19:15:04 +0100
Message-ID: <CAFEAcA_mjVkKyTdJy8uNTyft2L=Gv8LGKtJtxJrHVwP04oPcew@mail.gmail.com>
Subject: Re: [Qemu-arm] [RFC 0/3] split core mmu_idx from ARMMMUIdx values
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Cc: Richard Henderson <rth@twiddle.net>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: AD3pO0rgoFKv

On 24 April 2017 at 17:33, Peter Maydell <peter.maydell@linaro.org> wrote:
> For M profile, we're eventually going to want some
> new MMU index values:
>      non secure User
>      non secure Privileged
>      non secure Privileged, execution priority < 0
>      secure User
>      secure Privileged
>      secure Privileged, execution priority < 0

Hmm, Alex and Edgar were definitely on the cc when I sent it but
seem to have fallen off it. (If you got a copy anyway then you
should probably check whether you have accidentally told mailman to
"filter out duplicate messages": you never want this setting
enabled, because it means "silently drop me from the cc list".)

thanks
-- PMM
