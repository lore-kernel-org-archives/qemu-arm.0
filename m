Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp9238080lfc;
        Fri, 19 Feb 2021 10:24:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWYpABlj7o09vLR5pLok+y0RMxZ6lDEFHIe3zOTx0dmRxPLujQeVtYxJ8uBQOXCAoriQE/
X-Received: by 2002:a05:6402:1854:: with SMTP id v20mr10346744edy.56.1613759048329;
        Fri, 19 Feb 2021 10:24:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613759048; cv=none;
        d=google.com; s=arc-20160816;
        b=IaVyDH9i5MTN1r/k1O9ieMLwWkOWcJeLYSp0F+uYUHOXgaAbpiGYXknr4i3l3e9dWd
         1KnCFEeqKus1ZEPGiQYybVtjk93ZN9pnge38GNWMJRbW0TM9Ua09JFnR+5yyLVkXN/Q0
         DC3JOZuF4KuCHsQ08A7MATQITJPPpzrhXDPyTzTeY7T6Txzukg6S6E34LLqAgOnuDBUS
         oh7/J/coY0tjHFR+8uLWB8pY0Iwb5NTZ9pqdnYhde4E3F8Ho+IFtrNnIoAN3Y3z9NTtA
         Oh8DQfD0hgKKL4bA3lhoy6WPuEviTXXV4WKeF9i8Zinhi9k2BmIBqtKN6Eymz4dFpLkP
         SvRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=d2uFgV2BmmAQeV0YgKzt3/vyJSjl0E7vZmtWpAFx1Rg=;
        b=rmxR0KRm+Z7Cw/WzsIv0SE8RkI+LNr6MTDEjUhM4PCCYrcZwEIEOqJ/0RNWvEirYWo
         PnaXjCLUKYnLVtsJi+fug+I/+YGxzisv3VT9fiwDw1oOOPUQEPWlgKO0/GFyW5HhSwUO
         Hdkw1kVdd4Y+XIPzGeQS+1Z67AvjF2/z1geWyl90VrlslkTs1161Eh8EAlC/aUue7JI9
         xPHpr+evQih3AXkez+xr3F5TvBInlHwEP+1dkVWzXFGsMt6b16tIIss/+dDi1Ck8NFRK
         cFYu7mkQHncopOC5p2OUzZ+wn2UwlElZkVi+ukKZvGicOCSbFtwkDEIbEbBj1qIfjZIP
         0awA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="XEf0EM/n";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id e8si6291951ejt.591.2021.02.19.10.24.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Feb 2021 10:24:08 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="XEf0EM/n";
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1613759047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d2uFgV2BmmAQeV0YgKzt3/vyJSjl0E7vZmtWpAFx1Rg=;
	b=XEf0EM/nvm5yHqt53Ex8HQgJqlsayIZIj5veDYiee7rp6KrAiT6BAMZIqjPONgDRFajHNz
	3V7KtGxglYW7jyydSosvSygI7L2QbFwYPP7ht5mW92LR875nJhleGZqBSoapvPMCTHVfFb
	pUlhmZGYerljH+zMoeS99SvstVOSYC8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-l74In0tDPyuoEfqosdSkZg-1; Fri, 19 Feb 2021 13:24:04 -0500
X-MC-Unique: l74In0tDPyuoEfqosdSkZg-1
Received: by mail-wm1-f71.google.com with SMTP id b62so2837434wmc.5
        for <alex.bennee@linaro.org>; Fri, 19 Feb 2021 10:24:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d2uFgV2BmmAQeV0YgKzt3/vyJSjl0E7vZmtWpAFx1Rg=;
        b=HlnS5A82xi+My8hz12PyXdiVP6K/F04ZB0Mo6y9QaI8Uxm1W2nwmSbikL40c9ZQl3X
         ewR7hGin9eCARAfjvU1yZJcgS97UDd3D4kHMGqaQUM1ahQnE8vgxC2Zni30CZ+YDVLCS
         HHfd5Lgyorl2TWAr/L/uSP6Ne9TcC75eSYBWqYnw71CMDH3+Lc5W1axTvnZD8eCZZMmZ
         OkumQyKlpxs2yXhlHApyB3VVBKIVS/y4u8dQLqiaZ6tVfH89LGuC5jsbg0kWeCX3Of7Q
         uhOmtIlLBJJsNgt7AhEge0QWmBArFJ34RWPNIfC5/X9ERMeEbyiwvnovUNDqhVxqSBRu
         XaTA==
X-Gm-Message-State: AOAM531O0CbzOMj4bbNwaFXS/hx2sY7VqbpbWwu/4M0pHCDw6djjg9dX
	NwKZJ48M8massSpqYUpa/8TvhS0FfyX7pP8tELITiqvSaF3OjsdkRkCCxdvdAQh68FZu5a/AGFq
	/MVwtwHvuHb0IVtWb
X-Received: by 2002:a7b:c353:: with SMTP id l19mr9506582wmj.147.1613759043326;
        Fri, 19 Feb 2021 10:24:03 -0800 (PST)
X-Received: by 2002:a7b:c353:: with SMTP id l19mr9506558wmj.147.1613759042878;
        Fri, 19 Feb 2021 10:24:02 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net. [83.57.175.68])
        by smtp.gmail.com with ESMTPSA id t30sm15359550wra.56.2021.02.19.10.24.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Feb 2021 10:24:02 -0800 (PST)
Subject: Re: [PATCH 0/2] Allwinner H3 fixes for EMAC and acceptance tests
To: Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, peter.maydell@linaro.org,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, f4bug@amsat.org, b.galvani@gmail.com,
 qemu-arm@nongnu.org, Pavel.Dovgaluk@ispras.ru, crosa@redhat.com,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>
