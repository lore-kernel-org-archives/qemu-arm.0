Received: by 10.182.105.169 with SMTP id gn9csp1622223obb;
        Tue, 27 Oct 2015 04:17:07 -0700 (PDT)
X-Received: by 10.31.12.10 with SMTP id 10mr24788426vkm.35.1445944627295;
        Tue, 27 Oct 2015 04:17:07 -0700 (PDT)
Return-Path: <peter.maydell@linaro.org>
Received: from mail-vk0-x230.google.com (mail-vk0-x230.google.com. [2607:f8b0:400c:c05::230])
        by mx.google.com with ESMTPS id t131si20610043vke.42.2015.10.27.04.17.07
        for <alex.bennee@linaro.org>
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2015 04:17:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::230 as permitted sender) client-ip=2607:f8b0:400c:c05::230;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2607:f8b0:400c:c05::230 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dkim=pass header.i=@linaro_org.20150623.gappssmtp.com
Received: by vkfw189 with SMTP id w189so117523823vkf.2
        for <alex.bennee@linaro.org>; Tue, 27 Oct 2015 04:17:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro_org.20150623.gappssmtp.com; s=20150623;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=6Zjzy7KdvOtJZgmmasBhIHCtDlw3hnrp/HVTUvoxCkI=;
        b=heHtJmN/ekuXsy8VoVH0sEKaOkgNXpETyIti+9aExIrbwpJx8aHTFLR1vuHrLEddMA
         rqdqQvW9E39yBSj1V8M0/2Dj5XptdM2rJUvhYzYrg6N8tJHWV/klzx6c2PE96VDNjEXS
         WviBrp3PStlIJTJIw9E9aJnnwGLvWycwACeB3d+SDgXGuX06mmtP1QtN4j4NiAQIejZD
         TJGGnWLisbSfntqxFX/HHSAtxbMX7OqzzGdOdGeqdGTVoeXLiYFSgqvNzYpgjQ9mXmKw
         ZKjZGV24tg25DsBEui6pZRrIppy5zebCHqTIYKQfiEdjS+xAmstKLBi0W/lUV7TMeUoE
         VH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-type;
        bh=6Zjzy7KdvOtJZgmmasBhIHCtDlw3hnrp/HVTUvoxCkI=;
        b=SbnbuvLll4DvSrc6Z658Z3L3onczFNbfva8bQx7IM64cD5UCqlMYG748DjnMDwgVx0
         aVk2nT2cFCPgLSKqB7KKi8Zr+EyczgT3WeHSPddKphP6ihvX64rW8iBXJUf3caUrEB5K
         3GfOlSRKNA/m8eTsNCCnrIlpRqfypA5DFqXzFcqldziV2pW8xBWNjYJM6QFxEVtp37f7
         gt453eGGcRtLxUUh3SsfdHkJJT1EGAAO9CwQz6arVjLAIFYcEBqZqZKpdVVxJMVIatFt
         4MaPUB4S4oIMJvvYXqiPJh1aXa1RYnnR7nXRNrt4Rz8CeNubBsra25ZbpmhWOvnBXBE4
         g4YQ==
X-Gm-Message-State: ALoCoQlgSaHrHSNBs3UTD2xE94/EFFRG21i2ijfngY45+weNJ7O0VOecIo359aTghHkMXbOzdxpV
X-Received: by 10.31.8.69 with SMTP id 66mr6923000vki.82.1445944626973; Tue,
 27 Oct 2015 04:17:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Tue, 27 Oct 2015 04:16:47 -0700 (PDT)
In-Reply-To: <012d01d110a7$b1915690$14b403b0$@samsung.com>
References: <CAFEAcA-s_hSQiLCkQDeX2rR12PcPx5yZ885yZy7C=ZWA5DDbTw@mail.gmail.com>
 <012d01d110a7$b1915690$14b403b0$@samsung.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Oct 2015 11:16:47 +0000
Message-ID: <CAFEAcA9H6vegRYU+_0aULnH8dRcm70M28Eg7uzB8013sspG8Yg@mail.gmail.com>
Subject: Re: [Qemu-devel] proposal: new qemu-arm mailing list
To: Pavel Fedin <p.fedin@samsung.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Peter Crosthwaite <crosthwaitepeter@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-TUID: E/0152yGg7ln

On 27 October 2015 at 11:07, Pavel Fedin <p.fedin@samsung.com> wrote:
>> (Everything should still be cc'd to qemu-devel as well.)
>
>  I would drop this requirement, except for stuff which could touch
> core functionality (qom, qobject).

This is a standard requirement for all our sub-mailing lists --
not everybody is subscribed to all of them, and it is useful
to be able to get an overview of everything going on by
subscribing to a single mailing list.

thanks
-- PMM
