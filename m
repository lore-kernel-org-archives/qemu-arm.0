Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp972695lfg;
        Wed, 24 Feb 2021 15:10:23 -0800 (PST)
X-Received: by 2002:adf:8104:: with SMTP id 4mr319010wrm.265.1614208223740;
        Wed, 24 Feb 2021 15:10:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614208223; cv=none;
        d=google.com; s=arc-20160816;
        b=wOsiTRjzT6s+ccV2oZJ4/kpxq6KG/XsoNFIclc0ifU76tgwlNS61g5SVCTI25+h+NK
         HFCZzz7FcSaaWqXoYrGMw0zF6zxxioJzesM9pzvq4dh8GqIQ/20IJzrPrkVGh+IDmXhA
         ton88n6iqL4wlwRi9CgKj3J0MJBaEFxU+MFohey+xPgSbZ/eMKjZy68wbCi5v385J7P9
         Jz7nXX4wJWWKN/JOvD2vxIJhrFQtVyDp/ih6HWZB7sAmvGjcZo5RGL7v9XQ3JQxB1RZU
         KLXS2esCjouRalwHLW/XKQxyU/tmIwY84qJs1f0dw+70TV++M/MFZmJMWx3ttTixMH8m
         GoRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=cKYk1BlXdXmONJSW0juNzIv8A0kBbLqwqifbrnnfbjI=;
        b=HU9UZAy9UgPqcL6PoM2MQ2BlAPyTG9espeYoPpWlvIzNsBZNg4Tctj00ZhMwXtpT4v
         nJvuSWLKzZGLej1FMOTk8aqGP8fZ8HUR8aPXci0IyaxDUQ6lC6RuYLnWlBtv1HWRhccF
         cBmSDVCcoWeV6aPXv6aFy6i6nV9K1w6aoV7a3vJ7Myb5G1H/YoxrZ5ZY6Jbe0wPhNEPp
         qpBTbURlkraK6aSwfqI2vAvg6kh+wpaz+dQ/U85QXGWVaZsgxz7iRE8SzK909FHdhFpP
         gE0QqTSMbe3TrMUezaUpoPtptTnMRSq939Xf0jaXQQR2Dyth2yQeLw1fI9hVG+q+5MXh
         EQ0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DL1lP3nV;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o83sor1923545wma.29.2021.02.24.15.10.23
        (Google Transport Security);
        Wed, 24 Feb 2021 15:10:23 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=DL1lP3nV;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cKYk1BlXdXmONJSW0juNzIv8A0kBbLqwqifbrnnfbjI=;
        b=DL1lP3nVRGCWTZNm/8OIYpSMH3qwQYZ5+OavUiHMwsGhPufcPrB3bgNMtV35o6UYgW
         Ir/ARPCnSrV3etM2NCA+xryQDzUrnEDkfr8CZBm+MbTNXW2rMvcfHkmhr1h1RNXQE9cg
         Ix7foQksCQ1XO9rhYS4ffsLRoNnL4scNTzyAzFpeFPXnPuBChGIlcmA6vTdBX70hYwkd
         m9DKYDPiJoihDgHpoMoN/qaTWvPDxLpstxJSzQ1UtNSJRf09ft84oJpkeCqKpkQsgRe9
         SFXIXyD3IMbDyarG/BceRBoMzA9xt1u9WbfNpcjLX0KJ15fnCzYfJ1bS6NiMT5im3OF6
         qdrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cKYk1BlXdXmONJSW0juNzIv8A0kBbLqwqifbrnnfbjI=;
        b=o138dUDLuXaLSdRa58da8g4JEZNodKx3hC90WsjMDRywlXEmAyCtZnR8FCJXoMTkqM
         WSMcmiNrCl6oj7Fom15w/PPcrfF+Cq9J7cwrrRILz93mL0SBQrj0VbrS8wIWvYm+lMfu
         jo7sQ9+ukt19B8LSS6FfrW3BZdSV8OZjgrscR4DUUe6AJWC5sl8pkiMlBeXSSUwhAp1S
         nXavcnClCon7ztpmucwR7hU8gd68bXQ5hj9lA8zrnZjPnPUVzt5LOW2enEtqg1MHGEXZ
         QLZDYIiz0+ICXkdXf8Wpcii2yrw9Y/Ll6+r5DDy4xELGybXEWT49cHBcifxb84J7ZLF9
         ADRw==
X-Gm-Message-State: AOAM532/+0y5Lb55gWxsaRdXc4TfQWC+6qAVYwyJ4rM7PMqS8Q7QrjOo
	HgE0uhVxSsIKC3TjwunqBMQ=
X-Google-Smtp-Source: ABdhPJyaMjgCMJ7BemwaBD6vGDaigJ0mKqS5hl0H5it7LgWcu9Neua1ur0uX5iErtzMgZQy5KZ4W5Q==
X-Received: by 2002:a1c:2846:: with SMTP id o67mr330302wmo.188.1614208223407;
        Wed, 24 Feb 2021 15:10:23 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id i3sm6257477wra.66.2021.02.24.15.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Feb 2021 15:10:22 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 1/2] tests/acceptance: replace unstable apt.armbian.com
 URLs for orangepi-pc, cubieboard