References: <20210211220055.19047-1-nieklinnenbank@gmail.com>
 <e2b0052c-7dd3-36a2-64b7-3d56c23d0a2d@redhat.com>
 <YCuVC4T+TFjuskhF@redhat.com>
 <CAPan3Wo+c+4F82cM+UDQu+JH9eQdqL2gjnikXmg3PZKTXCP_jg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <cc5f65a8-204b-17ad-3bba-61a3919ef798@redhat.com>
Date: Fri, 19 Feb 2021 19:24:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAPan3Wo+c+4F82cM+UDQu+JH9eQdqL2gjnikXmg3PZKTXCP_jg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: gCgpk4FPKW37

Hi Niek,

On 2/17/21 9:57 PM, Niek Linnenbank wrote:
> Hi Daniel, Philippe,
> 
> Op di 16 feb. 2021 10:49 schreef Daniel P. Berrangé <berrange@redhat.com
> <mailto:berrange@redhat.com>>:
> 
>     On Fri, Feb 12, 2021 at 03:10:00PM +0100, Philippe Mathieu-Daudé wrote:
>     > Hi Niek and QEMU community,
>     >
>     > On 2/11/21 11:00 PM, Niek Linnenbank wrote:
>     > > The following are maintenance patches for the Allwinner H3. The
>     first patch
>     > > is a proposal to relocate the binary artifacts of the acceptance
>     tests away
>     > > from the apt.armbian.com <http://apt.armbian.com> domain. In the
>     past we had problems with artifacts being
>     > > removed, and now the recently added Armbian 20.08.1 image has
>     been removed as well:
>     > >
>     > > $ wget
>     https://dl.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz
>     <https://dl.armbian.com/orangepipc/archive/Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz>
>     > > Connecting to dl.armbian.com <http://dl.armbian.com>
>     (dl.armbian.com <http://dl.armbian.com>)|2605:7900:20::5|:443...
>     connected.
>     > > ...
>     > > HTTP request sent, awaiting response... 404 Not Found
>     > > 2021-02-11 22:34:45 ERROR 404: Not Found.
>     > >
>     > > I've now added the artifacts to a server maintained by me. The
>     machine has a stable
>     > > uptime of several years, ~100Mbit bandwidth and plenty of
>     available storage.
>     > > Also for other artifacts if needed. I'm open to discuss if there
>     is a proposal
>     > > for a better location for these artifacts or a more generic qemu
>     location.
>     >
>     > Thanks for trying to fix this long standing problem.
>     >
>     > While this works in your case, this doesn't scale to the community,
>     > as not all contributors have access to such hardware and bandwidth /
>     > storage.
>     >
>     > While your first patch is useful in showing where the artifacts are
>     > stored doesn't matter - as long as we use cryptographic hashes - I
>     > think it is a step in the wrong direction, so I am not keen on
>     > accepting it.
>     >
>     > My personal view is that any contributor should have the same
>     > possibilities to add tests to the project. Now I am also open to
>     > discuss with the others :) I might be proven wrong, and it could
>     > be better to rely on good willing contributors rather than having
>     > nothing useful at all.
> 
>     There aren't many options here
> 
>      1. Rely on a vendor to provide stable download URLs for images
> 
>      2. QEMU host all images we use in testing
> 
>      3. Contributor finds some site to upload images to
> 
> 
>     For the armbian images we rely on (1), but the URLs didn't turn out
>     to be
>     stable. In fact no OS vendor seems to have guaranteed stable URLs
>     forever,
>     regardless of distro, though most eventually do have an archive site
>     that
>     has good life. Armbian was an exception in this respect IIUC.
> 
>     (2) would solve the long term stability problem as QEMU would be in full
>     control, and could open it up for any images we need. The big challenge
>     there is that QEMU now owns the license compliance problem. Merely
>     uploading
>     binary images/packages without the corresponding source is generally
>     a license
>     violation. QEMU could provide hosting, but we need to be clear about
>     the fact
>     that we now own the license compliance problem ourselves. Many sites
>     hosting
>     images simply ignore this problem, but that doesn't make it right.
> 
> 
>     This series is proposing (3), with a site the contributor happens to
>     control
>     themselves, but using a free 3rd party hosting site is no different
>     really.
>     Again there is a the same need for license compliance, but it is now the
>     responsibility of the user, not QEMU project.
> 
>     In this http://www.freenos.org/pub/qemu/cubieboard/
>     <http://www.freenos.org/pub/qemu/cubieboard/> site I can't even see a
>     directory listing, so even if corresponding source does exist in
>     this server,
>     I can't find it.
> 
>     The isn't really a problem for QEMU CI to consume the images, but as
>     a free
>     software developer I don't like encouraging practices that are not
>     compliant
>     with licensing reuqirement.
> 
>     It is an open question whether the (3) is really better than (1) in
>     terms
>     of URL stability long term, especially if running off a user's personal
>     server.
> 
> 
> I understand your concerns. My goal here was to be able to re-activate
> the orangepi tests, so we can capture bugs early on.

I hope you understand the concern I have is not with you in particular,
and I used your case to start a discussion with the QEMU community.

FWIW I missed the URL change because I still have the image cached in
Avocado so my testing ran fine. Which makes me wonder...

Cleber, Willian, should Avocado display information about cached
artifacts? Such "Using artifact downloaded 7 months ago".

> So what I can do
> instead is:
> 
>   - update the patch to use github to store the artifacts, and their
> licenses (other tests also use github)

Until there is better solutions, this is the option I prefer.

>   - or change the patch to use updated armbian links that work (for now)
> 
> If we can agree on either of these solutions, so the orangepi tests can
> be re-activated, that would be great. 
> 
> Kind regards,
> Niek