To: Niek Linnenbank <nieklinnenbank@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Beniamino Galvani <b.galvani@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Pavel.Dovgaluk@ispras.ru, Willian Rampazzo <willianr@redhat.com>
References: <20210223225327.26700-1-nieklinnenbank@gmail.com>
 <20210223225327.26700-2-nieklinnenbank@gmail.com>
 <5556626c-0b4f-0de3-9cb8-d174cd210b5c@amsat.org>
 <20210224191341.GC1074102@amachine.somewhere>
 <CAPan3WqXre=Rau4-jOSE2u=GGRO8hSKzuuWFSN4xP3wbpvQ-Dg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <6309e75e-2aa4-5bc1-66be-0b29f408f179@amsat.org>
Date: Thu, 25 Feb 2021 00:10:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAPan3WqXre=Rau4-jOSE2u=GGRO8hSKzuuWFSN4xP3wbpvQ-Dg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: n8yYyLw1u3ER

+Thomas/Daniel/Alex/Peter/Paolo/Stefan/Markus

On 2/24/21 9:02 PM, Niek Linnenbank wrote:
> Hi Philippe, Cleber,
> 
> On Wed, Feb 24, 2021 at 8:14 PM Cleber Rosa <crosa@redhat.com
> <mailto:crosa@redhat.com>> wrote:
> 
>     On Wed, Feb 24, 2021 at 10:12:10AM +0100, Philippe Mathieu-Daudé wrote:
>     > Hi Niek,
>     >
>     > On 2/23/21 11:53 PM, Niek Linnenbank wrote:
>     > > Currently the automated acceptance tests for the Orange Pi PC
>     and cubieboard
>     > > machines are disabled by default. The tests for both machines
>     require artifacts
>     > > that are stored on the apt.armbian.com <http://apt.armbian.com>
>     domain. Unfortunately, some of these artifacts
>     > > have been removed from apt.armbian.com <http://apt.armbian.com>
>     and it is uncertain whether more will be removed.
>     > >
>     > > This commit moves the artifacts previously stored on
>     apt.armbian.com <http://apt.armbian.com> to github
>     > > and retrieves them using the path: '/<machine>/<artifact>'.
>     > >
>     > > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com
>     <mailto:nieklinnenbank@gmail.com>>
>     > > Reviewed-by: Willian Rampazzo <willianr@redhat.com
>     <mailto:willianr@redhat.com>>
>     > > Reviewed-by: Cleber Rosa <crosa@redhat.com
>     <mailto:crosa@redhat.com>>
...

>     Nope, and I'm having issues with those URLs.  For instance:
> 
>        $ curl -L
>     https://github.com/nieklinnenbank/QemuArtifacts/raw/master/cubieboard/linux-image-dev-sunxi_5.75_armhf.deb
>     <https://github.com/nieklinnenbank/QemuArtifacts/raw/master/cubieboard/linux-image-dev-sunxi_5.75_armhf.deb>
>        version https://git-lfs.github.com/spec/v1
>     <https://git-lfs.github.com/spec/v1>
>        oid
>     sha256:a4b765c851de76592f55023b1ff4104f7fd29bf90937e6054e0a64fdda56380b
>        size 20331524
> 
>     Looks like it has to do with GitHub's behavior wrt quota.
> 
> 
> Indeed. Just this morning I received an e-mail from github with the
> following text:
> 
> "[GitHub] Git LFS disabled for nieklinnenbank
> 
> Git LFS has been disabled on your personal account nieklinnenbank
> because you’ve exceeded your data plan by at least 150%.
> Please purchase additional data packs to cover your bandwidth and
> storage usage:
> 
>   https://github.com/account/billing/data/upgrade
> <https://github.com/account/billing/data/upgrade>
> 
> Current usage as of 24 Feb 2021 09:49AM UTC:
> 
>   Bandwidth: 1.55 GB / 1 GB (155%)
>   Storage: 0.48 GB / 1 GB (48%)"
>  
> I wasn't aware of it but it appears that Github has these quota's for
> the Large File Storage (LFS). I uploaded the files in the git LFS
> because single files are also limited to 100MiB each on the regular Git
> repositories.
> 
> With those strict limits, in my opinion Github isn't really a solution
> since the bandwidth limit will be reached very quickly. At least for the
> LFS part that is. I don't know yet if there is any limit for regular access.
> 
> My current ideas:
>   - we can try to splitup the larger files into sizes < 100MiB in order
> to use github regular storage. and then download each part to combine
> into the final image.
>     im not really in favour of this but it can work, if github doesnt
> have any other limit/quota. the cost is that we have to add more
> complexity to the acceptance test code.
>   - we can try to just update the URLs to armbian that are working now
> (with the risk of breaking again in the near future). Ive also found
> this link, which may be more stable:
>      https://archive.armbian.com/orangepipc/archive/
> <https://archive.armbian.com/orangepipc/archive/>
>   - or use the server that im hosting - and i don't mind to add the
> license files on it if needed (should be GPLv2 right?)
> 
> I'd be interested to hear your opinion and suggestions.
> 
> Kind regards,
> Niek

Some of the unpractical options I can think of...:

- do not contribute tests using binary blob
- do not allow test image >100 MiB
- contribute tests with sha1 of (big) image but say "if you want
  the test image contact me off-list" then when the contributor
  stop responding we remove the test
- have anyone setup its servers with tests source and images,
  without committing anything to the repository. Interested
  maintainers/testers are on their own.
- testing done behind the scene

TBH I'm a bit hopeless.

Regards,

Phil.
